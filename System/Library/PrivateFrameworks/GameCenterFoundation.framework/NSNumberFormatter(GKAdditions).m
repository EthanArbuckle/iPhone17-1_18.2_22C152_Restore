@interface NSNumberFormatter(GKAdditions)
+ (id)gk_formatInteger:()GKAdditions withGrouping:;
@end

@implementation NSNumberFormatter(GKAdditions)

+ (id)gk_formatInteger:()GKAdditions withGrouping:
{
  if (a4) {
    _sharedIntegerWithGroupingFormatter();
  }
  else {
  v5 = _sharedIntegerFormatter();
  }
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 stringFromNumber:v6];

  return v7;
}

@end