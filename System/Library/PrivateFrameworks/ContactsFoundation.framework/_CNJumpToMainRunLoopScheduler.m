@interface _CNJumpToMainRunLoopScheduler
+ (BOOL)isAvailable;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNJumpToMainRunLoopScheduler

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CNMainRunLoopSchedulerCancelationToken);
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E4F1D410];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73___CNJumpToMainRunLoopScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v21[3] = &unk_1E569FA00;
  v9 = v6;
  v22 = v9;
  id v10 = v5;
  id v23 = v10;
  v11 = v21;
  v12 = v11;
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
      CFRunLoopPerformBlock(Main, v8, v14);

      v17 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v17);
      v18 = v23;
      v19 = v9;

      return v19;
  }
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v5 = a3;
  Main = CFRunLoopGetMain();
  v7 = (const void *)*MEMORY[0x1E4F1D410];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63___CNJumpToMainRunLoopScheduler_performBlock_qualityOfService___block_invoke;
  v16[3] = &unk_1E56A00D8;
  id v8 = v5;
  id v17 = v8;
  v9 = v16;
  id v10 = v9;
  dispatch_qos_class_t v11 = QOS_CLASS_USER_INTERACTIVE;
  switch(a4)
  {
    case 0uLL:
      v12 = _Block_copy(v9);
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
      v12 = self;

LABEL_9:
      CFRunLoopPerformBlock(Main, v7, v12);

      dispatch_block_t v15 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v15);

      return;
  }
}

- (void)performBlock:(id)a3
{
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v6 = a4;
  CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() + a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  block[3] = &unk_1E56A2130;
  id v8 = v6;
  id v19 = v8;
  CFRunLoopTimerRef v9 = CFRunLoopTimerCreateWithHandler(0, v7, 0.0, 0, 0, block);
  if (v9) {
    id v10 = (__CFRunLoopTimer *)CFAutorelease(v9);
  }
  else {
    id v10 = 0;
  }
  Main = CFRunLoopGetMain();
  CFRunLoopAddTimer(Main, v10, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  v12 = v10;
  dispatch_block_t v13 = objc_alloc_init(CNMainRunLoopSchedulerCancelationToken);
  objc_initWeak(&location, v12);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2;
  v15[3] = &unk_1E56A05E8;
  objc_copyWeak(&v16, &location);
  [(CNCancelationToken *)v13 addCancelationBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v13;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return [(_CNJumpToMainRunLoopScheduler *)self afterDelay:a4 performBlock:0 qualityOfService:a3];
}

+ (BOOL)isAvailable
{
  return CFRunLoopGetMain() != 0;
}

- (id)performCancelableBlock:(id)a3
{
  return [(_CNJumpToMainRunLoopScheduler *)self performCancelableBlock:a3 qualityOfService:0];
}

- (double)timestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end