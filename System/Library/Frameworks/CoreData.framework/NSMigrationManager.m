@interface NSMigrationManager
+ (BOOL)_canMigrateWithMappingModel:(id)a3;
+ (int)migrationDebugLevel;
+ (uint64_t)_performSanityCheckForMapping:(void *)a3 fromSourceModel:(void *)a4 toDestinationModel:;
+ (void)setMigrationDebugLevel:(int)a3;
- (BOOL)migrateStoreFromURL:(NSURL *)sourceURL type:(NSString *)sStoreType options:(NSDictionary *)sOptions withMappingModel:(NSMappingModel *)mappings toDestinationURL:(NSURL *)dURL destinationType:(NSString *)dStoreType destinationOptions:(NSDictionary *)dOptions error:(NSError *)error;
- (BOOL)usesStoreSpecificMigrationManager;
- (NSArray)destinationInstancesForEntityMappingNamed:(NSString *)mappingName sourceInstances:(NSArray *)sourceInstances;
- (NSArray)sourceInstancesForEntityMappingNamed:(NSString *)mappingName destinationInstances:(NSArray *)destinationInstances;
- (NSDictionary)userInfo;
- (NSEntityDescription)destinationEntityForEntityMapping:(NSEntityMapping *)mEntity;
- (NSEntityDescription)sourceEntityForEntityMapping:(NSEntityMapping *)mEntity;
- (NSEntityMapping)currentEntityMapping;
- (NSManagedObjectContext)destinationContext;
- (NSManagedObjectContext)sourceContext;
- (NSManagedObjectModel)destinationModel;
- (NSManagedObjectModel)sourceModel;
- (NSMappingModel)mappingModel;
- (NSMigrationManager)initWithSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel;
- (NSString)destinationConfigurationForCloudKitValidation;
- (float)migrationProgress;
- (id)currentPropertyMapping;
- (id)destinationInstancesForSourceRelationshipNamed:(id)a3 sourceInstances:(id)a4;
- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4;
- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4 includesSubentities:(BOOL)a5;
- (uint64_t)_validateAllObjectsAfterMigration:(void *)a1;
- (void)_doCleanupOnFailure:(id *)a1;
- (void)associateSourceInstance:(NSManagedObject *)sourceInstance withDestinationInstance:(NSManagedObject *)destinationInstance forEntityMapping:(NSEntityMapping *)entityMapping;
- (void)cancelMigrationWithError:(NSError *)error;
- (void)dealloc;
- (void)reset;
- (void)setDestinationConfigurationForCloudKitValidation:(id)a3;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setUsesStoreSpecificMigrationManager:(BOOL)usesStoreSpecificMigrationManager;
@end

@implementation NSMigrationManager

- (NSMigrationManager)initWithSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel
{
  v12.receiver = self;
  v12.super_class = (Class)NSMigrationManager;
  v6 = [(NSMigrationManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    if (!sourceModel || !destinationModel)
    {

      if (sourceModel) {
        v11 = @"Cannot create an NSMigrationManager with a nil destination model";
      }
      else {
        v11 = @"Cannot create an NSMigrationManager with a nil source model";
      }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
    }
    v8 = (NSManagedObjectModel *)[(NSManagedObjectModel *)sourceModel copy];
    v7->_sourceModel = v8;
    if ((*(unsigned char *)&sourceModel->_managedObjectModelFlags & 0x10) != 0 && v8)
    {
      *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
      v8 = v7->_sourceModel;
    }
    v7->_sourceEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v8);
    [(NSManagedObjectModel *)v7->_sourceModel _stripForMigration];
    v9 = (NSManagedObjectModel *)[(NSManagedObjectModel *)destinationModel copy];
    v7->_destinationModel = v9;
    v7->_destinationEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v9);
    [(NSManagedObjectModel *)v7->_destinationModel _stripForMigration];
    v7->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&v7->_migrationManagerFlags & 0xFFFFFFFC | (2 * BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88)));
    v7->_destinationConfigurationForCloudKitValidation = 0;
  }
  return v7;
}

- (void)dealloc
{
  -[NSMigrationManager _doCleanupOnFailure:]((id *)&self->super.isa);

  self->_sourceModel = 0;
  self->_sourceEntitiesByVersionHash = 0;

  self->_destinationModel = 0;
  self->_destinationEntitiesByVersionHash = 0;

  self->_userInfo = 0;
  self->_destinationConfigurationForCloudKitValidation = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMigrationManager;
  [(NSMigrationManager *)&v3 dealloc];
}

- (void)_doCleanupOnFailure:(id *)a1
{
  if (a1)
  {

    a1[6] = 0;
    a1[7] = 0;

    a1[8] = 0;
    a1[5] = 0;

    a1[13] = 0;
  }
}

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return 0;
}

