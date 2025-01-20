@interface CNUIUserActionItem
+ (CNLSApplicationWorkspace)workspace;
+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9;
+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9;
+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5;
+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5 callProviderManager:(id)a6;
+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6;
+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8 isEligibleDefaultApp:(BOOL)a9;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8;
+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6;
+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6;
+ (id)textItemWithLabel:(id)a3 targetPhoneNumber:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)thirdPartyCallActionItemForHandle:(id)a3 contactProperty:(id)a4 actionType:(id)a5 bundleIdentifier:(id)a6 callProviderManager:(id)a7;
+ (id)ttyItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6;
+ (id)ttyRelayItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6;
+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9;
+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9;
+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandledByFirstPartyApp;
- (BOOL)isSuggested;
- (BOOL)runningOniPad;
- (BOOL)shouldCurateIfPerformed;
- (BOOL)shouldGroupByBundleIdentifier;
- (BOOL)shouldOpenToBundleIdentifier;
- (BOOL)shouldPromoteLoneActionToBeDefault;
- (BOOL)shouldUseApplicationNameForLabel;
- (CNContactProperty)contactProperty;
- (CNUIUserActionItem)initWithItem:(id)a3 contactProperty:(id)a4;
- (CNUIUserActionItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 group:(int64_t)a6 options:(unint64_t)a7;
- (NSDictionary)associatedRecentContactMetadata;
- (NSString)appName;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)sanitizedTargetHandle;
- (NSString)targetHandle;
- (NSString)teamIdentifier;
- (NSString)type;
- (id)curateActionWithContext:(id)a3 withKeysToFetch:(id)a4;
- (id)description;
- (id)performActionWithContext:(id)a3;
- (id)url;
- (int64_t)group;
- (unint64_t)hash;
- (unint64_t)options;
- (void)associateWithRecentContactMetadata:(id)a3;
- (void)setAppName:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation CNUIUserActionItem

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[_CNUIUserActionURLItem alloc] initWithType:v16 contactProperty:v15 bundleIdentifier:v14 url:v13 group:a7 options:a8];

  return v17;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  BOOL v10 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [[_CNUIUserActionURLItem alloc] initWithType:v17 contactProperty:v16 bundleIdentifier:v15 url:v14 isSensitive:v10 group:a8 options:a9];

  return v18;
}

+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263EFEAF0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  id v15 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v13 value:v12];

  v29[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v14 setEmailAddresses:v16];

  id v17 = (void *)MEMORY[0x263EFEA30];
  uint64_t v18 = *MEMORY[0x263EFDF80];
  v19 = [v14 emailAddresses];
  v20 = [v19 firstObject];
  v21 = [v20 identifier];
  v22 = [v17 contactPropertyWithContactNoCopy:v14 propertyKey:v18 identifier:v21];

  v23 = [_CNUIUserActionURLItem alloc];
  v24 = v23;
  uint64_t v25 = *MEMORY[0x263EFDF20];
  if (v9)
  {
    v26 = [MEMORY[0x263F335E0] futureWithResult:v9];
    v27 = [(_CNUIUserActionURLItem *)v24 initWithType:v25 contactProperty:v22 bundleIdentifier:v10 url:v26 isSensitive:1 group:9 options:0];
  }
  else
  {
    v27 = [(_CNUIUserActionURLItem *)v23 initWithType:v25 contactProperty:v22 bundleIdentifier:v10 url:0 isSensitive:1 group:9 options:0];
  }

  return v27;
}

+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263EFEAF0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  id v15 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v13 value:v12];

  v29[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v14 setEmailAddresses:v16];

  id v17 = (void *)MEMORY[0x263EFEA30];
  uint64_t v18 = *MEMORY[0x263EFDF80];
  v19 = [v14 emailAddresses];
  v20 = [v19 firstObject];
  v21 = [v20 identifier];
  v22 = [v17 contactPropertyWithContactNoCopy:v14 propertyKey:v18 identifier:v21];

  v23 = [_CNUIUserActionURLItem alloc];
  v24 = v23;
  uint64_t v25 = *MEMORY[0x263EFDF10];
  if (v9)
  {
    v26 = [MEMORY[0x263F335E0] futureWithResult:v9];
    v27 = [(_CNUIUserActionURLItem *)v24 initWithType:v25 contactProperty:v22 bundleIdentifier:v10 url:v26 group:8 options:0];
  }
  else
  {
    v27 = [(_CNUIUserActionURLItem *)v23 initWithType:*MEMORY[0x263EFDF10] contactProperty:v22 bundleIdentifier:v10 url:0 group:8 options:0];
  }

  return v27;
}

+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v33[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x263EFEAF0];
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v15);
  v19 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v17 value:v16];

  v33[0] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v18 setEmailAddresses:v20];

  v21 = (void *)MEMORY[0x263EFEA30];
  uint64_t v22 = *MEMORY[0x263EFDF80];
  v23 = [v18 emailAddresses];
  v24 = [v23 firstObject];
  uint64_t v25 = [v24 identifier];
  v26 = [v21 contactPropertyWithContactNoCopy:v18 propertyKey:v22 identifier:v25];

  v27 = [_CNUIUserActionURLItem alloc];
  v28 = v27;
  uint64_t v29 = *MEMORY[0x263EFDF18];
  if (v13)
  {
    v30 = [MEMORY[0x263F335E0] futureWithResult:v13];
    v31 = [(_CNUIUserActionURLItem *)v28 initWithType:v29 contactProperty:v26 bundleIdentifier:v14 url:v30 group:a7 options:a8];
  }
  else
  {
    v31 = [(_CNUIUserActionURLItem *)v27 initWithType:*MEMORY[0x263EFDF18] contactProperty:v26 bundleIdentifier:v14 url:0 group:a7 options:a8];
  }

  return v31;
}

