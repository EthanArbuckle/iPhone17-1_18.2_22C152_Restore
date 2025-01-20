@interface CTLazuliMessagingCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessagingCapabilities:(id)a3;
- (BOOL)supportsComposingIndicator;
- (CTLazuliMessagingCapabilities)initWithCoder:(id)a3;
- (CTLazuliMessagingCapabilities)initWithReflection:(const MessagingCapabilities *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)notificationDisplay;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationDisplay:(int64_t)a3;
- (void)setSupportsComposingIndicator:(BOOL)a3;
@end

@implementation CTLazuliMessagingCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliMessagingCapabilities *)self notificationDisplay];
  int64_t v6 = [(CTLazuliMessagingCapabilities *)self notificationDisplay];
  [v3 appendFormat:@", notificationDisplay = [%ld - %s]", v4, print_CTLazuliDisplayNotificationType(&v6)];
  [v3 appendFormat:@", supportsComposingIndicator = %d", -[CTLazuliMessagingCapabilities supportsComposingIndicator](self, "supportsComposingIndicator")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessagingCapabilities:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliMessagingCapabilities *)self notificationDisplay];
  if (v5 == [v4 notificationDisplay])
  {
    BOOL v6 = [(CTLazuliMessagingCapabilities *)self supportsComposingIndicator];
    int v7 = v6 ^ [v4 supportsComposingIndicator] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessagingCapabilities *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessagingCapabilities *)self isEqualToCTLazuliMessagingCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessagingCapabilities allocWithZone:a3];
  [(CTLazuliMessagingCapabilities *)v4 setNotificationDisplay:self->_notificationDisplay];
  [(CTLazuliMessagingCapabilities *)v4 setSupportsComposingIndicator:self->_supportsComposingIndicator];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_notificationDisplay];
  [v5 encodeObject:v4 forKey:@"kNotificationDisplayKey"];

  [v5 encodeBool:self->_supportsComposingIndicator forKey:@"kSupportsComposingIndicatorKey"];
}

- (CTLazuliMessagingCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessagingCapabilities;
  id v5 = [(CTLazuliMessagingCapabilities *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNotificationDisplayKey"];
    v5->_notificationDisplay = [v6 longValue];

    v5->_supportsComposingIndicator = [v4 decodeBoolForKey:@"kSupportsComposingIndicatorKey"];
  }

  return v5;
}

- (CTLazuliMessagingCapabilities)initWithReflection:(const MessagingCapabilities *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliMessagingCapabilities;
  id v4 = [(CTLazuliMessagingCapabilities *)&v6 init];
  if (v4)
  {
    v4->_notificationDisplay = encode_CTLazuliGroupChatParticipantRoleType(a3);
    v4->_supportsComposingIndicator = a3->var1;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)notificationDisplay
{
  return self->_notificationDisplay;
}

- (void)setNotificationDisplay:(int64_t)a3
{
  self->_notificationDisplay = a3;
}

- (BOOL)supportsComposingIndicator
{
  return self->_supportsComposingIndicator;
}

- (void)setSupportsComposingIndicator:(BOOL)a3
{
  self->_supportsComposingIndicator = a3;
}

@end