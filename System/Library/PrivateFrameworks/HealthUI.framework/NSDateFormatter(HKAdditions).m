@interface NSDateFormatter(HKAdditions)
- (id)hk_stringWithAMPMSpaceRemovedFromDate:()HKAdditions;
@end

@implementation NSDateFormatter(HKAdditions)

- (id)hk_stringWithAMPMSpaceRemovedFromDate:()HKAdditions
{
  v2 = objc_msgSend(a1, "stringFromDate:");
  v3 = NSString;
  v4 = [a1 AMSymbol];
  v5 = [v3 stringWithFormat:@" %@", v4];
  v6 = [a1 AMSymbol];
  v7 = [v2 stringByReplacingOccurrencesOfString:v5 withString:v6];

  v8 = NSString;
  v9 = [a1 PMSymbol];
  v10 = [v8 stringWithFormat:@" %@", v9];
  v11 = [a1 PMSymbol];
  v12 = [v7 stringByReplacingOccurrencesOfString:v10 withString:v11];

  return v12;
}

@end