@interface GEOAppleRating(MURatingPercentageViewModel)
- (BOOL)hasPercentage;
- (id)categoryTitle;
- (uint64_t)hasSubtitle;
- (unint64_t)displayPercentage;
@end

@implementation GEOAppleRating(MURatingPercentageViewModel)

- (id)categoryTitle
{
  if ([a1 ratingType]) {
    [a1 localizedTitle];
  }
  else {
  v2 = _MULocalizedStringFromThisBundle(@"Overall [Placecard]");
  }
  return v2;
}

- (unint64_t)displayPercentage
{
  [a1 percentage];
  return (unint64_t)(v1 * 100.0);
}

- (uint64_t)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  unint64_t UInteger = GEOConfigGetUInteger();
  return UInteger <= (int)[a1 numberOfRatingsUsedForScore];
}

@end