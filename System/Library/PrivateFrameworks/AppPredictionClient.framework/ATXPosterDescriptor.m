@interface ATXPosterDescriptor
+ (BOOL)supportsSecureCoding;
- (ATXPosterDescriptor)initWithCoder:(id)a3;
- (ATXPosterDescriptor)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6;
- (ATXPosterDescriptorGalleryOptions)galleryOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPosterDescriptor:(id)a3;
- (NSNumber)score;
- (NSString)containerBundleIdentifier;
- (NSString)coreIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation ATXPosterDescriptor

- (ATXPosterDescriptor)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXPosterDescriptor;
  v14 = [(ATXPosterDescriptor *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v19;

    if (v13) {
      v21 = (ATXPosterDescriptorGalleryOptions *)v13;
    }
    else {
      v21 = (ATXPosterDescriptorGalleryOptions *)objc_opt_new();
    }
    galleryOptions = v14->_galleryOptions;
    v14->_galleryOptions = v21;
  }
  return v14;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@; ", v5];

  v6 = [(ATXPosterDescriptor *)self identifier];
  [v3 appendFormat:@"identifier: %@; ", v6];

  v7 = [(ATXPosterDescriptor *)self extensionBundleIdentifier];
  [v3 appendFormat:@"extensionBundleIdentifier: %@; ", v7];

  v8 = [(ATXPosterDescriptor *)self containerBundleIdentifier];
  [v3 appendFormat:@"containerBundleIdentifier: %@; ", v8];

  v9 = [(ATXPosterDescriptor *)self galleryOptions];
  [v3 appendFormat:@"galleryOptions: %@; ", v9];

  id v10 = [(ATXPosterDescriptor *)self score];
  [v3 appendFormat:@"score: %@; ", v10];

  return v3;
}

- (NSString)coreIdentifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  coreIdentifier = self->_coreIdentifier;
  if (!coreIdentifier)
  {
    v4 = [(ATXPosterDescriptor *)self identifier];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v19[0] = @".STATIC";
    v19[1] = @".DYNAMIC";
    v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [v4 rangeOfString:*(void *)(*((void *)&v15 + 1) + 8 * i) options:14];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v10, v11, &stru_1EFD9B408);

            v4 = (void *)v12;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v13 = self->_coreIdentifier;
    self->_coreIdentifier = (NSString *)v4;

    coreIdentifier = self->_coreIdentifier;
  }

  return coreIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (!v5)
  {
    uint64_t v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXPosterDescriptor initWithCoder:](v6);
    }
    goto LABEL_9;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  if (!v6)
  {
    uint64_t v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXPosterDescriptor initWithCoder:](v11);
    }

LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"galleryOptions"];
  self = [(ATXPosterDescriptor *)self initWithIdentifier:v5 extensionBundleIdentifier:v6 containerBundleIdentifier:v7 galleryOptions:v8];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
  [(ATXPosterDescriptor *)self setScore:v9];

  uint64_t v10 = self;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPosterDescriptor *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(ATXPosterDescriptor *)self extensionBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"extensionBundleIdentifier"];

  uint64_t v7 = [(ATXPosterDescriptor *)self containerBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"containerBundleIdentifier"];

  uint64_t v8 = [(ATXPosterDescriptor *)self galleryOptions];
  [v4 encodeObject:v8 forKey:@"galleryOptions"];

  id v9 = [(ATXPosterDescriptor *)self score];
  [v4 encodeObject:v9 forKey:@"score"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ATXPosterDescriptor *)self identifier];
  uint64_t v6 = [(ATXPosterDescriptor *)self extensionBundleIdentifier];
  uint64_t v7 = [(ATXPosterDescriptor *)self containerBundleIdentifier];
  uint64_t v8 = [(ATXPosterDescriptor *)self galleryOptions];
  id v9 = (void *)[v4 initWithIdentifier:v5 extensionBundleIdentifier:v6 containerBundleIdentifier:v7 galleryOptions:v8];

  uint64_t v10 = [(ATXPosterDescriptor *)self score];
  [v9 setScore:v10];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPosterDescriptor *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPosterDescriptor *)self isEqualToATXPosterDescriptor:v5];

  return v6;
}

- (BOOL)isEqualToATXPosterDescriptor:(id)a3
{
  id v4 = (id *)a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = identifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  uint64_t v11 = (NSString *)v4[3];
  if (extensionBundleIdentifier == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    id v13 = extensionBundleIdentifier;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  long long v16 = (NSString *)v4[4];
  if (containerBundleIdentifier == v16)
  {
  }
  else
  {
    long long v17 = v16;
    long long v18 = containerBundleIdentifier;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0)
    {
LABEL_11:
      char v20 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v21 = self->_galleryOptions;
  v22 = v21;
  if (v21 == v4[5]) {
    char v20 = 1;
  }
  else {
    char v20 = -[ATXPosterDescriptorGalleryOptions isEqual:](v21, "isEqual:");
  }

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  v3 = [(ATXPosterDescriptor *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(ATXPosterDescriptor *)self extensionBundleIdentifier];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  uint64_t v7 = [(ATXPosterDescriptor *)self containerBundleIdentifier];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  char v9 = [(ATXPosterDescriptor *)self galleryOptions];
  unint64_t v10 = [v9 hash] - v8 + 32 * v8;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (ATXPosterDescriptorGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_coreIdentifier, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXPosterDescriptor initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: error decoding identifier", (uint8_t *)&v1, 0xCu);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXPosterDescriptor initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: error decoding extensionBundleIdentifier", (uint8_t *)&v1, 0xCu);
}

@end