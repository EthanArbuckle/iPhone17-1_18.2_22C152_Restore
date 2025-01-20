@interface WFEKParticipantContentItem
+ (id)coercions;
+ (id)contactCoercionHandler;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)emailAddressCoercionHandler;
+ (id)localizedFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)possibleRoles;
+ (id)possibleStatuses;
+ (id)possibleTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)isCurrentUser;
- (WFParticipant)participant;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)emailAddress;
- (id)role;
- (id)status;
- (id)type;
@end

@implementation WFEKParticipantContentItem

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFEKParticipantContentItem *)self participant];
  v6 = [v5 emailAddress];

  uint64_t v7 = [v6 length];
  uint64_t v8 = v7;
  if (v4 && v7) {
    v4[2](v4, v6);
  }

  return v8 != 0;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 wfType];
  int v6 = [v5 conformsToClass:objc_opt_class()];

  if (v6)
  {
    uint64_t v7 = [v4 object];

    id v8 = objc_alloc(MEMORY[0x263F0F988]);
    v9 = (void *)[v8 initWithBundleIdentifier:*MEMORY[0x263F854D0]];
    v10 = [MEMORY[0x263F0F9B0] sharedResolver];
    v11 = [v10 resolvedAppMatchingDescriptor:v9];

    v12 = [v7 sourceIdentifier];
    v13 = [(WFContentItem *)self cachingIdentifier];
    v14 = +[WFContentAttributionSet attributionSetWithAccountBasedAppDescriptor:v11 accountIdentifier:v12 disclosureLevel:1 originalItemIdentifier:v13];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFEKParticipantContentItem;
    v14 = [(WFContentItem *)&v16 defaultSourceForRepresentation:v4];
  }
  return v14;
}

- (id)type
{
  v2 = [(WFEKParticipantContentItem *)self participant];
  unint64_t v3 = [v2 type];

  if (v3 <= 4)
  {
    id v4 = WFLocalizedContentPropertyPossibleValueMarker(off_264286118[v3]);
  }
  return v4;
}

- (BOOL)isCurrentUser
{
  v2 = [(WFEKParticipantContentItem *)self participant];
  char v3 = [v2 isCurrentUser];

  return v3;
}

- (id)status
{
  v2 = [(WFEKParticipantContentItem *)self participant];
  char v3 = WFStatusPropertyValueForEKParticipantStatus([v2 status]);

  return v3;
}

- (id)role
{
  v2 = [(WFEKParticipantContentItem *)self participant];
  unint64_t v3 = [v2 role];

  if (v3 <= 4)
  {
    id v4 = WFLocalizedContentPropertyPossibleValueMarker(off_2642860B0[v3]);
  }
  return v4;
}