+ (id)textItemWithLabel:(id)a3 targetPhoneNumber:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v35[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x263EFEAF0];
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v15);
  v19 = (void *)MEMORY[0x263EFEAD0];
  v20 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v16];

  v21 = [v19 labeledValueWithLabel:v17 value:v20];

  v35[0] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v18 setPhoneNumbers:v22];

  v23 = (void *)MEMORY[0x263EFEA30];
  uint64_t v24 = *MEMORY[0x263EFE070];
  uint64_t v25 = [v18 phoneNumbers];
  v26 = [v25 firstObject];
  v27 = [v26 identifier];
  v28 = [v23 contactPropertyWithContactNoCopy:v18 propertyKey:v24 identifier:v27];

  uint64_t v29 = [_CNUIUserActionURLItem alloc];
  v30 = v29;
  uint64_t v31 = *MEMORY[0x263EFDF18];
  if (v13)
  {
    v32 = [MEMORY[0x263F335E0] futureWithResult:v13];
    v33 = [(_CNUIUserActionURLItem *)v30 initWithType:v31 contactProperty:v28 bundleIdentifier:v14 url:v32 group:a7 options:a8];
  }
  else
  {
    v33 = [(_CNUIUserActionURLItem *)v29 initWithType:*MEMORY[0x263EFDF18] contactProperty:v28 bundleIdentifier:v14 url:0 group:a7 options:a8];
  }

  return v33;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v33[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x263EFEAF0];
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v15);
  v19 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v17 value:v16];

  v33[0] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v18 setEmailAddresses:v20];

  v21 = (void *)MEMORY[0x263EFEA30];
  uint64_t v22 = *MEMORY[0x263EFDF80];
  v23 = [v18 emailAddresses];
  uint64_t v24 = [v23 firstObject];
  uint64_t v25 = [v24 identifier];
  v26 = [v21 contactPropertyWithContactNoCopy:v18 propertyKey:v22 identifier:v25];

  v27 = [_CNUIUserActionURLItem alloc];
  v28 = v27;
  uint64_t v29 = *MEMORY[0x263EFDF38];
  if (v13)
  {
    v30 = [MEMORY[0x263F335E0] futureWithResult:v13];
    uint64_t v31 = [(_CNUIUserActionURLItem *)v28 initWithType:v29 contactProperty:v26 bundleIdentifier:v14 url:v30 group:a7 options:a8];
  }
  else
  {
    uint64_t v31 = [(_CNUIUserActionURLItem *)v27 initWithType:*MEMORY[0x263EFDF38] contactProperty:v26 bundleIdentifier:v14 url:0 group:a7 options:a8];
  }

  return v31;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v35[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = (objc_class *)MEMORY[0x263EFEAF0];
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v15);
  v19 = (void *)MEMORY[0x263EFEAD0];
  v20 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v16];

  v21 = [v19 labeledValueWithLabel:v17 value:v20];

  v35[0] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v18 setPhoneNumbers:v22];

  v23 = (void *)MEMORY[0x263EFEA30];
  uint64_t v24 = *MEMORY[0x263EFE070];
  uint64_t v25 = [v18 phoneNumbers];
  v26 = [v25 firstObject];
  v27 = [v26 identifier];
  v28 = [v23 contactPropertyWithContactNoCopy:v18 propertyKey:v24 identifier:v27];

  uint64_t v29 = [_CNUIUserActionURLItem alloc];
  v30 = v29;
  uint64_t v31 = *MEMORY[0x263EFDEF8];
  if (v13)
  {
    v32 = [MEMORY[0x263F335E0] futureWithResult:v13];
    v33 = [(_CNUIUserActionURLItem *)v30 initWithType:v31 contactProperty:v28 bundleIdentifier:v14 url:v32 group:a7 options:a8];
  }
  else
  {
    v33 = [(_CNUIUserActionURLItem *)v29 initWithType:*MEMORY[0x263EFDEF8] contactProperty:v28 bundleIdentifier:v14 url:0 group:a7 options:a8];
  }

  return v33;
}

+ (id)ttyItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263EFEAF0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  id v15 = (void *)MEMORY[0x263EFEAD0];
  id v16 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v12];

  id v17 = [v15 labeledValueWithLabel:v13 value:v16];

  v31[0] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  [v14 setPhoneNumbers:v18];

  v19 = (void *)MEMORY[0x263EFEA30];
  uint64_t v20 = *MEMORY[0x263EFE070];
  v21 = [v14 phoneNumbers];
  uint64_t v22 = [v21 firstObject];
  v23 = [v22 identifier];
  uint64_t v24 = [v19 contactPropertyWithContactNoCopy:v14 propertyKey:v20 identifier:v23];

  uint64_t v25 = [_CNUIUserActionURLItem alloc];
  v26 = v25;
  uint64_t v27 = *MEMORY[0x263EFDF28];
  if (v9)
  {
    v28 = [MEMORY[0x263F335E0] futureWithResult:v9];
    uint64_t v29 = [(_CNUIUserActionURLItem *)v26 initWithType:v27 contactProperty:v24 bundleIdentifier:v10 url:v28 group:2 options:0];
  }
  else
  {
    uint64_t v29 = [(_CNUIUserActionURLItem *)v25 initWithType:*MEMORY[0x263EFDF28] contactProperty:v24 bundleIdentifier:v10 url:0 group:2 options:0];
  }

  return v29;
}

