@interface NSNull(MKAdditions)
+ (id)_mapkit_fakeNil;
@end

@implementation NSNull(MKAdditions)

+ (id)_mapkit_fakeNil
{
  if (qword_1EB315ED8 != -1) {
    dispatch_once(&qword_1EB315ED8, &__block_literal_global_192_0);
  }
  v0 = (void *)qword_1EB315ED0;

  return v0;
}

@end