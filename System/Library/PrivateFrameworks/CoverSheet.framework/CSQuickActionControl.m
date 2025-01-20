@interface CSQuickActionControl
- (CSQuickActionControl)initWithCategory:(int64_t)a3 position:(int64_t)a4;
- (NSString)title;
- (int64_t)category;
- (int64_t)position;
@end

@implementation CSQuickActionControl

- (CSQuickActionControl)initWithCategory:(int64_t)a3 position:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSQuickActionControl;
  result = [(CSQuickActionControl *)&v7 init];
  if (result)
  {
    result->_category = a3;
    result->_position = a4;
  }
  return result;
}

- (NSString)title
{
  unint64_t category = self->_category;
  if (category > 2) {
    return (NSString *)@"Undefined Quick Action";
  }
  else {
    return &off_1E6ADA7A0[category]->isa;
  }
}

- (int64_t)category
{
  return self->_category;
}

- (int64_t)position
{
  return self->_position;
}

@end