@interface PHVoicemailDurationFormatter
@end

@implementation PHVoicemailDurationFormatter

void __PHVoicemailDurationFormatter_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  v2 = (void *)PHVoicemailDurationFormatter_voicemailDurationFormatter;
  PHVoicemailDurationFormatter_voicemailDurationFormatter = (uint64_t)v1;

  [(id)PHVoicemailDurationFormatter_voicemailDurationFormatter setAllowedUnits:192];
  v3 = (void *)PHVoicemailDurationFormatter_voicemailDurationFormatter;

  [v3 setZeroFormattingBehavior:0x10000];
}

@end