- (BOOL)migrateStoreFromURL:(NSURL *)sourceURL type:(NSString *)sStoreType options:(NSDictionary *)sOptions withMappingModel:(NSMappingModel *)mappings toDestinationURL:(NSURL *)dURL destinationType:(NSString *)dStoreType destinationOptions:(NSDictionary *)dOptions error:(NSError *)error
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  uint64_t v104 = 0;
  v97 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, @"CoreData: Schema migration (manager)", &v104);
  v103 = self;
  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class()
    && [(NSMigrationManager *)self usesStoreSpecificMigrationManager]
    && [(NSString *)sStoreType isEqualToString:dStoreType])
  {
    id v17 = [(NSDictionary *)+[NSPersistentStoreCoordinator registeredStoreTypes] objectForKey:sStoreType];
    if ((id)objc_opt_class() != v17)
    {
      if (![v17 isNSValue]) {
        goto LABEL_21;
      }
      id v17 = (id)[v17 pointerValue];
    }
    if (v17)
    {
      v18 = (void *)[v17 migrationManagerClass];
      if (objc_opt_respondsToSelector())
      {
        char v19 = [v18 _canMigrateWithMappingModel:mappings];
        if (v18) {
          char v20 = v19;
        }
        else {
          char v20 = 0;
        }
        if ((v20 & 1) == 0) {
          goto LABEL_21;
        }
      }
      else if (!v18)
      {
        goto LABEL_21;
      }
      if (v18 != objc_opt_class())
      {
        v21 = objc_msgSend(objc_alloc((Class)v18), "initWithSourceModel:destinationModel:", -[NSMigrationManager sourceModel](self, "sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel"));
        objc_msgSend(v21, "setDestinationConfigurationForCloudKitValidation:", -[NSMigrationManager destinationConfigurationForCloudKitValidation](self, "destinationConfigurationForCloudKitValidation"));
        v22 = [(NSMigrationManager *)self sourceModel];
        if (v22)
        {
          if ((*(unsigned char *)&v22->_managedObjectModelFlags & 0x10) != 0)
          {
            uint64_t v23 = [v21 sourceModel];
            if (v23) {
              *(_DWORD *)(v23 + 64) |= 0x10u;
            }
          }
        }
        char v24 = [v21 migrateStoreFromURL:sourceURL type:sStoreType options:sOptions withMappingModel:mappings toDestinationURL:dURL destinationType:dStoreType destinationOptions:dOptions error:error];

        goto LABEL_146;
      }
    }
  }
LABEL_21:
  if (!self) {
    goto LABEL_131;
  }
  if ((+[NSMigrationManager _performSanityCheckForMapping:fromSourceModel:toDestinationModel:]((uint64_t)NSMigrationManager, mappings, [(NSMigrationManager *)self sourceModel], [(NSMigrationManager *)self destinationModel]) & 1) == 0)
  {
    v90 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v91 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), @"sourceModel", -[NSMigrationManager destinationModel](self, "destinationModel"), @"destinationModel", mappings, @"mappingModel", 0);
    objc_exception_throw((id)[v90 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Mismatch between mapping and source/destination models" userInfo:v91]);
  }
  self->_mappingModel = mappings;
  self->_migrationContext = [[NSMigrationContext alloc] initWithMigrationManager:self];
  uint64_t v115 = 0;
  v25 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[(NSMigrationManager *)self sourceModel]];
  v26 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
  self->_sourceManagedObjectContext = v26;
  [(NSManagedObjectContext *)v26 setPersistentStoreCoordinator:v25];
  [(NSManagedObjectContext *)self->_sourceManagedObjectContext setUndoManager:0];

  if (!sOptions)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v27 = (NSDictionary *)objc_msgSend(v28, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption", 0);
    goto LABEL_27;
  }
  if ([(NSDictionary *)sOptions objectForKey:@"NSReadOnlyPersistentStoreOption"])
  {
    v27 = sOptions;
LABEL_27:
    v29 = v27;
    goto LABEL_29;
  }
  v29 = (NSDictionary *)[(NSDictionary *)sOptions mutableCopy];
  -[NSDictionary setObject:forKey:](v29, "setObject:forKey:", [NSNumber numberWithBool:1], @"NSReadOnlyPersistentStoreOption");
LABEL_29:
  uint64_t v98 = [(NSPersistentStoreCoordinator *)v25 addPersistentStoreWithType:sStoreType configuration:0 URL:sourceURL options:v29 error:&v115];

  if (!v98)
  {
    if (error)
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't add source store", @"reason", v115, *MEMORY[0x1E4F28A50], 0);
LABEL_129:
      *error = (NSError *)[v35 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v36];
    }
