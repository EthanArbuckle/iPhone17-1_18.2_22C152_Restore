@interface NSFileProviderSearchQuery
+ (BOOL)supportsSecureCoding;
+ (id)newSearchContainerItemIdentifier;
- (BOOL)avoidCoreSpotlightSearch;
- (BOOL)includesTrashedItems;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFileProviderSearchQuery:(id)a3;
- (BOOL)shouldPerformSemanticSearch;
- (BOOL)shouldPerformServerSearch;
- (BOOL)shouldPerformThirdPartyServerSearch;
- (NSArray)csQueryScopes;
- (NSFileProviderSearchQuery)initWithCoder:(id)a3;
- (NSFileProviderSearchQuery)initWithSearchScope:(id)a3;
- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3;
- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3 alternateItemID:(id)a4;
- (NSFileProviderSearchQuery)initWithSearchScopedToItemIdentifier:(id)a3 alternateItemIdentifier:(id)a4 providerDomainID:(id)a5 searchContainerItemIdentifier:(id)a6;
- (NSFileProviderSearchQuery)initWithSpotlightQueryString:(id)a3 searchScope:(id)a4 searchContainerItemIdentifier:(id)a5;
- (NSSet)allowedContentTypes;
- (NSSet)allowedPathExtensions;
- (NSString)alternateScopeToItemIdentifier;
- (NSString)content;
- (NSString)filename;
- (NSString)keyboardLanguage;
- (NSString)providerDomainID;
- (NSString)scopeFragment;
- (NSString)scopedToItemIdentifier;
- (NSString)searchContainerItemIdentifier;
- (NSString)searchString;
- (NSString)spotlightQueryString;
- (NSString)userQueryString;
- (id)allowedContentTypesPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filenamePredicate;
- (id)predicate;
- (id)toSpotlightQueryString;
- (id)toSpotlightServerQueryString;
- (unint64_t)hash;
- (unint64_t)trashedItemsMembership;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedContentTypes:(id)a3;
- (void)setAlternateScopeToItemIdentifier:(id)a3;
- (void)setAvoidCoreSpotlightSearch:(BOOL)a3;
- (void)setContent:(id)a3;
- (void)setFilename:(id)a3;
- (void)setIncludesTrashedItems:(BOOL)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setProviderDomainID:(id)a3;
- (void)setScopeFragment:(id)a3;
- (void)setSearchContainerItemIdentifier:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setShouldPerformSemanticSearch:(BOOL)a3;
- (void)setShouldPerformServerSearch:(BOOL)a3;
- (void)setShouldPerformThirdPartyServerSearch:(BOOL)a3;
- (void)setSpotlightQueryString:(id)a3;
- (void)setTrashedItemsMembership:(unint64_t)a3;
- (void)setUserQueryString:(id)a3;
@end

@implementation NSFileProviderSearchQuery

- (NSSet)allowedPathExtensions
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  cachedExtensions = self->_cachedExtensions;
  if (!cachedExtensions)
  {
    v30 = [MEMORY[0x1E4F1CA80] set];
    v4 = [MEMORY[0x1E4F1CA80] set];
    v5 = (void *)MEMORY[0x1E4F1CA80];
    v27 = self;
    v6 = [(NSFileProviderSearchQuery *)self allowedContentTypes];
    v7 = [v5 setWithSet:v6];

    v29 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v8 = [v7 anyObject];
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v28 = *MEMORY[0x1E4F442E0];
      do
      {
        [v7 removeObject:v9];
        [v4 addObject:v9];
        v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
        if (v10)
        {
          [(NSSet *)v29 addObject:v10];
          v11 = [v10 tags];
          v12 = [v11 objectForKey:v28];
          [v30 addObjectsFromArray:v12];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v31 = v10;
          v13 = [v10 _childTypes];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                v19 = [v18 identifier];
                char v20 = [v4 containsObject:v19];

                if ((v20 & 1) == 0)
                {
                  v21 = [v18 identifier];
                  [v7 addObject:v21];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
            }
            while (v15);
          }

          v10 = v31;
        }

        uint64_t v22 = [v7 anyObject];

        v9 = (void *)v22;
      }
      while (v22);
    }
    uint64_t v23 = [v30 copy];
    v24 = v27->_cachedExtensions;
    v27->_cachedExtensions = (NSSet *)v23;

    allowedUTTypes = v27->_allowedUTTypes;
    v27->_allowedUTTypes = v29;

    cachedExtensions = v27->_cachedExtensions;
  }

  return cachedExtensions;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSSet)allowedContentTypes
{
  return self->_allowedContentTypes;
}

