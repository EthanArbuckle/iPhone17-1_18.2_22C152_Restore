@interface WFTrelloCardContentItem
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (id)card;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFTrelloCardContentItem

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Trello cards");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trello cards", @"Trello cards");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trello card", @"Trello card");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)propertyBuilders
{
  v13[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33808] block:&__block_literal_global_35698 name:@"Description" class:objc_opt_class()];
  id v3 = [v2 userInfo:@"WFTrelloDescriptionProperty"];
  v13[0] = v3;
  v4 = [MEMORY[0x263F33808] block:&__block_literal_global_163_35700 name:@"URL" class:objc_opt_class()];
  v5 = [v4 userInfo:@"WFTrelloURLProperty"];
  v13[1] = v5;
  v6 = [MEMORY[0x263F33808] block:&__block_literal_global_169 name:@"Card Due Date" class:objc_opt_class()];
  v7 = [v6 userInfo:@"WFTrelloDueDateProperty"];
  v13[2] = v7;
  v8 = [MEMORY[0x263F33808] block:&__block_literal_global_175_35704 name:@"Card Attachments" class:objc_opt_class()];
  v9 = [v8 multipleValues:1];
  v10 = [v9 userInfo:@"WFTrelloAttachmentsProperty"];
  v13[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];

  return v11;
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = a2;
  v7 = +[WFAccount accounts];
  v8 = [v7 firstObject];

  v9 = [WFTrelloSessionManager alloc];
  v10 = [v8 token];
  v11 = [(WFTrelloSessionManager *)v9 initWithConfiguration:0 token:v10];

  v12 = [v6 card];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_5;
  v14[3] = &unk_264E5CE88;
  id v15 = v5;
  id v13 = v5;
  [(WFTrelloSessionManager *)v11 getAttachmentsOnCard:v12 completionHandler:v14];
}

uint64_t __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v8 = [a2 card];
  v7 = [v8 dueDate];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v8 = [a2 card];
  v7 = [v8 URL];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

void __43__WFTrelloCardContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 card];
  id v8 = [v6 itemDescription];

  if ([v8 length]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  ((void (**)(id, id))v5)[2](v5, v7);
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    id v8 = (void *)MEMORY[0x263F33908];
    v9 = [(WFTrelloCardContentItem *)self card];
    v10 = [v9 URL];
    v11 = [(WFTrelloCardContentItem *)self name];
    id v7 = [v8 object:v10 named:v11];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x263F33908];
    v9 = [(WFTrelloCardContentItem *)self card];
    v10 = [v9 dueDate];
    id v7 = [v12 object:v10];
  }

LABEL_7:
  return v7;
}

- (id)card
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFTrelloCardContentItem *)self objectForClass:v3];
}

@end