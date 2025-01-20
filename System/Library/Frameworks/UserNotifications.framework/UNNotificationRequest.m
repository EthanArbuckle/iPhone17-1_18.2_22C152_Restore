@interface UNNotificationRequest
+ (BOOL)supportsSecureCoding;
+ (UNNotificationRequest)requestWithIdentifier:(NSString *)identifier content:(UNNotificationContent *)content trigger:(UNNotificationTrigger *)trigger;
+ (UNNotificationRequest)requestWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6;
+ (UNNotificationRequest)requestWithIdentifier:(id)a3 pushPayload:(id)a4 bundleIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (UNNotificationContent)content;
- (UNNotificationRequest)initWithCoder:(id)a3;
- (UNNotificationTrigger)trigger;
- (id)_initWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6;
- (unint64_t)_notificationDestinationsForInterruptionLevel:(unint64_t)a3 inputDestinations:(unint64_t)a4;
- (unint64_t)destinations;
- (unint64_t)hash;
- (void)addSecurityScope:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterSecurityScope;
- (void)leaveSecurityScope;
- (void)removeSecurityScope;
- (void)setDestinations:(unint64_t)a3;
@end

@implementation UNNotificationRequest

+ (UNNotificationRequest)requestWithIdentifier:(NSString *)identifier content:(UNNotificationContent *)content trigger:(UNNotificationTrigger *)trigger
{
  v8 = trigger;
  v9 = content;
  v10 = identifier;
  v11 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v10 content:v9 trigger:v8 destinations:15];

  return (UNNotificationRequest *)v11;
}

+ (UNNotificationRequest)requestWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v12 content:v11 trigger:v10 destinations:a6];

  return (UNNotificationRequest *)v13;
}

+ (UNNotificationRequest)requestWithIdentifier:(id)a3 pushPayload:(id)a4 bundleIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  if (![v7 length])
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];

    id v7 = (id)v11;
  }
  id v12 = [[UNPushNotificationRequestBuilder alloc] initWithIdentifier:v7 payload:v9 bundleIdentifier:v8];

  v13 = [(UNPushNotificationRequestBuilder *)v12 buildNotificationRequest];

  return (UNNotificationRequest *)v13;
}

- (id)_initWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UNNotificationRequest.m", 59, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)UNNotificationRequest;
  v14 = [(UNNotificationRequest *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    content = v14->_content;
    v14->_content = (UNNotificationContent *)v15;

    uint64_t v17 = [v11 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    trigger = v14->_trigger;
    v14->_trigger = (UNNotificationTrigger *)v19;

    v14->_destinations = [(UNNotificationRequest *)v14 _notificationDestinationsForInterruptionLevel:[(UNNotificationContent *)v14->_content interruptionLevel] inputDestinations:a6];
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(UNNotificationRequest *)self content];
  uint64_t v4 = [v3 hash];
  v5 = [(UNNotificationRequest *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(UNNotificationRequest *)self trigger];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(UNNotificationRequest *)self destinations];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNNotificationRequest *)self content];
    uint64_t v6 = [v4 content];
    if (UNEqualObjects(v5, v6))
    {
      id v7 = [(UNNotificationRequest *)self identifier];
      uint64_t v8 = [v4 identifier];
      if (UNEqualObjects(v7, v8))
      {
        unint64_t v9 = [(UNNotificationRequest *)self trigger];
        id v10 = [v4 trigger];
        if (UNEqualObjects(v9, v10)) {
          BOOL v11 = UNEqualIntegers(-[UNNotificationRequest destinations](self, "destinations"), [v4 destinations]);
        }
        else {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationRequest *)self identifier];
  uint64_t v6 = [(UNNotificationRequest *)self content];
  id v7 = [(UNNotificationRequest *)self trigger];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, content: %@, trigger: %@>",
    v4,
    self,
    v5,
    v6,
  uint64_t v8 = v7);

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(UNNotificationRequest *)self content];
  [v7 encodeObject:v4 forKey:@"content"];

  v5 = [(UNNotificationRequest *)self identifier];
  [v7 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(UNNotificationRequest *)self trigger];
  [v7 encodeObject:v6 forKey:@"trigger"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[UNNotificationRequest destinations](self, "destinations"), @"destinations");
}

- (UNNotificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trigger"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"destinations"];

  unint64_t v9 = [(UNNotificationRequest *)self _initWithIdentifier:v6 content:v5 trigger:v7 destinations:v8];
  return v9;
}

- (void)addSecurityScope:(id)a3
{
  id v4 = a3;
  id v5 = [(UNNotificationRequest *)self content];
  [v5 addSecurityScope:v4];
}

- (void)removeSecurityScope
{
  id v2 = [(UNNotificationRequest *)self content];
  [v2 removeSecurityScope];
}

- (void)enterSecurityScope
{
  id v2 = [(UNNotificationRequest *)self content];
  [v2 enterSecurityScope];
}

- (void)leaveSecurityScope
{
  id v2 = [(UNNotificationRequest *)self content];
  [v2 leaveSecurityScope];
}

- (unint64_t)_notificationDestinationsForInterruptionLevel:(unint64_t)a3 inputDestinations:(unint64_t)a4
{
  unint64_t v4 = a4 & 6;
  if (a3) {
    unint64_t v4 = a4;
  }
  if (a3 - 1 >= 3) {
    return v4;
  }
  else {
    return a4 & 0xF;
  }
}

- (UNNotificationContent)content
{
  return self->_content;
}

- (UNNotificationTrigger)trigger
{
  return self->_trigger;
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_trigger, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end