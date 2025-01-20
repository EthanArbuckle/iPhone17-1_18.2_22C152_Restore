@interface ComAppleContextkitUtilSpindleArray_State
- (ComAppleContextkitUtilSpindleArray_State)init;
- (id)compressedBufWithInt:(int)a3;
- (id)uncompressedBufWithInt:(int)a3;
- (void)dealloc;
@end

@implementation ComAppleContextkitUtilSpindleArray_State

- (ComAppleContextkitUtilSpindleArray_State)init
{
  return self;
}

- (id)compressedBufWithInt:(int)a3
{
  return sub_1001483C8((uint64_t)self, a3);
}

- (id)uncompressedBufWithInt:(int)a3
{
  return sub_100148460((uint64_t)self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilSpindleArray_State;
  [(ComAppleContextkitUtilSpindleArray_State *)&v3 dealloc];
}

@end