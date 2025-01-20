@interface BCSLinkItem
+ (id)linkItemsFromLinkItemModels:(id)a3;
- (BCSBusinessLinkContentItem)businessLinkContentItem;
- (BCSLinkItem)initWithLinkItemModel:(id)a3 expirationDate:(id)a4 localeHelper:(id)a5;
- (BCSLinkItem)initWithLinkItemModel:(id)a3 localeHelper:(id)a4;
- (BCSLinkItemModel)model;
- (BCSLocaleHelperProtocol)localeHelper;
- (BOOL)isPoweredBy;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSDictionary)debugInfo;
- (NSDictionary)mapIconStyleAttributes;
- (NSNumber)mapItemMUID;
- (NSString)bundleID;
- (NSString)debugDescription;
- (NSString)fullHash;
- (NSString)heroImageURLString;
- (NSString)iconImageURLString;
- (NSString)language;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)heroImageURL;
- (NSURL)iconImageURL;
- (NSURL)linkURL;
- (NSURL)redirectURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)heroImageURLForSpecifier:(id *)a3;
- (id)iconImageURLForSpecifier:(id *)a3;
- (id)itemIdentifier;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)action;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)setDebugInfo:(id)a3;
@end

@implementation BCSLinkItem

+ (id)linkItemsFromLinkItemModels:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [BCSLinkItem alloc];
        v12 = objc_alloc_init(BCSLocaleHelper);
        v13 = -[BCSLinkItem initWithLinkItemModel:localeHelper:](v11, "initWithLinkItemModel:localeHelper:", v10, v12, (void)v16);
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v4 copy];

  return v14;
}

- (BCSLinkItem)initWithLinkItemModel:(id)a3 localeHelper:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 distantPast];
  uint64_t v10 = [(BCSLinkItem *)self initWithLinkItemModel:v8 expirationDate:v9 localeHelper:v7];

  return v10;
}

- (BCSLinkItem)initWithLinkItemModel:(id)a3 expirationDate:(id)a4 localeHelper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCSLinkItem;
  v12 = [(BCSItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeStrong((id *)&v13->_localeHelper, a5);
    [(BCSItem *)v13 setExpirationDate:v10];
  }

  return v13;
}

- (NSString)debugDescription
{
  return (NSString *)[(BCSLinkItem *)self descriptionWithMultilinePrefix:0];
}

- (NSDictionary)debugInfo
{
  v2 = [(BCSLinkItem *)self model];
  id v3 = v2;
  if (v2) {
    v2 = (void *)v2[12];
  }
  v4 = v2;

  return v4;
}

- (void)setDebugInfo:(id)a3
{
  id v4 = a3;
  selfa = [(BCSLinkItem *)self model];
  if (selfa) {
    objc_setProperty_nonatomic_copy(selfa, v5, v4, 96);
  }
}

- (id)heroImageURLForSpecifier:(id *)a3
{
  uint64_t v4 = NSURL;
  id v5 = [(BCSLinkItem *)self heroImageURLString];
  long long v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  id v7 = +[NSURL bcs_templatedImageURLWithString:imageSpecifier:](v4, v5, v9);

  return v7;
}

- (id)iconImageURLForSpecifier:(id *)a3
{
  uint64_t v4 = NSURL;
  id v5 = [(BCSLinkItem *)self iconImageURLString];
  long long v6 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  id v7 = +[NSURL bcs_templatedImageURLWithString:imageSpecifier:](v4, v5, v9);

  return v7;
}

- (id)itemIdentifier
{
  v2 = [(BCSLinkItem *)self model];
  id v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSLinkItem *)self model];
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (BCSBusinessLinkContentItem)businessLinkContentItem
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x263EF8340];
  int64_t v3 = [(BCSLinkItem *)self localeHelper];
  id v4 = [v3 currentLocale];
  id v5 = -[NSLocale language](v4);
  if (v2) {
    cachedContentItemLanguage = v2->_cachedContentItemLanguage;
  }
  else {
    cachedContentItemLanguage = 0;
  }
  id v7 = cachedContentItemLanguage;
  if ([v5 isEqualToString:v7])
  {
    if (v2) {
      cachedContentItem = v2->_cachedContentItem;
    }
    else {
      cachedContentItem = 0;
    }

    if (cachedContentItem)
    {
      if (v2) {
        id v9 = v2->_cachedContentItem;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;
      goto LABEL_45;
    }
  }
  else
  {
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  if (v2)
  {
    id v11 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v12 = [(BCSLinkItem *)v2 model];
    v13 = (void *)v12;
    if (v12) {
      v14 = *(void **)(v12 + 88);
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v47 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = -[BCSBusinessLinkContentItem initWithBusinessLinkContentItemModel:]((id *)[BCSBusinessLinkContentItem alloc], *(void **)(*((void *)&v46 + 1) + 8 * i));
          [v11 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v17);
    }

    uint64_t v21 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id obj = v21;
    v41 = 0;
    uint64_t v24 = *(void *)v43;
LABEL_24:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v43 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v42 + 1) + 8 * v25);
      v27 = objc_msgSend(v26, "language", obj);
      v28 = v2;
      v29 = [(BCSLinkItem *)v2 localeHelper];
      v30 = [v29 currentLocale];
      v31 = -[NSLocale language](v30);
      char v32 = [v27 isEqualToString:v31];

      if (v32) {
        break;
      }
      if ([v26 isDefault])
      {
        id v33 = v26;

        v41 = v33;
      }
      v2 = v28;
      if (v23 == ++v25)
      {
        uint64_t v21 = obj;
        uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v23) {
          goto LABEL_24;
        }
        goto LABEL_36;
      }
    }
    id v34 = v26;

    v2 = v28;
    if (v34) {
      goto LABEL_38;
    }
  }
  else
  {
    v41 = 0;
LABEL_36:
  }
  id v34 = v41;
  v41 = v34;
  if (v34)
  {
LABEL_38:
    if (v2) {
      objc_storeStrong((id *)&v2->_cachedContentItem, v34);
    }
    v35 = [(BCSLinkItem *)v2 localeHelper];
    v36 = [v35 currentLocale];
    v37 = -[NSLocale language](v36);
    if (v2) {
      objc_storeStrong((id *)&v2->_cachedContentItemLanguage, v37);
    }

    v38 = v41;
  }
  else
  {
    v38 = 0;
  }
  id v10 = (BCSBusinessLinkContentItem *)v34;

