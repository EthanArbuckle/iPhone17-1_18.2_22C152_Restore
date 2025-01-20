@interface EKVirtualConferenceExtensionContext
+ (id)_allowedItemPayloadClasses;
- (NSDate)renewalDate;
- (NSString)roomTypeIdentifier;
- (NSURL)URLForInvalidation;
- (NSURL)URLForRenewal;
- (int)requestType;
- (void)completeRequestWithAvailableRoomTypes:(id)a3 completionHandler:(id)a4;
- (void)completeRequestWithInvalidationSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5;
- (void)completeRequestWithRenewalSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5;
- (void)completeRequestWithVirtualConference:(id)a3 completionHandler:(id)a4;
@end

@implementation EKVirtualConferenceExtensionContext

+ (id)_allowedItemPayloadClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (int)requestType
{
  v2 = [(EKVirtualConferenceExtensionContext *)self inputItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"_EKVirtualConferenceRequestTypeKey"];

  if ([@"_EKVirtualConferenceRequestTypeRoomTypes" isEqualToString:v5])
  {
    int v6 = 1;
  }
  else if ([@"_EKVirutalConferenceRequestTypeJoinMethodsForRoomType" isEqualToString:v5])
  {
    int v6 = 2;
  }
  else if ([@"_EKVirtualConferenceRequestTypeURLInvalidate" isEqualToString:v5])
  {
    int v6 = 5;
  }
  else if ([@"_EKVirtualConferenceRequestTypeURLRenew" isEqualToString:v5])
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (NSString)roomTypeIdentifier
{
  v2 = [(EKVirtualConferenceExtensionContext *)self inputItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"_EKVirtualConferenceRequestRoomTypeIdentifier"];

  return (NSString *)v5;
}

- (NSURL)URLForInvalidation
{
  v2 = [(EKVirtualConferenceExtensionContext *)self inputItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"_EKVirtualConferenceRequestURLParameterForInvalidation"];

  return (NSURL *)v5;
}

- (NSURL)URLForRenewal
{
  v2 = [(EKVirtualConferenceExtensionContext *)self inputItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"_EKVirtualConferenceRequestURLParameterForRenewal"];

  return (NSURL *)v5;
}

- (NSDate)renewalDate
{
  v2 = [(EKVirtualConferenceExtensionContext *)self inputItems];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 userInfo];
  v5 = [v4 objectForKey:@"_EKVirtualConferenceRequestDateParameterForRenewal"];

  return (NSDate *)v5;
}

- (void)completeRequestWithAvailableRoomTypes:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  if ([(EKVirtualConferenceExtensionContext *)self requestType] != 1)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"EKVirtualConferenceExtensionContext.m" lineNumber:115 description:@"Invalid completion method called for request type"];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = objc_alloc_init(MEMORY[0x1E4F28C80]);
        v26[0] = @"_EKVirtualConferenceRoomTypeTitleKey";
        v15 = [v13 title];
        v26[1] = @"_EKVirtualConferenceRoomTypeIdentifierKey";
        v27[0] = v15;
        v16 = [v13 identifier];
        v27[1] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        [v14 setUserInfo:v17];

        [v8 addObject:v14];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v8 count]) {
    v18 = v8;
  }
  else {
    v18 = 0;
  }
  [(EKVirtualConferenceExtensionContext *)self completeRequestReturningItems:v18 completionHandler:v20];
}

- (void)completeRequestWithVirtualConference:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  if ([(EKVirtualConferenceExtensionContext *)self requestType] != 2)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"EKVirtualConferenceExtensionContext.m" lineNumber:130 description:@"Invalid completion method called for request type"];
  }
  v34 = self;
  v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v9 = [v7 URLDescriptors];
  v37 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v35 = v7;
  id obj = [v7 URLDescriptors];
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v15 = objc_alloc_init(MEMORY[0x1E4F28C80]);
        v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
        [v16 setObject:@"_EKVirtualConferenceJoinMethodTypeIdentifierKey" forKey:@"_EKVirtualConferenceTypeIdentifierKey"];
        v17 = [v14 URL];
        [v16 setObject:v17 forKey:@"_EKVirtualConferenceJoinMethodURLKey"];

        v18 = [v14 title];
        uint64_t v19 = [v18 length];

        if (v19)
        {
          id v20 = [v14 title];
          [v16 setObject:v20 forKey:@"_EKVirtualConferenceJoinMethodTitleKey"];
        }
        [v15 setUserInfo:v16];
        [v37 addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  v21 = [v35 URLDescriptors];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    long long v23 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v24 = [v35 title];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = [v35 title];
      [v23 setObject:v26 forKey:@"_EKVirtualConferenceInfoTitleKey"];
    }
    v27 = [v35 conferenceDetails];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      uint64_t v29 = [v35 conferenceDetails];
      [v23 setObject:v29 forKey:@"_EKVirtualConferenceInfoDetailsKey"];
    }
    if ([v23 count])
    {
      [v23 setObject:@"_EKVirtualConferenceInfoTypeIdentifierKey" forKey:@"_EKVirtualConferenceTypeIdentifierKey"];
      id v30 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      [v30 setUserInfo:v23];
      [v37 addObject:v30];
    }
  }
  if ([v37 count]) {
    v31 = v37;
  }
  else {
    v31 = 0;
  }
  [(EKVirtualConferenceExtensionContext *)v34 completeRequestReturningItems:v31 completionHandler:v33];
}

- (void)completeRequestWithInvalidationSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(EKVirtualConferenceExtensionContext *)self requestType] != 5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"EKVirtualConferenceExtensionContext.m" lineNumber:171 description:@"Invalid completion method called for request type"];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  if (v5)
  {
    uint64_t v19 = @"_EKVirtualConferenceInvalidationResultKey";
    v20[0] = @"_EKVirtualConferenceInvalidationResultSucceeded";
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = (__CFString **)v20;
    uint64_t v12 = &v19;
  }
  else
  {
    v17 = @"_EKVirtualConferenceInvalidationResultKey";
    v18 = @"_EKVirtualConferenceInvalidationResultFailed";
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = &v18;
    uint64_t v12 = &v17;
  }
  v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  [v9 setUserInfo:v13];

  id v16 = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [(EKVirtualConferenceExtensionContext *)self completeRequestReturningItems:v14 completionHandler:v8];
}

- (void)completeRequestWithRenewalSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([(EKVirtualConferenceExtensionContext *)self requestType] != 4)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"EKVirtualConferenceExtensionContext.m" lineNumber:186 description:@"Invalid completion method called for request type"];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v13 = v12;
  if (v6) {
    id v14 = @"_EKVirtualConferenceRenewalResultSucceeded";
  }
  else {
    id v14 = @"_EKVirtualConferenceRenewalResultFailed";
  }
  [v12 setObject:v14 forKey:@"_EKVirtualConferenceRenewalResultKey"];
  if (v9) {
    [v13 setObject:v9 forKey:@"_EKVirtualConferenceErrorResultKey"];
  }
  [v11 setUserInfo:v13];
  v17[0] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [(EKVirtualConferenceExtensionContext *)self completeRequestReturningItems:v15 completionHandler:v10];
}

@end