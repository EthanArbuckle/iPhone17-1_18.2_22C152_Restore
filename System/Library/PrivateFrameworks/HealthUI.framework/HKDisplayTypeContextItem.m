@interface HKDisplayTypeContextItem
- (BOOL)hasTitleAccessory;
- (BOOL)infoHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContextItem:(id)a3;
- (BOOL)isUnitIncludedInValue;
- (BOOL)useTightSpacingBetweenValueAndUnit;
- (BOOL)userInteractive;
- (HKDisplayTypeContextItem)init;
- (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelTextOverride;
- (HKDisplayTypeContextItemTitleAccessory)selectedTitleAccessory;
- (HKDisplayTypeContextItemTitleAccessory)titleAccessory;
- (HKUIMetricColors)metricColors;
- (HKUIMetricColors)selectedMetricColors;
- (NSString)accessibilityIdentifier;
- (NSString)analyticsIdentifier;
- (NSString)dateString;
- (NSString)title;
- (NSString)unit;
- (NSString)value;
- (NSString)valueContext;
- (id)debugDescription;
- (unint64_t)hash;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setAttributedLabelTextOverride:(id)a3;
- (void)setDateString:(id)a3;
- (void)setInfoHidden:(BOOL)a3;
- (void)setIsUnitIncludedInValue:(BOOL)a3;
- (void)setMetricColors:(id)a3;
- (void)setSelectedMetricColors:(id)a3;
- (void)setSelectedTitleAccessory:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAccessory:(id)a3;
- (void)setUnit:(id)a3;
- (void)setUseTightSpacingBetweenValueAndUnit:(BOOL)a3;
- (void)setUserInteractive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValueContext:(id)a3;
@end

@implementation HKDisplayTypeContextItem

- (HKDisplayTypeContextItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeContextItem;
  v2 = [(HKDisplayTypeContextItem *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HKDisplayTypeContextItem *)v2 setInfoHidden:1];
    [(HKDisplayTypeContextItem *)v3 setUserInteractive:1];
    [(HKDisplayTypeContextItem *)v3 setUnit:0];
    [(HKDisplayTypeContextItem *)v3 setValue:0];
    [(HKDisplayTypeContextItem *)v3 setValueContext:0];
    [(HKDisplayTypeContextItem *)v3 setAttributedLabelTextOverride:0];
  }
  return v3;
}

- (BOOL)hasTitleAccessory
{
  return self->_titleAccessory && self->_selectedTitleAccessory != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKDisplayTypeContextItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKDisplayTypeContextItem *)self isEqualToContextItem:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(HKDisplayTypeContextItemTitleAccessory *)self->_titleAccessory hash] ^ v3;
  unint64_t v5 = v4 ^ [(HKDisplayTypeContextItemTitleAccessory *)self->_selectedTitleAccessory hash] ^ self->_infoHidden;
  BOOL useTightSpacingBetweenValueAndUnit = self->_useTightSpacingBetweenValueAndUnit;
  NSUInteger v7 = useTightSpacingBetweenValueAndUnit ^ [(NSString *)self->_value hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_valueContext hash];
  unint64_t v9 = [(HKDisplayTypeContextItemAttributedLabelOverride *)self->_attributedLabelTextOverride hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_unit hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_dateString hash];
  return v8 ^ v11 ^ [(NSString *)self->_analyticsIdentifier hash];
}

- (BOOL)isEqualToContextItem:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  unint64_t v5 = v4;
  if (v4
    && ((unint64_t v6 = *((void *)v4 + 2), !(v6 | (unint64_t)self->_title))
     || objc_msgSend((id)v6, "isEqualToString:"))
    && (HKDisplayTypeContextItemTitleAccessory *)*((void *)v5 + 3) == self->_titleAccessory
    && (HKDisplayTypeContextItemTitleAccessory *)*((void *)v5 + 4) == self->_selectedTitleAccessory
    && v5[8] == self->_infoHidden
    && v5[9] == self->_useTightSpacingBetweenValueAndUnit
    && v5[10] == self->_isUnitIncludedInValue
    && v5[11] == self->_userInteractive
    && ((unint64_t v7 = *((void *)v5 + 6), !(v7 | (unint64_t)self->_value))
     || objc_msgSend((id)v7, "isEqualToString:"))
    && ((unint64_t v8 = *((void *)v5 + 7), !(v8 | (unint64_t)self->_valueContext))
     || objc_msgSend((id)v8, "isEqualToString:"))
    && [*((id *)v5 + 8) isEqual:self->_attributedLabelTextOverride]
    && ((unint64_t v9 = *((void *)v5 + 5), !(v9 | (unint64_t)self->_unit))
     || objc_msgSend((id)v9, "isEqualToString:"))
    && ((unint64_t v10 = *((void *)v5 + 9), !(v10 | (unint64_t)self->_dateString))
     || objc_msgSend((id)v10, "isEqualToString:")))
  {
    unint64_t v11 = *((void *)v5 + 10);
    if (v11 | (unint64_t)self->_analyticsIdentifier) {
      char v12 = objc_msgSend((id)v11, "isEqualToString:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)debugDescription
{
  NSUInteger v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKDisplayTypeContextItem;
  unint64_t v4 = [(HKDisplayTypeContextItem *)&v7 debugDescription];
  unint64_t v5 = [v3 stringWithFormat:@"%@: %@ %@ %@ (%@) %@", v4, self->_title, self->_value, self->_unit, self->_valueContext, self->_attributedLabelTextOverride];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (HKDisplayTypeContextItemTitleAccessory)titleAccessory
{
  return self->_titleAccessory;
}

- (void)setTitleAccessory:(id)a3
{
}

- (HKDisplayTypeContextItemTitleAccessory)selectedTitleAccessory
{
  return self->_selectedTitleAccessory;
}

- (void)setSelectedTitleAccessory:(id)a3
{
}

- (BOOL)infoHidden
{
  return self->_infoHidden;
}

- (void)setInfoHidden:(BOOL)a3
{
  self->_infoHidden = a3;
}

- (BOOL)useTightSpacingBetweenValueAndUnit
{
  return self->_useTightSpacingBetweenValueAndUnit;
}

- (void)setUseTightSpacingBetweenValueAndUnit:(BOOL)a3
{
  self->_BOOL useTightSpacingBetweenValueAndUnit = a3;
}

- (BOOL)isUnitIncludedInValue
{
  return self->_isUnitIncludedInValue;
}

- (void)setIsUnitIncludedInValue:(BOOL)a3
{
  self->_isUnitIncludedInValue = a3;
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)valueContext
{
  return self->_valueContext;
}

- (void)setValueContext:(id)a3
{
}

- (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelTextOverride
{
  return self->_attributedLabelTextOverride;
}

- (void)setAttributedLabelTextOverride:(id)a3
{
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (HKUIMetricColors)metricColors
{
  return self->_metricColors;
}

- (void)setMetricColors:(id)a3
{
}

- (HKUIMetricColors)selectedMetricColors
{
  return self->_selectedMetricColors;
}

- (void)setSelectedMetricColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMetricColors, 0);
  objc_storeStrong((id *)&self->_metricColors, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_attributedLabelTextOverride, 0);
  objc_storeStrong((id *)&self->_valueContext, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_selectedTitleAccessory, 0);
  objc_storeStrong((id *)&self->_titleAccessory, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end