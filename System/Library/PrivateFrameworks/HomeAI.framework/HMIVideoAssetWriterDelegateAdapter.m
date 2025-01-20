@interface HMIVideoAssetWriterDelegateAdapter
- (id)assetWriterDidFailWithError;
- (id)assetWriterDidOutputInitializationSegment;
- (id)assetWriterDidOutputSeparableSegment;
- (void)assetWriter:(id)a3 didFailWithError:(id)a4;
- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4;
- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5;
- (void)setAssetWriterDidFailWithError:(id)a3;
- (void)setAssetWriterDidOutputInitializationSegment:(id)a3;
- (void)setAssetWriterDidOutputSeparableSegment:(id)a3;
@end

@implementation HMIVideoAssetWriterDelegateAdapter

- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidOutputInitializationSegment];

  if (v7)
  {
    v8 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidOutputInitializationSegment];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidOutputSeparableSegment];

  if (v10)
  {
    v11 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidOutputSeparableSegment];
    ((void (**)(void, id, id, id))v11)[2](v11, v12, v8, v9);
  }
}

- (void)assetWriter:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidFailWithError];

  if (v7)
  {
    id v8 = [(HMIVideoAssetWriterDelegateAdapter *)self assetWriterDidFailWithError];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)assetWriterDidOutputInitializationSegment
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAssetWriterDidOutputInitializationSegment:(id)a3
{
}

- (id)assetWriterDidOutputSeparableSegment
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAssetWriterDidOutputSeparableSegment:(id)a3
{
}

- (id)assetWriterDidFailWithError
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetWriterDidFailWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assetWriterDidFailWithError, 0);
  objc_storeStrong(&self->_assetWriterDidOutputSeparableSegment, 0);
  objc_storeStrong(&self->_assetWriterDidOutputInitializationSegment, 0);
}

@end