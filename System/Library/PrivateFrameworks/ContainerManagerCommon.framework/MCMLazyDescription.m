@interface MCMLazyDescription
- (MCMLazyDescription)initWithDescriber:(id)a3;
- (id)description;
- (id)redactedDescription;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation MCMLazyDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong(&self->_block, 0);
}

- (id)redactedDescription
{
  v2 = (uint64_t (*)(void))*((void *)self->_block + 2);

  return (id)v2();
}

- (MCMLazyDescription)initWithDescriber:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMLazyDescription;
  v5 = [(MCMLazyDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D9479020](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (id)description
{
  value = self->_value;
  if (!value)
  {
    (*((void (**)(void))self->_block + 2))();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_value;
    self->_value = v4;

    value = self->_value;
  }

  return value;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  value = self->_value;
  if (!value)
  {
    id v9 = [(MCMLazyDescription *)self description];
    value = self->_value;
  }

  -[NSString getCharacters:range:](value, "getCharacters:range:", a3, location, length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  value = self->_value;
  if (!value)
  {
    id v6 = [(MCMLazyDescription *)self description];
    value = self->_value;
  }

  return [(NSString *)value characterAtIndex:a3];
}

- (unint64_t)length
{
  value = self->_value;
  if (!value)
  {
    id v4 = [(MCMLazyDescription *)self description];
    value = self->_value;
  }

  return [(NSString *)value length];
}

@end