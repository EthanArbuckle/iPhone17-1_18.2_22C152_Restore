@interface EKVirtualConference
+ (void)virtualConferenceForRoomType:(id)a3 completion:(id)a4 queue:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWritable;
- (EKVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5;
- (NSArray)joinMethods;
- (NSString)conferenceDetails;
- (NSString)serializationBlockTitle;
- (NSString)title;
- (NSURL)firstPhoneNumber;
- (NSURL)urlWithAllowedScheme;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)source;
- (void)setJoinMethods:(id)a3;
- (void)setSerializationBlockTitle:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation EKVirtualConference

- (EKVirtualConference)initWithTitle:(id)a3 joinMethods:(id)a4 conferenceDetails:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EKVirtualConference;
  v11 = [(EKVirtualConference *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    joinMethods = v11->_joinMethods;
    v11->_joinMethods = (NSArray *)v12;

    uint64_t v14 = [v10 copy];
    conferenceDetails = v11->_conferenceDetails;
    v11->_conferenceDetails = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isWritable
{
  return self->_source == 0;
}

+ (void)virtualConferenceForRoomType:(id)a3 completion:(id)a4 queue:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke;
  v48[3] = &unk_1E5B99328;
  v50 = v51;
  id v9 = v8;
  id v49 = v9;
  id v10 = (void (**)(void, void, void))MEMORY[0x1A6266730](v48);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__20;
  v46 = __Block_byref_object_dispose__20;
  id v47 = 0;
  v11 = (void *)MEMORY[0x1E4F28C70];
  uint64_t v12 = [v7 extensionBundleIdentifier];
  v13 = (id *)(v43 + 5);
  id obj = (id)v43[5];
  uint64_t v14 = [v11 extensionWithIdentifier:v12 error:&obj];
  objc_storeStrong(v13, obj);

  if (v43[5] || !v14)
  {
    v25 = (id)EKLogHandle;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = [v7 title];
      v28 = [v7 identifier];
      v29 = [v7 extensionBundleIdentifier];
      uint64_t v30 = v43[5];
      *(_DWORD *)buf = 138413058;
      v57 = v27;
      __int16 v58 = 2112;
      v59 = v28;
      __int16 v60 = 2112;
      v61 = v29;
      __int16 v62 = 2112;
      uint64_t v63 = v30;
      _os_log_error_impl(&dword_1A4E47000, v25, OS_LOG_TYPE_ERROR, "Could not load extension for room type title: %@ identifier: %@ extensionIdentifier: %@, error = %@", buf, 0x2Au);
    }
    v10[2](v10, 0, v43[5]);
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_17;
    v37[3] = &unk_1E5B99350;
    id v15 = v7;
    id v38 = v15;
    uint64_t v16 = v32;
    v39 = v16;
    id v17 = v10;
    id v40 = v17;
    [v14 setRequestCompletionBlock:v37];
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C80]);
    v55[0] = @"_EKVirutalConferenceRequestTypeJoinMethodsForRoomType";
    v54[0] = @"_EKVirtualConferenceRequestTypeKey";
    v54[1] = @"_EKVirtualConferenceRequestRoomTypeIdentifier";
    objc_super v19 = [v15 identifier];
    v55[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    [v18 setUserInfo:v20];

    id v53 = v18;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    v22 = (id *)(v43 + 5);
    id v36 = (id)v43[5];
    v23 = [v14 beginExtensionRequestWithOptions:1 inputItems:v21 error:&v36];
    objc_storeStrong(v22, v36);

    if (v43[5])
    {
      v24 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)v43[5];
        *(_DWORD *)buf = 138412802;
        v57 = v14;
        __int16 v58 = 2112;
        v59 = v23;
        __int16 v60 = 2112;
        v61 = v31;
        _os_log_error_impl(&dword_1A4E47000, v24, OS_LOG_TYPE_ERROR, "Failed to get virtual conference join methods, extension = %@ request = %@ error = %@", buf, 0x20u);
      }
      (*((void (**)(id, void, uint64_t))v17 + 2))(v17, 0, v43[5]);
    }
    else
    {
      dispatch_time_t v26 = dispatch_time(0, 20000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_30;
      block[3] = &unk_1E5B99378;
      v35 = &v42;
      id v34 = v17;
      dispatch_after(v26, v16, block);
    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v51, 8);
}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = a1;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a2;
  id v4 = a3;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (!v5)
  {
    v46 = 0;
    id v47 = 0;
    goto LABEL_35;
  }
  uint64_t v6 = v5;
  v46 = 0;
  id v47 = 0;
  uint64_t v7 = *(void *)v53;
  do
  {
    uint64_t v8 = 0;
    uint64_t v44 = v6;
    do
    {
      if (*(void *)v53 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v52 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "userInfo", v41, v42);
      v11 = [v10 objectForKey:@"_EKVirtualConferenceTypeIdentifierKey"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      uint64_t v14 = v13;
      if (v13
        && [v13 isEqualToString:@"_EKVirtualConferenceInfoTypeIdentifierKey"])
      {
        id v15 = [v9 userInfo];
        uint64_t v16 = [v15 objectForKey:@"_EKVirtualConferenceInfoTitleKey"];

        id v17 = [v9 userInfo];
        id v18 = [v17 objectForKey:@"_EKVirtualConferenceInfoDetailsKey"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_super v19 = v16;
        }
        else {
          objc_super v19 = 0;
        }
        id v20 = v19;

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v21 = v18;
        }
        else {
          v21 = 0;
        }
        id v22 = v47;
        v46 = v20;
        id v47 = v21;
      }
      else
      {
        if (![v14 isEqualToString:@"_EKVirtualConferenceJoinMethodTypeIdentifierKey"])goto LABEL_31; {
        uint64_t v23 = v7;
        }
        v24 = [v9 userInfo];
        uint64_t v16 = [v24 objectForKey:@"_EKVirtualConferenceJoinMethodTitleKey"];

        v25 = [v9 userInfo];
        id v18 = [v25 objectForKey:@"_EKVirtualConferenceJoinMethodURLKey"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          dispatch_time_t v26 = v16;
        }
        else {
          dispatch_time_t v26 = 0;
        }
        id v22 = v26;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v27 = v18;
        }
        else {
          v27 = 0;
        }
        id v28 = v27;
        if (v28)
        {
          v29 = [[EKVirtualConferenceJoinMethod alloc] initWithTitle:v22 url:v28];
          [v43 addObject:v29];
        }
        else
        {
          uint64_t v30 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v57 = v9;
            __int16 v58 = 2112;
            id v59 = v22;
            __int16 v60 = 2112;
            uint64_t v61 = 0;
            _os_log_error_impl(&dword_1A4E47000, v30, OS_LOG_TYPE_ERROR, "Skipping extension join method %@ because it has insufficient information. Title = %@ URL = %@", buf, 0x20u);
          }
        }

        uint64_t v7 = v23;
        uint64_t v6 = v44;
      }

