@interface JFXOverlayEffectFrame
+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9;
- (BOOL)isTrackedButTrackingUnavailable;
- (CGPoint)overlayCenter;
- (JFXOverlayEffectFrame)initWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9;
- (id)description;
- (int64_t)trackingType;
- (void)setOverlayCenter:(CGPoint)a3;
- (void)setTrackingType:(int64_t)a3;
@end

@implementation JFXOverlayEffectFrame

+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v13 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = *a6;
  v19 = objc_msgSend(v18, "initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v17, v13, &v21, v11, v10, v9, width, height);

  return v19;
}

- (JFXOverlayEffectFrame)initWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v13 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXOverlayEffectFrame;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a6;
  id v18 = -[JFXTextEffectFrame initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](&v28, sel_initWithEffect_relativeToSize_origin_time_forcePosterFrame_includeDropShadow_includeTextFrames_, v17, v13, &v27, v11, v10, v9, width, height);
  if (v18)
  {
    v19 = [v17 renderEffect];
    v20 = [v17 trackingProps];
    if (v20)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v21 = [v17 trackingProps];
      v18->_trackingType = [v21 currentTrackingType];
    }
    else
    {
      v18->_trackingType = 0;
    }

    v22 = +[JFXOverlayEffectTransforms transformsWithEffect:v17];
    [(JFXTextEffectFrame *)v18 setTransforms:v22];

    $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a6;
    objc_msgSend(v17, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v27, v11, 1, 1, v13, 0.0, 0.0, width, height);
    -[JFXOverlayEffectFrame setOverlayCenter:](v18, "setOverlayCenter:");
    [v17 hitAreaScale];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a6;
    v23 = objc_msgSend(v19, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v27, v11, 0, v13);
    [(JFXTextEffectFrame *)v18 setHitAreaPoints:v23];

    CGPathRef path = 0;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a6;
    v24 = (const CGPath *)objc_msgSend(v17, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v27, v11, v13, 1, &path, 0.0, 0.0, width, height, 44.0 / width, 44.0 / height);
    [(JFXTextEffectFrame *)v18 setHitAreaPath:v24];
    [(JFXTextEffectFrame *)v18 setExpandedHitAreaPath:path];
    CGPathRelease(v24);
    CGPathRelease(path);
  }
  return v18;
}

- (BOOL)isTrackedButTrackingUnavailable
{
  if (![(JFXOverlayEffectFrame *)self trackingType]) {
    return 0;
  }
  v3 = [(JFXTextEffectFrame *)self transforms];
  v4 = [v3 faceTrackingTransform];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)JFXOverlayEffectFrame;
  v4 = [(JFXTextEffectFrame *)&v8 description];
  BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[JFXOverlayEffectFrame trackingType](self, "trackingType"));
  v6 = [v3 stringWithFormat:@"%@\ntrackingType: %@", v4, v5];

  return v6;
}

- (int64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(int64_t)a3
{
  self->_trackingType = a3;
}

- (CGPoint)overlayCenter
{
  double x = self->_overlayCenter.x;
  double y = self->_overlayCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOverlayCenter:(CGPoint)a3
{
  self->_overlayCenter = a3;
}

@end