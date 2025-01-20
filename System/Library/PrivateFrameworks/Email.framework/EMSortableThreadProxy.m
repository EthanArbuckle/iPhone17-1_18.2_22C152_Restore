@interface EMSortableThreadProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (EMSortableThreadProxy)initWithThread:(id)a3 originatingQuery:(id)a4;
- (EMSortableThreadProxyAdditionalProperties)properties;
- (EMThreadObjectID)objectID;
- (NSDate)date;
- (NSString)ef_publicDescription;
- (id)_setValueFromThreadAndReturnIfChanged:(id)a3 keyPath:(id)a4 isPrimary:(BOOL)a5;
- (id)_sortValueForRawValue:(id)a3 keyPath:(id)a4;
- (id)_targetForSelector:(SEL)a3;
- (id)calculateChangeFromThread:(id)a3;
- (id)primarySortValue;
- (int64_t)conversationID;
- (void)_copySortPropertiesForDescriptors:(id)a3 thread:(id)a4;
- (void)setDate:(id)a3;
- (void)setPrimarySortValue:(id)a3;
- (void)setProperties:(id)a3;
- (void)updateFromThread:(id)a3 addingAdditionalInformation:(BOOL)a4 query:(id)a5;
@end

@implementation EMSortableThreadProxy

- (EMSortableThreadProxy)initWithThread:(id)a3 originatingQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)EMSortableThreadProxy;
  v8 = [(EMSortableThreadProxy *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectID];
    objectID = v8->_objectID;
    v8->_objectID = (EMThreadObjectID *)v9;

    v11 = [v7 sortDescriptors];
    [(EMSortableThreadProxy *)v8 _copySortPropertiesForDescriptors:v11 thread:v6];

    uint64_t v12 = [v6 date];
    date = v8->_date;
    v8->_date = (NSDate *)v12;
  }
  return v8;
}

- (void)_copySortPropertiesForDescriptors:(id)a3 thread:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v13 firstObject];
  v8 = [v7 key];

  id v9 = [(EMSortableThreadProxy *)self _setValueFromThreadAndReturnIfChanged:v6 keyPath:v8 isPrimary:1];
  if ((unint64_t)[v13 count] >= 2)
  {
    v10 = [v13 objectAtIndexedSubscript:1];
    v11 = [v10 key];

    id v12 = [(EMSortableThreadProxy *)self _setValueFromThreadAndReturnIfChanged:v6 keyPath:v11 isPrimary:0];
  }
}

- (id)_setValueFromThreadAndReturnIfChanged:(id)a3 keyPath:(id)a4 isPrimary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 valueForKeyPath:v8];
  v10 = [(EMSortableThreadProxy *)self _sortValueForRawValue:v9 keyPath:v8];
  v11 = [(EMSortableThreadProxy *)self primarySortValue];
  if (v10 == v11)
  {

    id v9 = 0;
  }
  else if (v5)
  {
    [(EMSortableThreadProxy *)self setPrimarySortValue:v10];
  }

  return v9;
}

- (id)_sortValueForRawValue:(id)a3 keyPath:(id)a4
{
  id v7 = a3;
  int v8 = [a4 isEqualToString:@"flagColors"];
  id v9 = v7;
  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"EMSortableThreadProxy.m", 158, @"Invalid parameter not satisfying: %@", @"[rawSortValue isKindOfClass:[NSIndexSet class]]" object file lineNumber description];
      }
      id v10 = v7;
      if ((unint64_t)[v10 lastIndex] >= 7)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"EMSortableThreadProxy.m", 160, @"Invalid parameter not satisfying: %@", @"flagColors.lastIndex <= ECMessageFlagColorLast" object file lineNumber description];
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__EMSortableThreadProxy__sortValueForRawValue_keyPath___block_invoke;
      v15[3] = &unk_1E63E67A0;
      v15[4] = &v16;
      [v10 enumerateIndexesUsingBlock:v15];

      uint64_t v11 = v17[3];
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v9 = [NSNumber numberWithUnsignedInteger:v11];

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

uint64_t __55__EMSortableThreadProxy__sortValueForRawValue_keyPath___block_invoke(uint64_t result, char a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 1 << (6 - a2);
  return result;
}

