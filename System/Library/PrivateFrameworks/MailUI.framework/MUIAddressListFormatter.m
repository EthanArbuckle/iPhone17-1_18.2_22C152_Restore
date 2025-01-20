@interface MUIAddressListFormatter
- (EFLazyCache)addressCache;
- (EFLazyCache)attributedAddressCache;
- (EFLazyCache)commentCache;
- (EMUserProfileProvider)userProfileProvider;
- (MFAddressBookManager)addressBookManager;
- (MUIAddressListFormatter)initWithUserProfileProvider:(id)a3 addressBookManager:(id)a4;
- (MUILocalizationListFormatter)listFormatter;
- (id)_addressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4;
- (id)_attributedAddressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4;
- (id)attributedStringFromEmailAddressList:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromAddressAddressList:(id)a3;
- (id)stringFromAddressAddressList:(id)a3 preferFullDisplayName:(BOOL)a4;
- (id)stringFromEmailAddressList:(id)a3 preferFullDisplayName:(BOOL)a4;
- (void)_commonInit;
- (void)_invalidateCache;
- (void)dealloc;
- (void)setAddressCache:(id)a3;
- (void)setAttributedAddressCache:(id)a3;
- (void)setCommentCache:(id)a3;
@end

@implementation MUIAddressListFormatter

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __79__MUIAddressListFormatter__addressCommentForAddressList_preferFullDisplayName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F60DF0] pairWithFirst:a2 second:0];
}

- (id)_addressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "ef_map:", &__block_literal_global_40);
  v7 = [(MUIAddressListFormatter *)self _attributedAddressCommentForAddressList:v6 preferFullDisplayName:v4];
  v8 = [v7 string];

  return v8;
}

id __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 emailAddressValue];
  BOOL v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  v5 = [v3 stringValue];

  return v5;
}

