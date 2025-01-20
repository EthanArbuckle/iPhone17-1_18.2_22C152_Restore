@interface _GEOCancelBlock
- (void)cancel;
@end

@implementation _GEOCancelBlock

- (void)cancel
{
  v4 = (void (**)(void))MEMORY[0x18C120660](self->_block, a2);
  id block = self->_block;
  self->_id block = 0;

  v4[2]();
}

- (void).cxx_destruct
{
}

@end