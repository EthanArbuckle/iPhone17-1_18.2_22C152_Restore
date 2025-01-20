@interface QLVideoScrubberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsScrubbering;
- (BOOL)isUserInteractingWithScrubber;
- (void)_axSetIsScrubbering:(BOOL)a3;
@end

@implementation QLVideoScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLVideoScrubberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsScrubbering
{
  return MEMORY[0x270F09620](self, &__QLVideoScrubberViewAccessibility___axIsScrubbering);
}

- (void)_axSetIsScrubbering:(BOOL)a3
{
}

- (BOOL)isUserInteractingWithScrubber
{
  v3 = [(QLVideoScrubberViewAccessibility *)self accessibilityIdentification];
  if (![v3 isEqualToString:@"MediaScrubber"])
  {

    goto LABEL_7;
  }
  BOOL v4 = [(QLVideoScrubberViewAccessibility *)self _axIsScrubbering];

  if (!v4)
  {
LABEL_7:
    v6.receiver = self;
    v6.super_class = (Class)QLVideoScrubberViewAccessibility;
    return [(QLVideoScrubberViewAccessibility *)&v6 isUserInteractingWithScrubber];
  }

  return [(QLVideoScrubberViewAccessibility *)self _axIsScrubbering];
}

@end