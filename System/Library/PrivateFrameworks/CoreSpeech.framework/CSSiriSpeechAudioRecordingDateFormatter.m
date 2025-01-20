@interface CSSiriSpeechAudioRecordingDateFormatter
@end

@implementation CSSiriSpeechAudioRecordingDateFormatter

uint64_t ___CSSiriSpeechAudioRecordingDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
  _CSSiriSpeechAudioRecordingDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = (void *)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en-US"];
  [v2 setLocale:v3];

  v4 = (void *)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
  return [v4 setDateFormat:@"yyyy_MM_dd-HHmmss.SSS"];
}

@end