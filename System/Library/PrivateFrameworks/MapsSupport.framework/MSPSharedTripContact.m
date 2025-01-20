@interface MSPSharedTripContact
+ (BOOL)isHandleBlocked:(id)a3;
+ (BOOL)isVirtualReceiver:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_propertiesForFetching;
+ (id)capabilityVersionsForVirtualReceiver:(id)a3;
+ (id)contactsFromCNContact:(id)a3;
+ (id)contactsFromCNContact:(id)a3 matchingHandles:(id)a4;
+ (id)contactsFromHandles:(id)a3;
+ (id)contactsFromIDSHandles:(id)a3;
+ (id)contactsFromVirtualReceiverHandles:(id)a3;
+ (id)iMessageVirtualReceiverWithName:(id)a3;
+ (id)mapsVirtualReceiverWithName:(id)a3;
+ (id)mapsVirtualReceiverWithName:(id)a3 receiverCapabilityVersion:(id)a4;
+ (id)rcsVirtualReceiverWithName:(id)a3;
+ (id)smsVirtualReceiverWithName:(id)a3;
+ (id)virtualReceiverWithHandle:(id)a3;
+ (unint64_t)capabilityTypeForVirtualReceiver:(id)a3;
+ (void)setAdditionalKeyDescriptorsForContactFetching:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandleBlocked;
- (BOOL)isPhoneNumber;
- (CNContact)contact;
- (CNLabeledValue)labeledValue;
- (MSPSharedTripContact)initWithCoder:(id)a3;
- (MSPSharedTripContact)initWithContact:(id)a3 handle:(id)a4;
- (MSPSharedTripContact)initWithContact:(id)a3 labeledValue:(id)a4;
- (MSPSharedTripContact)initWithContactHandle:(id)a3;
- (NSString)displayName;
- (NSString)handleForIDS;
- (id)_stringValue;
- (id)description;
- (id)handleForDeviceVersion:(unint64_t)a3;
- (unint64_t)hash;
- (void)_populateFromContactUsingHandle:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setLabeledValue:(id)a3;
- (void)startLiveUpdatesForCapabilityVersion:(unint64_t)a3;
- (void)stopLiveUpdatesForCapabilityVersion:(unint64_t)a3;
@end

@implementation MSPSharedTripContact

+ (void)setAdditionalKeyDescriptorsForContactFetching:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138477827;
    id v9 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEBUG, "[Contact] Setting additional keys for contact fetching: %{private}@", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)qword_1EB7F4520;
  qword_1EB7F4520 = (uint64_t)v3;
  id v6 = v3;

  v7 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MSPSharedTripContact)initWithCoder:(id)a3
{
  v4 = [a3 decodeObjectForKey:@"contactHandle"];
  if (v4)
  {
    self = [(MSPSharedTripContact *)self initWithContactHandle:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [v5 stringValue];
    v7 = [(MSPSharedTripContact *)self stringValue];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      int v8 = [v5 stringValue];
      id v9 = [(MSPSharedTripContact *)self stringValue];
      char v10 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MSPSharedTripContact *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  if (self->_displayName)
  {
    v11.receiver = self;
    v11.super_class = (Class)MSPSharedTripContact;
    id v4 = [(MSPSharedTripContact *)&v11 description];
    displayName = self->_displayName;
    id v6 = [(MSPSharedTripContact *)self stringValue];
    [v3 stringWithFormat:@"%@ %@ (%@)", v4, displayName, v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSPSharedTripContact;
    id v4 = [(MSPSharedTripContact *)&v10 description];
    id v6 = [(MSPSharedTripContact *)self stringValue];
    [v3 stringWithFormat:@"%@ (%@)", v4, v6, v9];
  v7 = };

  return v7;
}

+ (id)_propertiesForFetching
{
  v22[17] = *MEMORY[0x1E4F143B8];
  v2 = (void *)_MergedGlobals_38;
  if (!_MergedGlobals_38)
  {
    unint64_t v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v22[0] = v3;
    id v4 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
    uint64_t v5 = *MEMORY[0x1E4F1AEB0];
    v22[1] = v4;
    v22[2] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1AEA0];
    v22[3] = *MEMORY[0x1E4F1ADF0];
    v22[4] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AEB8];
    v22[5] = *MEMORY[0x1E4F1ADE0];
    v22[6] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AEF8];
    v22[7] = *MEMORY[0x1E4F1AEC0];
    v22[8] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AEF0];
    v22[9] = *MEMORY[0x1E4F1AF00];
    v22[10] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1AFA8];
    v22[11] = *MEMORY[0x1E4F1AED8];
    v22[12] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1ADC8];
    v22[13] = *MEMORY[0x1E4F1AEE0];
    v22[14] = v11;
    uint64_t v12 = *MEMORY[0x1E4F1AFB0];
    v22[15] = *MEMORY[0x1E4F1AF10];
    v22[16] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:17];
    v14 = (void *)_MergedGlobals_38;
    _MergedGlobals_38 = v13;

    if ([(id)qword_1EB7F4520 count])
    {
      v15 = (void *)[(id)_MergedGlobals_38 mutableCopy];
      [v15 addObjectsFromArray:qword_1EB7F4520];
      uint64_t v16 = [v15 copy];
      v17 = (void *)_MergedGlobals_38;
      _MergedGlobals_38 = v16;
    }
    v18 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134217984;
      uint64_t v21 = [(id)_MergedGlobals_38 count];
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEBUG, "[Contact] Recompiled %lu keys for contact fetching", (uint8_t *)&v20, 0xCu);
    }

    v2 = (void *)_MergedGlobals_38;
  }

  return v2;
}

