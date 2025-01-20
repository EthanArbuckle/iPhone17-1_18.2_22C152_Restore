@interface HMDemoCameraClip
- (HMDemoCameraClip)initWithCameraProfile:(id)a3 clipURL:(id)a4 startDate:(id)a5 duration:(double)a6 significantEvents:(id)a7;
- (HMDemoCameraClip)initWithClipURL:(id)a3 startDate:(id)a4 duration:(double)a5 significantEvents:(id)a6;
- (NSURL)clipURL;
@end

@implementation HMDemoCameraClip

- (void).cxx_destruct
{
}

- (NSURL)clipURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (HMDemoCameraClip)initWithClipURL:(id)a3 startDate:(id)a4 duration:(double)a5 significantEvents:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  v13 = [HMCameraClipEncryptionContext alloc];
  v14 = [MEMORY[0x1E4F1C9B8] data];
  v15 = [(HMCameraClipEncryptionContext *)v13 initWithKey:v14 scheme:1];

  v16 = [MEMORY[0x1E4F29128] UUID];
  v21.receiver = self;
  v21.super_class = (Class)HMDemoCameraClip;
  v17 = [(HMCameraClip *)&v21 initWithUniqueIdentifier:v16 startDate:v12 duration:1 targetFragmentDuration:0 isComplete:0 isDonated:@"1" quality:a5 streamingAssetVersion:0.0 encryptionContext:v15 videoSegments:MEMORY[0x1E4F1CBF0] significantEvents:v11];

  if (v17)
  {
    uint64_t v18 = [v10 copy];
    clipURL = v17->_clipURL;
    v17->_clipURL = (NSURL *)v18;
  }
  return v17;
}

- (HMDemoCameraClip)initWithCameraProfile:(id)a3 clipURL:(id)a4 startDate:(id)a5 duration:(double)a6 significantEvents:(id)a7
{
  return [(HMDemoCameraClip *)self initWithClipURL:a4 startDate:a5 duration:a7 significantEvents:a6];
}

@end