- (void)updateFromThread:(id)a3 addingAdditionalInformation:(BOOL)a4 query:(id)a5
{
  id v27 = a3;
  id v8 = a5;
  id v9 = [v8 sortDescriptors];
  [(EMSortableThreadProxy *)self _copySortPropertiesForDescriptors:v9 thread:v27];

  id v10 = [v27 date];
  [(EMSortableThreadProxy *)self setDate:v10];

  if (a4
    || ([(EMSortableThreadProxy *)self properties],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v12 = [(EMSortableThreadProxy *)self properties];

    if (!v12)
    {
      id v13 = objc_alloc_init(EMSortableThreadProxyAdditionalProperties);
      [(EMSortableThreadProxy *)self setProperties:v13];
    }
    v14 = [v27 displayMessageObjectID];
    objc_super v15 = [v27 displayDate];
    [(EMSortableThreadProxy *)self setDisplayDate:v15];

    uint64_t v16 = [v27 category];
    [(EMSortableThreadProxy *)self setCategory:v16];

    -[EMSortableThreadProxy setBusinessID:](self, "setBusinessID:", [v27 businessID]);
    v17 = [v27 businessLogoID];
    [(EMSortableThreadProxy *)self setBusinessLogoID:v17];

    uint64_t v18 = [v27 readLater];
    [(EMSortableThreadProxy *)self setReadLater:v18];

    uint64_t v19 = [v27 sendLaterDate];
    [(EMSortableThreadProxy *)self setSendLaterDate:v19];

    -[EMSortableThreadProxy setDisplayMessageGlobalID:](self, "setDisplayMessageGlobalID:", [v14 globalMessageID]);
    v20 = [v27 senderList];
    [(EMSortableThreadProxy *)self setSenderList:v20];

    v21 = [v27 toList];
    [(EMSortableThreadProxy *)self setToList:v21];

    v22 = [v27 ccList];
    [(EMSortableThreadProxy *)self setCcList:v22];

    v23 = [v27 flags];
    [(EMSortableThreadProxy *)self setFlags:v23];

    -[EMSortableThreadProxy setHasUnflagged:](self, "setHasUnflagged:", [v27 hasUnflagged]);
    v24 = [v27 flagColors];
    [(EMSortableThreadProxy *)self setFlagColors:v24];

    -[EMSortableThreadProxy setIsVIP:](self, "setIsVIP:", [v27 isVIP]);
    -[EMSortableThreadProxy setIsBlocked:](self, "setIsBlocked:", [v27 isBlocked]);
    -[EMSortableThreadProxy setHasAttachments:](self, "setHasAttachments:", [v27 hasAttachments]);
    -[EMSortableThreadProxy setIsAuthenticated:](self, "setIsAuthenticated:", [v27 isAuthenticated]);
    -[EMSortableThreadProxy setAllowAuthenticationWarning:](self, "setAllowAuthenticationWarning:", [v27 allowAuthenticationWarning]);
    -[EMSortableThreadProxy setNumberOfMessagesInThread:](self, "setNumberOfMessagesInThread:", [v27 count]);
    v25 = [v27 mailboxObjectIDs];
    [(EMSortableThreadProxy *)self setMailboxObjectIDs:v25];

    v26 = [v27 generatedSummary];
    [(EMSortableThreadProxy *)self setGeneratedSummary:v26];
  }
}

- (id)calculateChangeFromThread:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(EMMessageListItemChange);
  id v6 = [v4 query];
  id v7 = [v6 sortDescriptors];

  v91 = v7;
  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 key];

  v90 = (void *)v9;
  uint64_t v10 = [(EMSortableThreadProxy *)self _setValueFromThreadAndReturnIfChanged:v4 keyPath:v9 isPrimary:1];
  BOOL v11 = v10 != 0;
  v92 = (void *)v10;
  if (v10) {
    [(EMMessageListItemChange *)v5 setValue:v10 forKeyPath:v90];
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v12 = [v7 objectAtIndexedSubscript:1];
    id v13 = [v12 key];

    uint64_t v14 = [(EMSortableThreadProxy *)self _setValueFromThreadAndReturnIfChanged:v4 keyPath:v13 isPrimary:0];

    if (v14)
    {
      [(EMMessageListItemChange *)v5 setValue:v14 forKeyPath:v90];
      BOOL v11 = 1;
    }

    v92 = (void *)v14;
  }
  objc_super v15 = [v4 date];
  uint64_t v16 = [(EMSortableThreadProxy *)self date];
  char v17 = [v15 isEqualToDate:v16];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = [v4 date];
    [(EMMessageListItemChange *)v5 setDate:v18];

    BOOL v11 = 1;
  }
  uint64_t v19 = [(EMSortableThreadProxy *)self properties];

  if (v19)
  {
    v82 = [v4 displayMessageObjectID];
    uint64_t v20 = [v82 globalMessageID];
    if (v20 != [(EMSortableThreadProxy *)self displayMessageGlobalID])
    {
      v21 = [v4 subject];
      v22 = v21;
      if (!v21)
      {
        v22 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setSubject:v22];
      if (!v21) {

      }
      v23 = [v4 summary];
      v24 = v23;
      if (!v23)
      {
        v24 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setSummary:v24];
      if (!v23) {

      }
      v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "unsubscribeType"));
      [(EMMessageListItemChange *)v5 setUnsubscribeType:v25];

      v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "conversationNotificationLevel"));
      [(EMMessageListItemChange *)v5 setConversationNotificationLevel:v26];

      id v27 = [v4 followUp];
      v28 = v27;
      if (!v27)
      {
        v28 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setFollowUp:v28];
      if (!v27) {

      }
      v29 = [v4 displayMessageItemID];
      [(EMMessageListItemChange *)v5 setDisplayMessageItemID:v29];

      LOBYTE(v11) = 1;
    }
    v30 = [v4 displayDate];
    v31 = [(EMSortableThreadProxy *)self displayDate];
    char v32 = [v30 isEqualToDate:v31];

    if ((v32 & 1) == 0)
    {
      v33 = [v4 displayDate];
      [(EMMessageListItemChange *)v5 setDisplayDate:v33];

      LOBYTE(v11) = 1;
    }
    v86 = [v4 category];
    v34 = [(EMSortableThreadProxy *)self category];
    char v35 = EFObjectsAreEqual();

    if ((v35 & 1) == 0)
    {
      v36 = v86;
      if (!v86)
      {
        v36 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setCategory:v36];
      if (!v86) {

      }
      LOBYTE(v11) = 1;
    }
    uint64_t v37 = [v4 businessID];
    if (v37 != [(EMSortableThreadProxy *)self businessID])
    {
      v38 = [NSNumber numberWithLongLong:v37];
      [(EMMessageListItemChange *)v5 setBusinessID:v38];

      LOBYTE(v11) = 1;
    }
    v89 = [v4 businessLogoID];
    v39 = [(EMSortableThreadProxy *)self businessLogoID];

    if (v89 != v39)
    {
      v40 = v89;
      if (!v89)
      {
        v40 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setBusinessLogoID:v40];
      if (!v89) {

      }
      LOBYTE(v11) = 1;
    }
    v85 = [v4 sendLaterDate];
    v41 = [(EMSortableThreadProxy *)self sendLaterDate];
    char v42 = EFObjectsAreEqual();

    if ((v42 & 1) == 0)
    {
      v43 = v85;
      if (!v85)
      {
        v43 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setSendLaterDate:v43];
      if (!v85) {

      }
      LOBYTE(v11) = 1;
    }
    v84 = [v4 readLater];
    v44 = [(EMSortableThreadProxy *)self readLater];
    char v45 = EFObjectsAreEqual();

    if ((v45 & 1) == 0)
    {
      v46 = v84;
      if (!v84)
      {
        v46 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setReadLater:v46];
      if (!v84) {

      }
      LOBYTE(v11) = 1;
    }
    v83 = [v4 senderList];
    v47 = [(EMSortableThreadProxy *)self senderList];
    char v48 = EFArraysAreEqual();

    if ((v48 & 1) == 0)
    {
      [(EMMessageListItemChange *)v5 setSenderList:v83];
      LOBYTE(v11) = 1;
    }
    v88 = [v4 toList];
    v49 = [(EMSortableThreadProxy *)self toList];
    char v50 = EFArraysAreEqual();

    if ((v50 & 1) == 0)
    {
      [(EMMessageListItemChange *)v5 setToList:v88];
      LOBYTE(v11) = 1;
    }
    v87 = [v4 ccList];
    v51 = [(EMSortableThreadProxy *)self ccList];
    char v52 = EFArraysAreEqual();

    if ((v52 & 1) == 0)
    {
      [(EMMessageListItemChange *)v5 setCcList:v87];
      LOBYTE(v11) = 1;
    }
    v53 = [v4 flags];
    v54 = [(EMSortableThreadProxy *)self flags];
    char v55 = EFObjectsAreEqual();

    if ((v55 & 1) == 0)
    {
      [(EMMessageListItemChange *)v5 setFlags:v53];
      LOBYTE(v11) = 1;
    }
    uint64_t v56 = [v4 hasUnflagged];
    if (v56 != [(EMSortableThreadProxy *)self hasUnflagged])
    {
      v57 = [NSNumber numberWithBool:v56];
      [(EMMessageListItemChange *)v5 setHasUnflagged:v57];

      LOBYTE(v11) = 1;
    }
    v58 = [v4 flagColors];
    v59 = [(EMSortableThreadProxy *)self flagColors];
    char v60 = EFObjectsAreEqual();

    if ((v60 & 1) == 0)
    {
      v61 = v58;
      if (!v58)
      {
        v61 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setFlagColors:v61];
      if (!v58) {

      }
      LOBYTE(v11) = 1;
    }
    uint64_t v62 = [v4 isVIP];
    if (v62 != [(EMSortableThreadProxy *)self isVIP])
    {
      v63 = [NSNumber numberWithBool:v62];
      [(EMMessageListItemChange *)v5 setIsVIP:v63];

      LOBYTE(v11) = 1;
    }
    uint64_t v64 = [v4 isBlocked];
    if (v64 != [(EMSortableThreadProxy *)self isBlocked])
    {
      v65 = [NSNumber numberWithBool:v64];
      [(EMMessageListItemChange *)v5 setIsBlocked:v65];

      LOBYTE(v11) = 1;
    }
    uint64_t v66 = [(EMSortableThreadProxy *)self hasAttachments];
    if (v66 != [(EMSortableThreadProxy *)self hasAttachments])
    {
      v67 = [NSNumber numberWithBool:v66];
      [(EMMessageListItemChange *)v5 setHasAttachments:v67];

      LOBYTE(v11) = 1;
    }
    uint64_t v68 = [(EMSortableThreadProxy *)self isAuthenticated];
    if (v68 != [(EMSortableThreadProxy *)self isAuthenticated])
    {
      v69 = [NSNumber numberWithBool:v68];
      [(EMMessageListItemChange *)v5 setIsAuthenticated:v69];

      LOBYTE(v11) = 1;
    }
    uint64_t v70 = [(EMSortableThreadProxy *)self allowAuthenticationWarning];
    if (v70 != [(EMSortableThreadProxy *)self allowAuthenticationWarning])
    {
      v71 = [NSNumber numberWithBool:v70];
      [(EMMessageListItemChange *)v5 setAllowAuthenticationWarning:v71];

      LOBYTE(v11) = 1;
    }
    uint64_t v72 = [v4 count];
    if (v72 != [(EMSortableThreadProxy *)self numberOfMessagesInThread])
    {
      v73 = [NSNumber numberWithUnsignedInteger:v72];
      [(EMMessageListItemChange *)v5 setCount:v73];

      LOBYTE(v11) = 1;
    }
    v74 = [v4 mailboxObjectIDs];
    v75 = [(EMSortableThreadProxy *)self mailboxObjectIDs];
    if ((EFArraysAreEqual() & 1) == 0)
    {
      [(EMMessageListItemChange *)v5 setMailboxObjectIDs:v74];
      LOBYTE(v11) = 1;
    }
    v76 = [v4 generatedSummary];
    v77 = [(EMSortableThreadProxy *)self generatedSummary];
    char v78 = [v76 isEqual:v77];

    if ((v78 & 1) == 0)
    {
      v79 = v76;
      if (!v76)
      {
        v79 = [MEMORY[0x1E4F1CA98] null];
      }
      [(EMMessageListItemChange *)v5 setGeneratedSummary:v79];
      if (!v76) {

      }
      LOBYTE(v11) = 1;
    }

    if (v11) {
      goto LABEL_89;
    }
  }
  else if (v11)
  {
LABEL_89:
    v80 = v5;
    goto LABEL_92;
  }
  v80 = 0;
LABEL_92:

  return v80;
}

- (int64_t)conversationID
{
  v2 = [(EMSortableThreadProxy *)self objectID];
  int64_t v3 = [v2 conversationID];

  return v3;
}

- (id)_targetForSelector:(SEL)a3
{
  id v4 = [(EMSortableThreadProxy *)self properties];
  if (objc_opt_respondsToSelector()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5 = [(EMSortableThreadProxy *)self properties];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EMSortableThreadProxy;
    BOOL v6 = [(EMSortableThreadProxy *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (NSString)ef_publicDescription
{
  id v3 = [(EMSortableThreadProxy *)self primarySortValue];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v3];

    id v4 = (void *)v5;
  }
  BOOL v6 = (void *)[[NSString alloc] initWithFormat:@"[%lld - %@]", -[EMSortableThreadProxy conversationID](self, "conversationID"), v4];

  return (NSString *)v6;
}

- (EMThreadObjectID)objectID
{
  return self->_objectID;
}

- (id)primarySortValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimarySortValue:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
}

- (EMSortableThreadProxyAdditionalProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong(&self->_primarySortValue, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end