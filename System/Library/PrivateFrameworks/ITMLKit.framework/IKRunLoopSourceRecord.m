@interface IKRunLoopSourceRecord
- (IKRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4;
- (id)completionBlock;
- (id)evaluateBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setEvaluateBlock:(id)a3;
@end

@implementation IKRunLoopSourceRecord

- (IKRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKRunLoopSourceRecord;
  v8 = [(IKRunLoopSourceRecord *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id evaluateBlock = v8->_evaluateBlock;
    v8->_id evaluateBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v11;
  }
  return v8;
}

- (id)evaluateBlock
{
  return self->_evaluateBlock;
}

- (void)setEvaluateBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_evaluateBlock, 0);
}

@end