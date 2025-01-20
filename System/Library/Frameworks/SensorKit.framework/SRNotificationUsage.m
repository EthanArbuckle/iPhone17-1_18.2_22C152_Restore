@interface SRNotificationUsage
+ (BOOL)supportsSecureCoding;
+ (SRNotificationUsage)notificationUsageWithBundleIdentifier:(id)a3 eventType:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (SRNotificationEvent)event;
- (SRNotificationUsage)initWithCoder:(id)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEvent:(int64_t)a3;
@end

@implementation SRNotificationUsage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 540, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRNotificationUsage bundleIdentifier](self, "bundleIdentifier"), @"bundleIdentifier");
  SRNotificationEvent v6 = [(SRNotificationUsage *)self event];

  [a3 encodeInteger:v6 forKey:@"eventType"];
}

- (SRNotificationUsage)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 546, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v7 = [a3 decodeIntegerForKey:@"eventType"];

  v8 = objc_alloc_init(SRNotificationUsage);
  [(SRNotificationUsage *)v8 setBundleIdentifier:v6];
  [(SRNotificationUsage *)v8 setEvent:v7];
  return v8;
}

+ (SRNotificationUsage)notificationUsageWithBundleIdentifier:(id)a3 eventType:(int64_t)a4
{
  uint64_t v6 = objc_alloc_init(SRNotificationUsage);
  [(SRNotificationUsage *)v6 setBundleIdentifier:a3];
  [(SRNotificationUsage *)v6 setEvent:a4];

  return v6;
}

- (void)dealloc
{
  [(SRNotificationUsage *)self setBundleIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)SRNotificationUsage;
  [(SRNotificationUsage *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Notification Usage: {Bundle Identifier: %@, Event Type %ld}", -[SRNotificationUsage bundleIdentifier](self, "bundleIdentifier"), -[SRNotificationUsage event](self, "event")];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  uint64_t v15 = v6;
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  uint64_t v18 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v12) = 0;
    return v12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier)
  {
    if (![a3 bundleIdentifier])
    {
LABEL_7:
      int64_t event = self->_event;
      LOBYTE(v12) = event == objc_msgSend(a3, "event", v15, v16, v17, v18);
      return v12;
    }
    bundleIdentifier = self->_bundleIdentifier;
  }
  BOOL v12 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:", objc_msgSend(a3, "bundleIdentifier", v6, v16, v17, v18, v7, v8));
  if (v12) {
    goto LABEL_7;
  }
  return v12;
}

- (id)sr_dictionaryRepresentation
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"eventType";
  uint64_t v3 = [NSNumber numberWithInteger:self->_event];
  v6[1] = @"bundleIdentifier";
  v7[0] = v3;
  bundleIdentifier = (__CFString *)self->_bundleIdentifier;
  if (!bundleIdentifier) {
    bundleIdentifier = &stru_26D165EC8;
  }
  v7[1] = bundleIdentifier;
  return (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (SRNotificationEvent)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_int64_t event = a3;
}

@end