- (id)emailAddress
{
  v2 = [(WFEKParticipantContentItem *)self participant];
  unint64_t v3 = [v2 emailAddress];

  if (v3)
  {
    id v4 = +[WFEmailAddress addressWithEmailAddress:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (WFParticipant)participant
{
  uint64_t v3 = objc_opt_class();
  return (WFParticipant *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Event attendees");
}

+ (id)localizedPluralFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Event Attendees", @"Event Attendees");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Event Attendee", @"Event Attendee");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Event attendees", @"Event attendees");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Event attendee", @"Event attendee");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)possibleTypes
{
  v9[5] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyPossibleValueMarker(@"Room");
  v9[0] = v2;
  id v3 = WFLocalizedContentPropertyPossibleValueMarker(@"Group");
  v9[1] = v3;
  id v4 = WFLocalizedContentPropertyPossibleValueMarker(@"Person");
  v9[2] = v4;
  v5 = WFLocalizedContentPropertyPossibleValueMarker(@"Resource");
  v9[3] = v5;
  int v6 = WFLocalizedContentPropertyPossibleValueMarker(@"Unknown");
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)possibleStatuses
{
  v12[8] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyPossibleValueMarker(@"Accepted");
  v12[0] = v2;
  id v3 = WFLocalizedContentPropertyPossibleValueMarker(@"Completed");
  v12[1] = v3;
  id v4 = WFLocalizedContentPropertyPossibleValueMarker(@"Declined");
  v12[2] = v4;
  v5 = WFLocalizedContentPropertyPossibleValueMarker(@"Delegated");
  v12[3] = v5;
  int v6 = WFLocalizedContentPropertyPossibleValueMarker(@"In Process");
  v12[4] = v6;
  uint64_t v7 = WFLocalizedContentPropertyPossibleValueMarker(@"Pending");
  v12[5] = v7;
  id v8 = WFLocalizedContentPropertyPossibleValueMarker(@"Tentative");
  v12[6] = v8;
  v9 = WFLocalizedContentPropertyPossibleValueMarker(@"Unknown");
  v12[7] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)possibleRoles
{
  v9[5] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyPossibleValueMarker(@"Unknown");
  v9[0] = v2;
  id v3 = WFLocalizedContentPropertyPossibleValueMarker(@"Required");
  v9[1] = v3;
  id v4 = WFLocalizedContentPropertyPossibleValueMarker(@"Optional");
  v9[2] = v4;
  v5 = WFLocalizedContentPropertyPossibleValueMarker(@"Chair");
  v9[3] = v5;
  int v6 = WFLocalizedContentPropertyPossibleValueMarker(@"Non-participant");
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v25[5] = *MEMORY[0x263EF8340];
  v24 = WFLocalizedContentPropertyNameMarker(@"Status");
  v23 = +[WFContentPropertyBuilder keyPath:@"status" name:v24 class:objc_opt_class()];
  v22 = [(id)objc_opt_class() possibleStatuses];
  v21 = [v23 possibleValues:v22];
  v25[0] = v21;
  v20 = WFLocalizedContentPropertyNameMarker(@"Role");
  v19 = +[WFContentPropertyBuilder keyPath:@"role" name:v20 class:objc_opt_class()];
  v18 = [(id)objc_opt_class() possibleRoles];
  v17 = [v19 possibleValues:v18];
  v25[1] = v17;
  objc_super v16 = WFLocalizedContentPropertyNameMarker(@"Type");
  v15 = +[WFContentPropertyBuilder keyPath:@"type" name:v16 class:objc_opt_class()];
  v14 = [(id)objc_opt_class() possibleTypes];
  v2 = [v15 possibleValues:v14];
  v25[2] = v2;
  id v3 = WFLocalizedContentPropertyNameMarker(@"Is Me");
  id v4 = [NSNumber numberWithBool:1];
  v5 = +[WFContentPropertyBuilder keyPath:@"isCurrentUser" name:v3 class:objc_opt_class()];
  int v6 = WFLocalizedContentPropertyNameMarker(@"Is Not Me");
  uint64_t v7 = [v5 negativeName:v6];
  id v8 = WFLocalizedString(@"Participant");
  v9 = [v7 singularItemName:v8];
  v25[3] = v9;
  v10 = WFLocalizedContentPropertyNameMarker(@"Email Address");
  v11 = +[WFContentPropertyBuilder keyPath:@"emailAddress" name:v10 class:objc_opt_class()];
  v25[4] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:5];

  return v13;
}

+ (id)contactCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:&__block_literal_global_25 availabilityCheck:&__block_literal_global_28];
}

BOOL __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 participant];
  id v3 = [v2 contactPredicate];
  BOOL v4 = v3 != 0;

  return v4;
}

void __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = [a3 options];
  v9 = [v7 participant];

  v10 = [v8 dictionary];
  v11 = [v10 objectForKey:@"WFCoercionOptionEKParticipantExcludeMeContact"];
  if (![v11 BOOLValue])
  {

    goto LABEL_5;
  }
  int v12 = [v9 isCurrentUser];

  if (!v12)
  {
LABEL_5:
    id v13 = [v8 permissionRequestor];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_2;
    v14[3] = &unk_26428A830;
    id v16 = v6;
    id v15 = v9;
    [v13 allowContactsAccessWithCompletionHandler:v14];

    goto LABEL_6;
  }
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
LABEL_6:
}

void __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) contactPredicate];
    id v14 = v6;
    id v8 = [v5 contactsMatchingPredicate:v7 error:&v14];
    id v9 = v14;

    if (![v8 count])
    {
      v10 = [*(id *)(a1 + 32) name];
      uint64_t v11 = [v5 contactsWithName:v10];

      id v8 = (void *)v11;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if ([v8 count])
    {
      id v13 = [v8 firstObject];
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v9);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v9);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = v6;
  }
}

+ (id)emailAddressCoercionHandler
{
  return +[WFCoercionHandler block:&__block_literal_global_1917 availabilityCheck:&__block_literal_global_22];
}

BOOL __57__WFEKParticipantContentItem_emailAddressCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 participant];
  id v3 = [v2 emailAddress];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

id __57__WFEKParticipantContentItem_emailAddressCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 participant];
  id v7 = [v5 options];

  id v8 = [v7 dictionary];
  id v9 = [v8 objectForKey:@"WFCoercionOptionEKParticipantExcludeMeContact"];
  if ([v9 BOOLValue])
  {
    char v10 = [v6 isCurrentUser];

    if (v10)
    {
      uint64_t v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v12 = [v4 emailAddress];
  id v13 = [v6 name];
  uint64_t v11 = +[WFObjectRepresentation object:v12 named:v13];

LABEL_6:
  return v11;
}

+ (id)coercions
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_class();
  id v4 = [a1 contactCoercionHandler];
  id v5 = +[WFCoercion coercionToClass:v3 handler:v4];
  v11[0] = v5;
  uint64_t v6 = objc_opt_class();
  id v7 = [a1 emailAddressCoercionHandler];
  id v8 = +[WFCoercion coercionToClass:v6 handler:v7];
  v11[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

@end