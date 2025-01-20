@interface NFCError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithNFCDError:(id)a3 defaultNFCErrorCode:(int64_t)a4;
- (NFCError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation NFCError

+ (id)errorWithCode:(int64_t)a3
{
  v3 = [[NFCError alloc] initWithCode:a3 userInfo:0];

  return v3;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = [[NFCError alloc] initWithCode:a3 userInfo:v5];

  return v6;
}

- (NFCError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  if (a3 > 199)
  {
    switch(a3)
    {
      case 400:
        v7 = @"NDEF tag is read only";
        break;
      case 401:
        v7 = @"NDEF tag write failed";
        break;
      case 402:
        v7 = @"Insufficient space on NDEF tag";
        break;
      case 403:
        v7 = @"NDEF tag does not contain any NDEF message";
        break;
      default:
        if (a3 == 300) {
          v7 = @"Invalid configuration parameters";
        }
        else {
          v7 = 0;
        }
        break;
    }
  }
  else if ((unint64_t)a3 <= 0xC7)
  {
    switch(a3)
    {
      case 1:
        v7 = @"Feature not supported";
        break;
      case 2:
        v7 = @"Missing required entitlement";
        break;
      case 3:
        v7 = @"Invalid parameter";
        break;
      case 4:
        v7 = @"Invalid parameter length";
        break;
      case 5:
        v7 = @"Parameter value is out of bound";
        break;
      case 6:
        v7 = @"NFC radio is disabled";
        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v7 = @"Tag connection lost";
        break;
      case 'e':
        v7 = @"Maximum retries exceeded";
        break;
      case 'f':
        v7 = @"Tag response error";
        break;
      case 'g':
        v7 = @"Session invalidated";
        break;
      case 'h':
        v7 = @"Tag is not connected";
        break;
      case 'i':
        v7 = @"Packet length has exceeded the limit";
        break;
      default:
        v7 = 0;
        break;
    }
  }
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", v7, *MEMORY[0x263F08320], 0);
  if ([v6 count]) {
    [v9 addEntriesFromDictionary:v6];
  }
  v12.receiver = self;
  v12.super_class = (Class)NFCError;
  v10 = [(NFCError *)&v12 initWithDomain:@"NFCError" code:a3 userInfo:v9];

  return v10;
}

+ (id)errorWithNFCDError:(id)a3 defaultNFCErrorCode:(int64_t)a4
{
  v34[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_14;
  }
  v7 = [v5 domain];
  int v8 = [v7 isEqualToString:@"NFCError"];

  if (v8)
  {
    id v9 = v6;
LABEL_10:
    v10 = v9;
    goto LABEL_14;
  }
  v11 = [v6 domain];
  objc_super v12 = [NSString stringWithUTF8String:"nfcd"];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v33[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"XPC Error"];
    v33[1] = *MEMORY[0x263F08608];
    v34[0] = v15;
    v34[1] = v6;
    v16 = NSDictionary;
    v17 = v34;
    v18 = v33;
    goto LABEL_12;
  }
  if ([v6 code] == 28 || objc_msgSend(v6, "code") == 51)
  {
    uint64_t v14 = 100;
LABEL_9:
    id v9 = +[NFCError errorWithCode:v14];
    goto LABEL_10;
  }
  if ([v6 code] == 32 || objc_msgSend(v6, "code") == 8)
  {
    uint64_t v14 = 2;
    goto LABEL_9;
  }
  if ([v6 code] != 29)
  {
    if ([v6 code] == 37)
    {
      uint64_t v29 = *MEMORY[0x263F08320];
      v23 = [NSString stringWithUTF8String:"Tag Not NDEF formatted"];
      v30 = v23;
      v24 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v10 = +[NFCError errorWithCode:102 userInfo:v24];

      goto LABEL_24;
    }
    if ([v6 code] == 49)
    {
      uint64_t v14 = 403;
      goto LABEL_9;
    }
    if ([v6 code] == 46)
    {
      uint64_t v14 = 400;
      goto LABEL_9;
    }
    if ([v6 code] == 43)
    {
      uint64_t v14 = 402;
      goto LABEL_9;
    }
    if ([v6 code] == 64)
    {
      uint64_t v27 = *MEMORY[0x263F08320];
      v15 = [NSString stringWithUTF8String:"Reader mode prohibit timer"];
      v28 = v15;
      v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      int64_t v20 = 203;
      goto LABEL_13;
    }
    v25[0] = *MEMORY[0x263F08320];
    v15 = [NSString stringWithUTF8String:"Stack Error"];
    v25[1] = *MEMORY[0x263F08608];
    v26[0] = v15;
    v26[1] = v6;
    v16 = NSDictionary;
    v17 = v26;
    v18 = v25;
LABEL_12:
    v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
    int64_t v20 = a4;
LABEL_13:
    v10 = +[NFCError errorWithCode:v20 userInfo:v19];

    goto LABEL_14;
  }
  uint64_t v22 = *MEMORY[0x263F08608];
  v31[0] = *MEMORY[0x263F08320];
  v31[1] = v22;
  v32[0] = @"Tag response error / no response";
  v32[1] = v6;
  v23 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  v10 = +[NFCError errorWithCode:102 userInfo:v23];
LABEL_24:

LABEL_14:

  return v10;
}

@end