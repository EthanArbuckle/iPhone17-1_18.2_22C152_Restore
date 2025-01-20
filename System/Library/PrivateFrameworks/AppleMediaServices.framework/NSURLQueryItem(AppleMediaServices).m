@interface NSURLQueryItem(AppleMediaServices)
+ (uint64_t)queryItemsFromDictionary:()AppleMediaServices;
@end

@implementation NSURLQueryItem(AppleMediaServices)

+ (uint64_t)queryItemsFromDictionary:()AppleMediaServices
{
  return objc_msgSend(a3, "ams_arrayUsingTransform:", &__block_literal_global_152);
}

@end