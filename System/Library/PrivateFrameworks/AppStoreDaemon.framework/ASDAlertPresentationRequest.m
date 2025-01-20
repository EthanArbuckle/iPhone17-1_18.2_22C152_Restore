@interface ASDAlertPresentationRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithTitle:(id)a3 message:(id)a4;
- (ASDAlertPresentationRequest)initWithCoder:(id)a3;
- (ASDAlertPresentationRequest)initWithTitle:(id)a3 message:(id)a4;
- (NSArray)actions;
- (NSString)iconBundlePath;
- (NSString)logKey;
- (NSString)message;
- (NSString)title;
- (id)addActionWithTitle:(id)a3;
- (id)addActionWithTitle:(id)a3 style:(int64_t)a4;
- (int64_t)icon;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setIcon:(int64_t)a3;
- (void)setIconBundlePath:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASDAlertPresentationRequest

+ (id)requestWithTitle:(id)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ASDAlertPresentationRequest alloc] initWithTitle:v6 message:v5];

  return v7;
}

- (ASDAlertPresentationRequest)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDAlertPresentationRequest;
  v9 = [(ASDAlertPresentationRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v11;
  }
  return v10;
}

- (id)addActionWithTitle:(id)a3
{
  return [(ASDAlertPresentationRequest *)self addActionWithTitle:a3 style:0];
}

- (id)addActionWithTitle:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[ASDAlertAction alloc] initWithTitle:v6 style:a4];

  [(NSMutableArray *)self->_actions addObject:v7];
  return v7;
}

- (NSArray)actions
{
  v2 = (void *)[(NSMutableArray *)self->_actions copy];
  return (NSArray *)v2;
}

- (void)setActions:(id)a3
{
  v4 = (NSMutableArray *)[a3 copy];
  actions = self->_actions;
  self->_actions = v4;
  MEMORY[0x1F41817F8](v4, actions);
}

- (NSString)iconBundlePath
{
  if (self->_icon != 1)
  {
    iconBundlePath = self->_iconBundlePath;
    self->_iconBundlePath = 0;
  }
  v4 = self->_iconBundlePath;
  return v4;
}

- (void)setIconBundlePath:(id)a3
{
  self->_icon = a3 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertPresentationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDAlertPresentationRequest;
  id v5 = [(ASDAlertPresentationRequest *)&v16 init];
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
    uint64_t v7 = [v6 mutableCopy];
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconBundlePath"];
    iconBundlePath = v5->_iconBundlePath;
    v5->_iconBundlePath = (NSString *)v9;

    v5->_icon = [v4 decodeIntegerForKey:@"icon"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v13;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  actions = self->_actions;
  id v5 = a3;
  [v5 encodeObject:actions forKey:@"actions"];
  [v5 encodeObject:self->_iconBundlePath forKey:@"iconBundlePath"];
  [v5 encodeInteger:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeInteger:self->_style forKey:@"style"];
}

- (int64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(int64_t)a3
{
  self->_icon = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconBundlePath, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end