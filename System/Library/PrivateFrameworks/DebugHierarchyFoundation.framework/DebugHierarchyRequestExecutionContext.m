@interface DebugHierarchyRequestExecutionContext
+ (id)contextWithRequest:(id)a3;
- (BOOL)hasAlreadyFetchedDebugHierarchyObject:(id)a3;
- (DebugHierarchyRequest)request;
- (DebugHierarchyRequestExecutionContext)initWithRequest:(id)a3;
- (DebugHierarchyRuntimeInfo)contextRuntimeInfo;
- (NSMutableDictionary)identifierToObjectDescriptionMap;
- (NSMutableDictionary)metaData;
- (NSMutableDictionary)topLevelGroups;
- (NSMutableDictionary)topLevelPropertyDescriptions;
- (id)globalRuntimeInfo;
- (id)recursiveDescription;
- (id)requestResponse;
- (id)runtimeTypeWithName:(id)a3;
- (void)_addDebugHierarchyObject:(id)a3 withDict:(id)a4 toTopLevelGroupWithID:(id)a5;
- (void)_addDebugHierarchyObjectDict:(id)a3 toGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6;
- (void)_collectRuntimeInformationForObjectType:(id)a3;
- (void)addDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 fetchStatus:(int64_t)a5 toGroupWithID:(id)a6 asDirectChild:(BOOL)a7 belowParent:(id)a8;
- (void)addProperties:(id)a3 toObject:(id)a4;
- (void)addReferencedDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 toGroupWithID:(id)a5 asDirectChild:(BOOL)a6 belowParent:(id)a7;
- (void)logRequestErrorWithTitle:(id)a3 message:(id)a4 fromMethod:(const char *)a5;
- (void)setContextRuntimeInfo:(id)a3;
- (void)setIdentifierToObjectDescriptionMap:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setRequest:(id)a3;
- (void)setTopLevelGroups:(id)a3;
- (void)setTopLevelPropertyDescriptions:(id)a3;
@end

@implementation DebugHierarchyRequestExecutionContext

+ (id)contextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithRequest:v4];

  return v5;
}

- (DebugHierarchyRequestExecutionContext)initWithRequest:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DebugHierarchyRequestExecutionContext;
  v6 = [(DebugHierarchyRequestExecutionContext *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = +[NSMutableDictionary dictionary];
    topLevelGroups = v7->_topLevelGroups;
    v7->_topLevelGroups = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    topLevelPropertyDescriptions = v7->_topLevelPropertyDescriptions;
    v7->_topLevelPropertyDescriptions = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    identifierToObjectDescriptionMap = v7->_identifierToObjectDescriptionMap;
    v7->_identifierToObjectDescriptionMap = (NSMutableDictionary *)v12;

    v14 = objc_alloc_init(DebugHierarchyRuntimeInfo);
    contextRuntimeInfo = v7->_contextRuntimeInfo;
    v7->_contextRuntimeInfo = v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    metaData = v7->_metaData;
    v7->_metaData = (NSMutableDictionary *)v16;
  }
  return v7;
}

