@interface PFCKRecordConflictResolver
- (PFCKRecordConflictResolver)initWithAncestorRecord:(id)a3 serverRecord:(id)a4 clientRecord:(id)a5;
- (void)dealloc;
@end

@implementation PFCKRecordConflictResolver

- (PFCKRecordConflictResolver)initWithAncestorRecord:(id)a3 serverRecord:(id)a4 clientRecord:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (a3 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a4 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a5 && (getCloudKitCKShareClass[0](), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v9 = [NSString stringWithUTF8String:"Conflict resolver only knows how to work with CKShares today."];
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, v30);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Conflict resolver only knows how to work with CKShares today.", buf, 2u);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PFCKRecordConflictResolver;
  v17 = [(PFCKRecordConflictResolver *)&v31 init];
  if (v17)
  {
    v17->_ancestorRecord = (CKShare *)a3;
    v17->_serverRecord = (CKShare *)a4;
    v17->_clientRecord = (CKShare *)a5;
    self;
    v18 = objc_alloc_init(NSManagedObjectModel);
    v19 = objc_alloc_init(NSEntityDescription);
    v20 = (objc_class *)objc_opt_class();
    [(NSEntityDescription *)v19 setName:NSStringFromClass(v20)];
    v21 = (objc_class *)objc_opt_class();
    [(NSEntityDescription *)v19 setManagedObjectClassName:NSStringFromClass(v21)];
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, &unk_1ED7E17B8, v19);
    [(NSEntityDescription *)v19 setUniquenessConstraints:&unk_1ED7E9748];
    v22 = objc_alloc_init(NSEntityDescription);
    v23 = (objc_class *)objc_opt_class();
    [(NSEntityDescription *)v22 setName:NSStringFromClass(v23)];
    v24 = (objc_class *)objc_opt_class();
    [(NSEntityDescription *)v22 setManagedObjectClassName:NSStringFromClass(v24)];
    +[_PFModelUtilities addAttributes:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, &unk_1ED7E17E0, v22);
    [(NSEntityDescription *)v22 setUniquenessConstraints:&unk_1ED7E9790];
    v41 = @"participants";
    v40[0] = &unk_1ED7E28D8;
    v40[1] = v22;
    v40[2] = [MEMORY[0x1E4F1CA98] null];
    v40[3] = &unk_1ED7E28F0;
    v42[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1], v19);
    v38 = @"share";
    *(void *)buf = &unk_1ED7E2908;
    v34 = v19;
    v35 = @"participants";
    v36 = &unk_1ED7E2920;
    v37 = &unk_1ED7E28D8;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:5];
    +[_PFModelUtilities addRelationships:toPropertiesOfEntity:]((uint64_t)_PFModelUtilities, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1], v22);
    v32[0] = v19;
    v32[1] = v22;
    -[NSManagedObjectModel setEntities:](v18, "setEntities:", [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2]);

    v25 = [NSPersistentContainer alloc];
    v26 = NSString;
    v27 = (objc_class *)objc_opt_class();
    v28 = -[NSPersistentContainer initWithName:managedObjectModel:](v25, "initWithName:managedObjectModel:", [v26 stringWithFormat:@"%@-%p", NSStringFromClass(v27), v17], v18);
    v17->_container = v28;
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[NSPersistentContainer persistentStoreDescriptions](v17->_container, "persistentStoreDescriptions"), "objectAtIndexedSubscript:", 0), "setURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(NSString, "stringWithFormat:", @"/dev/null/%@", -[NSPersistentContainer name](v28, "name"))));

    v17->_allParticipantsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17->_participantObjectIDsByParticipantID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v17->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v17;
}

- (void)dealloc
{
  self->_ancestorRecord = 0;
  self->_serverRecord = 0;

  self->_clientRecord = 0;
  self->_resolvedRecord = 0;

  self->_container = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCKRecordConflictResolver;
  [(PFCKRecordConflictResolver *)&v3 dealloc];
}

@end