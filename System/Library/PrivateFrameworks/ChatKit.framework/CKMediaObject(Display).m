@interface CKMediaObject(Display)
- (IMSenderContext)senderContext;
@end

@implementation CKMediaObject(Display)

- (IMSenderContext)senderContext
{
  v2 = [(CKMediaObject *)self messageContext];
  v3 = [v2 serviceName];
  uint64_t v4 = [v2 isSenderUnknown];
  v5 = [MEMORY[0x1E4F6E950] contextWithKnownSender:v4 serviceName:v3];

  return (IMSenderContext *)v5;
}

@end