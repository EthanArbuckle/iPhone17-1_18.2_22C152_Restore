@interface CFPrefsCopyUserNameForUID
@end

@implementation CFPrefsCopyUserNameForUID

__CFString *___CFPrefsCopyUserNameForUID_block_invoke(uint64_t a1)
{
  result = _calculateUserNameForUID(*(_DWORD *)(a1 + 32));
  _CFPrefsCopyUserNameForUID_ourUIDName = (uint64_t)result;
  return result;
}

__CFString *___CFPrefsCopyUserNameForUID_block_invoke_2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32)) {
    uid_t v1 = 0;
  }
  else {
    uid_t v1 = 501;
  }
  _CFPrefsCopyUserNameForUID_otherCommonUID = v1;
  result = _calculateUserNameForUID(v1);
  _CFPrefsCopyUserNameForUID_otherCommonUIDName = (uint64_t)result;
  return result;
}

@end