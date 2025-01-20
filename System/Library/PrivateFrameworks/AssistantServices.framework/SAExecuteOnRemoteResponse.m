@interface SAExecuteOnRemoteResponse
- (int64_t)resultCallbackCode;
@end

@implementation SAExecuteOnRemoteResponse

- (int64_t)resultCallbackCode
{
  v2 = [(SAExecuteOnRemoteResponse *)self result];
  v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 resultCallbackCode];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

@end