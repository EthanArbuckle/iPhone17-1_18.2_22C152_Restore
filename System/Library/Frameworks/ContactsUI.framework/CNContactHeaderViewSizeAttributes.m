@interface CNContactHeaderViewSizeAttributes
+ (id)defaultAttributes;
+ (id)displayAttributesWithNavBar;
+ (id)editingAttributes;
+ (id)editingAttributesWithNavBar;
+ (id)staticCollapsedDisplayAttributes;
+ (id)staticCollapsedDisplayAttributesWithNavBar;
+ (id)staticDisplayAttributes;
+ (id)staticDisplayAttributesWithNavBar;
+ (id)staticEditingAttributes;
+ (id)staticEditingAttributesWithNavBar;
- (CNContactHeaderViewSizeAttributes)init;
- (double)_maxHeight;
- (double)_minHeight;
- (double)headerBottomMargin;
- (double)maxHeight;
- (double)maxNavbarTitleOffset;
- (double)minHeight;
- (double)minNavbarTitleOffset;
- (double)navbarTitleOffsetWithPercentMax:(double)a3;
- (double)photoBottomMarginWithPercentMax:(double)a3;
- (double)photoHeightWithPercentMax:(double)a3;
- (double)photoMaxBottomMargin;
- (double)photoMaxHeight;
- (double)photoMaxHeightLowQuality;
- (double)photoMaxHeightPadCompact;
- (double)photoMaxHeightPhoneLandscape;
- (double)photoMaxTopMargin;
- (double)photoMinBottomMargin;
- (double)photoMinBottomMarginLowQuality;
- (double)photoMinBottomMarginPadCompact;
- (double)photoMinBottomMarginPhoneLandscape;
- (double)photoMinHeight;
- (double)photoMinTopMargin;
- (double)photoMinTopMarginPadCompact;
- (double)photoTopMarginWithPercentMax:(double)a3;
- (double)posterMaxHeight;
- (double)valueBetweenMin:(double)a3 max:(double)a4 percentMax:(double)a5;
- (void)setHeaderBottomMargin:(double)a3;
- (void)setMaxNavbarTitleOffset:(double)a3;
- (void)setMinNavbarTitleOffset:(double)a3;
- (void)setPhotoMaxBottomMargin:(double)a3;
- (void)setPhotoMaxHeight:(double)a3;
- (void)setPhotoMaxHeightLowQuality:(double)a3;
- (void)setPhotoMaxHeightPadCompact:(double)a3;
- (void)setPhotoMaxHeightPhoneLandscape:(double)a3;
- (void)setPhotoMaxTopMargin:(double)a3;
- (void)setPhotoMinBottomMargin:(double)a3;
- (void)setPhotoMinBottomMarginLowQuality:(double)a3;
- (void)setPhotoMinBottomMarginPadCompact:(double)a3;
- (void)setPhotoMinBottomMarginPhoneLandscape:(double)a3;
- (void)setPhotoMinHeight:(double)a3;
- (void)setPhotoMinTopMargin:(double)a3;
- (void)setPhotoMinTopMarginPadCompact:(double)a3;
- (void)setPosterMaxHeight:(double)a3;
- (void)set_maxHeight:(double)a3;
- (void)set_minHeight:(double)a3;
@end

@implementation CNContactHeaderViewSizeAttributes

- (void)set_maxHeight:(double)a3
{
  self->__maxHeight = a3;
}

- (double)_maxHeight
{
  return self->__maxHeight;
}

- (void)set_minHeight:(double)a3
{
  self->__minHeight = a3;
}

- (double)_minHeight
{
  return self->__minHeight;
}

- (void)setPhotoMaxHeightLowQuality:(double)a3
{
  self->_photoMaxHeightLowQuality = a3;
}

- (double)photoMaxHeightLowQuality
{
  return self->_photoMaxHeightLowQuality;
}

