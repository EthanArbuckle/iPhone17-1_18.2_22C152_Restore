@interface _CPUINowPlayingLayout
- (BOOL)isEqual:(id)a3;
- (BOOL)playModeControlButtonsFullWidth;
- (BOOL)progressViewFullWidth;
- (BOOL)showsArtwork;
- (BOOL)verticalCentering;
- (CGRect)safeAreaFrame;
- (CGRect)viewAreaFrame;
- (CGSize)maximumNowPlayingSize;
- (CGSize)maximumTitleViewSize;
- (UIEdgeInsets)layoutMargins;
- (_CPUINowPlayingLayout)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6;
- (double)_effectiveAlbumArtSize;
- (double)_scaledHeight;
- (double)_scaledWidth;
- (double)albumArtWidthMultiplier;
- (double)displayScale;
- (double)minimumDesiredPlayModeControlButtonWidth;
- (double)playModeControlButtonSpacing;
- (double)playModeControlButtonWidth;
- (double)transportControlButtonHeight;
- (double)transportControlButtonSpacing;
- (double)verticalEdgePadding;
- (unint64_t)artworkPosition;
- (unint64_t)hash;
- (unint64_t)trackInfoFontStyle;
- (void)setDisplayScale:(double)a3;
- (void)setSafeAreaFrame:(CGRect)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setVerticalCentering:(BOOL)a3;
- (void)setViewAreaFrame:(CGRect)a3;
@end

@implementation _CPUINowPlayingLayout

- (_CPUINowPlayingLayout)initWithSafeArea:(CGRect)a3 frame:(CGRect)a4 displayScale:(double)a5 showsArtwork:(BOOL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = a3.size.height;
  CGFloat v12 = a3.size.width;
  CGFloat v13 = a3.origin.y;
  CGFloat v14 = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)_CPUINowPlayingLayout;
  result = [(_CPUINowPlayingLayout *)&v16 init];
  if (result)
  {
    result->_safeAreaFrame.origin.CGFloat y = v13;
    result->_safeAreaFrame.size.CGFloat width = v12;
    result->_safeAreaFrame.size.CGFloat height = v11;
    result->_viewAreaFrame.origin.CGFloat x = x;
    result->_viewAreaFrame.origin.CGFloat y = y;
    result->_viewAreaFrame.size.CGFloat width = width;
    result->_viewAreaFrame.size.CGFloat height = height;
    result->_displayScale = a5;
    result->_safeAreaFrame.origin.CGFloat x = v14;
    result->_showsArtwork = a6;
    result->_verticalCentering = 0;
  }
  return result;
}

- (unint64_t)hash
{
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  v3 = NSStringFromCGRect(v17);
  uint64_t v4 = [v3 hash];
  [(_CPUINowPlayingLayout *)self viewAreaFrame];
  v5 = NSStringFromCGRect(v18);
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = NSNumber;
  [(_CPUINowPlayingLayout *)self displayScale];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v9 = v6 ^ [v8 hash];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CPUINowPlayingLayout artworkPosition](self, "artworkPosition"));
  uint64_t v11 = [v10 hash];
  CGFloat v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_CPUINowPlayingLayout showsArtwork](self, "showsArtwork"));
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  CGFloat v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_CPUINowPlayingLayout verticalCentering](self, "verticalCentering"));
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_CPUINowPlayingLayout *)a3;
  if (v4 == self)
  {
    LOBYTE(v35) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(_CPUINowPlayingLayout *)self safeAreaFrame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(_CPUINowPlayingLayout *)v5 safeAreaFrame];
      v40.origin.CGFloat x = v14;
      v40.origin.CGFloat y = v15;
      v40.size.CGFloat width = v16;
      v40.size.CGFloat height = v17;
      v38.origin.CGFloat x = v7;
      v38.origin.CGFloat y = v9;
      v38.size.CGFloat width = v11;
      v38.size.CGFloat height = v13;
      if (!CGRectEqualToRect(v38, v40)) {
        goto LABEL_8;
      }
      [(_CPUINowPlayingLayout *)self viewAreaFrame];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      [(_CPUINowPlayingLayout *)v5 viewAreaFrame];
      v41.origin.CGFloat x = v26;
      v41.origin.CGFloat y = v27;
      v41.size.CGFloat width = v28;
      v41.size.CGFloat height = v29;
      v39.origin.CGFloat x = v19;
      v39.origin.CGFloat y = v21;
      v39.size.CGFloat width = v23;
      v39.size.CGFloat height = v25;
      if (!CGRectEqualToRect(v39, v41)) {
        goto LABEL_8;
      }
      [(_CPUINowPlayingLayout *)self displayScale];
      double v31 = v30;
      [(_CPUINowPlayingLayout *)v5 displayScale];
      if (vabdd_f64(v31, v32) < 0.00000011920929
        && (unint64_t v33 = [(_CPUINowPlayingLayout *)self artworkPosition],
            v33 == [(_CPUINowPlayingLayout *)v5 artworkPosition])
        && (BOOL v34 = [(_CPUINowPlayingLayout *)self showsArtwork],
            v34 == [(_CPUINowPlayingLayout *)v5 showsArtwork]))
      {
        BOOL v37 = [(_CPUINowPlayingLayout *)self verticalCentering];
        BOOL v35 = v37 ^ [(_CPUINowPlayingLayout *)v5 verticalCentering] ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v35) = 0;
      }
    }
    else
    {
      LOBYTE(v35) = 0;
    }
  }

  return v35;
}

