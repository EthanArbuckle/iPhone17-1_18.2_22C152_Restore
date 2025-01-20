@interface GDGraphSleepingActivityEventEntityIdentifier
- (GDGraphSleepingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphSleepingActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphSleepingActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphSleepingActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphSleepingActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphSleepingActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphSleepingActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphSleepingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphSleepingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphSleepingActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphSleepingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphSleepingActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end