LABEL_130:
    -[NSMigrationManager _doCleanupOnFailure:]((id *)&self->super.isa);
    goto LABEL_131;
  }
  v30 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[(NSMigrationManager *)self destinationModel]];
  v31 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
  self->_destinationManagedObjectContext = v31;
  [(NSManagedObjectContext *)v31 setPersistentStoreCoordinator:v30];
  [(NSManagedObjectContext *)self->_destinationManagedObjectContext setUndoManager:0];

  if (dOptions)
  {
    id v32 = [(NSDictionary *)dOptions objectForKey:@"NSSQLitePragmasOption"];
    v33 = v32;
    if (v32)
    {
      if ([v32 objectForKey:@"journal_mode]"])
      {
        v34 = dOptions;
      }
      else
      {
        v34 = (NSDictionary *)[(NSDictionary *)dOptions mutableCopy];
        v41 = (void *)[v33 mutableCopy];
        objc_msgSend(v41, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode");
        [(NSDictionary *)v34 setObject:v41 forKey:@"NSSQLitePragmasOption"];
      }
    }
    else
    {
      v34 = (NSDictionary *)[(NSDictionary *)dOptions mutableCopy];
      id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v40 = objc_msgSend(v39, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode", 0);
      [(NSDictionary *)v34 setObject:v40 forKey:@"NSSQLitePragmasOption"];
    }
  }
  else
  {
    id v37 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v38 = objc_msgSend(v37, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"journal_mode", 0);
    v34 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v38, @"NSSQLitePragmasOption", 0);
  }
  uint64_t v94 = [(NSPersistentStoreCoordinator *)v30 addPersistentStoreWithType:dStoreType configuration:0 URL:dURL options:v34 error:&v115];

  if (!v94)
  {
    if (error)
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Can't add destination store", @"reason", v115, *MEMORY[0x1E4F28A50], 0);
      goto LABEL_129;
    }
    goto LABEL_130;
  }
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __148__NSMigrationManager_InternalMethods___migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error___block_invoke;
  v114[3] = &unk_1E544C948;
  v114[4] = v30;
  v114[5] = v98;
  v114[6] = v94;
  v114[7] = self;
  [(NSPersistentStoreCoordinator *)v30 performBlockAndWait:v114];
  v42 = [(NSMappingModel *)mappings entityMappings];
  id v113 = 0;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v109 objects:v127 count:16];
  v100 = v42;
  if (!v43) {
    goto LABEL_72;
  }
  uint64_t v44 = *(void *)v110;
  uint64_t v92 = *MEMORY[0x1E4F281F8];
  unint64_t v45 = 0x1E4F28000uLL;
  do
  {
    for (uint64_t i = 0; i != v43; ++i)
    {
      if (*(void *)v110 != v44) {
        objc_enumerationMutation(v42);
      }
      v47 = *(NSEntityMigrationPolicy **)(*((void *)&v109 + 1) + 8 * i);
      id v102 = objc_alloc_init(*(Class *)(v45 + 2856));
      v48 = -[NSEntityMapping _migrationPolicy](v47);
      if (![(NSEntityMigrationPolicy *)v48 beginEntityMapping:v47 manager:self error:&v113])
      {
        int v54 = 0;
LABEL_60:
        LOBYTE(v117) = 0;
        int v55 = 1;
        goto LABEL_65;
      }
      if (*(unsigned char *)&self->_migrationManagerFlags)
      {
        int v54 = 1;
        id v113 = self->_migrationCancellationError;
        goto LABEL_60;
      }
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)self->_migrationContext, v47);
      v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
      [v49 setValue:self forKey:@"manager"];
      [v49 setValue:v47 forKey:@"entityMapping"];
      [v49 setValue:v48 forKey:@"entityPolicy"];
      v50 = objc_msgSend((id)-[NSEntityMigrationPolicy sourceExpression](v47, "sourceExpression"), "expressionValueWithObject:context:", 0, v49);

      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v123 objects:v128 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v124;
        while (2)
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v124 != v52) {
              objc_enumerationMutation(v50);
            }
            if (![(NSEntityMigrationPolicy *)v48 createDestinationInstancesForSourceInstance:*(void *)(*((void *)&v123 + 1) + 8 * j) entityMapping:v47 manager:self error:&v113])
            {
              int v54 = 0;
              LOBYTE(v117) = 0;
              int v55 = 1;
              v42 = v100;
              goto LABEL_64;
            }
            if (*(unsigned char *)&self->_migrationManagerFlags)
            {
              v42 = v100;
              id v113 = self->_migrationCancellationError;
              LOBYTE(v117) = 0;
              int v55 = 1;
              int v54 = 1;
              goto LABEL_64;
            }
          }
          uint64_t v51 = [v50 countByEnumeratingWithState:&v123 objects:v128 count:16];
          v42 = v100;
          if (v51) {
            continue;
          }
          break;
        }
      }
      int v54 = [(NSEntityMigrationPolicy *)v48 endInstanceCreationForEntityMapping:v47 manager:self error:&v113];
      if (*(unsigned char *)&self->_migrationManagerFlags)
      {
        id v113 = self->_migrationCancellationError;
        LOBYTE(v117) = 0;
        int v55 = 1;
      }
      else
      {
        int v55 = 0;
      }