- (void)_populateFromContactUsingHandle:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_contact)
  {
    id v6 = v4;
    if (v6)
    {
      v27 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v6];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v8 = [(CNContact *)self->_contact phoneNumbers];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
          v14 = [v13 value];
          char v15 = [v14 isLikePhoneNumber:v7];

          if (v15) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        uint64_t v16 = v13;

        if (v16) {
          goto LABEL_25;
        }
      }
      else
      {
LABEL_11:
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v17 = [(CNContact *)self->_contact emailAddresses];
      uint64_t v16 = (CNLabeledValue *)[v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v16)
      {
        uint64_t v18 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v16; i = (CNLabeledValue *)((char *)i + 1))
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v17);
            }
            int v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v21 = [v20 value];
            int v22 = [v21 isEqualToString:v6];

            if (v22)
            {
              uint64_t v16 = v20;
              goto LABEL_24;
            }
          }
          uint64_t v16 = (CNLabeledValue *)[v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_24:

LABEL_25:
      uint64_t v5 = v27;
    }
    else
    {
      uint64_t v16 = 0;
    }
    labeledValue = self->_labeledValue;
    self->_labeledValue = v16;
    v24 = v16;

    v25 = [MEMORY[0x1E4F1B910] stringFromContact:self->_contact style:1000];
    displayName = self->_displayName;
    self->_displayName = v25;
  }
}

- (MSPSharedTripContact)initWithContactHandle:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E4F1B980], "_maps_isAuthorized"))
    {
      uint64_t v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      id v6 = objc_alloc(MEMORY[0x1E4F1B908]);
      uint64_t v7 = [(id)objc_opt_class() _propertiesForFetching];
      uint64_t v8 = (void *)[v6 initWithKeysToFetch:v7];

      uint64_t v9 = (void *)MEMORY[0x1E4F1B8F8];
      v23[0] = v4;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      uint64_t v11 = [v9 predicateForContactsMatchingHandleStrings:v10];
      [v8 setPredicate:v11];

      [v8 setSortOrder:1];
      *(void *)buf = 0;
      uint64_t v18 = buf;
      uint64_t v19 = 0x3032000000;
      int v20 = __Block_byref_object_copy_;
      uint64_t v21 = __Block_byref_object_dispose_;
      id v22 = 0;
      v15[4] = buf;
      id v16 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__MSPSharedTripContact_initWithContactHandle___block_invoke;
      v15[3] = &unk_1E617C880;
      [v5 enumerateContactsWithFetchRequest:v8 error:&v16 usingBlock:v15];
      id v12 = v16;
      self = [(MSPSharedTripContact *)self initWithContact:*((void *)v18 + 5) handle:v4];
      _Block_object_dispose(buf, 8);

      uint64_t v13 = self;
    }
    else
    {
      uint64_t v5 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[Contact] Asked to resolve handle to contact, but Maps is not authorised for Contacts", buf, 2u);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __46__MSPSharedTripContact_initWithContactHandle___block_invoke(uint64_t a1, void *a2)
{
}

- (MSPSharedTripContact)initWithContact:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSPSharedTripContact;
  uint64_t v8 = [(MSPSharedTripContact *)&v15 init];
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = [(id)objc_opt_class() _propertiesForFetching];
  if (([v6 areKeysAvailable:v9] & 1) == 0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v11 = [v6 identifier];
    uint64_t v12 = [v10 unifiedContactWithIdentifier:v11 keysToFetch:v9 error:0];

    id v6 = (id)v12;
    if (!v12)
    {

      labeledValue = 0;
      goto LABEL_6;
    }
  }
  objc_storeStrong((id *)&v8->_contact, v6);
  objc_storeStrong((id *)&v8->_originalHandle, a4);
  [(MSPSharedTripContact *)v8 _populateFromContactUsingHandle:v7];
  labeledValue = (MSPSharedTripContact *)v8->_labeledValue;

  if (labeledValue) {
LABEL_5:
  }
    labeledValue = v8;
LABEL_6:

  return labeledValue;
}

