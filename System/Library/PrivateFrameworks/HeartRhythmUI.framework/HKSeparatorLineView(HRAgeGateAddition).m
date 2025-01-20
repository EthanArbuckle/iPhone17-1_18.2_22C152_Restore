@interface HKSeparatorLineView(HRAgeGateAddition)
+ (id)_hragegate_separatorView;
@end

@implementation HKSeparatorLineView(HRAgeGateAddition)

+ (id)_hragegate_separatorView
{
  id v0 = objc_alloc_init(MEMORY[0x263F46968]);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  v1 = [MEMORY[0x263F1C550] separatorColor];
  [v0 setColor:v1];

  HKUIFloorToScreenScale();
  objc_msgSend(v0, "setSeparatorThickness:");
  [v0 setDashStyle:0];
  return v0;
}

@end