LABEL_31:
      ++v8;
    }
    while (v6 != v8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  }
  while (v6);
LABEL_35:

  if ([v43 count])
  {
    id v32 = v46;
    v31 = v47;
    v33 = [[EKVirtualConference alloc] initWithTitle:v46 joinMethods:v43 conferenceDetails:v47];
    id v34 = 0;
    uint64_t v35 = v41;
  }
  else
  {
    id v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKVirtualConferenceError" code:0 userInfo:0];
    id v36 = (void *)EKLogHandle;
    id v32 = v46;
    v31 = v47;
    uint64_t v35 = v41;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_17_cold_1(v41, v36);
    }
    v33 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_24;
  block[3] = &unk_1E5B98410;
  v37 = *(NSObject **)(v35 + 40);
  id v38 = *(id *)(v35 + 48);
  id v50 = v34;
  id v51 = v38;
  id v49 = v33;
  id v39 = v34;
  id v40 = v33;
  dispatch_async(v37, block);
}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_24(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_30(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EKVirtualConferenceError" code:1 userInfo:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

- (NSURL)firstPhoneNumber
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(EKVirtualConference *)self joinMethods];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) URL];
      if (objc_msgSend(v7, "cal_hasSchemeTel")) {
        break;
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSURL)urlWithAllowedScheme
{
  uint64_t v2 = [(EKVirtualConference *)self joinMethods];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 URL];

  if (v4 && [MEMORY[0x1E4F576A8] conferenceURLHasAllowedScheme:v4]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EKVirtualConference *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(EKVirtualConference *)v5 joinMethods];
      uint64_t v7 = [(EKVirtualConference *)self joinMethods];
      int v8 = CalEqualObjects();

      long long v9 = [(EKVirtualConference *)v5 conferenceDetails];
      long long v10 = [(EKVirtualConference *)self conferenceDetails];
      int v11 = CalEqualStrings();

      long long v12 = [(EKVirtualConference *)v5 title];
      id v13 = [(EKVirtualConference *)self title];
      char v14 = CalEqualStrings();

      uint64_t v15 = [(EKVirtualConference *)v5 source];
      unint64_t v16 = [(EKVirtualConference *)self source];
      BOOL v17 = 0;
      if (v8 && v11)
      {
        if (v15 == v16) {
          BOOL v17 = v14;
        }
        else {
          BOOL v17 = 0;
        }
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  uint64_t v2 = NSString;
  joinMethods = self->_joinMethods;
  conferenceDetails = self->_conferenceDetails;
  title = self->_title;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_source];
  uint64_t v7 = [v2 stringWithFormat:@"EKVirtualConference title: %@, conferenceDetails: %@, joinMethods: %@, source: %@", title, conferenceDetails, joinMethods, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [EKVirtualConference alloc];
  id v5 = [(EKVirtualConference *)self title];
  uint64_t v6 = [(EKVirtualConference *)self joinMethods];
  uint64_t v7 = [(EKVirtualConference *)self conferenceDetails];
  int v8 = [(EKVirtualConference *)v4 initWithTitle:v5 joinMethods:v6 conferenceDetails:v7];

  [(EKVirtualConference *)v8 setSource:self->_source];
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)joinMethods
{
  return self->_joinMethods;
}

- (void)setJoinMethods:(id)a3
{
}

- (NSString)conferenceDetails
{
  return self->_conferenceDetails;
}

- (NSString)serializationBlockTitle
{
  return self->_serializationBlockTitle;
}

- (void)setSerializationBlockTitle:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationBlockTitle, 0);
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_joinMethods, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

void __69__EKVirtualConference_virtualConferenceForRoomType_completion_queue___block_invoke_17_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 extensionBundleIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Extension %@ did not provide any join methods.", v5, 0xCu);
}

@end