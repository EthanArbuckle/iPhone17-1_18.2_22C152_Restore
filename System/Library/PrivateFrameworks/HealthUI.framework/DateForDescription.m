@interface DateForDescription
@end

@implementation DateForDescription

void ___DateForDescription_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_DateForDescription_dateFormatter;
  _DateForDescription_dateFormatter = (uint64_t)v0;

  [(id)_DateForDescription_dateFormatter setDateFormat:@"yyyy-MMM-dd@HH:mm:ss zzz"];
  id v2 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [(id)_DateForDescription_dateFormatter setTimeZone:v2];
}

@end