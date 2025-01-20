@interface NSSetChange
+ (id)allocWithZone:(_NSZone *)a3;
- (NSSetChange)initWithType:(unint64_t)a3 object:(id)a4;
- (id)value;
- (unint64_t)changeType;
@end

@implementation NSSetChange

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSSetChange == a1)
  {
    return +[NSSetChange allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSSetChange;
    return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSSetChange)initWithType:(unint64_t)a3 object:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSSetChange;
  return [(NSSetChange *)&v5 init];
}

- (unint64_t)changeType
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)value
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end