- (BOOL)hasAlreadyFetchedDebugHierarchyObject:(id)a3
{
  if (a3) {
    id v4 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", a3);
  }
  else {
    id v4 = 0;
  }
  id v5 = [(DebugHierarchyRequestExecutionContext *)self identifierToObjectDescriptionMap];
  v6 = [v5 objectForKeyedSubscript:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)addDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 fetchStatus:(int64_t)a5 toGroupWithID:(id)a6 asDirectChild:(BOOL)a7 belowParent:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  if (v14)
  {
    BOOL v25 = a7;
    v17 = (void *)CFStringCreateWithFormat(0, 0, @"%p", v14);
    v18 = (objc_class *)objc_opt_class();
    objc_super v19 = NSStringFromClass(v18);
    [(DebugHierarchyRequestExecutionContext *)self _collectRuntimeInformationForObjectType:v14];
    v26[0] = @"objectID";
    v26[1] = @"className";
    v27[0] = v17;
    v27[1] = v19;
    v26[2] = @"fetchStatus";
    v20 = +[NSNumber numberWithLong:a5];
    v27[2] = v20;
    v26[3] = @"visibility";
    v21 = +[NSNumber numberWithLong:a4];
    v27[3] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

    id v23 = [v22 mutableCopy];
    if (v16)
    {
      if (v25)
      {
        [(DebugHierarchyRequestExecutionContext *)self _addDebugHierarchyObjectDict:v23 toGroupWithID:v15 asDirectChild:1 belowParent:v16];
      }
      else
      {
        [(DebugHierarchyRequestExecutionContext *)self _addDebugHierarchyObject:v14 withDict:v23 toTopLevelGroupWithID:v15];
        [(DebugHierarchyRequestExecutionContext *)self addReferencedDebugHierarchyObject:v14 withVisibility:a4 toGroupWithID:v15 asDirectChild:0 belowParent:v16];
      }
    }
    else
    {
      [(DebugHierarchyRequestExecutionContext *)self _addDebugHierarchyObject:v14 withDict:v23 toTopLevelGroupWithID:v15];
    }
    v24 = [(DebugHierarchyRequestExecutionContext *)self identifierToObjectDescriptionMap];
    [v24 setObject:v23 forKeyedSubscript:v17];
  }
  else
  {
    v17 = +[NSString stringWithFormat:@"DebugHierarchyObject must not be nil. Will be ignored."];
    -[DebugHierarchyRequestExecutionContext logRequestErrorWithTitle:message:fromMethod:](self, "logRequestErrorWithTitle:message:fromMethod:", @"Unexpected nil object.", v17, "-[DebugHierarchyRequestExecutionContext addDebugHierarchyObject:withVisibility:fetchStatus:toGroupWithID:asDirectChild:belowParent:]");
  }
}

- (void)addReferencedDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 toGroupWithID:(id)a5 asDirectChild:(BOOL)a6 belowParent:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  if (a3) {
    a3 = (id)CFStringCreateWithFormat(0, 0, @"%p", a3);
  }
  v17[0] = a3;
  v16[0] = @"objectID";
  v16[1] = @"propertyVisibility";
  id v14 = +[NSNumber numberWithLong:a4];
  v16[2] = @"propertyLogicalType";
  v17[1] = v14;
  v17[2] = @"DebugHierarchyLogicalPropertyTypePointer";
  id v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  [(DebugHierarchyRequestExecutionContext *)self _addDebugHierarchyObjectDict:v15 toGroupWithID:v12 asDirectChild:v8 belowParent:v13];
}

