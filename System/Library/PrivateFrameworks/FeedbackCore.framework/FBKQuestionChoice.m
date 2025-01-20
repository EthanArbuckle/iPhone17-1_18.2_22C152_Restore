@interface FBKQuestionChoice
+ (BOOL)supportsSecureCoding;
+ (id)choiceFromArray:(id)a3;
- (BOOL)canSelect;
- (BOOL)isPrompt;
- (FBKQuestionChoice)initWithCoder:(id)a3;
- (FBKQuestionChoice)initWithTitle:(id)a3 value:(id)a4;
- (NSString)title;
- (id)diffableHashWithContext:(id)a3;
- (id)value;
- (void)encodeWithCoder:(id)a3;
- (void)setCanSelect:(BOOL)a3;
@end

@implementation FBKQuestionChoice

+ (id)choiceFromArray:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = FBKNilIfNSNull(v4);
  v6 = (void *)v5;
  v7 = &stru_26DDF6A30;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [v3 objectAtIndexedSubscript:1];

  v10 = FBKNilIfNSNull(v9);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 stringValue];

    v10 = (void *)v11;
  }
  if (v10)
  {
    v12 = [[FBKQuestionChoice alloc] initWithTitle:v8 value:v10];
  }
  else
  {
    v13 = +[FBKLog model];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[FBKQuestionChoice choiceFromArray:](v13);
    }

    v12 = 0;
  }

  return v12;
}

- (FBKQuestionChoice)initWithTitle:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKQuestionChoice;
  v9 = [(FBKQuestionChoice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_canSelect = 1;
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (FBKQuestionChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  id v7 = [(FBKQuestionChoice *)self initWithTitle:v5 value:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKQuestionChoice *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(FBKQuestionChoice *)self value];
  [v4 encodeObject:v6 forKey:@"value"];
}

- (BOOL)isPrompt
{
  id v3 = [(FBKQuestionChoice *)self value];
  id v4 = [NSNumber numberWithInteger:-1];
  if ([v3 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(FBKQuestionChoice *)self value];
    char v5 = [v6 isEqual:@"-1"];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)diffableHashWithContext:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [(FBKQuestionChoice *)self value];
  id v7 = [v4 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)canSelect
{
  return self->_canSelect;
}

- (void)setCanSelect:(BOOL)a3
{
  self->_canSelect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)choiceFromArray:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "FBKQuestion choice had nil title/value, will ignore", v1, 2u);
}

@end