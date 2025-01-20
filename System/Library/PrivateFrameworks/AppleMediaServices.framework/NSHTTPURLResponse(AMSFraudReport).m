@interface NSHTTPURLResponse(AMSFraudReport)
- (BOOL)ams_isFraudReportCallbackResponse;
- (BOOL)ams_isFraudReportInitURLResponse;
- (BOOL)ams_isFraudReportRetryResponse;
- (id)ams_fsrAnonymousID;
- (id)ams_fsrCallbackUrl;
- (id)ams_fsrData;
- (id)ams_fsrInitUrl;
- (id)ams_fsrKeyID;
- (id)ams_fsrNameSpace;
- (id)ams_fsrRequestInterval;
- (id)ams_fsrTransactionID;
@end

@implementation NSHTTPURLResponse(AMSFraudReport)

- (BOOL)ams_isFraudReportRetryResponse
{
  if ([a1 statusCode] != 409) {
    return 0;
  }
  v2 = objc_msgSend(a1, "ams_fsrNameSpace");
  if (v2)
  {
    v3 = objc_msgSend(a1, "ams_fsrTransactionID");
    if (v3)
    {
      v4 = objc_msgSend(a1, "ams_fsrAnonymousID");
      if (v4)
      {
        v5 = objc_msgSend(a1, "ams_fsrData");
        BOOL v6 = v5 != 0;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)ams_isFraudReportCallbackResponse
{
  if ([a1 statusCode] != 200) {
    return 0;
  }
  v2 = objc_msgSend(a1, "ams_fsrNameSpace");
  if (v2)
  {
    v3 = objc_msgSend(a1, "ams_fsrTransactionID");
    if (v3)
    {
      v4 = objc_msgSend(a1, "ams_fsrAnonymousID");
      if (v4)
      {
        v5 = objc_msgSend(a1, "ams_fsrData");
        if (v5)
        {
          BOOL v6 = objc_msgSend(a1, "ams_fsrCallbackUrl");
          BOOL v7 = v6 != 0;
        }
        else
        {
          BOOL v7 = 0;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)ams_isFraudReportInitURLResponse
{
  if ([a1 statusCode] != 200) {
    return 0;
  }
  v2 = objc_msgSend(a1, "ams_fsrNameSpace");
  if (v2)
  {
    v3 = objc_msgSend(a1, "ams_fsrInitUrl");
    if (v3)
    {
      v4 = objc_msgSend(a1, "ams_fsrRequestInterval");
      BOOL v5 = v4 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)ams_fsrNameSpace
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-NameSpace");
}

- (id)ams_fsrData
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-Data");
}

- (id)ams_fsrAnonymousID
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-AID");
}

- (id)ams_fsrKeyID
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-KID");
}

- (id)ams_fsrTransactionID
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-TID");
}

- (id)ams_fsrCallbackUrl
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-Callback");
}

- (id)ams_fsrInitUrl
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-Init");
}

- (id)ams_fsrRequestInterval
{
  return AMSNonEmptyHeaderValue(a1, @"X-Apple-FSR-RI");
}

@end