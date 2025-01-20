@interface IDSCKNotificationInfo
+ (Class)__class;
+ (id)alloc;
- (BOOL)shouldSendContentAvailable;
- (NSString)alertLocalizationKey;
- (void)setAlertLocalizationKey:(id)a3;
- (void)setShouldSendContentAvailable:(BOOL)a3;
@end

@implementation IDSCKNotificationInfo

+ (Class)__class
{
  if (qword_1E944F5D0 != -1) {
    dispatch_once(&qword_1E944F5D0, &unk_1EEFCE2D8);
  }
  v2 = (void *)qword_1E944F5C8;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (NSString)alertLocalizationKey
{
  return self->_alertLocalizationKey;
}

- (void)setAlertLocalizationKey:(id)a3
{
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (void)setShouldSendContentAvailable:(BOOL)a3
{
  self->_shouldSendContentAvailable = a3;
}

- (void).cxx_destruct
{
}

@end