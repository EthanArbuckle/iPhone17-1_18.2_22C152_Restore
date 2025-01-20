@interface SiriMoviesDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SiriMoviesDetailViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SiriMoviesDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesDetailView", @"watchTrailerButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesDetailView", @"reviewsButton", "@", 0);
  [v3 validateClass:@"SiriMoviesDetailView" hasInstanceVariable:@"_movieInfoView" withType:"SiriMoviesMovieInfoView"];
  [v3 validateClass:@"SiriMoviesMovieInfoView" hasInstanceVariable:@"_runtimeValueLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v25.receiver = self;
  v25.super_class = (Class)SiriMoviesDetailViewAccessibility;
  [(SiriMoviesDetailViewAccessibility *)&v25 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SiriMoviesDetailViewAccessibility *)self safeValueForKey:@"watchTrailerButton"];
  v4 = accessibilityLocalizedString(@"movie.trailer.label");
  [v3 setAccessibilityLabel:v4];

  v5 = [(SiriMoviesDetailViewAccessibility *)self safeValueForKey:@"reviewsButton"];
  v6 = accessibilityLocalizedString(@"movie.rating.freshness.hint");
  [v5 setAccessibilityHint:v6];

  v7 = [(SiriMoviesDetailViewAccessibility *)self safeValueForKey:@"_movieInfoView"];
  v8 = [v7 safeValueForKey:@"_runtimeValueLabel"];
  v9 = [v8 safeValueForKey:@"text"];
  v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v11 = [v9 componentsSeparatedByCharactersInSet:v10];

  if ((unint64_t)[v11 count] < 2)
  {
    v17 = 0;
    v14 = 0;
  }
  else
  {
    v12 = [v11 objectAtIndex:0];
    v13 = [MEMORY[0x263F08708] letterCharacterSet];
    v14 = [v12 stringByTrimmingCharactersInSet:v13];

    v15 = [v11 objectAtIndex:1];
    v16 = [MEMORY[0x263F08708] letterCharacterSet];
    v17 = [v15 stringByTrimmingCharactersInSet:v16];
  }
  v18 = NSString;
  v19 = accessibilityLocalizedString(@"hour.label");
  v20 = objc_msgSend(v18, "stringWithFormat:", v19, objc_msgSend(v14, "integerValue"));

  v21 = NSString;
  v22 = accessibilityLocalizedString(@"minute.label");
  v23 = objc_msgSend(v21, "stringWithFormat:", v22, objc_msgSend(v17, "integerValue"));

  v24 = __UIAXStringForVariables();
  objc_msgSend(v8, "setAccessibilityLabel:", v24, v23, @"__AXStringForVariablesSentinel");
}

- (SiriMoviesDetailViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SiriMoviesDetailViewAccessibility;
  v4 = -[SiriMoviesDetailViewAccessibility initWithFrame:movieDetailSnippet:](&v6, sel_initWithFrame_movieDetailSnippet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SiriMoviesDetailViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end