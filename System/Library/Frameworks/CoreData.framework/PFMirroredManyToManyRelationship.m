@interface PFMirroredManyToManyRelationship
+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4;
+ (uint64_t)ckRecordNameForOrderedRecordNames:(uint64_t)a1;
+ (uint64_t)ckRecordTypeForOrderedRelationships:(uint64_t)a1;
- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5;
- (PFMirroredManyToManyRelationship)initWithRecordID:(id)a3 recordType:(id)a4 managedObjectModel:(id)a5 andType:(unint64_t)a6;
- (id)_setManyToManyRecordID:(void *)a3 manyToManyRecordType:(void *)a4 ckRecordID:(void *)a5 relatedCKRecordID:(void *)a6 relationshipDescription:(void *)a7 inverseRelationshipDescription:(uint64_t)a8 type:;
- (id)description;
- (void)dealloc;
- (void)recordTypeToRecordID;
@end

@implementation PFMirroredManyToManyRelationship

- (PFMirroredManyToManyRelationship)initWithRecordID:(id)a3 recordType:(id)a4 managedObjectModel:(id)a5 andType:(unint64_t)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PFMirroredManyToManyRelationship;
  v10 = [(PFMirroredManyToManyRelationship *)&v25 init];
  if (v10)
  {
    self;
    unint64_t v11 = [a4 length];
    if (v11 > [@"CD_M2M_" length]
      && (v12 = (void *)[(id)objc_msgSend(a4 substringFromIndex:objc_msgSend(@"CD_M2M_", "length")), "componentsSeparatedByString:", @"_"], objc_msgSend(v12, "count") == 2)&& (v13 = objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 0))) != 0&& (v14 = objc_msgSend((id)objc_msgSend(v13, "relationshipsByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 1))) != 0&& (v15 = v14, objc_msgSend(v14, "inverseRelationship")))
    {
      v26[0] = v15;
      v26[1] = [v15 inverseRelationship];
      v16 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    }
    else
    {
      v16 = 0;
    }
    v17 = (void *)[v16 objectAtIndex:0];
    uint64_t v18 = [v16 objectAtIndex:1];
    if (v17 && (v19 = (void *)v18) != 0)
    {
      v20 = (void *)[a3 recordName];
      self;
      v21 = (void *)[v20 componentsSeparatedByString:@":"];
      if ([v21 count] != 2) {
        v21 = 0;
      }
      v22 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v21, "objectAtIndex:", 0), objc_msgSend(a3, "zoneID"));
      v23 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v21, "objectAtIndex:", 1), objc_msgSend(a3, "zoneID"));
      -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v10, a3, a4, v22, v23, v17, v19, a6);
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (id)_setManyToManyRecordID:(void *)a3 manyToManyRecordType:(void *)a4 ckRecordID:(void *)a5 relatedCKRecordID:(void *)a6 relationshipDescription:(void *)a7 inverseRelationshipDescription:(uint64_t)a8 type:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a2, "zoneID"), "isEqual:", objc_msgSend(a4, "zoneID"))
    || (objc_msgSend((id)objc_msgSend(a2, "zoneID"), "isEqual:", objc_msgSend(a5, "zoneID")) & 1) == 0)
  {
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)a2);
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v26 = a2;
      __int16 v27 = 2112;
      v28 = a4;
      __int16 v29 = 2112;
      v30 = a5;
    }
  }
  a1[4] = a2;
  a1[5] = a3;
  a1[2] = a6;
  a1[3] = a7;
  a1[6] = a4;
  id result = a5;
  a1[7] = result;
  a1[1] = a8;
  return result;
}

