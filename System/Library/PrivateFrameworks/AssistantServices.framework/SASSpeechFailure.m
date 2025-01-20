@interface SASSpeechFailure
- (id)ad_error;
@end

@implementation SASSpeechFailure

- (id)ad_error
{
  uint64_t v2 = AFSiriSpeechErrorDomain;
  id v3 = [(SASSpeechFailure *)self errorCode];
  return +[NSError errorWithDomain:v2 code:v3 userInfo:0];
}

@end