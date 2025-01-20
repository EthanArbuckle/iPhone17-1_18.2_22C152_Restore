@interface MTLCommandQueueDescriptorInternal
- (BOOL)commitSynchronously;
- (BOOL)commitsWithQoS;
- (BOOL)disableAsyncCompletionDispatch;
- (BOOL)disableCrossQueueHazardTracking;
- (BOOL)disableIOFencing;
- (BOOL)enableLowLatencySignalSharedEvent;
- (BOOL)enableLowLatencyWaitSharedEvent;
- (BOOL)isOpenGLQueue;
- (BOOL)lockParameterBufferSizeToMax;
- (MTLCommandQueueDescriptorInternal)init;
- (OS_dispatch_queue)commitQueue;
- (OS_dispatch_queue)completionQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)logState;
- (unint64_t)devicePartition;
- (unint64_t)maxCommandBufferCount;
- (unint64_t)qosLevel;
- (void)dealloc;
- (void)setCommitQueue:(id)a3;
- (void)setCommitSynchronously:(BOOL)a3;
- (void)setCommitsWithQoS:(BOOL)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDevicePartition:(unint64_t)a3;
- (void)setDisableAsyncCompletionDispatch:(BOOL)a3;
- (void)setDisableCrossQueueHazardTracking:(BOOL)a3;
- (void)setDisableIOFencing:(BOOL)a3;
- (void)setEnableLowLatencySignalSharedEvent:(BOOL)a3;
- (void)setEnableLowLatencyWaitSharedEvent:(BOOL)a3;
- (void)setIsOpenGLQueue:(BOOL)a3;
- (void)setLockParameterBufferSizeToMax:(BOOL)a3;
- (void)setLogState:(id)a3;
- (void)setMaxCommandBufferCount:(unint64_t)a3;
- (void)setQosLevel:(unint64_t)a3;
@end

@implementation MTLCommandQueueDescriptorInternal

- (unint64_t)qosLevel
{
  return self->_qosLevel;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (BOOL)commitSynchronously
{
  return self->_commitSynchronously;
}

- (OS_dispatch_queue)commitQueue
{
  return self->_commitQueue;
}

- (BOOL)disableCrossQueueHazardTracking
{
  return self->_disableCrossQueueHazardTracking;
}

- (id)logState
{
  return self->_logState;
}

- (BOOL)isOpenGLQueue
{
  return self->_openGLQueue;
}

- (BOOL)commitsWithQoS
{
  return self->_commitsWithQoS;
}

- (BOOL)lockParameterBufferSizeToMax
{
  return self->_lockParameterBufferSizeToMax;
}

- (BOOL)enableLowLatencyWaitSharedEvent
{
  return self->_enableLowLatencyWaitSharedEvent;
}

- (BOOL)enableLowLatencySignalSharedEvent
{
  return self->_enableLowLatencySignalSharedEvent;
}

- (BOOL)disableIOFencing
{
  return self->_disableIOFencing;
}

- (BOOL)disableAsyncCompletionDispatch
{
  return self->_disableAsyncCompletionDispatch;
}

- (unint64_t)devicePartition
{
  return self->_devicePartition;
}

- (MTLCommandQueueDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCommandQueueDescriptorInternal;
  result = [(MTLCommandQueueDescriptorInternal *)&v3 init];
  if (result)
  {
    result->_maxCommandBufferCount = 64;
    result->_qosLevel = 2;
    result->_commitQueue = 0;
    result->_commitSynchronously = 0;
    result->_completionQueue = 0;
    result->_disableCrossQueueHazardTracking = 0;
    result->_disableAsyncCompletionDispatch = 0;
    result->_openGLQueue = 0;
    result->_devicePartition = 0;
    result->_lockParameterBufferSizeToMax = 0;
    result->_logState = 0;
  }
  return result;
}

- (void)setMaxCommandBufferCount:(unint64_t)a3
{
  self->_maxCommandBufferCount = a3;
}

- (void)dealloc
{
  commitQueue = self->_commitQueue;
  if (commitQueue) {
    dispatch_release(commitQueue);
  }
  completionQueue = self->_completionQueue;
  if (completionQueue) {
    dispatch_release(completionQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)MTLCommandQueueDescriptorInternal;
  [(MTLCommandQueueDescriptorInternal *)&v5 dealloc];
}

- (void)setCommitSynchronously:(BOOL)a3
{
  self->_commitSynchronously = a3;
}

- (void)setCompletionQueue:(id)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  if (self->_completionQueue) {
    dispatch_release((dispatch_object_t)a3);
  }
  self->_completionQueue = (OS_dispatch_queue *)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = v4;
  if (v4)
  {
    [v4 setMaxCommandBufferCount:self->_maxCommandBufferCount];
    [v5 setQosLevel:self->_qosLevel];
    [v5 setCommitQueue:self->_commitQueue];
    [v5 setCommitSynchronously:self->_commitSynchronously];
    [v5 setCompletionQueue:self->_completionQueue];
    [v5 setDisableCrossQueueHazardTracking:self->_disableCrossQueueHazardTracking];
    [v5 setDisableAsyncCompletionDispatch:self->_disableAsyncCompletionDispatch];
    [v5 setIsOpenGLQueue:self->_openGLQueue];
    [v5 setDevicePartition:self->_devicePartition];
    [v5 setDisableIOFencing:self->_disableIOFencing];
    [v5 setEnableLowLatencySignalSharedEvent:self->_enableLowLatencySignalSharedEvent];
    [v5 setEnableLowLatencyWaitSharedEvent:self->_enableLowLatencyWaitSharedEvent];
    [v5 setLockParameterBufferSizeToMax:self->_lockParameterBufferSizeToMax];
    [v5 setLogState:self->_logState];
    [v5 setCommitsWithQoS:self->_commitsWithQoS];
  }
  return v5;
}

- (void)setCommitQueue:(id)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  if (self->_commitQueue) {
    dispatch_release((dispatch_object_t)a3);
  }
  self->_commitQueue = (OS_dispatch_queue *)a3;
}

