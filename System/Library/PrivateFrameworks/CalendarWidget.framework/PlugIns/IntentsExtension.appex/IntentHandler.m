@interface IntentHandler
- (IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  type metadata accessor for EKUICalendarsIntent();
  if (swift_dynamicCastClass()
    || (type metadata accessor for NextEventComplicationConfigurationIntent(), swift_dynamicCastClass()))
  {
    v5 = (objc_class *)type metadata accessor for WidgetIntentHandler();
    id v6 = objc_allocWithZone(v5);
    id v7 = a3;
    v8 = self;
    id v9 = [v6 init];
    v14 = v5;

    v13[0] = v9;
  }
  else
  {
    v5 = (objc_class *)type metadata accessor for IntentHandler();
    v14 = v5;
    v13[0] = self;
    v12 = self;
  }
  sub_1000067B0(v13, (uint64_t)v5);
  v10 = (void *)sub_100009A70();
  sub_1000067F4((uint64_t)v13);
  return v10;
}

- (IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

@end