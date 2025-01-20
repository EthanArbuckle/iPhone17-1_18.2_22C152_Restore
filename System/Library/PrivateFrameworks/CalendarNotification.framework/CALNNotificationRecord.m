@interface CALNNotificationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlertContent;
- (BOOL)hasSound;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (BOOL)shouldPlaySound;
- (BOOL)shouldPresentAlert;
- (CALNNotificationContent)content;
- (CALNNotificationRecord)initWithCoder:(id)a3;
- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5;
- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5 date:(id)a6 shouldPresentAlert:(BOOL)a7 shouldPlaySound:(BOOL)a8;
- (NSDate)date;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNNotificationRecord

- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5
{
  return [(CALNNotificationRecord *)self initWithSourceIdentifier:a3 sourceClientIdentifier:a4 content:a5 date:0 shouldPresentAlert:1 shouldPlaySound:1];
}

- (CALNNotificationRecord)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 content:(id)a5 date:(id)a6 shouldPresentAlert:(BOOL)a7 shouldPlaySound:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CALNNotificationRecord;
  v18 = [(CALNNotificationRecord *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    sourceIdentifier = v18->_sourceIdentifier;
    v18->_sourceIdentifier = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    sourceClientIdentifier = v18->_sourceClientIdentifier;
    v18->_sourceClientIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    content = v18->_content;
    v18->_content = (CALNNotificationContent *)v23;

    uint64_t v25 = [v17 copy];
    date = v18->_date;
    v18->_date = (NSDate *)v25;

    v18->_shouldPresentAlert = a7;
    v18->_shouldPlaySound = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNNotificationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceClientIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v9 = [v4 decodeBoolForKey:@"shouldPresentAlert"];
  uint64_t v10 = [v4 decodeBoolForKey:@"shouldPlaySound"];

  v11 = [(CALNNotificationRecord *)self initWithSourceIdentifier:v5 sourceClientIdentifier:v6 content:v7 date:v8 shouldPresentAlert:v9 shouldPlaySound:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(CALNNotificationRecord *)self sourceIdentifier];
  [v8 encodeObject:v4 forKey:@"sourceIdentifier"];

  v5 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  [v8 encodeObject:v5 forKey:@"sourceClientIdentifier"];

  v6 = [(CALNNotificationRecord *)self content];
  [v8 encodeObject:v6 forKey:@"content"];

  v7 = [(CALNNotificationRecord *)self date];
  [v8 encodeObject:v7 forKey:@"date"];

  objc_msgSend(v8, "encodeBool:forKey:", -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"), @"shouldPresentAlert");
  objc_msgSend(v8, "encodeBool:forKey:", -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"), @"shouldPlaySound");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationRecord *)self isEqualToRecord:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNNotificationRecord *)self sourceIdentifier];
  v6 = [v4 sourceIdentifier];
  int v7 = CalEqualStrings();

  if (!v7) {
    goto LABEL_6;
  }
  id v8 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  uint64_t v9 = [v4 sourceClientIdentifier];
  int v10 = CalEqualStrings();

  if (!v10) {
    goto LABEL_6;
  }
  v11 = [(CALNNotificationRecord *)self content];
  v12 = [v4 content];
  int v13 = CalEqualObjects();

  if (!v13) {
    goto LABEL_6;
  }
  id v14 = [(CALNNotificationRecord *)self date];
  id v15 = [v4 date];
  int v16 = CalEqualObjects();

  if (!v16) {
    goto LABEL_6;
  }
  int v17 = [(CALNNotificationRecord *)self shouldPresentAlert];
  if (v17 == [v4 shouldPresentAlert])
  {
    BOOL v20 = [(CALNNotificationRecord *)self shouldPlaySound];
    int v18 = v20 ^ [v4 shouldPlaySound] ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(CALNNotificationRecord *)self sourceIdentifier];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  int v7 = [(CALNNotificationRecord *)self content];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(CALNNotificationRecord *)self date];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  uint64_t v11 = [(CALNNotificationRecord *)self shouldPresentAlert];
  BOOL v12 = [(CALNNotificationRecord *)self shouldPlaySound];
  uint64_t v13 = 2;
  if (!v12) {
    uint64_t v13 = 0;
  }
  return v10 ^ v11 ^ v13;
}

- (BOOL)hasAlertContent
{
  v3 = [(CALNNotificationRecord *)self content];
  if (v3)
  {
    uint64_t v4 = [(CALNNotificationRecord *)self content];
    BOOL v5 = [v4 body];
    if ([v5 length])
    {
      BOOL v6 = 1;
    }
    else
    {
      int v7 = [(CALNNotificationRecord *)self content];
      uint64_t v8 = [v7 subtitle];
      if ([v8 length])
      {
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v9 = [(CALNNotificationRecord *)self content];
        uint64_t v10 = [v9 title];
        BOOL v6 = [v10 length] != 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hasSound
{
  v2 = [(CALNNotificationRecord *)self content];
  v3 = [v2 sound];
  BOOL v4 = [v3 alertType] != 0;

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CALNNotificationRecord *)self sourceIdentifier];
  BOOL v6 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  int v7 = [(CALNNotificationRecord *)self content];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNNotificationRecord hasAlertContent](self, "hasAlertContent"));
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@, content = %@, shouldPresentAlert = %@, shouldPlaySound = %@, hasAlertContent = %@)", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CALNMutableNotificationRecord allocWithZone:a3];
  BOOL v5 = [(CALNNotificationRecord *)self sourceIdentifier];
  BOOL v6 = [(CALNNotificationRecord *)self sourceClientIdentifier];
  int v7 = [(CALNNotificationRecord *)self content];
  uint64_t v8 = [(CALNNotificationRecord *)self date];
  uint64_t v9 = [(CALNNotificationRecord *)v4 initWithSourceIdentifier:v5 sourceClientIdentifier:v6 content:v7 date:v8 shouldPresentAlert:[(CALNNotificationRecord *)self shouldPresentAlert] shouldPlaySound:[(CALNNotificationRecord *)self shouldPlaySound]];

  return v9;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (CALNNotificationContent)content
{
  return self->_content;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldPresentAlert
{
  return self->_shouldPresentAlert;
}

- (BOOL)shouldPlaySound
{
  return self->_shouldPlaySound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end