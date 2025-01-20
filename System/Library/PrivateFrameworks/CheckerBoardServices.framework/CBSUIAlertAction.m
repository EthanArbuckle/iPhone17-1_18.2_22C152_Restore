@interface CBSUIAlertAction
+ (BOOL)supportsSecureCoding;
+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (CBSUIAlertAction)initWithCoder:(id)a3;
- (CBSUIAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setHandler:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CBSUIAlertAction

- (CBSUIAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBSUIAlertAction;
  v11 = [(CBSUIAlertAction *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_style = a4;
    uint64_t v13 = MEMORY[0x23ED0A8B0](v10);
    id handler = v12->_handler;
    v12->_id handler = (id)v13;
  }
  return v12;
}

+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 style:a4 handler:v8];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSUIAlertAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBSUIAlertAction;
  v5 = [(CBSUIAlertAction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeIntegerForKey:@"style"];
    id handler = v5->_handler;
    v5->_style = v8;
    v5->_id handler = &__block_literal_global_0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CBSUIAlertAction *)self title];
  [v5 encodeObject:v4 forKey:@"title"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CBSUIAlertAction style](self, "style"), @"style");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end