- (NSString)scopedToItemIdentifier
{
  return self->_scopedToItemIdentifier;
}

- (NSString)searchContainerItemIdentifier
{
  return self->_searchContainerItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchContainerItemIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedToItemIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_allowedUTTypes, 0);
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_alternateScopeToItemIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_scopedToItemIdentifierBundleId, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);

  objc_storeStrong((id *)&self->_scopeFragment, 0);
}

- (NSFileProviderSearchQuery)initWithSearchScope:(id)a3
{
  return [(NSFileProviderSearchQuery *)self initWithSearchScopedToItemIdentifier:a3 alternateItemIdentifier:0 providerDomainID:0 searchContainerItemIdentifier:0];
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 providerDomainID];

  v7 = [(NSFileProviderSearchQuery *)self initWithSearchScopedToItemIdentifier:v5 alternateItemIdentifier:0 providerDomainID:v6 searchContainerItemIdentifier:0];
  return v7;
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemID:(id)a3 alternateItemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"NSFileProviderSearchQuery.m" lineNumber:130 description:@"alternate item id defined without a main id"];
    }
    v10 = [v7 providerDomainID];
    v11 = [v8 providerDomainID];
    char v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      v13 = [v7 providerDomainID];
      uint64_t v14 = [v8 providerDomainID];
      char v15 = [v13 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v22 = [v7 providerDomainID];
        uint64_t v23 = objc_msgSend(v22, "fp_obfuscatedProviderDomainID");
        v24 = [v8 providerDomainID];
        v25 = objc_msgSend(v24, "fp_obfuscatedProviderDomainID");
        [v21 handleFailureInMethod:a2, self, @"NSFileProviderSearchQuery.m", 134, @"domain mismatch, expected %@, got %@", v23, v25 object file lineNumber description];
      }
    }
  }
  uint64_t v16 = [v7 identifier];
  v17 = [v8 identifier];
  v18 = [v7 providerDomainID];
  v19 = [(NSFileProviderSearchQuery *)self initWithSearchScopedToItemIdentifier:v16 alternateItemIdentifier:v17 providerDomainID:v18 searchContainerItemIdentifier:0];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSFileProviderSearchQuery *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSFileProviderSearchQuery *)self isEqualToFileProviderSearchQuery:v4];
  }

  return v5;
}

