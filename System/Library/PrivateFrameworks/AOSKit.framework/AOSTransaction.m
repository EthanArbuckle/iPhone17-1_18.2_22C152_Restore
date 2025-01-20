@interface AOSTransaction
- (AOSTransaction)init;
- (AOSTransaction)initWithCoder:(id)a3;
- (BOOL)isSuccessful;
- (id)error;
- (id)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
@end

@implementation AOSTransaction

- (AOSTransaction)init
{
  v5.receiver = self;
  v5.super_class = (Class)AOSTransaction;
  v2 = [(AOSTransaction *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->didSucceed = 0;
    *(_OWORD *)&v2->result = 0u;
    *(_OWORD *)&v2->callbackFunction = 0u;
    *(_OWORD *)&v2->callbackQueue = 0u;
    v2->contextRetain = 0;
    v2->contextRelease = 0;
    v2->waitLock = (NSConditionLock *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
  }
  return v3;
}

- (void)dealloc
{
  objc_sync_enter(self);
  result = self->result;
  if (result)
  {
    CFRelease(result);
    self->result = 0;
  }
  error = self->error;
  if (error)
  {
    CFRelease(error);
    self->error = 0;
  }
  waitLock = self->waitLock;
  if (waitLock)
  {
    CFRelease(waitLock);
    self->waitLock = 0;
  }
  if (self->context)
  {
    contextRelease = (void (*)(void))self->contextRelease;
    if (contextRelease)
    {
      contextRelease();
      self->context = 0;
    }
  }
  id callbackBlock = self->callbackBlock;
  if (callbackBlock)
  {
    CFRelease(callbackBlock);
    id v8 = self->callbackBlock;
  }
  else
  {
    id v8 = 0;
  }

  self->id callbackBlock = 0;
  callbackQueue = self->callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->callbackQueue = 0;
  }
  objc_sync_exit(self);
  v10.receiver = self;
  v10.super_class = (Class)AOSTransaction;
  [(AOSTransaction *)&v10 dealloc];
}

- (void)finalize
{
  objc_sync_enter(self);
  if (self->context)
  {
    contextRelease = (void (*)(void))self->contextRelease;
    if (contextRelease)
    {
      contextRelease();
      self->context = 0;
    }
  }
  id callbackBlock = self->callbackBlock;
  if (callbackBlock)
  {
    CFRelease(callbackBlock);
    id v5 = self->callbackBlock;
  }
  else
  {
    id v5 = 0;
  }

  self->id callbackBlock = 0;
  callbackQueue = self->callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->callbackQueue = 0;
  }
  objc_sync_exit(self);
  v7.receiver = self;
  v7.super_class = (Class)AOSTransaction;
  [(AOSTransaction *)&v7 finalize];
}

- (BOOL)isSuccessful
{
  return self->didSucceed != 0;
}

- (id)result
{
  return self->result;
}

- (id)error
{
  return self->error;
}

- (AOSTransaction)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AOSTransaction;
  v4 = [(AOSTransaction *)&v6 init];
  if (v4)
  {
    v4->didSucceed = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"didSucceed"), "BOOLValue");
    v4->didFinish = objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"didFinish"), "BOOLValue");
    v4->result = (id)[a3 decodeObjectForKey:@"result"];
    v4->error = (__CFError *)(id)[a3 decodeObjectForKey:@"error"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->didSucceed != 0), @"didSucceed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->didFinish != 0), @"didFinish");
  result = self->result;
  if (result) {
    [a3 encodeObject:result forKey:@"result"];
  }
  if (self->error)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

@end