- (void)_addDebugHierarchyObject:(id)a3 withDict:(id)a4 toTopLevelGroupWithID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(DebugHierarchyRequestExecutionContext *)self topLevelGroups];
  id v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"debugHierarchyObjects"];
    [v13 addObject:v9];
    id v14 = (objc_class *)objc_opt_class();
    id v15 = v14;
    if (v14)
    {
      if (object_isClass(v14))
      {
        NSStringFromClass(v15);
        id v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = 0;
      }
    }
    v18 = [(DebugHierarchyRequestExecutionContext *)self runtimeTypeWithName:v15];

    objc_super v19 = [v18 closestTypeVendingAChildGroupingID];
    v20 = [v19 childGroupingID];
    id v21 = [v20 length];

    if (v21)
    {
      v22 = [v19 name];
      Class v23 = NSClassFromString(v22);

      v24 = [v19 childGroupingID];
      uint64_t v58 = 0;
      id v21 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v24 outOptions:&v58 vendingClass:v23 onObject:v8];
    }
    if ([v21 count])
    {
      id v48 = v12;
      id v49 = v8;
      v50 = v10;
      v57 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v21 count]);
      id v56 = v21;
      if ([v21 count])
      {
        BOOL v25 = v21;
        unint64_t v26 = 0;
        do
        {
          v27 = [v25 objectAtIndexedSubscript:v26];
          v28 = +[NSNumber numberWithInt:v26];
          if (v27) {
            v29 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v27);
          }
          else {
            v29 = 0;
          }
          [v57 setObject:v28 forKeyedSubscript:v29];

          ++v26;
          BOOL v25 = v21;
        }
        while ((unint64_t)[v21 count] > v26);
      }
      v47 = v18;
      v54 = +[NSMutableIndexSet indexSet];
      if ([v13 count])
      {
        unint64_t v30 = 0;
        v52 = v19;
        id v53 = v9;
        v51 = v13;
        do
        {
          v31 = [v13 objectAtIndexedSubscript:v30];
          v32 = [v31 objectForKeyedSubscript:@"objectID"];
          v33 = [v57 objectForKeyedSubscript:v32];
          v34 = v33;
          if (v33)
          {
            id v35 = [v33 unsignedIntegerValue];
            v36 = [v9 objectForKeyedSubscript:@"childGroup"];
            if (v36)
            {
              v37 = v36;
              v55 = v32;
              v38 = [v36 objectForKeyedSubscript:@"debugHierarchyObjects"];
              if ([v38 count])
              {
                unint64_t v39 = 0;
                while (1)
                {
                  v40 = [v38 objectAtIndexedSubscript:v39];
                  v41 = [v40 objectForKeyedSubscript:@"objectID"];
                  v42 = [v57 objectForKeyedSubscript:v41];

                  id v43 = [v42 unsignedIntegerValue];
                  if (v43 > v35) {
                    break;
                  }
                  if ((unint64_t)[v38 count] <= ++v39) {
                    goto LABEL_24;
                  }
                }
                id v45 = [v38 count];
                if (v39 >= (unint64_t)v45) {
                  id v46 = v45;
                }
                else {
                  id v46 = (id)v39;
                }
                [v38 insertObject:v31 atIndex:v46];
              }
              else
              {
LABEL_24:
                [v38 addObject:v31];
              }
              id v13 = v51;
              v32 = v55;

              objc_super v19 = v52;
              id v9 = v53;
            }
            else
            {
              v44 = +[NSMutableArray arrayWithObject:v31];
              v37 = DBGGroupDict(v50, v44);

              [v9 setObject:v37 forKeyedSubscript:@"childGroup"];
            }
            [v54 addIndex:v30];
          }
          ++v30;
        }
        while ((unint64_t)[v13 count] > v30);
      }
      [v13 removeObjectsAtIndexes:v54];

      id v8 = v49;
      id v10 = v50;
      v18 = v47;
      id v12 = v48;
      id v21 = v56;
    }
  }
  else
  {
    id v13 = +[NSMutableArray arrayWithObject:v9];
    id v16 = DBGGroupDict(v10, v13);
    id v12 = [v16 mutableCopy];

    v17 = [(DebugHierarchyRequestExecutionContext *)self topLevelGroups];
    [v17 setObject:v12 forKeyedSubscript:v10];
  }
}

