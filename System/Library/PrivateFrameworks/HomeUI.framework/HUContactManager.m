@interface HUContactManager
+ (id)sharedManager;
- (CNContactStore)contactStore;
- (CNMonogrammer)monogrammer;
- (HUContactManager)init;
- (NSDictionary)cachedContactByEmails;
- (double)monogramDiameter;
- (id)contactForEmailAddress:(id)a3 keysToFetch:(id)a4;
- (id)userDataFromEmail:(id)a3 monogramDiameter:(double)a4;
- (void)contactStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setCachedContactByEmails:(id)a3;
- (void)setMonogramDiameter:(double)a3;
- (void)setMonogrammer:(id)a3;
@end

@implementation HUContactManager

+ (id)sharedManager
{
  if (qword_1EBA47B48 != -1) {
    dispatch_once(&qword_1EBA47B48, &__block_literal_global_290);
  }
  v2 = (void *)_MergedGlobals_642;

  return v2;
}

void __33__HUContactManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_642;
  _MergedGlobals_642 = v0;
}

- (HUContactManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HUContactManager;
  v2 = [(HUContactManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    cachedContactByEmails = v2->_cachedContactByEmails;
    v2->_cachedContactByEmails = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v5 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = v3->_contactStore;
    v3->_contactStore = v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUContactManager;
  [(HUContactManager *)&v4 dealloc];
}

- (void)contactStoreDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HUContactManager_contactStoreDidChange___block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__HUContactManager_contactStoreDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedContactByEmails:MEMORY[0x1E4F1CC08]];
}

- (id)contactForEmailAddress:(id)a3 keysToFetch:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(HUContactManager *)self cachedContactByEmails];
    objc_super v9 = [v8 objectForKeyedSubscript:v6];

    if (v9 && [v9 areKeysAvailable:v7])
    {
      id v10 = v9;
    }
    else
    {
      v11 = [v7 arrayByAddingObject:*MEMORY[0x1E4F1ADC8]];
      v12 = [(HUContactManager *)self contactStore];
      v13 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
      id v25 = 0;
      v14 = [v12 unifiedContactsMatchingPredicate:v13 keysToFetch:v11 error:&v25];
      id v15 = v25;

      if (v14)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v27 = __Block_byref_object_copy__35;
        v28 = __Block_byref_object_dispose__35;
        id v29 = 0;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke;
        v22[3] = &unk_1E6392180;
        id v16 = v6;
        id v23 = v16;
        v24 = buf;
        [v14 enumerateObjectsUsingBlock:v22];
        v17 = *(void **)(*(void *)&buf[8] + 40);
        if (v17)
        {
          v18 = [(HUContactManager *)self cachedContactByEmails];
          v19 = (void *)[v18 mutableCopy];

          [v19 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v16];
          [(HUContactManager *)self setCachedContactByEmails:v19];

          v17 = *(void **)(*(void *)&buf[8] + 40);
        }
        id v10 = v17;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v20 = HFLogForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "unifiedContactsMatching email %@ error: %@", buf, 0x16u);
        }

        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 emailAddresses];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke_2;
  v7[3] = &unk_1E6392158;
  id v8 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 indexOfObjectPassingTest:v7];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

uint64_t __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)userDataFromEmail:(id)a3 monogramDiameter:(double)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(HUContactManager *)self setMonogramDiameter:a4];
  if (!v6)
  {
    _HULocalizedStringWithDefaultValue(@"HUUnknownUser", @"HUUnknownUser", 1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v14 = 0;
    objc_super v9 = 0;
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4F1BBE8] descriptorForRequiredKeysIncludingImage:1];
  v26[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  objc_super v9 = [(HUContactManager *)self contactForEmailAddress:v6 keysToFetch:v8];

  id v10 = [(HUContactManager *)self monogrammer];
  v11 = [v10 monogramForContact:v9];

  v12 = [v9 givenName];
  uint64_t v13 = [v9 familyName];
  v14 = (void *)v13;
  if (!v11)
  {
    if (v12 && v13)
    {
      id v15 = [(HUContactManager *)self monogrammer];
      uint64_t v16 = [v15 monogramForPersonWithFirstName:v12 lastName:v14];
LABEL_8:
      v11 = (void *)v16;

      goto LABEL_9;
    }
LABEL_7:
    id v15 = [(HUContactManager *)self monogrammer];
    uint64_t v16 = [v15 silhouetteMonogram];
    goto LABEL_8;
  }
LABEL_9:
  v24[0] = @"kHUUserDataEmailNameKey";
  v24[1] = @"kHUUserDataImageKey";
  v25[0] = v6;
  v25[1] = v11;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v18 = (void *)[v17 mutableCopy];

  id v19 = v6;
  v20 = v19;
  if (v12 && v14)
  {
    id v21 = [NSString stringWithFormat:@"%@ %@", v12, v14];
  }
  else if (v12)
  {
    id v21 = v12;
  }
  else
  {
    v22 = v19;
    if (!v14) {
      goto LABEL_17;
    }
    id v21 = v14;
  }
  v22 = v21;

LABEL_17:
  [v18 setObject:v22 forKeyedSubscript:@"kHUUserDisplayableNameKey"];
  if (v9) {
    [v18 setObject:v9 forKeyedSubscript:@"kHUUserDataContactKey"];
  }

  return v18;
}

- (CNMonogrammer)monogrammer
{
  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    uint64_t v4 = (CNMonogrammer *)[objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:0 diameter:40.0];
    v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }

  return monogrammer;
}

- (void)setMonogramDiameter:(double)a3
{
  if (self->_monogramDiameter != a3 || !self->_monogrammer)
  {
    v5 = (CNMonogrammer *)[objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:0 diameter:a3];
    monogrammer = self->_monogrammer;
    self->_monogrammer = v5;

    self->_monogramDiameter = a3;
  }
}

- (NSDictionary)cachedContactByEmails
{
  return self->_cachedContactByEmails;
}

- (void)setCachedContactByEmails:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setMonogrammer:(id)a3
{
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_cachedContactByEmails, 0);
}

@end