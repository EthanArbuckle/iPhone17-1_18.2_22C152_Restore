@interface ATXLinkActionContainer
+ (BOOL)supportsSecureCoding;
- (ATXLinkActionContainer)initWithBundleId:(id)a3 action:(id)a4;
- (ATXLinkActionContainer)initWithCoder:(id)a3;
- (ATXLinkActionContainer)initWithProto:(id)a3;
- (ATXLinkActionContainer)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXLinkActionContainer:(id)a3;
- (INAppIntent)cachedAppIntent;
- (LNAction)action;
- (LNImage)image;
- (NSString)bundleId;
- (NSString)description;
- (id)_initWithBundleId:(id)a3 action:(id)a4 image:(id)a5;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setCachedAppIntent:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation ATXLinkActionContainer

- (ATXLinkActionContainer)initWithBundleId:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXLinkActionContainer;
  v8 = [(ATXLinkActionContainer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    action = v8->_action;
    v8->_action = (LNAction *)v11;
  }
  return v8;
}

- (id)_initWithBundleId:(id)a3 action:(id)a4 image:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(ATXLinkActionContainer *)self initWithBundleId:a3 action:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    image = v9->_image;
    v9->_image = (LNImage *)v10;
  }
  return v9;
}

- (ATXLinkActionContainer)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = (void *)MEMORY[0x1AD0D3C30]();
      id v7 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [v5 action];
      id v17 = 0;
      uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:&v17];
      id v11 = v17;

      if (v11)
      {
        v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ATXLinkActionContainer initWithProto:]();
        }

        v13 = 0;
      }
      else
      {
        objc_super v14 = [v5 bundleId];
        v15 = [(ATXLinkActionContainer *)self initWithBundleId:v14 action:v10];

        self = v15;
        v13 = self;
      }
    }
    else
    {
      v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXLinkActionContainer initWithProto:]((uint64_t)self, v5);
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(ATXLinkActionContainer *)self bundleId];
  [v3 setBundleId:v4];

  v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = (void *)MEMORY[0x1E4F28DB0];
  id v7 = [(ATXLinkActionContainer *)self action];
  id v13 = 0;
  uint64_t v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v13];
  id v9 = v13;

  [v3 setAction:v8];

  if (v9)
  {
    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXLinkActionContainer proto]();
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (id)encodeAsProto
{
  v2 = [(ATXLinkActionContainer *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXLinkActionContainer)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBLinkAction alloc] initWithData:v4];

    self = [(ATXLinkActionContainer *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXLinkActionContainer *)self bundleId];
  [v4 encodeObject:v5 forKey:@"codingKeyForBundleId"];

  id v6 = [(ATXLinkActionContainer *)self action];
  [v4 encodeObject:v6 forKey:@"codingKeyForLinkAction"];

  id v7 = [(ATXLinkActionContainer *)self image];
  [v4 encodeObject:v7 forKey:@"codingKeyForLinkImage"];
}

- (ATXLinkActionContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_default();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.LinkActionContainer" errorCode:-1 logHandle:v7];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    id v11 = __atxlog_handle_default();
    v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"codingKeyForLinkAction" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.LinkActionContainer" errorCode:-1 logHandle:v11];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v14 = objc_opt_class();
      v15 = __atxlog_handle_default();
      v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"codingKeyForLinkImage" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.LinkActionContainer" errorCode:-1 logHandle:v15];

      self = (ATXLinkActionContainer *)[(ATXLinkActionContainer *)self _initWithBundleId:v8 action:v12 image:v16];
      id v17 = self;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v3 = [(ATXLinkActionContainer *)self bundleId];
  uint64_t v4 = [v3 hash];

  v5 = [(ATXLinkActionContainer *)self image];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  id v7 = [(ATXLinkActionContainer *)self action];
  unint64_t v8 = [v7 hash] - v6 + 32 * v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXLinkActionContainer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXLinkActionContainer *)self isEqualToATXLinkActionContainer:v5];

  return v6;
}

- (BOOL)isEqualToATXLinkActionContainer:(id)a3
{
  uint64_t v4 = (id *)a3;
  bundleId = self->_bundleId;
  BOOL v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {
  }
  else
  {
    id v7 = v6;
    unint64_t v8 = bundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = self->_action;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[LNAction isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(ATXLinkActionContainer *)self bundleId];
  v5 = [(ATXLinkActionContainer *)self action];
  BOOL v6 = [v5 identifier];
  id v7 = (void *)[v3 initWithFormat:@"ATXLinkActionContainer - bundleId: %@, actionId: %@", v4, v6];

  return (NSString *)v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (LNAction)action
{
  return self->_action;
}

- (LNImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (INAppIntent)cachedAppIntent
{
  return (INAppIntent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedAppIntent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppIntent, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "%@: Unable to decode data from serialized Link action message: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBLinkAction proto", (uint8_t *)&v5, 0xCu);
}

- (void)proto
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "%@: Unable to serialize LNAction: %@", v4, v5, v6, v7, v8);
}

@end