@interface ASDAlertAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithTitle:(id)a3;
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4;
- (ASDAlertAction)initWithCoder:(id)a3;
- (ASDAlertAction)initWithTitle:(id)a3;
- (ASDAlertAction)initWithTitle:(id)a3 style:(int64_t)a4;
- (NSString)title;
- (NSUUID)identifier;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASDAlertAction

- (ASDAlertAction)initWithTitle:(id)a3
{
  return [(ASDAlertAction *)self initWithTitle:a3 style:0];
}

- (ASDAlertAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDAlertAction;
  v8 = [(ASDAlertAction *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_title, a3);
    v8->_style = a4;
  }

  return v8;
}

+ (id)actionWithTitle:(id)a3
{
  id v3 = a3;
  v4 = [[ASDAlertAction alloc] initWithTitle:v3];

  return v4;
}

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  v6 = [[ASDAlertAction alloc] initWithTitle:v5 style:a4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDAlertAction;
  id v5 = [(ASDAlertAction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_style forKey:@"style"];
}

- (NSUUID)identifier
{
  return self->_identifier;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end