- (id)formattedDescription:(unint64_t)a3
{
  v11[22] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v11[0] = v4;
  v11[1] = @"maxCommandBufferCount =";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_maxCommandBufferCount];
  uint64_t v6 = 0;
  v11[2] = v5;
  v11[3] = v4;
  v11[4] = @"qosLevel =";
  unint64_t qosLevel = self->_qosLevel;
  if (qosLevel <= 4) {
    uint64_t v6 = *((void *)&off_1E52223A0 + qosLevel);
  }
  v11[5] = v6;
  v11[6] = v4;
  v11[7] = objc_msgSend(NSString, "stringWithFormat:", @"commitQueue =%p", self->_commitQueue);
  v11[8] = v4;
  v11[9] = @"commitSynchronously =";
  v11[10] = [NSNumber numberWithBool:self->_commitSynchronously];
  v11[11] = v4;
  v11[12] = objc_msgSend(NSString, "stringWithFormat:", @"completionQueue =%p", self->_completionQueue);
  v11[13] = v4;
  v11[14] = @"disableCrossQueueHazardTracking =";
  v11[15] = [NSNumber numberWithBool:self->_disableCrossQueueHazardTracking];
  v11[16] = v4;
  v11[17] = @"disableAsyncCompletionDispatch =";
  v11[18] = [NSNumber numberWithBool:self->_disableAsyncCompletionDispatch];
  v11[19] = v4;
  v11[20] = @"lockParameterBufferSizeToMax =";
  v11[21] = [NSNumber numberWithBool:self->_lockParameterBufferSizeToMax];
  v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:22];
  v10.receiver = self;
  v10.super_class = (Class)MTLCommandQueueDescriptorInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLCommandQueueDescriptorInternal description](&v10, sel_description), objc_msgSend(v8, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLCommandQueueDescriptorInternal *)self formattedDescription:0];
}

- (void)setQosLevel:(unint64_t)a3
{
  self->_unint64_t qosLevel = a3;
}

- (void)setDisableCrossQueueHazardTracking:(BOOL)a3
{
  self->_disableCrossQueueHazardTracking = a3;
}

- (void)setDisableAsyncCompletionDispatch:(BOOL)a3
{
  self->_disableAsyncCompletionDispatch = a3;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_openGLQueue = a3;
}

- (void)setDevicePartition:(unint64_t)a3
{
  self->_devicePartition = a3;
}

- (void)setDisableIOFencing:(BOOL)a3
{
  self->_disableIOFencing = a3;
}

- (void)setEnableLowLatencySignalSharedEvent:(BOOL)a3
{
  self->_enableLowLatencySignalSharedEvent = a3;
}

- (void)setEnableLowLatencyWaitSharedEvent:(BOOL)a3
{
  self->_enableLowLatencyWaitSharedEvent = a3;
}

- (void)setLockParameterBufferSizeToMax:(BOOL)a3
{
  self->_lockParameterBufferSizeToMax = a3;
}

- (void)setLogState:(id)a3
{
}

- (void)setCommitsWithQoS:(BOOL)a3
{
  self->_commitsWithQoS = a3;
}

@end