@interface MTLConstantRelocation
- (MTLConstantRelocation)initWithSymbolName:(id)a3 bytes:(void *)a4 length:(unint64_t)a5;
- (MTLConstantRelocation)initWithSymbolName:(id)a3 data:(id)a4;
- (NSString)symbolName;
- (OS_dispatch_data)data;
- (void)dealloc;
@end

@implementation MTLConstantRelocation

- (MTLConstantRelocation)initWithSymbolName:(id)a3 data:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLConstantRelocation;
  v6 = [(MTLConstantRelocation *)&v8 init];
  if (v6)
  {
    v6->_symbolName = (NSString *)a3;
    v6->_data = (OS_dispatch_data *)a4;
  }
  return v6;
}

- (MTLConstantRelocation)initWithSymbolName:(id)a3 bytes:(void *)a4 length:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MTLConstantRelocation;
  objc_super v8 = [(MTLConstantRelocation *)&v10 init];
  if (v8)
  {
    v8->_symbolName = (NSString *)a3;
    v8->_data = (OS_dispatch_data *)dispatch_data_create(a4, a5, 0, 0);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLConstantRelocation;
  [(MTLConstantRelocation *)&v3 dealloc];
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (OS_dispatch_data)data
{
  return self->_data;
}

@end