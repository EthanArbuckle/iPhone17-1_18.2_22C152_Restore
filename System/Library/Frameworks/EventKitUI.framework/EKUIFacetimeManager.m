@interface EKUIFacetimeManager
+ (BOOL)canFaceTime:(unint64_t)a3 withContacts:(id)a4;
+ (BOOL)canFaceTime:(unint64_t)a3 withParticipants:(id)a4;
+ (BOOL)faceTimeAvailable:(unint64_t)a3;
+ (id)faceTimeURLForType:(unint64_t)a3 andHandle:(id)a4;
+ (id)faceTimeURLForType:(unint64_t)a3 withContacts:(id)a4;
+ (id)faceTimeURLForType:(unint64_t)a3 withHandles:(id)a4;
+ (id)faceTimeURLForType:(unint64_t)a3 withParticipants:(id)a4;
+ (id)handlesForContacts:(id)a3;
+ (id)handlesForParticipants:(id)a3;
+ (id)preferredHandleForContact:(id)a3 withDefaultPhoneNumber:(id)a4 emailAddress:(id)a5;
+ (void)startFaceTime:(unint64_t)a3 withContacts:(id)a4;
+ (void)startFaceTime:(unint64_t)a3 withParticipants:(id)a4;
@end

@implementation EKUIFacetimeManager

+ (id)preferredHandleForContact:(id)a3 withDefaultPhoneNumber:(id)a4 emailAddress:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)EKWeakLinkClass();
  id v11 = v8;
  id v12 = v9;
  v13 = [v7 phoneNumbers];
  uint64_t v14 = [v13 count];

  v15 = v11;
  if (v14)
  {
    v16 = [v7 phoneNumbers];
    v17 = [v16 objectAtIndexedSubscript:0];

    v18 = [v17 value];
    v15 = [v18 stringValue];
  }
  v19 = [v7 emailAddresses];
  uint64_t v20 = [v19 count];

  v21 = v12;
  if (v20)
  {
    v22 = [v7 emailAddresses];
    v23 = [v22 objectAtIndexedSubscript:0];

    v21 = [v23 value];
  }
  if (v15)
  {
    id v24 = [v10 alloc];
    uint64_t v25 = 2;
    v26 = v15;
LABEL_9:
    v27 = (void *)[v24 initWithType:v25 value:v26];
    goto LABEL_10;
  }
  if (v21)
  {
    id v24 = [v10 alloc];
    uint64_t v25 = 3;
    v26 = v21;
    goto LABEL_9;
  }
  v27 = 0;
LABEL_10:

  return v27;
}

+ (id)handlesForParticipants:(id)a3
{
  id v3 = a3;
  EKWeakLinkClass();
  [MEMORY[0x1E4F1CA48] array];
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  CalendarFoundationPerformBlockOnSharedContactStore();
  id v5 = v8;

  return v5;
}

void __46__EKUIFacetimeManager_handlesForParticipants___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v21 = *MEMORY[0x1E4F1AEE0];
    uint64_t v20 = *MEMORY[0x1E4F1ADC8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "phoneNumber", v20, v21);
        id v9 = [v7 emailAddress];
        if (v9) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
LABEL_14:
          id v16 = objc_alloc(*(Class *)(a1 + 56));
          uint64_t v17 = 2;
          v18 = v8;
          goto LABEL_15;
        }
        v28[0] = v21;
        v28[1] = v20;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
        id v12 = [v7 contactPredicate];
        v13 = [v22 unifiedContactsMatchingPredicate:v12 keysToFetch:v11 error:0];

        if ([v13 count])
        {
          uint64_t v14 = [v13 objectAtIndexedSubscript:0];
          v15 = [*(id *)(a1 + 48) preferredHandleForContact:v14 withDefaultPhoneNumber:v8 emailAddress:v9];

          if (v15) {
            goto LABEL_16;
          }
          if (v8) {
            goto LABEL_14;
          }
        }
        else
        {

          if (v8) {
            goto LABEL_14;
          }
        }
        if (v9)
        {
          id v16 = objc_alloc(*(Class *)(a1 + 56));
          uint64_t v17 = 3;
          v18 = v9;
LABEL_15:
          v15 = (void *)[v16 initWithType:v17 value:v18];
          if (!v15) {
            goto LABEL_17;
          }
LABEL_16:
          [*(id *)(a1 + 40) addObject:v15];
        }
