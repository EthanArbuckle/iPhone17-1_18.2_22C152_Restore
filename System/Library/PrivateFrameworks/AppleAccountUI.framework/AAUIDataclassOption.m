@interface AAUIDataclassOption
+ (BOOL)supportsSecureCoding;
- (AAUIDataclassOption)initWithActions:(id)a3;
- (AAUIDataclassOption)initWithCoder:(id)a3;
- (BOOL)isEditable;
- (BOOL)isEnabled;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation AAUIDataclassOption

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAUIDataclassOption)initWithActions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassOption;
  v5 = [(AAUIDataclassOption *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFB238] actionWithType:2];
    char v7 = [v4 containsObject:v6];

    v8 = [MEMORY[0x263EFB238] actionWithType:3];
    char v9 = [v4 containsObject:v8];

    v5->_editable = v7 & v9;
    v5->_enabled = v9 ^ 1;
  }

  return v5;
}

- (AAUIDataclassOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AAUIDataclassOption;
  v5 = [(AAUIDataclassOption *)&v7 init];
  if (v5)
  {
    v5->_editable = [v4 decodeBoolForKey:@"_editable"];
    v5->_enabled = [v4 decodeBoolForKey:@"_enabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL editable = self->_editable;
  id v5 = a3;
  [v5 encodeBool:editable forKey:@"_editable"];
  [v5 encodeBool:self->_enabled forKey:@"_enabled"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [NSNumber numberWithBool:self->_enabled];
  objc_super v7 = [NSNumber numberWithBool:self->_editable];
  v8 = [v3 stringWithFormat:@"<%@: %p>{ enabled: %@, editable: %@ }", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_BOOL editable = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end