@interface ATXAppDirectoryEventMetadata
+ (BOOL)supportsSecureCoding;
- (ATXAppDirectoryEventMetadata)init;
- (ATXAppDirectoryEventMetadata)initWithBundleIdInTopAppsVisible:(id)a3 userLaunchedAppBeforeLeaving:(id)a4;
- (ATXAppDirectoryEventMetadata)initWithCoder:(id)a3;
- (ATXAppDirectoryEventMetadata)initWithProto:(id)a3;
- (ATXAppDirectoryEventMetadata)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXAppDirectoryEventMetadata:(id)a3;
- (NSNumber)bundleIdInTopAppsVisible;
- (NSNumber)userLaunchedAppBeforeLeaving;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdInTopAppsVisible:(id)a3;
- (void)setUserLaunchedAppBeforeLeaving:(id)a3;
@end

@implementation ATXAppDirectoryEventMetadata

- (ATXAppDirectoryEventMetadata)init
{
  return [(ATXAppDirectoryEventMetadata *)self initWithBundleIdInTopAppsVisible:0 userLaunchedAppBeforeLeaving:0];
}

- (ATXAppDirectoryEventMetadata)initWithBundleIdInTopAppsVisible:(id)a3 userLaunchedAppBeforeLeaving:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAppDirectoryEventMetadata;
  v9 = [(ATXAppDirectoryEventMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdInTopAppsVisible, a3);
    objc_storeStrong((id *)&v10->_userLaunchedAppBeforeLeaving, a4);
  }

  return v10;
}

- (id)encodeAsProto
{
  v2 = [(ATXAppDirectoryEventMetadata *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXAppDirectoryEventMetadata)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    id v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryEventMetadata initWithProto:]((uint64_t)self, v7);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  if (-[ATXPBAppDirectoryEventMetadata hasBundleIdInTopAppsVisible]((uint64_t)v5)) {
    v6 = (void *)[objc_alloc(NSNumber) initWithBool:-[ATXPBAppDirectoryEventMetadata bundleIdInTopAppsVisible]((BOOL)v5)];
  }
  else {
    v6 = 0;
  }
  if (-[ATXPBAppDirectoryEventMetadata hasUserLaunchedAppBeforeLeaving]((uint64_t)v5)) {
    v9 = (void *)[objc_alloc(NSNumber) initWithBool:-[ATXPBAppDirectoryEventMetadata userLaunchedAppBeforeLeaving]((BOOL)v5)];
  }
  else {
    v9 = 0;
  }
  self = [(ATXAppDirectoryEventMetadata *)self initWithBundleIdInTopAppsVisible:v6 userLaunchedAppBeforeLeaving:v9];

  id v8 = self;
LABEL_14:

  return v8;
}

- (ATXAppDirectoryEventMetadata)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBAppDirectoryEventMetadata alloc] initWithData:v4];

    self = [(ATXAppDirectoryEventMetadata *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  if (bundleIdInTopAppsVisible) {
    -[ATXPBAppDirectoryEventMetadata setBundleIdInTopAppsVisible:]((uint64_t)v3, [(NSNumber *)bundleIdInTopAppsVisible BOOLValue]);
  }
  userLaunchedAppBeforeLeaving = self->_userLaunchedAppBeforeLeaving;
  if (userLaunchedAppBeforeLeaving) {
    -[ATXPBAppDirectoryEventMetadata setUserLaunchedAppBeforeLeaving:]((uint64_t)v3, [(NSNumber *)userLaunchedAppBeforeLeaving BOOLValue]);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXAppDirectoryEventMetadata *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXAppDirectoryEventMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXAppDirectoryEventMetadata *)self initWithProtoData:v5];
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_bundleIdInTopAppsVisible hash];
  return [(NSNumber *)self->_userLaunchedAppBeforeLeaving hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXAppDirectoryEventMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXAppDirectoryEventMetadata *)self isEqualToATXAppDirectoryEventMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXAppDirectoryEventMetadata:(id)a3
{
  id v4 = (id *)a3;
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  BOOL v6 = (NSNumber *)v4[1];
  if (bundleIdInTopAppsVisible == v6)
  {
  }
  else
  {
    id v7 = v6;
    id v8 = bundleIdInTopAppsVisible;
    char v9 = [(NSNumber *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_userLaunchedAppBeforeLeaving;
  objc_super v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSNumber isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (id)jsonDict
{
  v7[2] = *MEMORY[0x1E4F143B8];
  userLaunchedAppBeforeLeaving = (NSNumber *)@"nil";
  v6[0] = @"bundleIdInTopAppsVisible";
  v6[1] = @"userLaunchedAppBeforeLeaving";
  bundleIdInTopAppsVisible = self->_bundleIdInTopAppsVisible;
  if (!bundleIdInTopAppsVisible) {
    bundleIdInTopAppsVisible = (NSNumber *)@"nil";
  }
  if (self->_userLaunchedAppBeforeLeaving) {
    userLaunchedAppBeforeLeaving = self->_userLaunchedAppBeforeLeaving;
  }
  v7[0] = bundleIdInTopAppsVisible;
  v7[1] = userLaunchedAppBeforeLeaving;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (NSNumber)bundleIdInTopAppsVisible
{
  return self->_bundleIdInTopAppsVisible;
}

- (void)setBundleIdInTopAppsVisible:(id)a3
{
}

- (NSNumber)userLaunchedAppBeforeLeaving
{
  return self->_userLaunchedAppBeforeLeaving;
}

- (void)setUserLaunchedAppBeforeLeaving:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLaunchedAppBeforeLeaving, 0);

  objc_storeStrong((id *)&self->_bundleIdInTopAppsVisible, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAppDirectoryEventMetadata proto", (uint8_t *)&v5, 0xCu);
}

@end