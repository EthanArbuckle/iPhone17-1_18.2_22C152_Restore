@interface PHImageResourceChooserRequestInfo
- (BOOL)isCloudShared;
- (CGSize)desiredSize;
- (NSArray)allowedResourceVersions;
- (NSString)loggingPrefix;
- (PHImageRequestBehaviorSpec)behaviorSpec;
- (PHImageResourceChooserRequestInfo)initWithAsset:(id)a3 desiredSize:(CGSize)a4 requestedScale:(float)a5 allowedResourceVersions:(id)a6 behaviorSpec:(id)a7 cloudSharedMode:(BOOL)a8 fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a9 loggingPrefix:(id)a10;
- (PHResourceChooserAsset)asset;
- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
- (float)requestedScale;
- (void)setLoggingPrefix:(id)a3;
@end

@implementation PHImageResourceChooserRequestInfo

- (float)requestedScale
{
  return self->_requestedScale;
}

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (CGSize)desiredSize
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)allowedResourceVersions
{
  return self->_allowedResourceVersions;
}

- (PHResourceChooserAsset)asset
{
  return self->_asset;
}

- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable
{
  return self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
}

- (PHImageResourceChooserRequestInfo)initWithAsset:(id)a3 desiredSize:(CGSize)a4 requestedScale:(float)a5 allowedResourceVersions:(id)a6 behaviorSpec:(id)a7 cloudSharedMode:(BOOL)a8 fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a9 loggingPrefix:(id)a10
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v20 = a3;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PHImageResourceChooserRequestInfo;
  v24 = [(PHImageResourceChooserRequestInfo *)&v27 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_asset, a3);
    v25->_desiredSize.CGFloat width = width;
    v25->_desiredSize.CGFloat height = height;
    v25->_requestedScale = a5;
    objc_storeStrong((id *)&v25->_allowedResourceVersions, a6);
    objc_storeStrong((id *)&v25->_behaviorSpec, a7);
    v25->_isCloudShared = a8;
    v25->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable = a9;
    objc_storeStrong((id *)&v25->_loggingPrefix, a10);
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_allowedResourceVersions, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setLoggingPrefix:(id)a3
{
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

- (BOOL)isCloudShared
{
  return self->_isCloudShared;
}

@end