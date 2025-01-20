@interface GDGraphSoftwareEntityIdentifier
- (GDGraphSoftwareEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphSoftwareFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphSoftwareEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphSoftwareEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphSoftwareFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphSoftwareEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphSoftwareFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphSoftwareEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphSoftwareEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphSoftwareEntityIdentifier *)((uint64_t (*)(GDGraphSoftwareEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphSoftwareEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end