- (id)_attributedAddressCommentForAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  BOOL v94 = a4;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MUIAddressListFormatter *)self listFormatter];

  if (!v7)
  {
    v87 = [MEMORY[0x1E4F28B00] currentHandler];
    [v87 handleFailureInMethod:a2 object:self file:@"MUIAddressListFormatter.m" lineNumber:166 description:@"A valid instance of MFLocalizationListFormatter is needed"];
  }
  v8 = [(MUIAddressListFormatter *)self addressBookManager];
  [v8 addressBook];

  if ((unint64_t)[v6 count] > 1)
  {
    v90 = self;
    v15 = [(MUIAddressListFormatter *)self userProfileProvider];
    v97 = [v15 allEmailAddresses];

    v95 = [MEMORY[0x1E4F1CA48] array];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v6 = v6;
    uint64_t v16 = [v6 countByEnumeratingWithState:&v102 objects:v107 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v103;
      char v19 = 1;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v103 != v18) {
            objc_enumerationMutation(v6);
          }
          v21 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          v22 = [v21 first];
          v23 = [v22 emailAddressValue];
          v24 = [v23 simpleAddress];
          v25 = v24;
          if (v24)
          {
            id v26 = v24;
          }
          else
          {
            id v26 = [v22 stringValue];
          }
          v27 = v26;

          if (v19 & 1 | (([v97 containsObject:v27] & 1) == 0))
          {
            v28 = (void *)MEMORY[0x1E4F60DF0];
            v29 = [v21 second];
            v30 = [v28 pairWithFirst:v22 second:v29];
            [v95 addObject:v30];
          }
          char v19 = 0;
        }
        uint64_t v17 = [v6 countByEnumeratingWithState:&v102 objects:v107 count:16];
        char v19 = 0;
      }
      while (v17);
    }

    v31 = v95;
    if ([v95 count])
    {
      id v32 = v95;

      id v6 = v32;
    }
    if ([v6 count] == 1)
    {
      v33 = [v95 lastObject];
      v34 = [v33 first];
      v35 = [v34 emailAddressValue];
      v36 = [v35 simpleAddress];
      v37 = v36;
      if (v36)
      {
        id v38 = v36;
      }
      else
      {
        id v38 = [v34 stringValue];
      }
      v79 = v38;

      id v61 = v34;
      v80 = [v61 emailAddressValue];
      v81 = [v80 displayName];
      v82 = v81;
      if (v81)
      {
        id v83 = v81;
      }
      else
      {
        id v83 = [v61 stringValue];
      }
      v84 = v83;

      v60 = MFPreferredCompositeNameForAddressAndDisplayName();

      v85 = (void *)MEMORY[0x1E4F28B18];
      v66 = [v33 second];
      v68 = objc_msgSend(v85, "ec_emailAttributedStringWithString:andEmailAddress:", v60, v66);
    }
    else
    {
      id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v92 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v91 = objc_opt_new();
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v88 = v6;
      id v39 = v6;
      uint64_t v96 = [v39 countByEnumeratingWithState:&v98 objects:v106 count:16];
      if (v96)
      {
        uint64_t v40 = *(void *)v99;
        do
        {
          for (uint64_t j = 0; j != v96; ++j)
          {
            if (*(void *)v99 != v40) {
              objc_enumerationMutation(v39);
            }
            v42 = *(void **)(*((void *)&v98 + 1) + 8 * j);
            v43 = objc_msgSend(v42, "first", v88);
            v44 = [v42 second];
            id v45 = v43;
            v46 = [v45 emailAddressValue];
            v47 = [v46 simpleAddress];
            v48 = v47;
            if (v47)
            {
              id v49 = v47;
            }
            else
            {
              id v49 = [v45 stringValue];
            }
            v50 = v49;

            id v51 = v45;
            v52 = [v51 emailAddressValue];
            v53 = [v52 displayName];
            v54 = v53;
            if (v53)
            {
              id v55 = v53;
            }
            else
            {
              id v55 = [v51 stringValue];
            }
            v56 = v55;

            if (v94)
            {
              id v57 = v56;
            }
            else
            {
              MFPreferredAbbreviatedNameForAddressAndDisplayName();
              id v57 = (id)objc_claimAutoreleasedReturnValue();
            }
            v58 = v57;
            if (v57)
            {
              v59 = [MEMORY[0x1E4F60DF0] pairWithFirst:v57 second:v44];
              [v93 addObject:v59];
            }
          }
          uint64_t v96 = [v39 countByEnumeratingWithState:&v98 objects:v106 count:16];
        }
        while (v96);
      }

      v33 = v93;
      v31 = v95;
      v60 = v91;
      id v61 = v92;
      if ([v93 count] == 1)
      {
        v62 = [v92 allObjects];
        v63 = [v62 firstObject];

        uint64_t v64 = [v91 objectForKeyedSubscript:v63];
        v65 = (void *)v64;
        if (v63 && v64)
        {
          [v93 removeAllObjects];
          [v93 addObject:v65];
        }
      }
      v66 = [(MUIAddressListFormatter *)v90 listFormatter];
      v67 = objc_msgSend(v93, "ef_map:", &__block_literal_global_50);
      v68 = [v66 attributedLocalizedStringFromList:v67];

      id v6 = v89;
    }
  }
  else
  {
    v9 = [v6 lastObject];
    v10 = [v9 first];
    v11 = [v10 emailAddressValue];
    v12 = [v11 simpleAddress];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v10 stringValue];
    }
    v69 = v14;

    id v70 = v10;
    v71 = [v70 emailAddressValue];
    v72 = [v71 displayName];
    v73 = v72;
    if (v72)
    {
      id v74 = v72;
    }
    else
    {
      id v74 = [v70 stringValue];
    }
    v75 = v74;

    v76 = MFPreferredCompositeNameForAddressAndDisplayName();

    v77 = (void *)MEMORY[0x1E4F28B18];
    v78 = [v9 second];
    v68 = objc_msgSend(v77, "ec_emailAttributedStringWithString:andEmailAddress:", v76, v78);
  }
  return v68;
}

id __89__MUIAddressListFormatter__attributedAddressCommentForAddressList_preferFullDisplayName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28B18];
  id v3 = a2;
  BOOL v4 = [v3 first];
  v5 = [v3 second];

  id v6 = objc_msgSend(v2, "ec_emailAttributedStringWithString:andEmailAddress:", v4, v5);

  return v6;
}

- (MUILocalizationListFormatter)listFormatter
{
  return self->_listFormatter;
}