- (void)setPhotoMinBottomMarginPadCompact:(double)a3
{
  self->_photoMinBottomMarginPadCompact = a3;
}

- (double)photoMinBottomMarginPadCompact
{
  return self->_photoMinBottomMarginPadCompact;
}

- (void)setPhotoMinTopMarginPadCompact:(double)a3
{
  self->_photoMinTopMarginPadCompact = a3;
}

- (double)photoMinTopMarginPadCompact
{
  return self->_photoMinTopMarginPadCompact;
}

- (void)setPhotoMaxHeightPadCompact:(double)a3
{
  self->_photoMaxHeightPadCompact = a3;
}

- (double)photoMaxHeightPadCompact
{
  return self->_photoMaxHeightPadCompact;
}

- (void)setPhotoMinBottomMarginPhoneLandscape:(double)a3
{
  self->_photoMinBottomMarginPhoneLandscape = a3;
}

- (double)photoMinBottomMarginPhoneLandscape
{
  return self->_photoMinBottomMarginPhoneLandscape;
}

- (void)setPhotoMaxHeightPhoneLandscape:(double)a3
{
  self->_photoMaxHeightPhoneLandscape = a3;
}

- (double)photoMaxHeightPhoneLandscape
{
  return self->_photoMaxHeightPhoneLandscape;
}

- (void)setPosterMaxHeight:(double)a3
{
  self->_posterMaxHeight = a3;
}

- (double)posterMaxHeight
{
  return self->_posterMaxHeight;
}

- (void)setHeaderBottomMargin:(double)a3
{
  self->_headerBottomMargin = a3;
}

- (double)headerBottomMargin
{
  return self->_headerBottomMargin;
}

- (void)setMaxNavbarTitleOffset:(double)a3
{
  self->_maxNavbarTitleOffset = a3;
}

- (double)maxNavbarTitleOffset
{
  return self->_maxNavbarTitleOffset;
}

- (void)setMinNavbarTitleOffset:(double)a3
{
  self->_minNavbarTitleOffset = a3;
}

- (double)minNavbarTitleOffset
{
  return self->_minNavbarTitleOffset;
}

- (void)setPhotoMaxBottomMargin:(double)a3
{
  self->_photoMaxBottomMargin = a3;
}

- (double)photoMaxBottomMargin
{
  return self->_photoMaxBottomMargin;
}

- (void)setPhotoMinBottomMarginLowQuality:(double)a3
{
  self->_photoMinBottomMarginLowQuality = a3;
}

- (double)photoMinBottomMarginLowQuality
{
  return self->_photoMinBottomMarginLowQuality;
}

- (void)setPhotoMinBottomMargin:(double)a3
{
  self->_photoMinBottomMargin = a3;
}

- (double)photoMinBottomMargin
{
  return self->_photoMinBottomMargin;
}

- (void)setPhotoMaxTopMargin:(double)a3
{
  self->_photoMaxTopMargin = a3;
}

- (double)photoMaxTopMargin
{
  return self->_photoMaxTopMargin;
}

- (void)setPhotoMinTopMargin:(double)a3
{
  self->_photoMinTopMargin = a3;
}

- (double)photoMinTopMargin
{
  return self->_photoMinTopMargin;
}

- (void)setPhotoMaxHeight:(double)a3
{
  self->_photoMaxHeight = a3;
}

- (double)photoMaxHeight
{
  return self->_photoMaxHeight;
}

- (void)setPhotoMinHeight:(double)a3
{
  self->_photoMinHeight = a3;
}

- (double)photoMinHeight
{
  return self->_photoMinHeight;
}

- (double)navbarTitleOffsetWithPercentMax:(double)a3
{
  [(CNContactHeaderViewSizeAttributes *)self minNavbarTitleOffset];
  double v6 = v5;
  [(CNContactHeaderViewSizeAttributes *)self maxNavbarTitleOffset];

  [(CNContactHeaderViewSizeAttributes *)self valueBetweenMin:v6 max:v7 percentMax:a3];
  return result;
}

