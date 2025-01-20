@interface NSNumberFormatter(EmailFoundationAdditions)
+ (id)ef_formatInteger:()EmailFoundationAdditions withGrouping:;
+ (id)ef_formatUnsignedInteger:()EmailFoundationAdditions withGrouping:;
@end

@implementation NSNumberFormatter(EmailFoundationAdditions)

+ (id)ef_formatInteger:()EmailFoundationAdditions withGrouping:
{
  if (a4) {
    _sharedIntegerWithGroupingFormatter();
  }
  else {
  v5 = _sharedIntegerFormatter();
  }
  v6 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  v7 = [v5 stringFromNumber:v6];

  return v7;
}

+ (id)ef_formatUnsignedInteger:()EmailFoundationAdditions withGrouping:
{
  if (a4) {
    _sharedIntegerWithGroupingFormatter();
  }
  else {
  v5 = _sharedIntegerFormatter();
  }
  v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  v7 = [v5 stringFromNumber:v6];

  return v7;
}

@end