- (BOOL)isEqualToFileProviderSearchQuery:(id)a3
{
  id v5 = a3;
  int v6 = [(NSFileProviderSearchQuery *)self shouldPerformServerSearch];
  if (v6 == [v5 shouldPerformServerSearch])
  {
    int v7 = [(NSFileProviderSearchQuery *)self shouldPerformThirdPartyServerSearch];
    if (v7 == [v5 shouldPerformThirdPartyServerSearch])
    {
      int v8 = [(NSFileProviderSearchQuery *)self shouldPerformSemanticSearch];
      if (v8 == [v5 shouldPerformSemanticSearch])
      {
        int v9 = [(NSFileProviderSearchQuery *)self avoidCoreSpotlightSearch];
        if (v9 == [v5 avoidCoreSpotlightSearch])
        {
          unint64_t v10 = [(NSFileProviderSearchQuery *)self trashedItemsMembership];
          if (v10 == [v5 trashedItemsMembership])
          {
            v11 = [(NSFileProviderSearchQuery *)self filename];
            char v12 = [v5 filename];
            if (v11 != v12)
            {
              v3 = [(NSFileProviderSearchQuery *)self filename];
              v57 = [v5 filename];
              v58 = v3;
              if (!objc_msgSend(v3, "isEqual:"))
              {
                char v13 = 0;
                goto LABEL_44;
              }
            }
            char v15 = [(NSFileProviderSearchQuery *)self userQueryString];
            uint64_t v16 = [v5 userQueryString];
            if (v15 != v16)
            {
              v3 = [(NSFileProviderSearchQuery *)self userQueryString];
              v17 = [v5 userQueryString];
              if (![v3 isEqual:v17])
              {
                char v13 = 0;
LABEL_42:

LABEL_43:
                if (v11 == v12)
                {
LABEL_45:

                  goto LABEL_10;
                }
LABEL_44:

                goto LABEL_45;
              }
              v53 = v17;
            }
            uint64_t v18 = [(NSFileProviderSearchQuery *)self allowedContentTypes];
            uint64_t v55 = [v5 allowedContentTypes];
            v56 = (void *)v18;
            if (v18 != v55)
            {
              v19 = [(NSFileProviderSearchQuery *)self allowedContentTypes];
              v51 = [v5 allowedContentTypes];
              v52 = v19;
              if (!objc_msgSend(v19, "isEqual:"))
              {
                char v20 = v3;
                char v13 = 0;
                v21 = (void *)v55;
                uint64_t v22 = v56;
LABEL_40:

LABEL_41:
                v3 = v20;
                v17 = v53;
                if (v15 == v16) {
                  goto LABEL_43;
                }
                goto LABEL_42;
              }
            }
            v49 = v15;
            uint64_t v23 = [(NSFileProviderSearchQuery *)self scopeFragment];
            uint64_t v50 = [v5 scopeFragment];
            v54 = (void *)v23;
            if (v23 != v50)
            {
              v24 = [(NSFileProviderSearchQuery *)self scopeFragment];
              v47 = [v5 scopeFragment];
              v48 = v24;
              if (!objc_msgSend(v24, "isEqual:"))
              {
                char v20 = v3;
                char v13 = 0;
                v25 = (void *)v50;
LABEL_38:

LABEL_39:
                v21 = (void *)v55;
                uint64_t v22 = v56;
                char v15 = v49;
                if (v56 == (void *)v55) {
                  goto LABEL_41;
                }
                goto LABEL_40;
              }
            }
            v26 = [(NSFileProviderSearchQuery *)self providerDomainID];
            v27 = [v5 providerDomainID];
            if (v26 != v27)
            {
              uint64_t v28 = [(NSFileProviderSearchQuery *)self providerDomainID];
              v45 = [v5 providerDomainID];
              v46 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                char v13 = 0;
                goto LABEL_35;
              }
            }
            uint64_t v29 = [(NSFileProviderSearchQuery *)self keyboardLanguage];
            uint64_t v44 = [v5 keyboardLanguage];
            if (v29 == v44)
            {
              v39 = v27;
              v40 = v3;
            }
            else
            {
              v30 = [(NSFileProviderSearchQuery *)self keyboardLanguage];
              v41 = [v5 keyboardLanguage];
              v42 = v30;
              if (!objc_msgSend(v30, "isEqual:"))
              {
                char v13 = 0;
                v36 = (void *)v29;
                uint64_t v37 = (void *)v44;
                goto LABEL_33;
              }
              v39 = v27;
              v40 = v3;
            }
            uint64_t v43 = v29;
            v31 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
            uint64_t v32 = [v5 scopedToItemIdentifier];
            if (v31 == (void *)v32)
            {

              char v13 = 1;
            }
            else
            {
              long long v33 = (void *)v32;
              [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
              long long v34 = v38 = v26;
              long long v35 = [v5 scopedToItemIdentifier];
              char v13 = [v34 isEqual:v35];

              v26 = v38;
            }
            v36 = (void *)v29;
            uint64_t v37 = (void *)v44;
            v27 = v39;
            v3 = v40;
            if (v43 == v44)
            {
LABEL_34:

              if (v26 == v27)
              {
                char v20 = v3;
LABEL_37:

                v25 = (void *)v50;
                if (v54 == (void *)v50) {
                  goto LABEL_39;
                }
                goto LABEL_38;
              }
LABEL_35:
              char v20 = v3;

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
      }
    }
  }
  char v13 = 0;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  v2.i32[0] = *(_DWORD *)&self->_shouldPerformServerSearch;
  uint32x4_t v4 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v2)));
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  int8x16_t v6 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL);
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  int8x16_t v7 = (int8x16_t)vdupq_n_s64(0x1FuLL);
  int8x16_t v8 = (int8x16_t)vdupq_n_s64(0xDuLL);
  int8x16_t v21 = vbslq_s8((int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL), v8, v7);
  int8x16_t v20 = vbslq_s8(v6, v8, v7);
  unint64_t trashedItemsMembership = self->_trashedItemsMembership;
  NSUInteger v10 = [(NSString *)self->_filename hash];
  NSUInteger v11 = [(NSString *)self->_userQueryString hash];
  uint64_t v12 = [(NSSet *)self->_allowedContentTypes hash];
  NSUInteger v13 = [(NSString *)self->_scopeFragment hash];
  NSUInteger v14 = [(NSString *)self->_providerDomainID hash];
  NSUInteger v15 = [(NSString *)self->_keyboardLanguage hash];
  NSUInteger v16 = [(NSString *)self->_scopedToItemIdentifier hash];
  NSUInteger v17 = [(NSString *)self->_alternateScopeToItemIdentifier hash];
  int8x16_t v18 = veorq_s8(v20, v21);
  return *(void *)&veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)) ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v12 ^ v11 ^ v10 ^ trashedItemsMembership;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint32x4_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSFileProviderSearchQuery *)self keyboardLanguage];
  int8x16_t v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
  int8x16_t v8 = (void *)v4[15];
  v4[15] = v7;

  uint64_t v9 = [(NSFileProviderSearchQuery *)self alternateScopeToItemIdentifier];
  NSUInteger v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSFileProviderSearchQuery *)self searchContainerItemIdentifier];
  uint64_t v12 = (void *)v4[16];
  v4[16] = v11;

  NSUInteger v13 = [(NSFileProviderSearchQuery *)self filename];
  [v4 setFilename:v13];

  NSUInteger v14 = [(NSFileProviderSearchQuery *)self userQueryString];
  [v4 setUserQueryString:v14];

  NSUInteger v15 = [(NSFileProviderSearchQuery *)self allowedContentTypes];
  [v4 setAllowedContentTypes:v15];

  objc_msgSend(v4, "setShouldPerformServerSearch:", -[NSFileProviderSearchQuery shouldPerformServerSearch](self, "shouldPerformServerSearch"));
  objc_msgSend(v4, "setShouldPerformThirdPartyServerSearch:", -[NSFileProviderSearchQuery shouldPerformThirdPartyServerSearch](self, "shouldPerformThirdPartyServerSearch"));
  objc_msgSend(v4, "setShouldPerformSemanticSearch:", -[NSFileProviderSearchQuery shouldPerformSemanticSearch](self, "shouldPerformSemanticSearch"));
  objc_msgSend(v4, "setAvoidCoreSpotlightSearch:", -[NSFileProviderSearchQuery avoidCoreSpotlightSearch](self, "avoidCoreSpotlightSearch"));
  objc_msgSend(v4, "setTrashedItemsMembership:", -[NSFileProviderSearchQuery trashedItemsMembership](self, "trashedItemsMembership"));
  NSUInteger v16 = [(NSFileProviderSearchQuery *)self scopeFragment];
  [v4 setScopeFragment:v16];

  NSUInteger v17 = [(NSFileProviderSearchQuery *)self providerDomainID];
  [v4 setProviderDomainID:v17];

  int8x16_t v18 = [(NSFileProviderSearchQuery *)self spotlightQueryString];
  [v4 setSpotlightQueryString:v18];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderSearchQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NSFileProviderSearchQuery;
  id v5 = [(NSFileProviderSearchQuery *)&v41 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_filename"];
  uint64_t v7 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userQueryString"];
  uint64_t v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v8;

  NSUInteger v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v12 = [v10 setWithObjects:v11];
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_allowedContentTypes"];
  NSUInteger v14 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyboardLanguage"];
  NSUInteger v16 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scopedToItemIdentifier"];
  int8x16_t v18 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v17;

  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternateScopeToItemIdentifier"];
  int8x16_t v20 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v19;

  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_searchContainerItemIdentifier"];
  uint64_t v22 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v21;

  if (*((void *)v5 + 15) && *((void *)v5 + 16))
  {
    *((unsigned char *)v5 + 8) = [v4 decodeBoolForKey:@"_shouldPerformServerSearch"];
    *((unsigned char *)v5 + 9) = [v4 decodeBoolForKey:@"_shouldPerformThirdPartyServerSearch"];
    *((unsigned char *)v5 + 10) = [v4 decodeBoolForKey:@"_shouldPerformSemanticSearch"];
    *((unsigned char *)v5 + 11) = [v4 decodeBoolForKey:@"_avoidCoreSpotlightSearch"];
    *((void *)v5 + 11) = [v4 decodeIntegerForKey:@"_trashedItemsMembership"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scopeFragment"];
    v24 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_providerDomainID"];
    v26 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_spotlightQueryString"];
    uint64_t v28 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v27;

LABEL_5:
    uint64_t v29 = (NSFileProviderSearchQuery *)v5;
    goto LABEL_11;
  }
  v30 = fp_current_or_default_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    [(NSFileProviderSearchQuery(NSFileProviderSearch_Private) *)(uint64_t *)v5 + 15 initWithCoder:v30];
  }

  fp_simulate_crash(@"can't create instance from coder, required nonnull properties missing", v31, v32, v33, v34, v35, v36, v37, v40);
  v38 = fp_current_or_default_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
    -[NSFileProviderSearchQuery(NSFileProviderSearch_Private) initWithCoder:](v38);
  }

  uint64_t v29 = 0;