LABEL_17:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v4 = v19;
    }
    while (v19);
  }
}

+ (id)handlesForContacts:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "preferredHandleForContact:withDefaultPhoneNumber:emailAddress:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, 0, (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)faceTimeAvailable:(unint64_t)a3
{
  id v4 = [(id)EKWeakLinkClass() defaultCapabilitiesManager];
  uint64_t v5 = v4;
  if (a3) {
    int v6 = 1;
  }
  else {
    int v6 = [v4 isFaceTimeAudioAvailable];
  }
  if ([v5 isFaceTimeAppAvailable]) {
    int v7 = [v5 isConferencingAvailable] & v6;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)canFaceTime:(unint64_t)a3 withParticipants:(id)a4
{
  id v6 = a4;
  if ([a1 faceTimeAvailable:a3])
  {
    int v7 = [a1 handlesForParticipants:v6];
    uint64_t v8 = [v7 count];
    BOOL v9 = v8 == [v6 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)canFaceTime:(unint64_t)a3 withContacts:(id)a4
{
  id v6 = a4;
  if ([a1 faceTimeAvailable:a3])
  {
    int v7 = [a1 handlesForContacts:v6];
    uint64_t v8 = [v7 count];
    BOOL v9 = v8 == [v6 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)faceTimeURLForType:(unint64_t)a3 andHandle:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)EKWeakLinkClass();
  int v7 = (objc_class *)EKWeakLinkClass();
  id v8 = objc_alloc_init(v6);
  BOOL v9 = [v8 faceTimeProvider];
  BOOL v10 = (void *)[[v7 alloc] initWithProvider:v9];
  [v10 setHandle:v5];

  [v10 setVideo:a3 == 1];
  id v11 = [v10 URL];

  return v11;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withHandles:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = (objc_class *)EKWeakLinkClass();
  uint64_t v8 = EKWeakLinkClass();
  if ([v6 count] == 1)
  {
    BOOL v9 = [v6 firstObject];
    id v10 = [a1 faceTimeURLForType:a3 andHandle:v9];

    goto LABEL_16;
  }
  id v22 = (objc_class *)v8;
  id v11 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13) {
    goto LABEL_15;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      if ([(objc_class *)v7 instancesRespondToSelector:sel_initWithHandle_nickname_])
      {
        uint64_t v18 = [[v7 alloc] initWithHandle:v17 nickname:0];
      }
      else
      {
        if (![(objc_class *)v7 instancesRespondToSelector:sel_initWithHandle_])continue; {
        uint64_t v18 = [[v7 alloc] initWithHandle:v17];
        }
      }
      uint64_t v19 = (void *)v18;
      [v11 addObject:v18];
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v14);
LABEL_15:

  uint64_t v20 = (void *)[[v22 alloc] initWithRemoteMembers:v11];
  [v20 setVideoEnabled:0];
  id v10 = [v20 URL];

LABEL_16:

  return v10;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withParticipants:(id)a4
{
  id v6 = a4;
  int v7 = [(id)objc_opt_class() handlesForParticipants:v6];

  uint64_t v8 = [a1 faceTimeURLForType:a3 withHandles:v7];

  return v8;
}

+ (id)faceTimeURLForType:(unint64_t)a3 withContacts:(id)a4
{
  id v6 = a4;
  int v7 = [(id)objc_opt_class() handlesForContacts:v6];

  uint64_t v8 = [a1 faceTimeURLForType:a3 withHandles:v7];

  return v8;
}

+ (void)startFaceTime:(unint64_t)a3 withParticipants:(id)a4
{
  id v5 = [a1 faceTimeURLForType:a3 withParticipants:a4];
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openURL:v5 configuration:0 completionHandler:&__block_literal_global_62];
}

void __54__EKUIFacetimeManager_startFaceTime_withParticipants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when FaceTime URL tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (void)startFaceTime:(unint64_t)a3 withContacts:(id)a4
{
  id v5 = [a1 faceTimeURLForType:a3 withContacts:a4];
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openURL:v5 configuration:0 completionHandler:&__block_literal_global_36];
}

void __50__EKUIFacetimeManager_startFaceTime_withContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when FaceTime URL tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end