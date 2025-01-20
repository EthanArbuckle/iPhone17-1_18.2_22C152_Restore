@interface APUIAirPlayURLParser
+ (id)setupPayloadFromAirPlayURL:(id)a3;
@end

@implementation APUIAirPlayURLParser

+ (id)setupPayloadFromAirPlayURL:(id)a3
{
  v3 = (__CFString *)a3;
  if (dword_10001ED78 <= 50 && (dword_10001ED78 != -1 || _LogCategory_Initialize()))
  {
    if (v3 && !IsAppleInternalBuild()) {
      CFStringRef v4 = @"#Redacted#";
    }
    else {
      CFStringRef v4 = v3;
    }
    CFStringRef v22 = v4;
    LogPrintF();
  }
  v5 = +[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v3, v22);
  if (!v5) {
    goto LABEL_57;
  }
  if (dword_10001ED78 <= 50 && (dword_10001ED78 != -1 || _LogCategory_Initialize()))
  {
    v23 = [v5 scheme];
    LogPrintF();
  }
  v6 = [v5 scheme:v23];
  unsigned __int8 v7 = [v6 isEqualToString:@"airplay"];

  if ((v7 & 1) == 0) {
    goto LABEL_57;
  }
  if (dword_10001ED78 <= 50 && (dword_10001ED78 != -1 || _LogCategory_Initialize()))
  {
    v24 = [v5 host];
    LogPrintF();
  }
  v8 = [v5 host:v24];
  unsigned __int8 v9 = [v8 isEqualToString:@"setup"];

  if (v9)
  {
    v10 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = [v5 queryItems];
    id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = [v16 name];
          v18 = [v16 value];
          id v19 = [v18 lengthOfBytesUsingEncoding:4];
          if (!v19)
          {
LABEL_49:
            APSLogErrorAt();

            v10 = 0;
            goto LABEL_50;
          }
          unint64_t v20 = (unint64_t)v19;
          if ([v17 isEqualToString:@"bt"])
          {
            if (v20 > 0x80) {
              goto LABEL_49;
            }
            [v10 setBrokerToken:v18];
          }
          else if ([v17 isEqualToString:@"rp"])
          {
            if (v20 > 0x80) {
              goto LABEL_49;
            }
            [v10 setReceiverToken:v18];
          }
          else if ([v17 isEqualToString:@"rr"])
          {
            [v10 setRouteToReceiver:[v18 isEqualToString:@"1"]];
          }
          else if ([v17 isEqualToString:@"wid"])
          {
            if (v20 > 0x20) {
              goto LABEL_49;
            }
            [v10 setWifiSSID:v18];
          }
          else if ([v17 isEqualToString:@"wp"])
          {
            if (v20 > 0x80) {
              goto LABEL_49;
            }
            [v10 setWifiPassphrase:v18];
          }
          else if ([v17 isEqualToString:@"ca"])
          {
            if (v20 > 0x400) {
              goto LABEL_49;
            }
            [v10 setCaptivePortalAuthToken:v18];
          }
          else if ([v17 isEqualToString:@"h"])
          {
            [v10 setIsNetworkHidden:[v18 isEqualToString:@"1"]];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_50:
  }
  else
  {
LABEL_57:
    APSLogErrorAt();
    v10 = 0;
  }

  return v10;
}

@end