+ (id)ttyRelayItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263EFEAF0];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  id v15 = (void *)MEMORY[0x263EFEAD0];
  id v16 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v12];

  id v17 = [v15 labeledValueWithLabel:v13 value:v16];

  v31[0] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  [v14 setPhoneNumbers:v18];

  v19 = (void *)MEMORY[0x263EFEA30];
  uint64_t v20 = *MEMORY[0x263EFE070];
  v21 = [v14 phoneNumbers];
  uint64_t v22 = [v21 firstObject];
  v23 = [v22 identifier];
  uint64_t v24 = [v19 contactPropertyWithContactNoCopy:v14 propertyKey:v20 identifier:v23];

  uint64_t v25 = [_CNUIUserActionURLItem alloc];
  v26 = v25;
  uint64_t v27 = *MEMORY[0x263EFDF30];
  if (v9)
  {
    v28 = [MEMORY[0x263F335E0] futureWithResult:v9];
    uint64_t v29 = [(_CNUIUserActionURLItem *)v26 initWithType:v27 contactProperty:v24 bundleIdentifier:v10 url:v28 group:2 options:0];
  }
  else
  {
    uint64_t v29 = [(_CNUIUserActionURLItem *)v25 initWithType:*MEMORY[0x263EFDF30] contactProperty:v24 bundleIdentifier:v10 url:0 group:2 options:0];
  }

  return v29;
}

- (id)url
{
  v2 = self;
  CNUnimplementedMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8
{
  if (a7) {
    uint64_t v11 = 7;
  }
  else {
    uint64_t v11 = 5;
  }
  if (a7) {
    unint64_t v12 = a8 | 4;
  }
  else {
    unint64_t v12 = a8;
  }
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[_CNUIUserActionUserActivityItem alloc] initWithType:v16 contactProperty:v15 bundleIdentifier:v14 userActivity:v13 group:v11 options:v12];

  return v17;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[_CNUIUserActionUserActivityItem alloc] initWithType:v16 contactProperty:v15 bundleIdentifier:v14 userActivity:v13 group:a7 options:a8];

  return v17;
}

+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = (objc_class *)MEMORY[0x263EFEAF0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v13 value:v12];

  v26[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [v14 setEmailAddresses:v16];

  id v17 = (void *)MEMORY[0x263EFEA30];
  uint64_t v18 = *MEMORY[0x263EFDF80];
  v19 = [v14 emailAddresses];
  uint64_t v20 = [v19 firstObject];
  v21 = [v20 identifier];
  uint64_t v22 = [v17 contactPropertyWithContactNoCopy:v14 propertyKey:v18 identifier:v21];

  v23 = [_CNUIUserActionUserActivityItem alloc];
  uint64_t v24 = [(_CNUIUserActionUserActivityItem *)v23 initWithType:*MEMORY[0x263EFDF20] contactProperty:v22 bundleIdentifier:v10 userActivity:v11 group:9 options:0];

  return v24;
}

+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = (objc_class *)MEMORY[0x263EFEAF0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v13 value:v12];

  v26[0] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [v14 setEmailAddresses:v16];

  id v17 = (void *)MEMORY[0x263EFEA30];
  uint64_t v18 = *MEMORY[0x263EFDF80];
  v19 = [v14 emailAddresses];
  uint64_t v20 = [v19 firstObject];
  v21 = [v20 identifier];
  uint64_t v22 = [v17 contactPropertyWithContactNoCopy:v14 propertyKey:v18 identifier:v21];

  v23 = [_CNUIUserActionUserActivityItem alloc];
  uint64_t v24 = [(_CNUIUserActionUserActivityItem *)v23 initWithType:*MEMORY[0x263EFDF10] contactProperty:v22 bundleIdentifier:v10 userActivity:v11 group:8 options:0];

  return v24;
}

