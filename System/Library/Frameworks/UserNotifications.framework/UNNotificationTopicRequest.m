@interface UNNotificationTopicRequest
+ (BOOL)supportsSecureCoding;
+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 options:(unint64_t)a5;
+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 options:(unint64_t)a7;
+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8;
- (BOOL)isEqual:(id)a3;
- (UNNotificationTopic)topic;
- (UNNotificationTopicRequest)initWithCoder:(id)a3;
- (id)_description;
- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8;
- (id)description;
- (unint64_t)enabledOptions;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)supportedOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationTopicRequest

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v9 displayName:v8 priority:0 sortIdentifier:&stru_1F062A810 supportedOptions:a5 enabledOptions:a5];

  return v10;
}

- (UNNotificationTopicRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v4 decodeIntegerForKey:@"supportedOptions"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"enabledOptions"];

  id v9 = [v6 identifier];
  v10 = [v6 displayName];
  uint64_t v11 = [v6 priority];
  v12 = [v6 sortIdentifier];
  v13 = [(UNNotificationTopicRequest *)self _initWithIdentifier:v9 displayName:v10 priority:v11 sortIdentifier:v12 supportedOptions:v7 enabledOptions:v8];

  return v13;
}

- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationTopicRequest;
  v17 = [(UNNotificationTopicRequest *)&v21 init];
  if (v17)
  {
    uint64_t v18 = +[UNNotificationTopic topicWithIdentifier:v14 displayName:v15 priority:a5 sortIdentifier:v16];
    topic = v17->_topic;
    v17->_topic = (UNNotificationTopic *)v18;

    v17->_supportedOptions = a7;
    v17->_enabledOptions = a8;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNNotificationTopicRequest *)self topic];
    v6 = [v4 topic];
    if (UNEqualObjects(v5, v6)
      && (unint64_t v7 = [(UNNotificationTopicRequest *)self supportedOptions],
          v7 == [v4 supportedOptions]))
    {
      unint64_t v8 = [(UNNotificationTopicRequest *)self enabledOptions];
      BOOL v9 = v8 == [v4 enabledOptions];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationTopicRequest *)self topic];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; topic: %@, supportedOptions: %ld, enabledOptions: %ld",
    v4,
    self,
    v5,
    [(UNNotificationTopicRequest *)self supportedOptions],
  v6 = [(UNNotificationTopicRequest *)self enabledOptions]);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(UNNotificationTopicRequest *)self topic];
  [v5 encodeObject:v4 forKey:@"topic"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationTopicRequest supportedOptions](self, "supportedOptions"), @"supportedOptions");
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationTopicRequest enabledOptions](self, "enabledOptions"), @"enabledOptions");
}

- (unint64_t)hash
{
  v3 = [(UNNotificationTopicRequest *)self topic];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(UNNotificationTopicRequest *)self supportedOptions];
  unint64_t v6 = v5 ^ [(UNNotificationTopicRequest *)self enabledOptions] ^ v4;

  return v6;
}

- (UNNotificationTopic)topic
{
  return self->_topic;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (unint64_t)enabledOptions
{
  return self->_enabledOptions;
}

- (id)description
{
  v2 = NSString;
  v3 = [(UNNotificationTopicRequest *)self _description];
  uint64_t v4 = [v2 stringWithFormat:@"%@>", v3];

  return v4;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 options:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v14 displayName:v13 priority:a5 sortIdentifier:v12 supportedOptions:a7 enabledOptions:a7];

  return v15;
}

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v16 displayName:v15 priority:a5 sortIdentifier:v14 supportedOptions:a7 enabledOptions:a8];

  return v17;
}

- (unint64_t)options
{
  return self->_supportedOptions;
}

@end