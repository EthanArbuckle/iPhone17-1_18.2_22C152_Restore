@interface AVOutputContextDestinationChange
- (AVOutputContextDestinationChange)init;
- (NSString)cancellationReason;
- (id)description;
- (int64_t)status;
- (void)_setStatus:(int64_t)a3 cancellationReason:(id)a4;
- (void)changeToTerminalStatusBasedOnRouteChangeEndedReason:(__CFString *)a3;
- (void)changeToTerminalStatusBasedOnRouteConfigUpdatedReason:(__CFString *)a3;
- (void)dealloc;
- (void)markAsCancelledWithReason:(id)a3;
- (void)markAsFailed;
- (void)markAsFinished;
- (void)markAsInProgress;
@end

@implementation AVOutputContextDestinationChange

- (AVOutputContextDestinationChange)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVOutputContextDestinationChange;
  v2 = [(AVOutputContextDestinationChange *)&v6 init];
  if (v2 && (v3 = objc_alloc_init(AVOutputContextDestinationChangeInternal), (v2->_ivars = v3) != 0))
  {
    v2->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.destinationchange");
    v2->_ivars->status = 0;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  ivars = self->_ivars;
  if (ivars)
  {
    ivarAccessQueue = ivars->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      ivars = self->_ivars;
    }

    ivars = self->_ivars;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputContextDestinationChange;
  [(AVOutputContextDestinationChange *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, status=%d, cancellationReason=%@>", NSStringFromClass(v4), self, -[AVOutputContextDestinationChange status](self, "status"), -[AVOutputContextDestinationChange cancellationReason](self, "cancellationReason")];
}

- (int64_t)status
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVOutputContextDestinationChange_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVOutputContextDestinationChange_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 16);
  return result;
}

- (NSString)cancellationReason
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVOutputContextDestinationChange_cancellationReason__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVOutputContextDestinationChange_cancellationReason__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)markAsInProgress
{
}

- (void)markAsFinished
{
}

- (void)markAsFailed
{
}

- (void)markAsCancelledWithReason:(id)a3
{
}

- (void)_setStatus:(int64_t)a3 cancellationReason:(id)a4
{
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVOutputContextDestinationChange__setStatus_cancellationReason___block_invoke;
  block[3] = &unk_1E57B2270;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __66__AVOutputContextDestinationChange__setStatus_cancellationReason___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = *(void *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)changeToTerminalStatusBasedOnRouteChangeEndedReason:(__CFString *)a3
{
  if (FigCFEqual())
  {
    [(AVOutputContextDestinationChange *)self markAsFinished];
    return;
  }
  if (FigCFEqual()) {
    goto LABEL_6;
  }
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      objc_super v5 = @"AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped";
      v4 = self;
      goto LABEL_13;
    }
    if (!FigCFEqual())
    {
LABEL_6:
      [(AVOutputContextDestinationChange *)self markAsFailed];
      return;
    }
  }
  v4 = self;
  objc_super v5 = 0;
LABEL_13:
  [(AVOutputContextDestinationChange *)v4 markAsCancelledWithReason:v5];
}

- (void)changeToTerminalStatusBasedOnRouteConfigUpdatedReason:(__CFString *)a3
{
  if (FigCFEqual())
  {
LABEL_2:
    [(AVOutputContextDestinationChange *)self markAsFinished];
    return;
  }
  if (FigCFEqual()) {
    goto LABEL_6;
  }
  if (FigCFEqual())
  {
    v4 = self;
    objc_super v5 = 0;
  }
  else
  {
    if (!FigCFEqual())
    {
      if (FigCFEqual() || FigCFEqual() || FigCFEqual()) {
        goto LABEL_2;
      }
LABEL_6:
      [(AVOutputContextDestinationChange *)self markAsFailed];
      return;
    }
    objc_super v5 = @"AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped";
    v4 = self;
  }
  [(AVOutputContextDestinationChange *)v4 markAsCancelledWithReason:v5];
}

@end