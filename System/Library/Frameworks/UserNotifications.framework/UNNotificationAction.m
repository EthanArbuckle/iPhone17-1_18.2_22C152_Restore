@interface UNNotificationAction
+ (BOOL)supportsSecureCoding;
+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options;
+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon;
+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5;
+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 icon:(id)a6;
+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6;
+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6 icon:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)textInputButtonTitle;
- (NSString)textInputPlaceholder;
- (NSString)title;
- (NSURL)url;
- (UNNotificationAction)initWithCoder:(id)a3;
- (UNNotificationActionIcon)icon;
- (UNNotificationActionOptions)options;
- (id)_description;
- (id)_initWithIdentifier:(id)a3 title:(id)a4 options:(unint64_t)a5 textInputButtonTitle:(id)a6 textInputPlaceholder:(id)a7 url:(id)a8 icon:(id)a9;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_textInputPlaceholder, 0);
  objc_storeStrong((id *)&self->_textInputButtonTitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UNNotificationAction)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v5 = (void *)[v4 copy];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v3 decodeObjectOfClasses:v8 forKey:@"title"];
  v10 = (void *)[v9 copy];

  uint64_t v11 = [v3 decodeIntegerForKey:@"options"];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"textInputButtonTitle"];
  v16 = (void *)[v15 copy];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v3 decodeObjectOfClasses:v19 forKey:@"textInputPlaceholder"];
  v21 = (void *)[v20 copy];

  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v23 = (void *)[v22 copy];

  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];

  v25 = (void *)[v24 copy];
  v26 = [(UNNotificationAction *)self _initWithIdentifier:v5 title:v10 options:v11 textInputButtonTitle:v16 textInputPlaceholder:v21 url:v23 icon:v25];

  return v26;
}

- (id)_initWithIdentifier:(id)a3 title:(id)a4 options:(unint64_t)a5 textInputButtonTitle:(id)a6 textInputPlaceholder:(id)a7 url:(id)a8 icon:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)UNNotificationAction;
  v21 = [(UNNotificationAction *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_options = a5;
    uint64_t v24 = [v16 copy];
    title = v21->_title;
    v21->_title = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    textInputButtonTitle = v21->_textInputButtonTitle;
    v21->_textInputButtonTitle = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    textInputPlaceholder = v21->_textInputPlaceholder;
    v21->_textInputPlaceholder = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    url = v21->_url;
    v21->_url = (NSURL *)v30;

    uint64_t v32 = [v20 copy];
    icon = v21->_icon;
    v21->_icon = (UNNotificationActionIcon *)v32;
  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNNotificationAction *)self identifier];
    v6 = [v4 identifier];
    if (UNEqualStrings(v5, v6))
    {
      uint64_t v7 = [(UNNotificationAction *)self title];
      v8 = [v4 title];
      if (UNEqualObjects(v7, v8)
        && (UNNotificationActionOptions v9 = -[UNNotificationAction options](self, "options"), v9 == [v4 options]))
      {
        v10 = [(UNNotificationAction *)self url];
        uint64_t v11 = [v4 url];
        char v12 = UNEqualObjects(v10, v11);
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationAction options](self, "options"), @"options");
  v6 = [(UNNotificationAction *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  uint64_t v7 = [(UNNotificationAction *)self textInputButtonTitle];
  [v4 encodeObject:v7 forKey:@"textInputButtonTitle"];

  v8 = [(UNNotificationAction *)self textInputPlaceholder];
  [v4 encodeObject:v8 forKey:@"textInputPlaceholder"];

  UNNotificationActionOptions v9 = [(UNNotificationAction *)self url];
  [v4 encodeObject:v9 forKey:@"url"];

  id v10 = [(UNNotificationAction *)self icon];
  [v4 encodeObject:v10 forKey:@"icon"];
}

- (UNNotificationActionIcon)icon
{
  return self->_icon;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (UNNotificationActionOptions)options
{
  return self->_options;
}

- (NSString)textInputPlaceholder
{
  return self->_textInputPlaceholder;
}

- (NSString)textInputButtonTitle
{
  return self->_textInputButtonTitle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon
{
  id v10 = icon;
  uint64_t v11 = title;
  char v12 = identifier;
  uint64_t v13 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v12 title:v11 options:options textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:0 icon:v10];

  return (UNNotificationAction *)v13;
}

+ (UNNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options
{
  v8 = title;
  UNNotificationActionOptions v9 = identifier;
  id v10 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v9 title:v8 options:options textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:0 icon:0];

  return (UNNotificationAction *)v10;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v10 title:v9 options:4 textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:v8 icon:0];

  return (UNNotificationAction *)v11;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 icon:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v13 title:v12 options:4 textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:v11 icon:v10];

  return (UNNotificationAction *)v14;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v12 title:v11 options:a6 | 4 textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:v10 icon:0];

  return (UNNotificationAction *)v13;
}

+ (UNNotificationAction)actionWithIdentifier:(id)a3 title:(id)a4 url:(id)a5 options:(unint64_t)a6 icon:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v15 title:v14 options:a6 | 4 textInputButtonTitle:&stru_1F062A810 textInputPlaceholder:&stru_1F062A810 url:v13 icon:v12];

  return (UNNotificationAction *)v16;
}

- (unint64_t)hash
{
  id v3 = [(UNNotificationAction *)self identifier];
  uint64_t v4 = [v3 hash];
  UNNotificationActionOptions v5 = [(UNNotificationAction *)self options] ^ v4;
  v6 = [(UNNotificationAction *)self title];
  uint64_t v7 = [v6 hash];
  id v8 = [(UNNotificationAction *)self textInputButtonTitle];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  id v10 = [(UNNotificationAction *)self textInputPlaceholder];
  uint64_t v11 = [v10 hash];
  id v12 = [(UNNotificationAction *)self url];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (id)_description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  UNNotificationActionOptions v5 = [(UNNotificationAction *)self identifier];
  v6 = [(UNNotificationAction *)self title];
  uint64_t v7 = [(UNNotificationAction *)self icon];
  [(UNNotificationAction *)self options];
  id v8 = NSStringFromBOOL();
  [(UNNotificationAction *)self options];
  uint64_t v9 = NSStringFromBOOL();
  [(UNNotificationAction *)self options];
  id v10 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, title: %@, icon: %@, isAuthenticationRequired: %@, isDestructive: %@, isForeground: %@",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  uint64_t v11 = v10);

  return v11;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(UNNotificationAction *)self _description];
  uint64_t v4 = [v2 stringWithFormat:@"%@>", v3];

  return v4;
}

@end