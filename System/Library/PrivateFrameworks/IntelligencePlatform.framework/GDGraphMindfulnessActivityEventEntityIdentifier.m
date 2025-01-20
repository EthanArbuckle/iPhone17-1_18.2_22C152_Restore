@interface GDGraphMindfulnessActivityEventEntityIdentifier
- (GDGraphMindfulnessActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphMindfulnessActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphMindfulnessActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphMindfulnessActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphMindfulnessActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphMindfulnessActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphMindfulnessActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphMindfulnessActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphMindfulnessActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphMindfulnessActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphMindfulnessActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphMindfulnessActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end