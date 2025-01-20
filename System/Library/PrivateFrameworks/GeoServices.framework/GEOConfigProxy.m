@interface GEOConfigProxy
@end

@implementation GEOConfigProxy

void ___GEOConfigProxy_block_invoke()
{
  v0 = (objc_class *)qword_1EB29F658;
  if (!qword_1EB29F658)
  {
    v0 = (objc_class *)objc_opt_class();
    qword_1EB29F658 = (uint64_t)v0;
  }
  id v1 = objc_alloc_init(v0);
  v2 = (void *)qword_1EB29F660;
  qword_1EB29F660 = (uint64_t)v1;
}

@end