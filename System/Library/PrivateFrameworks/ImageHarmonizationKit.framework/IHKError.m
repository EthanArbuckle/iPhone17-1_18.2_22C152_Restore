@interface IHKError
+ (id)errorWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5;
@end

@implementation IHKError

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  v4 = objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, a3, (uint64_t)a4, 0);

  return v4;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  v6 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5, *MEMORY[0x263F08320], a5, *MEMORY[0x263F08608], 0);
  v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.imageharmonizationkit", a3, (uint64_t)v6);

  return v8;
}

@end