LABEL_64:
      unint64_t v45 = 0x1E4F28000;
LABEL_65:

      if ((v55 | 2) == 2)
      {
        if (!v54) {
          goto LABEL_134;
        }
      }
      else if ((v117 & 1) == 0)
      {
LABEL_134:
        id v83 = v113;
        goto LABEL_136;
      }
      uint64_t v115 = 0;
      if (![(NSManagedObjectContext *)self->_destinationManagedObjectContext save:&v115])
      {
        id v113 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v92, 134110, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to save new store after first pass of migration.", @"reason", v115, *MEMORY[0x1E4F28A50], 0));
        goto LABEL_136;
      }
      [v102 drain];
    }
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v109 objects:v127 count:16];
  }
  while (v43);
LABEL_72:
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v56 = [(NSArray *)v42 countByEnumeratingWithState:&v105 objects:&v123 count:16];
  if (!v56) {
    goto LABEL_105;
  }
  uint64_t v96 = *(void *)v106;
  uint64_t v93 = *MEMORY[0x1E4F281F8];
  while (2)
  {
    uint64_t v57 = 0;
    uint64_t v95 = v56;
    do
    {
      if (*(void *)v106 != v96) {
        objc_enumerationMutation(v42);
      }
      v58 = *(NSEntityMigrationPolicy **)(*((void *)&v105 + 1) + 8 * v57);
      id v102 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      uint64_t v99 = v57;
      id v121 = 0;
      v59 = -[NSEntityMapping _migrationPolicy](v58);
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)v103->_migrationContext, v58);
      v60 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&v103->_migrationContext->super.isa, v58, 0);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v117 objects:v128 count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v118;
        while (2)
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v118 != v62) {
              objc_enumerationMutation(v60);
            }
            uint64_t v64 = *(void *)(*((void *)&v117 + 1) + 8 * k);
            id v65 = objc_alloc_init(MEMORY[0x1E4F28B28]);
            if (![(NSEntityMigrationPolicy *)v59 createRelationshipsForDestinationInstance:v64 entityMapping:v58 manager:v103 error:&v121])
            {
              v42 = v100;
              id v69 = v121;
              int v67 = 0;
              goto LABEL_93;
            }
            if (*(unsigned char *)&v103->_migrationManagerFlags)
            {
              v42 = v100;
              id v121 = v103->_migrationCancellationError;
              char v122 = 0;
              int v68 = 1;
              goto LABEL_91;
            }
            [v65 drain];
          }
          uint64_t v61 = [v60 countByEnumeratingWithState:&v117 objects:v128 count:16];
          if (v61) {
            continue;
          }
          break;
        }
      }
      v42 = v100;
      int v66 = [(NSEntityMigrationPolicy *)v59 endRelationshipCreationForEntityMapping:v58 manager:v103 error:&v121];
      int v67 = v66;
      if (*(unsigned char *)&v103->_migrationManagerFlags)
      {
        id v65 = 0;
        id v121 = v103->_migrationCancellationError;
LABEL_93:
        char v122 = 0;
        int v68 = 1;
      }
      else if (v66)
      {
        id v65 = 0;
        int v68 = 0;
LABEL_91:
        int v67 = 1;
      }
      else
      {
        id v72 = v121;
        id v65 = 0;
        int v68 = 0;
        int v67 = 0;
      }

      if (v65) {
        [v65 drain];
      }
      id v113 = v121;
      id v70 = v121;
      id v71 = 0;
      if ((v68 | 2) == 2)
      {
        if (!v67) {
          goto LABEL_134;
        }
      }
      else if ((v122 & 1) == 0)
      {
        goto LABEL_134;
      }
      uint64_t v115 = 0;
      if (![(NSManagedObjectContext *)v103->_destinationManagedObjectContext save:&v115])
      {
        id v113 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v93, 134110, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to save new store after second pass of migration.", @"reason", v115, *MEMORY[0x1E4F28A50], 0));
LABEL_136:
        -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
        char v116 = 0;
        if (v102) {
          [v102 drain];
        }
        char v82 = 0;
        goto LABEL_139;
      }
      [v102 drain];
      ++v57;
    }
    while (v99 + 1 != v95);
    uint64_t v56 = [(NSArray *)v42 countByEnumeratingWithState:&v105 objects:&v123 count:16];
    if (v56) {
      continue;
    }
    break;
  }