+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v30[1] = *MEMORY[0x263EF8340];
  id v13 = (objc_class *)MEMORY[0x263EFEAF0];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v13);
  v19 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v17 value:v16];

  v30[0] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v18 setEmailAddresses:v20];

  v21 = (void *)MEMORY[0x263EFEA30];
  uint64_t v22 = *MEMORY[0x263EFDF80];
  v23 = [v18 emailAddresses];
  uint64_t v24 = [v23 firstObject];
  uint64_t v25 = [v24 identifier];
  v26 = [v21 contactPropertyWithContactNoCopy:v18 propertyKey:v22 identifier:v25];

  uint64_t v27 = [_CNUIUserActionUserActivityItem alloc];
  v28 = [(_CNUIUserActionUserActivityItem *)v27 initWithType:*MEMORY[0x263EFDF18] contactProperty:v26 bundleIdentifier:v14 userActivity:v15 group:a7 options:a8];

  return v28;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v30[1] = *MEMORY[0x263EF8340];
  id v13 = (objc_class *)MEMORY[0x263EFEAF0];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v13);
  v19 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v17 value:v16];

  v30[0] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v18 setEmailAddresses:v20];

  v21 = (void *)MEMORY[0x263EFEA30];
  uint64_t v22 = *MEMORY[0x263EFDF80];
  v23 = [v18 emailAddresses];
  uint64_t v24 = [v23 firstObject];
  uint64_t v25 = [v24 identifier];
  v26 = [v21 contactPropertyWithContactNoCopy:v18 propertyKey:v22 identifier:v25];

  uint64_t v27 = [_CNUIUserActionUserActivityItem alloc];
  v28 = [(_CNUIUserActionUserActivityItem *)v27 initWithType:*MEMORY[0x263EFDF38] contactProperty:v26 bundleIdentifier:v14 userActivity:v15 group:a7 options:a8];

  return v28;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return (id)[a1 _voiceItemWithLabel:a3 targetStringValue:a4 propertyKey:*MEMORY[0x263EFE070] userActivity:a5 bundleIdentifier:a6 group:a7 options:a8];
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:userActivity:bundleIdentifier:group:options:", a3, a4, a5, a6, a7, a8);
}

+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  v38[1] = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  id v16 = (objc_class *)MEMORY[0x263EFEAF0];
  id v17 = a7;
  id v18 = a6;
  id v19 = objc_alloc_init(v16);
  if (!(v15 | *MEMORY[0x263EFE070]) || objc_msgSend((id)v15, "isEqual:"))
  {
    int64_t v20 = a8;
    v21 = (void *)MEMORY[0x263EFEAD0];
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFEB28], "phoneNumberWithStringValue:", v14, v35);
    v23 = [v21 labeledValueWithLabel:v35 value:v22];
    v38[0] = v23;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
    [v19 setPhoneNumbers:v24];

    uint64_t v25 = [v19 phoneNumbers];
LABEL_7:
    v28 = v25;
    uint64_t v29 = [v25 firstObject];
    v30 = [v29 identifier];

    a8 = v20;
    goto LABEL_8;
  }
  if (!(v15 | *MEMORY[0x263EFDF80]) || objc_msgSend((id)v15, "isEqual:"))
  {
    int64_t v20 = a8;
    v26 = objc_msgSend(MEMORY[0x263EFEAD0], "labeledValueWithLabel:value:", v35, v14, v35);
    v37 = v26;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    [v19 setEmailAddresses:v27];

    uint64_t v25 = [v19 emailAddresses];
    goto LABEL_7;
  }
  v30 = 0;
LABEL_8:
  uint64_t v31 = objc_msgSend(MEMORY[0x263EFEA30], "contactPropertyWithContactNoCopy:propertyKey:identifier:", v19, v15, v30, v35);
  v32 = [_CNUIUserActionUserActivityItem alloc];
  v33 = [(_CNUIUserActionUserActivityItem *)v32 initWithType:*MEMORY[0x263EFDEF8] contactProperty:v31 bundleIdentifier:v17 userActivity:v18 group:a8 options:a9];

  return v33;
}

- (id)performActionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)curateActionWithContext:(id)a3 withKeysToFetch:(id)a4
{
  id v6 = a4;
  v7 = [a3 actionCurator];
  v8 = [v7 curateUserAction:self withKeysToFetch:v6];

  return v8;
}

- (BOOL)shouldUseApplicationNameForLabel
{
  id v3 = [(CNUIUserActionItem *)self bundleIdentifier];
  char v4 = [v3 hasPrefix:*MEMORY[0x263EFDEC0]];

  if (v4) {
    return 1;
  }
  v5 = [(CNUIUserActionItem *)self bundleIdentifier];
  if ([v5 hasPrefix:@"com.apple.Chatterbox"])
  {

    return 1;
  }
  id v6 = [(CNUIUserActionItem *)self bundleIdentifier];
  char v7 = [v6 hasPrefix:@"com.apple.Speakerbox"];

  if (v7) {
    return 1;
  }
  return ![(CNUIUserActionItem *)self isHandledByFirstPartyApp];
}

- (BOOL)isHandledByFirstPartyApp
{
  v2 = [(CNUIUserActionItem *)self bundleIdentifier];
  char v3 = [v2 hasPrefix:@"com.apple"];

  return v3;
}

- (void)associateWithRecentContactMetadata:(id)a3
{
  self->_associatedRecentContactMetadata = (NSDictionary *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSString)label
{
  if ([(CNUIUserActionItem *)self shouldUseApplicationNameForLabel])
  {
    char v3 = [(CNUIUserActionItem *)self applicationName];
  }
  else
  {
    char v4 = [(CNUIUserActionItem *)self contactProperty];
    char v3 = [v4 label];
  }
  return (NSString *)v3;
}

- (NSString)applicationName
{
  v2 = cn_objectResultWithObjectLock();
  return (NSString *)v2;
}

id __37__CNUIUserActionItem_applicationName__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  if (!(*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))()) {
    goto LABEL_13;
  }

  char v3 = [*(id *)(a1 + 32) type];
  int v4 = [v3 isEqualToString:*MEMORY[0x263EFDEF8]];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263EFDEC0]];

    if (v6)
    {
      char v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      id v9 = @"FACETIME_AUDIO";
LABEL_8:
      uint64_t v11 = [v7 localizedStringForKey:v9 value:&stru_26BFC7668 table:@"Localized"];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 32);
      *(void *)(v12 + 32) = v11;

      goto LABEL_9;
    }
    v8 = [*(id *)(a1 + 32) bundleIdentifier];
    if (![v8 isEqualToString:*MEMORY[0x263EFDEE8]])
    {
LABEL_9:

      goto LABEL_10;
    }
    int v10 = [*(id *)(a1 + 32) runningOniPad];

    if (v10)
    {
      char v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      id v9 = @"CALLS_FROM_IPHONE";
      goto LABEL_8;
    }
  }
