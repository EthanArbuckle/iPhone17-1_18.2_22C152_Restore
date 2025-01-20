@interface AXSSWordDescriptionManager
+ (id)sharedInstance;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)languageDialectCode;
- (id)descriptionForWord:(id)a3;
- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4;
- (id)languageCode;
- (void)setLanguageDialectCode:(id)a3;
@end

@implementation AXSSWordDescriptionManager

void __52__AXSSWordDescriptionManager_zh_descriptionForWord___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 languageDialectCode];
  id v6 = [v3 descriptionForCharacter:v4 language:v5];

  if ([v6 length]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1) {
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_13);
  }
  id v3 = a1;
  objc_sync_enter(v3);
  id v4 = (void *)sharedInstance___sharedInstances;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 objectForKey:v6];

  if (!v7)
  {
    id v7 = objc_alloc_init((Class)objc_opt_class());
    v8 = (void *)sharedInstance___sharedInstances;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 setObject:v7 forKey:v10];
  }
  objc_sync_exit(v3);

  return v7;
}

uint64_t __44__AXSSWordDescriptionManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstances = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];

  return MEMORY[0x1F41817F8]();
}

- (id)descriptionForWord:(id)a3
{
  return 0;
}

- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if ([(__CFString *)v6 hasPrefix:@"ja"])
  {
    id v7 = +[AXSSWordDescriptionManager sharedInstance];
    v8 = v7;
    v9 = @"ja";
LABEL_6:
    [v7 setLanguageDialectCode:v9];
    goto LABEL_7;
  }
  if (([(__CFString *)v6 hasPrefix:@"zh"] & 1) != 0
    || [(__CFString *)v6 hasPrefix:@"yue"])
  {
    id v7 = +[AXSSWordDescriptionManager sharedInstance];
    v8 = v7;
    v9 = v6;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:
  v10 = [v8 descriptionForWord:v5];

  return v10;
}

- (NSManagedObjectContext)managedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  if (!managedObjectContext)
  {
    id v4 = [(AXSSWordDescriptionManager *)self persistentStoreCoordinator];
    if (v4)
    {
      id v5 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:2];
      id v6 = self->_managedObjectContext;
      self->_managedObjectContext = v5;

      [(NSManagedObjectContext *)self->_managedObjectContext setPersistentStoreCoordinator:v4];
    }

    managedObjectContext = self->_managedObjectContext;
  }

  return managedObjectContext;
}

- (id)languageCode
{
  v2 = [(AXSSWordDescriptionManager *)self languageDialectCode];
  uint64_t v3 = [v2 rangeOfString:@"-"];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 substringToIndex:v3];

    v2 = (void *)v4;
  }

  return v2;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (!persistentStoreCoordinator)
  {
    uint64_t v4 = [(AXSSWordDescriptionManager *)self managedObjectModel];
    id v5 = [(AXSSWordDescriptionManager *)self languageCode];
    id v6 = v5;
    if (v4 && [(__CFString *)v5 length])
    {
      if ([(__CFString *)v6 isEqualToString:@"yue"])
      {

        id v6 = @"zh";
      }
      id v7 = [@"AXWordDescriptionsData_" stringByAppendingString:v6];
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = [v8 URLForResource:v7 withExtension:@"sqlite"];

      if (v9)
      {
        v10 = (NSPersistentStoreCoordinator *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v4];
        v11 = self->_persistentStoreCoordinator;
        self->_persistentStoreCoordinator = v10;

        v12 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v13 = *MEMORY[0x1E4F28358];
        uint64_t v14 = *MEMORY[0x1E4F28370];
        v15 = [NSNumber numberWithBool:1];
        v16 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, v14, v15, *MEMORY[0x1E4F1BF20], 0);

        v17 = self->_persistentStoreCoordinator;
        uint64_t v18 = *MEMORY[0x1E4F1BF70];
        id v24 = 0;
        v19 = [(NSPersistentStoreCoordinator *)v17 addPersistentStoreWithType:v18 configuration:0 URL:v9 options:v16 error:&v24];
        id v20 = v24;

        if (!v19)
        {
          v21 = self->_persistentStoreCoordinator;
          self->_persistentStoreCoordinator = 0;

          v22 = [v20 localizedDescription];
          NSLog(&cfstr_SErrorAddingPe.isa, "-[AXSSWordDescriptionManager persistentStoreCoordinator]", v22);
        }
      }
    }
    persistentStoreCoordinator = self->_persistentStoreCoordinator;
  }

  return persistentStoreCoordinator;
}

