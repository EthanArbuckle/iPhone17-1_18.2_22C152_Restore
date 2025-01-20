@interface NSString(Uppercasing)
- (id)nph_localizedUppercaseString;
@end

@implementation NSString(Uppercasing)

- (id)nph_localizedUppercaseString
{
  if (nph_localizedUppercaseString_onceToken != -1) {
    dispatch_once(&nph_localizedUppercaseString_onceToken, &__block_literal_global_138);
  }
  v2 = [(id)nph_localizedUppercaseString_map objectForKeyedSubscript:@"CALL_SERVICE_FACETIME_AUDIO"];
  int v3 = [a1 isEqualToString:v2];

  v4 = (void *)nph_localizedUppercaseString_map;
  if (v3)
  {
    v5 = @"CALL_SERVICE_FACETIME_AUDIO_UPPERCASE";
LABEL_7:
    v8 = [v4 objectForKeyedSubscript:v5];
    goto LABEL_9;
  }
  v6 = [(id)nph_localizedUppercaseString_map objectForKeyedSubscript:@"CALL_SERVICE_FACETIME_VIDEO"];
  int v7 = [a1 isEqualToString:v6];

  if (v7)
  {
    v4 = (void *)nph_localizedUppercaseString_map;
    v5 = @"CALL_SERVICE_FACETIME_VIDEO_UPPERCASE";
    goto LABEL_7;
  }
  v8 = [a1 localizedUppercaseString];
LABEL_9:
  return v8;
}

@end