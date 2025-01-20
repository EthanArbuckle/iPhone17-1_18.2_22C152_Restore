@interface NSString
- (NSString)nph_localizedUppercaseString;
@end

@implementation NSString

- (NSString)nph_localizedUppercaseString
{
  if (qword_C6D0 != -1) {
    dispatch_once(&qword_C6D0, &stru_8398);
  }
  v3 = [(id)qword_C6C8 objectForKeyedSubscript:@"CALL_SERVICE_FACETIME_AUDIO"];
  unsigned int v4 = [(NSString *)self isEqualToString:v3];

  v5 = (void *)qword_C6C8;
  if (v4)
  {
    CFStringRef v6 = @"CALL_SERVICE_FACETIME_AUDIO_UPPERCASE";
LABEL_7:
    v9 = [v5 objectForKeyedSubscript:v6];
    goto LABEL_9;
  }
  v7 = [(id)qword_C6C8 objectForKeyedSubscript:@"CALL_SERVICE_FACETIME_VIDEO"];
  unsigned int v8 = [(NSString *)self isEqualToString:v7];

  if (v8)
  {
    v5 = (void *)qword_C6C8;
    CFStringRef v6 = @"CALL_SERVICE_FACETIME_VIDEO_UPPERCASE";
    goto LABEL_7;
  }
  v9 = [(NSString *)self localizedUppercaseString];
LABEL_9:

  return (NSString *)v9;
}

@end