@interface IMCTXPCServiceSubscriptionInfo
- (BOOL)__im_containsPhoneNumber:(id)a3;
- (BOOL)__im_hasMultipleSubscriptions;
- (BOOL)__im_onlyHasActiveSlots;
- (CTXPCServiceSubscriptionInfo)subscriptionInfo;
- (IMCTXPCServiceSubscriptionInfo)initWithSubscriptionInfo:(id)a3;
- (NSArray)phoneNumbersOfActiveSubscriptions;
- (id)__imSIMIDForSubscriptionSlot:(int64_t)a3;
- (id)__im_contactPreferredSubscriptionContextForChatHandleIDs:(id)a3;
- (id)__im_labelForPhoneNumber:(id)a3 simID:(id)a4;
- (id)__im_phoneNumberForSlotID:(int64_t)a3;
- (id)__im_phoneNumberForSlotIDOrDefault:(int64_t)a3;
- (id)__im_preferredDataSubscriptionContext;
- (id)__im_preferredSubscriptionContext;
- (id)__im_subscriptionContextForForSimID:(id)a3;
- (id)__im_subscriptionContextForForSimID:(id)a3 phoneNumber:(id)a4;
- (id)__im_subscriptionContextForForSlotID:(int64_t)a3;
- (id)__im_subscriptionContextForPhoneNumber:(id)a3;
- (id)__im_subscriptionContextForPhoneNumberOrDefault:(id)a3;
- (id)__im_subscriptionContextForSenderIdentity:(id)a3;
- (id)__im_subscriptionContextOrDefaultForForSimID:(id)a3 phoneNumber:(id)a4;
- (id)__im_subscriptionContextOrDefaultForForSlotID:(int64_t)a3;
- (id)__im_subscriptionsWithMMSSupport;
- (id)__im_subscriptionsWithRCSSupport;
- (id)__im_switchSubscriptionContextFromPhoneNumber:(id)a3 simID:(id)a4;
- (id)__im_switchSubscriptionContextFromSubscriptionContext:(id)a3;
- (id)_senderIdentityManager;
- (id)allSubscriptions;
- (id)description;
- (id)preferredOrDefaultSubscriptionContext;
- (id)subscriptionFilterPredicate;
- (id)subscriptions;
- (int64_t)__imSlotIDSForPhoneNumber:(id)a3;
- (void)setPhoneNumbersOfActiveSubscriptions:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation IMCTXPCServiceSubscriptionInfo

- (id)__im_subscriptionContextOrDefaultForForSimID:(id)a3 phoneNumber:(id)a4
{
  v5 = [(IMCTXPCServiceSubscriptionInfo *)self __im_subscriptionContextForForSimID:a3 phoneNumber:a4];
  if (!v5)
  {
    v5 = [(IMCTXPCServiceSubscriptionInfo *)self preferredOrDefaultSubscriptionContext];
  }

  return v5;
}

- (id)preferredOrDefaultSubscriptionContext
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMCTXPCServiceSubscriptionInfo *)self __im_preferredSubscriptionContext];
  if (!v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 phoneNumber];
          if ([v10 length])
          {

LABEL_14:
            id v3 = v9;
            goto LABEL_15;
          }
          v11 = [v9 labelID];
          uint64_t v12 = [v11 length];

          if (v12) {
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v3 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v3 = 0;
    }
LABEL_15:
  }

  return v3;
}

- (id)__im_subscriptionContextForForSimID:(id)a3 phoneNumber:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length] || objc_msgSend(v6, "length"))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    id v8 = (id)[obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    v9 = 0;
    if (v8)
    {
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v13 = [v12 phoneNumber];
          if ([v13 length] && objc_msgSend(v7, "length"))
          {
            long long v14 = [v12 phoneNumber];
            char v15 = MEMORY[0x1A6227BF0](v14, v7);
          }
          else
          {
            char v15 = 0;
          }

          if ([v6 length])
          {
            long long v16 = [v12 labelID];
            int v17 = [v16 isEqualToString:v6];

            if (v15) {
              goto LABEL_20;
            }
            if (v17)
            {
              id v18 = v12;

              v9 = v18;
            }
          }
          else if (v15)
          {
LABEL_20:
            id v8 = v12;
            goto LABEL_21;
          }
        }
        id v8 = (id)[obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    id v8 = 0;
    v9 = 0;
  }
  if (v8) {
    uint64_t v19 = v8;
  }
  else {
    uint64_t v19 = v9;
  }
  id v20 = v19;

  return v20;
}