- (void)_addDebugHierarchyObjectDict:(id)a3 toGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v12) {
    id v14 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v12);
  }
  else {
    id v14 = 0;
  }
  id v15 = [(DebugHierarchyRequestExecutionContext *)self identifierToObjectDescriptionMap];
  id v16 = [v15 objectForKeyedSubscript:v14];

  if (v16)
  {
    if (v7)
    {
      id v17 = [v16 objectForKeyedSubscript:@"childGroup"];
      id v18 = [v17 objectForKeyedSubscript:@"debugHierarchyObjects"];
      if (!v17)
      {
        v32 = +[NSMutableArray arrayWithObject:v10];

        DBGGroupDict(v11, v32);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        [v16 setObject:v17 forKeyedSubscript:@"childGroup"];
        id v18 = v32;
LABEL_48:

        goto LABEL_49;
      }
      objc_super v19 = (objc_class *)objc_opt_class();
      v20 = v19;
      if (v19)
      {
        if (object_isClass(v19))
        {
          NSStringFromClass(v20);
          v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
      }
      v31 = [(DebugHierarchyRequestExecutionContext *)self runtimeTypeWithName:v20];

      v33 = [v31 closestTypeVendingAChildGroupingID];
      v34 = [v33 childGroupingID];
      v52 = v34;
      if ([v34 length])
      {
        id v49 = v33;
        v50 = v31;
        v54 = v16;
        id v56 = v14;
        id v35 = [v33 name];
        Class v36 = NSClassFromString(v35);

        id v61 = 0;
        v37 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v34 outOptions:&v61 vendingClass:v36 onObject:v13];
        id v38 = v61;
        unint64_t v39 = [v10 objectForKeyedSubscript:@"objectID"];
        if ([v37 count])
        {
          id v47 = v38;
          id v48 = v17;
          unint64_t v40 = 0;
          while (1)
          {
            uint64_t v41 = [v37 objectAtIndexedSubscript:v40];
            v42 = (void *)v41;
            id v43 = v41 ? (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v41) : 0;
            unsigned int v44 = [(__CFString *)v43 isEqualToString:v39];

            if (v44) {
              break;
            }
            if ((unint64_t)[v37 count] <= ++v40)
            {
              unint64_t v40 = 0;
              break;
            }
          }
          id v17 = v48;
          id v38 = v47;
        }
        else
        {
          unint64_t v40 = 0;
        }

        id v16 = v54;
        id v14 = v56;
        v33 = v49;
        v31 = v50;
      }
      else
      {
        unint64_t v40 = 0;
      }
      id v45 = [v18 count];
      if (v40 >= (unint64_t)v45) {
        id v46 = v45;
      }
      else {
        id v46 = (id)v40;
      }
      [v18 insertObject:v10 atIndex:v46];

LABEL_47:
      goto LABEL_48;
    }
    v22 = [v16 objectForKeyedSubscript:@"additionalGroups"];
    Class v23 = &NSLocalizedDescriptionKey_ptr;
    if (v22)
    {
      id v53 = v16;
      v55 = v14;
      id v51 = v10;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v17 = v22;
      id v24 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v58;
LABEL_14:
        uint64_t v27 = 0;
        while (1)
        {
          if (*(void *)v58 != v26) {
            objc_enumerationMutation(v17);
          }
          v28 = *(void **)(*((void *)&v57 + 1) + 8 * v27);
          v29 = [v28 objectForKeyedSubscript:@"groupingID"];
          unsigned __int8 v30 = [v29 isEqualToString:v11];

          if (v30) {
            break;
          }
          if (v25 == (id)++v27)
          {
            id v25 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
            if (v25) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        id v18 = v28;

        if (!v18) {
          goto LABEL_23;
        }
        v31 = [v18 objectForKeyedSubscript:@"debugHierarchyObjects"];
        id v10 = v51;
        [v31 addObject:v51];
        id v16 = v53;
        id v14 = v55;
        goto LABEL_27;
      }
LABEL_20:

LABEL_23:
      id v10 = v51;
      id v16 = v53;
      id v14 = v55;
      Class v23 = &NSLocalizedDescriptionKey_ptr;
    }
    else
    {
      id v17 = +[NSMutableArray array];
      [v16 setObject:v17 forKeyedSubscript:@"additionalGroups"];
    }
    v31 = [(NSErrorUserInfoKey *)(id)v23[32] arrayWithObject:v10];
    DBGGroupDict(v11, v31);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    if (([v17 containsObject:v18] & 1) == 0) {
      [v17 addObject:v18];
    }
    goto LABEL_47;
  }
  id v21 = +[NSString stringWithFormat:@"Unable to find parent object in identifierToObjectDescriptionMap. DebugHierarchyObject dictionary will be ignored: %@ | Parent Object: %@", v10, v13];
  -[DebugHierarchyRequestExecutionContext logRequestErrorWithTitle:message:fromMethod:](self, "logRequestErrorWithTitle:message:fromMethod:", @"Unable to find DebugHierarchyObject.", v21, "-[DebugHierarchyRequestExecutionContext _addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:]");

LABEL_49:
}

