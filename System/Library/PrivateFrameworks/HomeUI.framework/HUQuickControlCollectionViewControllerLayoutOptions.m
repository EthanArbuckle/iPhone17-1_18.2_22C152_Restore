@interface HUQuickControlCollectionViewControllerLayoutOptions
+ (id)defaultOptions;
+ (id)defaultOptionsForViewSize:(CGSize)a3;
- (CGSize)viewSize;
- (HUQuickControlCollectionViewControllerLayoutOptions)initWithViewSize:(CGSize)a3;
- (NSNumber)overrideSizeSubclass;
- (double)interitemSpacingForExtraSmallControlSize;
- (double)interitemSpacingForLargeControlSize;
- (double)interitemSpacingForRegularControlSize;
- (double)interitemSpacingForSmallControlSize;
- (double)minimumNavBarToControlsSpacing;
- (double)minimumSectionSpacing;
- (double)minimumSectionToSensorSectionSpacing;
- (double)rowSpacing;
- (double)thermostatSectionSpacingOverride;
- (int64_t)viewSizeSubclass;
- (unint64_t)preferredLayoutStyle;
- (unint64_t)titlePosition;
- (void)setInteritemSpacingForExtraSmallControlSize:(double)a3;
- (void)setInteritemSpacingForLargeControlSize:(double)a3;
- (void)setInteritemSpacingForRegularControlSize:(double)a3;
- (void)setInteritemSpacingForSmallControlSize:(double)a3;
- (void)setMinimumNavBarToControlsSpacing:(double)a3;
- (void)setMinimumSectionSpacing:(double)a3;
- (void)setMinimumSectionToSensorSectionSpacing:(double)a3;
- (void)setOverrideSizeSubclass:(id)a3;
- (void)setPreferredLayoutStyle:(unint64_t)a3;
- (void)setRowSpacing:(double)a3;
- (void)setThermostatSectionSpacingOverride:(double)a3;
- (void)setTitlePosition:(unint64_t)a3;
@end

@implementation HUQuickControlCollectionViewControllerLayoutOptions

+ (id)defaultOptions
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = -[HUQuickControlCollectionViewControllerLayoutOptions initWithViewSize:]([HUQuickControlCollectionViewControllerLayoutOptions alloc], "initWithViewSize:", a3.width, a3.height);
  uint64_t v4 = [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 viewSizeSubclass];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setPreferredLayoutStyle:1];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setRowSpacing:33.0];
  v16[0] = &unk_1F19B4688;
  v16[1] = &unk_1F19B46A0;
  v17[0] = &unk_1F19B6190;
  v17[1] = &unk_1F19B61A0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setMinimumSectionSpacing:HUConstantFloatForViewSizeSubclass(v4, v5)];

  v14[0] = &unk_1F19B4688;
  v14[1] = &unk_1F19B46A0;
  v15[0] = &unk_1F19B61B0;
  v15[1] = &unk_1F19B61C0;
  v14[2] = &unk_1F19B46B8;
  v15[2] = &unk_1F19B61D0;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setMinimumNavBarToControlsSpacing:HUConstantFloatForViewSizeSubclass(v4, v6)];

  v12[0] = &unk_1F19B4688;
  v12[1] = &unk_1F19B46A0;
  v13[0] = &unk_1F19B61E0;
  v13[1] = &unk_1F19B61F0;
  v12[2] = &unk_1F19B46B8;
  v13[2] = &unk_1F19B6200;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setMinimumSectionToSensorSectionSpacing:HUConstantFloatForViewSizeSubclass(v4, v7)];

  v10[0] = &unk_1F19B4688;
  v10[1] = &unk_1F19B46A0;
  v11[0] = &unk_1F19B6210;
  v11[1] = &unk_1F19B6220;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setThermostatSectionSpacingOverride:HUConstantFloatForViewSizeSubclass(v4, v8)];

  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setInteritemSpacingForExtraSmallControlSize:31.0];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setInteritemSpacingForSmallControlSize:31.0];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setInteritemSpacingForRegularControlSize:31.0];
  [(HUQuickControlCollectionViewControllerLayoutOptions *)v3 setInteritemSpacingForLargeControlSize:31.0];

  return v3;
}

- (HUQuickControlCollectionViewControllerLayoutOptions)initWithViewSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewControllerLayoutOptions;
  result = [(HUQuickControlCollectionViewControllerLayoutOptions *)&v6 init];
  if (result)
  {
    result->_viewSize.CGFloat width = width;
    result->_viewSize.CGFloat height = height;
  }
  return result;
}

- (int64_t)viewSizeSubclass
{
  [(HUQuickControlCollectionViewControllerLayoutOptions *)self viewSize];

  return HUViewSizeSubclassForViewSize(v2, v3);
}

- (double)rowSpacing
{
  return self->_rowSpacing;
}

- (void)setRowSpacing:(double)a3
{
  self->_rowSpacing = a3;
}

- (double)interitemSpacingForExtraSmallControlSize
{
  return self->_interitemSpacingForExtraSmallControlSize;
}

- (void)setInteritemSpacingForExtraSmallControlSize:(double)a3
{
  self->_interitemSpacingForExtraSmallControlSize = a3;
}

- (double)interitemSpacingForSmallControlSize
{
  return self->_interitemSpacingForSmallControlSize;
}

- (void)setInteritemSpacingForSmallControlSize:(double)a3
{
  self->_interitemSpacingForSmallControlSize = a3;
}

- (double)interitemSpacingForRegularControlSize
{
  return self->_interitemSpacingForRegularControlSize;
}

- (void)setInteritemSpacingForRegularControlSize:(double)a3
{
  self->_interitemSpacingForRegularControlSize = a3;
}

- (double)interitemSpacingForLargeControlSize
{
  return self->_interitemSpacingForLargeControlSize;
}

- (void)setInteritemSpacingForLargeControlSize:(double)a3
{
  self->_interitemSpacingForLargeControlSize = a3;
}

- (double)minimumSectionSpacing
{
  return self->_minimumSectionSpacing;
}

- (void)setMinimumSectionSpacing:(double)a3
{
  self->_minimumSectionSpacing = a3;
}

- (double)minimumNavBarToControlsSpacing
{
  return self->_minimumNavBarToControlsSpacing;
}

- (void)setMinimumNavBarToControlsSpacing:(double)a3
{
  self->_minimumNavBarToControlsSpacing = a3;
}

- (double)minimumSectionToSensorSectionSpacing
{
  return self->_minimumSectionToSensorSectionSpacing;
}

- (void)setMinimumSectionToSensorSectionSpacing:(double)a3
{
  self->_minimumSectionToSensorSectionSpacing = a3;
}

- (double)thermostatSectionSpacingOverride
{
  return self->_thermostatSectionSpacingOverride;
}

- (void)setThermostatSectionSpacingOverride:(double)a3
{
  self->_thermostatSectionSpacingOverride = a3;
}

- (unint64_t)preferredLayoutStyle
{
  return self->_preferredLayoutStyle;
}

- (void)setPreferredLayoutStyle:(unint64_t)a3
{
  self->_preferredLayoutStyle = a3;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)overrideSizeSubclass
{
  return self->_overrideSizeSubclass;
}

- (void)setOverrideSizeSubclass:(id)a3
{
}

- (void).cxx_destruct
{
}

@end