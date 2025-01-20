@interface HMDFetchedAccessorySettingsControllerKeyPathMapItem
- (HMDFetchedAccessorySettingsControllerKeyPathMapItem)initWithDriver:(id)a3 keyPaths:(id)a4;
- (HMDFetchedSettingsDriver)driver;
- (NSArray)keyPaths;
@end

@implementation HMDFetchedAccessorySettingsControllerKeyPathMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathsInternal, 0);
  objc_storeStrong((id *)&self->_driver, 0);
}

- (HMDFetchedSettingsDriver)driver
{
  return (HMDFetchedSettingsDriver *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)keyPaths
{
  if (self) {
    self = (HMDFetchedAccessorySettingsControllerKeyPathMapItem *)objc_getProperty(self, a2, 16, 1);
  }
  v2 = (void *)[(HMDFetchedAccessorySettingsControllerKeyPathMapItem *)self copy];
  return (NSArray *)v2;
}

- (HMDFetchedAccessorySettingsControllerKeyPathMapItem)initWithDriver:(id)a3 keyPaths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDFetchedAccessorySettingsControllerKeyPathMapItem;
  v9 = [(HMDFetchedAccessorySettingsControllerKeyPathMapItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_driver, a3);
    uint64_t v11 = [v8 mutableCopy];
    keyPathsInternal = v10->_keyPathsInternal;
    v10->_keyPathsInternal = (NSMutableArray *)v11;
  }
  return v10;
}

@end