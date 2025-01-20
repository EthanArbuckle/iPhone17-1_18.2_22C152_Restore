@interface NSError(HMDHTTPMessageTransportError)
+ (id)hmd_HTTPMessageTransportErrorWithCode:()HMDHTTPMessageTransportError;
@end

@implementation NSError(HMDHTTPMessageTransportError)

+ (id)hmd_HTTPMessageTransportErrorWithCode:()HMDHTTPMessageTransportError
{
  id v3 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = @"The client is unknown.";
    if (a3 != (id)100) {
      v4 = 0;
    }
    if (a3 == (id)200) {
      v4 = @"An unknown error occurred.";
    }
    if (v4)
    {
      uint64_t v11 = *MEMORY[0x1E4F28568];
      v5 = (void *)MEMORY[0x1E4F28B50];
      v6 = v4;
      v7 = [v5 mainBundle];
      v8 = [v7 localizedStringForKey:v6 value:&stru_1F2C9F1A8 table:0];

      v12[0] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      v9 = 0;
    }
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.HomeKit.Messaging.HTTP" code:v3 userInfo:v9];
  }
  return v3;
}

@end