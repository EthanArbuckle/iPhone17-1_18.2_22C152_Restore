@interface APBrokerHTTPSendRequestToURL
@end

@implementation APBrokerHTTPSendRequestToURL

void ___APBrokerHTTPSendRequestToURL_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v5 = *(uint64_t **)(a1 + 32);
  if (a4)
  {
    NSErrorToOSStatus();
    if (gLogCategory_APBrokerHTTPUtils <= 30
      && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [a3 statusCode];
    }
    else {
      uint64_t v7 = 0;
    }
    if (gLogCategory_APBrokerHTTPUtils <= 30
      && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *v5;
      uint64_t v10 = v7;
      LogPrintF();
    }
    if (a2 && v7 == 200 && [a2 length])
    {
      if (IsAppleInternalBuild()) {
        unint64_t IntWithDefault = (int)APSSettingsGetIntWithDefault();
      }
      else {
        unint64_t IntWithDefault = 0x100000;
      }
      if (objc_msgSend(a2, "length", v9, v10) <= IntWithDefault)
      {
        [MEMORY[0x1E4F28D90] JSONObjectWithData:a2 options:0 error:0];
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
      else if (gLogCategory_APBrokerHTTPUtils <= 90 {
             && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
      }
      {
        [a2 length];
        LogPrintF();
      }
    }
  }
  (*(void (**)(void))(v5[7] + 16))();
  _APBrokerHTTPReleaseRequestData((uint64_t)v5);
}

@end