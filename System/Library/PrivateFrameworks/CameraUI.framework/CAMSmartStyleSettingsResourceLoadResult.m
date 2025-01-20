@interface CAMSmartStyleSettingsResourceLoadResult
- (CAMSmartStyleSettingsResourceLoadResult)initWithResourceLoadResult:(id)a3 logIdentifier:(id)a4;
- (NSString)logIdentifier;
- (PEResourceLoadResult)resourceLoadResult;
@end

@implementation CAMSmartStyleSettingsResourceLoadResult

- (CAMSmartStyleSettingsResourceLoadResult)initWithResourceLoadResult:(id)a3 logIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMSmartStyleSettingsResourceLoadResult;
  v9 = [(CAMSmartStyleSettingsResourceLoadResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceLoadResult, a3);
    objc_storeStrong((id *)&v10->_logIdentifier, a4);
    v11 = v10;
  }

  return v10;
}

- (PEResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
}

@end