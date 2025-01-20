@interface BCSLinkItemModel
+ (BOOL)supportsSecureCoding;
+ (id)linkItemModelsFromLinkJSONObj:(id)a3;
+ (id)linkItemModelsFromRecords:(id)a3;
- (BCSLinkItemModel)initWithCoder:(id)a3;
- (BCSLinkItemModel)initWithLinkMessage:(id)a3 bucketID:(id)a4;
- (BOOL)isPoweredBy;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSDictionary)mapIconStyleAttributes;
- (NSNumber)mapItemMUID;
- (NSObject)itemIdentifier;
- (NSString)bundleID;
- (NSString)debugDescription;
- (NSString)fullHash;
- (NSString)heroImageURLString;
- (NSString)iconImageURLString;
- (NSURL)linkURL;
- (NSURL)redirectURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithLinkURL:(void *)a3 bundleID:(void *)a4 heroImageURLString:(void *)a5 iconImageURLString:(void *)a6 redirectURL:(uint64_t)a7 action:(void *)a8 mapIconStyleAttributes:(void *)a9 mapItemMUID:(void *)a10 businessLinkContentItemModels:(char)a11 isPoweredBy:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)action;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)_linkItemIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSLinkItemModel

- (BCSLinkItemModel)initWithLinkMessage:(id)a3 bucketID:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v6 = [v4 businessLinkContents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[BCSBusinessLinkContentItemModel alloc] initWithBusinessLinkContent:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v8);
  }

  v12 = [v4 muid];

  if (!v12) {
    goto LABEL_13;
  }
  *__error() = 0;
  id v13 = [v4 muid];
  unint64_t v14 = strtoull((const char *)[v13 UTF8String], 0, 0);

  if (*__error())
  {
    v15 = ABSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v33 = *__error();
      *(_DWORD *)buf = 67109120;
      int v52 = v33;
      _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "BCSLinkItemModel: mapItemMUID could not be converted to a number: %d", buf, 8u);
    }

LABEL_13:
    v37 = 0;
    goto LABEL_15;
  }
  v37 = [NSNumber numberWithUnsignedLongLong:v14];
LABEL_15:
  v16 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v17 = [v4 categoryStyleAttributes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v40 + 1) + 8 * j) dictionaryRepresentation];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v19);
  }

  if ([v16 count])
  {
    v48 = @"attribute";
    v49 = v16;
    v36 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  }
  else
  {
    v36 = 0;
  }
  v23 = NSURL;
  v35 = [v4 link];
  v34 = objc_msgSend(v23, "URLWithString:");
  v24 = [v4 bundleId];
  v25 = [v4 heroImage];
  v26 = [v4 iconImage];
  v27 = NSURL;
  v28 = [v4 redirectUrl];
  v29 = [v27 URLWithString:v28];
  int v30 = [v4 action];
  int v31 = [v4 hasIsPoweredBy];
  if (v31) {
    LOBYTE(v31) = [v4 isPoweredBy];
  }
  v39 = (BCSLinkItemModel *)-[BCSLinkItemModel initWithLinkURL:bundleID:heroImageURLString:iconImageURLString:redirectURL:action:mapIconStyleAttributes:mapItemMUID:businessLinkContentItemModels:isPoweredBy:](self, v34, v24, v25, v26, v29, v30, v36, v37, v5, v31);

  return v39;
}

