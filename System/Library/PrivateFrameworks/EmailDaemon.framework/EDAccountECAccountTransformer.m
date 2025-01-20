@interface EDAccountECAccountTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformAccount:(id)a3;
- (id)transformDeliveryAccount:(id)a3;
- (id)transformReceivingAccount:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation EDAccountECAccountTransformer

- (id)transformAccount:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F35FE498])
  {
    uint64_t v5 = [(EDAccountECAccountTransformer *)self transformReceivingAccount:v4];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 conformsToProtocol:&unk_1F35FE570])
  {
    uint64_t v5 = [(EDAccountECAccountTransformer *)self transformDeliveryAccount:v4];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

void __59__EDAccountECAccountTransformer_transformReceivingAccount___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [*(id *)(a1 + 32) username];
  [v10 setUsername:v3];

  id v4 = [*(id *)(a1 + 32) statisticsKind];
  [v10 setStatisticsKind:v4];

  objc_msgSend(v10, "setSourceIsManaged:", objc_msgSend(*(id *)(a1 + 32), "sourceIsManaged"));
  uint64_t v5 = [*(id *)(a1 + 32) emailAddresses];
  [v10 setEmailAddresses:v5];

  objc_msgSend(v10, "setShouldArchiveByDefault:", objc_msgSend(*(id *)(a1 + 32), "shouldArchiveByDefault"));
  objc_msgSend(v10, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "primaryiCloudAccount"));
  objc_msgSend(v10, "setIsLocalAccount:", objc_msgSend(*(id *)(a1 + 32), "isLocalAccount"));
  v6 = [*(id *)(a1 + 32) deliveryAccount];

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(a1 + 32) deliveryAccount];
    v9 = [v7 transformDeliveryAccount:v8];
    [v10 setDeliveryAccount:v9];
  }
}

void __58__EDAccountECAccountTransformer_transformDeliveryAccount___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [*(id *)(a1 + 32) username];
  [v4 setUsername:v3];

  objc_msgSend(v4, "setMaximumMessageBytes:", objc_msgSend(*(id *)(a1 + 32), "maximumMessageBytes"));
  objc_msgSend(v4, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "primaryiCloudAccount"));
}

- (id)transformDeliveryAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60400]);
  uint64_t v5 = [v3 identifier];
  v6 = (void *)[v4 initWithRepresentedObjectID:v5];

  v7 = [v3 displayName];
  v8 = [v3 hostname];
  id v9 = objc_alloc(MEMORY[0x1E4F60288]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__EDAccountECAccountTransformer_transformDeliveryAccount___block_invoke;
  v13[3] = &unk_1E6BFF150;
  id v10 = v3;
  id v14 = v10;
  v11 = (void *)[v9 initWithObjectID:v6 name:v7 hostname:v8 builder:v13];

  return v11;
}

- (id)transformReceivingAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F60400]);
  v6 = [v4 identifier];
  v7 = (void *)[v5 initWithRepresentedObjectID:v6];

  v8 = [v4 displayName];
  uint64_t v9 = [v4 hostname];
  id v10 = (void *)v9;
  v11 = &stru_1F3583658;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F60428]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__EDAccountECAccountTransformer_transformReceivingAccount___block_invoke;
  v17[3] = &unk_1E6BFF128;
  id v14 = v4;
  id v18 = v14;
  v19 = self;
  v15 = (void *)[v13 initWithObjectID:v7 name:v8 hostname:v12 builder:v17];

  return v15;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F35F2708])
  {
    id v5 = [(EDAccountECAccountTransformer *)self transformAccount:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end