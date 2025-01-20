@interface MADProcessingTask
- (MADProcessingTask)init;
- (NSUUID)uuid;
- (id)cancelBlock;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADProcessingTask

- (MADProcessingTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADProcessingTask;
  v2 = [(MADProcessingTask *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }
  return v2;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end