@interface ADGenericIntentResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADGenericIntentResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_alloc_init(ADSiriRequestSucceededResponseTransformer);
    v11 = [(ADSiriRequestSucceededResponseTransformer *)v10 aceCommandForSiriResponse:v7 responseError:v8 forRequestCommand:v9];

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v7 responseCode];
    if (v12 == (id)2)
    {
      v13 = (uint64_t *)&SAIntentGroupIntentEnabledAppHasNoResultsErrorCode;
    }
    else
    {
      if (v12 != (id)1)
      {
        uint64_t v15 = -1;
        goto LABEL_11;
      }
      v13 = (uint64_t *)&SAIntentGroupIntentEnabledAppDoesNotSupportIntentErrorCode;
    }
    uint64_t v15 = *v13;
LABEL_11:
    objc_msgSend(v9, "ad_aceResponseCommandRepresentationWithErrorCode:reason:", v15, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  id v14 = objc_alloc_init((Class)SACommandFailed);
LABEL_12:
  v11 = v14;
LABEL_13:

  return v11;
}

@end