+ (id)linkItemModelsFromLinkJSONObj:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"records"];
  id v22 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = @"fields";
    uint64_t v7 = *(void *)v28;
    uint64_t v23 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v5;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v27 + 1) + 8 * v8) objectForKeyedSubscript:v6];
        v10 = [v9 objectForKeyedSubscript:@"message"];
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = v6;
          v12 = [v10 objectForKeyedSubscript:@"value"];
          id v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
          unint64_t v14 = [[BCSBusinessLinkMessage alloc] initWithData:v13];
          v15 = [BCSLinkItemModel alloc];
          v16 = NSString;
          v17 = [(BCSBusinessLinkMessage *)v14 link];
          uint64_t v18 = [v16 stringWithFormat:@"%@", v17];
          uint64_t v19 = [(BCSLinkItemModel *)v15 initWithLinkMessage:v14 bucketID:v18];

          if (v19)
          {
            [v22 addObject:v19];
          }
          else
          {
            uint64_t v20 = ABSLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_2154F4000, v20, OS_LOG_TYPE_ERROR, "BCSLinkItemModelFromLinkJSONObj: LinkItemModel object didn't initialize correctly", buf, 2u);
            }
          }
          v6 = v11;

          uint64_t v7 = v23;
          uint64_t v5 = v24;
        }
        else
        {
          v12 = ABSLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2154F4000, v12, OS_LOG_TYPE_ERROR, "BCSLinkItemFromLinkJSONObj: Message object is not a dictionary or not initialized", buf, 2u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  return v22;
}

+ (id)linkItemModelsFromRecords:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v21 + 1) + 8 * v8) objectForKeyedSubscript:@"message"];
        v10 = [[BCSBusinessLinkMessage alloc] initWithData:v9];
        v11 = [BCSLinkItemModel alloc];
        v12 = NSString;
        id v13 = [(BCSBusinessLinkMessage *)v10 link];
        unint64_t v14 = [v12 stringWithFormat:@"%@", v13];
        v15 = [(BCSLinkItemModel *)v11 initWithLinkMessage:v10 bucketID:v14];

        if (v15)
        {
          [v4 addObject:v15];
        }
        else
        {
          v16 = ABSLogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "BCSLinkItemModelFromRecords: LinkItemModel object didn't initialize correctly", buf, 2u);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v17 = (void *)[v4 copy];

  return v17;
}