LABEL_105:
  [(NSManagedObjectModel *)[(NSMigrationManager *)v103 sourceModel] _restoreValidation];
  [(NSManagedObjectModel *)[(NSMigrationManager *)v103 destinationModel] _restoreValidation];
  if (-[NSMigrationManager _validateAllObjectsAfterMigration:](v103, (uint64_t *)&v113))
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    uint64_t v73 = [(NSArray *)v42 countByEnumeratingWithState:&v117 objects:v128 count:16];
    if (!v73)
    {
      char v82 = 1;
      goto LABEL_139;
    }
    uint64_t v74 = *(void *)v118;
    while (2)
    {
      uint64_t v75 = 0;
LABEL_109:
      if (*(void *)v118 != v74) {
        objc_enumerationMutation(v42);
      }
      v76 = *(NSEntityMigrationPolicy **)(*((void *)&v117 + 1) + 8 * v75);
      char v77 = 1;
      v78 = -[NSEntityMapping _migrationPolicy](v76);
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)v103->_migrationContext, v76);
      if ([(NSEntityMigrationPolicy *)v78 performCustomValidationForEntityMapping:v76 manager:v103 error:&v113])
      {
        if (*(unsigned char *)&v103->_migrationManagerFlags)
        {
          id v113 = v103->_migrationCancellationError;
          LOBYTE(v121) = 0;
          v81 = v78;
          int v80 = 1;
        }
        else
        {
          char v79 = -[NSEntityMigrationPolicy endEntityMapping:manager:error:](v78, "endEntityMapping:manager:error:", v76);
          if (*(unsigned char *)&v103->_migrationManagerFlags)
          {
            id v113 = v103->_migrationCancellationError;
            LOBYTE(v121) = 0;
            int v80 = 1;
          }
          else
          {
            int v80 = 0;
          }
          char v77 = v79;
LABEL_119:
          v81 = v78;
        }

        if ((v80 | 2) == 2)
        {
          v42 = v100;
          if ((v77 & 1) == 0) {
            goto LABEL_148;
          }
        }
        else
        {
          v42 = v100;
          if ((v121 & 1) == 0) {
            goto LABEL_148;
          }
        }
        if (v73 == ++v75)
        {
          uint64_t v73 = [(NSArray *)v42 countByEnumeratingWithState:&v117 objects:v128 count:16];
          char v82 = 1;
          if (!v73) {
            goto LABEL_139;
          }
          continue;
        }
        goto LABEL_109;
      }
      break;
    }
    char v77 = 0;
    LOBYTE(v121) = 0;
    int v80 = 1;
    goto LABEL_119;
  }
LABEL_148:
  id v89 = v113;
  -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
  char v82 = 0;
  char v116 = 0;
LABEL_139:
  id v84 = v113;
  if (error && v113) {
    *error = (NSError *)v113;
  }
  id v85 = v84;
  if ((v82 & 1) == 0)
  {
    char v24 = v116;
    goto LABEL_146;
  }
  uint64_t v115 = 0;
  if ([(NSManagedObjectContext *)v103->_destinationManagedObjectContext save:&v115])
  {

    v103->_mappingModel = 0;
    [(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)v103->_destinationManagedObjectContext persistentStoreCoordinator] removePersistentStore:v94 error:0];
    [(NSPersistentStoreCoordinator *)[(NSManagedObjectContext *)v103->_sourceManagedObjectContext persistentStoreCoordinator] removePersistentStore:v98 error:0];
    -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
    char v24 = 1;
    goto LABEL_146;
  }
  v87 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v88 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to save new store.", @"reason", v115, *MEMORY[0x1E4F28A50], 0);
  *error = (NSError *)[v87 errorWithDomain:*MEMORY[0x1E4F281F8] code:134110 userInfo:v88];
  -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
LABEL_131:
  char v24 = 0;
LABEL_146:
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v104, v97);
  return v24 & 1;
}

- (void)reset
{
}

- (NSMappingModel)mappingModel
{
  return self->_mappingModel;
}

- (NSManagedObjectModel)sourceModel
{
  return self->_sourceModel;
}

- (NSManagedObjectModel)destinationModel
{
  return self->_destinationModel;
}

- (NSManagedObjectContext)sourceContext
{
  return self->_sourceManagedObjectContext;
}

- (NSManagedObjectContext)destinationContext
{
  return self->_destinationManagedObjectContext;
}

- (NSEntityDescription)sourceEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  sourceEntitiesByVersionHash = self->_sourceEntitiesByVersionHash;
  v4 = [(NSEntityMapping *)mEntity sourceEntityVersionHash];

  return (NSEntityDescription *)[(NSDictionary *)sourceEntitiesByVersionHash objectForKey:v4];
}

- (NSEntityDescription)destinationEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  destinationEntitiesByVersionHash = self->_destinationEntitiesByVersionHash;
  v4 = [(NSEntityMapping *)mEntity destinationEntityVersionHash];

  return (NSEntityDescription *)[(NSDictionary *)destinationEntitiesByVersionHash objectForKey:v4];
}

