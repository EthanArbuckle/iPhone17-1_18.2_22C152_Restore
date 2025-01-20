@interface UNNotification
+ (BOOL)supportsSecureCoding;
+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4;
+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)intentIdentifiers;
- (NSDate)date;
- (NSString)sourceIdentifier;
- (UNNotification)initWithCoder:(id)a3;
- (UNNotification)initWithNotificationRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6;
- (UNNotificationRequest)request;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotification

+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNotificationRequest:v6 date:v5 sourceIdentifier:&stru_1F062A810 intentIdentifiers:MEMORY[0x1E4F1CBF0]];

  return (UNNotification *)v7;
}

+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNotificationRequest:v12 date:v11 sourceIdentifier:v10 intentIdentifiers:v9];

  return (UNNotification *)v13;
}

- (UNNotification)initWithNotificationRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UNNotification;
  v14 = [(UNNotification *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    date = v14->_date;
    v14->_date = (NSDate *)v15;

    uint64_t v17 = [v10 copy];
    request = v14->_request;
    v14->_request = (UNNotificationRequest *)v17;

    uint64_t v19 = [v12 copy];
    sourceIdentifier = v14->_sourceIdentifier;
    v14->_sourceIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    v22 = (void *)v21;
    if (v21) {
      v23 = (void *)v21;
    }
    else {
      v23 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v14->_intentIdentifiers, v23);
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(UNNotification *)self date];
  uint64_t v4 = [v3 hash];
  id v5 = [(UNNotification *)self request];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(UNNotification *)self sourceIdentifier];
  uint64_t v8 = [v7 hash];
  id v9 = [(UNNotification *)self intentIdentifiers];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(UNNotification *)self date];
    uint64_t v6 = [v4 date];
    if (UNEqualObjects(v5, v6))
    {
      v7 = [(UNNotification *)self request];
      uint64_t v8 = [v4 request];
      if (UNEqualObjects(v7, v8))
      {
        id v9 = [(UNNotification *)self intentIdentifiers];
        unint64_t v10 = [v4 intentIdentifiers];
        if (UNEqualObjects(v9, v10))
        {
          id v11 = [(UNNotification *)self sourceIdentifier];
          id v12 = [v4 sourceIdentifier];
          char v13 = UNEqualObjects(v11, v12);
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(UNNotification *)self sourceIdentifier];
  uint64_t v6 = [(UNNotification *)self date];
  v7 = [(UNNotification *)self request];
  uint64_t v8 = [(UNNotification *)self intentIdentifiers];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; source: %@ date: %@, request: %@, intents: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNNotification *)self date];
  [v4 encodeObject:v5 forKey:@"date"];

  uint64_t v6 = [(UNNotification *)self request];
  [v4 encodeObject:v6 forKey:@"request"];

  v7 = [(UNNotification *)self sourceIdentifier];
  [v4 encodeObject:v7 forKey:@"sourceIdentifier"];

  id v8 = [(UNNotification *)self intentIdentifiers];
  [v4 encodeObject:v8 forKey:@"intentIdentifiers"];
}

- (UNNotification)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  unint64_t v10 = [v8 setWithArray:v9];
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"intentIdentifiers"];

  id v12 = [(UNNotification *)self initWithNotificationRequest:v6 date:v5 sourceIdentifier:v7 intentIdentifiers:v11];
  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (UNNotificationRequest)request
{
  return self->_request;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end