LABEL_45:

  return v10;
}

- (NSURL)linkURL
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 linkURL];

  return (NSURL *)v3;
}

- (NSString)fullHash
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 fullHash];

  return (NSString *)v3;
}

- (NSString)bundleID
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (NSString)heroImageURLString
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 heroImageURLString];

  return (NSString *)v3;
}

- (NSString)iconImageURLString
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 iconImageURLString];

  return (NSString *)v3;
}

- (NSURL)redirectURL
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 redirectURL];

  return (NSURL *)v3;
}

- (int64_t)action
{
  v2 = [(BCSLinkItem *)self model];
  int64_t v3 = [v2 action];

  return v3;
}

- (BOOL)isPoweredBy
{
  v2 = [(BCSLinkItem *)self model];
  char v3 = [v2 isPoweredBy];

  return v3;
}

- (NSDictionary)mapIconStyleAttributes
{
  v2 = [(BCSLinkItem *)self model];
  char v3 = [v2 mapIconStyleAttributes];

  return (NSDictionary *)v3;
}

- (NSNumber)mapItemMUID
{
  v2 = [(BCSLinkItem *)self model];
  char v3 = [v2 mapItemMUID];

  return (NSNumber *)v3;
}

- (NSString)title
{
  v2 = [(BCSLinkItem *)self businessLinkContentItem];
  char v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  v2 = [(BCSLinkItem *)self businessLinkContentItem];
  char v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (NSString)language
{
  v2 = [(BCSLinkItem *)self businessLinkContentItem];
  char v3 = [v2 language];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = [(BCSLinkItemModel *)self->_model copyWithZone:a3];
    id v7 = (void *)v5[2];
    v5[2] = v6;

    id v8 = [(BCSItem *)self expirationDate];
    id v9 = (void *)[v8 copyWithZone:a3];
    [v5 setExpirationDate:v9];

    uint64_t v10 = [(BCSLinkItem *)self localeHelper];
    id v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (id)succinctDescription
{
  v2 = [(BCSLinkItem *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  char v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BCSLinkItem *)self model];
  id v5 = (id)[v3 appendObject:v4 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(BCSLinkItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(BCSLinkItem *)self succinctDescriptionBuilder];
  id v5 = [(BCSLinkItem *)self debugInfo];
  id v6 = (id)[v4 appendObject:v5 withName:@"Debug Info"];

  id v7 = [(BCSItem *)self expirationDate];
  id v8 = (id)[v4 appendObject:v7 withName:@"expirationDate"];

  id v9 = [(BCSLinkItem *)self localeHelper];
  id v10 = (id)[v4 appendObject:v9 withName:@"localeHelper"];

  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(BCSLinkItem *)self debugInfo];
    int v14 = 138412290;
    id v15 = v12;
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "Debug Info: %@", (uint8_t *)&v14, 0xCu);
  }

  return v4;
}

- (BCSLocaleHelperProtocol)localeHelper
{
  return self->_localeHelper;
}

- (BCSLinkItemModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContentItem, 0);
  objc_storeStrong((id *)&self->_cachedContentItemLanguage, 0);
  objc_storeStrong((id *)&self->_localeHelper, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

- (NSURL)heroImageURL
{
  int64x2_t v4 = vdupq_n_s64(0x400uLL);
  id v5 = "bb";
  id v6 = "png";
  v2 = [(BCSLinkItem *)self heroImageURLForSpecifier:&v4];

  return (NSURL *)v2;
}

- (NSURL)iconImageURL
{
  int64x2_t v4 = vdupq_n_s64(0xB4uLL);
  id v5 = "bb";
  id v6 = "png";
  v2 = [(BCSLinkItem *)self iconImageURLForSpecifier:&v4];

  return (NSURL *)v2;
}

@end