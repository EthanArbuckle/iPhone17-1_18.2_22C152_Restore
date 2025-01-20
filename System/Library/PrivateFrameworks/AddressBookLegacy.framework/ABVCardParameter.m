@interface ABVCardParameter
- (ABVCardParameter)initWithName:(id)a3;
- (BOOL)isPrimary;
- (id)description;
- (id)grouping;
- (id)name;
- (id)types;
- (id)value;
- (void)addType:(id)a3;
- (void)addTypes:(id)a3;
- (void)dealloc;
- (void)setGrouping:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation ABVCardParameter

- (ABVCardParameter)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ABVCardParameter;
  v4 = [(ABVCardParameter *)&v7 init];
  v4->_name = (NSString *)a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4->_types = v5;
  if (a3) {
    [(NSMutableArray *)v5 addObject:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABVCardParameter;
  [(ABVCardParameter *)&v3 dealloc];
}

- (void)setValue:(id)a3
{
  self->_value = a3;
}

- (void)addType:(id)a3
{
}

- (void)addTypes:(id)a3
{
}

- (id)types
{
  return self->_types;
}

- (id)name
{
  return self->_name;
}

- (void)setGrouping:(id)a3
{
  self->_grouping = (NSString *)a3;
}

- (id)grouping
{
  return self->_grouping;
}

- (id)value
{
  return self->_value;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (id)description
{
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"NONAME";
  }
  v4 = (void *)[MEMORY[0x1E4F28E78] stringWithString:name];
  v5 = v4;
  if (self->_value) {
    [v4 appendFormat:@"=%@", self->_value];
  }
  if (self->_primary) {
    [v5 appendString:@" Primary"];
  }
  return v5;
}

@end