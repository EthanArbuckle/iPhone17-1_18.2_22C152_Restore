@interface SessionIdentifierDateFormatter
@end

@implementation SessionIdentifierDateFormatter

void ___SessionIdentifierDateFormatter_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_SessionIdentifierDateFormatter___formatter;
  _SessionIdentifierDateFormatter___formatter = v0;

  [(id)_SessionIdentifierDateFormatter___formatter setDateFormat:@"'P'yyyy-MM-dd'T'HH:mm:ss.SSS"];
  id v2 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [(id)_SessionIdentifierDateFormatter___formatter setTimeZone:v2];
}

@end