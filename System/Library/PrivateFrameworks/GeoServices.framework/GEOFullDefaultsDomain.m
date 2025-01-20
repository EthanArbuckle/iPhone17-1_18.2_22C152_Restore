@interface GEOFullDefaultsDomain
@end

@implementation GEOFullDefaultsDomain

void ___GEOFullDefaultsDomain_block_invoke()
{
  v0 = +[GEOFilePaths pathFor:9];
  id v3 = v0;
  if (qword_1EB29F678 != -1)
  {
    dispatch_once(&qword_1EB29F678, &__block_literal_global_60);
    v0 = v3;
  }
  uint64_t v1 = [v0 stringByAppendingPathComponent:qword_1EB29F670];
  v2 = (void *)qword_1EB29F680;
  qword_1EB29F680 = v1;
}

@end