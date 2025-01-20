@interface _INBundleImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSystem;
- (BOOL)_requiresRetrieval;
- (INImageBundle)imageBundle;
- (NSString)imageName;
- (_INBundleImage)initWithCoder:(id)a3;
- (_INBundleImage)initWithStringRepresentation:(id)a3;
- (id)_URLRepresentation;
- (id)_bundleIdentifier;
- (id)_bundlePath;
- (id)_copyWithSubclass:(Class)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithURLRepresentation:(id)a3;
- (id)stringRepresentation;
- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)_setBundleIdentifier:(id)a3;
- (void)_setBundlePath:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImageBundle:(id)a3;
- (void)setImageName:(id)a3;
@end

@implementation _INBundleImage

- (BOOL)_isSystem
{
  v2 = [(_INBundleImage *)self imageBundle];
  BOOL v3 = [v2 bundleType] == 2;

  return v3;
}

- (id)stringRepresentation
{
  BOOL v3 = [(_INBundleImage *)self imageBundle];
  v4 = [v3 bundlePath];

  if (v4)
  {
    v5 = [(_INBundleImage *)self imageBundle];
    v6 = [v5 bundlePath];
    v7 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];
  }
  else
  {
    v8 = &stru_1EDA6DB28;
  }
  v9 = [(_INBundleImage *)self imageBundle];
  unint64_t v10 = [v9 bundleType];

  if (v10 > 2) {
    v11 = 0;
  }
  else {
    v11 = off_1E551C438[v10];
  }
  id v12 = [NSString alloc];
  v13 = [(_INBundleImage *)self imageName];
  v14 = [(_INBundleImage *)self imageBundle];
  uint64_t v15 = [v14 bundleIdentifier];
  v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_1EDA6DB28;
  }
  v18 = (void *)[v12 initWithFormat:@"%@://%@/?%@=%@&%@=%@&%@=%@", @"siri-client-cache", v8, @"bundleType", v11, @"imageName", v13, @"bundleIdentifier", v17];

  return v18;
}

- (INImageBundle)imageBundle
{
  return self->_imageBundle;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (void)setImageBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBundle, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_INBundleImage;
  id v4 = a3;
  [(INImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, @"imageName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_imageBundle forKey:@"imageBundle"];
}

- (id)_copyWithSubclass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_INBundleImage;
  id v4 = [(INImage *)&v11 _copyWithSubclass:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(_INBundleImage *)self imageName];
    [v5 setImageName:v6];

    v7 = [(_INBundleImage *)self imageBundle];
    [v5 setImageBundle:v7];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (id)_dictionaryRepresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_INBundleImage;
  BOOL v3 = [(INImage *)&v9 _dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v10 = @"imageName";
  imageName = self->_imageName;
  v6 = imageName;
  if (!imageName)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v4 addEntriesFromDictionary:v7];

  if (!imageName) {

  }
  return v4;
}

- (BOOL)_requiresRetrieval
{
  return 1;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_super v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[_INBundleImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Attempting bundle image loading strategy with helper: %@", buf, 0x16u);
      }
      id v12 = [(_INBundleImage *)self imageBundle];
      v13 = [(_INBundleImage *)self imageName];
      [v8 loadImageDataFromBundle:v12 withImageName:v13 accessSpecifier:v9 completion:v10];
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"No helper to use which can load image %@ from bundle", self];
      v17 = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v15 = [v14 errorWithDomain:@"IntentsErrorDomain" code:6003 userInfo:v13];
      (*((void (**)(id, void, void, void *, double, double))v10 + 2))(v10, 0, 0, v15, 0.0, 0.0);
    }
  }
}

- (_INBundleImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INBundleImage;
  id v5 = [(INImage *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageBundle"];
    imageBundle = v5->_imageBundle;
    v5->_imageBundle = (INImageBundle *)v8;
  }
  return v5;
}

- (void)_setBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_INBundleImage *)self imageBundle];
  [v5 setBundleIdentifier:v4];
}

- (id)_bundleIdentifier
{
  v2 = [(_INBundleImage *)self imageBundle];
  BOOL v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)_setBundlePath:(id)a3
{
  id v4 = a3;
  id v5 = [(_INBundleImage *)self imageBundle];
  [v5 setBundlePath:v4];
}

- (id)_bundlePath
{
  v2 = [(_INBundleImage *)self imageBundle];
  BOOL v3 = [v2 bundlePath];

  return v3;
}

- (_INBundleImage)initWithStringRepresentation:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  id v5 = [(_INBundleImage *)self _initWithURLRepresentation:v4];

  return v5;
}

- (id)_URLRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v3 = [(_INBundleImage *)self stringRepresentation];
  id v4 = [v2 URLWithString:v3];

  return v4;
}

- (id)_initWithURLRepresentation:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v43.receiver = self;
    v43.super_class = (Class)_INBundleImage;
    self = [(INImage *)&v43 _initWithIdentifier:0];
    if (!self)
    {
LABEL_31:
      self = self;
      v32 = self;
      goto LABEL_32;
    }
    id v5 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
    uint64_t v6 = [v5 scheme];
    int v7 = [v6 isEqualToString:@"siri-client-cache"];

    if (v7)
    {
      uint64_t v8 = [v5 path];
      id v9 = objc_alloc_init(INImageBundle);
      if (([v8 isEqualToString:@"/"] & 1) == 0)
      {
        id v10 = [v8 stringByRemovingPercentEncoding];
        [(INImageBundle *)v9 setBundlePath:v10];
      }
      v35 = v8;
      id v37 = v4;
      v36 = v5;
      objc_super v11 = objc_msgSend(v5, "queryItems", v9);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        v14 = 0;
        v38 = 0;
        uint64_t v15 = *(void *)v40;
        uint64_t v16 = 1;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v11);
            }
            v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            v19 = [v18 name];
            int v20 = [v19 isEqualToString:@"bundleType"];

            if (v20)
            {
              id v21 = [v18 value];
              char v22 = [v21 isEqualToString:@"a"];

              if (v22)
              {
                uint64_t v16 = 0;
              }
              else
              {
                v26 = [v18 value];
                int v27 = [v26 isEqualToString:@"s"];

                if (v27) {
                  uint64_t v16 = 2;
                }
              }
            }
            else
            {
              v23 = [v18 name];
              int v24 = [v23 isEqualToString:@"imageName"];

              if (v24)
              {
                uint64_t v25 = [v18 value];

                v14 = (void *)v25;
              }
              else
              {
                v28 = [v18 name];
                int v29 = [v28 isEqualToString:@"bundleIdentifier"];

                if (v29)
                {
                  v30 = [v18 value];
                  if ([v30 length])
                  {
                    uint64_t v31 = [v18 value];
                  }
                  else
                  {
                    uint64_t v31 = 0;
                  }

                  v38 = (void *)v31;
                }
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v13);
      }
      else
      {
        v14 = 0;
        v38 = 0;
        uint64_t v16 = 1;
      }
      [v34 setBundleType:v16];
      [v34 setBundleIdentifier:v38];
      [(_INBundleImage *)self setImageBundle:v34];
      [(_INBundleImage *)self setImageName:v14];

      id v4 = v37;
      goto LABEL_31;
    }
  }
  v32 = 0;
LABEL_32:

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end