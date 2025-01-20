@interface NSObject
- (BOOL)_accessibilitySuppressKeylineAnnouncement;
- (id)_accessibilityCharacterVoiceName;
- (id)_accessibilityComplicationAppName;
- (id)_accessibilityComplicationSubType;
- (id)_accessibilityEditOptionDescription;
- (id)_accessibilityExtendedEditOptionDescription:(id)a3;
- (id)_accessibilityFaceVariantType;
- (id)_accessibilityWorldClockCityName;
- (id)_accessibilityWorldClockStringFromLabel:(id)a3;
- (void)_accessibilitySetWorldClockCityName:(id)a3;
@end

@implementation NSObject

- (id)_accessibilityWorldClockCityName
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NSObject___accessibilityWorldClockCityName);
}

- (void)_accessibilitySetWorldClockCityName:(id)a3
{
}

- (id)_accessibilityWorldClockStringFromLabel:(id)a3
{
  id v4 = a3;
  v5 = [self _accessibilityWorldClockCityName];
  id v6 = [v5 length];
  id v7 = objc_alloc((Class)AXAttributedString);
  if (v6)
  {
    v8 = [self _accessibilityWorldClockCityName];
    id v9 = [v7 initWithString:v8];

    id v10 = objc_alloc((Class)AXAttributedString);
    v11 = [v4 accessibilityLabel];
    id v12 = [v10 initWithString:v11];

    [v12 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenClockTime];
    [v9 appendAXAttributedString:v12];
  }
  else
  {
    AXNTKLocalizedStringForKey();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v7 initWithString:v12];
  }

  return v9;
}

- (id)_accessibilityFaceVariantType
{
  return 0;
}

- (id)_accessibilityComplicationSubType
{
  return 0;
}

- (id)_accessibilityEditOptionDescription
{
  return 0;
}

- (id)_accessibilityExtendedEditOptionDescription:(id)a3
{
  return 0;
}

- (id)_accessibilityComplicationAppName
{
  return 0;
}

- (BOOL)_accessibilitySuppressKeylineAnnouncement
{
  return 0;
}

- (id)_accessibilityCharacterVoiceName
{
  return 0;
}

@end