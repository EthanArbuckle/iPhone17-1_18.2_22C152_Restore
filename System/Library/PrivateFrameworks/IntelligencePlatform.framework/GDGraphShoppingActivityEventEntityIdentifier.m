@interface GDGraphShoppingActivityEventEntityIdentifier
- (GDGraphShoppingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphShoppingActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphShoppingActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphShoppingActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphShoppingActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphShoppingActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphShoppingActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphShoppingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphShoppingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphShoppingActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphShoppingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphShoppingActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end