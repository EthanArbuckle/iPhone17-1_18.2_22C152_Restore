@interface CKSignatureGenerator(BRAdditions)
+ (id)br_signatureWithFileDescriptor:()BRAdditions boundaryKey:error:;
@end

@implementation CKSignatureGenerator(BRAdditions)

+ (id)br_signatureWithFileDescriptor:()BRAdditions boundaryKey:error:
{
  if (a4) {
    objc_msgSend(MEMORY[0x1E4F1A3B8], "signatureWithFileDescriptor:boundaryKey:error:");
  }
  else {
  v5 = [MEMORY[0x1E4F1A3B8] signatureWithFileDescriptor:a3 error:a5];
  }

  return v5;
}

@end