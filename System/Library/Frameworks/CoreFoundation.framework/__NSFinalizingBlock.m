@interface __NSFinalizingBlock
- (void)finalize;
@end

@implementation __NSFinalizingBlock

- (void)finalize
{
  if (((uint64_t)self[1].super.super.super.isa & 0x2000000) != 0) {
    (*((void (**)(void))self[3].super.super.super.isa + 3))();
  }
}

@end