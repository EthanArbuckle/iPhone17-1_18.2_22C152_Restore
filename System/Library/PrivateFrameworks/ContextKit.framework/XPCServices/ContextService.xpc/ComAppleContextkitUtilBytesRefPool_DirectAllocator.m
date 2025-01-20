@interface ComAppleContextkitUtilBytesRefPool_DirectAllocator
- (ComAppleContextkitUtilBytesRefPool_DirectAllocator)initWithInt:(int)a3;
@end

@implementation ComAppleContextkitUtilBytesRefPool_DirectAllocator

- (ComAppleContextkitUtilBytesRefPool_DirectAllocator)initWithInt:(int)a3
{
  self->super.blockSize_ = a3;
  return self;
}

@end