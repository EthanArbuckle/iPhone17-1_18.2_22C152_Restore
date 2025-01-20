@interface TimerSnippetTimeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)updateDisplayWithTime:(double)a3;
@end

@implementation TimerSnippetTimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TimerSnippetTimeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)updateDisplayWithTime:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TimerSnippetTimeViewAccessibility;
  BOOL v4 = -[TimerSnippetTimeViewAccessibility updateDisplayWithTime:](&v9, sel_updateDisplayWithTime_);
  v5 = [(TimerSnippetTimeViewAccessibility *)self safeValueForKey:@"_fireTime"];
  [v5 doubleValue];

  v6 = UIAXTimeStringForDuration();
  v7 = [MEMORY[0x263F21660] axAttributedStringWithString:v6];
  [v7 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21738]];
  [(TimerSnippetTimeViewAccessibility *)self setAccessibilityLabel:v7];

  return v4;
}

@end