LABEL_10:
  id v14 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v14)
  {
    unint64_t v15 = [(id)objc_opt_class() workspace];
    id v16 = [*(id *)(a1 + 32) bundleIdentifier];
    id v17 = [v15 applicationForBundleIdentifier:v16];
    uint64_t v18 = [v17 localizedName];
    uint64_t v19 = *(void *)(a1 + 32);
    int64_t v20 = *(void **)(v19 + 32);
    *(void *)(v19 + 32) = v18;

    id v14 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v2 = v14;
LABEL_13:
  return v2;
}

- (BOOL)runningOniPad
{
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

+ (CNLSApplicationWorkspace)workspace
{
  id v2 = objc_alloc_init(CNLSApplicationWorkspace);
  return v2;
}

- (NSString)targetHandle
{
  if (targetHandle_cn_once_token_1 != -1) {
    dispatch_once(&targetHandle_cn_once_token_1, &__block_literal_global_65);
  }
  id v3 = (id)targetHandle_cn_once_object_1;
  int v4 = [(CNUIUserActionItem *)self contactProperty];
  v5 = [v4 key];
  int v6 = [v3 objectForKeyedSubscript:v5];

  char v7 = [(CNUIUserActionItem *)self contactProperty];
  v8 = [v7 value];
  id v9 = ((void (**)(void, void *))v6)[2](v6, v8);

  return (NSString *)v9;
}

void __34__CNUIUserActionItem_targetHandle__block_invoke()
{
  v9[5] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263EFDF80];
  v0 = (void *)[&__block_literal_global_25_1 copy];
  v9[0] = v0;
  v8[1] = *MEMORY[0x263EFE070];
  v1 = (void *)[&__block_literal_global_28_0 copy];
  v9[1] = v1;
  v8[2] = *MEMORY[0x263EFE010];
  id v2 = (void *)[&__block_literal_global_31_1 copy];
  v9[2] = v2;
  v8[3] = *MEMORY[0x263EFE110];
  id v3 = (void *)[&__block_literal_global_34_1 copy];
  v9[3] = v3;
  v8[4] = *MEMORY[0x263EFE0A0];
  int v4 = (void *)[&__block_literal_global_37 copy];
  v9[4] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v6 = [v5 copy];
  char v7 = (void *)targetHandle_cn_once_object_1;
  targetHandle_cn_once_object_1 = v6;
}

id __34__CNUIUserActionItem_targetHandle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 formattedStringValue];
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 username];
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 username];
}

id __34__CNUIUserActionItem_targetHandle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  int v4 = [v3 street];
  v5 = [v3 city];
  uint64_t v6 = [v3 state];
  char v7 = [v3 postalCode];
  v8 = [v3 country];

  id v9 = [v2 stringWithFormat:@"%@, %@, %@ %@ %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)sanitizedTargetHandle
{
  v5 = [(CNUIUserActionItem *)self contactProperty];
  uint64_t v6 = [v5 key];
  char v7 = [v6 isEqualToString:*MEMORY[0x263EFE070]];
  if ((v7 & 1) != 0
    || ([(CNUIUserActionItem *)self contactProperty],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 key],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 isEqualToString:*MEMORY[0x263EFE110]]))
  {
    v8 = [(CNUIUserActionItem *)self targetHandle];
    int v9 = objc_msgSend(v8, "_cn_requiresPhoneNumberSanitizing");

    if (v7)
    {

      if (!v9) {
        goto LABEL_9;
      }
LABEL_7:
      int v10 = [(CNUIUserActionItem *)self targetHandle];
      uint64_t v11 = objc_msgSend(v10, "_cn_stringBySanitizingPhoneNumber");

      goto LABEL_10;
    }

    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
LABEL_9:
  uint64_t v11 = [(CNUIUserActionItem *)self targetHandle];
LABEL_10:
  return (NSString *)v11;
}

- (BOOL)shouldGroupByBundleIdentifier
{
  return 1;
}

- (BOOL)shouldCurateIfPerformed
{
  if (([(CNUIUserActionItem *)self options] & 2) != 0) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(CNUIUserActionItem *)self options] >> 2) & 1;
  }
  return v3;
}

- (BOOL)isSuggested
{
  return ([(CNUIUserActionItem *)self options] >> 2) & 1;
}

- (BOOL)shouldPromoteLoneActionToBeDefault
{
  return ([(CNUIUserActionItem *)self options] & 0x10) == 0;
}

- (BOOL)shouldOpenToBundleIdentifier
{
  return ([(CNUIUserActionItem *)self options] >> 5) & 1;
}