- (id)initWithLinkURL:(void *)a3 bundleID:(void *)a4 heroImageURLString:(void *)a5 iconImageURLString:(void *)a6 redirectURL:(uint64_t)a7 action:(void *)a8 mapIconStyleAttributes:(void *)a9 mapItemMUID:(void *)a10 businessLinkContentItemModels:(char)a11 isPoweredBy:
{
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v40 = a6;
  id v42 = a8;
  id v41 = a9;
  id v22 = a10;
  if (a1
    && (v43.receiver = a1,
        v43.super_class = (Class)BCSLinkItemModel,
        (a1 = objc_msgSendSuper2(&v43, sel_init)) != 0))
  {
    long long v23 = v18;
    uint64_t v24 = [v18 copy];
    v25 = (void *)*((void *)a1 + 1);
    *((void *)a1 + 1) = v24;

    uint64_t v26 = v19;
    uint64_t v27 = [v19 copy];
    long long v28 = (void *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v27;

    uint64_t v29 = [v20 copy];
    long long v30 = (void *)*((void *)a1 + 3);
    *((void *)a1 + 3) = v29;

    uint64_t v31 = [v21 copy];
    uint64_t v32 = (void *)*((void *)a1 + 4);
    *((void *)a1 + 4) = v31;

    int v33 = v40;
    uint64_t v34 = [v40 copy];
    v35 = (void *)*((void *)a1 + 5);
    *((void *)a1 + 5) = v34;

    uint64_t v36 = 1;
    if (a7 == 2) {
      uint64_t v36 = 2;
    }
    if (a7 == 3) {
      uint64_t v36 = 3;
    }
    *((void *)a1 + 6) = v36;
    objc_storeStrong((id *)a1 + 9, a8);
    objc_storeStrong((id *)a1 + 10, a9);
    uint64_t v37 = [v22 copy];
    v38 = (void *)*((void *)a1 + 11);
    *((void *)a1 + 11) = v37;

    *((unsigned char *)a1 + 64) = a11;
  }
  else
  {
    long long v23 = v18;
    uint64_t v26 = v19;
    int v33 = v40;
  }

  return a1;
}

- (NSString)debugDescription
{
  return (NSString *)[(BCSLinkItemModel *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(BCSLinkItemModel *)self linkURL];
    uint64_t v7 = [v6 copyWithZone:a3];
    uint64_t v8 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v7;

    uint64_t v9 = [(BCSLinkItemModel *)self bundleID];
    uint64_t v10 = [v9 copyWithZone:a3];
    v11 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v10;

    v12 = [(BCSLinkItemModel *)self heroImageURLString];
    uint64_t v13 = [v12 copyWithZone:a3];
    unint64_t v14 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v13;

    v15 = [(BCSLinkItemModel *)self iconImageURLString];
    uint64_t v16 = [v15 copyWithZone:a3];
    v17 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v16;

    id v18 = [(BCSLinkItemModel *)self redirectURL];
    uint64_t v19 = [v18 copyWithZone:a3];
    id v20 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v19;

    id v21 = [(BCSLinkItemModel *)self mapIconStyleAttributes];
    uint64_t v22 = [v21 copyWithZone:a3];
    long long v23 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v22;

    uint64_t v24 = [(BCSLinkItemModel *)self mapItemMUID];
    uint64_t v25 = [v24 copyWithZone:a3];
    uint64_t v26 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v25;

    *(void *)(v5 + 48) = [(BCSLinkItemModel *)self action];
    if (self) {
      businessLinkContentItemModels = self->_businessLinkContentItemModels;
    }
    else {
      businessLinkContentItemModels = 0;
    }
    long long v28 = businessLinkContentItemModels;
    uint64_t v29 = [(NSArray *)v28 copyWithZone:a3];
    long long v30 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v29;

    *(unsigned char *)(v5 + 64) = [(BCSLinkItemModel *)self isPoweredBy];
    if (self) {
      debugInfo = self->_debugInfo;
    }
    else {
      debugInfo = 0;
    }
    objc_storeStrong((id *)(v5 + 96), debugInfo);
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  linkURL = self->_linkURL;
  id v5 = a3;
  [v5 encodeObject:linkURL forKey:@"kBCSLinkItemModelLinkURLCodingKey"];
  [v5 encodeObject:self->_bundleID forKey:@"kBCSLinkItemModelBundleIDCodingKey"];
  [v5 encodeObject:self->_heroImageURLString forKey:@"kBCSLinkItemModelHeroImageURLStringCodingKey"];
  [v5 encodeObject:self->_iconImageURLString forKey:@"kBCSLinkItemModelIconImageURLStringCodingKey"];
  [v5 encodeObject:self->_redirectURL forKey:@"kBCSLinkItemModelRedirectURLCodingKey"];
  [v5 encodeInteger:self->_action forKey:@"kBCSLinkItemModelActionCodingKey"];
  [v5 encodeObject:self->_businessLinkContentItemModels forKey:@"kBCSLinkItemModelContentItemCodingKey"];
  [v5 encodeBool:self->_isPoweredBy forKey:@"kBCSLinkItemModelIsPoweredByCodingKey"];
  [v5 encodeObject:self->_mapIconStyleAttributes forKey:@"kBCSLinkItemModelIconStyleAttributesCodingKey"];
  [v5 encodeObject:self->_mapItemMUID forKey:@"kBCSLinkItemModelMapItemMUIDCodingKey"];
  [v5 encodeObject:self->_debugInfo forKey:@"kBCSLinkItemModelDebugInfoCodingKey"];
}

- (BCSLinkItemModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BCSLinkItemModel;
  id v5 = [(BCSLinkItemModel *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelLinkURLCodingKey"];
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelBundleIDCodingKey"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelHeroImageURLStringCodingKey"];
    heroImageURLString = v5->_heroImageURLString;
    v5->_heroImageURLString = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelIconImageURLStringCodingKey"];
    iconImageURLString = v5->_iconImageURLString;
    v5->_iconImageURLString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelRedirectURLCodingKey"];
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = (NSURL *)v14;

    v5->_action = [v4 decodeIntegerForKey:@"kBCSLinkItemModelActionCodingKey"];
    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kBCSLinkItemModelContentItemCodingKey"];
    businessLinkContentItemModels = v5->_businessLinkContentItemModels;
    v5->_businessLinkContentItemModels = (NSArray *)v19;

    v5->_isPoweredBy = [v4 decodeBoolForKey:@"kBCSLinkItemModelIsPoweredByCodingKey"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSLinkItemModelMapItemMUIDCodingKey"];
    mapItemMUID = v5->_mapItemMUID;
    v5->_mapItemMUID = (NSNumber *)v21;

    long long v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"kBCSLinkItemModelIconStyleAttributesCodingKey"];
    mapIconStyleAttributes = v5->_mapIconStyleAttributes;
    v5->_mapIconStyleAttributes = (NSDictionary *)v28;

    long long v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"kBCSLinkItemModelDebugInfoCodingKey"];
    debugInfo = v5->_debugInfo;
    v5->_debugInfo = (NSDictionary *)v33;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fullHash
{
  uint64_t v2 = -[BCSLinkItemModel _linkItemIdentifier](self);
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)[*(id *)(v2 + 8) copy];
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)_linkItemIdentifier
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[7];
    if (!v3)
    {
      id v4 = [a1 linkURL];
      uint64_t v5 = +[BCSLinkItemIdentifier identifierWithNormalizedURL:]((uint64_t)BCSLinkItemIdentifier, v4);
      uint64_t v6 = (void *)v2[7];
      v2[7] = v5;

      id v3 = (void *)v2[7];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSObject)itemIdentifier
{
  uint64_t v2 = -[BCSLinkItemModel _linkItemIdentifier](self);
  id v3 = [v2 itemIdentifier];

  return v3;
}

- (int64_t)truncatedHash
{
  uint64_t v2 = -[BCSLinkItemModel _linkItemIdentifier](self);
  int64_t v3 = [v2 truncatedHash];

  return v3;
}

- (int64_t)type
{
  uint64_t v2 = -[BCSLinkItemModel _linkItemIdentifier](self);
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BCSLinkItemModel _linkItemIdentifier](self);
  char v6 = [v5 matchesItemIdentifying:v4];

  return v6;
}

- (id)succinctDescription
{
  uint64_t v2 = [(BCSLinkItemModel *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_linkURL withName:@"linkURL" skipIfNil:1];
  [v3 appendString:self->_bundleID withName:@"bundleID"];
  uint64_t v5 = [(BCSLinkItemModel *)self fullHash];
  [v3 appendString:v5 withName:@"fullHash"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(BCSLinkItemModel *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  char v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__BCSLinkItemModel_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264248948;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __58__BCSLinkItemModel_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"linkURL" skipIfNil:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"bundleID"];
  int64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) fullHash];
  [v3 appendString:v4 withName:@"fullHash"];

  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"heroImageURLString"];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"iconImageURLString"];
  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"redirectURL"];
  unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48) - 1;
  if (v8 > 2) {
    uint64_t v9 = @"???";
  }
  else {
    uint64_t v9 = off_26424A130[v8];
  }
  id v10 = (id)[*(id *)(a1 + 32) appendObject:v9 withName:@"action"];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 88);
  }
  else {
    uint64_t v12 = 0;
  }
  [*(id *)(a1 + 32) appendArraySection:v12 withName:@"businessContentItemModels" skipIfEmpty:0];
  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 64) withName:@"isPoweredBy"];
  id v14 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"mapItemMUID"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"mapIconStyleAttributes"];
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)heroImageURLString
{
  return self->_heroImageURLString;
}

- (NSString)iconImageURLString
{
  return self->_iconImageURLString;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)isPoweredBy
{
  return self->_isPoweredBy;
}

- (NSNumber)mapItemMUID
{
  return self->_mapItemMUID;
}

- (NSDictionary)mapIconStyleAttributes
{
  return self->_mapIconStyleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_businessLinkContentItemModels, 0);
  objc_storeStrong((id *)&self->_mapItemMUID, 0);
  objc_storeStrong((id *)&self->_mapIconStyleAttributes, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_iconImageURLString, 0);
  objc_storeStrong((id *)&self->_heroImageURLString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_linkURL, 0);
}

@end