@interface GEONotificationPreferenceManager
+ (id)sharedManager;
- (BOOL)isEnabledForSubTestWithName:(id)a3;
- (GEONotificationPreferenceManager)init;
- (void)reset;
- (void)setEnabled:(BOOL)a3 forSubTestWithName:(id)a4;
@end

@implementation GEONotificationPreferenceManager

- (BOOL)isEnabledForSubTestWithName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_enableFlags objectForKey:a3];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)sharedManager
{
  if (_MergedGlobals_229 != -1) {
    dispatch_once(&_MergedGlobals_229, &__block_literal_global_75);
  }
  v2 = (void *)qword_1EB29FA08;

  return v2;
}

void __49__GEONotificationPreferenceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEONotificationPreferenceManager);
  v1 = (void *)qword_1EB29FA08;
  qword_1EB29FA08 = (uint64_t)v0;
}

- (GEONotificationPreferenceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONotificationPreferenceManager;
  v2 = [(GEONotificationPreferenceManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enableFlags = v2->_enableFlags;
    v2->_enableFlags = v3;
  }
  return v2;
}

- (void)setEnabled:(BOOL)a3 forSubTestWithName:(id)a4
{
  BOOL v4 = a3;
  enableFlags = self->_enableFlags;
  objc_super v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)enableFlags setObject:v8 forKey:v7];
}

- (void)reset
{
}

- (void).cxx_destruct
{
}

@end