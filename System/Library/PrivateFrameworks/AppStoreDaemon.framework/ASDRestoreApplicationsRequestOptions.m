@interface ASDRestoreApplicationsRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDRestoreApplicationsRequestOptions)initWithApplicationMetadata:(id)a3;
- (ASDRestoreApplicationsRequestOptions)initWithCoder:(id)a3;
- (BOOL)completeDataPromise;
- (BOOL)createAsMobileBackup;
- (BOOL)createsPlaceholders;
- (BOOL)restoreApplicationData;
- (BOOL)skipCoordinatorCompletion;
- (NSArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompleteDataPromise:(BOOL)a3;
- (void)setCreateAsMobileBackup:(BOOL)a3;
- (void)setCreatesPlaceholders:(BOOL)a3;
- (void)setRestoreApplicationData:(BOOL)a3;
- (void)setSkipCoordinatorCompletion:(BOOL)a3;
@end

@implementation ASDRestoreApplicationsRequestOptions

- (ASDRestoreApplicationsRequestOptions)initWithApplicationMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRestoreApplicationsRequestOptions;
  v6 = [(ASDRestoreApplicationsRequestOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDRestoreApplicationsRequestOptions allocWithZone:](ASDRestoreApplicationsRequestOptions, "allocWithZone:") init];
  v5->_completeDataPromise = self->_completeDataPromise;
  v5->_createAsMobileBackup = self->_createAsMobileBackup;
  v5->_createsPlaceholders = self->_createsPlaceholders;
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  v5->_restoreApplicationData = self->_restoreApplicationData;
  v5->_skipCoordinatorCompletion = self->_skipCoordinatorCompletion;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRestoreApplicationsRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRestoreApplicationsRequestOptions;
  id v5 = [(ASDRequestOptions *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_completeDataPromise = [v4 decodeBoolForKey:@"completeDataPromise"];
    v5->_createAsMobileBackup = [v4 decodeBoolForKey:@"createsAsMobileBackup"];
    v5->_createsPlaceholders = [v4 decodeBoolForKey:@"createsPlaceholders"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_restoreApplicationData = [v4 decodeBoolForKey:@"restoreAppData"];
    v5->_skipCoordinatorCompletion = [v4 decodeBoolForKey:@"skipCompletion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL completeDataPromise = self->_completeDataPromise;
  id v6 = a3;
  [v6 encodeBool:completeDataPromise forKey:@"completeDataPromise"];
  [v6 encodeBool:self->_createAsMobileBackup forKey:@"createsAsMobileBackup"];
  [v6 encodeBool:self->_createsPlaceholders forKey:@"createsPlaceholders"];
  id v5 = [(ASDRestoreApplicationsRequestOptions *)self items];
  [v6 encodeObject:v5 forKey:@"items"];

  [v6 encodeBool:self->_restoreApplicationData forKey:@"restoreAppData"];
  [v6 encodeBool:self->_skipCoordinatorCompletion forKey:@"skipCompletion"];
}

- (BOOL)completeDataPromise
{
  return self->_completeDataPromise;
}

- (void)setCompleteDataPromise:(BOOL)a3
{
  self->_BOOL completeDataPromise = a3;
}

- (BOOL)createsPlaceholders
{
  return self->_createsPlaceholders;
}

- (void)setCreatesPlaceholders:(BOOL)a3
{
  self->_createsPlaceholders = a3;
}

- (BOOL)createAsMobileBackup
{
  return self->_createAsMobileBackup;
}

- (void)setCreateAsMobileBackup:(BOOL)a3
{
  self->_createAsMobileBackup = a3;
}

- (BOOL)skipCoordinatorCompletion
{
  return self->_skipCoordinatorCompletion;
}

- (void)setSkipCoordinatorCompletion:(BOOL)a3
{
  self->_skipCoordinatorCompletion = a3;
}

- (BOOL)restoreApplicationData
{
  return self->_restoreApplicationData;
}

- (void)setRestoreApplicationData:(BOOL)a3
{
  self->_restoreApplicationData = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end