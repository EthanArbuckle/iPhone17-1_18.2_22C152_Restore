@interface NSTimeZone
@end

@implementation NSTimeZone

id __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 rangeOfString:a2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v3 substringToIndex:v4];

    id v3 = (id)v5;
  }
  return v3;
}

id __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2(uint64_t a1)
{
  v1 = [&unk_1F2537610 objectForKeyedSubscript:a1];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end