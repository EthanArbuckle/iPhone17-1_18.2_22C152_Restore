@interface IDSCKAccountInfo
+ (Class)__class;
+ (id)alloc;
- (BOOL)supportsDeviceToDeviceEncryption;
- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3;
@end

@implementation IDSCKAccountInfo

+ (Class)__class
{
  if (qword_1E944F620 != -1) {
    dispatch_once(&qword_1E944F620, &unk_1EEFCE438);
  }
  v2 = (void *)qword_1E944F618;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

@end