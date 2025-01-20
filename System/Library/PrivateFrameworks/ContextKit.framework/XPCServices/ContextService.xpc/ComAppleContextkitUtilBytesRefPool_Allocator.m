@interface ComAppleContextkitUtilBytesRefPool_Allocator
- (ComAppleContextkitUtilBytesRefPool_Allocator)initWithInt:(int)a3;
- (id)getByteBlock;
- (int)getBlockSize;
- (void)recycleByteBlocksWithJavaUtilList:(id)a3;
@end

@implementation ComAppleContextkitUtilBytesRefPool_Allocator

- (ComAppleContextkitUtilBytesRefPool_Allocator)initWithInt:(int)a3
{
  self->blockSize_ = a3;
  return self;
}

- (int)getBlockSize
{
  return self->blockSize_;
}

- (void)recycleByteBlocksWithJavaUtilList:(id)a3
{
  if (!a3
    || (v4 = (unsigned int *)objc_msgSend(a3, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)objc_msgSend(a3, "size"), IOSClass_arrayType((uint64_t)+[IOSClass byteClass](IOSClass, "byteClass"), 1u)))) == 0)
  {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4[2];
  [(ComAppleContextkitUtilBytesRefPool_Allocator *)self recycleByteBlocksWithByteArray2:v4 withInt:0 withInt:v5];
}

- (id)getByteBlock
{
  return +[IOSByteArray arrayWithLength:self->blockSize_];
}

@end