- (id)__im_preferredSubscriptionContext
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 phoneNumber];
        uint64_t v9 = [v8 length];
        if (v9
          || ([v7 labelID], v2 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "length")))
        {
          uint64_t v10 = [v7 userDefaultVoice];
          int v11 = [v10 BOOLValue];

          if (v9)
          {

            if (v11) {
              goto LABEL_17;
            }
          }
          else
          {

            if (v11)
            {
LABEL_17:
              id v4 = v7;
              goto LABEL_18;
            }
          }
        }
        else
        {
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v4;
}

- (id)subscriptions
{
  id v3 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptionInfo];
  id v4 = [v3 subscriptionsInUse];
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptionFilterPredicate];
  id v6 = [v4 filteredArrayUsingPredicate:v5];
  id v7 = v6;
  if (!v6) {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (id)subscriptionFilterPredicate
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F28F60], sel_predicateWithBlock_);
}

- (IMCTXPCServiceSubscriptionInfo)initWithSubscriptionInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCTXPCServiceSubscriptionInfo;
  id v6 = [(IMCTXPCServiceSubscriptionInfo *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
  }

  return v7;
}

- (id)allSubscriptions
{
  id v3 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptionInfo];
  id v4 = [v3 subscriptions];
  id v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptionFilterPredicate];
  id v6 = [v4 filteredArrayUsingPredicate:v5];
  id v7 = v6;
  if (!v6) {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v6;

  return v8;
}

- (id)__im_subscriptionsWithRCSSupport
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v9 = +[IMCTRCSUtilitiesManager sharedManager];
        uint64_t v10 = [v8 phoneNumber];
        int v11 = [v8 labelID];
        int v12 = [v9 supportedForPhoneNumber:v10 simID:v11];

        if (v12) {
          [v14 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v14;
}

- (BOOL)__im_hasMultipleSubscriptions
{
  v2 = [(IMCTXPCServiceSubscriptionInfo *)self allSubscriptions];
  BOOL v3 = [v2 count] == 2;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self allSubscriptions];
  uint64_t v6 = [v3 stringWithFormat:@"IMCTXPCServiceSubscriptionInfo: activeSubscriptions %@ allSubscriptions: %@", v4, v5];

  return v6;
}

- (id)__im_subscriptionsWithMMSSupport
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 phoneNumber];
        int v11 = [v9 labelID];
        BOOL v12 = +[IMCTSMSUtilities IMMMSSupportedAndConfiguredForPhoneNumber:v10 simID:v11];

        if (v12) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)__im_containsPhoneNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_super v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 phoneNumber];
          if ([v10 length])
          {
            int v11 = [v9 phoneNumber];
            char v12 = MEMORY[0x1A6227BF0](v11, v4);

            if (v12)
            {
              LOBYTE(v6) = 1;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)__im_onlyHasActiveSlots
{
  v2 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  BOOL v3 = [v2 count] == 2;

  return v3;
}

- (NSArray)phoneNumbersOfActiveSubscriptions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  phoneNumbersOfActiveSubscriptions = self->_phoneNumbersOfActiveSubscriptions;
  if (!phoneNumbersOfActiveSubscriptions)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v6 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v13 = [v12 phoneNumber];
          if ([v13 length])
          {
            long long v14 = [v12 phoneNumber];
            long long v15 = IMChatCanonicalIDSIDsForAddress(v14);
            long long v16 = [v15 _stripFZIDPrefix];

            if (v16) {
              long long v17 = v16;
            }
            else {
              long long v17 = v13;
            }
            [(NSArray *)v6 addObject:v17];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    long long v18 = self->_phoneNumbersOfActiveSubscriptions;
    self->_phoneNumbersOfActiveSubscriptions = v6;

    phoneNumbersOfActiveSubscriptions = self->_phoneNumbersOfActiveSubscriptions;
  }

  return phoneNumbersOfActiveSubscriptions;
}

- (id)__im_preferredDataSubscriptionContext
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 phoneNumber];
        uint64_t v9 = [v8 length];
        if (v9
          || ([v7 labelID], v2 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "length")))
        {
          uint64_t v10 = [v7 userDataPreferred];
          int v11 = [v10 BOOLValue];

          if (v9)
          {

            if (v11) {
              goto LABEL_17;
            }
          }
          else
          {

            if (v11)
            {
LABEL_17:
              id v4 = v7;
              goto LABEL_18;
            }
          }
        }
        else
        {
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v4;
}

