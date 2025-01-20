@interface _NSProgressProxy
- (BOOL)isOld;
- (id)_initWithForwarder:(id)a3 values:(id)a4 isOld:(BOOL)a5;
- (id)byteCompletedCount;
- (id)byteTotalCount;
- (id)estimatedTimeRemaining;
- (id)fileCompletedCount;
- (id)fileOperationKind;
- (id)fileTotalCount;
- (id)fileURL;
- (id)throughput;
- (void)_invokePublishingHandler:(id)a3;
- (void)_invokeUnpublishingHandler;
- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4;
- (void)_setRemoteValues:(id)a3 forKeys:(id)a4;
- (void)acknowledgeWithSuccess:(BOOL)a3;
- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3;
- (void)cancel;
- (void)dealloc;
- (void)pause;
- (void)prioritize;
- (void)publish;
- (void)resignCurrent;
- (void)resume;
- (void)setByteCompletedCount:(id)a3;
- (void)setByteTotalCount:(id)a3;
- (void)setCancellable:(BOOL)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setEstimatedTimeRemaining:(id)a3;
- (void)setFileCompletedCount:(id)a3;
- (void)setFileOperationKind:(id)a3;
- (void)setFileTotalCount:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setKind:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPausable:(BOOL)a3;
- (void)setPausingHandler:(id)a3;
- (void)setPrioritizable:(BOOL)a3;
- (void)setPrioritizationHandler:(id)a3;
- (void)setThroughput:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation _NSProgressProxy

- (id)fileTotalCount
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressFileTotalCountKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)fileCompletedCount
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressFileCompletedCountKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
  v10[7] = *MEMORY[0x1E4F143B8];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E4F1D410];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___NSProgressProxy__setRemoteUserInfoValue_forKey___block_invoke;
  v10[3] = &unk_1E51FAD68;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (id)_initWithForwarder:(id)a3 values:(id)a4 isOld:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_NSProgressProxy;
  v7 = [(NSProgress *)&v9 _initWithValues:a4];
  if (v7)
  {
    v7[15] = a3;
    *((unsigned char *)v7 + 128) = a5;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressProxy;
  [(NSProgress *)&v3 dealloc];
}

- (void)_invokePublishingHandler:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  Main = CFRunLoopGetMain();
  v6 = (const void *)*MEMORY[0x1E4F1D410];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___NSProgressProxy__invokePublishingHandler___block_invoke;
  block[3] = &unk_1E51F7EE0;
  block[4] = self;
  block[5] = a3;
  CFRunLoopPerformBlock(Main, v6, block);
  v7 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v7);
}

- (void)_invokeUnpublishingHandler
{
  v6[5] = *MEMORY[0x1E4F143B8];
  Main = CFRunLoopGetMain();
  uint64_t v4 = (const void *)*MEMORY[0x1E4F1D410];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___NSProgressProxy__invokeUnpublishingHandler__block_invoke;
  v6[3] = &unk_1E51F71D0;
  v6[4] = self;
  CFRunLoopPerformBlock(Main, v4, v6);
  v5 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v5);
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  v10[7] = *MEMORY[0x1E4F143B8];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E4F1D410];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45___NSProgressProxy__setRemoteValues_forKeys___block_invoke;
  v10[3] = &unk_1E51FAD68;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  objc_super v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't make an NSProgress published by another process the current one.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)resignCurrent
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't make an NSProgress published by another process the current one.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)setTotalUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setLocalizedDescription:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setCancellable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setPausable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setCancellationHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setPausingHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setPrioritizable:(BOOL)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setPrioritizationHandler:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (void)setKind:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setThroughput:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setFileOperationKind:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setFileURL:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setFileTotalCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setFileCompletedCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setByteTotalCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (void)setByteCompletedCount:(id)a3
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't change an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (id)estimatedTimeRemaining
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressEstimatedTimeRemainingKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)throughput
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressThroughputKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)fileOperationKind
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressFileOperationKindKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)fileURL
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressFileURLKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)byteTotalCount
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressByteTotalCountKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (id)byteCompletedCount
{
  [(NSLock *)self->super._lock lock];
  id v3 = [(NSOwnedDictionaryProxy *)self->super._userInfoProxy objectForKey:@"NSProgressByteCompletedCountKey"];
  [(NSLock *)self->super._lock unlock];
  return v3;
}

- (void)publish
{
  v2 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[NSProgress %@]: you can't republish an NSProgress published by another process.", NSStringFromSelector(a2)), 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)cancel
{
}

- (void)pause
{
}

- (void)prioritize
{
}

- (void)resume
{
}

- (void)acknowledgeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [+[NSBundle mainBundle] bundleIdentifier];
  if (v5)
  {
    v6 = v5;
    forwarder = self->_forwarder;
    [(NSProgressPublisher *)forwarder appWithBundleID:v6 didAcknowledgeWithSuccess:v3];
  }
}

- (BOOL)isOld
{
  return self->_isOld;
}

@end