- (double)_scaledWidth
{
  [(_CPUINowPlayingLayout *)self viewAreaFrame];
  double Width = CGRectGetWidth(v6);
  [(_CPUINowPlayingLayout *)self displayScale];
  return Width * v4;
}

- (double)_scaledHeight
{
  [(_CPUINowPlayingLayout *)self viewAreaFrame];
  double Height = CGRectGetHeight(v6);
  [(_CPUINowPlayingLayout *)self displayScale];
  return Height * v4;
}

- (double)_effectiveAlbumArtSize
{
  [(_CPUINowPlayingLayout *)self albumArtWidthMultiplier];
  double v4 = v3;
  [(_CPUINowPlayingLayout *)self viewAreaFrame];
  return v4 * CGRectGetWidth(v6);
}

- (unint64_t)artworkPosition
{
  return 0;
}

- (double)albumArtWidthMultiplier
{
  return 0.0;
}

- (CGSize)maximumNowPlayingSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)transportControlButtonHeight
{
  [(_CPUINowPlayingLayout *)self _scaledWidth];
  double v4 = v3;
  [(_CPUINowPlayingLayout *)self _scaledHeight];
  BOOL v7 = (v4 >= 1400.0 || v5 < 624.0) && v5 <= 720.0;
  double result = 36.0;
  if (!v7) {
    return 44.0;
  }
  return result;
}

- (double)transportControlButtonSpacing
{
  [(_CPUINowPlayingLayout *)self _scaledWidth];
  BOOL v3 = v2 < 1120.0;
  double result = 16.0;
  if (v3) {
    return 10.0;
  }
  return result;
}

- (double)playModeControlButtonWidth
{
  return 44.0;
}

- (double)minimumDesiredPlayModeControlButtonWidth
{
  [(_CPUINowPlayingLayout *)self playModeControlButtonWidth];
  double v4 = v3;
  [(_CPUINowPlayingLayout *)self playModeControlButtonSpacing];
  return v5 * 4.0 + v4 * 5.0;
}

- (double)playModeControlButtonSpacing
{
  [(_CPUINowPlayingLayout *)self _scaledWidth];
  BOOL v3 = v2 < 1120.0;
  double result = 16.0;
  if (v3) {
    return 10.0;
  }
  return result;
}

- (BOOL)playModeControlButtonsFullWidth
{
  return 0;
}

- (unint64_t)trackInfoFontStyle
{
  return 0;
}

- (double)verticalEdgePadding
{
  return 0.0;
}

- (UIEdgeInsets)layoutMargins
{
  [(_CPUINowPlayingLayout *)self doesNotRecognizeSelector:a2];
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)progressViewFullWidth
{
  [(_CPUINowPlayingLayout *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(_CPUINowPlayingLayout *)self safeAreaFrame];
  CGFloat v7 = CGRectGetHeight(v10) - (v6 + v4);
  [(_CPUINowPlayingLayout *)self _effectiveAlbumArtSize];
  return floor(v7 - v8 + -12.0 - 26.0) >= 14.0;
}

- (CGSize)maximumTitleViewSize
{
  [(_CPUINowPlayingLayout *)self doesNotRecognizeSelector:a2];
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGRect)safeAreaFrame
{
  double x = self->_safeAreaFrame.origin.x;
  double y = self->_safeAreaFrame.origin.y;
  double width = self->_safeAreaFrame.size.width;
  double height = self->_safeAreaFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSafeAreaFrame:(CGRect)a3
{
  self->_safeAreaFrame = a3;
}

- (CGRect)viewAreaFrame
{
  double x = self->_viewAreaFrame.origin.x;
  double y = self->_viewAreaFrame.origin.y;
  double width = self->_viewAreaFrame.size.width;
  double height = self->_viewAreaFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewAreaFrame:(CGRect)a3
{
  self->_viewAreaFrame = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (void)setShowsArtwork:(BOOL)a3
{
  self->_showsArtwork = a3;
}

- (BOOL)verticalCentering
{
  return self->_verticalCentering;
}

- (void)setVerticalCentering:(BOOL)a3
{
  self->_verticalCentering = a3;
}

@end