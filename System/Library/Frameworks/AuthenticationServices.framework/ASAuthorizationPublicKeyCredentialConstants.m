@interface ASAuthorizationPublicKeyCredentialConstants
+ (int64_t)publicAttachmentFromInternal:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialConstants

+ (int64_t)publicAttachmentFromInternal:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F29398]])
  {
    int64_t v4 = 0;
  }
  else
  {
    [v3 isEqualToString:*MEMORY[0x263F29390]];
    int64_t v4 = 1;
  }

  return v4;
}

@end