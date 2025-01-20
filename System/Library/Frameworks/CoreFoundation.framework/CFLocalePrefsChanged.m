@interface CFLocalePrefsChanged
@end

@implementation CFLocalePrefsChanged

void ____CFLocalePrefsChanged_block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 32) == *(double *)&__lastNote)
  {
    _CFCalendarResetCurrent();
    CFPreferencesAppSynchronize(@"kCFPreferencesCurrentApplication");
    dispatch_async((dispatch_queue_t)off_1ECE0A5E0, &__block_literal_global_13);
  }
}

@end