@interface NSError(HDIDSError)
- (BOOL)hd_isFromRequest;
- (BOOL)hd_isResponseTimeout;
- (id)hd_messageIDSDeviceIdentifier;
- (id)hd_messageIDSIdentifier;
- (id)hd_messageSent;
- (id)hd_persistentUserInfo;
- (uint64_t)hd_messageID;
@end

@implementation NSError(HDIDSError)

- (uint64_t)hd_messageID
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    uint64_t v3 = v2[5];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)hd_messageSent
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    uint64_t v3 = (void *)v2[5];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hd_messageIDSIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    uint64_t v3 = (void *)v2[2];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hd_messageIDSDeviceIdentifier
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    uint64_t v3 = (void *)v2[3];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hd_persistentUserInfo
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    uint64_t v3 = (void *)v2[4];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)hd_isFromRequest
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"HDIDSContext"];

  if (v2) {
    BOOL v3 = v2[8] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)hd_isResponseTimeout
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:@"HDIDSErrorDomain"]) {
    BOOL v3 = [a1 code] == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end