@interface BMIndexField
- (BMIndexField)initWithName:(id)a3 expression:(id)a4 dataType:(int64_t)a5;
- (NSString)expression;
- (NSString)name;
- (id)description;
- (int64_t)dataType;
@end

@implementation BMIndexField

- (BMIndexField)initWithName:(id)a3 expression:(id)a4 dataType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMIndexField;
  v11 = [(BMIndexField *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_expression, a4);
    v12->_dataType = a5;
  }

  return v12;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%@ %p> name: %@; expression: %@; dataType: %ld",
                 objc_opt_class(),
                 self,
                 self->_name,
                 self->_expression,
                 self->_dataType);

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)expression
{
  return self->_expression;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end