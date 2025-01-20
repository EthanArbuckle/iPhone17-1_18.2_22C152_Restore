@interface GKPlayerActivityRelationshipIcon
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationshipIcon)initWithDictionary:(id)a3;
- (NSNumber)height;
- (NSNumber)width;
- (NSString)url;
- (int64_t)platform;
- (void)setHeight:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation GKPlayerActivityRelationshipIcon

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GKPlayerActivityRelationshipIcon_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_365 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_365, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_364;

  return v2;
}

void __59__GKPlayerActivityRelationshipIcon_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipIcon;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"url";
  v7[0] = objc_opt_class();
  v6[1] = @"platform";
  v7[1] = objc_opt_class();
  v6[2] = @"width";
  v7[2] = objc_opt_class();
  v6[3] = @"height";
  v7[3] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_364;
  secureCodedPropertyKeys_sSecureCodedKeys_364 = (uint64_t)v2;
}

- (GKPlayerActivityRelationshipIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipIcon;
  objc_super v5 = [(GKPlayerActivityRelationshipIcon *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    [(GKPlayerActivityRelationshipIcon *)v5 setUrl:v6];

    v7 = [v4 objectForKeyedSubscript:@"platform"];
    [(GKPlayerActivityRelationshipIcon *)v5 setPlatform:+[GKGameDescriptor gamePlatformFromServerGameDescriptorString:v7]];

    v8 = [v4 objectForKeyedSubscript:@"width"];
    [(GKPlayerActivityRelationshipIcon *)v5 setWidth:v8];

    v9 = [v4 objectForKeyedSubscript:@"height"];
    [(GKPlayerActivityRelationshipIcon *)v5 setHeight:v9];
  }
  return v5;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  self->_width = (NSNumber *)a3;
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  self->_height = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

@end