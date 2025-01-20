@interface _CNQueueScheduler
- (OS_dispatch_queue)queue;
- (_CNQueueScheduler)initWithQueue:(id)a3;
- (double)timestamp;
- (id)_queueForQualityOfService:(unint64_t)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNQueueScheduler

- (_CNQueueScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNQueueScheduler;
  v6 = [(_CNQueueScheduler *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)performBlock:(id)a3
{
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  v9 = [(_CNQueueScheduler *)self _queueForQualityOfService:a5];
  objc_super v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);

  v11 = [[CNDispatchSource alloc] initWithSource:v10];
  if (a3 <= 1.84467441e10) {
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  else {
    dispatch_time_t v12 = -1;
  }
  dispatch_source_set_timer(v10, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v26[3] = &unk_1E569F468;
  id v13 = v8;
  id v28 = v13;
  v14 = v11;
  v27 = v14;
  v15 = v26;
  v16 = v15;
  dispatch_qos_class_t v17 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
  {
    case 0uLL:
      v18 = _Block_copy(v15);
      goto LABEL_12;
    case 2uLL:
      dispatch_qos_class_t v17 = QOS_CLASS_BACKGROUND;
      goto LABEL_10;
    case 3uLL:
      dispatch_qos_class_t v17 = QOS_CLASS_UTILITY;
      goto LABEL_10;
    case 4uLL:
      dispatch_qos_class_t v17 = QOS_CLASS_USER_INITIATED;
      goto LABEL_10;
    case 5uLL:
      goto LABEL_10;
    case 6uLL:
      dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v15);
      goto LABEL_11;
    default:
      dispatch_qos_class_t v17 = QOS_CLASS_DEFAULT;
LABEL_10:
      dispatch_block_t v19 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v17, 0, v15);
LABEL_11:
      v20 = v19;
      v18 = self;

LABEL_12:
      dispatch_source_set_event_handler(v10, v18);

      v21 = objc_alloc_init(CNQueueSchedulerCancelationToken);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
      v24[3] = &unk_1E569F9D8;
      v25 = v14;
      v22 = v14;
      [(CNCancelationToken *)v21 addCancelationBlock:v24];
      dispatch_resume(v10);

      return v21;
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(_CNQueueScheduler *)self _queueForQualityOfService:a4];
  id v8 = v6;
  id v13 = v8;
  dispatch_qos_class_t v9 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      objc_super v10 = _Block_copy(v8);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v9 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v9 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v9 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v9 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v11 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v9, 0, v8);
LABEL_8:
      dispatch_time_t v12 = v11;
      objc_super v10 = self;

LABEL_9:
      dispatch_async(v7, v10);

      return;
  }
}

- (id)_queueForQualityOfService:(unint64_t)a3
{
  id v5 = [(_CNQueueScheduler *)self queue];

  if (v5)
  {
    id v6 = [(_CNQueueScheduler *)self queue];
  }
  else
  {
    if (a3 - 1 > 4) {
      intptr_t v7 = 0;
    }
    else {
      intptr_t v7 = qword_1909B62A0[a3 - 1];
    }
    id v6 = dispatch_get_global_queue(v7, 0);
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNQueueScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNQueueScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  intptr_t v7 = objc_alloc_init(CNQueueSchedulerCancelationToken);
  id v8 = [(_CNQueueScheduler *)self _queueForQualityOfService:a4];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61___CNQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E569FA00;
  dispatch_qos_class_t v9 = v7;
  v21 = v9;
  id v10 = v6;
  id v22 = v10;
  dispatch_block_t v11 = v20;
  dispatch_time_t v12 = v11;
  dispatch_qos_class_t v13 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v14 = _Block_copy(v11);
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
      v14 = self;

LABEL_9:
      dispatch_async(v8, v14);

      dispatch_qos_class_t v17 = v22;
      v18 = v9;

      return v18;
  }
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