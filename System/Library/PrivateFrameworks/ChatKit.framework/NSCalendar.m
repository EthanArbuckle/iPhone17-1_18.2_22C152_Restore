@interface NSCalendar
@end

@implementation NSCalendar

void __47__NSCalendar_CKUtilities____ck_currentCalendar__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v1 = (void *)__ck_currentCalendar_sCalendar;
  __ck_currentCalendar_sCalendar = v0;
}

@end