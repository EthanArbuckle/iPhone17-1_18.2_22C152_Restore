@interface CADFetchedObjectSerializer
- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4;
- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4 relatedObjectPropertiesToLoad:(id)a5;
- (ClientConnection)connection;
- (NSArray)defaultPropertiesToLoad;
- (NSArray)fetchedObjectWrappers;
- (NSDictionary)relatedObjectPropertiesToLoad;
- (NSMutableArray)wrappers;
- (NSMutableSet)seenObjectIDs;
- (id)_fetchedObjectDictionaryForEntity:(void *)a3;
- (id)_properties:(id)a3 forEntityIfNotSeen:(void *)a4 objectExists:(BOOL *)a5;
- (id)addEntity:(void *)a3;
@end

@implementation CADFetchedObjectSerializer

- (id)_properties:(id)a3 forEntityIfNotSeen:(void *)a4 objectExists:(BOOL *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (a5) {
    *a5 = 1;
  }
  if (![v8 count]) {
    goto LABEL_9;
  }
  uint64_t DatabaseForRecord = CalGetDatabaseForRecord();
  uint64_t Type = CalEntityGetType();
  uint64_t ID = CalEntityGetID();
  if ((int)Type <= 0)
  {
    v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v59 = ID;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = Type;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_INFO, "Can't fetch properties for entity with rowuint64_t ID = %d and unexpected entity type = %d.", buf, 0xEu);
    }
LABEL_9:
    id v16 = 0;
    goto LABEL_49;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:Type entityID:ID databaseID:CalDatabaseGetAuxilliaryDatabaseID()];
  v14 = [(CADFetchedObjectSerializer *)self seenObjectIDs];
  char v15 = [v14 containsObject:v13];

  if (v15)
  {
    id v16 = 0;
  }
  else
  {
    v18 = [(CADFetchedObjectSerializer *)self seenObjectIDs];
    v41 = v13;
    [v18 addObject:v13];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v42 = v9;
    obuint64_t j = v9;
    uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v55;
      v43 = a4;
      v44 = a5;
      v45 = v19;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          CFTypeRef cf = 0;
          int v22 = CalEntityCopyProperty(self->_connection, (uint64_t)a4, v21, &cf);
          if (v22)
          {
            int v23 = v22;
            if (CalEntityIsDeleted())
            {
              if (a5) {
                *a5 = 0;
              }

              id v16 = 0;
              goto LABEL_47;
            }
            v24 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)v59 = v21;
              *(_WORD *)&v59[8] = 1024;
              int v60 = v23;
              _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_ERROR, "Unable to fetch property with name %{public}@, %d", buf, 0x12u);
            }
            v25 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v25];
          }
          else
          {
            if (!cf) {
              goto LABEL_38;
            }
            CFTypeID v26 = CFGetTypeID(cf);
            if (v26 == CPRecordGetTypeID())
            {
              v27 = [(CADFetchedObjectSerializer *)self _fetchedObjectDictionaryForEntity:cf];
              CFRelease(cf);
              CFTypeRef cf = v27;
            }
            else
            {
              CFTypeID v28 = CFGetTypeID(cf);
              if (v28 == CFSetGetTypeID())
              {
                id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
                v30 = (void *)[v29 initWithCapacity:CFSetGetCount((CFSetRef)cf)];
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                v31 = (id)cf;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v34 = *(void *)v50;
                  do
                  {
                    for (uint64_t j = 0; j != v33; ++j)
                    {
                      if (*(void *)v50 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      v36 = CADCopyEntityInDatabase(DatabaseForRecord, *(void **)(*((void *)&v49 + 1) + 8 * j));
                      if (v36)
                      {
                        v37 = v36;
                        v38 = [(CADFetchedObjectSerializer *)self _fetchedObjectDictionaryForEntity:v36];
                        CFRelease(v37);
                        if (v38) {
                          [v30 addObject:v38];
                        }
                      }
                    }
                    uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
                  }
                  while (v33);
                }

                CFRelease(cf);
                CFTypeRef cf = v30;
                a4 = v43;
                a5 = v44;
              }
            }
            v19 = v45;
            if (cf)
            {
              CFTypeRef v39 = (id)cf;
            }
            else
            {
LABEL_38:
              CFTypeRef v39 = [MEMORY[0x1E4F1CA98] null];
            }
            v25 = (void *)v39;
            [v19 addObject:v39];
            if (cf) {
              CFRelease(cf);
            }
          }
        }
        uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }

    id v16 = v19;
LABEL_47:
    v13 = v41;
    v9 = v42;
  }
LABEL_49:

  return v16;
}

- (NSMutableSet)seenObjectIDs
{
  return self->_seenObjectIDs;
}

