@interface MobileTimerUILabelAccessiblity
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MobileTimerUILabelAccessiblity

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(MobileTimerUILabelAccessiblity *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"timeLabel"])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"elapsed.time.format");
    v12.receiver = self;
    v12.super_class = (Class)MobileTimerUILabelAccessiblity;
    [(MobileTimerUILabelAccessiblity *)&v12 accessibilityLabel];
    v6 = LABEL_5:;
    v7 = AXLocalizeDurationTime();
    v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"currentLapTimeLabel"])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"lap.time.format");
    v11.receiver = self;
    v11.super_class = (Class)MobileTimerUILabelAccessiblity;
    [(MobileTimerUILabelAccessiblity *)&v11 accessibilityLabel];
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)MobileTimerUILabelAccessiblity;
  v8 = [(MobileTimerUILabelAccessiblity *)&v10 accessibilityLabel];
LABEL_7:

  return v8;
}

@end