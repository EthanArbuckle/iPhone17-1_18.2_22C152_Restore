@interface NSConcreteSetChange
- (NSConcreteSetChange)initWithType:(unint64_t)a3 object:(id)a4;
- (id)value;
- (unint64_t)changeType;
- (void)dealloc;
@end

@implementation NSConcreteSetChange

- (NSConcreteSetChange)initWithType:(unint64_t)a3 object:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteSetChange;
  v6 = [(NSConcreteSetChange *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_changeType = a3;
    v6->_value = a4;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteSetChange;
  [(NSConcreteSetChange *)&v3 dealloc];
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (id)value
{
  return self->_value;
}

@end