- (void)associateSourceInstance:(NSManagedObject *)sourceInstance withDestinationInstance:(NSManagedObject *)destinationInstance forEntityMapping:(NSEntityMapping *)entityMapping
{
  if (!entityMapping) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Manager requires an entity mapping for associations"));
  }
  if (self) {
    self = (NSMigrationManager *)self->_migrationContext;
  }

  -[NSMigrationContext associateSourceInstance:withDestinationInstance:forEntityMapping:]((uint64_t)self, sourceInstance, destinationInstance, entityMapping);
}

- (NSArray)destinationInstancesForEntityMappingNamed:(NSString *)mappingName sourceInstances:(NSArray *)sourceInstances
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    sourceInstances = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:sourceInstances];
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](sourceInstances, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  if (mappingName)
  {
    if (!self
      || (id v30 = [(NSDictionary *)[(NSMappingModel *)[(NSMigrationManager *)self mappingModel] entityMappingsByName] valueForKey:mappingName]) == 0)
    {

      CFRelease(Mutable);
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find mapping for name (%@).", mappingName), 0 reason userInfo]);
    }
  }
  else
  {
    id v30 = 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [(NSArray *)sourceInstances countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    obuint64_t j = sourceInstances;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
        if (self) {
          migrationContext = self->_migrationContext;
        }
        else {
          migrationContext = 0;
        }
        v14 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&migrationContext->super.isa, v30, *(void *)(*((void *)&v35 + 1) + 8 * v11));
        if ((unint64_t)[v14 count] >= 2
          && +[NSMigrationManager migrationDebugLevel] >= 2)
        {
          _NSCoreDataLog(4, @"(migration) got more destinations for source than we expected. (%@, %@, %@)", v15, v16, v17, v18, v19, v20, v12);
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v14);
              }
              v25 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                [v7 addObject:v25];
                CFSetAddValue(Mutable, v25);
              }
            }
            uint64_t v22 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v22);
        }
        ++v11;
      }
      while (v11 != v10);
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      uint64_t v10 = v26;
    }
    while (v26);
  }
  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (id)destinationInstancesForSourceRelationshipNamed:(id)a3 sourceInstances:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v8 = [(NSMigrationManager *)self currentEntityMapping];
  id v9 = [(NSMigrationManager *)self currentPropertyMapping];
  uint64_t v10 = [(NSMigrationManager *)self sourceEntityForEntityMapping:v8];
  uint64_t v11 = [(NSMigrationManager *)self destinationEntityForEntityMapping:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:a4];
  }
  if (!a3)
  {
    v53 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v54 = *MEMORY[0x1E4F1C3C8];
    uint64_t v55 = [NSString stringWithFormat:@"Property mapping %@.%@ missing required relationship name argument to destinationInstancesForSourceRelationshipNamed:sourceInstances:", -[NSEntityMapping name](v8, "name"), objc_msgSend(v9, "name")];
    uint64_t v56 = v53;
    uint64_t v57 = v54;
    goto LABEL_54;
  }
  v60 = v7;
  obuint64_t j = a4;
  id v12 = -[NSEntityDescription _relationshipNamed:](v10, (uint64_t)a3);
  if (!v12)
  {
    v58 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v59 = *MEMORY[0x1E4F1C3C8];
    uint64_t v55 = [NSString stringWithFormat:@"Can't find relationship for name (%@) for entity (%@) in source model.", a3, -[NSEntityDescription name](v10, "name")];
    uint64_t v56 = v58;
    uint64_t v57 = v59;
LABEL_54:
    objc_exception_throw((id)[v56 exceptionWithName:v57 reason:v55 userInfo:0]);
  }
  v13 = v12;
  id v14 = -[NSEntityDescription _relationshipNamed:](v11, [v9 name]);
  uint64_t v15 = [v13 destinationEntity];
  uint64_t v16 = [v14 destinationEntity];
  id v65 = (id)[MEMORY[0x1E4F1CA48] array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v17 = [(NSMappingModel *)[(NSMigrationManager *)self mappingModel] entityMappings];
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v81 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        if ([(NSEntityDescription *)[(NSMigrationManager *)self sourceEntityForEntityMapping:v22] isKindOfEntity:v15]&& [(NSEntityDescription *)[(NSMigrationManager *)self destinationEntityForEntityMapping:v22] isKindOfEntity:v16])
        {
          [v65 addObject:v22];
        }
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v19);
  }
  uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v77;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v77 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v25;
        uint64_t v26 = *(void *)(*((void *)&v76 + 1) + 8 * v25);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v67 = [v65 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v67)
        {
          uint64_t v66 = *(void *)v73;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v73 != v66) {
                objc_enumerationMutation(v65);
              }
              if (self) {
                migrationContext = self->_migrationContext;
              }
              else {
                migrationContext = 0;
              }
              uint64_t v29 = self;
              id v30 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&migrationContext->super.isa, *(void **)(*((void *)&v72 + 1) + 8 * v27), v26);
              if ((unint64_t)[v30 count] >= 2
                && +[NSMigrationManager migrationDebugLevel] >= 2)
              {
                _NSCoreDataLog(4, @"(migration) got more destinations for source than we expected. (%@, %@, %@)", v31, v32, v33, v34, v35, v36, v26);
              }
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              uint64_t v37 = [v30 countByEnumeratingWithState:&v68 objects:v84 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v69;
                do
                {
                  for (uint64_t j = 0; j != v38; ++j)
                  {
                    if (*(void *)v69 != v39) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v41 = *(const void **)(*((void *)&v68 + 1) + 8 * j);
                    if (!CFSetContainsValue(Mutable, v41))
                    {
                      [v23 addObject:v41];
                      CFSetAddValue(Mutable, v41);
                    }
                  }
                  uint64_t v38 = [v30 countByEnumeratingWithState:&v68 objects:v84 count:16];
                }
                while (v38);
              }
              ++v27;
              self = v29;
            }
            while (v27 != v67);
            uint64_t v42 = [v65 countByEnumeratingWithState:&v72 objects:v85 count:16];
            uint64_t v67 = v42;
          }
          while (v42);
        }
        uint64_t v25 = v64 + 1;
      }
      while (v64 + 1 != v63);
      uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v63);
  }
  if (+[NSMigrationManager migrationDebugLevel] >= 2)
  {
    uint64_t v43 = [v23 count];
    if (v43 != [obj count])
    {
      unint64_t v44 = [v23 count];
      if (v44 <= [obj count]) {
        unint64_t v45 = @"fewer";
      }
      else {
        unint64_t v45 = @"more";
      }
      [v23 count];
      [obj count];
      _NSCoreDataLog(4, @"(migration) got %@ destinations[%lu] for sources[%lu] than we expected. (%@, %@)", v46, v47, v48, v49, v50, v51, (uint64_t)v45);
    }
  }

  CFRelease(Mutable);
  return v23;
}

