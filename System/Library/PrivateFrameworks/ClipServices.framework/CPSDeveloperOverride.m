@interface CPSDeveloperOverride
+ (BOOL)hasOverride;
+ (BOOL)supportsSecureCoding;
+ (id)allOverrides;
+ (id)overrideForURL:(id)a3;
+ (unint64_t)_indexOf:(id)a3;
+ (void)loadAllOverridesIfNeeded;
+ (void)persistAllOverrides;
- (BOOL)isComplete;
- (BOOL)isValid;
- (CGImage)heroImage;
- (CPSDeveloperOverride)initWithCoder:(id)a3;
- (CPSDeveloperOverride)initWithDictionary:(id)a3;
- (NSString)clipBundleID;
- (NSString)invocationURL;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)heroImageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)action;
- (void)clear;
- (void)encodeWithCoder:(id)a3;
- (void)heroImageURL;
- (void)save;
- (void)setAction:(int64_t)a3;
- (void)setClipBundleID:(id)a3;
- (void)setHeroImage:(CGImage *)a3;
- (void)setInvocationURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CPSDeveloperOverride

- (CPSDeveloperOverride)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPSDeveloperOverride;
  v5 = [(CPSDeveloperOverride *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_stringForKey:", @"invocationURL");
    invocationURL = v5->_invocationURL;
    v5->_invocationURL = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "safari_stringForKey:", @"clipBundleID");
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "safari_stringForKey:", @"title");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "safari_stringForKey:", @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    v14 = objc_msgSend(v4, "safari_numberForKey:", @"action");
    v5->_action = [v14 integerValue];

    v15 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  invocationURL = self->_invocationURL;
  v7[0] = @"invocationURL";
  v7[1] = @"clipBundleID";
  long long v9 = *(_OWORD *)&self->_clipBundleID;
  v7[2] = @"title";
  v7[3] = @"subtitle";
  int64_t action = self->_action;
  subtitle = self->_subtitle;
  v7[4] = @"action";
  uint64_t v8 = invocationURL;
  id v4 = [NSNumber numberWithInteger:action];
  v11 = v4;
  v5 = [NSDictionary dictionaryWithObjects:&v8 forKeys:v7 count:5];

  return v5;
}

+ (BOOL)hasOverride
{
  return [(id)allOverrides count] != 0;
}

+ (void)loadAllOverridesIfNeeded
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!allOverrides)
  {
    uint64_t v2 = [MEMORY[0x263EFF980] array];
    v3 = (void *)allOverrides;
    allOverrides = v2;

    id v4 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
    v5 = [v4 arrayForKey:@"DeveloperOverrides"];
    uint64_t v6 = v5;
    if (v5)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = [[CPSDeveloperOverride alloc] initWithDictionary:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
            [(id)allOverrides addObject:v11];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

+ (id)allOverrides
{
  [a1 loadAllOverridesIfNeeded];
  uint64_t v2 = (void *)allOverrides;

  return v2;
}

+ (id)overrideForURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 loadAllOverridesIfNeeded];
  v5 = [v4 absoluteString];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)allOverrides;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "invocationURL", (void)v14);
        if ([v5 hasPrefix:v11])
        {
          char v12 = [v10 isValid];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
LABEL_12:

  return v7;
}

+ (void)persistAllOverrides
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)allOverrides;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "dictionaryRepresentation", (void)v10);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA40], "cps_clipServicesDefaults");
  [v9 setObject:v2 forKey:@"DeveloperOverrides"];
  [v9 synchronize];
}

+ (unint64_t)_indexOf:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() loadAllOverridesIfNeeded];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = (void *)allOverrides;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__CPSDeveloperOverride__indexOf___block_invoke;
  v8[3] = &unk_26424FBD8;
  id v5 = v3;
  id v9 = v5;
  long long v10 = &v11;
  [v4 enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __33__CPSDeveloperOverride__indexOf___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 invocationURL];
  uint64_t v8 = [*(id *)(a1 + 32) invocationURL];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSURL)heroImageURL
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = NSURL;
  v17[0] = CPSharedResourcesDirectory();
  v17[1] = @"Library";
  v17[2] = @"com.apple.ClipServices.clipserviced";
  v17[3] = @"DeveloperOverrides";
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  id v5 = [v3 fileURLWithPathComponents:v4];

  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v8 = v16;

  if (v7)
  {
    id v9 = v5;
  }
  else
  {
    long long v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(CPSDeveloperOverride *)v10 heroImageURL];
    }
    id v9 = 0;
  }

  uint64_t v11 = NSString;
  long long v12 = [(NSString *)self->_invocationURL cps_sha256String];
  uint64_t v13 = [v11 stringWithFormat:@"%@-Hero.png", v12];
  uint64_t v14 = [v9 URLByAppendingPathComponent:v13];

  return (NSURL *)v14;
}

