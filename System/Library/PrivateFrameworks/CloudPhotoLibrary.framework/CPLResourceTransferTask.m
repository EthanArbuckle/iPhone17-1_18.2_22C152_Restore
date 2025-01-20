@interface CPLResourceTransferTask
+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3;
+ (BOOL)isHighPriorityForIntent:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForIntent:(unint64_t)a3;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (CPLResource)resource;
- (CPLResourceTransferTask)initWithCoder:(id)a3;
- (CPLResourceTransferTask)initWithResource:(id)a3 taskIdentifier:(id)a4;
- (CPLResourceTransferTaskOptions)options;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (NSString)clientBundleID;
- (NSString)taskIdentifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)intent;
- (void)cancelTask;
- (void)encodeWithCoder:(id)a3;
- (void)launch;
- (void)setClientBundleID:(id)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation CPLResourceTransferTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (CPLResource)resource
{
  return self->_resource;
}

- (void)setIntent:(unint64_t)a3
{
  v4 = +[CPLResourceTransferTaskOptions optionsForLegacyIntent:a3];
  options = self->_options;
  self->_options = v4;
  MEMORY[0x1F41817F8](v4, options);
}

- (unint64_t)intent
{
  return [(CPLResourceTransferTaskOptions *)self->_options legacyIntent];
}

- (void)setOptions:(id)a3
{
  if (a3)
  {
    v4 = (CPLResourceTransferTaskOptions *)[a3 copy];
  }
  else
  {
    v4 = +[CPLResourceTransferTaskOptions defaultOptions];
  }
  options = self->_options;
  self->_options = v4;
  MEMORY[0x1F41817F8](v4, options);
}

- (CPLResourceTransferTaskOptions)options
{
  return self->_options;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLResourceTransferTask *)self taskIdentifier];
  v6 = [(CPLResourceTransferTask *)self resource];
  if ([(CPLResourceTransferTask *)self isHighPriority]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if ([(CPLResourceTransferTask *)self isCancelled]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  v9 = [v3 stringWithFormat:@"<%@ %p task identifier %@ resource %@ highPriority %s cancelled %s options %@>", v4, self, v5, v6, v7, v8, self->_options];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(CPLResourceTransferTask *)self taskIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CPLResourceTransferTask *)self taskIdentifier];
    v6 = [v4 taskIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)cancelTask
{
  self->_cancelled = 1;
}

- (void)launch
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceTransferTask.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 85, @"%@ should be overriden by subclasses", v6 object file lineNumber description];

  abort();
}

- (BOOL)isHighPriority
{
  return [(CPLResourceTransferTaskOptions *)self->_options isHighPriority];
}

- (void)setHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [CPLResourceTransferTaskOptions alloc];
  options = self->_options;
  if (options) {
    [(CPLResourceTransferTaskOptions *)options timeRange];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  if (v3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [(CPLResourceTransferTaskOptions *)v5 initWithIntent:0 priority:v7 timeRange:v10];
  v9 = self->_options;
  self->_options = v8;
}

- (void)setTaskIdentifier:(id)a3
{
  id v8 = a3;
  if ([v8 length])
  {
    id v4 = (NSString *)[v8 copy];
    taskIdentifier = self->_taskIdentifier;
    self->_taskIdentifier = v4;
  }
  else
  {
    taskIdentifier = [MEMORY[0x1E4F29128] UUID];
    v6 = [taskIdentifier UUIDString];
    uint64_t v7 = self->_taskIdentifier;
    self->_taskIdentifier = v6;
  }
}

- (CPLResourceTransferTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"keyResource"];
  v6 = [v4 decodeObjectForKey:@"keyTaskID"];
  uint64_t v7 = [(CPLResourceTransferTask *)self initWithResource:v5 taskIdentifier:v6];

  if (v7)
  {
    if (![(NSString *)v7->_taskIdentifier length])
    {
      id v8 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v9 = [v8 UUIDString];
      taskIdentifier = v7->_taskIdentifier;
      v7->_taskIdentifier = (NSString *)v9;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = +[CPLResourceTransferTaskOptions defaultOptions];
    }
    options = v7->_options;
    v7->_options = v13;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  resource = self->_resource;
  id v5 = a3;
  [v5 encodeObject:resource forKey:@"keyResource"];
  [v5 encodeObject:self->_taskIdentifier forKey:@"keyTaskID"];
  [v5 encodeObject:self->_options forKey:@"options"];
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (CPLResourceTransferTask)initWithResource:(id)a3 taskIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPLResourceTransferTask;
  uint64_t v9 = [(CPLResourceTransferTask *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resource, a3);
    uint64_t v11 = [v8 copy];
    taskIdentifier = v10->_taskIdentifier;
    v10->_taskIdentifier = (NSString *)v11;

    uint64_t v13 = +[CPLResourceTransferTaskOptions defaultOptions];
    options = v10->_options;
    v10->_options = (CPLResourceTransferTaskOptions *)v13;
  }
  return v10;
}

+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3
{
  BOOL v3 = +[CPLResourceTransferTaskOptions optionsForLegacyIntent:a3];
  BOOL v4 = +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:priority:](CPLResourceTransferTaskOptions, "isForegroundOperationForIntent:priority:", [v3 intent], objc_msgSend(v3, "priority"));

  return v4;
}

+ (BOOL)isHighPriorityForIntent:(unint64_t)a3
{
  BOOL v3 = +[CPLResourceTransferTaskOptions optionsForLegacyIntent:a3];
  char v4 = [v3 isHighPriority];

  return v4;
}

+ (id)descriptionForIntent:(unint64_t)a3
{
  BOOL v3 = +[CPLResourceTransferTaskOptions optionsForLegacyIntent:a3];
  char v4 = [v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end