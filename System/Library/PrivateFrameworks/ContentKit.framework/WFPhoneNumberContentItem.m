@interface WFPhoneNumberContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (WFPhoneNumber)phoneNumber;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)richListTitle;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFPhoneNumberContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Phone numbers");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Phone numbers", @"Phone numbers");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Phone number", @"Phone number");
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
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
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
  id v3 = +[WFContentPropertyBuilder keyPath:@"phoneNumber.localizedLabel" name:v2 class:objc_opt_class()];
  v4 = +[WFContentProperty possibleLabelsForClass:objc_opt_class() localized:1];
  v5 = [v3 possibleValues:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
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
    v12[2] = __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke;
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

void __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) phoneNumber];
    v5 = [v4 string];

    v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/.()- "];
    v7 = [v5 componentsSeparatedByCharactersInSet:v6];
    id v8 = [v7 componentsJoinedByString:&stru_26C71CE08];

    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v17 = &unk_264286F08;
    id v18 = v6;
    id v19 = v8;
    id v10 = v8;
    id v11 = v6;
    v12 = [v3 allContactsWithSortOrder:0 passingTest:&v14];
    id v13 = +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v12, v14, v15, v16, v17);
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v13, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [a2 phoneNumbers];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v15 = v3;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) value];
          id v10 = [(id)v9 string];
          id v11 = [v10 componentsSeparatedByCharactersInSet:*(void *)(a1 + 32)];
          v12 = [v11 componentsJoinedByString:&stru_26C71CE08];

          LOBYTE(v9) = [*(id *)(a1 + 40) isEqualToString:v12];
          if (v9)
          {
            uint64_t v13 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      uint64_t v13 = 0;
LABEL_12:
      id v3 = v15;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v7 = [(WFPhoneNumberContentItem *)self phoneNumber];
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v9 = [v7 formattedPhoneNumber];
    id v10 = [(WFContentItem *)self name];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    id v11 = NSURL;
    v12 = NSString;
    uint64_t v13 = [v7 string];
    uint64_t v14 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
    uint64_t v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];
    long long v16 = [v12 stringWithFormat:@"tel:%@", v15];
    uint64_t v9 = [v11 URLWithString:v16];

    long long v17 = NSString;
    long long v18 = WFLocalizedString(@"Call %@");
    long long v19 = [v7 formattedPhoneNumber];
    id v10 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v19);
  }
  id v8 = +[WFObjectRepresentation object:v9 named:v10];

LABEL_7:
  return v8;
}

- (WFPhoneNumber)phoneNumber
{
  uint64_t v3 = objc_opt_class();
  return (WFPhoneNumber *)[(WFContentItem *)self objectForClass:v3];
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(WFPhoneNumberContentItem *)self phoneNumber];
  uint64_t v6 = [v5 contactName];

  if (v6)
  {
    if (v4)
    {
      uint64_t v7 = [(WFPhoneNumberContentItem *)self phoneNumber];
      id v8 = [v7 formattedPhoneNumber];
      v4[2](v4, v8);
    }
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFPhoneNumberContentItem;
    BOOL v9 = [(WFContentItem *)&v11 getListSubtitle:v4];
  }

  return v9;
}

- (BOOL)getListAltText:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(WFPhoneNumberContentItem *)self phoneNumber];
  uint64_t v6 = [v5 localizedLabel];

  uint64_t v7 = [v6 length];
  uint64_t v8 = v7;
  if (v4 && v7) {
    v4[2](v4, v6);
  }

  return v8 != 0;
}

- (id)richListTitle
{
  uint64_t v3 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v4 = [v3 specifiedName];
  if (v4)
  {

LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)WFPhoneNumberContentItem;
    uint64_t v5 = [(WFContentItem *)&v10 richListTitle];
    goto LABEL_5;
  }
  uint64_t v7 = [(WFPhoneNumberContentItem *)self phoneNumber];
  uint64_t v8 = [v7 contactName];

  if (!v8) {
    goto LABEL_4;
  }
  BOOL v9 = [(WFPhoneNumberContentItem *)self phoneNumber];
  uint64_t v5 = [v9 contactName];

LABEL_5:
  return v5;
}

@end