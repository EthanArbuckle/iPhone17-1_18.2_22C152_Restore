@interface NSError(CXError)
+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError;
+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError userInfo:;
+ (uint64_t)cx_callDirectoryStoreErrorWithCode:()CXError;
+ (uint64_t)cx_errorWithCode:()CXError;
+ (uint64_t)cx_incomingCallErrorWithCode:()CXError;
+ (uint64_t)cx_notificationServiceExtensionErrorWithCode:()CXError;
+ (uint64_t)cx_requestTransactionErrorWithCode:()CXError;
@end

@implementation NSError(CXError)

+ (uint64_t)cx_errorWithCode:()CXError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error" code:a3 userInfo:0];
}

+ (uint64_t)cx_incomingCallErrorWithCode:()CXError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.incomingcall" code:a3 userInfo:0];
}

+ (uint64_t)cx_requestTransactionErrorWithCode:()CXError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.requesttransaction" code:a3 userInfo:0];
}

+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError
{
  return objc_msgSend(a1, "cx_callDirectoryManagerErrorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)cx_callDirectoryManagerErrorWithCode:()CXError userInfo:
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.calldirectorymanager" code:a3 userInfo:a4];
}

+ (uint64_t)cx_callDirectoryStoreErrorWithCode:()CXError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.calldirectorystore" code:a3 userInfo:0];
}

+ (uint64_t)cx_notificationServiceExtensionErrorWithCode:()CXError
{
  return [a1 errorWithDomain:@"com.apple.CallKit.error.notificationserviceextension" code:a3 userInfo:0];
}

@end