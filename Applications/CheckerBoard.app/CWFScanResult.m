@interface CWFScanResult
- (BOOL)isSAE;
- (BOOL)isSecure;
- (BOOL)requiresPassword;
- (id)supportedEAPTypes;
@end

@implementation CWFScanResult

- (id)supportedEAPTypes
{
  v2 = [(CWFScanResult *)self scanRecord];
  v3 = [v2 objectForKey:@"AcceptEAPTypes"];

  return v3;
}

- (BOOL)isSAE
{
  v2 = [(CWFScanResult *)self scanRecord];
  v3 = [v2 objectForKey:@"RSN_IE"];

  if (v3
    && (([v3 objectForKey:@"IE_KEY_RSN_AUTHSELS"],
         (v4 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([v3 objectForKey:@"IE_KEY_WPA_AUTHSELS"],
         (v4 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    if ([v4 containsObject:&off_10007CE10]) {
      unsigned __int8 v5 = 1;
    }
    else {
      unsigned __int8 v5 = [v4 containsObject:&off_10007CE28];
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)requiresPassword
{
  if ([(CWFScanResult *)self isEAP])
  {
    v3 = [(CWFScanResult *)self supportedEAPTypes];
    unsigned __int8 v4 = [v3 containsObject:&off_10007CE40];

    unsigned __int8 v5 = [(CWFScanResult *)self supportedEAPTypes];
    if ([v5 containsObject:&off_10007CE58])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      v8 = [(CWFScanResult *)self supportedEAPTypes];
      unsigned __int8 v6 = [v8 containsObject:&off_10007CE70];
    }
    return (v4 | v6) ^ 1;
  }
  else if (([(CWFScanResult *)self isWPA] & 1) != 0 {
         || ([(CWFScanResult *)self isWPA2] & 1) != 0
  }
         || ([(CWFScanResult *)self isWEP] & 1) != 0
         || ([(CWFScanResult *)self isWAPI] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [(CWFScanResult *)self isSAE];
  }
}

- (BOOL)isSecure
{
  return ([(CWFScanResult *)self isWPA] & 1) != 0
      || ([(CWFScanResult *)self isWPA2] & 1) != 0
      || ([(CWFScanResult *)self isWPA3] & 1) != 0
      || ([(CWFScanResult *)self isWEP] & 1) != 0
      || ([(CWFScanResult *)self isWAPI] & 1) != 0
      || [(CWFScanResult *)self WAPISubtype] == (id)2
      || [(CWFScanResult *)self WAPISubtype] == (id)1;
}

@end