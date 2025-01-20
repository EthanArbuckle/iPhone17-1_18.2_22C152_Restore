@interface WFEmailAddressContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemsWithTextCheckingResult:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)getListAltText:(id)a3;
- (WFEmailAddress)emailAddress;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFEmailAddressContentItem

- (BOOL)getListAltText:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFEmailAddressContentItem *)self emailAddress];
  v6 = [v5 localizedLabel];

  uint64_t v7 = [v6 length];
  uint64_t v8 = v7;
  if (v4 && v7) {
    v4[2](v4, v6);
  }

  return v8 != 0;
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Email addresses");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Email addresses", @"Email addresses");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Email address", @"Email address");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v7 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyNameMarker(@"Label");
  id v3 = +[WFContentPropertyBuilder keyPath:@"emailAddress.localizedLabel" name:v2 class:objc_opt_class()];
  v4 = +[WFContentProperty possibleLabelsForClass:objc_opt_class() localized:1];
  v5 = [v3 possibleValues:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)itemsWithTextCheckingResult:(id)a3
{
  v4 = +[WFEmailAddress addressesWithTextCheckingResult:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__WFEmailAddressContentItem_itemsWithTextCheckingResult___block_invoke;
  v7[3] = &__block_descriptor_40_e27__24__0__WFEmailAddress_8Q16l;
  v7[4] = a1;
  v5 = objc_msgSend(v4, "if_map:", v7);

  return v5;
}

uint64_t __57__WFEmailAddressContentItem_itemsWithTextCheckingResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemWithObject:a2];
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v11 = [v9 permissionRequestor];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__WFEmailAddressContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v12[3] = &unk_26428A830;
    v12[4] = self;
    id v13 = v8;
    [v11 allowContactsAccessWithCompletionHandler:v12];
  }
  else
  {
    v10 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
  }
}

void __76__WFEmailAddressContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) emailAddress];
    id v8 = [v7 address];
    id v9 = [v8 lowercaseString];

    v10 = [(objc_class *)getCNContactClass_17765() predicateForContactsMatchingEmailAddress:v9];
    id v15 = v6;
    v11 = [v5 contactsMatchingPredicate:v10 error:&v15];
    id v12 = v15;

    uint64_t v13 = *(void *)(a1 + 40);
    v14 = +[WFObjectRepresentation objects:v11];
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v12);

    id v6 = v12;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    id v8 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
    id v9 = (void *)[v8 mutableCopy];

    [v9 addCharactersInString:@"@"];
    v10 = NSString;
    v11 = [(WFEmailAddressContentItem *)self emailAddress];
    id v12 = [v11 address];
    uint64_t v13 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v9];
    v14 = [v10 stringWithFormat:@"mailto:%@", v13];

    id v15 = [NSURL URLWithString:v14];
    v16 = [(WFContentItem *)self name];
    uint64_t v7 = +[WFObjectRepresentation object:v15 named:v16];

LABEL_7:
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v9 = [(WFEmailAddressContentItem *)self emailAddress];
    v14 = [v9 address];
    id v15 = [(WFContentItem *)self name];
    uint64_t v7 = +[WFObjectRepresentation object:v14 named:v15];
    goto LABEL_7;
  }
  if ((Class)objc_opt_class() != a3)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  Class EKAttendeeClass = getEKAttendeeClass();
  v18 = [(WFEmailAddressContentItem *)self emailAddress];
  v19 = [v18 address];
  v20 = NSURL;
  v21 = NSString;
  v22 = [(WFEmailAddressContentItem *)self emailAddress];
  v23 = [v22 address];
  v24 = [v21 stringWithFormat:@"mailto:%@", v23];
  v25 = [v20 URLWithString:v24];
  id v9 = [(objc_class *)EKAttendeeClass attendeeWithName:0 emailAddress:v19 phoneNumber:0 url:v25];

  v14 = [[WFParticipant alloc] initWithEKParticipant:v9];
  uint64_t v7 = +[WFObjectRepresentation object:v14];
LABEL_9:

LABEL_10:
  return v7;
}

- (WFEmailAddress)emailAddress
{
  uint64_t v3 = objc_opt_class();
  return (WFEmailAddress *)[(WFContentItem *)self objectForClass:v3];
}

@end