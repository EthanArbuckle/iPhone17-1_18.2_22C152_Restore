@interface CPAlertAction
+ (BOOL)supportsSecureCoding;
- (CPAlertAction)initWithCoder:(id)a3;
- (CPAlertAction)initWithTitle:(NSString *)title color:(UIColor *)color handler:(CPAlertActionHandler)handler;
- (CPAlertAction)initWithTitle:(NSString *)title style:(CPAlertActionStyle)style handler:(CPAlertActionHandler)handler;
- (CPAlertActionHandler)handler;
- (CPAlertActionStyle)style;
- (NSString)title;
- (NSUUID)identifier;
- (UIColor)color;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CPAlertAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAlertAction)initWithTitle:(NSString *)title style:(CPAlertActionStyle)style handler:(CPAlertActionHandler)handler
{
  v9 = title;
  CPAlertActionHandler v10 = handler;
  v18.receiver = self;
  v18.super_class = (Class)CPAlertAction;
  v11 = [(CPAlertAction *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, title);
    v12->_style = style;
    uint64_t v13 = MEMORY[0x21D4648A0](v10);
    id v14 = v12->_handler;
    v12->_handler = (id)v13;

    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;
  }
  return v12;
}

- (CPAlertAction)initWithTitle:(NSString *)title color:(UIColor *)color handler:(CPAlertActionHandler)handler
{
  v8 = color;
  v9 = [(CPAlertAction *)self initWithTitle:title style:0 handler:handler];
  CPAlertActionHandler v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = CPSanitizedBackgroundColor(v8);
    v12 = v10->_color;
    v10->_color = (UIColor *)v11;
  }
  return v10;
}

- (CPAlertAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAlertAction;
  v5 = [(CPAlertAction *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPAlertActionTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_style = [v4 decodeIntegerForKey:@"kCPAlertActionStyleKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPAlertActionIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPAlertActionColorKey"];
    color = v5->_color;
    v5->_color = (UIColor *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPAlertAction *)self title];
  [v4 encodeObject:v5 forKey:@"kCPAlertActionTitleKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAlertAction style](self, "style"), @"kCPAlertActionStyleKey");
  uint64_t v6 = [(CPAlertAction *)self identifier];
  [v4 encodeObject:v6 forKey:@"kCPAlertActionIdentifierKey"];

  id v7 = [(CPAlertAction *)self color];
  [v4 encodeObject:v7 forKey:@"kCPAlertActionColorKey"];
}

- (NSString)title
{
  return self->_title;
}

- (CPAlertActionStyle)style
{
  return self->_style;
}

- (CPAlertActionHandler)handler
{
  return self->_handler;
}

- (UIColor)color
{
  return self->_color;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end