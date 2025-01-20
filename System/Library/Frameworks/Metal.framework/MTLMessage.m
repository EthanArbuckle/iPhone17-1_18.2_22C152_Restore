@interface MTLMessage
- (NSString)string;
- (id)init:(unint64_t)a3 message:(id)a4;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation MTLMessage

- (id)init:(unint64_t)a3 message:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLMessage;
  v6 = [(MTLMessage *)&v8 init];
  v6->_type = a3;
  v6->_string = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLMessage;
  [(MTLMessage *)&v3 dealloc];
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end