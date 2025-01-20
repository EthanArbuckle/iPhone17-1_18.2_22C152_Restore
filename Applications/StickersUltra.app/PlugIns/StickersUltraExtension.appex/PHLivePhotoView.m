@interface PHLivePhotoView
- (CGSize)intrinsicContentSize;
@end

@implementation PHLivePhotoView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  v3 = [(PHLivePhotoView *)v2 livePhoto];
  if (v3)
  {
    v4 = v3;
    [(PHLivePhoto *)v3 size];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end