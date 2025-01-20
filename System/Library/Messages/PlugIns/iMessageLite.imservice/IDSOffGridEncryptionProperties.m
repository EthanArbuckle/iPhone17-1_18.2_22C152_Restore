@interface IDSOffGridEncryptionProperties
- (NSData)__im_encryptionKeyID;
@end

@implementation IDSOffGridEncryptionProperties

- (NSData)__im_encryptionKeyID
{
  v2 = (NSData *)[(IDSOffGridEncryptionProperties *)self encryptionKeyID];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

@end