LABEL_11:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  filename = self->_filename;
  id v5 = a3;
  [v5 encodeObject:filename forKey:@"_filename"];
  [v5 encodeObject:self->_userQueryString forKey:@"_userQueryString"];
  [v5 encodeObject:self->_allowedContentTypes forKey:@"_allowedContentTypes"];
  [v5 encodeObject:self->_keyboardLanguage forKey:@"_keyboardLanguage"];
  [v5 encodeObject:self->_scopedToItemIdentifier forKey:@"_scopedToItemIdentifier"];
  [v5 encodeObject:self->_alternateScopeToItemIdentifier forKey:@"_alternateScopeToItemIdentifier"];
  [v5 encodeObject:self->_searchContainerItemIdentifier forKey:@"_searchContainerItemIdentifier"];
  [v5 encodeBool:self->_shouldPerformServerSearch forKey:@"_shouldPerformServerSearch"];
  [v5 encodeBool:self->_shouldPerformThirdPartyServerSearch forKey:@"_shouldPerformThirdPartyServerSearch"];
  [v5 encodeBool:self->_shouldPerformSemanticSearch forKey:@"_shouldPerformSemanticSearch"];
  [v5 encodeBool:self->_avoidCoreSpotlightSearch forKey:@"_avoidCoreSpotlightSearch"];
  [v5 encodeInteger:self->_trashedItemsMembership forKey:@"_trashedItemsMembership"];
  [v5 encodeObject:self->_scopeFragment forKey:@"_scopeFragment"];
  [v5 encodeObject:self->_providerDomainID forKey:@"_providerDomainID"];
  [v5 encodeObject:self->_spotlightQueryString forKey:@"_spotlightQueryString"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSFileProviderSearchQuery *)self searchContainerItemIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p id:%@", v4, self, v5];

  uint64_t v7 = [(NSFileProviderSearchQuery *)self filename];

  if (v7)
  {
    uint64_t v8 = [(NSFileProviderSearchQuery *)self filename];
    [v6 appendFormat:@" filename:'%@'", v8];
  }
  uint64_t v9 = [(NSFileProviderSearchQuery *)self allowedContentTypes];

  if (v9)
  {
    NSUInteger v10 = [(NSFileProviderSearchQuery *)self allowedContentTypes];
    [v6 appendFormat:@" uti(s):'%@'", v10];
  }
  uint64_t v11 = [(NSFileProviderSearchQuery *)self keyboardLanguage];

  if (v11)
  {
    uint64_t v12 = [(NSFileProviderSearchQuery *)self keyboardLanguage];
    [v6 appendFormat:@" kb language:'%@'", v12];
  }
  uint64_t v13 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
  int v14 = [v13 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

  if (v14)
  {
    [v6 appendString:@" scope:root"];
  }
  else
  {
    uint64_t v15 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
    [v6 appendFormat:@" scope:%@", v15];
  }
  NSUInteger v16 = [(NSFileProviderSearchQuery *)self providerDomainID];

  if (v16)
  {
    uint64_t v17 = [(NSFileProviderSearchQuery *)self providerDomainID];
    int8x16_t v18 = objc_msgSend(v17, "fp_obfuscatedFilename");
    [v6 appendFormat:@" provider:%@", v18];
  }
  objc_msgSend(v6, "appendFormat:", @" trashedItemsMembership:%ld", self->_trashedItemsMembership);
  [v6 appendString:@">"];

  return v6;
}

