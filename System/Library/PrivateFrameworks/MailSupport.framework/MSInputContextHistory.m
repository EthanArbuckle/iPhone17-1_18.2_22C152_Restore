@interface MSInputContextHistory
- (BOOL)hasCustomSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)showSmartReplySuggestions;
- (ECEmailAddress)senderEmailAddress;
- (MSInputContextHistory)initWithThreadIdentifier:(id)a3 senderEmailAddress:(id)a4 toRecipients:(id)a5 ccRecipients:(id)a6 subject:(id)a7 hasCustomSignature:(BOOL)a8 showSmartReplySuggestions:(BOOL)a9 originalMessageCategorySubtype:(id)a10 originalContentMessages:(id)a11;
- (NSArray)ccRecipients;
- (NSArray)originalContentMessages;
- (NSArray)toRecipients;
- (NSDictionary)ccRecipientNamesByEmailAddress;
- (NSDictionary)infoDict;
- (NSDictionary)recipientNamesByEmailAddress;
- (NSDictionary)toRecipientNamesByEmailAddress;
- (NSMutableDictionary)participantsByEmailAddress;
- (NSSet)firstPerson;
- (NSSet)primaryRecipients;
- (NSSet)secondaryRecipients;
- (NSString)ef_publicDescription;
- (NSString)originalMessageCategorySubtype;
- (NSString)subject;
- (NSString)threadIdentifier;
- (id)_participantNameAndEmailAddressFromEmailAddress:(id)a3;
- (id)_participantNamesByEmailAddressFromRecipients:(id)a3;
- (unint64_t)hash;
- (void)setCcRecipientNamesByEmailAddress:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setFirstPerson:(id)a3;
- (void)setHasCustomSignature:(BOOL)a3;
- (void)setInfoDict:(id)a3;
- (void)setOriginalContentMessages:(id)a3;
- (void)setOriginalMessageCategorySubtype:(id)a3;
- (void)setParticipantsByEmailAddress:(id)a3;
- (void)setPrimaryRecipients:(id)a3;
- (void)setRecipientNamesByEmailAddress:(id)a3;
- (void)setSecondaryRecipients:(id)a3;
- (void)setSenderEmailAddress:(id)a3;
- (void)setShowSmartReplySuggestions:(BOOL)a3;
- (void)setSubject:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setToRecipientNamesByEmailAddress:(id)a3;
- (void)setToRecipients:(id)a3;
@end

@implementation MSInputContextHistory

- (MSInputContextHistory)initWithThreadIdentifier:(id)a3 senderEmailAddress:(id)a4 toRecipients:(id)a5 ccRecipients:(id)a6 subject:(id)a7 hasCustomSignature:(BOOL)a8 showSmartReplySuggestions:(BOOL)a9 originalMessageCategorySubtype:(id)a10 originalContentMessages:(id)a11
{
  BOOL v11 = a8;
  id v32 = a3;
  id v31 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a11;
  v33.receiver = self;
  v33.super_class = (Class)MSInputContextHistory;
  v22 = [(MSInputContextHistory *)&v33 init];
  if (v22)
  {
    v23 = (void *)[v32 copy];
    [(MSInputContextHistory *)v22 setThreadIdentifier:v23];

    [(MSInputContextHistory *)v22 setSenderEmailAddress:v31];
    uint64_t v24 = *MEMORY[0x1E4F60CE8];
    v25 = objc_msgSend(v17, "ef_filter:", *MEMORY[0x1E4F60CE8]);
    [(MSInputContextHistory *)v22 setToRecipients:v25];

    v26 = objc_msgSend(v18, "ef_filter:", v24);
    [(MSInputContextHistory *)v22 setCcRecipients:v26];

    v27 = (void *)[v19 copy];
    [(MSInputContextHistory *)v22 setSubject:v27];

    [(MSInputContextHistory *)v22 setHasCustomSignature:v11];
    [(MSInputContextHistory *)v22 setShowSmartReplySuggestions:a9];
    v28 = (void *)[v20 copy];
    [(MSInputContextHistory *)v22 setOriginalMessageCategorySubtype:v28];

    [(MSInputContextHistory *)v22 setOriginalContentMessages:v21];
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(MSInputContextHistory *)v22 setParticipantsByEmailAddress:v29];
  }
  return v22;
}

