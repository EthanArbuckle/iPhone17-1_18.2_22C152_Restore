@interface UILabel(_HKElectrocardiogramInfoView)
+ (id)_hkecg_bodyLabel;
+ (id)_hkecg_heartRateLabel;
@end

@implementation UILabel(_HKElectrocardiogramInfoView)

+ (id)_hkecg_heartRateLabel
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAdjustsFontForContentSizeCategory:1];
  [v0 setAdjustsFontSizeToFitWidth:1];
  [v0 setTextAlignment:4];
  v1 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v0 setFont:v1];

  v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v0 setTextColor:v2];

  return v0;
}

+ (id)_hkecg_bodyLabel
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setAdjustsFontForContentSizeCategory:1];
  [v0 setNumberOfLines:0];
  [v0 setTextAlignment:4];
  v1 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v0 setFont:v1];

  v2 = [MEMORY[0x1E4FB1618] labelColor];
  [v0 setTextColor:v2];

  return v0;
}

@end