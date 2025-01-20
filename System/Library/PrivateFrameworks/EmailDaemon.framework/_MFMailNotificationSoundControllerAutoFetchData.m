@interface _MFMailNotificationSoundControllerAutoFetchData
- (BOOL)notificationExpectedFromFetch;
- (MFMailboxUid)mailbox;
- (NSString)currentAccountIDOfSoundToPlay;
- (_MFMailNotificationSoundControllerAutoFetchData)init;
- (id)description;
- (unint64_t)fetchStart;
- (unint64_t)loudestState;
- (void)setCurrentAccountIDOfSoundToPlay:(id)a3;
- (void)setFetchStart:(unint64_t)a3;
- (void)setLoudestState:(unint64_t)a3;
- (void)setMailbox:(id)a3;
- (void)setNotificationExpectedFromFetch:(BOOL)a3;
@end

@implementation _MFMailNotificationSoundControllerAutoFetchData

- (_MFMailNotificationSoundControllerAutoFetchData)init
{
  v4.receiver = self;
  v4.super_class = (Class)_MFMailNotificationSoundControllerAutoFetchData;
  v2 = [(_MFMailNotificationSoundControllerAutoFetchData *)&v4 init];
  if (v2) {
    v2->_fetchStart = mach_absolute_time();
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  CFStringRef v4 = @"notification expected from fetch";
  if (!self->_notificationExpectedFromFetch) {
    CFStringRef v4 = @"no notification expected from fetch";
  }
  return +[NSString stringWithFormat:@"<%@: %p> %@, %@, %llu", v3, self, self->_currentAccountIDOfSoundToPlay, v4, self->_fetchStart];
}

- (NSString)currentAccountIDOfSoundToPlay
{
  return self->_currentAccountIDOfSoundToPlay;
}

- (void)setCurrentAccountIDOfSoundToPlay:(id)a3
{
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (unint64_t)loudestState
{
  return self->_loudestState;
}

- (void)setLoudestState:(unint64_t)a3
{
  self->_loudestState = a3;
}

- (BOOL)notificationExpectedFromFetch
{
  return self->_notificationExpectedFromFetch;
}

- (void)setNotificationExpectedFromFetch:(BOOL)a3
{
  self->_notificationExpectedFromFetch = a3;
}

- (unint64_t)fetchStart
{
  return self->_fetchStart;
}

- (void)setFetchStart:(unint64_t)a3
{
  self->_fetchStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailbox, 0);

  objc_storeStrong((id *)&self->_currentAccountIDOfSoundToPlay, 0);
}

@end