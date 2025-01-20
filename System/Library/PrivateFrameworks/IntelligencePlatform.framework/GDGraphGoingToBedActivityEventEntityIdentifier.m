@interface GDGraphGoingToBedActivityEventEntityIdentifier
- (GDGraphGoingToBedActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphGoingToBedActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphGoingToBedActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphGoingToBedActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphGoingToBedActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphGoingToBedActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphGoingToBedActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphGoingToBedActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphGoingToBedActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphGoingToBedActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphGoingToBedActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphGoingToBedActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end