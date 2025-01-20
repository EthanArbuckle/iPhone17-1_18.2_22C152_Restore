@interface MTLCounterInternal
- (BOOL)isEqual:(id)a3;
- (MTLCounterInternal)initWithName:(id)a3 description:(id)a4;
- (NSString)description;
- (NSString)name;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MTLCounterInternal

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      name = self->_name;
      if (name == (NSString *)[a3 name]
        || (int v12 = -[NSString isEqual:](self->_name, "isEqual:", [a3 name])) != 0)
      {
        description = self->_description;
        if (description == (NSString *)objc_msgSend(a3, "description", v6, v16, v17, v18, v7, v8)
          || (int v12 = -[NSString isEqual:](self->_description, "isEqual:", [a3 description])) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (MTLCounterInternal)initWithName:(id)a3 description:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLCounterInternal;
  uint64_t v6 = [(MTLCounterInternal *)&v8 init];
  v6->_name = (NSString *)a3;
  v6->_description = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCounterInternal;
  [(MTLCounterInternal *)&v3 dealloc];
}

- (NSString)description
{
  v2 = (void *)[(NSString *)self->_description copy];

  return (NSString *)v2;
}

- (unint64_t)hash
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = [(NSString *)self->_name hash];
  v4[1] = [(NSString *)self->_description hash];
  return _MTLHashState((int *)v4, 0x10uLL);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end