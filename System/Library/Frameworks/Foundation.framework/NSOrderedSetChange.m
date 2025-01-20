@interface NSOrderedSetChange
+ (id)allocWithZone:(_NSZone *)a3;
- (NSOrderedSetChange)initWithType:(unint64_t)a3 sourceIndex:(unint64_t)a4 destinationIndex:(unint64_t)a5 value:(id)a6;
- (id)value;
- (unint64_t)changeType;
- (unint64_t)destinationIndex;
- (unint64_t)sourceIndex;
@end

@implementation NSOrderedSetChange

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSOrderedSetChange == a1)
  {
    return +[NSOrderedSetChange allocWithZone:a3];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSetChange;
    return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  }
}

- (NSOrderedSetChange)initWithType:(unint64_t)a3 sourceIndex:(unint64_t)a4 destinationIndex:(unint64_t)a5 value:(id)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSOrderedSetChange;
  return [(NSOrderedSetChange *)&v7 init];
}

- (unint64_t)changeType
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)sourceIndex
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)destinationIndex
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