@interface GDGraphCommuteActivityEventEntityIdentifier
- (GDGraphCommuteActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphCommuteActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphCommuteActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphCommuteActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphCommuteActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphCommuteActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphCommuteActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphCommuteActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphCommuteActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphCommuteActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphCommuteActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphCommuteActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end