- (NSManagedObjectModel)managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (!managedObjectModel)
  {
    uint64_t v4 = [(AXSSWordDescriptionManager *)self languageCode];
    if ([(__CFString *)v4 length])
    {
      if ([(__CFString *)v4 isEqualToString:@"yue"])
      {

        uint64_t v4 = @"zh";
      }
      id v5 = [@"AXWordDescriptionsData_" stringByAppendingString:v4];
      id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = [v6 URLForResource:v5 withExtension:@"momd"];

      if (v7)
      {
        v8 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v7];
        v9 = self->_managedObjectModel;
        self->_managedObjectModel = v8;
      }
      else
      {
        NSLog(&cfstr_SFailedToFindM.isa, "-[AXSSWordDescriptionManager managedObjectModel]");
      }
    }
    managedObjectModel = self->_managedObjectModel;
  }

  return managedObjectModel;
}

- (NSString)languageDialectCode
{
  return self->languageDialectCode;
}

- (void)setLanguageDialectCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->languageDialectCode, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __52__AXSSWordDescriptionManager_ja_descriptionForWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (GetHiraganaSet___onceToken != -1) {
    dispatch_once(&GetHiraganaSet___onceToken, &__block_literal_global_16);
  }
  v38[0] = GetHiraganaSet___hiraganaSet;
  if (GetKatakanaSet___onceToken != -1) {
    dispatch_once(&GetKatakanaSet___onceToken, &__block_literal_global_56);
  }
  v38[1] = GetKatakanaSet___katakanaSet;
  if (GetHalfWidthLatinSet___onceToken != -1) {
    dispatch_once(&GetHalfWidthLatinSet___onceToken, &__block_literal_global_61);
  }
  v38[2] = GetHalfWidthLatinSet___halfWidthLatinSet;
  if (GetFullWidthLatinSet___onceToken != -1) {
    dispatch_once(&GetFullWidthLatinSet___onceToken, &__block_literal_global_66);
  }
  v38[3] = GetFullWidthLatinSet___fullWidthLatinSet;
  v37[0] = xmmword_1E606DB10;
  v37[1] = *(_OWORD *)off_1E606DB20;
  if ([v7 _isOnlyIdeographs]) {
    goto LABEL_36;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length]
    || (unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v8 > 3))
  {
LABEL_23:
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length])
    {
      unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v13 <= 3)
      {
        uint64_t v14 = [NSString stringWithFormat:@"%@%@", *((void *)v37 + v13), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        [*(id *)(a1 + 40) addObject:v14];
      }
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    uint64_t v17 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
    while (![v7 _contentsExclusivelyInCharacterSet:v38[v17]])
    {
      if (++v17 == 4) {
        goto LABEL_31;
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v17;
LABEL_31:
    unint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v18 <= 3)
    {
      v19 = (void *)MEMORY[0x1E4F28E78];
      v12 = [*(id *)(a1 + 32) _convertString:v7 ifNeededForHiragana:v18 == 0];
      uint64_t v20 = [v19 stringWithString:v12];
      uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      goto LABEL_33;
    }
    [*(id *)(a1 + 40) addObject:v7];
LABEL_36:
    char v23 = 0;
    goto LABEL_37;
  }
  uint64_t v9 = v38[v8];
  id v10 = v7;
  if (([v10 _contentsExclusivelyInCharacterSet:v9] & 1) == 0)
  {
    if (GetHiraganaSet___onceToken != -1) {
      dispatch_once(&GetHiraganaSet___onceToken, &__block_literal_global_16);
    }
    if (GetHiraganaSet___hiraganaSet != v9)
    {
      if (GetKatakanaSet___onceToken != -1) {
        dispatch_once(&GetKatakanaSet___onceToken, &__block_literal_global_56);
      }
      if (GetKatakanaSet___katakanaSet != v9) {
        goto LABEL_22;
      }
    }
    if (([v10 isEqualToString:@"ー"] & 1) == 0
      && ([v10 isEqualToString:@"・"] & 1) == 0)
    {
LABEL_22:

      goto LABEL_23;
    }
  }

  v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v12 = [*(id *)(a1 + 32) _convertString:v10 ifNeededForHiragana:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0];
  [v11 appendString:v12];
LABEL_33:

  if (a3 + a4 != [*(id *)(a1 + 48) length]) {
    goto LABEL_46;
  }
  char v23 = 1;
LABEL_37:
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length])
  {
    unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v24 <= 3)
    {
      v25 = [NSString stringWithFormat:@"%@%@", *((void *)v37 + v24), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      [*(id *)(a1 + 40) addObject:v25];
    }
  }
  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = 0;

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  if ((v23 & 1) == 0)
  {
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Entry"];
    v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"character == %@", v7];
    [v28 setPredicate:v29];

    v30 = *(void **)(a1 + 56);
    id v36 = 0;
    v31 = [v30 executeFetchRequest:v28 error:&v36];
    id v32 = v36;
    if ([v31 count])
    {
      v33 = [v31 objectAtIndex:0];
      v34 = [v33 valueForKey:@"exemplar"];
      if ([v34 length]) {
        [*(id *)(a1 + 40) addObject:v34];
      }
    }
  }
LABEL_46:
  for (uint64_t i = 24; i != -8; i -= 8)
}

@end