- (void)save
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_21559C000, v5, v6, "Could not save developer override hero image: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)clear
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_21559C000, v5, v6, "Could not delete developer override hero image: %{public}@", v7, v8, v9, v10, 2u);
}

- (BOOL)isComplete
{
  id v3 = [NSURL URLWithString:self->_invocationURL];
  uint64_t v4 = [v3 scheme];
  uint64_t v5 = [v4 lowercaseString];

  BOOL v6 = (([v5 isEqualToString:@"http"] & 1) != 0
     || [v5 isEqualToString:@"https"])
    && [(NSString *)self->_title length]
    && [(NSString *)self->_subtitle length] != 0;

  return v6;
}

- (BOOL)isValid
{
  if (![(CPSDeveloperOverride *)self isComplete]) {
    return 0;
  }
  id v3 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:self->_clipBundleID allowPlaceholder:0 error:0];
  uint64_t v4 = v3;
  if (v3
    && ([v3 appClipMetadata], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    if ([v4 isBeta])
    {
      BOOL v6 = [NSURL URLWithString:self->_invocationURL];
      uint64_t v7 = [v4 applicationIdentifier];
      char v8 = +[CPSUtilities appClipAssociatedDomainIsApprovedForURL:v6 applicationIdentifier:v7];
    }
    else if ([v4 isProfileValidated])
    {
      char v8 = 1;
    }
    else
    {
      char v8 = [v4 isAdHocCodeSigned];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setHeroImage:(CGImage *)a3
{
  heroImage = self->_heroImage;
  if (heroImage != a3)
  {
    CGImageRelease(heroImage);
    self->_heroImage = CGImageRetain(a3);
  }
}

- (CGImage)heroImage
{
  result = self->_heroImage;
  if (!result)
  {
    uint64_t v4 = [(CPSDeveloperOverride *)self heroImageURL];
    uint64_t v5 = [v4 path];
    self->_heroImage = CPSCreateImageWithContentsOfFile(v5);

    return self->_heroImage;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_invocationURL copy];
  BOOL v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_clipBundleID copy];
  char v8 = (void *)v4[3];
  v4[3] = v7;

  v4[1] = CGImageCreateCopy(self->_heroImage);
  uint64_t v9 = [(NSString *)self->_title copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_subtitle copy];
  long long v12 = (void *)v4[5];
  v4[5] = v11;

  v4[6] = self->_action;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDeveloperOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPSDeveloperOverride;
  uint64_t v5 = [(CPSDeveloperOverride *)&v20 init];
  if (v5)
  {
    BOOL v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"invocationURL"];
    invocationURL = v5->_invocationURL;
    v5->_invocationURL = (NSString *)v7;

    uint64_t v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"clipBundleID"];
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v10;

    long long v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v13;

    uint64_t v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v16;

    v5->_int64_t action = [v4 decodeIntegerForKey:@"action"];
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  invocationURL = self->_invocationURL;
  id v5 = a3;
  [v5 encodeObject:invocationURL forKey:@"invocationURL"];
  [v5 encodeObject:self->_clipBundleID forKey:@"clipBundleID"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeInteger:self->_action forKey:@"action"];
}

- (NSString)invocationURL
{
  return self->_invocationURL;
}

- (void)setInvocationURL:(id)a3
{
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_int64_t action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);

  objc_storeStrong((id *)&self->_invocationURL, 0);
}

- (void)heroImageURL
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_21559C000, v5, v6, "Cannot create developer overrides folder with error: %{public}@", v7, v8, v9, v10, 2u);
}

@end