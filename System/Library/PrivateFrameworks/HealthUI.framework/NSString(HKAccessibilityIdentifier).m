@interface NSString(HKAccessibilityIdentifier)
+ (id)healthAccessibilityIdentifier:()HKAccessibilityIdentifier suffix:;
@end

@implementation NSString(HKAccessibilityIdentifier)

+ (id)healthAccessibilityIdentifier:()HKAccessibilityIdentifier suffix:
{
  id v5 = a4;
  if (a3)
  {
    v6 = &stru_1F3B9CF20;
    if (a3 == 1) {
      v6 = @"ECG";
    }
    if (a3 == 2) {
      v6 = @"IRN";
    }
    v7 = [@"UIA.Health" stringByAppendingFormat:@".%@", v6];
  }
  else
  {
    v7 = @"UIA.Health";
  }
  v8 = v7;
  v9 = [(__CFString *)v7 stringByAppendingFormat:@".%@", v5];

  return v9;
}

@end