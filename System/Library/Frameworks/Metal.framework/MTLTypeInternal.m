@interface MTLTypeInternal
- (BOOL)isEqual:(id)a3;
- (MTLTypeInternal)initWithDataType:(unint64_t)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)dataType;
- (void)dealloc;
@end

@implementation MTLTypeInternal

- (MTLTypeInternal)initWithDataType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLTypeInternal;
  result = [(MTLTypeInternal *)&v5 init];
  result->_dataType = a3;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLTypeInternal;
  [(MTLTypeInternal *)&v2 dealloc];
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  return MTLDataTypeString(self->_dataType);
}

- (id)formattedDescription:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(MTLTypeInternal *)self formattedDescription:a3 withPrintedTypes:v5];

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(MTLTypeInternal *)self formattedDescription:0 withPrintedTypes:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && self->_dataType == *((void *)a3 + 1);
}

@end