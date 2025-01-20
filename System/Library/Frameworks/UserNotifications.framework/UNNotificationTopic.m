@interface UNNotificationTopic
+ (BOOL)supportsSecureCoding;
+ (id)topicWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)sortIdentifier;
- (UNNotificationTopic)initWithCoder:(id)a3;
- (id)_description;
- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6;
- (id)description;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationTopic

- (UNNotificationTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = (void *)[v5 copy];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"displayName"];
  v11 = (void *)[v10 copy];

  uint64_t v12 = [v4 decodeIntegerForKey:@"priority"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortIdentifier"];

  v14 = [(UNNotificationTopic *)self _initWithIdentifier:v6 displayName:v11 priority:v12 sortIdentifier:v13];
  return v14;
}

+ (id)topicWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v12 displayName:v11 priority:a5 sortIdentifier:v10];

  return v13;
}

- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationTopic;
  v13 = [(UNNotificationTopic *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v16;

    v13->_priority = a5;
    uint64_t v18 = [v12 copy];
    sortIdentifier = v13->_sortIdentifier;
    v13->_sortIdentifier = (NSString *)v18;
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationTopic *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(UNNotificationTopic *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationTopic priority](self, "priority"), @"priority");
  id v7 = [(UNNotificationTopic *)self sortIdentifier];
  [v4 encodeObject:v7 forKey:@"sortIdentifier"];
}

- (unint64_t)hash
{
  v3 = [(UNNotificationTopic *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(UNNotificationTopic *)self displayName];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(UNNotificationTopic *)self priority];
  uint64_t v8 = [(UNNotificationTopic *)self sortIdentifier];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)sortIdentifier
{
  return self->_sortIdentifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (id)_description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationTopic *)self identifier];
  uint64_t v6 = [(UNNotificationTopic *)self displayName];
  unint64_t v7 = [v3 stringWithFormat:@"<%@: %p; identifier: %@, displayName: %@", v4, self, v5, v6];

  return v7;
}

- (id)description
{
  v2 = NSString;
  v3 = [(UNNotificationTopic *)self _description];
  uint64_t v4 = [v2 stringWithFormat:@"%@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNNotificationTopic *)self identifier];
    uint64_t v6 = [v4 identifier];
    if (UNEqualStrings(v5, v6))
    {
      unint64_t v7 = [(UNNotificationTopic *)self displayName];
      uint64_t v8 = [v4 displayName];
      char v9 = UNEqualObjects(v7, v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end