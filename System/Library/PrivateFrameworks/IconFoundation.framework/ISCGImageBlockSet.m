@interface ISCGImageBlockSet
- (CGImageBlockSet)blockSet;
- (ISCGImageBlockSet)initWithBlockSet:(CGImageBlockSet *)a3;
- (void)dealloc;
- (void)setBlockSet:(CGImageBlockSet *)a3;
@end

@implementation ISCGImageBlockSet

- (ISCGImageBlockSet)initWithBlockSet:(CGImageBlockSet *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISCGImageBlockSet;
  v3 = [(ISCGImageBlockSet *)&v5 init];
  if (v3) {
    v3->_blockSet = (CGImageBlockSet *)CGImageBlockSetRetain();
  }
  return v3;
}

- (void)dealloc
{
  if (self->_blockSet) {
    CGImageBlockSetRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)ISCGImageBlockSet;
  [(ISCGImageBlockSet *)&v3 dealloc];
}

- (CGImageBlockSet)blockSet
{
  return self->_blockSet;
}

- (void)setBlockSet:(CGImageBlockSet *)a3
{
  self->_blockSet = a3;
}

@end