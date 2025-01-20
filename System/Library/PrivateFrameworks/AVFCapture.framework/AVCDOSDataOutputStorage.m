@interface AVCDOSDataOutputStorage
- (AVCDOSDataOutputStorage)initWithDataOutput:(id)a3;
- (AVCaptureDataOutputDelegateOverride)dataOutput;
- (BOOL)hasAllExpectedSynchronizedDataForLeaderTimestamp:(id *)a3;
- (BOOL)isLive;
- (NSMutableArray)synchronizedDataQueue;
- (NSMutableArray)timestampAdjustmentsDataQueue;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (void)dealloc;
- (void)setTimestampAdjustmentsDataQueue:(id)a3;
- (void)updateDelegateOverrideCallbackQueueQOSClass:(unsigned int)a3;
@end

@implementation AVCDOSDataOutputStorage

- (AVCDOSDataOutputStorage)initWithDataOutput:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCDOSDataOutputStorage;
  v4 = [(AVCDOSDataOutputStorage *)&v6 init];
  if (v4)
  {
    v4->_dataOutput = (AVCaptureDataOutputDelegateOverride *)a3;
    v4->_synchronizedDataQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0) {
      v4->_delegateOverrideCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"com.apple.avfoundation.dataoutputsynchronizer.dataoutputqueue_%@_%@", v4->_dataOutput, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")), "UTF8String"], 0);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCDOSDataOutputStorage;
  [(AVCDOSDataOutputStorage *)&v3 dealloc];
}

- (void)updateDelegateOverrideCallbackQueueQOSClass:(unsigned int)a3
{
  dispatch_sync((dispatch_queue_t)self->_delegateOverrideCallbackQueue, &__block_literal_global_16);
  dispatch_release((dispatch_object_t)self->_delegateOverrideCallbackQueue);
  v5 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"com.apple.avfoundation.dataoutputsynchronizer.dataoutputqueue_%@_%@", self->_dataOutput, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")), "UTF8String"];
  objc_super v6 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
  self->_delegateOverrideCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
}

- (BOOL)isLive
{
  v2 = objc_msgSend((id)-[AVCaptureDataOutputDelegateOverride connections](self->_dataOutput, "connections"), "firstObject");

  return [v2 isLive];
}

- (BOOL)hasAllExpectedSynchronizedDataForLeaderTimestamp:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)[(AVCDOSDataOutputStorage *)self synchronizedDataQueue] count])return 0; {
  if (![(AVCDOSDataOutputStorage *)self timestampAdjustmentsDataQueue])
  }
  {
    v7 = (void *)[(NSMutableArray *)[(AVCDOSDataOutputStorage *)self synchronizedDataQueue] objectAtIndexedSubscript:0];
    if (v7)
    {
      [v7 timestamp];
      goto LABEL_10;
    }
LABEL_9:
    memset(&time1, 0, sizeof(time1));
    goto LABEL_10;
  }
  v5 = (void *)[(NSMutableArray *)[(AVCDOSDataOutputStorage *)self synchronizedDataQueue] objectAtIndexedSubscript:0];
  if (!v5) {
    return 0;
  }
  [v5 adjustedTimestamp];
  if ((v24 & 1) == 0) {
    return 0;
  }
  objc_super v6 = (void *)[(NSMutableArray *)[(AVCDOSDataOutputStorage *)self synchronizedDataQueue] objectAtIndexedSubscript:0];
  if (!v6) {
    goto LABEL_9;
  }
  [v6 adjustedTimestamp];
LABEL_10:
  CMTime v25 = time1;
  CMTime time1 = (CMTime)*a3;
  CMTime time2 = v25;
  if (CMTimeCompare(&time1, &time2) > 0) {
    return 0;
  }
  [(AVCDOSDataOutputStorage *)self dataOutput];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(AVCDOSDataOutputStorage *)self dataOutput];
    v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[AVCaptureDataOutputDelegateOverride metadataObjectTypes](v8, "metadataObjectTypes"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = [(AVCDOSDataOutputStorage *)self synchronizedDataQueue];
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (v15)
          {
            [*(id *)(*((void *)&v18 + 1) + 8 * i) adjustedTimestamp];
            if (v17) {
              objc_msgSend(v9, "minusSet:", objc_msgSend(v15, "handledMetadataObjectTypes"));
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }
    if ([v9 count]) {
      return 0;
    }
  }
  return 1;
}

- (AVCaptureDataOutputDelegateOverride)dataOutput
{
  return self->_dataOutput;
}

- (NSMutableArray)synchronizedDataQueue
{
  return self->_synchronizedDataQueue;
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return self->_delegateOverrideCallbackQueue;
}

- (NSMutableArray)timestampAdjustmentsDataQueue
{
  return self->_timestampAdjustmentsDataQueue;
}

- (void)setTimestampAdjustmentsDataQueue:(id)a3
{
}

@end