- (double)photoBottomMarginWithPercentMax:(double)a3
{
  [(CNContactHeaderViewSizeAttributes *)self photoMinBottomMargin];
  double v6 = v5;
  [(CNContactHeaderViewSizeAttributes *)self photoMaxBottomMargin];

  [(CNContactHeaderViewSizeAttributes *)self valueBetweenMin:v6 max:v7 percentMax:a3];
  return result;
}

- (double)photoTopMarginWithPercentMax:(double)a3
{
  [(CNContactHeaderViewSizeAttributes *)self photoMinTopMargin];
  double v6 = v5;
  [(CNContactHeaderViewSizeAttributes *)self photoMaxTopMargin];

  [(CNContactHeaderViewSizeAttributes *)self valueBetweenMin:v6 max:v7 percentMax:a3];
  return result;
}

- (double)photoHeightWithPercentMax:(double)a3
{
  [(CNContactHeaderViewSizeAttributes *)self photoMinHeight];
  double v6 = v5;
  [(CNContactHeaderViewSizeAttributes *)self photoMaxHeight];

  [(CNContactHeaderViewSizeAttributes *)self valueBetweenMin:v6 max:v7 percentMax:a3];
  return result;
}

- (double)valueBetweenMin:(double)a3 max:(double)a4 percentMax:(double)a5
{
  return a3 + a5 * (a4 - a3);
}

- (double)maxHeight
{
  [(CNContactHeaderViewSizeAttributes *)self _maxHeight];
  if (v3 == 0.0)
  {
    [(CNContactHeaderViewSizeAttributes *)self photoMaxTopMargin];
    double v5 = v4;
    [(CNContactHeaderViewSizeAttributes *)self photoMaxHeight];
    double v7 = v5 + v6;
    [(CNContactHeaderViewSizeAttributes *)self photoMaxBottomMargin];
    [(CNContactHeaderViewSizeAttributes *)self set_maxHeight:v7 + v8];
  }

  [(CNContactHeaderViewSizeAttributes *)self _maxHeight];
  return result;
}

- (double)minHeight
{
  [(CNContactHeaderViewSizeAttributes *)self _minHeight];
  if (v3 == 0.0)
  {
    [(CNContactHeaderViewSizeAttributes *)self photoMinTopMargin];
    double v5 = v4;
    [(CNContactHeaderViewSizeAttributes *)self photoMinHeight];
    double v7 = v5 + v6;
    [(CNContactHeaderViewSizeAttributes *)self photoMinBottomMargin];
    [(CNContactHeaderViewSizeAttributes *)self set_minHeight:v7 + v8];
  }

  [(CNContactHeaderViewSizeAttributes *)self _minHeight];
  return result;
}

- (CNContactHeaderViewSizeAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderViewSizeAttributes;
  double result = [(CNContactHeaderViewSizeAttributes *)&v3 init];
  *(_OWORD *)&result->_photoMinHeight = xmmword_18B9C3770;
  *(_OWORD *)&result->_photoMinTopMargin = xmmword_18B9C3780;
  result->_photoMinBottomMargin = 6.0;
  *(_OWORD *)&result->_photoMaxBottomMargin = xmmword_18B9C3790;
  result->_headerBottomMargin = 0.0;
  result->_posterMaxHeight = 0.0;
  result->_maxNavbarTitleOffset = 0.0;
  return result;
}

+ (id)staticEditingAttributesWithNavBar
{
  v2 = [a1 staticEditingAttributes];
  [v2 minNavbarTitleOffset];
  [v2 setMinNavbarTitleOffset:v3 + 26.0];
  [v2 maxNavbarTitleOffset];
  [v2 setMaxNavbarTitleOffset:v4 + 26.0];

  return v2;
}

