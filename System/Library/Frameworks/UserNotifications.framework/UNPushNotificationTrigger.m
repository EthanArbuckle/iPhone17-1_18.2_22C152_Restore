@interface UNPushNotificationTrigger
+ (BOOL)supportsSecureCoding;
+ (UNPushNotificationTrigger)triggerWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4;
- (BOOL)isContentAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMutableContent;
- (UNPushNotificationTrigger)initWithCoder:(id)a3;
- (id)_initWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNPushNotificationTrigger

+ (UNPushNotificationTrigger)triggerWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithContentAvailable:a3 mutableContent:a4];

  return (UNPushNotificationTrigger *)v4;
}

- (id)_initWithContentAvailable:(BOOL)a3 mutableContent:(BOOL)a4
{
  id result = [(UNNotificationTrigger *)self _initWithRepeats:0];
  if (result)
  {
    *((unsigned char *)result + 9) = a3;
    *((unsigned char *)result + 10) = a4;
  }
  return result;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)UNPushNotificationTrigger;
  unint64_t v3 = [(UNNotificationTrigger *)&v6 hash];
  uint64_t v4 = [(UNPushNotificationTrigger *)self isContentAvailable];
  return v3 ^ v4 ^ [(UNPushNotificationTrigger *)self isMutableContent];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNPushNotificationTrigger,
        [(UNNotificationTrigger *)&v9 isEqual:v4])
    && (int v5 = [(UNPushNotificationTrigger *)self isContentAvailable],
        v5 == [v4 isContentAvailable]))
  {
    BOOL v8 = [(UNPushNotificationTrigger *)self isMutableContent];
    int v6 = v8 ^ [v4 isMutableContent] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(UNPushNotificationTrigger *)self isContentAvailable];
  int v5 = NSStringFromBOOL();
  [(UNPushNotificationTrigger *)self isMutableContent];
  int v6 = NSStringFromBOOL();
  v7 = [v3 stringWithFormat:@"<%@: %p; contentAvailable: %@, mutableContent: %@>", v4, self, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UNPushNotificationTrigger;
  id v4 = a3;
  [(UNNotificationTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[UNPushNotificationTrigger isContentAvailable](self, "isContentAvailable", v5.receiver, v5.super_class), @"contentAvailable");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNPushNotificationTrigger isMutableContent](self, "isMutableContent"), @"mutableContent");
}

- (UNPushNotificationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UNPushNotificationTrigger;
  objc_super v5 = [(UNNotificationTrigger *)&v7 initWithCoder:v4];
  if (v5)
  {
    *(&v5->super._repeats + 1) = [v4 decodeBoolForKey:@"contentAvailable"];
    *(&v5->super._repeats + 2) = [v4 decodeBoolForKey:@"mutableContent"];
  }

  return v5;
}

- (BOOL)isContentAvailable
{
  return *(&self->super._repeats + 1);
}

- (BOOL)isMutableContent
{
  return *(&self->super._repeats + 2);
}

@end