- (NSDictionary)toRecipientNamesByEmailAddress
{
  toRecipientNamesByEmailAddress = self->_toRecipientNamesByEmailAddress;
  if (!toRecipientNamesByEmailAddress)
  {
    v4 = [(MSInputContextHistory *)self toRecipients];
    v5 = [(MSInputContextHistory *)self _participantNamesByEmailAddressFromRecipients:v4];
    v6 = self->_toRecipientNamesByEmailAddress;
    self->_toRecipientNamesByEmailAddress = v5;

    toRecipientNamesByEmailAddress = self->_toRecipientNamesByEmailAddress;
  }
  return toRecipientNamesByEmailAddress;
}

- (NSDictionary)ccRecipientNamesByEmailAddress
{
  ccRecipientNamesByEmailAddress = self->_ccRecipientNamesByEmailAddress;
  if (!ccRecipientNamesByEmailAddress)
  {
    v4 = [(MSInputContextHistory *)self ccRecipients];
    v5 = [(MSInputContextHistory *)self _participantNamesByEmailAddressFromRecipients:v4];
    v6 = self->_ccRecipientNamesByEmailAddress;
    self->_ccRecipientNamesByEmailAddress = v5;

    ccRecipientNamesByEmailAddress = self->_ccRecipientNamesByEmailAddress;
  }
  return ccRecipientNamesByEmailAddress;
}

- (NSDictionary)recipientNamesByEmailAddress
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  recipientNamesByEmailAddress = self->_recipientNamesByEmailAddress;
  if (!recipientNamesByEmailAddress)
  {
    id v32 = self;
    v4 = [(MSInputContextHistory *)self senderEmailAddress];
    v5 = [(MSInputContextHistory *)v32 _participantNameAndEmailAddressFromEmailAddress:v4];

    v28 = v5;
    id v31 = [v5 first];
    id v29 = [v5 second];
    v30 = [(MSInputContextHistory *)v32 originalContentMessages];
    v6 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__MSInputContextHistory_recipientNamesByEmailAddress__block_invoke;
    aBlock[3] = &unk_1E63FEA40;
    aBlock[4] = v32;
    v7 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v30;
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v40;
      uint64_t v10 = *MEMORY[0x1E4F60CF0];
      do
      {
        uint64_t v34 = v8;
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v12) & 1) == 0)
          {
            v13 = [v12 sender];
            v7[2](v7, v13, v6);

            v14 = [v12 toList];
            v15 = [v12 ccList];
            v16 = [v14 arrayByAddingObjectsFromArray:v15];

            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v36 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  v7[2](v7, *(void **)(*((void *)&v35 + 1) + 8 * j), v6);
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
              }
              while (v18);
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v8);
    }

    id v21 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    v22 = [(MSInputContextHistory *)v32 ccRecipientNamesByEmailAddress];
    [(NSDictionary *)v21 addEntriesFromDictionary:v22];

    v23 = [(MSInputContextHistory *)v32 toRecipientNamesByEmailAddress];
    [(NSDictionary *)v21 addEntriesFromDictionary:v23];

    if (v31)
    {
      uint64_t v24 = [(NSDictionary *)v21 objectForKeyedSubscript:v31];
      BOOL v25 = v24 == 0;

      if (v25) {
        [(NSDictionary *)v21 setObject:v29 forKeyedSubscript:v31];
      }
    }
    v26 = v32->_recipientNamesByEmailAddress;
    v32->_recipientNamesByEmailAddress = v21;

    recipientNamesByEmailAddress = v32->_recipientNamesByEmailAddress;
  }
  return recipientNamesByEmailAddress;
}

