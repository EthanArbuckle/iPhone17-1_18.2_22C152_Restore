@interface ARMLImageDownScalingResultData
- (ARImageData)originalImageData;
- (ARMLImageDownScalingResultData)initWithResultDataArray:(id)a3 timestamp:(double)a4 rotationOfResultTensor:(int64_t)a5 originalImageData:(id)a6;
- (ARMLImageDownScalingResultData)latestResizedUltraWideImageData;
- (BOOL)isEqual:(id)a3;
- (NSArray)downScalingResults;
- (double)timestamp;
- (int64_t)rotationOfResultTensor;
- (void)setLatestResizedUltraWideImageData:(id)a3;
@end

@implementation ARMLImageDownScalingResultData

- (ARMLImageDownScalingResultData)initWithResultDataArray:(id)a3 timestamp:(double)a4 rotationOfResultTensor:(int64_t)a5 originalImageData:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ARMLImageDownScalingResultData;
  v13 = [(ARMLImageDownScalingResultData *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_downScalingResults, a3);
    v14->_timestamp = a4;
    v14->_rotationOfResultTensor = a5;
    objc_storeStrong((id *)&v14->_originalImageData, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [v5 downScalingResults];
    int v7 = [v6 isEqual:self->_downScalingResults];

    if (v7
      && ([v5 timestamp], v8 == self->_timestamp)
      && [v5 rotationOfResultTensor] == self->_rotationOfResultTensor)
    {
      v9 = [v5 originalImageData];
      char v10 = [v9 isEqual:self->_originalImageData];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)rotationOfResultTensor
{
  return self->_rotationOfResultTensor;
}

- (NSArray)downScalingResults
{
  return self->_downScalingResults;
}

- (ARImageData)originalImageData
{
  return self->_originalImageData;
}

- (ARMLImageDownScalingResultData)latestResizedUltraWideImageData
{
  return self->_latestResizedUltraWideImageData;
}

- (void)setLatestResizedUltraWideImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResizedUltraWideImageData, 0);
  objc_storeStrong((id *)&self->_originalImageData, 0);
  objc_storeStrong((id *)&self->_downScalingResults, 0);
}

@end