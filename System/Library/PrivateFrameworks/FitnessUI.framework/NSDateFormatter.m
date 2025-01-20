@interface NSDateFormatter
@end

@implementation NSDateFormatter

void __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263EFF960] currentLocale];
  [WeakRetained setLocale:v1];
}

void __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263EFFA18] localTimeZone];
  [WeakRetained setTimeZone:v1];
}

@end