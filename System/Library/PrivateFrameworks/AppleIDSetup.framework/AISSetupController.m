@interface AISSetupController
- (AISSetupController)init;
- (AISSetupController)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (__AISSetupController)implementation;
- (void)setImplementation:(id)a3;
- (void)setupWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation AISSetupController

- (AISSetupController)init
{
  return [(AISSetupController *)self initWithQueue:0];
}

- (AISSetupController)initWithQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AISSetupController;
  v5 = [(AISSetupController *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      queue = v5->_queue;
      v5->_queue = v8;
    }

    v10 = [[__AISSetupController alloc] initWithQueue:v5->_queue];
    implementation = v5->_implementation;
    v5->_implementation = v10;
  }
  return v5;
}

- (void)setupWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AISSetupController *)self implementation];
  [v8 setupWithContext:v7 completionHandler:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__AISSetupController)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end