- (void)setSearchString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Deprecated %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setUserQueryString:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  userQueryString = self->_userQueryString;
  self->_userQueryString = v4;

  MEMORY[0x1F41817F8](v4, userQueryString);
}

- (void)setFilename:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  filename = self->_filename;
  self->_filename = v4;

  MEMORY[0x1F41817F8](v4, filename);
}

- (void)setContent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Deprecated %@", (uint8_t *)&v6, 0xCu);
  }
}

- (NSString)userQueryString
{
  return self->_userQueryString;
}

- (NSString)searchString
{
  return 0;
}

- (NSString)content
{
  return 0;
}

- (void)setAllowedContentTypes:(id)a3
{
  uint64_t v4 = (NSSet *)[a3 copy];
  allowedContentTypes = self->_allowedContentTypes;
  self->_allowedContentTypes = v4;

  cachedExtensions = self->_cachedExtensions;
  self->_cachedExtensions = 0;
}

- (void)setShouldPerformServerSearch:(BOOL)a3
{
  self->_shouldPerformServerSearch = a3;
}

- (BOOL)shouldPerformServerSearch
{
  return self->_shouldPerformServerSearch;
}

- (void)setShouldPerformThirdPartyServerSearch:(BOOL)a3
{
  self->_shouldPerformThirdPartyServerSearch = a3;
}

