@interface ComAppleContextkitUtilObjcSpindleArray_NativeState
- (ComAppleContextkitUtilObjcSpindleArray_NativeState)init;
- (int)decodeInternalWithInt:(int)a3 withByteArray:(id)a4 withByteArray:(id)a5;
- (int)decodeWithInt:(int)a3 withByteArray:(id)a4 withByteArray:(id)a5;
- (void)dealloc;
@end

@implementation ComAppleContextkitUtilObjcSpindleArray_NativeState

- (void)dealloc
{
  free(self->_dstBuffer);
  free(self->_scratchBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilObjcSpindleArray_NativeState;
  [(ComAppleContextkitUtilSpindleArray_State *)&v3 dealloc];
}

- (ComAppleContextkitUtilObjcSpindleArray_NativeState)init
{
  return self;
}

- (int)decodeWithInt:(int)a3 withByteArray:(id)a4 withByteArray:(id)a5
{
  if (!a4) {
    goto LABEL_6;
  }
  size_t v6 = *((int *)a4 + 2);
  if (!v6)
  {
    CFStringRef v9 = @"Empty buffer";
    goto LABEL_9;
  }
  if (!a5) {
LABEL_6:
  }
    JreThrowNullPointerException();
  size_t v7 = *((int *)a5 + 2);
  if ((int)v7 < a3)
  {
    CFStringRef v9 = @"OutBuf too small";
LABEL_9:
    v10 = new_JavaIoIOException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  return compression_decode_buffer((uint8_t *)a5 + 12, v7, (const uint8_t *)a4 + 12, v6, self->_scratchBuffer, COMPRESSION_LZFSE);
}

- (int)decodeInternalWithInt:(int)a3 withByteArray:(id)a4 withByteArray:(id)a5
{
  return compression_decode_buffer((uint8_t *)a5 + 12, *((int *)a5 + 2), (const uint8_t *)a4 + 12, *((int *)a4 + 2), self->_scratchBuffer, COMPRESSION_LZFSE);
}

@end