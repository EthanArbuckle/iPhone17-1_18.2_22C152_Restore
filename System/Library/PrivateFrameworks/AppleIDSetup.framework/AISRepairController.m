@interface AISRepairController
- (AISRepairController)init;
- (AISRepairController)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (__AISRepairController)implementation;
- (void)generateSymptomReportWithContext:(id)a3 completionHandler:(id)a4;
- (void)repairWithContext:(id)a3 completionHandler:(id)a4;
- (void)setImplementation:(id)a3;
@end

@implementation AISRepairController

- (AISRepairController)init
{
  return [(AISRepairController *)self initWithQueue:0];
}

- (AISRepairController)initWithQueue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AISRepairController;
  v5 = [(AISRepairController *)&v13 init];
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

    v10 = [[__AISRepairController alloc] initWithQueue:v5->_queue];
    implementation = v5->_implementation;
    v5->_implementation = v10;
  }
  return v5;
}

- (void)repairWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AISRepairController *)self implementation];
  [v8 repairWithContext:v7 completionHandler:v6];
}

- (void)generateSymptomReportWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AISRepairController *)self implementation];
  [v8 generateSymptomReportWithContext:v7 completionHandler:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__AISRepairController)implementation
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