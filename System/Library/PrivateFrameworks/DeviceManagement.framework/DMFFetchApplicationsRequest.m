@interface DMFFetchApplicationsRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)deleteFeedback;
- (BOOL)excludeIcon;
- (BOOL)excludeUnmanagedApps;
- (DMFFetchApplicationsRequest)init;
- (DMFFetchApplicationsRequest)initWithCoder:(id)a3;
- (NSArray)bundleIdentifiers;
- (unint64_t)stateFilter;
- (unint64_t)typeFilter;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setDeleteFeedback:(BOOL)a3;
- (void)setExcludeIcon:(BOOL)a3;
- (void)setExcludeUnmanagedApps:(BOOL)a3;
- (void)setStateFilter:(unint64_t)a3;
- (void)setTypeFilter:(unint64_t)a3;
@end

@implementation DMFFetchApplicationsRequest

- (DMFFetchApplicationsRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFFetchApplicationsRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result)
  {
    result->_typeFilter = 0;
    result->_stateFilter = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchApplicationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFFetchApplicationsRequest;
  v5 = [(CATTaskRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bundleIdentifiers"];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeFilter"];
    v5->_typeFilter = [v11 unsignedIntegerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateFilter"];
    v5->_stateFilter = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"excludeIcon"];
    v5->_excludeIcon = [v13 BOOLValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"excludeUnmanagedApps"];
    v5->_excludeUnmanagedApps = [v14 BOOLValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deleteFeedback"];
    v5->_deleteFeedback = [v15 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchApplicationsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v11 encodeWithCoder:v4];
  v5 = [(DMFFetchApplicationsRequest *)self bundleIdentifiers];
  [v4 encodeObject:v5 forKey:@"bundleIdentifiers"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchApplicationsRequest typeFilter](self, "typeFilter"));
  [v4 encodeObject:v6 forKey:@"typeFilter"];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchApplicationsRequest stateFilter](self, "stateFilter"));
  [v4 encodeObject:v7 forKey:@"stateFilter"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchApplicationsRequest excludeIcon](self, "excludeIcon"));
  [v4 encodeObject:v8 forKey:@"excludeIcon"];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchApplicationsRequest excludeUnmanagedApps](self, "excludeUnmanagedApps"));
  [v4 encodeObject:v9 forKey:@"excludeUnmanagedApps"];

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchApplicationsRequest deleteFeedback](self, "deleteFeedback"));
  [v4 encodeObject:v10 forKey:@"deleteFeedback"];
}

- (BOOL)excludeIcon
{
  return self->_excludeIcon;
}

- (void)setExcludeIcon:(BOOL)a3
{
  self->_excludeIcon = a3;
}

- (BOOL)excludeUnmanagedApps
{
  return self->_excludeUnmanagedApps;
}

- (void)setExcludeUnmanagedApps:(BOOL)a3
{
  self->_excludeUnmanagedApps = a3;
}

- (BOOL)deleteFeedback
{
  return self->_deleteFeedback;
}

- (void)setDeleteFeedback:(BOOL)a3
{
  self->_deleteFeedback = a3;
}

- (unint64_t)typeFilter
{
  return self->_typeFilter;
}

- (void)setTypeFilter:(unint64_t)a3
{
  self->_typeFilter = a3;
}

- (unint64_t)stateFilter
{
  return self->_stateFilter;
}

- (void)setStateFilter:(unint64_t)a3
{
  self->_stateFilter = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end