- (CNUIUserActionItem)initWithItem:(id)a3 contactProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 type];
  int v9 = [v7 bundleIdentifier];
  uint64_t v10 = [v7 group];
  uint64_t v11 = [v7 options];

  uint64_t v12 = [(CNUIUserActionItem *)self initWithType:v8 contactProperty:v6 bundleIdentifier:v9 group:v10 options:v11];
  return v12;
}

- (CNUIUserActionItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 group:(int64_t)a6 options:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNUIUserActionItem;
  id v16 = [(CNUIUserActionItem *)&v22 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_type, a3);
    objc_storeStrong((id *)&v17->_contactProperty, a4);
    uint64_t v18 = [v15 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v18;

    v17->_group = a6;
    v17->_options = a7;
    int64_t v20 = v17;
  }

  return v17;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  int v4 = [(CNUIUserActionItem *)self type];
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = [(CNUIUserActionItem *)self label];
  id v7 = (id)[v3 appendObject:v6 withName:@"label"];

  v8 = [(CNUIUserActionItem *)self targetHandle];
  id v9 = (id)[v3 appendObject:v8 withName:@"targetHandle"];

  uint64_t v10 = [(CNUIUserActionItem *)self bundleIdentifier];
  id v11 = (id)[v3 appendObject:v10 withName:@"bundleIdentifier"];

  id v12 = (id)objc_msgSend(v3, "appendName:integerValue:", @"group", -[CNUIUserActionItem group](self, "group"));
  id v13 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"options", -[CNUIUserActionItem options](self, "options"));
  id v14 = [v3 build];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __30__CNUIUserActionItem_isEqual___block_invoke;
  v24[3] = &unk_2640172E0;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__CNUIUserActionItem_isEqual___block_invoke_2;
  aBlock[3] = &unk_2640172E0;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __30__CNUIUserActionItem_isEqual___block_invoke_3;
  v20[3] = &unk_2640172E0;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  uint64_t v10 = _Block_copy(v20);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __30__CNUIUserActionItem_isEqual___block_invoke_4;
  id v17 = &unk_2640172E0;
  uint64_t v18 = self;
  id v19 = v9;
  id v11 = v9;
  id v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v11, v6, self, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  BOOL v3 = [*(id *)(a1 + 32) type];
  id v4 = [*(id *)(a1 + 40) type];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  BOOL v3 = [*(id *)(a1 + 32) label];
  id v4 = [*(id *)(a1 + 40) label];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  BOOL v3 = [*(id *)(a1 + 32) sanitizedTargetHandle];
  id v4 = [*(id *)(a1 + 40) sanitizedTargetHandle];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F335D0];
  BOOL v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  BOOL v3 = (void *)MEMORY[0x263F335E8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __26__CNUIUserActionItem_hash__block_invoke;
  v12[3] = &unk_264017308;
  v12[4] = self;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNUIUserActionItem_hash__block_invoke_2;
  aBlock[3] = &unk_264017308;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __26__CNUIUserActionItem_hash__block_invoke_3;
  v10[3] = &unk_264017308;
  v10[4] = self;
  uint64_t v5 = _Block_copy(v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __26__CNUIUserActionItem_hash__block_invoke_4;
  v9[3] = &unk_264017308;
  v9[4] = self;
  uint64_t v6 = _Block_copy(v9);
  unint64_t v7 = objc_msgSend(v3, "hashWithBlocks:", v12, v4, v5, v6, 0);

  return v7;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) type];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) label];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) targetHandle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (int64_t)group
{
  return self->_group;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSDictionary)associatedRecentContactMetadata
{
  return self->_associatedRecentContactMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedRecentContactMetadata, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8 isEligibleDefaultApp:(BOOL)a9
{
  uint64_t v12 = 5;
  if (a7)
  {
    uint64_t v12 = 6;
    unint64_t v13 = a8 | 4;
  }
  else
  {
    unint64_t v13 = a8;
  }
  if (a9) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v12;
  }
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[_CNUIUserActionDialRequestItem alloc] initWithType:v18 contactProperty:v17 bundleIdentifier:v16 dialRequest:v15 group:v14 options:v13];

  return v19;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[_CNUIUserActionDialRequestItem alloc] initWithType:v16 contactProperty:v15 bundleIdentifier:v14 dialRequest:v13 group:a7 options:a8];

  return v17;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  v30[1] = *MEMORY[0x263EF8340];
  id v13 = (objc_class *)MEMORY[0x263EFEAF0];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v13);
  id v19 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v17 value:v16];

  v30[0] = v19;
  int64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v18 setEmailAddresses:v20];

  id v21 = (void *)MEMORY[0x263EFEA30];
  uint64_t v22 = *MEMORY[0x263EFDF80];
  id v23 = [v18 emailAddresses];
  uint64_t v24 = [v23 firstObject];
  id v25 = [v24 identifier];
  v26 = [v21 contactPropertyWithContactNoCopy:v18 propertyKey:v22 identifier:v25];

  uint64_t v27 = [_CNUIUserActionDialRequestItem alloc];
  v28 = [(_CNUIUserActionDialRequestItem *)v27 initWithType:*MEMORY[0x263EFDF38] contactProperty:v26 bundleIdentifier:v14 dialRequest:v15 group:a7 options:a8];

  return v28;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return (id)[a1 _voiceItemWithLabel:a3 targetStringValue:a4 propertyKey:*MEMORY[0x263EFE070] dialRequest:a5 bundleIdentifier:a6 group:a7 options:a8];
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:dialRequest:bundleIdentifier:group:options:", a3, a4, a5, a6, a7, a8);
}

