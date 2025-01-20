@interface SiriMoviesMovieCreditsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SiriMoviesMovieCreditsViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4;
@end

@implementation SiriMoviesMovieCreditsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesMovieCreditsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SiriMoviesMovieCreditsView" hasInstanceVariable:@"_directorLabel" withType:"UILabel"];
  [v3 validateClass:@"SiriMoviesMovieCreditsView" hasInstanceVariable:@"_starringLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriMoviesMovieCreditsView", @"initWithFrame: movieDetailSnippet:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
}

- (SiriMoviesMovieCreditsViewAccessibility)initWithFrame:(CGRect)a3 movieDetailSnippet:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SiriMoviesMovieCreditsViewAccessibility;
  v4 = -[SiriMoviesMovieCreditsViewAccessibility initWithFrame:movieDetailSnippet:](&v9, sel_initWithFrame_movieDetailSnippet_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(SiriMoviesMovieCreditsViewAccessibility *)v4 safeValueForKey:@"_directorLabel"];
  uint64_t v6 = *MEMORY[0x263F1CEF8];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v7 = [(SiriMoviesMovieCreditsViewAccessibility *)v4 safeValueForKey:@"_starringLabel"];
  [v7 setAccessibilityTraits:v6];

  return v4;
}

@end