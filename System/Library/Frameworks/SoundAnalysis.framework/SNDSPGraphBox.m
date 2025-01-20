@interface SNDSPGraphBox
- (SNDSPGraphBox)init;
- (id).cxx_construct;
@end

@implementation SNDSPGraphBox

- (SNDSPGraphBox)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = [NSString stringWithUTF8String:"-[SNDSPGraphBox init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Do not call %@", v4 format];

  return 0;
}

- (void).cxx_destruct
{
  cntrl = self->_graph.__cntrl_;
  if (cntrl) {
    sub_1DCB44254((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end