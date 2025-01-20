@interface LACExtractablePasswordPersistenceSimulatorAdapter
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (id)extractPassword:(id *)a3;
- (void)dealloc;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LACExtractablePasswordPersistenceSimulatorAdapter

- (void)dealloc
{
  -[NSMutableData resetBytesInRange:](self->_data, "resetBytesInRange:", 0, [(NSMutableData *)self->_data length]);
  v3.receiver = self;
  v3.super_class = (Class)LACExtractablePasswordPersistenceSimulatorAdapter;
  [(LACExtractablePasswordPersistenceSimulatorAdapter *)&v3 dealloc];
}

- (id)extractPassword:(id *)a3
{
  return self->_data;
}

- (void)extractPasswordWithCompletion:(id)a3
{
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF990];
  v10 = (void (**)(id, void))a4;
  id v7 = a3;
  v8 = (NSMutableData *)[[v6 alloc] initWithData:v7];

  data = self->_data;
  self->_data = v8;

  v10[2](v10, 0);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF990];
  id v6 = a3;
  id v7 = (NSMutableData *)[[v5 alloc] initWithData:v6];

  data = self->_data;
  self->_data = v7;

  return 1;
}

- (void).cxx_destruct
{
}

@end