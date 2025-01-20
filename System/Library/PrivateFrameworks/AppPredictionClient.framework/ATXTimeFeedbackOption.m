@interface ATXTimeFeedbackOption
+ (BOOL)supportsSecureCoding;
- (ATXTimeFeedbackOption)initWithCoder:(id)a3;
- (ATXTimeFeedbackOption)initWithTitle:(id)a3 identifier:(id)a4 symbolName:(id)a5 isDestructive:(BOOL)a6;
- (BOOL)isDestructive;
- (NSString)identifier;
- (NSString)symbolName;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeFeedbackOption

- (ATXTimeFeedbackOption)initWithTitle:(id)a3 identifier:(id)a4 symbolName:(id)a5 isDestructive:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXTimeFeedbackOption;
  v13 = [(ATXTimeFeedbackOption *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v18;

    v13->_isDestructive = a6;
    v20 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeFeedbackOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isDestructive"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    id v11 = 0;
  }
  else
  {
    self = [(ATXTimeFeedbackOption *)self initWithTitle:v5 identifier:v6 symbolName:v7 isDestructive:v8];
    id v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_symbolName forKey:@"symbolName"];
  [v5 encodeBool:self->_isDestructive forKey:@"isDestructive"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end