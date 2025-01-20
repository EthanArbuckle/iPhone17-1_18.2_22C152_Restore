@interface FBAUserDefaultsMigrator
+ (void)run;
- (_TtC18Feedback_Assistant23FBAUserDefaultsMigrator)init;
@end

@implementation FBAUserDefaultsMigrator

- (_TtC18Feedback_Assistant23FBAUserDefaultsMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAUserDefaultsMigrator();
  return [(FBAUserDefaultsMigrator *)&v3 init];
}

+ (void)run
{
  id v26 = [self sharedUserDefaults];
  NSString v0 = String._bridgeToObjectiveC()();
  unsigned __int8 v1 = [v26 BOOLForKey:v0];

  if (v1)
  {
    if (qword_100121E68 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_1000537C4(v2, (uint64_t)qword_100123EA8);
    objc_super v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "User defaults migrator already completed, skipping.", v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    objc_super v3 = [self standardUserDefaults];
    if (qword_100121E68 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_1000537C4(v6, (uint64_t)qword_100123EA8);
    v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Gathering defaults", v9, 2u);
      swift_slowDealloc();
    }

    uint64_t v10 = FBKAgreedLegalVersionKey;
    id v25 = [v3 integerForKey:FBKAgreedLegalVersionKey];
    id v11 = [v3 stringForKey:@"LastSuccessfulLogin"];
    if (v11)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = 0;
    }
    unsigned int v14 = [v3 BOOLForKey:FBKSuppressPrivacyNoticePreferencesKey];
    v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Migrating defaults to shared domain", v17, 2u);
      swift_slowDealloc();
    }

    if (v25 && ![v26 integerForKey:v10]) {
      [v26 setInteger:v25 forKey:v10];
    }
    if (v13)
    {
      swift_bridgeObjectRelease();
      id v18 = [v26 stringForKey:@"LastSuccessfulLogin"];
      if (v18)
      {
        id v19 = v18;

        id v11 = v19;
      }
      else
      {
        [v26 setObject:v11 forKey:@"LastSuccessfulLogin"];
      }
    }

    if (v14 && ([v26 BOOLForKey:v24] & 1) == 0) {
      [v26 setBool:1 forKey:v24];
    }
    v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Deleting defaults in app domain", v22, 2u);
      swift_slowDealloc();
    }

    [v3 removeObjectForKey:v10];
    [v3 removeObjectForKey:@"LastSuccessfulLogin"];
    [v3 removeObjectForKey:v24];
    NSString v23 = String._bridgeToObjectiveC()();
    [v26 setBool:1 forKey:v23];

    id v26 = v23;
  }
}

@end