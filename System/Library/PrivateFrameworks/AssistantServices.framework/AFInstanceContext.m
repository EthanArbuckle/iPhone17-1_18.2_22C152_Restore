@interface AFInstanceContext
+ (id)currentContext;
+ (id)defaultContext;
+ (id)effectiveMachServiceName:(id)a3;
- (AFInstanceInfo)info;
- (BOOL)isCurrent;
- (BOOL)isDefault;
- (BOOL)supportsAudioPowerUpdate;
- (BOOL)supportsProxyGroupPlayer;
- (BOOL)supportsTelephony;
- (NSString)audioDeviceIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)preferencesSubdomain;
- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5;
- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5;
- (id)createXPCListenerWithMachServiceName:(id)a3;
@end

@implementation AFInstanceContext

void __35__AFInstanceContext_defaultContext__block_invoke()
{
  v0 = objc_alloc_init(AFInstanceContextHost);
  v1 = (void *)defaultContext_defaultContext;
  defaultContext_defaultContext = (uint64_t)v0;
}

void __35__AFInstanceContext_currentContext__block_invoke()
{
  uint64_t v0 = +[AFInstanceContext defaultContext];
  v1 = (void *)currentContext_currentContext;
  currentContext_currentContext = v0;
}

+ (id)defaultContext
{
  if (defaultContext_onceToken != -1) {
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_15977);
  }
  v2 = (void *)defaultContext_defaultContext;
  return v2;
}

+ (id)currentContext
{
  if (currentContext_onceToken != -1) {
    dispatch_once(&currentContext_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)currentContext_currentContext;
  return v2;
}

- (BOOL)isCurrent
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 139, @"%s is a subclass responsibility.", "-[AFInstanceContext isCurrent]");

  return 0;
}

- (BOOL)isDefault
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 134, @"%s is a subclass responsibility.", "-[AFInstanceContext isDefault]");

  return 0;
}

- (AFInstanceInfo)info
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 129, @"%s is a subclass responsibility.", "-[AFInstanceContext info]");

  return 0;
}

- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 124, @"%s is a subclass responsibility.", "-[AFInstanceContext createXPCListenerForMachService:targetQueue:flags:]");

  return 0;
}

- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 119, @"%s is a subclass responsibility.", "-[AFInstanceContext createXPCConnectionForMachService:targetQueue:flags:]");

  return 0;
}

- (id)createXPCListenerWithMachServiceName:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 114, @"%s is a subclass responsibility.", "-[AFInstanceContext createXPCListenerWithMachServiceName:]");

  return 0;
}

- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 109, @"%s is a subclass responsibility.", "-[AFInstanceContext createXPCConnectionWithMachServiceName:options:]");

  return 0;
}

+ (id)effectiveMachServiceName:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"AFInstanceContext.m", 104, @"%s is a subclass responsibility.", "+[AFInstanceContext effectiveMachServiceName:]");

  return 0;
}

- (BOOL)supportsTelephony
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 199, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) supportsTelephony]");

  return 0;
}

- (BOOL)supportsProxyGroupPlayer
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 194, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) supportsProxyGroupPlayer]");

  return 0;
}

- (BOOL)supportsAudioPowerUpdate
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 189, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) supportsAudioPowerUpdate]");

  return 0;
}

- (NSString)audioDeviceIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 184, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) audioDeviceIdentifier]");

  return 0;
}

- (NSString)mediaRouteIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 179, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) mediaRouteIdentifier]");

  return 0;
}

- (NSString)preferencesSubdomain
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AFInstanceContext.m", 174, @"%s is a subclass responsibility.", "-[AFInstanceContext(SubsystemSupport) preferencesSubdomain]");

  return 0;
}

@end