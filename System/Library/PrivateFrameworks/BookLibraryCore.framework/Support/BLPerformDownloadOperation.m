@interface BLPerformDownloadOperation
- (BLPerformDownloadOperation)initWithBLDownloadPipeline:(id)a3 response:(id)a4 completion:(id)a5;
- (_BLPerformDownloadOperation)operation;
- (void)run;
- (void)setOperation:(id)a3;
@end

@implementation BLPerformDownloadOperation

- (BLPerformDownloadOperation)initWithBLDownloadPipeline:(id)a3 response:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLPerformDownloadOperation;
  v11 = [(BLOperation *)&v15 init];
  if (v11)
  {
    v12 = [[_BLPerformDownloadOperation alloc] initWithBLDownloadPipeline:v8 response:v9 completion:v10];
    operation = v11->_operation;
    v11->_operation = v12;
  }
  return v11;
}

- (void)run
{
  id v2 = [(BLPerformDownloadOperation *)self operation];
  [v2 run];
}

- (_BLPerformDownloadOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end