- (NSArray)sourceInstancesForEntityMappingNamed:(NSString *)mappingName destinationInstances:(NSArray *)destinationInstances
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    destinationInstances = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:destinationInstances];
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](destinationInstances, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  if (mappingName)
  {
    if (!self
      || (id v9 = [(NSDictionary *)[(NSMappingModel *)[(NSMigrationManager *)self mappingModel] entityMappingsByName] valueForKey:mappingName]) == 0)
    {
      CFRelease(Mutable);

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find mapping for name (%@).", mappingName), 0 reason userInfo]);
    }
  }
  else
  {
    id v9 = 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v30 = [(NSArray *)destinationInstances countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v30)
  {
    obuint64_t j = destinationInstances;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
        if (self) {
          migrationContext = self->_migrationContext;
        }
        else {
          migrationContext = 0;
        }
        v13 = -[NSMigrationContext sourceInstancesForEntityMapping:destinationInstance:]((id *)&migrationContext->super.isa, v9, *(void *)(*((void *)&v35 + 1) + 8 * v10));
        id v14 = v13;
        if (v9
          && (unint64_t)[v13 count] >= 2
          && +[NSMigrationManager migrationDebugLevel] >= 2)
        {
          _NSCoreDataLog(4, @"(migration) got more sources for destination than we expected. (%@, %@, %@)", v15, v16, v17, v18, v19, v20, v11);
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v14);
              }
              uint64_t v25 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                [v7 addObject:v25];
                CFSetAddValue(Mutable, v25);
              }
            }
            uint64_t v22 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v22);
        }
        ++v10;
      }
      while (v10 != v30);
      uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      uint64_t v30 = v26;
    }
    while (v26);
  }
  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (NSEntityMapping)currentEntityMapping
{
  if (self)
  {
    destinationEntityName = self->_destinationEntityName;
    if (destinationEntityName) {
      return (NSEntityMapping *)destinationEntityName[6].super.isa;
    }
    else {
      return 0;
    }
  }
  return self;
}

- (id)currentPropertyMapping
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 8);
    if (v2) {
      return *(id *)(v2 + 64);
    }
    else {
      return 0;
    }
  }
  return self;
}

- (float)migrationProgress
{
  unint64_t v3 = [(NSArray *)[(NSMappingModel *)[(NSMigrationManager *)self mappingModel] entityMappings] count];
  if (!v3) {
    return 0.0;
  }
  double currentStep = 0.0;
  if (self)
  {
    migrationContext = self->_migrationContext;
    if (migrationContext) {
      double currentStep = (double)migrationContext->_currentStep;
    }
  }
  return currentStep / ((double)v3 * 3.0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  unint64_t v3 = self->_userInfo;
  if (v3 != userInfo)
  {

    self->_userInfo = userInfo;
  }
}

- (void)cancelMigrationWithError:(NSError *)error
{
  *(_DWORD *)&self->_migrationManagerFlags |= 1u;
  migrationCancellationError = self->_migrationCancellationError;
  if (migrationCancellationError != error)
  {

    self->_migrationCancellationError = error;
  }
}

- (void)setUsesStoreSpecificMigrationManager:(BOOL)usesStoreSpecificMigrationManager
{
  if (usesStoreSpecificMigrationManager) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&self->_migrationManagerFlags & 0xFFFFFFFD | v3);
}