- (id)__im_switchSubscriptionContextFromSubscriptionContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6)
  {

LABEL_14:
    uint64_t v8 = [(IMCTXPCServiceSubscriptionInfo *)self preferredOrDefaultSubscriptionContext];
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      uint64_t v12 = [v11 slotID];
      if (v12 != [v4 slotID])
      {
        id v13 = v11;

        uint64_t v8 = v13;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v7);

  if (!v8) {
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (id)__im_switchSubscriptionContextFromPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self __im_subscriptionContextForForSimID:a4 phoneNumber:a3];
  uint64_t v6 = [(IMCTXPCServiceSubscriptionInfo *)self __im_switchSubscriptionContextFromSubscriptionContext:v5];

  return v6;
}

- (id)__im_phoneNumberForSlotID:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 slotID] == a3)
        {
          int v11 = [v9 phoneNumber];
          uint64_t v12 = IMChatCanonicalIDSIDsForAddress(v11);
          uint64_t v10 = [v12 _stripFZIDPrefix];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)__im_phoneNumberForSlotIDOrDefault:(int64_t)a3
{
  id v4 = [(IMCTXPCServiceSubscriptionInfo *)self __im_phoneNumberForSlotID:a3];
  if (![v4 length])
  {
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self preferredOrDefaultSubscriptionContext];
    uint64_t v6 = [v5 phoneNumber];
    uint64_t v7 = IMChatCanonicalIDSIDsForAddress(v6);
    uint64_t v8 = [v7 _stripFZIDPrefix];

    id v4 = (void *)v8;
  }

  return v4;
}

- (id)__im_labelForPhoneNumber:(id)a3 simID:(id)a4
{
  id v4 = [(IMCTXPCServiceSubscriptionInfo *)self __im_subscriptionContextForForSimID:a4 phoneNumber:a3];
  uint64_t v5 = [v4 label];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 label];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)__imSlotIDSForPhoneNumber:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        if (v4)
        {
          int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 phoneNumber];
          int v13 = IMSharedHelperAreObjectsLogicallySame(v12, v4);

          if (v13) {
            int64_t v8 = [v11 slotID];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)__imSIMIDForSubscriptionSlot:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 slotID] == a3)
          {
            uint64_t v11 = [v10 labelID];

            uint64_t v7 = (void *)v11;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)__im_subscriptionContextForForSlotID:(int64_t)a3
{
  id v3 = (id)a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((id)[v9 slotID] == v3)
          {
            id v3 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v3 = 0;
LABEL_12:
  }

  return v3;
}

- (id)__im_subscriptionContextOrDefaultForForSlotID:(int64_t)a3
{
  id v4 = [(IMCTXPCServiceSubscriptionInfo *)self __im_subscriptionContextForForSlotID:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(IMCTXPCServiceSubscriptionInfo *)self preferredOrDefaultSubscriptionContext];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)__im_subscriptionContextForPhoneNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 phoneNumber];
          if ([v10 length])
          {
            long long v11 = [v9 phoneNumber];
            int v12 = MEMORY[0x1A6227BF0](v11, v4);

            if (v12)
            {
              id v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
LABEL_15:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)__im_subscriptionContextForForSimID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 labelID];
          if ([v10 length])
          {
            long long v11 = [v9 labelID];
            int v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              id v6 = v9;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
LABEL_15:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)__im_subscriptionContextForPhoneNumberOrDefault:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = self;
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        if (MEMORY[0x1A62278C0](v4))
        {
          long long v11 = [v10 phoneNumber];
          if ([v11 length])
          {
            int v12 = (void *)MEMORY[0x1E4F6B3E8];
            long long v13 = [v10 phoneNumber];
            LOBYTE(v12) = [v12 isPhoneNumber:v13 equivalentToExistingPhoneNumber:v4];

            if (v12)
            {
              id v14 = v10;

              self = v16;
              if (v14) {
                goto LABEL_17;
              }
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    self = v16;
  }
LABEL_16:
  id v14 = [(IMCTXPCServiceSubscriptionInfo *)self preferredOrDefaultSubscriptionContext];
LABEL_17:

  return v14;
}

- (id)__im_subscriptionContextForSenderIdentity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self subscriptions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (+[IMSenderIdentityManager isTUSenderIdentity:v4 equalToSubscriptionContext:v9])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_senderIdentityManager
{
  return +[IMSenderIdentityManager sharedInstance];
}

- (id)__im_contactPreferredSubscriptionContextForChatHandleIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(IMCTXPCServiceSubscriptionInfo *)self _senderIdentityManager];
    id v6 = [v5 bestSenderIdentityForHandleIDs:v4];

    if (v6)
    {
      uint64_t v7 = [(IMCTXPCServiceSubscriptionInfo *)self __im_subscriptionContextForSenderIdentity:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setPhoneNumbersOfActiveSubscriptions:(id)a3
{
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);

  objc_storeStrong((id *)&self->_phoneNumbersOfActiveSubscriptions, 0);
}

@end