@interface NSString
@end

@implementation NSString

void __79__NSString_MKAdditions___mapkit_localizedDistanceStringWithMeters_abbreviated___block_invoke()
{
  v0 = objc_alloc_init(MKDistanceFormatter);
  v1 = (void *)qword_1EB315EA0;
  qword_1EB315EA0 = (uint64_t)v0;
}

uint64_t __76__NSString_MKAdditions___mapkit_voiceOverLocalizedDistanceStringWithMeters___block_invoke()
{
  v0 = objc_alloc_init(MKDistanceFormatter);
  v1 = (void *)qword_1EB315EB0;
  qword_1EB315EB0 = (uint64_t)v0;

  v2 = (void *)qword_1EB315EB0;

  return [v2 setUnitStyle:2];
}

@end