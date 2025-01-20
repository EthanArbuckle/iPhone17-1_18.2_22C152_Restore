@interface PFMirroredOneToManyRelationship
- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5;
- (PFMirroredOneToManyRelationship)initWithManagedObject:(id)a3 withRecordName:(id)a4 relatedToRecordWithRecordName:(id)a5 byRelationship:(id)a6;
- (void)dealloc;
- (void)recordTypesToRecordIDs;
@end

@implementation PFMirroredOneToManyRelationship

- (PFMirroredOneToManyRelationship)initWithManagedObject:(id)a3 withRecordName:(id)a4 relatedToRecordWithRecordName:(id)a5 byRelationship:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PFMirroredOneToManyRelationship;
  v10 = [(PFMirroredOneToManyRelationship *)&v22 init];
  if (v10)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "zoneID"), "isEqual:", objc_msgSend(a5, "zoneID")) & 1) == 0)
    {
      uint64_t v11 = [NSString stringWithUTF8String:"Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@"];
      uint64_t v12 = [a6 name];
      _NSCoreDataLog(17, v11, v13, v14, v15, v16, v17, v18, v12);
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [a6 name];
        *(_DWORD *)buf = 138413058;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        id v26 = a4;
        __int16 v27 = 2112;
        id v28 = a5;
        __int16 v29 = 2112;
        id v30 = a3;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Attempting to link objects across zones via one-to-many relationship '%@': %@ / %@\n%@", buf, 0x2Au);
      }
    }
    v10->_recordID = (CKRecordID *)a4;
    v10->_relationshipDescription = (NSRelationshipDescription *)a6;
    v10->_inverseRelationshipDescription = (NSRelationshipDescription *)(id)[a6 inverseRelationship];
    v10->_relatedRecordID = (CKRecordID *)a5;
  }
  return v10;
}

- (void)dealloc
{
  self->_recordID = 0;
  self->_relationshipDescription = 0;

  self->_inverseRelationshipDescription = 0;
  self->_relatedRecordID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFMirroredOneToManyRelationship;
  [(PFMirroredOneToManyRelationship *)&v3 dealloc];
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  recordID = self->_recordID;
  v10 = [(NSEntityDescription *)[(NSPropertyDescription *)self->_relationshipDescription entity] name];
  if (!a3
    || (uint64_t v11 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v10), "objectForKey:", recordID)) == 0)
  {
    uint64_t v25 = [NSString stringWithUTF8String:"Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@"];
    _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)self->_recordID);
    v32 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v33 = self->_recordID;
      relationshipDescription = self->_relationshipDescription;
      *(_DWORD *)buf = 138412546;
      v56 = (const char *)v33;
      __int16 v57 = 2112;
      v58 = relationshipDescription;
      _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Import context cache is stale. To-one mirrored relationship source object has gone missing: %@ - %@", buf, 0x16u);
    }
LABEL_16:
    v44 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134412 userInfo:0];
    if (v44)
    {
      if (a5)
      {
        LOBYTE(v24) = 0;
        *a5 = v44;
        return v24;
      }
LABEL_21:
      LOBYTE(v24) = 0;
      return v24;
    }
LABEL_19:
    uint64_t v45 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m");
    v52 = __pflogFaultLog;
    BOOL v24 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v24) {
      return v24;
    }
    *(_DWORD *)buf = 136315394;
    v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m";
    __int16 v57 = 1024;
    LODWORD(v58) = 463;
    _os_log_fault_impl(&dword_18AB82000, v52, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_21;
  }
  uint64_t v12 = (void *)[a4 objectWithID:v11];
  relatedRecordID = self->_relatedRecordID;
  if (!relatedRecordID)
  {
    objc_msgSend(v12, "setValue:forKey:", 0, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
    goto LABEL_19;
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", -[NSEntityDescription name](-[NSPropertyDescription entity](self->_inverseRelationshipDescription, "entity"), "name")), "objectForKey:", relatedRecordID);
  if (!v14)
  {
    v35 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 9) {
      uint64_t v36 = 9;
    }
    else {
      uint64_t v36 = __ckLoggingOverride;
    }
    uint64_t v37 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Couldn't find related object to link for object with record name %@ to %@ via %@"];
    [(NSPropertyDescription *)self->_relationshipDescription name];
    _NSCoreDataLog(v36, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[PFMirroredOneToManyRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:error:]");
    goto LABEL_16;
  }
  uint64_t v15 = (void *)[a4 objectWithID:v14];
  context = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v16 = 9;
  }
  else {
    uint64_t v16 = __ckLoggingOverride;
  }
  uint64_t v17 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Linking object with record name %@ to %@ via %@ on %@->%@"];
  [(NSPropertyDescription *)self->_relationshipDescription name];
  [v15 objectID];
  _NSCoreDataLog(v16, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[PFMirroredOneToManyRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:error:]");
  objc_msgSend(v12, "setValue:forKey:", v15, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
  LOBYTE(v24) = 1;
  return v24;
}

- (void)recordTypesToRecordIDs
{
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", result[4], 0);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v3, "setObject:forKey:", v2, objc_msgSend((id)objc_msgSend((id)v1[1], "entity"), "name"));

    id v4 = (id)objc_msgSend(v3, "objectForKey:", objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    if (!v4)
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v1[3], 0);
      objc_msgSend(v3, "setObject:forKey:", v4, objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));
    }

    return v3;
  }
  return result;
}

@end