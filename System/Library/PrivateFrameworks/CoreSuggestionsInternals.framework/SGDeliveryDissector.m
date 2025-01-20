@interface SGDeliveryDissector
- (id)_createEnrichmentsForDetections:(id)a3 entity:(id)a4 foundInString:(id)a5;
- (id)createEnrichmentWithMatch:(id)a3 onParentEntity:(id)a4 foundInString:(id)a5;
- (void)_logDeliverySenderForSenderDomain:(id)a3;
- (void)_logUniqueEnrichments:(id)a3;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGDeliveryDissector

- (void)_logUniqueEnrichments:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(v3, "_pas_leftFoldWithInitialObject:accumulate:", v4, &__block_literal_global_3824);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v5 = [v9 count];
  if (v5 >= 0xA) {
    uint64_t v6 = 10;
  }
  else {
    uint64_t v6 = v5;
  }
  v7 = +[SGRTCLogging defaultLogger];
  v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"SGDelivery_ctNumUniq_%lu", v6);
  [v7 logAggregateSummaryForInteraction:v8];
}

id __45__SGDeliveryDissector__logUniqueEnrichments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 duplicateKey];
  [v6 entityType];
  char IsDelivery = SGEntityTypeIsDelivery();

  if (IsDelivery)
  {
    v8 = [v5 duplicateKey];
    id v9 = [v8 deliveryKey];

    v10 = [v9 externalIdentifier];
    char v11 = [v4 containsObject:v10];

    if ((v11 & 1) == 0)
    {
      v12 = [v9 externalIdentifier];
      uint64_t v13 = [v4 setByAddingObject:v12];

      v14 = +[SGRTCLogging defaultLogger];
      id v15 = [NSString alloc];
      v16 = objc_msgSend(MEMORY[0x1E4F5D9D0], "stringForProvider:", objc_msgSend(v9, "provider"));
      v17 = (void *)[v15 initWithFormat:@"SGDelivery_pr_%@", v16];
      [v14 logAggregateSummaryForInteraction:v17];

      id v4 = (id)v13;
    }
    id v18 = v4;
  }
  else
  {
    id v18 = v4;
  }

  return v18;
}

- (void)_logDeliverySenderForSenderDomain:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:@"com.apple.suggestions.deliveries.domain"];
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 record:v6];
  }
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  v8 = [v7 message];
  id v9 = [v8 textContent];

  if (v9)
  {
    v10 = [v14 plainTextDetectedData];
    char v11 = [(SGDeliveryDissector *)self _createEnrichmentsForDetections:v10 entity:v7 foundInString:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  [v7 addEnrichments:v11];
  v12 = +[SGRTCLogging defaultLogger];
  uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"SGDelivery_ctTxtMsg_%lu", objc_msgSend(v11, "count"));
  [v12 logAggregateSummaryForInteraction:v13];

  [(SGDeliveryDissector *)self _logUniqueEnrichments:v11];
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1CB79B230]();
  char v11 = [v28 subject];
  if (v11)
  {
    v12 = [v28 messageSubjectDetectedData];
    uint64_t v13 = [(SGDeliveryDissector *)self _createEnrichmentsForDetections:v12 entity:v8 foundInString:v11];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v8 addEnrichments:v13];
  id v14 = +[SGRTCLogging defaultLogger];
  id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"SGDelivery_ctEmlSub_%lu", objc_msgSend(v13, "count"));
  [v14 logAggregateSummaryForInteraction:v15];

  v16 = (void *)MEMORY[0x1CB79B230]();
  v17 = [v28 textContent];
  if (v17)
  {
    id v18 = [v28 plainTextDetectedData];
    v19 = [(SGDeliveryDissector *)self _createEnrichmentsForDetections:v18 entity:v8 foundInString:v17];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v8 addEnrichments:v19];
  v20 = +[SGRTCLogging defaultLogger];
  v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"SGDelivery_ctEmlBod_%lu", objc_msgSend(v19, "count"));
  [v20 logAggregateSummaryForInteraction:v21];

  v22 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v23 = [v13 count];
  if (v23 + [v19 count])
  {
    v24 = [v28 senderDomain];

    if (v24)
    {
      v25 = [v28 senderDomain];
      [(SGDeliveryDissector *)self _logDeliverySenderForSenderDomain:v25];
    }
  }
  v26 = (void *)MEMORY[0x1CB79B230]();
  v27 = [v13 arrayByAddingObjectsFromArray:v19];
  [(SGDeliveryDissector *)self _logUniqueEnrichments:v27];
}

- (id)_createEnrichmentsForDetections:(id)a3 entity:(id)a4 foundInString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__SGDeliveryDissector__createEnrichmentsForDetections_entity_foundInString___block_invoke;
    v13[3] = &unk_1E65B5C00;
    v13[4] = self;
    id v14 = v9;
    id v15 = v10;
    char v11 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v13);
  }
  else
  {
    char v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

id __76__SGDeliveryDissector__createEnrichmentsForDetections_entity_foundInString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 matchType] == 7)
  {
    id v4 = (void *)MEMORY[0x1CB79B230]();
    id v5 = [*(id *)(a1 + 32) createEnrichmentWithMatch:v3 onParentEntity:*(void *)(a1 + 40) foundInString:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)createEnrichmentWithMatch:(id)a3 onParentEntity:(id)a4 foundInString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 valueString];
  if (v10) {
    goto LABEL_2;
  }
  [v7 valueRange];
  if (!v16) {
    goto LABEL_7;
  }
  NSUInteger v17 = [v9 length];
  v25.location = [v7 valueRange];
  v25.length = v18;
  v24.location = 0;
  v24.length = v17;
  NSRange v19 = NSIntersectionRange(v24, v25);
  id v15 = 0;
  if (v19.location == [v7 valueRange] && v19.length == v20)
  {
    v21 = (void *)MEMORY[0x1CB79B230]();
    id v10 = objc_msgSend(v9, "substringWithRange:", v19.location, v19.length);
    if (v10)
    {
LABEL_2:
      char v11 = [v7 labelString];
      v12 = [v7 valueString];
      uint64_t v13 = [v8 duplicateKey];
      id v14 = +[SGDuplicateKey duplicateKeyForDeliveryWithProviderString:v11 trackingNumber:v12 parentKey:v13];

      id v15 = [[SGPipelineEnrichment alloc] initWithDuplicateKey:v14 title:@"DTN" parent:v8];
      [v8 creationTimestamp];
      -[SGPipelineEnrichment setCreationTimestamp:](v15, "setCreationTimestamp:");

      goto LABEL_8;
    }
LABEL_7:
    id v15 = 0;
  }
LABEL_8:

  return v15;
}

@end