+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  v38[1] = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  id v16 = (objc_class *)MEMORY[0x263EFEAF0];
  id v17 = a7;
  id v18 = a6;
  id v19 = objc_alloc_init(v16);
  if (!(v15 | *MEMORY[0x263EFE070]) || objc_msgSend((id)v15, "isEqual:"))
  {
    int64_t v20 = a8;
    id v21 = (void *)MEMORY[0x263EFEAD0];
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFEB28], "phoneNumberWithStringValue:", v14, v35);
    id v23 = [v21 labeledValueWithLabel:v35 value:v22];
    v38[0] = v23;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
    [v19 setPhoneNumbers:v24];

    id v25 = [v19 phoneNumbers];
LABEL_7:
    v28 = v25;
    uint64_t v29 = [v25 firstObject];
    v30 = [v29 identifier];

    a8 = v20;
    goto LABEL_8;
  }
  if (!(v15 | *MEMORY[0x263EFDF80]) || objc_msgSend((id)v15, "isEqual:"))
  {
    int64_t v20 = a8;
    v26 = objc_msgSend(MEMORY[0x263EFEAD0], "labeledValueWithLabel:value:", v35, v14, v35);
    v37 = v26;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    [v19 setEmailAddresses:v27];

    id v25 = [v19 emailAddresses];
    goto LABEL_7;
  }
  v30 = 0;
LABEL_8:
  uint64_t v31 = objc_msgSend(MEMORY[0x263EFEA30], "contactPropertyWithContactNoCopy:propertyKey:identifier:", v19, v15, v30, v35);
  v32 = [_CNUIUserActionDialRequestItem alloc];
  v33 = [(_CNUIUserActionDialRequestItem *)v32 initWithType:*MEMORY[0x263EFDEF8] contactProperty:v31 bundleIdentifier:v17 dialRequest:v18 group:a8 options:a9];

  return v33;
}

+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5
{
  return +[CNUIUserActionItem actionItemForContactProperty:a3 actionType:a4 bundleIdentifier:a5 callProviderManager:0];
}

+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5 callProviderManager:(id)a6
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  id v12 = a6;
  uint64_t v13 = [v9 key];
  uint64_t v14 = *MEMORY[0x263EFE070];
  if (v13 | *MEMORY[0x263EFE070]
    && (unint64_t v15 = (void *)v13,
        [v9 key],
        id v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqual:v14],
        v16,
        v15,
        !v17))
  {
    uint64_t v31 = [v9 key];
    uint64_t v32 = *MEMORY[0x263EFDF80];
    if (v31 | *MEMORY[0x263EFDF80])
    {
      v33 = (void *)v31;
      v34 = [v9 key];
      int v35 = [v34 isEqual:v32];

      if (!v35)
      {
        uint64_t v38 = [v9 key];
        uint64_t v39 = *MEMORY[0x263EFE110];
        if (!(v38 | *MEMORY[0x263EFE110])) {
          goto LABEL_28;
        }
        v40 = (void *)v38;
        v41 = [v9 key];
        int v42 = [v41 isEqual:v39];

        if (v42) {
          goto LABEL_28;
        }
        uint64_t v43 = [v9 key];
        uint64_t v44 = *MEMORY[0x263EFE010];
        if (!(v43 | *MEMORY[0x263EFE010])) {
          goto LABEL_28;
        }
        v45 = (void *)v43;
        v46 = [v9 key];
        int v47 = [v46 isEqual:v44];

        if (!v47)
        {
          id v19 = 0;
          int64_t v20 = 0;
        }
        else
        {
LABEL_28:
          v48 = [v9 value];
          id v19 = [v48 username];

          v49 = [v9 value];
          int64_t v20 = [v49 userIdentifier];

          if (v19) {
            goto LABEL_5;
          }
        }
LABEL_29:
        v30 = 0;
        goto LABEL_30;
      }
    }
    id v19 = [v9 value];
  }
  else
  {
    id v18 = [v9 value];
    id v19 = [v18 formattedStringValue];
  }
  int64_t v20 = 0;
  if (!v19) {
    goto LABEL_29;
  }
