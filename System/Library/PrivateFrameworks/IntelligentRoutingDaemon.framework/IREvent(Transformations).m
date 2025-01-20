@interface IREvent(Transformations)
+ (id)eventFromEventDO:()Transformations;
+ (id)eventSubTypeStringEventDO:()Transformations;
+ (id)eventTypeStringEventDO:()Transformations;
- (IREventDO)eventDO;
- (void)eventDO;
@end

@implementation IREvent(Transformations)

+ (id)eventFromEventDO:()Transformations
{
  id v3 = a3;
  v4 = [v3 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F50118]];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F500E8]);
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "eventType"));
    uint64_t v8 = [v7 integerValue];
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "eventSubType"));
    v10 = objc_msgSend(v6, "initWithEventType:eventSubType:", v8, objc_msgSend(v9, "integerValue"));

    v11 = [v3 bundleID];
    [v10 setBundleID:v11];

    v12 = [v3 contextIdentifier];
    [v10 setContextIdentifier:v12];

    objc_msgSend(v10, "setIsOutsideApp:", objc_msgSend(v3, "isOutsideApp"));
  }
  else
  {
    v13 = [v3 name];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F50110]];

    if (!v14) {
      +[IREvent(Transformations) eventFromEventDO:]();
    }
    id v15 = objc_alloc(MEMORY[0x263F500B0]);
    v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "eventType"));
    uint64_t v17 = [v16 integerValue];
    v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "eventSubType"));
    v10 = objc_msgSend(v15, "initWithEventType:eventSubType:", v17, objc_msgSend(v18, "integerValue"));

    v19 = [v3 bundleID];
    [v10 setBundleID:v19];

    v20 = [v3 contextIdentifier];
    [v10 setContextIdentifier:v20];
  }

  return v10;
}

+ (id)eventTypeStringEventDO:()Transformations
{
  id v3 = a3;
  v4 = [v3 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F50118]];

  if (v5)
  {
    [v3 eventType];
    uint64_t v6 = IRMediaEventTypeToString();
  }
  else
  {
    v7 = [v3 name];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F50110]];

    if (!v8) {
      +[IREvent(Transformations) eventTypeStringEventDO:]();
    }
    [v3 eventType];
    uint64_t v6 = IRAppleTVControlEventTypeToString();
  }
  v9 = (void *)v6;

  return v9;
}

+ (id)eventSubTypeStringEventDO:()Transformations
{
  id v3 = a3;
  v4 = [v3 name];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F50118]];

  if (v5)
  {
    [v3 eventSubType];
    uint64_t v6 = IRMediaEventSubTypeToString();
  }
  else
  {
    v7 = [v3 name];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F50110]];

    if (!v8) {
      +[IREvent(Transformations) eventSubTypeStringEventDO:]();
    }
    [v3 eventSubType];
    uint64_t v6 = IRAppleTVControlEventSubTypeToString();
  }
  v9 = (void *)v6;

  return v9;
}

- (IREventDO)eventDO
{
  v2 = [a1 name];
  if (([v2 isEqual:*MEMORY[0x263F50110]] & 1) == 0)
  {
    id v3 = [a1 name];
    if (([v3 isEqual:*MEMORY[0x263F50118]] & 1) == 0) {
      -[IREvent(Transformations) eventDO]();
    }
  }
  v4 = [IREventDO alloc];
  uint64_t v5 = [a1 eventType];
  uint64_t v6 = [a1 eventSubType];
  v7 = [a1 name];
  int v8 = [a1 bundleID];
  v9 = [a1 contextIdentifier];
  uint64_t v10 = [a1 isOutsideApp];
  LOBYTE(v13) = [a1 isEligibleApp];
  v11 = [(IREventDO *)v4 initWithEventType:v5 eventSubType:v6 name:v7 bundleID:v8 contextIdentifier:v9 isOutsideApp:v10 isEligibleApp:v13];

  return v11;
}

+ (void)eventFromEventDO:()Transformations .cold.1()
{
}

+ (void)eventTypeStringEventDO:()Transformations .cold.1()
{
}

+ (void)eventSubTypeStringEventDO:()Transformations .cold.1()
{
}

- (void)eventDO
{
}

@end