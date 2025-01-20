@interface _GDSBalancingAuthority
+ (id)currentBalancingAuthority;
+ (id)fetchBalancingAuthorityPolygons;
+ (id)loadBalancingAuthorityStatus;
+ (id)loadNumberForPreferenceKey:(id)a3;
+ (id)loadRegistrations;
+ (id)loadStringForPreferenceKey:(id)a3;
+ (id)sharedInstance;
+ (void)saveBalancingAuthority:(id)a3;
+ (void)saveBalancingAuthorityStatus:(id)a3;
+ (void)saveRegisteration:(id)a3 bundlePath:(id)a4;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_GDSBalancingAuthority)init;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _GDSBalancingAuthority

- (_GDSBalancingAuthority)init
{
  v9.receiver = self;
  v9.super_class = (Class)_GDSBalancingAuthority;
  v2 = [(_GDSBalancingAuthority *)&v9 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gds", "balancingAuthority");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance_0;

  return v2;
}

+ (id)fetchBalancingAuthorityPolygons
{
  v2 = +[_GDSServerConnection sharedInstance];
  os_log_t v3 = [v2 fetchBalancingAuthorityPolygons];

  return v3;
}

+ (id)loadStringForPreferenceKey:(id)a3
{
  os_log_t v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v3;
}

+ (id)loadNumberForPreferenceKey:(id)a3
{
  os_log_t v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v3;
}

+ (id)currentBalancingAuthority
{
  v2 = +[_GDSBalancingAuthority loadStringForPreferenceKey:@"balAuthName"];
  os_log_t v3 = +[_GDSBalancingAuthority loadStringForPreferenceKey:@"balAuthID"];
  v4 = +[_GDSBalancingAuthority loadNumberForPreferenceKey:@"balAuthFetchDate"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = +[_GDSBalancingAuthority loadNumberForPreferenceKey:@"balAuthLatStart"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = +[_GDSBalancingAuthority loadNumberForPreferenceKey:@"balAuthLatEnd"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = +[_GDSBalancingAuthority loadNumberForPreferenceKey:@"balAuthLongStart"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = +[_GDSBalancingAuthority loadNumberForPreferenceKey:@"balAuthLongEnd"];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v6];
  if (!v2 || !v3)
  {

    uint64_t v20 = [MEMORY[0x263EFF910] distantPast];

    v2 = @"Unknown";
    v19 = (void *)v20;
  }
  v21 = [[_GDSBalancingAuthorityOutput alloc] initWithIdentifier:v2 name:v3 latitudeStart:v19 latitudeEnd:v9 longitudeStart:v12 longitudeEnd:v15 updateDate:v18];

  return v21;
}

+ (void)saveBalancingAuthority:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"balAuthName", v4, @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);

  v7 = [v3 identifier];
  CFPreferencesSetValue(@"balAuthID", v7, @"com.apple.gridDataServices", v5, v6);

  double v8 = NSNumber;
  [v3 latStart];
  CFPreferencesSetValue(@"balAuthLatStart", (CFPropertyListRef)objc_msgSend(v8, "numberWithDouble:"), @"com.apple.gridDataServices", v5, v6);
  double v9 = NSNumber;
  [v3 latEnd];
  CFPreferencesSetValue(@"balAuthLatEnd", (CFPropertyListRef)objc_msgSend(v9, "numberWithDouble:"), @"com.apple.gridDataServices", v5, v6);
  v10 = NSNumber;
  [v3 longStart];
  CFPreferencesSetValue(@"balAuthLongStart", (CFPropertyListRef)objc_msgSend(v10, "numberWithDouble:"), @"com.apple.gridDataServices", v5, v6);
  double v11 = NSNumber;
  [v3 longEnd];
  double v13 = v12;

  CFPreferencesSetValue(@"balAuthLongEnd", (CFPropertyListRef)[v11 numberWithDouble:v13], @"com.apple.gridDataServices", v5, v6);
  double v14 = NSNumber;
  double v15 = [MEMORY[0x263EFF910] date];
  [v15 timeIntervalSinceReferenceDate];
  CFPreferencesSetValue(@"balAuthFetchDate", (CFPropertyListRef)objc_msgSend(v14, "numberWithDouble:"), @"com.apple.gridDataServices", v5, v6);

  CFPreferencesSynchronize(@"com.apple.gridDataServices", v5, v6);
}

+ (void)saveBalancingAuthorityStatus:(id)a3
{
}

+ (void)saveRegisteration:(id)a3 bundlePath:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE50];
  double v8 = (void *)CFPreferencesCopyValue(@"registrations", @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);
  double v9 = (void *)[v8 mutableCopy];
  if (!v9)
  {
    double v9 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v9 setObject:v5 forKeyedSubscript:v10];
  CFPreferencesSetValue(@"registrations", v9, @"com.apple.gridDataServices", v6, v7);
}

+ (id)loadRegistrations
{
  v2 = (void *)CFPreferencesCopyValue(@"registrations", @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v2;
}

+ (id)loadBalancingAuthorityStatus
{
  v2 = (void *)CFPreferencesCopyValue(@"balAuthStatus", @"com.apple.gridDataServices", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);

  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end