@interface IKCSSDeclaration
+ (id)typeString:(unint64_t)a3;
- (BOOL)important;
- (NSString)aliasedName;
- (NSString)name;
- (NSString)stringValue;
- (_NSRange)nameRange;
- (_NSRange)range;
- (_NSRange)valueRange;
- (id)description;
- (unint64_t)type;
- (void)setAliasedName:(id)a3;
- (void)setImportant:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNameRange:(_NSRange)a3;
- (void)setRange:(_NSRange)a3;
- (void)setType:(unint64_t)a3;
- (void)setValueRange:(_NSRange)a3;
@end

@implementation IKCSSDeclaration

- (void)setName:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;
  MEMORY[0x1F41817F8](v4, name);
}

- (void)setAliasedName:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  aliasedName = self->_aliasedName;
  self->_aliasedName = v4;
  MEMORY[0x1F41817F8](v4, aliasedName);
}

- (NSString)stringValue
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"(%@ has not implemented stringValue)", v4];

  return (NSString *)v5;
}

- (id)description
{
  return @"\"base declaration\"";
}

+ (id)typeString:(unint64_t)a3
{
  if (a3 > 8) {
    return @"UNDEFINED";
  }
  else {
    return off_1E6DE4E28[a3];
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)aliasedName
{
  return self->_aliasedName;
}

- (BOOL)important
{
  return self->_important;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)nameRange
{
  NSUInteger length = self->_nameRange.length;
  NSUInteger location = self->_nameRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setNameRange:(_NSRange)a3
{
  self->_nameRange = a3;
}

- (_NSRange)valueRange
{
  NSUInteger length = self->_valueRange.length;
  NSUInteger location = self->_valueRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setValueRange:(_NSRange)a3
{
  self->_valueRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end