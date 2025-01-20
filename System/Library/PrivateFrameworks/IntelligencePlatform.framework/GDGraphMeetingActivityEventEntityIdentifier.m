@interface GDGraphMeetingActivityEventEntityIdentifier
- (GDGraphMeetingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3;
- (NSString)description;
- (id)graphMeetingActivityEventFromContext:(id)a3 error:(id *)a4;
- (id)initByCastingFrom:(id)a3;
- (id)initFromGDEntityIdentifier:(id)a3;
@end

@implementation GDGraphMeetingActivityEventEntityIdentifier

- (id)initFromGDEntityIdentifier:(id)a3
{
  return GDGraphMeetingActivityEventEntityIdentifier.init(fromGDEntityIdentifier:)(a3);
}

- (id)graphMeetingActivityEventFromContext:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(id, char *, GDGraphMeetingActivityEventEntityIdentifier *, id *))MEMORY[0x1F4181798])(a3, sel_graphMeetingActivityEventFromEntityIdentifier_error_, self, a4);
}

- (id)initByCastingFrom:(id)a3
{
  return (id)((uint64_t (*)(GDGraphMeetingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithEntityIdentifier_, a3);
}

- (GDGraphMeetingActivityEventEntityIdentifier)initWithEntityIdentifier:(id)a3
{
  return (GDGraphMeetingActivityEventEntityIdentifier *)((uint64_t (*)(GDGraphMeetingActivityEventEntityIdentifier *, char *, id))MEMORY[0x1F4181798])(self, sel_initFromGDEntityIdentifier_, a3);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_stringValue(self, v4, v5, v6, v7);
  v12 = objc_msgSend_initWithFormat_(v3, v9, @"<GDGraphMeetingActivityEventEntityIdentifier: %@>", v10, v11, v8);

  return (NSString *)v12;
}

@end