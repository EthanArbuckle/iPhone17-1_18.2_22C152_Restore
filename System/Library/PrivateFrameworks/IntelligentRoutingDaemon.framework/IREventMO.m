@interface IREventMO
+ (id)IREventMOWithIREventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (void)setPropertiesOfEventMO:(id)a3 withEventDO:(id)a4;
- (id)convert;
@end

@implementation IREventMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IREventMO"];
}

+ (id)IREventMOWithIREventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IREventMO alloc] initWithContext:v7];

  [(IREventMO *)v10 setHistoryEvent:v8];
  +[IREventMO setPropertiesOfEventMO:v10 withEventDO:v9];

  return v10;
}

+ (void)setPropertiesOfEventMO:(id)a3 withEventDO:(id)a4
{
  id v5 = a4;
  id v10 = a3;
  objc_msgSend(v10, "setEventType:", objc_msgSend(v5, "eventType"));
  objc_msgSend(v10, "setEventSubtype:", objc_msgSend(v5, "eventSubType"));
  v6 = [v5 name];
  [v10 setName:v6];

  id v7 = [v5 bundleID];
  [v10 setBundleID:v7];

  id v8 = [v5 contextIdentifier];
  [v10 setContextIdentifier:v8];

  objc_msgSend(v10, "setIsOutsideApp:", objc_msgSend(v5, "isOutsideApp"));
  uint64_t v9 = [v5 isEligibleApp];

  [v10 setIsEligibleApp:v9];
}

- (id)convert
{
  v3 = [IREventDO alloc];
  uint64_t v4 = [(IREventMO *)self eventType];
  uint64_t v5 = [(IREventMO *)self eventSubtype];
  v6 = [(IREventMO *)self name];
  id v7 = [(IREventMO *)self bundleID];
  id v8 = [(IREventMO *)self contextIdentifier];
  uint64_t v9 = [(IREventMO *)self isOutsideApp];
  LOBYTE(v12) = [(IREventMO *)self isEligibleApp];
  id v10 = [(IREventDO *)v3 initWithEventType:v4 eventSubType:v5 name:v6 bundleID:v7 contextIdentifier:v8 isOutsideApp:v9 isEligibleApp:v12];

  return v10;
}

@end