@interface CalCFPreferencesStore
+ (id)shared;
- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5;
- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5;
- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
- (void)synchronizeDomain:(id)a3;
@end

@implementation CalCFPreferencesStore

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_148);
  }
  v2 = (void *)shared_store;

  return v2;
}

uint64_t __31__CalCFPreferencesStore_shared__block_invoke()
{
  shared_store = objc_alloc_init(CalCFPreferencesStore);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a5, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  int v7 = keyExistsAndHasValidFormat;
  if (keyExistsAndHasValidFormat) {
    *a3 = AppBooleanValue != 0;
  }
  return v7 != 0;
}

- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)a5, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  int v7 = keyExistsAndHasValidFormat;
  if (keyExistsAndHasValidFormat) {
    *a3 = AppIntegerValue;
  }
  return v7 != 0;
}

- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a5, (CFStringRef)a4);
  int v7 = v6;
  if (v6) {
    *a3 = v6;
  }

  return v7 != 0;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
}

- (void)synchronizeDomain:(id)a3
{
}

@end