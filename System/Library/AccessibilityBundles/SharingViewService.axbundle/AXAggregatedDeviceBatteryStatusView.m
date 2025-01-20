@interface AXAggregatedDeviceBatteryStatusView
- (AXAggregatedDeviceBatteryStatusView)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4 primaryTitle:(id)a5 batteryLevelLabel:(id)a6 chargingImage:(id)a7 warningImage:(id)a8;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AXAggregatedDeviceBatteryStatusView

- (AXAggregatedDeviceBatteryStatusView)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4 primaryTitle:(id)a5 batteryLevelLabel:(id)a6 chargingImage:(id)a7 warningImage:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)AXAggregatedDeviceBatteryStatusView;
  v18 = [(UIAccessibilityAggregateElement *)&v21 initWithAccessibilityContainer:self representedElements:a4];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_primaryTitle, a5);
    if (([v15 isHidden] & 1) == 0) {
      objc_storeStrong(&v19->_batteryLevelLabel, a6);
    }
    if (([v16 isHidden] & 1) == 0) {
      objc_storeStrong(&v19->_chargingImage, a7);
    }
    if (([v17 isHidden] & 1) == 0) {
      objc_storeStrong(&v19->_warningImage, a8);
    }
  }

  return v19;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(NSString *)self->_primaryTitle length];
  if (v3) {
    v3 = self->_primaryTitle;
  }

  return v3;
}

- (id)accessibilityValue
{
  id batteryLevelLabel = self->_batteryLevelLabel;
  if (batteryLevelLabel)
  {
    v4 = [self->_batteryLevelLabel accessibilityLabel];
  }
  else
  {
    v4 = 0;
  }
  id chargingImage = self->_chargingImage;
  if (chargingImage)
  {
    v6 = accessibilityB188LocalizedString(@"device.battery.state.charging");
  }
  else
  {
    v6 = 0;
  }
  if (self->_warningImage)
  {
    v9 = accessibilityB188LocalizedString(@"device.battery.state.disconnected");
    v7 = __UIAXStringForVariables();

    if (!chargingImage) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v7 = __UIAXStringForVariables();
  if (chargingImage) {
LABEL_9:
  }

LABEL_10:
  if (batteryLevelLabel) {

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_warningImage, 0);
  objc_storeStrong(&self->_chargingImage, 0);
  objc_storeStrong(&self->_batteryLevelLabel, 0);

  objc_storeStrong((id *)&self->_primaryTitle, 0);
}

@end