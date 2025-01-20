@interface HMDVendorModelCollection
- (BOOL)isEqual:(id)a3;
- (HMDVendorModelCollection)init;
- (HMDVendorModelEntry)defaultEntry;
- (NSMutableSet)entries;
- (id)attributeDescriptions;
- (id)lookupModel:(id)a3;
- (id)lookupProductData:(id)a3;
- (void)addEntry:(id)a3;
- (void)setDefaultEntry:(id)a3;
@end

@implementation HMDVendorModelCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_defaultEntry, 0);
}

- (NSMutableSet)entries
{
  return self->_entries;
}

- (void)setDefaultEntry:(id)a3
{
}

- (HMDVendorModelEntry)defaultEntry
{
  return self->_defaultEntry;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDVendorModelCollection *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDVendorModelCollection *)self defaultEntry];
      v8 = [(HMDVendorModelCollection *)v6 defaultEntry];
      if (HMFEqualObjects())
      {
        v9 = [(HMDVendorModelCollection *)self entries];
        v10 = [(HMDVendorModelCollection *)v6 entries];
        char v11 = [v9 isEqualToSet:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (id)lookupProductData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__107092;
  v16 = __Block_byref_object_dispose__107093;
  id v17 = 0;
  v5 = [(HMDVendorModelCollection *)self entries];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HMDVendorModelCollection_lookupProductData___block_invoke;
  v9[3] = &unk_1E6A0F358;
  id v6 = v4;
  id v10 = v6;
  char v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__HMDVendorModelCollection_lookupProductData___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 productData];
  int v7 = HMFAreStringsEqualIgnoringCase();

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)lookupModel:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__107092;
  v20 = __Block_byref_object_dispose__107093;
  id v21 = 0;
  if (!v4) {
    goto LABEL_4;
  }
  v5 = [(HMDVendorModelCollection *)self entries];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __40__HMDVendorModelCollection_lookupModel___block_invoke;
  v13 = &unk_1E6A0F358;
  id v14 = v4;
  v15 = &v16;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v10);

  id v6 = (void *)v17[5];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
LABEL_4:
    id v7 = [(HMDVendorModelCollection *)self defaultEntry];
  }
  id v8 = v7;
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __40__HMDVendorModelCollection_lookupModel___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 model];
  int v7 = HMFAreStringsEqualIgnoringCase();

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDVendorModelCollection *)self entries];
  [v5 addObject:v4];
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDVendorModelCollection *)self entries];
  id v5 = (void *)[v3 initWithName:@"Entries" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v7 = [(HMDVendorModelCollection *)self defaultEntry];
  id v8 = (void *)[v6 initWithName:@"DefaultEntry" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDVendorModelCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDVendorModelCollection;
  v2 = [(HMDVendorModelCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    entries = v2->_entries;
    v2->_entries = (NSMutableSet *)v3;
  }
  return v2;
}

@end