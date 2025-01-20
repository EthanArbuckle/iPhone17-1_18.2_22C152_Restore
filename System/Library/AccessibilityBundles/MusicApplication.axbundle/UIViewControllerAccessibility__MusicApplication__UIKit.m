@interface UIViewControllerAccessibility__MusicApplication__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3;
- (void)viewDidLoad;
@end

@implementation UIViewControllerAccessibility__MusicApplication__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)UIViewControllerAccessibility__MusicApplication__UIKit;
  [(UIViewControllerAccessibility__MusicApplication__UIKit *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_didChangeVoiceOverOrSwitchControlStatus_ name:*MEMORY[0x263F1CF90] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_didChangeVoiceOverOrSwitchControlStatus_ name:*MEMORY[0x263F1CEB8] object:0];

  [(UIViewControllerAccessibility__MusicApplication__UIKit *)self didChangeVoiceOverOrSwitchControlStatus:0];
}

- (void)didChangeVoiceOverOrSwitchControlStatus:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [(UIViewControllerAccessibility__MusicApplication__UIKit *)self safeValueForKey:@"navigationItem"];
  v6 = __UIAccessibilityCastAsClass();

  BOOL v7 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  [v6 setHidesSearchBarWhenScrolling:v7];
}

@end