@interface SiriMoviesMovieListCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SiriMoviesMovieListCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriMoviesMovieListCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SiriMoviesMovieListCellViewAccessibility *)self safeValueForKey:@"_movieTitleLabel"];
  v5 = [v4 accessibilityLabel];

  if ([v5 length]) {
    [v3 addObject:v5];
  }
  v6 = [(SiriMoviesMovieListCellViewAccessibility *)self safeValueForKey:@"_showtimeLabel"];
  v7 = [v6 accessibilityLabel];

  if ([v7 length])
  {
    v8 = NSString;
    v9 = accessibilityLocalizedString(@"movie.times");
    v10 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

    [v3 addObject:v10];
  }
  v11 = [(SiriMoviesMovieListCellViewAccessibility *)self safeValueForKey:@"_tomatoView"];
  v12 = [v11 accessibilityLabel];

  if ([v12 length]) {
    [v3 addObject:v12];
  }
  v13 = [(SiriMoviesMovieListCellViewAccessibility *)self safeValueForKey:@"_ratingView"];
  v14 = [v13 accessibilityLabel];

  if ([v14 length]) {
    [v3 addObject:v14];
  }
  v15 = [v3 componentsJoinedByString:@", "];

  return v15;
}

@end