- (id)_fetchedObjectDictionaryForEntity:(void *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t Type = CalEntityGetType();
  uint64_t ID = CalEntityGetID();
  if ((int)Type <= 0)
  {
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v21 = ID;
      __int16 v22 = 1024;
      int v23 = Type;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_INFO, "Can't fetch object dictionary for related entity with rowuint64_t ID = %d and unexpected entity type = %d.", buf, 0xEu);
    }
    v14 = 0;
  }
  else
  {
    v7 = [(CADFetchedObjectSerializer *)self relatedObjectPropertiesToLoad];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:Type];
    v9 = [v7 objectForKeyedSubscript:v8];

    char v19 = 0;
    uint64_t v10 = [(CADFetchedObjectSerializer *)self _properties:v9 forEntityIfNotSeen:a3 objectExists:&v19];
    v11 = (void *)v10;
    if (v19)
    {
      if (v10)
      {
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9];
      }
      else
      {
        v12 = 0;
      }
      id v16 = CADEntityCopyObjectID();
      if ([v16 isVirtual])
      {
        AuxilliaryDatabaseuint64_t ID = 0;
      }
      else
      {
        CalGetDatabaseForRecord();
        AuxilliaryDatabaseuint64_t ID = CalDatabaseGetAuxilliaryDatabaseID();
      }
      v14 = CalFetchedObjectDictionary(Type, ID, AuxilliaryDatabaseID, v12);
    }
    else
    {
      char v15 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v21 = ID;
        _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_INFO, "Can't fetch object dictionary for related entity with rowuint64_t ID = %d because it appears to be deleted", buf, 8u);
      }
      v14 = 0;
    }
  }
  return v14;
}

- (NSDictionary)relatedObjectPropertiesToLoad
{
  return self->_relatedObjectPropertiesToLoad;
}

- (NSArray)fetchedObjectWrappers
{
  v2 = [(CADFetchedObjectSerializer *)self wrappers];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)addEntity:(void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  CFTypeID v5 = CFGetTypeID(a3);
  Typeuint64_t ID = CalEventOccurrenceGetTypeID();
  if (v5 == TypeID)
  {
    v7 = 0;
LABEL_5:
    uint64_t Event = CalEventOccurrenceGetEvent();
    CalEventOccurrenceGetDate();
    double v10 = v9;
    LOBYTE(v25) = 0;
    v11 = [(CADFetchedObjectSerializer *)self defaultPropertiesToLoad];
    v12 = [(CADFetchedObjectSerializer *)self _properties:v11 forEntityIfNotSeen:Event objectExists:&v25];

    if ((_BYTE)v25) {
      v13 = [[CADEventEntityWrapper alloc] initWithCalEntity:Event loadedValues:v12 occurrenceDate:v10];
    }
    else {
      v13 = 0;
    }
    if (v5 != TypeID) {
      CFRelease(v7);
    }

    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (CalEntityGetType() == 2)
  {
    v7 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
    if (v7) {
      goto LABEL_5;
    }
  }
  LOBYTE(v25) = 0;
  v14 = [(CADFetchedObjectSerializer *)self defaultPropertiesToLoad];
  char v15 = [(CADFetchedObjectSerializer *)self _properties:v14 forEntityIfNotSeen:a3 objectExists:&v25];

  if ((_BYTE)v25) {
    v13 = [[CADEntityWrapper alloc] initWithCalEntity:a3 loadedValues:v15];
  }
  else {
    v13 = 0;
  }

  if (!v13) {
    goto LABEL_17;
  }
LABEL_16:
  if (CalEntityIsDeleted())
  {
LABEL_17:
    id v16 = 0;
    goto LABEL_18;
  }
  v18 = [(CADEntityWrapper *)v13 objectID];
  int v19 = [v18 entityType];

  if ((v19 + 1) <= 1)
  {
    v20 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v21 = v20;
      __int16 v22 = [(CADEntityWrapper *)v13 objectID];
      int v23 = [v22 entityID];
      LODWORD(v25) = 67109376;
      HIDWORD(v25) = v23;
      __int16 v26 = 1024;
      int v27 = v19;
      _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Entity with rowuint64_t ID = %d has unexpected entity type = %d. Filtering out of search results.", (uint8_t *)&v25, 0xEu);
    }
    goto LABEL_17;
  }
  uint64_t v24 = [(CADFetchedObjectSerializer *)self wrappers];
  [v24 addObject:v13];

  id v16 = v13;
LABEL_18:

  return v16;
}

- (NSMutableArray)wrappers
{
  return self->_wrappers;
}

- (NSArray)defaultPropertiesToLoad
{
  return self->_defaultPropertiesToLoad;
}

- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4 relatedObjectPropertiesToLoad:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CADFetchedObjectSerializer;
  v12 = [(CADFetchedObjectSerializer *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    uint64_t v14 = [v10 copy];
    defaultPropertiesToLoad = v13->_defaultPropertiesToLoad;
    v13->_defaultPropertiesToLoad = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    relatedObjectPropertiesToLoad = v13->_relatedObjectPropertiesToLoad;
    v13->_relatedObjectPropertiesToLoad = (NSDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    wrappers = v13->_wrappers;
    v13->_wrappers = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    seenObjectIDs = v13->_seenObjectIDs;
    v13->_seenObjectIDs = (NSMutableSet *)v20;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenObjectIDs, 0);
  objc_storeStrong((id *)&self->_wrappers, 0);
  objc_storeStrong((id *)&self->_relatedObjectPropertiesToLoad, 0);
  objc_storeStrong((id *)&self->_defaultPropertiesToLoad, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (CADFetchedObjectSerializer)initWithConnection:(id)a3 defaultPropertiesToLoad:(id)a4
{
  return [(CADFetchedObjectSerializer *)self initWithConnection:a3 defaultPropertiesToLoad:a4 relatedObjectPropertiesToLoad:0];
}

- (ClientConnection)connection
{
  return self->_connection;
}

@end