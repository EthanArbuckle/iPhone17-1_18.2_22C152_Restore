@interface SiriMoviesRottenTomatoesRatingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SiriMoviesRottenTomatoesRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesRottenTomatoesRatingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesRottenTomatoesRatingView", @"_isFresh", "B", 0);
  [v3 validateClass:@"SiriMoviesRottenTomatoesRatingView" hasInstanceVariable:@"_percentageLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(SiriMoviesRottenTomatoesRatingViewAccessibility *)self safeValueForKey:@"_percentageLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [MEMORY[0x263F08B08] scannerWithString:v4];
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v5 scanInteger:&v13])
  {
    int v6 = [(SiriMoviesRottenTomatoesRatingViewAccessibility *)self safeBoolForKey:@"_isFresh"];
    v7 = NSString;
    if (v6) {
      v8 = @"rotten.tomatoes.fresh";
    }
    else {
      v8 = @"rotten.tomatoes.rotten";
    }
    v10 = accessibilityLocalizedString(v8);
    v11 = AXFormatFloatWithPercentage();
    objc_msgSend(v7, "stringWithFormat:", v10, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end