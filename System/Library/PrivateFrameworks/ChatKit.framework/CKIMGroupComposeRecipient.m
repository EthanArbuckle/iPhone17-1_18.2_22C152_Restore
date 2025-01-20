@interface CKIMGroupComposeRecipient
+ (BOOL)supportsSecureCoding;
+ (id)composeRecipientWithConversation:(id)a3 searchTerm:(id)a4 matchingRecipient:(id)a5;
- (BOOL)isRemovableFromSearchResults;
- (CKIMComposeRecipient)matchingRecipient;
- (CKIMGroupComposeRecipient)initWithCoder:(id)a3;
- (CKIMGroupComposeRecipient)initWithGUID:(id)a3 displayString:(id)a4 detailsString:(id)a5 handles:(id)a6 lastMessageDate:(id)a7 searchTerm:(id)a8 matchingRecipient:(id)a9;
- (NSArray)composeRecipients;
- (NSArray)handles;
- (NSDate)lastMessageDate;
- (NSString)conversationGUID;
- (NSString)detailsString;
- (id)address;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationGUID:(id)a3;
- (void)setDetailsString:(id)a3;
- (void)setHandles:(id)a3;
- (void)setLastMessageDate:(id)a3;
- (void)setMatchingRecipient:(id)a3;
@end

@implementation CKIMGroupComposeRecipient

+ (id)composeRecipientWithConversation:(id)a3 searchTerm:(id)a4 matchingRecipient:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 chat];
  v11 = [v10 lastMessage];
  if (v11)
  {
    v12 = [v10 lastMessage];
    uint64_t v13 = [v12 time];
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v10, "lastMessageTimeStampOnLoad"));
  }

  if ([v7 hasDisplayName])
  {
    v14 = [v7 displayName];
  }
  else
  {
    v14 = 0;
  }
  v25 = v10;
  v15 = (void *)v13;
  v16 = v9;
  v17 = v8;
  if ([v7 hasDisplayName])
  {
    v18 = [v7 name];
  }
  else
  {
    v18 = 0;
  }
  v19 = [CKIMGroupComposeRecipient alloc];
  v20 = [v7 chat];
  v21 = [v20 guid];
  v22 = [v7 handles];
  v23 = [(CKIMGroupComposeRecipient *)v19 initWithGUID:v21 displayString:v14 detailsString:v18 handles:v22 lastMessageDate:v15 searchTerm:v16 matchingRecipient:v17];

  return v23;
}

- (CKIMGroupComposeRecipient)initWithGUID:(id)a3 displayString:(id)a4 detailsString:(id)a5 handles:(id)a6 lastMessageDate:(id)a7 searchTerm:(id)a8 matchingRecipient:(id)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v30 = a4;
  id v31 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [[CKIMComposeRecipient alloc] initWithHandle:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }

  v33.receiver = self;
  v33.super_class = (Class)CKIMGroupComposeRecipient;
  v25 = [(CNComposeRecipientGroup *)&v33 initWithChildren:v18 displayString:v30];
  v26 = v25;
  if (v25)
  {
    [(CKIMGroupComposeRecipient *)v25 setConversationGUID:v32];
    [(CKIMGroupComposeRecipient *)v26 setDetailsString:v31];
    [(CKIMGroupComposeRecipient *)v26 setHandles:v19];
    [(CKIMGroupComposeRecipient *)v26 setLastMessageDate:v15];
    [(CKIMGroupComposeRecipient *)v26 setMatchingRecipient:v17];
    id v27 = objc_alloc_init(MEMORY[0x1E4F5A158]);
    [v27 setResultType:1];
    [v27 setSearchTerm:v16];
    [(CKIMGroupComposeRecipient *)v26 setOriginContext:v27];
  }
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKIMGroupComposeRecipient;
  id v4 = a3;
  [(CKIMGroupComposeRecipient *)&v10 encodeWithCoder:v4];
  v5 = [(CKIMGroupComposeRecipient *)self conversationGUID];
  [v4 encodeObject:v5 forKey:@"conversationGUID"];

  v6 = [(CKIMGroupComposeRecipient *)self detailsString];
  [v4 encodeObject:v6 forKey:@"detailsString"];

  id v7 = [(CKIMGroupComposeRecipient *)self handles];
  [v4 encodeObject:v7 forKey:@"handles"];

  id v8 = [(CKIMGroupComposeRecipient *)self lastMessageDate];
  [v4 encodeObject:v8 forKey:@"lastMessageDate"];

  id v9 = [(CKIMGroupComposeRecipient *)self matchingRecipient];
  [v4 encodeObject:v9 forKey:@"matchingRecipient"];
}

- (CKIMGroupComposeRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKIMGroupComposeRecipient;
  v5 = [(CKIMGroupComposeRecipient *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationGUID"];
    conversationGUID = v5->_conversationGUID;
    v5->_conversationGUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailsString"];
    detailsString = v5->_detailsString;
    v5->_detailsString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handles"];
    handles = v5->_handles;
    v5->_handles = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastMessageDate"];
    lastMessageDate = v5->_lastMessageDate;
    v5->_lastMessageDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingRecipient"];
    matchingRecipient = v5->_matchingRecipient;
    v5->_matchingRecipient = (CKIMComposeRecipient *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isRemovableFromSearchResults
{
  return 0;
}

- (id)address
{
  v3 = [(CKIMGroupComposeRecipient *)self conversationGUID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKIMGroupComposeRecipient;
    id v5 = [(CNComposeRecipientGroup *)&v8 address];
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSString)conversationGUID
{
  return self->_conversationGUID;
}

- (void)setConversationGUID:(id)a3
{
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSDate)lastMessageDate
{
  return self->_lastMessageDate;
}

- (void)setLastMessageDate:(id)a3
{
}

- (CKIMComposeRecipient)matchingRecipient
{
  return self->_matchingRecipient;
}

- (void)setMatchingRecipient:(id)a3
{
}

- (NSString)detailsString
{
  return self->_detailsString;
}

- (void)setDetailsString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsString, 0);
  objc_storeStrong((id *)&self->_matchingRecipient, 0);
  objc_storeStrong((id *)&self->_lastMessageDate, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);

  objc_storeStrong((id *)&self->_conversationGUID, 0);
}

@end