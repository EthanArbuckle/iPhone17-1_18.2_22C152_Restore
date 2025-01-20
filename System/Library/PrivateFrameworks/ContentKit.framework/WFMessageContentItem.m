@interface WFMessageContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFMessage)message;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFMessageContentItem

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((Class)objc_opt_class() != a3)
  {
    if ((Class)objc_opt_class() != a3)
    {
      v18.receiver = self;
      v18.super_class = (Class)WFMessageContentItem;
      v9 = [(WFContentItem *)&v18 generateObjectRepresentationsForClass:a3 options:v8 error:a5];
      goto LABEL_11;
    }
    v14 = [(WFMessageContentItem *)self message];
    v15 = [v14 senderHandles];
    v12 = objc_msgSend(v15, "if_compactMap:", &__block_literal_global_38_18357);

    if ([v12 count])
    {
      v13 = @"Email addresses";
      goto LABEL_8;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v10 = [(WFMessageContentItem *)self message];
  v11 = [v10 senderHandles];
  v12 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_18353);

  if (![v12 count]) {
    goto LABEL_9;
  }
  v13 = @"Phone numbers";
LABEL_8:
  v16 = WFLocalizedContentPropertyNameMarker(v13);
  v9 = +[WFObjectRepresentation objects:v12 named:v16];

LABEL_10:
LABEL_11:

  return v9;
}

id __76__WFMessageContentItem_generateObjectRepresentationsForClass_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[WFContact predictedTypeForHandleValue:v2] == 1)
  {
    v3 = +[WFEmailAddress addressWithEmailAddress:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __76__WFMessageContentItem_generateObjectRepresentationsForClass_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[WFContact predictedTypeForHandleValue:v2])
  {
    v3 = 0;
  }
  else
  {
    v3 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:v2];
  }

  return v3;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v7 = [(WFMessageContentItem *)self message];
    id v8 = [v7 content];
    v6 = +[WFObjectRepresentation object:v8];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (WFMessage)message
{
  uint64_t v3 = objc_opt_class();
  return (WFMessage *)[(WFContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Messages");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Messages", @"Messages");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Message", @"Message");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Sharing";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v12[3] = *MEMORY[0x263EF8340];
  id v2 = WFLocalizedContentPropertyNameMarker(@"Content");
  id v3 = +[WFContentPropertyBuilder keyPath:@"message.content" name:v2 class:objc_opt_class()];
  v4 = WFLocalizedContentPropertyNameMarker(@"Recipients");
  v5 = +[WFContentPropertyBuilder keyPath:@"message.recipients", v4, objc_opt_class(), v3 name class];
  v6 = [v5 multipleValues:1];
  v12[1] = v6;
  v7 = WFLocalizedContentPropertyNameMarker(@"Sender");
  id v8 = +[WFContentPropertyBuilder keyPath:@"message.senderHandles" name:v7 class:objc_opt_class()];
  v9 = [v8 multipleValues:1];
  v12[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v10;
}

@end