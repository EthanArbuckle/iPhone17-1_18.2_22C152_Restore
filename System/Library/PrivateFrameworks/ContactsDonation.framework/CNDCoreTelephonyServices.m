@interface CNDCoreTelephonyServices
- (__CTServerConnection)_CTServerConnectionCreateOnTargetQueue:(__CFAllocator *)a3 :(__CFString *)a4 :(id)a5 :(id)a6;
- (void)_CTServerConnectionRegisterBlockForNotification:(__CTServerConnection *)a3 :(__CFString *)a4 :(id)a5;
- (void)_CTServerConnectionUnregisterForNotification:(__CTServerConnection *)a3 :(__CFString *)a4;
@end

@implementation CNDCoreTelephonyServices

- (__CTServerConnection)_CTServerConnectionCreateOnTargetQueue:(__CFAllocator *)a3 :(__CFString *)a4 :(id)a5 :(id)a6
{
  return (__CTServerConnection *)MEMORY[0x270EE87C0](a3, a4, a5, a6);
}

- (void)_CTServerConnectionRegisterBlockForNotification:(__CTServerConnection *)a3 :(__CFString *)a4 :(id)a5
{
}

- (void)_CTServerConnectionUnregisterForNotification:(__CTServerConnection *)a3 :(__CFString *)a4
{
}

@end