- (BOOL)usesStoreSpecificMigrationManager
{
  return (*(unsigned char *)&self->_migrationManagerFlags >> 1) & 1;
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel];
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4 includesSubentities:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [(NSMigrationManager *)self sourceModel];
  if (!v8 || (uint64_t v9 = [(NSMutableDictionary *)v8->_entities objectForKey:a3]) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find entity named %@ in source model", a3), 0 reason userInfo]);
  }
  uint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:a4];
  id v12 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v12 setEntity:v10];
  [(NSFetchRequest *)v12 setPredicate:v11];
  [(NSFetchRequest *)v12 setIncludesSubentities:v5];

  return v12;
}

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4
{
  return [(NSMigrationManager *)self fetchRequestForSourceEntityNamed:a3 predicateString:a4 includesSubentities:0];
}

+ (uint64_t)_performSanityCheckForMapping:(void *)a3 fromSourceModel:(void *)a4 toDestinationModel:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self;
  id v7 = objc_msgSend((id)objc_msgSend(a3, "entities"), "valueForKey:", @"versionHash");
  v8 = objc_msgSend((id)objc_msgSend(a4, "entities"), "valueForKey:", @"versionHash");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = objc_msgSend(a2, "entityMappings", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10) {
    return 1;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v19 != v12) {
      objc_enumerationMutation(v9);
    }
    id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
    int v15 = [v14 sourceEntityVersionHash]
        ? objc_msgSend(v7, "containsObject:", objc_msgSend(v14, "sourceEntityVersionHash"))
        : 1;
    int v16 = [v14 destinationEntityVersionHash]
        ? objc_msgSend(v8, "containsObject:", objc_msgSend(v14, "destinationEntityVersionHash"))
        : 1;
    uint64_t result = 0;
    if (!v15 || !v16) {
      return result;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        goto LABEL_3;
      }
      return 1;
    }
  }
}

- (uint64_t)_validateAllObjectsAfterMigration:(void *)a1
{
  uint64_t v25 = a2;
  v27[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "destinationContext"), "registeredObjects");
  unint64_t v3 = [v2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = (char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    id v7 = (char *)NSAllocateScannedUncollectable();
    [v2 getObjects:v7];
  }
  else
  {
    bzero((char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    [v2 getObjects:v7];
    if (!v4)
    {
      char v8 = 1;
      return v8 & 1;
    }
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *MEMORY[0x1E4F281F8];
  uint64_t v26 = @"NSDetailedErrors";
  char v8 = 1;
  do
  {
    uint64_t v12 = *(void **)&v7[8 * v10];
    v27[0] = 0;
    if (([v12 validateForUpdate:v27] & 1) == 0)
    {
      if (!v9) {
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
      }
      if (v27[0])
      {
        if (objc_msgSend((id)objc_msgSend(v27[0], "domain"), "isEqual:", v11)
          && [v27[0] code] == 1560)
        {
          uint64_t v13 = (void *)[v27[0] userInfo];
          objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v13, "objectForKey:", v26));
        }
        else
        {
          uint64_t v14 = objc_msgSend((id)objc_msgSend(v27[0], "userInfo"), "objectForKey:", @"NSValidationErrorObject");
          id v15 = v27[0];
          if (v14)
          {
            int v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v27[0], "userInfo"));
            objc_msgSend(v16, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"NSValidationErrorObject"), "description"), @"NSValidationErrorObject");
            uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v18 = [v27[0] domain];
            id v15 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v27[0], "code"), v16);
            v27[0] = v15;
          }
          [v9 addObject:v15];
        }
      }
      char v8 = 0;
    }
    ++v10;
  }
  while (v4 != v10);
  if ((v8 & 1) == 0)
  {
    if ([v9 count] == 1)
    {
      if (v25)
      {
        uint64_t v19 = [v9 objectAtIndex:0];
        uint64_t *v25 = v19;
      }
    }
    else
    {
      unint64_t v20 = [v9 count];
      if (v25 && v20 >= 2)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v9, v26, 0);
        uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:v11 code:1560 userInfo:v22];
        uint64_t *v25 = v23;
      }
    }
  }

  if (v4 >= 0x201) {
    NSZoneFree(0, v7);
  }
  return v8 & 1;
}

void __148__NSMigrationManager_InternalMethods___migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error___block_invoke(uint64_t a1)
{
}

@end