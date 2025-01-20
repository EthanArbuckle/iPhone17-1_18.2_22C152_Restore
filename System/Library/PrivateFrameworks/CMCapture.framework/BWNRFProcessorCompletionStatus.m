@interface BWNRFProcessorCompletionStatus
- (BOOL)waitForCompletionWithDescriptionOut:(uint64_t)a1;
- (id)description;
- (void)dealloc;
- (void)initWithCompletionStatus:(void *)a1;
@end

@implementation BWNRFProcessorCompletionStatus

- (void)initWithCompletionStatus:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWNRFProcessorCompletionStatus;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNRFProcessorCompletionStatus;
  [(BWNRFProcessorCompletionStatus *)&v3 dealloc];
}

- (BOOL)waitForCompletionWithDescriptionOut:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  [*(id *)(a1 + 8) waitForCompletion];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "status");
  objc_super v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = BWMTLCommandBufferStatusToShortString(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "status"));
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "completedCommandBuffersCount");
  BOOL v9 = v4 == 4;
  BOOL v10 = v4 == 4;
  if (v9) {
    uint64_t v11 = [v5 stringWithFormat:@"<%@ %p>: Status: %@. Completed command buffers:%d", v6, a1, v7, v8, v13];
  }
  else {
    uint64_t v11 = [v5 stringWithFormat:@"<%@ %p>: Status: %@. Completed command buffers:%d. Failed command buffers: %@", v6, a1, v7, v8, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "metalExecutionStatus"), "failedCommandBuffers"), "componentsJoinedByString:", @","];
  }
  if (a2) {
    *a2 = v11;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: Current status: %d", objc_opt_class(), self, objc_msgSend((id)-[NRFCompletionStatus metalExecutionStatus](self->_completionStatus, "metalExecutionStatus"), "status")];
}

@end