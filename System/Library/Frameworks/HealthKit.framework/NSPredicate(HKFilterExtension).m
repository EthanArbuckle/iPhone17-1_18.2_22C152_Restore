@interface NSPredicate(HKFilterExtension)
- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension;
- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:;
@end

@implementation NSPredicate(HKFilterExtension)

- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension
{
  return objc_msgSend(a1, "hk_filterRepresentationForDataTypes:isSubpredicate:", a3, 0);
}

- (uint64_t)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:
{
  return 0;
}

@end