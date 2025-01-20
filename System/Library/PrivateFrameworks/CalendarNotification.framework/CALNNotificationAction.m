@interface CALNNotificationAction
+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5;
+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAction:(id)a3;
- (CALNNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6;
- (NSString)identifier;
- (NSString)systemImageName;
- (NSString)title;
- (NSURL)url;
- (id)description;
- (unint64_t)hash;
@end

@implementation CALNNotificationAction

+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5
{
  return (CALNNotificationAction *)[a1 actionWithIdentifier:a3 title:a4 systemImageName:a5 url:0];
}

+ (CALNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v13 title:v12 systemImageName:v11 url:v10];

  return (CALNNotificationAction *)v14;
}

- (CALNNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 systemImageName:(id)a5 url:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CALNNotificationAction;
  v14 = [(CALNNotificationAction *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    title = v14->_title;
    v14->_title = (NSString *)v17;

    objc_storeStrong((id *)&v14->_systemImageName, a5);
    uint64_t v19 = [v13 copy];
    url = v14->_url;
    v14->_url = (NSURL *)v19;
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(CALNNotificationAction *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(CALNNotificationAction *)self title];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(CALNNotificationAction *)self systemImageName];
  uint64_t v8 = [v7 hash];

  v9 = [(CALNNotificationAction *)self url];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationAction *)self isEqualToAction:v4];

  return v5;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v4 = (CALNNotificationAction *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationAction *)self identifier];
    uint64_t v6 = [(CALNNotificationAction *)v4 identifier];
    int v7 = CalEqualStrings();

    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v8 = [(CALNNotificationAction *)self title];
    v9 = [(CALNNotificationAction *)v4 title];
    int v10 = CalEqualStrings();

    if (!v10) {
      goto LABEL_6;
    }
    id v11 = [(CALNNotificationAction *)self systemImageName];
    id v12 = [(CALNNotificationAction *)v4 systemImageName];
    int v13 = CalEqualStrings();

    if (v13)
    {
      v14 = [(CALNNotificationAction *)self url];
      uint64_t v15 = [(CALNNotificationAction *)v4 url];
      char v16 = CalEqualObjects();
    }
    else
    {
LABEL_6:
      char v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CALNNotificationAction *)self identifier];
  uint64_t v6 = [(CALNNotificationAction *)self title];
  int v7 = [(CALNNotificationAction *)self systemImageName];
  uint64_t v8 = [(CALNNotificationAction *)self url];
  v9 = [v3 stringWithFormat:@"<%@: %p>(identifier = %@, title = %@, systemImage = %@, url = %@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end