- (MFAddressBookManager)addressBookManager
{
  return self->_addressBookManager;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (id)stringFromAddressAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_msgSend(a3, "ef_map:", &__block_literal_global_12);
  v7 = [v6 componentsJoinedByString:@", "];
  if ([v7 length]) {
    BOOL v8 = !v4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = [v7 stringByAppendingString:@", prefersFullDisplayName"];

    v7 = (void *)v9;
  }
  if (v7 && [v7 length])
  {
    v10 = [(MUIAddressListFormatter *)self commentCache];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke_2;
    v13[3] = &unk_1E6D12720;
    v13[4] = self;
    id v14 = v6;
    BOOL v15 = v4;
    v11 = [v10 objectForKey:v7 generator:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)stringFromEmailAddressList:(id)a3 preferFullDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "ef_map:", &__block_literal_global_25);
  BOOL v8 = [v7 componentsJoinedByString:@","];

  addressCache = self->_addressCache;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_2;
  v16[3] = &unk_1E6D12768;
  id v17 = v6;
  id v10 = v6;
  v11 = [(EFLazyCache *)addressCache objectForKey:v8 generator:v16];
  v12 = [v11 firstObject];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    id v14 = [(MUIAddressListFormatter *)self stringFromAddressAddressList:v11 preferFullDisplayName:v4];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (EFLazyCache)commentCache
{
  return self->_commentCache;
}

uint64_t __78__MUIAddressListFormatter_stringFromAddressAddressList_preferFullDisplayName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addressCommentForAddressList:*(void *)(a1 + 40) preferFullDisplayName:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __76__MUIAddressListFormatter_stringFromEmailAddressList_preferFullDisplayName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_30);
}

- (MUIAddressListFormatter)initWithUserProfileProvider:(id)a3 addressBookManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MUIAddressListFormatter.m", 46, @"Invalid parameter not satisfying: %@", @"userProfileProvider" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)MUIAddressListFormatter;
  id v10 = [(MUIAddressListFormatter *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userProfileProvider, a3);
    objc_storeStrong((id *)&v11->_addressBookManager, a4);
    [(MUIAddressListFormatter *)v11 _commonInit];
    [(MFAddressBookManager *)v11->_addressBookManager addClient:v11];
  }

  return v11;
}

- (void)_commonInit
{
  id v3 = (EFLazyCache *)[objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:100];
  commentCache = self->_commentCache;
  self->_commentCache = v3;

  v5 = (EFLazyCache *)[objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:100];
  addressCache = self->_addressCache;
  self->_addressCache = v5;

  v7 = (EFLazyCache *)[objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:100];
  attributedAddressCache = self->_attributedAddressCache;
  self->_attributedAddressCache = v7;

  id v9 = objc_alloc_init(MUILocalizationListFormatter);
  listFormatter = self->_listFormatter;
  self->_listFormatter = v9;
  MEMORY[0x1F41817F8](v9, listFormatter);
}

- (void)dealloc
{
  id v3 = [(MUIAddressListFormatter *)self addressBookManager];
  [v3 removeClient:self];

  v4.receiver = self;
  v4.super_class = (Class)MUIAddressListFormatter;
  [(MUIAddressListFormatter *)&v4 dealloc];
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(MUIAddressListFormatter *)self stringFromAddressAddressList:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stringFromAddressAddressList:(id)a3
{
  return [(MUIAddressListFormatter *)self stringFromAddressAddressList:a3 preferFullDisplayName:0];
}

- (id)attributedStringFromEmailAddressList:(id)a3
{
  id v4 = objc_msgSend(a3, "ef_map:", &__block_literal_global_34);
  if (v4)
  {
    v5 = [(MUIAddressListFormatter *)self attributedAddressCache];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke_2;
    v8[3] = &unk_1E6D127B0;
    v8[4] = self;
    id v9 = v4;
    id v6 = [v5 objectForKey:v9 generator:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (!v3) {
    id v3 = v2;
  }
  v5 = [v3 stringValue];

  id v6 = [MEMORY[0x1E4F60DF0] pairWithFirst:v5 second:v2];

  return v6;
}

uint64_t __64__MUIAddressListFormatter_attributedStringFromEmailAddressList___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attributedAddressCommentForAddressList:*(void *)(a1 + 40) preferFullDisplayName:0];
}

- (void)_invalidateCache
{
  [(EFLazyCache *)self->_commentCache removeAllObjects];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MFAddressListsFormatterDidInvalidateCache" object:self];
}

- (void)setCommentCache:(id)a3
{
}

- (EFLazyCache)addressCache
{
  return self->_addressCache;
}

- (void)setAddressCache:(id)a3
{
}

- (EFLazyCache)attributedAddressCache
{
  return self->_attributedAddressCache;
}

- (void)setAttributedAddressCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedAddressCache, 0);
  objc_storeStrong((id *)&self->_addressCache, 0);
  objc_storeStrong((id *)&self->_commentCache, 0);
  objc_storeStrong((id *)&self->_listFormatter, 0);
  objc_storeStrong((id *)&self->_addressBookManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
}

@end