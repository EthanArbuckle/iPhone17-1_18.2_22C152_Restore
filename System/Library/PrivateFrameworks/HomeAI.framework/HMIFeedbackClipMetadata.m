@interface HMIFeedbackClipMetadata
- (HMIFeedbackClipMetadata)initWithClipMetadata:(id)a3 cameraMetadata:(id)a4 homeMetadata:(id)a5;
- (NSDictionary)cameraMetadata;
- (NSDictionary)clipMetadata;
- (NSDictionary)homeMetadata;
@end

@implementation HMIFeedbackClipMetadata

- (HMIFeedbackClipMetadata)initWithClipMetadata:(id)a3 cameraMetadata:(id)a4 homeMetadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMIFeedbackClipMetadata;
  v12 = [(HMIFeedbackClipMetadata *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clipMetadata, a3);
    objc_storeStrong((id *)&v13->_cameraMetadata, a4);
    objc_storeStrong((id *)&v13->_homeMetadata, a5);
  }

  return v13;
}

- (NSDictionary)clipMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)cameraMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)homeMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMetadata, 0);
  objc_storeStrong((id *)&self->_cameraMetadata, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
}

@end