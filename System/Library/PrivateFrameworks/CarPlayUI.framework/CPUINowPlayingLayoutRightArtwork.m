@interface CPUINowPlayingLayoutRightArtwork
- (BOOL)playModeControlButtonsFullWidth;
- (CGSize)maximumTitleViewSize;
- (CPUINowPlayingLayoutRightArtwork)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6;
- (UIEdgeInsets)layoutMargins;
- (double)albumArtWidthMultiplier;
- (unint64_t)artworkPosition;
- (unint64_t)trackInfoFontStyle;
@end

@implementation CPUINowPlayingLayoutRightArtwork

- (CPUINowPlayingLayoutRightArtwork)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)CPUINowPlayingLayoutRightArtwork;
  v14 = -[_CPUINowPlayingLayout initWithSafeArea:frame:displayScale:showsArtwork:](&v28, sel_initWithSafeArea_frame_displayScale_showsArtwork_, a6, a3.origin.x, *(void *)&a5);
  v15 = v14;
  if (v14)
  {
    [(CPUINowPlayingLayoutRightArtwork *)v14 layoutMargins];
    double v26 = v17;
    double v27 = v16;
    +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:1];
    CGFloat rect = v10;
    double v19 = v18;
    [(_CPUINowPlayingLayout *)v15 transportControlButtonHeight];
    double v21 = v19 + v20 + 18.0 + 14.0 + 26.0;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v22 = CGRectGetWidth(v29) * 0.360000014;
    v30.origin.CGFloat x = v13;
    v30.origin.CGFloat y = v12;
    v30.size.CGFloat width = v11;
    v30.size.CGFloat height = rect;
    double v23 = CGRectGetHeight(v30) - v27 - v26;
    if (v22 < v23) {
      double v23 = v22;
    }
    [(_CPUINowPlayingLayout *)v15 setVerticalCentering:v21 < v23];
  }
  return v15;
}

- (unint64_t)artworkPosition
{
  return 2;
}

- (double)albumArtWidthMultiplier
{
  [(CPUINowPlayingLayoutRightArtwork *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double Width = CGRectGetWidth(v16);
  [(_CPUINowPlayingLayout *)self viewAreaFrame];
  double v12 = CGRectGetWidth(v17) * 0.360000014;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double v13 = CGRectGetHeight(v18) - v4 - v8;
  if (v12 >= v13) {
    double v12 = v13;
  }
  [(_CPUINowPlayingLayout *)self minimumDesiredPlayModeControlButtonWidth];
  if (Width + v10 * -2.0 - v6 - v12 < v14)
  {
    [(_CPUINowPlayingLayout *)self safeAreaFrame];
    double v12 = CGRectGetHeight(v19) - v8 - v4 - 14.0 - 26.0 + -12.0;
  }
  return fmin(v12 / Width, 0.360000014);
}

- (unint64_t)trackInfoFontStyle
{
  [(CPUINowPlayingLayoutRightArtwork *)self maximumTitleViewSize];
  double v3 = v2;
  double v5 = v4;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:0];
  double v7 = v6;
  +[CPUISongDetailsView minimumHeightForTrackInfoFontStyle:1];
  if (v7 >= v8) {
    double v8 = v7;
  }
  if (v5 < v8) {
    return 0;
  }
  unint64_t v9 = 1;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:1];
  if (v5 < v10 && v3 <= 330.0) {
    return 0;
  }
  return v9;
}

- (BOOL)playModeControlButtonsFullWidth
{
  if ([(_CPUINowPlayingLayout *)self verticalCentering]) {
    return 0;
  }
  [(CPUINowPlayingLayoutRightArtwork *)self layoutMargins];
  double v5 = v4;
  double v7 = v6;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  CGFloat v8 = CGRectGetHeight(v10) - (v7 + v5);
  [(_CPUINowPlayingLayout *)self _effectiveAlbumArtSize];
  return v8 - v9 >= 26.0;
}

- (UIEdgeInsets)layoutMargins
{
  double v2 = 0.0;
  double v3 = 12.0;
  double v4 = 12.0;
  double v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)maximumTitleViewSize
{
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double Height = CGRectGetHeight(v21);
  [(CPUINowPlayingLayoutRightArtwork *)self layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_CPUINowPlayingLayout *)self transportControlButtonHeight];
  double v13 = v12;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double v14 = round(CGRectGetWidth(v22)) - (v7 + v11 * 2.0);
  if ([(_CPUINowPlayingLayout *)self showsArtwork])
  {
    [(_CPUINowPlayingLayout *)self _effectiveAlbumArtSize];
    double v14 = v14 - v15;
  }
  float v16 = v14;
  double v17 = floorf(v16);
  float v18 = round(Height) - (v5 + v9) - (14.0 + 26.0) - v13 + -18.0;
  double v19 = floorf(v18);
  result.CGFloat height = v19;
  result.CGFloat width = v17;
  return result;
}

@end