- (void)addProperties:(id)a3 toObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (v7) {
      id v8 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v7);
    }
    else {
      id v8 = 0;
    }
    id v9 = [(DebugHierarchyRequestExecutionContext *)self identifierToObjectDescriptionMap];
    id v10 = [v9 objectForKeyedSubscript:v8];

    if (v10)
    {
      id v11 = [v10 objectForKeyedSubscript:@"properties"];
      if ([v11 count])
      {
        id v12 = [v11 arrayByAddingObjectsFromArray:v6];
      }
      else
      {
        id v12 = v6;
      }
      v22 = v12;

      [v10 setObject:v22 forKeyedSubscript:@"properties"];
    }
    else
    {
      id v23 = v7;
      id v13 = v8;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v24 = v6;
      id obj = v6;
      id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            objc_super v19 = [v18 objectForKeyedSubscript:@"propertyName"];
            v20 = +[NSString stringWithFormat:@"%@.%@", v13, v19];

            id v21 = [(DebugHierarchyRequestExecutionContext *)self topLevelPropertyDescriptions];
            [v21 setObject:v18 forKeyedSubscript:v20];
          }
          id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }

      id v7 = v23;
      id v6 = v24;
      id v8 = v13;
      id v10 = 0;
    }
  }
}

- (void)logRequestErrorWithTitle:(id)a3 message:(id)a4 fromMethod:(const char *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSString stringWithCString:a5 encoding:4];
  id v12 = +[DebugHierarchyLogEntry errorLogEntryWithTitle:v9 message:v8 methodSignature:v10];

  id v11 = [(DebugHierarchyRequestExecutionContext *)self request];
  [v11 addLogEntry:v12];
}

- (id)requestResponse
{
  v13[0] = @"version";
  v3 = +[NSNumber numberWithDouble:2.0];
  v14[0] = v3;
  v13[1] = @"request";
  id v4 = [(DebugHierarchyRequestExecutionContext *)self request];
  id v5 = [v4 dictionaryRepresentation];
  v14[1] = v5;
  v13[2] = @"metaData";
  id v6 = [(DebugHierarchyRequestExecutionContext *)self metaData];
  v14[2] = v6;
  v13[3] = @"classInformation";
  id v7 = [(DebugHierarchyRequestExecutionContext *)self contextRuntimeInfo];
  id v8 = [v7 serializedRepresentation];
  v14[3] = v8;
  v13[4] = @"topLevelGroups";
  id v9 = [(DebugHierarchyRequestExecutionContext *)self topLevelGroups];
  v14[4] = v9;
  v13[5] = @"topLevelPropertyDescriptions";
  id v10 = [(DebugHierarchyRequestExecutionContext *)self topLevelPropertyDescriptions];
  v14[5] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (id)recursiveDescription
{
  id v6 = @"topLevelGroups";
  v2 = [(DebugHierarchyRequestExecutionContext *)self topLevelGroups];
  id v7 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [v3 generateJSONStringWithError:0];

  return v4;
}

- (id)globalRuntimeInfo
{
  v2 = +[DebugHierarchyTargetHub sharedHub];
  v3 = [v2 runtimeInfo];

  return v3;
}

- (id)runtimeTypeWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRequestExecutionContext *)self contextRuntimeInfo];
  id v6 = [v5 typeWithName:v4];

  if (!v6)
  {
    id v7 = [(DebugHierarchyRequestExecutionContext *)self globalRuntimeInfo];
    id v6 = [v7 typeWithName:v4];
  }
  return v6;
}