void __53__MSInputContextHistory_recipientNamesByEmailAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = [a2 emailAddressValue];
  v6 = [*(id *)(a1 + 32) _participantNameAndEmailAddressFromEmailAddress:v5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 second];
    uint64_t v9 = [v7 first];
    [v10 setObject:v8 forKeyedSubscript:v9];
  }
}

- (NSSet)firstPerson
{
  firstPerson = self->_firstPerson;
  if (!firstPerson)
  {
    v4 = [(MSInputContextHistory *)self senderEmailAddress];
    v5 = [(MSInputContextHistory *)self _participantNameAndEmailAddressFromEmailAddress:v4];

    v6 = [v5 first];
    if (v6) {
      [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    }
    else {
    v7 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v8 = self->_firstPerson;
    self->_firstPerson = v7;

    firstPerson = self->_firstPerson;
  }
  return firstPerson;
}

- (NSSet)primaryRecipients
{
  primaryRecipients = self->_primaryRecipients;
  if (!primaryRecipients)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(MSInputContextHistory *)self toRecipientNamesByEmailAddress];
    v6 = [v5 allKeys];
    v7 = [v4 setWithArray:v6];
    uint64_t v8 = self->_primaryRecipients;
    self->_primaryRecipients = v7;

    primaryRecipients = self->_primaryRecipients;
  }
  return primaryRecipients;
}

- (NSSet)secondaryRecipients
{
  secondaryRecipients = self->_secondaryRecipients;
  if (!secondaryRecipients)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(MSInputContextHistory *)self toRecipientNamesByEmailAddress];
    v6 = [v5 allKeys];
    v7 = [v4 setWithArray:v6];
    uint64_t v8 = self->_secondaryRecipients;
    self->_secondaryRecipients = v7;

    secondaryRecipients = self->_secondaryRecipients;
  }
  return secondaryRecipients;
}

- (NSDictionary)infoDict
{
  v15[1] = *MEMORY[0x1E4F143B8];
  infoDict = self->_infoDict;
  if (!infoDict)
  {
    v4 = (void *)MEMORY[0x1E4F1CA60];
    v14 = @"hasCustomSignature";
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MSInputContextHistory hasCustomSignature](self, "hasCustomSignature"));
    v15[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v7 = [v4 dictionaryWithDictionary:v6];

    uint64_t v8 = [(MSInputContextHistory *)self subject];
    if (v8) {
      [(NSDictionary *)v7 setObject:v8 forKeyedSubscript:@"subject"];
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MSInputContextHistory showSmartReplySuggestions](self, "showSmartReplySuggestions"));
    [(NSDictionary *)v7 setObject:v9 forKeyedSubscript:@"showSmartReplySuggestions"];

    id v10 = [(MSInputContextHistory *)self originalMessageCategorySubtype];
    [(NSDictionary *)v7 setObject:v10 forKeyedSubscript:@"messageCategorySubtype"];
    v12 = self->_infoDict;
    p_infoDict = &self->_infoDict;
    *p_infoDict = v7;

    infoDict = *p_infoDict;
  }
  return infoDict;
}

- (id)_participantNamesByEmailAddressFromRecipients:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = -[MSInputContextHistory _participantNameAndEmailAddressFromEmailAddress:](self, "_participantNameAndEmailAddressFromEmailAddress:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        BOOL v11 = v10;
        if (v10)
        {
          v12 = [v10 second];
          v13 = [v11 first];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_participantNameAndEmailAddressFromEmailAddress:(id)a3
{
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(MSInputContextHistory *)self participantsByEmailAddress];
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      uint64_t v8 = [v4 displayName];
      objc_msgSend(v8, "ec_personNameComponents");
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      id v10 = [v4 simpleAddress];
      if (v10)
      {
        if (!v9)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F28F30]);
          [v9 setGivenName:v10];
        }
        id v5 = [MEMORY[0x1E4F60DF0] pairWithFirst:v10 second:v9];
      }
      else
      {
        id v5 = 0;
      }
      BOOL v11 = [(MSInputContextHistory *)self participantsByEmailAddress];
      [v11 setObject:v5 forKeyedSubscript:v4];
    }
  }

  return v5;
}

