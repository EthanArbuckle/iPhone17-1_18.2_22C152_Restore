@interface BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage
+ (id)newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3;
- (int)referenceFrameBracketedCaptureSequenceNumber;
@end

@implementation BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage

+ (id)newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3
{
  id result = [BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage alloc];
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage;
    id result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      *((void *)result + 1) = 0x600000001;
      *((_DWORD *)result + 4) = a3;
    }
  }
  return result;
}

- (int)referenceFrameBracketedCaptureSequenceNumber
{
  return self->_referenceFrameBracketedCaptureSequenceNumber;
}

@end