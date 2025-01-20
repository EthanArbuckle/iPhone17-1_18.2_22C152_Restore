@interface _CNSynchronousQueueScheduler
- (_CNSynchronousQueueScheduler)initWithQueue:(id)a3;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNSynchronousQueueScheduler

- (void)performBlock:(id)a3
{
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x192FD0880]();
  queue = self->_queue;
  id v9 = v6;
  id v14 = v9;
  dispatch_qos_class_t v10 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v11 = _Block_copy(v9);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v10 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v10 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v10 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v10 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v10, 0, v9);
LABEL_8:
      v13 = v12;
      v11 = self;

LABEL_9:
      dispatch_sync(queue, v11);

      return;
  }
}

- (_CNSynchronousQueueScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNSynchronousQueueScheduler;
  id v6 = [(_CNSynchronousQueueScheduler *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNSynchronousQueueScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(SynchronousQueueSchedulerCancelationToken);
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72___CNSynchronousQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E569F468;
  id v9 = v6;
  id v22 = v9;
  objc_super v10 = v7;
  v21 = v10;
  v11 = v20;
  dispatch_block_t v12 = v11;
  dispatch_qos_class_t v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      id v14 = _Block_copy(v11);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v13 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v15 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v13, 0, v11);
LABEL_8:
      v16 = v15;
      id v14 = self;

LABEL_9:
      dispatch_sync(queue, v14);

      v17 = v21;
      v18 = v10;

      return v18;
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNSynchronousQueueScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73___CNSynchronousQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v19[3] = &unk_1E569F490;
  double v21 = a3;
  id v10 = v8;
  id v20 = v10;
  v11 = v19;
  dispatch_block_t v12 = v11;
  dispatch_qos_class_t v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
  {
    case 0uLL:
      id v14 = _Block_copy(v11);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v13 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v11);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v13 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v15 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v13, 0, v11);
LABEL_8:
      v16 = v15;
      id v14 = self;

LABEL_9:
      dispatch_sync(queue, v14);

      v17 = objc_alloc_init(SynchronousQueueSchedulerCancelationToken);
      return v17;
  }
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end