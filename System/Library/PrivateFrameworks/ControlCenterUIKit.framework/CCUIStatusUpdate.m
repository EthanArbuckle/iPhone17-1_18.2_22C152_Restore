@interface CCUIStatusUpdate
+ (id)statusUpdateWithMessage:(id)a3 type:(unint64_t)a4;
- (NSString)message;
- (id)_initWithMessage:(id)a3 type:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation CCUIStatusUpdate

+ (id)statusUpdateWithMessage:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithMessage:v6 type:a4];

  return v7;
}

- (id)_initWithMessage:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIStatusUpdate;
  v7 = [(CCUIStatusUpdate *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    message = v7->_message;
    v7->_message = (NSString *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end