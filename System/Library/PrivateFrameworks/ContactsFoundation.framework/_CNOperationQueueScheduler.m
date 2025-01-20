@interface _CNOperationQueueScheduler
+ (id)operationWithQualityOfService:(unint64_t)a3 block:(id)a4;
- (NSString)description;
- (_CNOperationQueueScheduler)init;
- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3;
- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3 qualityOfService:(unint64_t)a4;
- (_CNOperationQueueScheduler)initWithQualityOfService:(unint64_t)a3;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)blockWithCurrentQualityOfServiceForBlock:(id)a3 ifAllowedForRequestedQualityOfService:(unint64_t)a4;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)_enqueueBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNOperationQueueScheduler

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(CNOperationQueueSchedulerCancelationToken);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  aBlock[3] = &unk_1E569F468;
  id v8 = v6;
  id v23 = v8;
  v9 = v7;
  v22 = v9;
  v10 = _Block_copy(aBlock);
  v11 = [(_CNOperationQueueScheduler *)self blockWithCurrentQualityOfServiceForBlock:v10 ifAllowedForRequestedQualityOfService:a4];

  v12 = [(id)objc_opt_class() operationWithQualityOfService:a4 block:v11];
  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke_2;
  v18 = &unk_1E56A05E8;
  objc_copyWeak(&v19, &location);
  [(CNCancelationToken *)v9 addCancelationBlock:&v15];
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v12, v15, v16, v17, v18);
  v13 = v9;
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

- (id)blockWithCurrentQualityOfServiceForBlock:(id)a3 ifAllowedForRequestedQualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = _Block_copy(v6);
  if (!a4 && !self->_isQualityOfServiceSpecified)
  {
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v6);

    v7 = v8;
  }
  v9 = _Block_copy(v7);

  return v9;
}

+ (id)operationWithQualityOfService:(unint64_t)a3 block:(id)a4
{
  v5 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:a4];
  id v6 = v5;
  if (a3 - 2 >= 4) {
    unint64_t v7 = -1;
  }
  else {
    unint64_t v7 = 8 * (a3 - 2) + 9;
  }
  if ([v5 qualityOfService] != v7) {
    [v6 setQualityOfService:v7];
  }

  return v6;
}

- (void)performBlock:(id)a3
{
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  -[_CNOperationQueueScheduler blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:](self, "blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(_CNOperationQueueScheduler *)self _enqueueBlock:v6 qualityOfService:a4];
}

- (void)_enqueueBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() operationWithQualityOfService:a4 block:v6];

  [(NSOperationQueue *)self->_queue addOperation:v7];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = objc_alloc_init(CNOperationQueueSchedulerCancelationToken);
  v10 = [(_CNOperationQueueScheduler *)self blockWithCurrentQualityOfServiceForBlock:v8 ifAllowedForRequestedQualityOfService:a5];

  v11 = +[CNScheduler globalAsyncScheduler];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __71___CNOperationQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v20 = &unk_1E56A0610;
  v12 = v9;
  v21 = v12;
  v22 = self;
  id v23 = v10;
  unint64_t v24 = a5;
  id v13 = v10;
  v14 = [v11 afterDelay:&v17 performBlock:a3];

  -[CNCancelationToken addCancelable:](v12, "addCancelable:", v14, v17, v18, v19, v20);
  uint64_t v15 = v12;

  return v15;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNOperationQueueScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3 qualityOfService:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_CNOperationQueueScheduler;
  id v6 = [(_CNOperationQueueScheduler *)&v12 init];
  if (v6)
  {
    id v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v6->_queue;
    v6->_queue = v7;

    [(NSOperationQueue *)v6->_queue setMaxConcurrentOperationCount:a3];
    uint64_t v9 = 33;
    switch(a4)
    {
      case 0uLL:
        goto LABEL_8;
      case 2uLL:
        uint64_t v9 = 9;
        goto LABEL_7;
      case 3uLL:
        uint64_t v9 = 17;
        goto LABEL_7;
      case 4uLL:
        uint64_t v9 = 25;
        goto LABEL_7;
      case 5uLL:
        goto LABEL_7;
      default:
        uint64_t v9 = -1;
LABEL_7:
        [(NSOperationQueue *)v6->_queue setQualityOfService:v9];
        v6->_isQualityOfServiceSpecified = 1;
LABEL_8:
        v10 = v6;
        break;
    }
  }

  return v6;
}

- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3
{
  return [(_CNOperationQueueScheduler *)self initWithMaxConcurrentOperationCount:a3 qualityOfService:0];
}

- (_CNOperationQueueScheduler)init
{
  return [(_CNOperationQueueScheduler *)self initWithMaxConcurrentOperationCount:-1 qualityOfService:0];
}

- (_CNOperationQueueScheduler)initWithQualityOfService:(unint64_t)a3
{
  return [(_CNOperationQueueScheduler *)self initWithMaxConcurrentOperationCount:-1 qualityOfService:a3];
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"width", -[NSOperationQueue maxConcurrentOperationCount](self->_queue, "maxConcurrentOperationCount"));
  id v5 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"blocks", -[NSOperationQueue operationCount](self->_queue, "operationCount"));
  id v6 = [v3 build];

  return (NSString *)v6;
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNOperationQueueScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (void).cxx_destruct
{
}

@end