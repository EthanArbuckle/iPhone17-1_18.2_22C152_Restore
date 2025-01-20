@interface CPUINowPlayingLayoutStacked
- (BOOL)playModeControlButtonsFullWidth;
- (BOOL)progressViewFullWidth;
- (CGSize)maximumNowPlayingSize;
- (CGSize)maximumTitleViewSize;
- (UIEdgeInsets)layoutMargins;
- (double)albumArtWidthMultiplier;
- (double)playModeControlButtonSpacing;
- (double)transportControlButtonSpacing;
- (unint64_t)artworkPosition;
- (unint64_t)trackInfoFontStyle;
@end

@implementation CPUINowPlayingLayoutStacked

- (unint64_t)artworkPosition
{
  return [(_CPUINowPlayingLayout *)self showsArtwork];
}

- (double)albumArtWidthMultiplier
{
  [(CPUINowPlayingLayoutStacked *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  CGFloat v11 = CGRectGetHeight(v20) - v4 - v8 - (26.0 + 14.0);
  [(_CPUINowPlayingLayout *)self transportControlButtonHeight];
  CGFloat v13 = v11 - v12 + -18.0;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:0];
  double v15 = v13 - v14;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double v16 = CGRectGetHeight(v21) * 0.400000006;
  if (v15 >= v16) {
    double v15 = v16;
  }
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  double v17 = CGRectGetWidth(v22) - v6 - v10;
  if (v15 >= v17) {
    double v18 = v17;
  }
  else {
    double v18 = v15;
  }
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  return v18 / CGRectGetWidth(v23);
}

- (BOOL)progressViewFullWidth
{
  return 1;
}

- (BOOL)playModeControlButtonsFullWidth
{
  return 1;
}

- (unint64_t)trackInfoFontStyle
{
  [(CPUINowPlayingLayoutStacked *)self maximumTitleViewSize];
  double v3 = v2;
  double v5 = v4;
  +[CPUISongDetailsView maximumHeightForTrackInfoFontStyle:1];
  return v3 >= 300.0 && v5 >= v6;
}

- (double)transportControlButtonSpacing
{
  return 16.0;
}

- (double)playModeControlButtonSpacing
{
  return 16.0;
}

- (UIEdgeInsets)layoutMargins
{
  double v2 = 0.0;
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)maximumTitleViewSize
{
  [(CPUINowPlayingLayoutStacked *)self maximumNowPlayingSize];
  if (v4 == *MEMORY[0x263F001B0] && v3 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(_CPUINowPlayingLayout *)self safeAreaFrame];
    double v7 = round(CGRectGetHeight(v23));
  }
  else
  {
    [(CPUINowPlayingLayoutStacked *)self maximumNowPlayingSize];
    double v7 = v6;
  }
  [(CPUINowPlayingLayoutStacked *)self layoutMargins];
  double v9 = v8;
  double v11 = v10;
  double v14 = v7 - (v12 + v13) - (26.0 + 14.0);
  [(_CPUINowPlayingLayout *)self transportControlButtonHeight];
  double v16 = v14 - v15 + -18.0;
  if ([(_CPUINowPlayingLayout *)self showsArtwork])
  {
    [(_CPUINowPlayingLayout *)self _effectiveAlbumArtSize];
    double v16 = v16 + -6.0 - v17;
  }
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  float v18 = round(CGRectGetWidth(v24)) - (v11 + v9);
  double v19 = floorf(v18);
  float v20 = v16;
  double v21 = floorf(v20);
  result.height = v21;
  result.width = v19;
  return result;
}

- (CGSize)maximumNowPlayingSize
{
  if ([(_CPUINowPlayingLayout *)self showsArtwork])
  {
    double v4 = *MEMORY[0x263F001B0];
    double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    [(_CPUINowPlayingLayout *)self safeAreaFrame];
    if (CGRectEqualToRect(v9, *MEMORY[0x263F001A8]))
    {
      double v3 = 480.0;
      double v4 = 500.0;
    }
    else
    {
      [(_CPUINowPlayingLayout *)self safeAreaFrame];
      double Width = CGRectGetWidth(v10);
      if (Width <= 500.0) {
        double v4 = Width;
      }
      else {
        double v4 = 500.0;
      }
      [(_CPUINowPlayingLayout *)self safeAreaFrame];
      double Height = CGRectGetHeight(v11);
      double v3 = 480.0;
      if (Height <= 480.0) {
        double v3 = Height;
      }
    }
  }
  double v7 = v4;
  result.height = v3;
  result.width = v7;
  return result;
}

@end