- (void)dealloc
{
  self->_relationshipDescription = 0;
  self->_inverseRelationshipDescription = 0;

  self->_manyToManyRecordID = 0;
  self->_manyToManyRecordType = 0;

  self->_ckRecordID = 0;
  self->_relatedCKRecordID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFMirroredManyToManyRelationship;
  [(PFMirroredManyToManyRelationship *)&v3 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)PFMirroredManyToManyRelationship;
  id v3 = (id)objc_msgSend(-[PFMirroredManyToManyRelationship description](&v5, sel_description), "mutableCopy");
  [v3 appendFormat:@" %@-%@:%@-%@-%@:%@", self->_manyToManyRecordID, -[NSEntityDescription name](-[NSPropertyDescription entity](self->_relationshipDescription, "entity"), "name"), self->_ckRecordID, -[NSPropertyDescription name](self->_relationshipDescription, "name"), -[NSEntityDescription name](-[NSPropertyDescription entity](-[NSRelationshipDescription inverseRelationship](self->_relationshipDescription, "inverseRelationship"), "entity"), "name"), self->_relatedCKRecordID];
  return v3;
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  ckRecordID = self->_ckRecordID;
  v10 = [(NSEntityDescription *)[(NSPropertyDescription *)self->_relationshipDescription entity] name];
  if (a3) {
    unint64_t v11 = (PFMirroredManyToManyRelationship *)objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v10), "objectForKey:", ckRecordID);
  }
  else {
    unint64_t v11 = 0;
  }
  relatedCKRecordID = self->_relatedCKRecordID;
  v13 = [(NSEntityDescription *)[(NSPropertyDescription *)self->_inverseRelationshipDescription entity] name];
  if (a3) {
    a3 = (id)objc_msgSend((id)objc_msgSend(*((id *)a3 + 8), "objectForKey:", v13), "objectForKey:", relatedCKRecordID);
  }
  if (([(PFMirroredManyToManyRelationship *)v11 isTemporaryID] & 1) != 0
    || [a3 isTemporaryID])
  {
    uint64_t v14 = [NSString stringWithUTF8String:"Got temporary objectIDs back during import where we should have permanent ones: %@ / %@"];
    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    uint64_t v21 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v11;
      __int16 v49 = 2112;
      id v50 = a3;
      _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Got temporary objectIDs back during import where we should have permanent ones: %@ / %@", buf, 0x16u);
    }
  }
  uint64_t v22 = 134412;
  if (v11)
  {
    if (a3)
    {
      v23 = objc_msgSend(a4, "objectWithID:", v11, 134412);
      uint64_t v24 = [a4 objectWithID:a3];
      objc_super v25 = objc_msgSend((id)objc_msgSend(v23, "valueForKey:", -[NSPropertyDescription name](self->_relationshipDescription, "name")), "mutableCopy");
      id v26 = v25;
      unint64_t type = self->_type;
      if (type == 1)
      {
        [v25 removeObject:v24];
      }
      else
      {
        if (type)
        {
          uint64_t v38 = [NSString stringWithUTF8String:"New many to many relationship type?: %@"];
          _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)self);
          v45 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = self;
            _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: New many to many relationship type?: %@", buf, 0xCu);
          }
          goto LABEL_27;
        }
        if (!v25) {
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        [v26 addObject:v24];
      }
      objc_msgSend(v23, "setValue:forKey:", v26, -[NSPropertyDescription name](self->_relationshipDescription, "name"));
LABEL_27:

      LOBYTE(v28) = 1;
      return v28;
    }
  }
  else
  {
    uint64_t v22 = 134413;
  }
  uint64_t v28 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v22 userInfo:0];
  if (!v28)
  {
    uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m");
    v37 = __pflogFaultLog;
    LODWORD(v28) = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v28) {
      return v28;
    }
    *(_DWORD *)buf = 136315394;
    v48 = (PFMirroredManyToManyRelationship *)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFMirroredRelationship.m";
    __int16 v49 = 1024;
    LODWORD(v50) = 210;
    _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_22;
  }
  if (!a5)
  {
LABEL_22:
    LOBYTE(v28) = 0;
    return v28;
  }
  __int16 v29 = (void *)v28;
  LOBYTE(v28) = 0;
  *a5 = v29;
  return v28;
}

- (void)recordTypeToRecordID
{
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", result[6], 0);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(v3, "setObject:forKey:", v2, objc_msgSend((id)objc_msgSend((id)v1[2], "entity"), "name"));

    id v4 = (id)objc_msgSend(v3, "objectForKey:", objc_msgSend((id)objc_msgSend((id)v1[3], "entity"), "name"));
    if (!v4)
    {
      id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v1[7], 0);
      objc_msgSend(v3, "setObject:forKey:", v4, objc_msgSend((id)objc_msgSend((id)v1[3], "entity"), "name"));
    }

    return v3;
  }
  return result;
}

uint64_t __55__PFMirroredManyToManyRelationship_orderRelationships___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "name"), "compare:options:", objc_msgSend((id)objc_msgSend(a3, "entity"), "name"), 1);
  if (!result)
  {
    v6 = (void *)[a2 name];
    uint64_t v7 = [a3 name];
    return [v6 compare:v7 options:1];
  }
  return result;
}

+ (uint64_t)ckRecordTypeForOrderedRelationships:(uint64_t)a1
{
  self;
  id v3 = (void *)[a2 objectAtIndexedSubscript:0];
  return [NSString stringWithFormat:@"%@%@_%@", @"CD_M2M_", objc_msgSend((id)objc_msgSend(v3, "entity"), "name"), objc_msgSend(v3, "name")];
}

+ (uint64_t)ckRecordNameForOrderedRecordNames:(uint64_t)a1
{
  self;

  return [a2 componentsJoinedByString:@":"];
}

+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "recordType"), "length");
  if (v5) {
    LOBYTE(v5) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "recordID"), "recordName"), "length") != 0;
  }
  return v5;
}

@end