- (BOOL)shouldPerformThirdPartyServerSearch
{
  return self->_shouldPerformThirdPartyServerSearch;
}

- (void)setShouldPerformSemanticSearch:(BOOL)a3
{
  self->_shouldPerformSemanticSearch = a3;
}

- (BOOL)shouldPerformSemanticSearch
{
  return self->_shouldPerformSemanticSearch;
}

- (void)setAvoidCoreSpotlightSearch:(BOOL)a3
{
  self->_avoidCoreSpotlightSearch = a3;
}

- (BOOL)avoidCoreSpotlightSearch
{
  return self->_avoidCoreSpotlightSearch;
}

- (void)setKeyboardLanguage:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  keyboardLanguage = self->_keyboardLanguage;
  self->_keyboardLanguage = v4;

  MEMORY[0x1F41817F8](v4, keyboardLanguage);
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setAlternateScopeToItemIdentifier:(id)a3
{
}

- (NSString)alternateScopeToItemIdentifier
{
  return self->_alternateScopeToItemIdentifier;
}

- (void)setSearchContainerItemIdentifier:(id)a3
{
}

- (void)setTrashedItemsMembership:(unint64_t)a3
{
  self->_unint64_t trashedItemsMembership = a3;
}

- (unint64_t)trashedItemsMembership
{
  return self->_trashedItemsMembership;
}

- (void)setIncludesTrashedItems:(BOOL)a3
{
}

- (BOOL)includesTrashedItems
{
  return [(NSFileProviderSearchQuery *)self trashedItemsMembership] == 0;
}

- (id)toSpotlightQueryString
{
  return FPSpotlightQueryStringForSearchQuery(self, 1);
}

- (id)toSpotlightServerQueryString
{
  return FPSpotlightQueryStringForSearchQuery(self, 0);
}

- (NSString)scopeFragment
{
  return self->_scopeFragment;
}

- (void)setScopeFragment:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  scopeFragment = self->_scopeFragment;
  self->_scopeFragment = v4;

  MEMORY[0x1F41817F8](v4, scopeFragment);
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (void)setProviderDomainID:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  providerDomainID = self->_providerDomainID;
  self->_providerDomainID = v4;

  MEMORY[0x1F41817F8](v4, providerDomainID);
}

- (NSString)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void)setSpotlightQueryString:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  spotlightQueryString = self->_spotlightQueryString;
  self->_spotlightQueryString = v4;

  MEMORY[0x1F41817F8](v4, spotlightQueryString);
}

- (id)filenamePredicate
{
  uint64_t v4 = [(NSFileProviderSearchQuery *)self filename];
  id v5 = v4;
  if (v4 && [v4 length])
  {
    int v6 = [(NSFileProviderSearchQuery *)self keyboardLanguage];
    uint64_t v7 = FPSpotlightQueryStringForFilename(v5, v6);
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke;
    v12[3] = &unk_1E5AF4F00;
    id v13 = v7;
    SEL v14 = a2;
    v12[4] = self;
    id v9 = v7;
    NSUInteger v10 = [v8 predicateWithBlock:v12];
  }
  else
  {
    NSUInteger v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v10;
}

uint64_t __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSUInteger v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a1[6] object:a1[4] file:@"NSFileProviderSearchQuery.m" lineNumber:488 description:@"Unexpected kind of evaluated object."];
    }
  }
  uint64_t v7 = (void *)MEMORY[0x1A6248870]();
  uint64_t v8 = a1[5];
  uint64_t v17 = 0;
  int8x16_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v9 = (uint64_t (*)(uint64_t, const void *(*)(uint64_t, void *, uint64_t)))get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr;
  int8x16_t v20 = get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr;
  if (!get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr)
  {
    NSUInteger v10 = (void *)MobileSpotlightIndexLibrary();
    v18[3] = (uint64_t)dlsym(v10, "_MDCreateSimpleQueryEvaluator");
    get_MDCreateSimpleQueryEvaluatorSymbolLoc_ptr = (_UNKNOWN *)v18[3];
    id v9 = (uint64_t (*)(uint64_t, const void *(*)(uint64_t, void *, uint64_t)))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v9) {
    __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_1();
  }
  uint64_t v11 = v9(v8, _FPItemAttributeValueFunction);
  uint64_t v17 = 0;
  int8x16_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v12 = (uint64_t (*)(uint64_t, id))get_MDSimpleQueryObjectMatchesSymbolLoc_ptr;
  int8x16_t v20 = get_MDSimpleQueryObjectMatchesSymbolLoc_ptr;
  if (!get_MDSimpleQueryObjectMatchesSymbolLoc_ptr)
  {
    id v13 = (void *)MobileSpotlightIndexLibrary();
    v18[3] = (uint64_t)dlsym(v13, "_MDSimpleQueryObjectMatches");
    get_MDSimpleQueryObjectMatchesSymbolLoc_ptr = (_UNKNOWN *)v18[3];
    uint64_t v12 = (uint64_t (*)(uint64_t, id))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v12) {
    __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_2();
  }
  uint64_t v14 = v12(v11, v5);

  return v14;
}