- (void)_collectRuntimeInformationForObjectType:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  if (v5 && (id v6 = v5, object_isClass(v5)))
  {
    id v7 = NSStringFromClass(v6);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(DebugHierarchyRequestExecutionContext *)self globalRuntimeInfo];
  id v9 = [v8 typeWithName:v7];
  if (v9)
  {
  }
  else
  {
    id v10 = [(DebugHierarchyRequestExecutionContext *)self contextRuntimeInfo];
    id v11 = [v10 typeWithName:v7];

    if (!v11)
    {
      id v12 = +[NSMutableArray array];
      uint64_t v13 = objc_opt_class();
      if (v13)
      {
        id v14 = (void *)v13;
        unsigned int v15 = 0;
        do
        {
          [v12 addObject:v14];
          id v16 = [v14 superclass];
          if (!v16) {
            break;
          }
          id v14 = v16;
        }
        while (v15++ < 0x3E7);
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v18 = [v12 reverseObjectEnumerator];
      id v19 = [v18 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v19)
      {
        id v20 = v19;
        id v38 = v12;
        unint64_t v39 = v7;
        id v40 = v4;
        uint64_t v41 = v18;
        id v21 = 0;
        uint64_t v46 = *(void *)v52;
        v42 = self;
        do
        {
          v22 = 0;
          id v43 = v20;
          do
          {
            if (*(void *)v52 != v46) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(objc_class **)(*((void *)&v51 + 1) + 8 * (void)v22);
            if (v23 && object_isClass(*(id *)(*((void *)&v51 + 1) + 8 * (void)v22)))
            {
              id v24 = NSStringFromClass(v23);
            }
            else
            {
              id v24 = 0;
            }
            id v25 = [(DebugHierarchyRequestExecutionContext *)self contextRuntimeInfo];
            long long v26 = [v25 typeWithName:v24];

            if (v26)
            {
              long long v27 = v21;
              id v21 = v26;
            }
            else
            {
              id v45 = v24;
              long long v28 = +[DebugHierarchyRuntimeType typeWithName:v24];
              long long v29 = +[DebugHierarchyObjectProtocolHelper debugHierarchyChildGroupingIDOfClass:v23];
              [v28 setChildGroupingID:v29];

              unsigned __int8 v30 = +[DebugHierarchyObjectProtocolHelper debugHierarchyAdditionalGroupingIDsOfClass:v23];
              [v28 setAdditionalGroupingIDs:v30];

              long long v27 = +[DebugHierarchyObjectInterface propertyDescriptionsForClass:v23 inContext:self];
              if ([v27 count])
              {
                id v44 = v21;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                id v31 = v27;
                id v32 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
                if (v32)
                {
                  id v33 = v32;
                  uint64_t v34 = *(void *)v48;
                  do
                  {
                    for (i = 0; i != v33; i = (char *)i + 1)
                    {
                      if (*(void *)v48 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      Class v36 = [[DebugHierarchyProperty alloc] initWithPropertyDescription:*(void *)(*((void *)&v47 + 1) + 8 * i)];
                      [v28 addInstanceProperty:v36];
                    }
                    id v33 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
                  }
                  while (v33);
                }

                id v18 = v41;
                self = v42;
                id v21 = v44;
              }
              v37 = [(DebugHierarchyRequestExecutionContext *)self contextRuntimeInfo];
              [v37 addType:v28 toParentType:v21];

              id v21 = v28;
              id v20 = v43;
              id v24 = v45;
            }

            v22 = (char *)v22 + 1;
          }
          while (v22 != v20);
          id v20 = [v18 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v20);

        id v7 = v39;
        id v4 = v40;
        id v12 = v38;
      }
    }
  }
}

- (DebugHierarchyRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSMutableDictionary)topLevelGroups
{
  return self->_topLevelGroups;
}

- (void)setTopLevelGroups:(id)a3
{
}

- (NSMutableDictionary)topLevelPropertyDescriptions
{
  return self->_topLevelPropertyDescriptions;
}

- (void)setTopLevelPropertyDescriptions:(id)a3
{
}

- (NSMutableDictionary)identifierToObjectDescriptionMap
{
  return self->_identifierToObjectDescriptionMap;
}

- (void)setIdentifierToObjectDescriptionMap:(id)a3
{
}

- (DebugHierarchyRuntimeInfo)contextRuntimeInfo
{
  return self->_contextRuntimeInfo;
}

- (void)setContextRuntimeInfo:(id)a3
{
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_contextRuntimeInfo, 0);
  objc_storeStrong((id *)&self->_identifierToObjectDescriptionMap, 0);
  objc_storeStrong((id *)&self->_topLevelPropertyDescriptions, 0);
  objc_storeStrong((id *)&self->_topLevelGroups, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end