+ (id)staticCollapsedDisplayAttributesWithNavBar
{
  v2 = [a1 staticCollapsedDisplayAttributes];
  [v2 minNavbarTitleOffset];
  [v2 setMinNavbarTitleOffset:v3 + 26.0];
  [v2 maxNavbarTitleOffset];
  [v2 setMaxNavbarTitleOffset:v4 + 26.0];

  return v2;
}

+ (id)staticDisplayAttributesWithNavBar
{
  v2 = [a1 staticDisplayAttributes];
  [v2 minNavbarTitleOffset];
  [v2 setMinNavbarTitleOffset:v3 + 26.0];
  [v2 maxNavbarTitleOffset];
  [v2 setMaxNavbarTitleOffset:v4 + 26.0];

  return v2;
}

+ (id)displayAttributesWithNavBar
{
  v2 = [a1 defaultAttributes];
  [v2 minNavbarTitleOffset];
  [v2 setMinNavbarTitleOffset:v3 + 20.0];
  [v2 maxNavbarTitleOffset];
  [v2 setMaxNavbarTitleOffset:v4 + 20.0];

  return v2;
}

+ (id)editingAttributesWithNavBar
{
  v2 = [a1 editingAttributes];
  [v2 minNavbarTitleOffset];
  [v2 setMinNavbarTitleOffset:v3 + 20.0];
  [v2 maxNavbarTitleOffset];
  [v2 setMaxNavbarTitleOffset:v4 + 20.0];

  return v2;
}

+ (id)staticEditingAttributes
{
  v2 = [a1 editingAttributes];
  [v2 setPhotoMinHeight:40.0];
  [v2 setPhotoMaxHeight:175.0];
  [v2 setPhotoMaxHeightLowQuality:86.0];
  [v2 setPhotoMaxTopMargin:0.0];
  [v2 setPhotoMinTopMargin:0.0];
  [v2 setPhotoMaxBottomMargin:24.0];
  [v2 setPhotoMinBottomMargin:24.0];
  [v2 setPosterMaxHeight:250.0];

  return v2;
}

+ (id)staticCollapsedDisplayAttributes
{
  v2 = [a1 defaultAttributes];
  [v2 setPhotoMinTopMargin:2.0];
  [v2 setPhotoMinBottomMargin:6.0];
  [v2 setHeaderBottomMargin:16.0];

  return v2;
}

+ (id)staticDisplayAttributes
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = [a1 defaultAttributes];
  double v6 = v5;
  double v7 = 70.0;
  if (v4 == 1)
  {
    double v8 = 29.0;
  }
  else
  {
    double v7 = 0.0;
    double v8 = 26.0;
  }
  [v5 setPhotoMinTopMargin:v7];
  [v6 setPhotoMinBottomMargin:v8];
  [v6 setPhotoMinBottomMarginLowQuality:11.0];
  [v6 setPhotoMinTopMarginPadCompact:0.0];
  [v6 setPhotoMinBottomMarginPadCompact:26.0];
  [v6 setPhotoMinBottomMarginPhoneLandscape:21.0];
  [v6 setPhotoMinHeight:88.0];
  [v6 setPhotoMaxHeight:320.0];
  [v6 setPhotoMaxHeightLowQuality:86.0];
  [v6 setPhotoMaxHeightPhoneLandscape:108.0];
  [v6 setPhotoMaxHeightPadCompact:140.0];
  [v6 setHeaderBottomMargin:17.0];

  return v6;
}

+ (id)editingAttributes
{
  v2 = [a1 defaultAttributes];
  [v2 setPhotoMaxHeight:168.0];
  [v2 setPhotoMaxTopMargin:40.0];
  [v2 setPhotoMinBottomMargin:12.0];
  [v2 setPhotoMaxBottomMargin:24.0];

  return v2;
}

+ (id)defaultAttributes
{
  v2 = objc_alloc_init(CNContactHeaderViewSizeAttributes);

  return v2;
}

@end