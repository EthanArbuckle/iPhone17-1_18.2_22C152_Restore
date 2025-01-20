@interface NSProcessInfo(GEOExtras)
- (id)processStartTime;
- (id)systemStartTime;
@end

@implementation NSProcessInfo(GEOExtras)

- (id)processStartTime
{
  if (qword_1EB29F8A8 != -1) {
    dispatch_once(&qword_1EB29F8A8, &__block_literal_global_59);
  }
  v0 = (void *)_MergedGlobals_218;

  return v0;
}

- (id)systemStartTime
{
  if (qword_1EB29F8B8 != -1) {
    dispatch_once(&qword_1EB29F8B8, &__block_literal_global_3);
  }
  v0 = (void *)qword_1EB29F8B0;

  return v0;
}

@end