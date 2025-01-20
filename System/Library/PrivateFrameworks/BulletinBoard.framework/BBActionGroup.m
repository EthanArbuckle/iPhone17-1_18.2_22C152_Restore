@interface BBActionGroup
+ (id)actionGroupWithActions:(id)a3;
- (BBActionGroup)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
@end

@implementation BBActionGroup

+ (id)actionGroupWithActions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setActions:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBActionGroup *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)BBActionGroup;
      if ([(BBAction *)&v10 isEqual:v5])
      {
        v6 = [(BBActionGroup *)self actions];
        v7 = [(BBActionGroup *)v5 actions];
        char v8 = BSEqualObjects();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)BBActionGroup;
  unint64_t v3 = [(BBAction *)&v7 hash];
  id v4 = [(BBActionGroup *)self actions];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BBActionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBActionGroup;
  unint64_t v5 = [(BBAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = BBAllowedClasses();
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:@"actions"];
    [(BBActionGroup *)v5 setActions:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BBActionGroup;
  id v4 = a3;
  [(BBAction *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(BBActionGroup *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  unint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  unint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end