- (MSPSharedTripContact)initWithContact:(id)a3 labeledValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripContact;
  uint64_t v9 = [(MSPSharedTripContact *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    uint64_t v11 = [MEMORY[0x1E4F1B910] stringFromContact:v10->_contact style:1000];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_labeledValue, a4);
    uint64_t v13 = [(MSPSharedTripContact *)v10 _stringValue];
    originalHandle = v10->_originalHandle;
    v10->_originalHandle = (NSString *)v13;
  }
  return v10;
}

- (id)_stringValue
{
  unint64_t v3 = [(MSPSharedTripContact *)self labeledValue];
  id v4 = [v3 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(MSPSharedTripContact *)self labeledValue];
    uint64_t v7 = [v6 value];
LABEL_5:
    uint64_t v9 = (void *)v7;

    goto LABEL_7;
  }
  if ([(MSPSharedTripContact *)self isPhoneNumber])
  {
    id v8 = [(MSPSharedTripContact *)self labeledValue];
    id v6 = [v8 value];

    uint64_t v7 = [v6 unformattedInternationalStringValue];
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (NSString)handleForIDS
{
  unint64_t v3 = [(MSPSharedTripContact *)self labeledValue];
  id v4 = [v3 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(MSPSharedTripContact *)self stringValue];
    uint64_t v7 = MEMORY[0x1BA9C23A0]();
LABEL_5:
    id v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([(MSPSharedTripContact *)self isPhoneNumber])
  {
    id v6 = [(MSPSharedTripContact *)self stringValue];
    uint64_t v7 = IDSCopyIDForPhoneNumber();
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return (NSString *)v8;
}

- (BOOL)isPhoneNumber
{
  v2 = [(MSPSharedTripContact *)self labeledValue];
  unint64_t v3 = [v2 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (displayName)
  {
    unint64_t v3 = displayName;
  }
  else
  {
    unint64_t v3 = [(MSPSharedTripContact *)self stringValue];
  }

  return v3;
}

+ (id)contactsFromCNContact:(id)a3 matchingHandles:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v38 = a4;
  if ([v38 count])
  {
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v38 count];
      id v8 = [v5 identifier];
      *(_DWORD *)buf = 134218499;
      uint64_t v61 = v7;
      __int16 v62 = 2113;
      v63 = v8;
      __int16 v64 = 2113;
      id v65 = v38;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "Will attempt to match %lu handles for contact %{private}@ (%{private}@)", buf, 0x20u);
    }
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = [v5 phoneNumbers];
    id v34 = (id)[obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v53;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v9;
          id v10 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
          uint64_t v11 = [v10 value];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v12 = v38;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v49 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:*(void *)(*((void *)&v48 + 1) + 8 * i) countryCode:0];
                if ([v11 isLikePhoneNumber:v17])
                {
                  uint64_t v18 = [[MSPSharedTripContact alloc] initWithContact:v5 labeledValue:v10];
                  if (v18) {
                    [v39 addObject:v18];
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v58 count:16];
            }
            while (v14);
          }

          uint64_t v9 = v36 + 1;
        }
        while ((id)(v36 + 1) != v34);
        id v34 = (id)[obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v34);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = [v5 emailAddresses];
    uint64_t v19 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v35);
          }
          id v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          v23 = [v22 value];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v24 = v38;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v56 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v41;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v41 != v27) {
                  objc_enumerationMutation(v24);
                }
                if ([v23 isEqualToString:*(void *)(*((void *)&v40 + 1) + 8 * k)])
                {
                  long long v29 = [[MSPSharedTripContact alloc] initWithContact:v5 labeledValue:v22];
                  if (v29) {
                    [v39 addObject:v29];
                  }
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v56 count:16];
            }
            while (v26);
          }
        }
        uint64_t v20 = [v35 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v20);
    }

    long long v30 = (void *)[v39 copy];
  }
  else
  {
    long long v30 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

+ (id)contactsFromCNContact:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 identifier];
    *(_DWORD *)buf = 138477827;
    long long v32 = v5;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "Will prepare contact values for contact %{private}@", buf, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v3 phoneNumbers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [[MSPSharedTripContact alloc] initWithContact:v3 labeledValue:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = objc_msgSend(v3, "emailAddresses", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [[MSPSharedTripContact alloc] initWithContact:v3 labeledValue:*(void *)(*((void *)&v21 + 1) + 8 * j)];
        if (v18) {
          [v6 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  uint64_t v19 = (void *)[v6 copy];

  return v19;
}

+ (id)contactsFromHandles:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1B980], "_maps_isAuthorized");
    id v5 = MSPGetSharedTripLog();
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218243;
        uint64_t v21 = [v3 count];
        __int16 v22 = 2113;
        id v23 = v3;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "Will attempt to fetch contacts for %lu handles (%{private}@)", buf, 0x16u);
      }

      id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      id v7 = objc_alloc(MEMORY[0x1E4F1B908]);
      uint64_t v8 = [(id)objc_opt_class() _propertiesForFetching];
      uint64_t v9 = (void *)[v7 initWithKeysToFetch:v8];

      uint64_t v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:v3];
      [v9 setPredicate:v10];

      [v9 setSortOrder:1];
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      id v19 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __44__MSPSharedTripContact_contactsFromHandles___block_invoke;
      v16[3] = &unk_1E617C8A8;
      id v17 = v3;
      id v18 = v11;
      id v12 = v11;
      [v6 enumerateContactsWithFetchRequest:v9 error:&v19 usingBlock:v16];
      id v13 = v19;
      uint64_t v14 = [v12 array];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[Contact] Asked to resolve handles to contacts, but Maps is not authorised for Contacts", buf, 2u);
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __44__MSPSharedTripContact_contactsFromHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[MSPSharedTripContact contactsFromCNContact:a2 matchingHandles:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObjectsFromArray:v3];
}

