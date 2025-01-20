@interface LDCMNotificationUIManagerV4
- ($E8BCC389BE474BF3398A9D05C1E08415)liquidNotificationContext;
- (IOPortLDCMManagerV4)ldcmManager;
- (LDCMNotificationUIManagerV4)initWithParams:(__CFRunLoop *)a3 :(id)a4;
- (void)setLdcmManager:(id)a3;
- (void)setLiquidNotificationContext:(id *)a3;
- (void)setOverride:(unsigned __int8)a3;
- (void)showUI:(id)a3 :(BOOL)a4;
@end

@implementation LDCMNotificationUIManagerV4

- (LDCMNotificationUIManagerV4)initWithParams:(__CFRunLoop *)a3 :(id)a4
{
  self->_liquidNotificationContext.isNotificationPosted = 0;
  self->_liquidNotificationContext.lastNotificationTime = 0.0;
  self->_liquidNotificationContext.isReinsertion = 0;
  self->_liquidNotificationContext.notification = 0;
  self->_liquidNotificationContext.notificationRunLoopSource = 0;
  self->_liquidNotificationContext.runloop = a3;
  objc_storeStrong((id *)&self->_liquidNotificationContext.notificationUIManager, self);
  id v6 = a4;
  objc_storeWeak((id *)&self->_ldcmManager, v6);

  return self;
}

- (void)showUI:(id)a3 :(BOOL)a4
{
  $96EE1C12479E9B303E9C2794B92A11A2 v4 = a3;
  IOAccessoryNotifyWet((uint64_t)&self->_liquidNotificationContext, &v4, a4);
}

- (void)setOverride:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ldcmManager);
  [WeakRetained setOverride:v3];
}

- (IOPortLDCMManagerV4)ldcmManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ldcmManager);
  return (IOPortLDCMManagerV4 *)WeakRetained;
}

- (void)setLdcmManager:(id)a3
{
}

- ($E8BCC389BE474BF3398A9D05C1E08415)liquidNotificationContext
{
  long long v4 = *(_OWORD *)&self->_liquidNotificationContext.isReinsertion;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_liquidNotificationContext.isNotificationPosted;
  *(_OWORD *)&retstr->var2 = v4;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_liquidNotificationContext.notificationRunLoopSource;
  result = self->_liquidNotificationContext.notificationUIManager;
  retstr->var6 = result;
  return result;
}

- (void)setLiquidNotificationContext:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_liquidNotificationContext.isReinsertion = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_liquidNotificationContext.notificationRunLoopSource = v4;
  *(_OWORD *)&self->_liquidNotificationContext.isNotificationPosted = v3;
  var6 = (LDCMNotificationUIManagerV4 *)a3->var6;
  a3->var6 = 0;
  self->_liquidNotificationContext.notificationUIManager = var6;
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ldcmManager);
}

@end