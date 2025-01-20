@interface KeepAlive
+ (KeepAlive)keepAliveWithFormat:(id)a3;
+ (KeepAlive)keepAliveWithName:(id)a3;
- (KeepAlive)initWithName:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation KeepAlive

- (void)dealloc
{
  sub_100015B94((uint64_t)TransactionStore, self->_name);
  v3.receiver = self;
  v3.super_class = (Class)KeepAlive;
  [(KeepAlive *)&v3 dealloc];
}

+ (KeepAlive)keepAliveWithFormat:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:v3 locale:0 arguments:&v8];

  v5 = [[KeepAlive alloc] initWithName:v4];
  return v5;
}

- (KeepAlive)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeepAlive;
  v5 = [(KeepAlive *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;

    sub_100015A88((uint64_t)TransactionStore, v5->_name);
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (KeepAlive)keepAliveWithName:(id)a3
{
  id v3 = a3;
  id v4 = [[KeepAlive alloc] initWithName:v3];

  return v4;
}

- (id)description
{
  return self->_name;
}

@end