- (id)allowedContentTypesPredicate
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSFileProviderSearchQuery *)self allowedPathExtensions];
  id v5 = self->_allowedUTTypes;
  if ([(NSSet *)v5 count])
  {
    uint64_t v6 = *MEMORY[0x1E4F44548];
    v16[0] = *MEMORY[0x1E4F44558];
    v16[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__NSFileProviderSearchQuery_Predicates__allowedContentTypesPredicate__block_invoke;
    v12[3] = &unk_1E5AF4F28;
    SEL v15 = a2;
    v12[4] = self;
    id v13 = v5;
    id v14 = v7;
    id v9 = v7;
    NSUInteger v10 = [v8 predicateWithBlock:v12];
  }
  else
  {
    NSUInteger v10 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v10;
}

uint64_t __69__NSFileProviderSearchQuery_Predicates__allowedContentTypesPredicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"NSFileProviderSearchQuery.m" lineNumber:517 description:@"Unexpected kind of evaluated object."];
    }
  }
  id v4 = [v3 contentType];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10, (void)v14);
        if ([v4 conformsToType:v10])
        {
          uint64_t v11 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

- (id)predicate
{
  id v4 = [(NSFileProviderSearchQuery *)self filenamePredicate];
  id v5 = [(NSFileProviderSearchQuery *)self allowedContentTypesPredicate];
  uint64_t v6 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
  unint64_t v7 = [(NSFileProviderSearchQuery *)self trashedItemsMembership];
  uint64_t v8 = [(NSFileProviderSearchQuery *)self scopeFragment];
  id v9 = [(NSFileProviderSearchQuery *)self providerDomainID];
  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__NSFileProviderSearchQuery_Predicates__predicate__block_invoke;
  v18[3] = &unk_1E5AF4F50;
  v18[4] = self;
  id v19 = v4;
  id v20 = v5;
  id v21 = v6;
  SEL v24 = a2;
  unint64_t v25 = v7;
  id v22 = v8;
  id v23 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v6;
  id v14 = v5;
  id v15 = v4;
  long long v16 = [v10 predicateWithBlock:v18];

  return v16;
}

uint64_t __50__NSFileProviderSearchQuery_Predicates__predicate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"NSFileProviderSearchQuery.m" lineNumber:547 description:@"Unexpected kind of evaluated object."];
    }
  }
  if ([*(id *)(a1 + 40) evaluateWithObject:v3]) {
    int v4 = [*(id *)(a1 + 48) evaluateWithObject:v3];
  }
  else {
    int v4 = 0;
  }
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    if (([v5 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) == 0)
    {
      uint64_t v6 = *(void **)(a1 + 56);
      if (v6)
      {
        if (([v6 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) == 0)
        {
          id v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"NSFileProviderSearchQuery.m" lineNumber:559 description:@"scopedToItemIdentifier is not supported in the NSFileProviderSearchQuery predicate."];
        }
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 88);
  if (v7 == 2)
  {
    if (v4) {
      int v4 = [v3 isTrashed];
    }
  }
  else if (v7 == 1 && v4)
  {
    int v4 = [v3 isTrashed] ^ 1;
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"NSFileProviderSearchQuery.m" lineNumber:579 description:@"scopeFragment is not supported in the NSFileProviderSearchQuery predicate."];
  }
  if (v4)
  {
    if (*(void *)(a1 + 72))
    {
      id v9 = [v3 providerDomainID];
      uint64_t v10 = [v9 isEqualToString:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)newSearchContainerItemIdentifier
{
  uint8x8_t v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = [v2 UUIDString];
  int v4 = [@"NSFileProviderSearchContainerItemIdentifier" stringByAppendingPathComponent:v3];

  return v4;
}

- (NSFileProviderSearchQuery)initWithSpotlightQueryString:(id)a3 searchScope:(id)a4 searchContainerItemIdentifier:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = [(NSFileProviderSearchQuery *)self init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_spotlightQueryString, a3);
    if (v10) {
      id v14 = v10;
    }
    else {
      id v14 = @"NSFileProviderRootContainerItemIdentifier";
    }
    objc_storeStrong((id *)&v13->_scopedToItemIdentifier, v14);
    if (v11) {
      id v15 = (NSString *)v11;
    }
    else {
      id v15 = (NSString *)[(id)objc_opt_class() newSearchContainerItemIdentifier];
    }
    searchContainerItemIdentifier = v13->_searchContainerItemIdentifier;
    v13->_searchContainerItemIdentifier = v15;
  }
  return v13;
}

- (NSFileProviderSearchQuery)initWithSearchScopedToItemIdentifier:(id)a3 alternateItemIdentifier:(id)a4 providerDomainID:(id)a5 searchContainerItemIdentifier:(id)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(NSFileProviderSearchQuery *)self init];
  id v15 = v14;
  if (v14)
  {
    if (v10) {
      long long v16 = v10;
    }
    else {
      long long v16 = @"NSFileProviderRootContainerItemIdentifier";
    }
    objc_storeStrong((id *)&v14->_scopedToItemIdentifier, v16);
    objc_storeStrong((id *)&v15->_alternateScopeToItemIdentifier, a4);
    if (v13) {
      long long v17 = (NSString *)v13;
    }
    else {
      long long v17 = (NSString *)[(id)objc_opt_class() newSearchContainerItemIdentifier];
    }
    searchContainerItemIdentifier = v15->_searchContainerItemIdentifier;
    v15->_searchContainerItemIdentifier = v17;

    objc_storeStrong((id *)&v15->_providerDomainID, a5);
  }

  return v15;
}

