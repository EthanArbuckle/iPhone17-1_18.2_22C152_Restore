@interface _CNImmediateScheduler
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNImmediateScheduler

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x192FD0880]();
  id v7 = v5;
  id v12 = v7;
  dispatch_qos_class_t v8 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v9 = (void (**)(void))_Block_copy(v7);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v8 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v8 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v8 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v8 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v10 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v8, 0, v7);
LABEL_8:
      v11 = v10;
      self;
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();

LABEL_9:
      v9[2](v9);

      return;
  }
}

- (void)performBlock:(id)a3
{
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CNImmediateSchedulerCancelationToken);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65___CNImmediateScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v18[3] = &unk_1E569F468;
  id v7 = v5;
  id v20 = v7;
  dispatch_qos_class_t v8 = v6;
  v19 = v8;
  v9 = v18;
  dispatch_block_t v10 = v9;
  dispatch_qos_class_t v11 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      id v12 = (void (**)(void))_Block_copy(v9);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v11 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v11 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v11 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v11 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v13 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v11, 0, v9);
LABEL_8:
      v14 = v13;
      self;
      id v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();

LABEL_9:
      v12[2](v12);

      v15 = v19;
      v16 = v8;

      return v16;
  }
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNImmediateScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNImmediateScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  dispatch_qos_class_t v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a4;
  [v8 sleepForTimeInterval:a3];
  [(_CNImmediateScheduler *)self performBlock:v9 qualityOfService:a5];

  dispatch_block_t v10 = objc_alloc_init(CNImmediateSchedulerCancelationToken);

  return v10;
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end