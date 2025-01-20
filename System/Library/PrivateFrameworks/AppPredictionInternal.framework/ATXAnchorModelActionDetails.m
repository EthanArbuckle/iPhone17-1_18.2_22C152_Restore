@interface ATXAnchorModelActionDetails
- (ATXAnchorModelActionDetails)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5;
- (NSString)actionType;
- (NSString)bundleId;
- (int64_t)paramHash;
@end

@implementation ATXAnchorModelActionDetails

- (ATXAnchorModelActionDetails)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXAnchorModelActionDetails;
  v10 = [(ATXAnchorModelActionDetails *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    actionType = v10->_actionType;
    v10->_actionType = (NSString *)v13;

    v10->_paramHash = a5;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (int64_t)paramHash
{
  return self->_paramHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end