- (NSArray)csQueryScopes
{
  int v4 = [(NSFileProviderSearchQuery *)self scopedToItemIdentifier];
  id v5 = v4;
  if (v4 && ([v4 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) == 0)
  {
    uint64_t v7 = [(NSFileProviderSearchQuery *)self providerDomainID];
    if (!v7)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"NSFileProviderSearchQuery.m", 634, @"If a scopedToItemIdentifier is set, providerDomainID must be set as well" object file lineNumber description];
    }
    uint64_t v8 = [(NSFileProviderSearchQuery *)self alternateScopeToItemIdentifier];
    if ([v8 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
    {
      uint64_t v6 = 0;
    }
    else
    {
      if (!self->_bundleIdentifier)
      {
        id v20 = 0;
        id v9 = +[FPProviderDomain providerDomainWithID:v7 cachePolicy:1 error:&v20];
        id v10 = v20;
        id v11 = self;
        objc_sync_enter(v11);
        id v12 = [v9 topLevelBundleIdentifier];
        id v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          objc_msgSend(v7, "fp_toProviderID");
          id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        bundleIdentifier = self->_bundleIdentifier;
        self->_bundleIdentifier = v14;

        objc_sync_exit(v11);
      }
      uint64_t v6 = objc_opt_new();
      long long v16 = FPScopedToIdentifierFragment(self->_bundleIdentifier, v7, v5);
      [v6 addObject:v16];

      if (v8)
      {
        long long v17 = FPScopedToIdentifierFragment(self->_bundleIdentifier, v7, v8);
        [v6 addObject:v17];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

void __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "MDSimpleQueryEvaluator *__MDCreateSimpleQueryEvaluator(CFStringRef, MDSimpleQueryEvaluatorGetValueFunction)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSFileProviderSearchQuery.m", 28, @"%s", dlerror());

  __break(1u);
}

void __58__NSFileProviderSearchQuery_Predicates__filenamePredicate__block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL __MDSimpleQueryObjectMatches(MDSimpleQueryEvaluator *, void *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSFileProviderSearchQuery.m", 29, @"%s", dlerror());

  __break(1u);
}

@end