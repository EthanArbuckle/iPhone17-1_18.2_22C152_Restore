@interface NSMutableDictionary(CarouselPreferenceServices)
- (void)cslprf_safeRemoveObjectForKey:()CarouselPreferenceServices;
@end

@implementation NSMutableDictionary(CarouselPreferenceServices)

- (void)cslprf_safeRemoveObjectForKey:()CarouselPreferenceServices
{
  if (a3) {
    return objc_msgSend(a1, "removeObjectForKey:");
  }
  return a1;
}

@end