LABEL_5:
  id v21 = [v9 key];
  unint64_t v22 = +[CNHandle handleTypeForPropertyKey:v21];

  id v23 = [[CNHandle alloc] initWithStringValue:v19 customIdentifier:v20 type:v22];
  uint64_t v24 = *MEMORY[0x263EFDEF8];
  if (!(v10 | *MEMORY[0x263EFDEF8]) || [(id)v10 isEqual:*MEMORY[0x263EFDEF8]])
  {
    if (!(v11 | *MEMORY[0x263EFDEE8]) || objc_msgSend((id)v11, "isEqual:"))
    {
      id v25 = NSURL;
      v26 = [v9 contact];
      uint64_t v27 = objc_msgSend(v25, "_cnui_telephonyURLFutureWithHandle:contact:preferDefaultApp:", v23, v26, 0);
      goto LABEL_10;
    }
    if (!(v11 | *MEMORY[0x263EFDEC0]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v37 = NSURL;
      v26 = [v9 contact];
      uint64_t v27 = objc_msgSend(v37, "_cnui_faceTimeAudioURLFutureWithHandle:contact:", v23, v26);
      goto LABEL_10;
    }
LABEL_31:
    v30 = +[CNUIUserActionItem thirdPartyCallActionItemForHandle:v23 contactProperty:v9 actionType:v10 bundleIdentifier:v11 callProviderManager:v12];
    goto LABEL_12;
  }
  uint64_t v24 = *MEMORY[0x263EFDF38];
  if (!(v10 | *MEMORY[0x263EFDF38]) || [(id)v10 isEqual:*MEMORY[0x263EFDF38]])
  {
    if (!(v11 | *MEMORY[0x263EFDEC0]) || objc_msgSend((id)v11, "isEqual:"))
    {
      id v36 = NSURL;
      v26 = [v9 contact];
      uint64_t v27 = objc_msgSend(v36, "_cnui_faceTimeVideoURLFutureWithHandle:contact:", v23, v26);
      goto LABEL_10;
    }
    goto LABEL_31;
  }
  uint64_t v24 = *MEMORY[0x263EFDF18];
  if (v10 | *MEMORY[0x263EFDF18] && ![(id)v10 isEqual:*MEMORY[0x263EFDF18]])
  {
    uint64_t v24 = *MEMORY[0x263EFDF28];
    if (v10 | *MEMORY[0x263EFDF28] && ![(id)v10 isEqual:*MEMORY[0x263EFDF28]])
    {
      uint64_t v24 = *MEMORY[0x263EFDF30];
      if (v10 | *MEMORY[0x263EFDF30] && ![(id)v10 isEqual:*MEMORY[0x263EFDF30]])
      {
        uint64_t v24 = *MEMORY[0x263EFDF10];
        if (v10 | *MEMORY[0x263EFDF10] && ![(id)v10 isEqual:*MEMORY[0x263EFDF10]])
        {
          v30 = 0;
          goto LABEL_12;
        }
        v57 = NSURL;
        v26 = [v9 contact];
        uint64_t v27 = objc_msgSend(v57, "_cnui_mailURLFutureWithHandle:contact:", v23, v26);
      }
      else
      {
        v54 = NSURL;
        v26 = [v9 contact];
        uint64_t v27 = objc_msgSend(v54, "_cnui_ttyRelayURLFutureWithHandle:contact:", v23, v26);
      }
    }
    else
    {
      v53 = NSURL;
      v26 = [v9 contact];
      uint64_t v27 = objc_msgSend(v53, "_cnui_ttyURLFutureWithHandle:contact:", v23, v26);
    }
  }
  else
  {
    if (v11 | *MEMORY[0x263EFDED8]
      && (objc_msgSend((id)v11, "isEqual:") & 1) == 0
      && v11 | *MEMORY[0x263EFDEE0]
      && !objc_msgSend((id)v11, "isEqual:"))
    {
      v55 = (void *)MEMORY[0x263F08D38];
      v56 = [v9 contact];
      v28 = objc_msgSend(v55, "_cnui_sendMessageIntentWithHandle:contact:", v23, v56);

      uint64_t v29 = +[CNUIUserActionItem itemWithType:v24 contactProperty:v9 bundleIdentifier:v11 userActivity:v28 group:0 options:0];
      goto LABEL_11;
    }
    v52 = NSURL;
    v26 = [v9 contact];
    uint64_t v27 = objc_msgSend(v52, "_cnui_messagesURLFutureWithHandle:contact:", v23, v26);
  }
LABEL_10:
  v28 = (void *)v27;

  uint64_t v29 = +[CNUIUserActionItem itemWithType:v24 contactProperty:v9 bundleIdentifier:v11 url:v28 group:0 options:0];
LABEL_11:
  v30 = (void *)v29;

LABEL_12:
LABEL_30:
  id v50 = v30;

  return v50;
}

+ (id)thirdPartyCallActionItemForHandle:(id)a3 contactProperty:(id)a4 actionType:(id)a5 bundleIdentifier:(id)a6 callProviderManager:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = (unint64_t)a5;
  id v14 = a6;
  unint64_t v15 = (CNTUCallProviderManager *)a7;
  if (v13 | *MEMORY[0x263EFDEF8]
    && (objc_msgSend((id)v13, "isEqual:") & 1) == 0
    && v13 | *MEMORY[0x263EFDF38]
    && !objc_msgSend((id)v13, "isEqual:"))
  {
    id v21 = 0;
  }
  else
  {
    if (!v15) {
      unint64_t v15 = objc_alloc_init(CNTUCallProviderManager);
    }
    id v16 = [(CNTUCallProviderManager *)v15 thirdPartyCallProviderWithBundleIdentifier:v14];
    if (v16)
    {
      uint64_t v17 = *MEMORY[0x263EFDF38];
      unint64_t v18 = v13 | *MEMORY[0x263EFDF38];
      id v19 = [v12 contact];
      if (v18) {
        uint64_t v20 = [(id)v13 isEqual:v17];
      }
      else {
        uint64_t v20 = 1;
      }
      unint64_t v22 = [v16 dialRequestForHandle:v11 contact:v19 video:v20];

      id v21 = +[CNUIUserActionItem itemWithType:v13 contactProperty:v12 bundleIdentifier:v14 dialRequest:v22 group:0 options:0];
    }
    else
    {
      id v21 = 0;
    }
  }
  return v21;
}

@end