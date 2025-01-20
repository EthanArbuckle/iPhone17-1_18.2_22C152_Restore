@interface SAGenericCommand
- (int64_t)resultCallbackCode;
@end

@implementation SAGenericCommand

- (int64_t)resultCallbackCode
{
  v3 = [(SAGenericCommand *)self className];
  if ([v3 isEqualToString:SACommandFailedClassIdentifier])
  {
    v4 = [(SAGenericCommand *)self properties];
    v5 = [v4 objectForKey:SACommandFailedErrorCodePListKey];
    id v6 = [v5 integerValue];

    if (v6) {
      int64_t v7 = (int64_t)v6;
    }
    else {
      int64_t v7 = -1;
    }
    goto LABEL_16;
  }
  if ([v3 isEqualToString:SACommandSucceededClassIdentifier])
  {
LABEL_6:
    int64_t v7 = 0;
    goto LABEL_16;
  }
  if ([v3 isEqualToString:SAPhoneSearchCompletedClassIdentifier])
  {
    v8 = [(SAGenericCommand *)self properties];
    v9 = [v8 objectForKey:SAPhoneSearchCompletedPhoneSearchResultsPListKey];

    id v10 = [v9 count];
    v11 = (int64_t *)&SAPhonePhoneSearchHasResultsErrorCode;
    if (!v10) {
      v11 = (int64_t *)&SAPhonePhoneSearchHasNoResultsErrorCode;
    }
    int64_t v7 = *v11;
  }
  else
  {
    if (([v3 isEqualToString:SACFFlowCompletedClassIdentifier] & 1) == 0
      && ![v3 isEqualToString:SACFProviderCompletedClassIdentifier])
    {
      goto LABEL_6;
    }
    v12 = [(SAGenericCommand *)self properties];
    v13 = [v12 objectForKey:SACFAbstractClientCommandCompletedStatusPListKey];
    id v14 = [v13 integerValue];

    if (v14 == (id)SACFSuccessErrorCode) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = (int64_t)v14;
    }
  }
LABEL_16:

  return v7;
}

@end