+ (id)contactsFromIDSHandles:(id)a3
{
  char v4 = MapsMap(a3, &__block_literal_global_4);
  id v5 = [a1 contactsFromHandles:v4];

  return v5;
}

id __47__MSPSharedTripContact_contactsFromIDSHandles___block_invoke()
{
  v0 = (void *)IDSCopyRawAddressForDestination();

  return v0;
}

+ (BOOL)isHandleBlocked:(id)a3
{
  CMFItemFromString = (const void *)CreateCMFItemFromString();
  BOOL v4 = CMFBlockListIsItemBlocked() != 0;
  CFRelease(CMFItemFromString);
  return v4;
}

- (BOOL)isHandleBlocked
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  double lastCheckedBlocked = self->_lastCheckedBlocked;
  if (lastCheckedBlocked > 0.0 && v4 - lastCheckedBlocked < 30.0)
  {
    return self->_isBlocked;
  }
  else
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(MSPSharedTripContact *)self stringValue];
      *(_DWORD *)buf = 138477827;
      long long v25 = v8;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEBUG, "[Contact] Checking if %{private}@ is blocked", buf, 0xCu);
    }
    self->_BOOL isBlocked = 0;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    uint64_t v10 = v9;
    if (self->_originalHandle) {
      objc_msgSend(v9, "addObject:");
    }
    id v11 = [(MSPSharedTripContact *)self stringValue];
    if (v11) {
      [v10 addObject:v11];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend((id)objc_opt_class(), "isHandleBlocked:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19))
          {
            self->_BOOL isBlocked = 1;
            goto LABEL_22;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    self->_double lastCheckedBlocked = v4;
    BOOL isBlocked = self->_isBlocked;
  }
  return isBlocked;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (void)setLabeledValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originalHandle, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (BOOL)isVirtualReceiver:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (unint64_t)capabilityTypeForVirtualReceiver:(id)a3
{
  id v4 = a3;
  if ([a1 isVirtualReceiver:v4])
  {
    id v5 = [v4 handleForIDS];
    unint64_t CapabilityType = MSPSharedTripVirtualReceiverHandleGetCapabilityType(v5);
  }
  else
  {
    unint64_t CapabilityType = 0;
  }

  return CapabilityType;
}

+ (id)capabilityVersionsForVirtualReceiver:(id)a3
{
  id v4 = a3;
  if ([a1 isVirtualReceiver:v4])
  {
    id v5 = [v4 handleForIDS];
    id v6 = MSPSharedTripVirtualReceiverHandleGetReceiverCapabilityVersions(v5);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

+ (id)virtualReceiverWithHandle:(id)a3
{
  id v3 = a3;
  if (MSPSharedTripVirtualReceiverIsValid(v3)) {
    id v4 = [[MSPSharedTripVirtualContact alloc] initWithVirtualReceiverHandle:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)contactsFromVirtualReceiverHandles:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__MSPSharedTripContact_VirtualReceivers__contactsFromVirtualReceiverHandles___block_invoke;
  v5[3] = &__block_descriptor_40_e43___MSPSharedTripContact_24__0__NSString_8Q16l;
  v5[4] = a1;
  id v3 = MapsMap(a3, v5);

  return v3;
}

uint64_t __77__MSPSharedTripContact_VirtualReceivers__contactsFromVirtualReceiverHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) virtualReceiverWithHandle:a2];
}

+ (id)mapsVirtualReceiverWithName:(id)a3
{
  return (id)[a1 mapsVirtualReceiverWithName:a3 receiverCapabilityVersion:MEMORY[0x1E4F1CBF0]];
}

+ (id)mapsVirtualReceiverWithName:(id)a3 receiverCapabilityVersion:(id)a4
{
  id v5 = MSPSharedTripVirtualReceiverHandleMake(a3, 4, 0, a4);
  id v6 = [a1 virtualReceiverWithHandle:v5];

  return v6;
}

+ (id)iMessageVirtualReceiverWithName:(id)a3
{
  id v4 = MSPSharedTripVirtualReceiverHandleMake(a3, 3, 0, 0);
  id v5 = [a1 virtualReceiverWithHandle:v4];

  return v5;
}

+ (id)smsVirtualReceiverWithName:(id)a3
{
  id v4 = MSPSharedTripVirtualReceiverHandleMake(a3, 2, @"SMS", 0);
  id v5 = [a1 virtualReceiverWithHandle:v4];

  return v5;
}

+ (id)rcsVirtualReceiverWithName:(id)a3
{
  id v4 = MSPSharedTripVirtualReceiverHandleMake(a3, 2, @"RCS", 0);
  id v5 = [a1 virtualReceiverWithHandle:v4];

  return v5;
}

- (id)handleForDeviceVersion:(unint64_t)a3
{
  if ([(id)objc_opt_class() isVirtualReceiver:self])
  {
    id v5 = [(MSPSharedTripContact *)self _deviceHandleForVersion:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)startLiveUpdatesForCapabilityVersion:(unint64_t)a3
{
  id v4 = [(MSPSharedTripContact *)self handleForDeviceVersion:a3];
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 postNotificationName:@"MSPSharedTripVirtualReceiverStartLiveUpdates" object:v4];
  }
}

- (void)stopLiveUpdatesForCapabilityVersion:(unint64_t)a3
{
  id v4 = [(MSPSharedTripContact *)self handleForDeviceVersion:a3];
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 postNotificationName:@"MSPSharedTripVirtualReceiverStopLiveUpdates" object:v4];
  }
}

@end