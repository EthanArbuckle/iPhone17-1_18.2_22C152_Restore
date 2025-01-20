@interface _CNJumpToMainQueueScheduler
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNJumpToMainQueueScheduler

- (void)performBlock:(id)a3
{
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  id v6 = MEMORY[0x1E4F14428];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___CNJumpToMainQueueScheduler_performBlock_qualityOfService___block_invoke;
  v15[3] = &unk_1E56A00D8;
  id v7 = v5;
  id v16 = v7;
  v8 = v15;
  v9 = v8;
  dispatch_qos_class_t v10 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v11 = _Block_copy(v8);
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
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v10 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v10, 0, v8);
LABEL_8:
      v13 = v12;
      v11 = self;

LABEL_9:
      v14 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v11);

      return;
  }
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNJumpToMainQueueScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(CNMainQueueSchedulerCancelationToken);
  id v7 = MEMORY[0x1E4F14428];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71___CNJumpToMainQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v20[3] = &unk_1E569FA00;
  v8 = v6;
  v21 = v8;
  id v9 = v5;
  id v22 = v9;
  dispatch_qos_class_t v10 = v20;
  v11 = v10;
  dispatch_qos_class_t v12 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v13 = _Block_copy(v10);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v12 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v12 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v14 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v12, 0, v10);
LABEL_8:
      v15 = v14;
      v13 = self;

LABEL_9:
      id v16 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v13);

      v17 = v22;
      v18 = v8;

      return v18;
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNJumpToMainQueueScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v7 = a4;
  v8 = objc_alloc_init(CNMainQueueSchedulerCancelationToken);
  id v9 = MEMORY[0x1E4F14428];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72___CNJumpToMainQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v22[3] = &unk_1E569FA00;
  dispatch_qos_class_t v10 = v8;
  v23 = v10;
  id v11 = v7;
  id v24 = v11;
  dispatch_qos_class_t v12 = v22;
  v13 = v12;
  dispatch_qos_class_t v14 = QOS_CLASS_USER_INTERACTIVE;
  switch(a5)
  {
    case 0uLL:
      v15 = _Block_copy(v12);
      goto LABEL_9;
    case 2uLL:
      dispatch_qos_class_t v14 = QOS_CLASS_BACKGROUND;
      goto LABEL_7;
    case 3uLL:
      dispatch_qos_class_t v14 = QOS_CLASS_UTILITY;
      goto LABEL_7;
    case 4uLL:
      dispatch_qos_class_t v14 = QOS_CLASS_USER_INITIATED;
      goto LABEL_7;
    case 5uLL:
      goto LABEL_7;
    case 6uLL:
      dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v12);
      goto LABEL_8;
    default:
      dispatch_qos_class_t v14 = QOS_CLASS_DEFAULT;
LABEL_7:
      dispatch_block_t v16 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v14, 0, v12);
LABEL_8:
      v17 = v16;
      v15 = self;

LABEL_9:
      v18 = (void *)MEMORY[0x1E4F14428];
      dispatch_after((unint64_t)a3, MEMORY[0x1E4F14428], v15);

      v19 = v24;
      v20 = v10;

      return v20;
  }
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end