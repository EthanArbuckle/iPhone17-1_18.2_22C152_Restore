@interface NSError(CEC)
+ (uint64_t)cecAcknowledgementErrorWithUnderlyingError:()CEC;
+ (uint64_t)cecFeatureAbortErrorWithOpCode:()CEC reason:method:;
+ (uint64_t)cecIOErrorWithUnderlyingError:()CEC;
+ (uint64_t)cecTimeoutError;
+ (uint64_t)cecTopologyChangeError;
- (uint64_t)isCECAcknowledgementError;
@end

@implementation NSError(CEC)

+ (uint64_t)cecFeatureAbortErrorWithOpCode:()CEC reason:method:
{
  v11[5] = *MEMORY[0x263EF8340];
  v8 = (void *)MEMORY[0x263F087E8];
  v10[0] = *MEMORY[0x263F08320];
  v11[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The operation could not be completed because a CEC Feature Abort occurred.", &stru_26FECF2C8, 0);
  v10[1] = *MEMORY[0x263F08338];
  v11[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"A CEC Feature Abort occurred.", &stru_26FECF2C8, 0);
  v10[2] = @"CoreCECFeatureAbortOpcodeErrorKey";
  v11[2] = [NSString stringWithUTF8String:CECMessageTypeString(a3)];
  v10[3] = @"CoreCECFeatureAbortReasonErrorKey";
  v10[4] = @"CoreCECFeatureAbortMethodErrorKey";
  v11[3] = [NSString stringWithUTF8String:CECAbortReasonString(a4)];
  v11[4] = a5;
  return objc_msgSend(v8, "errorWithDomain:code:userInfo:", @"com.apple.private.CoreCEC.ErrorDomain", 0, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 5));
}

+ (uint64_t)cecAcknowledgementErrorWithUnderlyingError:()CEC
{
  v8[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F087E8];
  v7[0] = *MEMORY[0x263F08320];
  v8[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The operation could not be completed because a CEC message was not acknowledged.", &stru_26FECF2C8, 0);
  v7[1] = *MEMORY[0x263F08338];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"A CEC message was not acknowledged.", &stru_26FECF2C8, 0);
  v7[2] = *MEMORY[0x263F08608];
  v8[1] = v5;
  v8[2] = a3;
  return objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"com.apple.private.CoreCEC.ErrorDomain", 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
}

+ (uint64_t)cecIOErrorWithUnderlyingError:()CEC
{
  v8[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F087E8];
  v7[0] = *MEMORY[0x263F08320];
  v8[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The operation could not be completed because an I/O error occurred.", &stru_26FECF2C8, 0);
  v7[1] = *MEMORY[0x263F08338];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"An I/O error occurred.", &stru_26FECF2C8, 0);
  v7[2] = *MEMORY[0x263F08608];
  v8[1] = v5;
  v8[2] = a3;
  return objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"com.apple.private.CoreCEC.ErrorDomain", 3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
}

+ (uint64_t)cecTimeoutError
{
  v3[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  v2[0] = *MEMORY[0x263F08320];
  v3[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The operation did not complete with the expected CEC response in a timely fashion.", &stru_26FECF2C8, 0);
  v2[1] = *MEMORY[0x263F08338];
  v3[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"A timeout occurred waiting for a CEC response.", &stru_26FECF2C8, 0);
  return objc_msgSend(v0, "errorWithDomain:code:userInfo:", @"com.apple.private.CoreCEC.ErrorDomain", 4, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2));
}

+ (uint64_t)cecTopologyChangeError
{
  v3[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  v2[0] = *MEMORY[0x263F08320];
  v3[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The operation could not be completed due to a change in the CEC topology.", &stru_26FECF2C8, 0);
  v2[1] = *MEMORY[0x263F08338];
  v3[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"A topology change occurred.", &stru_26FECF2C8, 0);
  return objc_msgSend(v0, "errorWithDomain:code:userInfo:", @"com.apple.private.CoreCEC.ErrorDomain", 5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2));
}

- (uint64_t)isCECAcknowledgementError
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a1, "domain"), "isEqualToString:", @"com.apple.private.CoreCEC.ErrorDomain");
  if (result) {
    return [a1 code] == 2;
  }
  return result;
}

@end