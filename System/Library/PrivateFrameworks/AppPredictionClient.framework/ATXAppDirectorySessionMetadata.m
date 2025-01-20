@interface ATXAppDirectorySessionMetadata
+ (BOOL)supportsSecureCoding;
- (ATXAppDirectorySessionMetadata)init;
- (ATXAppDirectorySessionMetadata)initWithCoder:(id)a3;
- (ATXAppDirectorySessionMetadata)initWithEngagedBundleId:(id)a3 engagedBundleIdInTopAppsVisible:(id)a4 didSearchDuringSession:(BOOL)a5;
- (BOOL)didSearchDuringSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXAppDirectorySessionMetadata:(id)a3;
- (NSNumber)engagedBundleIdInTopAppsVisible;
- (NSString)description;
- (NSString)engagedBundleId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSearchDuringSession:(BOOL)a3;
- (void)setEngagedBundleId:(id)a3;
- (void)setEngagedBundleIdInTopAppsVisible:(id)a3;
@end

@implementation ATXAppDirectorySessionMetadata

- (ATXAppDirectorySessionMetadata)init
{
  return [(ATXAppDirectorySessionMetadata *)self initWithEngagedBundleId:0 engagedBundleIdInTopAppsVisible:0 didSearchDuringSession:0];
}

- (ATXAppDirectorySessionMetadata)initWithEngagedBundleId:(id)a3 engagedBundleIdInTopAppsVisible:(id)a4 didSearchDuringSession:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppDirectorySessionMetadata;
  v11 = [(ATXAppDirectorySessionMetadata *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_engagedBundleId, a3);
    objc_storeStrong((id *)&v12->_engagedBundleIdInTopAppsVisible, a4);
    v12->_didSearchDuringSession = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  engagedBundleId = self->_engagedBundleId;
  id v5 = a3;
  [v5 encodeObject:engagedBundleId forKey:@"engagedBundleId"];
  [v5 encodeObject:self->_engagedBundleIdInTopAppsVisible forKey:@"bundleIdInTopAppsVisible"];
  [v5 encodeBool:self->_didSearchDuringSession forKey:@"appDirDidSearchDuringSession"];
}

- (ATXAppDirectorySessionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_feedback();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"engagedBundleId" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v7];

  id v9 = [v4 error];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_feedback();
    objc_super v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"bundleIdInTopAppsVisible" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXFeedbackSessionMetadata" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      id v10 = 0;
    }
    else
    {
      self = -[ATXAppDirectorySessionMetadata initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:](self, "initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:", v8, v14, [v4 decodeBoolForKey:@"appDirDidSearchDuringSession"]);
      id v10 = self;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_engagedBundleId hash];
  uint64_t v4 = [(NSNumber *)self->_engagedBundleIdInTopAppsVisible hash];
  return self->_didSearchDuringSession - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXAppDirectorySessionMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXAppDirectorySessionMetadata *)self isEqualToATXAppDirectorySessionMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXAppDirectorySessionMetadata:(id)a3
{
  uint64_t v4 = (id *)a3;
  engagedBundleId = self->_engagedBundleId;
  BOOL v6 = (NSString *)v4[2];
  if (engagedBundleId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = engagedBundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  engagedBundleIdInTopAppsVisible = self->_engagedBundleIdInTopAppsVisible;
  v11 = (NSNumber *)v4[3];
  if (engagedBundleIdInTopAppsVisible == v11)
  {

    goto LABEL_9;
  }
  uint64_t v12 = v11;
  v13 = engagedBundleIdInTopAppsVisible;
  char v14 = [(NSNumber *)v13 isEqual:v12];

  if (v14)
  {
LABEL_9:
    BOOL v15 = self->_didSearchDuringSession == *((unsigned __int8 *)v4 + 8);
    goto LABEL_10;
  }
LABEL_7:
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (NSString)description
{
  NSUInteger v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  id v4 = [NSString alloc];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  if (self->_didSearchDuringSession) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  char v9 = (void *)[v4 initWithFormat:@"%@: \nengagedBundleId: %@ \nengagedBundleIdInTopAppsVisible: %@ \ndidSearchDuringSession: %@ \n", v6, self->_engagedBundleId, self->_engagedBundleIdInTopAppsVisible, v8];

  return (NSString *)v9;
}

- (NSString)engagedBundleId
{
  return self->_engagedBundleId;
}

- (void)setEngagedBundleId:(id)a3
{
}

- (NSNumber)engagedBundleIdInTopAppsVisible
{
  return self->_engagedBundleIdInTopAppsVisible;
}

- (void)setEngagedBundleIdInTopAppsVisible:(id)a3
{
}

- (BOOL)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(BOOL)a3
{
  self->_didSearchDuringSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedBundleIdInTopAppsVisible, 0);

  objc_storeStrong((id *)&self->_engagedBundleId, 0);
}

@end