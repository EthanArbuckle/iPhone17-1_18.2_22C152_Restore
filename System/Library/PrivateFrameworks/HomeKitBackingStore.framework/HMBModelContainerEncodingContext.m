@interface HMBModelContainerEncodingContext
- (HMBModelContainer)modelContainer;
- (HMBModelContainerEncodingContext)initWithModelContainer:(id)a3;
@end

@implementation HMBModelContainerEncodingContext

- (void).cxx_destruct
{
}

- (HMBModelContainer)modelContainer
{
  return (HMBModelContainer *)objc_getProperty(self, a2, 8, 1);
}

- (HMBModelContainerEncodingContext)initWithModelContainer:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)HMBModelContainerEncodingContext;
    v7 = [(HMBModelContainerEncodingContext *)&v13 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_modelContainer, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMBLocalZone *)_HMFPreconditionFailure();
    return (HMBModelContainerEncodingContext *)[(HMBLocalZone *)v10 createMirrorInputWithError:v12];
  }
}

@end