- (NSString)ef_publicDescription
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    id v31 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:2];
    id v5 = [(MSInputContextHistory *)self senderEmailAddress];
    if (v5)
    {
      id v6 = [(MSInputContextHistory *)self senderEmailAddress];
      v32[0] = v6;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F1CBF0];
    }

    BOOL v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v12);
    v27 = [(MSInputContextHistory *)self threadIdentifier];
    v26 = [v31 stringFromEmailAddressList:v30];
    v23 = [(MSInputContextHistory *)self toRecipients];
    BOOL v25 = objc_msgSend(v31, "stringFromEmailAddressList:");
    uint64_t v24 = [(MSInputContextHistory *)self ccRecipients];
    id v29 = objc_msgSend(v31, "stringFromEmailAddressList:");
    v13 = (void *)MEMORY[0x1E4F60E00];
    v14 = [(MSInputContextHistory *)self subject];
    long long v15 = objc_msgSend(v13, "ec_partiallyRedactedStringForSubjectOrSummary:", v14);
    BOOL v16 = [(MSInputContextHistory *)self hasCustomSignature];
    BOOL v17 = [(MSInputContextHistory *)self showSmartReplySuggestions];
    long long v18 = [(MSInputContextHistory *)self originalMessageCategorySubtype];
    uint64_t v19 = [(MSInputContextHistory *)self originalContentMessages];
    uint64_t v20 = [v19 count];
    id v21 = [(MSInputContextHistory *)self originalContentMessages];
    id v10 = [v11 stringWithFormat:@"<%@: %p>\n\tthreadIdentifier:%@\n\tsenderEmailAddress:%@\n\ttoRecipients:%@\n\tccRecipients:%@\n\tsubject:%@\n\thasCustomSignature:%d\n\tshowSmartReplySuggestions:%d\n\toriginalMessageCategorySubtype:%@\n\toriginalContentMessages: (%lu) %@\n", v28, self, v27, v26, v25, v29, v15, v16, v17, v18, v20, v21];
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 stringWithFormat:@"<%@: %p>", v9, self];
  }
  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (MSInputContextHistory *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(MSInputContextHistory *)self threadIdentifier];
      uint64_t v7 = [(MSInputContextHistory *)v5 threadIdentifier];
      if (EFStringsAreEqual())
      {
        uint64_t v8 = [(MSInputContextHistory *)self senderEmailAddress];
        id v9 = [(MSInputContextHistory *)v5 senderEmailAddress];
        if (EFObjectsAreEqual())
        {
          id v10 = [(MSInputContextHistory *)self toRecipients];
          BOOL v11 = [(MSInputContextHistory *)v5 toRecipients];
          if (EFObjectsAreEqual())
          {
            v23 = [(MSInputContextHistory *)self ccRecipients];
            v22 = [(MSInputContextHistory *)v5 ccRecipients];
            if (EFObjectsAreEqual())
            {
              id v21 = [(MSInputContextHistory *)self subject];
              uint64_t v20 = [(MSInputContextHistory *)v5 subject];
              if (EFStringsAreEqual()
                && (BOOL v12 = [(MSInputContextHistory *)self hasCustomSignature],
                    v12 == [(MSInputContextHistory *)v5 hasCustomSignature])
                && (BOOL v13 = [(MSInputContextHistory *)self showSmartReplySuggestions],
                    v13 == [(MSInputContextHistory *)v5 showSmartReplySuggestions]))
              {
                uint64_t v19 = [(MSInputContextHistory *)self originalMessageCategorySubtype];
                long long v18 = [(MSInputContextHistory *)v5 originalMessageCategorySubtype];
                if (EFStringsAreEqual())
                {
                  BOOL v17 = [(MSInputContextHistory *)self originalContentMessages];
                  BOOL v16 = [(MSInputContextHistory *)v5 originalContentMessages];
                  char v14 = EFObjectsAreEqual();
                }
                else
                {
                  char v14 = 0;
                }
              }
              else
              {
                char v14 = 0;
              }
            }
            else
            {
              char v14 = 0;
            }
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(MSInputContextHistory *)self threadIdentifier];
  uint64_t v4 = [v3 hash];

  id v5 = [(MSInputContextHistory *)self senderEmailAddress];
  uint64_t v6 = [v5 hash];

  uint64_t v7 = [(MSInputContextHistory *)self toRecipients];
  uint64_t v8 = [v7 hash];

  id v9 = [(MSInputContextHistory *)self ccRecipients];
  uint64_t v10 = [v9 hash];

  BOOL v11 = [(MSInputContextHistory *)self subject];
  uint64_t v12 = [v11 hash];

  BOOL v13 = [(MSInputContextHistory *)self hasCustomSignature];
  BOOL v14 = [(MSInputContextHistory *)self showSmartReplySuggestions];
  long long v15 = [(MSInputContextHistory *)self originalMessageCategorySubtype];
  uint64_t v16 = [v15 hash];

  BOOL v17 = [(MSInputContextHistory *)self originalContentMessages];
  unint64_t v18 = 33 * (33 * (33 * (33 * (33 * (33 * (33 * (33 * v4 + v6) + v8) + v10) + v12) + v13) + v14) + v16)
      + [v17 hash]
      + 0x2A36040A9121;

  return v18;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (ECEmailAddress)senderEmailAddress
{
  return self->_senderEmailAddress;
}

- (void)setSenderEmailAddress:(id)a3
{
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (BOOL)hasCustomSignature
{
  return self->_hasCustomSignature;
}

- (void)setHasCustomSignature:(BOOL)a3
{
  self->_hasCustomSignature = a3;
}

- (BOOL)showSmartReplySuggestions
{
  return self->_showSmartReplySuggestions;
}

- (void)setShowSmartReplySuggestions:(BOOL)a3
{
  self->_showSmartReplySuggestions = a3;
}

- (NSString)originalMessageCategorySubtype
{
  return self->_originalMessageCategorySubtype;
}

- (void)setOriginalMessageCategorySubtype:(id)a3
{
}

- (NSArray)originalContentMessages
{
  return self->_originalContentMessages;
}

- (void)setOriginalContentMessages:(id)a3
{
}

- (void)setRecipientNamesByEmailAddress:(id)a3
{
}

- (void)setFirstPerson:(id)a3
{
}

- (void)setPrimaryRecipients:(id)a3
{
}

- (void)setSecondaryRecipients:(id)a3
{
}

- (void)setInfoDict:(id)a3
{
}

- (void)setToRecipientNamesByEmailAddress:(id)a3
{
}

- (void)setCcRecipientNamesByEmailAddress:(id)a3
{
}

- (NSMutableDictionary)participantsByEmailAddress
{
  return self->_participantsByEmailAddress;
}

- (void)setParticipantsByEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsByEmailAddress, 0);
  objc_storeStrong((id *)&self->_ccRecipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_toRecipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_infoDict, 0);
  objc_storeStrong((id *)&self->_secondaryRecipients, 0);
  objc_storeStrong((id *)&self->_primaryRecipients, 0);
  objc_storeStrong((id *)&self->_firstPerson, 0);
  objc_storeStrong((id *)&self->_recipientNamesByEmailAddress, 0);
  objc_storeStrong((id *)&self->_originalContentMessages, 0);
  objc_storeStrong((id *)&self->_originalMessageCategorySubtype, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end