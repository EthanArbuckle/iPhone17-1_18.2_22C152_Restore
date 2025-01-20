@interface AGXG17FamilyComputeOrFragmentOrTileProgram
- (void)dealloc;
@end

@implementation AGXG17FamilyComputeOrFragmentOrTileProgram

- (void)dealloc
{
  self->_compute = 0;
  self->_frag = 0;

  self->_tile = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyComputeOrFragmentOrTileProgram;
  [(AGXG17FamilyComputeOrFragmentOrTileProgram *)&v3 dealloc];
}

@end