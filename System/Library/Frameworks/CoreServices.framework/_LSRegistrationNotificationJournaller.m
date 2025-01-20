@interface _LSRegistrationNotificationJournaller
+ (BOOL)supportsSecureCoding;
- (BOOL)entityExists;
- (BOOL)shouldExpectEntityToExist;
- (_LSRegistrationNotificationJournaller)initWithCoder:(id)a3;
- (_LSRegistrationNotificationJournaller)initWithPrimaryBundleID:(id)a3 placeholder:(BOOL)a4;
- (id)synthesizedPreliminaryJournalledNotifications;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSRegistrationNotificationJournaller

- (_LSRegistrationNotificationJournaller)initWithPrimaryBundleID:(id)a3 placeholder:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_LSRegistrationNotificationJournaller;
  result = [(_LSInstallNotificationJournaller *)&v6 initWithPrimaryBundleID:a3 operation:0];
  if (result) {
    result->_placeholder = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSRegistrationNotificationJournaller)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSRegistrationNotificationJournaller;
  v5 = [(_LSInstallNotificationJournaller *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_placeholder = [v4 decodeBoolForKey:@"placeholder"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_LSRegistrationNotificationJournaller;
  id v4 = a3;
  [(_LSInstallNotificationJournaller *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_placeholder, @"placeholder", v5.receiver, v5.super_class);
}

- (BOOL)shouldExpectEntityToExist
{
  return 1;
}

- (BOOL)entityExists
{
  v2 = self;
  v3 = [(_LSInstallNotificationJournaller *)self primaryBundleID];
  LOBYTE(v2) = [(_LSInstallNotificationJournaller *)v2 isApplicationRegisteredWithbundleID:v3 placeholder:v2->_placeholder];

  return (char)v2;
}

- (id)synthesizedPreliminaryJournalledNotifications
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end