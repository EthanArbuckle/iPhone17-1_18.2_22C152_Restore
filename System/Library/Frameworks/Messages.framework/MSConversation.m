@interface MSConversation
+ (id)activeConversation;
- (BOOL)isBusiness;
- (BOOL)isiMessage;
- (MSConversationDelegate)delegate;
- (MSMessage)selectedMessage;
- (NSArray)contextItems;
- (NSArray)draftAssetArchives;
- (NSArray)recipientAddresses;
- (NSArray)remoteParticipantIdentifiers;
- (NSData)engramID;
- (NSString)conversationIdentifier;
- (NSString)generatedSummary;
- (NSString)groupID;
- (NSString)iMessageLoginID;
- (NSString)senderAddress;
- (NSUUID)identifier;
- (NSUUID)localParticipantIdentifier;
- (_MSMessageAppContext)context;
- (id)_initWithState:(id)a3 context:(id)a4;
- (void)_insertAssetArchive:(id)a3 completionHandler:(id)a4;
- (void)_insertAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_insertAttachment:(id)a3 adamID:(id)a4 appName:(id)a5 completionHandler:(id)a6;
- (void)_insertAttachment:(id)a3 withAlternateFilename:(id)a4 skipShelf:(BOOL)a5 generativePlaygroundRecipe:(id)a6 completionHandler:(id)a7;
- (void)_insertMessage:(id)a3 localizedChangeDescription:(id)a4 skipShelf:(BOOL)a5 completionHandler:(id)a6;
- (void)_insertMessage:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_insertRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 frameInWindowCoordinates:(CGRect)a5 completionHandler:(id)a6;
- (void)_insertText:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_sendAssetArchive:(id)a3 completionHandler:(id)a4;
- (void)_updateWithState:(id)a3;
- (void)insertAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler;
- (void)insertImage:(id)a3 completionHandler:(id)a4;
- (void)insertMediaAtURL:(id)a3 attributionURL:(id)a4 attributionIcon:(id)a5 completionHandler:(id)a6;
- (void)insertMediaAtURL:(id)a3 completionHandler:(id)a4;
- (void)insertMessage:(MSMessage *)message completionHandler:(void *)completionHandler;
- (void)insertMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5;
- (void)insertRichLink:(id)a3 completionHandler:(id)a4;
- (void)insertSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler;
- (void)insertSticker:(id)a3 withSourceFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)insertStickerWithImage:(id)a3 completionHandler:(id)a4;
- (void)insertStickerWithMediaAtURL:(id)a3 completionHandler:(id)a4;
- (void)insertText:(NSString *)text completionHandler:(void *)completionHandler;
- (void)sendAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler;
- (void)sendMessage:(MSMessage *)message completionHandler:(void *)completionHandler;
- (void)sendMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5;
- (void)sendRichLink:(id)a3 completionHandler:(id)a4;
- (void)sendSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler;
- (void)sendText:(NSString *)text completionHandler:(void *)completionHandler;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteParticipantIdentifiers:(id)a3;
- (void)setSelectedMessage:(id)a3;
@end

@implementation MSConversation

- (void)insertMediaAtURL:(id)a3 attributionURL:(id)a4 attributionIcon:(id)a5 completionHandler:(id)a6
{
  id v18 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v13 setMediaURL:v12];

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [v11 absoluteString];

  if (v15) {
    CFDictionarySetValue(v14, @"url", v15);
  }

  if (v18)
  {
    v16 = _UIImageJPEGRepresentation();
    if (v16) {
      CFDictionarySetValue(v14, @"icon", v16);
    }
  }
  if ([(__CFDictionary *)v14 count]) {
    [(_MSMessageMediaPayload *)v13 setAttributionInfo:v14];
  }
  v17 = [(MSConversation *)self context];
  [v17 stageMediaItem:v13 skipShelf:0 forceStage:0 completionHandler:v10];
}

- (void)insertMediaAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)insertImage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v9 setImage:v7];

  v8 = [(MSConversation *)self context];
  [v8 stageMediaItem:v9 skipShelf:0 forceStage:0 completionHandler:v6];
}

- (void)insertStickerWithImage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v9 setImage:v7];

  v8 = [(MSConversation *)self context];
  [v8 stageMediaItem:v9 skipShelf:0 forceStage:0 completionHandler:v6];
}

- (void)insertStickerWithMediaAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v9 setMediaURL:v7];

  v8 = [(MSConversation *)self context];
  [v8 stageMediaItem:v9 skipShelf:0 forceStage:0 completionHandler:v6];
}

+ (id)activeConversation
{
  v2 = +[_MSMessageAppContext activeExtensionContext];
  v3 = [v2 activeConversation];

  return v3;
}

- (id)_initWithState:(id)a3 context:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)MSConversation;
  v8 = [(MSConversation *)&v58 init];
  if (v8)
  {
    id v51 = v7;
    id v52 = a4;
    uint64_t v9 = [v6 conversationIdentifier];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    id v11 = [v6 senderIdentifier];
    uint64_t v12 = [v11 copy];
    localParticipantIdentifier = v8->_localParticipantIdentifier;
    v8->_localParticipantIdentifier = (NSUUID *)v12;

    v14 = [v6 recipientIdentifiers];
    uint64_t v15 = [v14 copy];
    remoteParticipantIdentifiers = v8->_remoteParticipantIdentifiers;
    v8->_remoteParticipantIdentifiers = (NSArray *)v15;

    uint64_t v17 = [v6 activeMessage];
    selectedMessage = v8->_selectedMessage;
    v8->_selectedMessage = (MSMessage *)v17;

    uint64_t v19 = [v6 conversationID];
    conversationIdentifier = v8->_conversationIdentifier;
    v8->_conversationIdentifier = (NSString *)v19;

    uint64_t v21 = [v6 conversationEngramID];
    engramID = v8->_engramID;
    v8->_engramID = (NSData *)v21;

    uint64_t v23 = [v6 groupID];
    groupID = v8->_groupID;
    v8->_groupID = (NSString *)v23;

    uint64_t v25 = [v6 iMessageLoginID];
    iMessageLoginID = v8->_iMessageLoginID;
    v8->_iMessageLoginID = (NSString *)v25;

    uint64_t v27 = [v6 senderAddress];
    senderAddress = v8->_senderAddress;
    v8->_senderAddress = (NSString *)v27;

    uint64_t v29 = [v6 recipientAddresses];
    recipientAddresses = v8->_recipientAddresses;
    v8->_recipientAddresses = (NSArray *)v29;

    uint64_t v31 = [v6 generatedSummary];
    generatedSummary = v8->_generatedSummary;
    v50 = v8;
    v8->_generatedSummary = (NSString *)v31;

    v33 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [v6 conversationContext];
    uint64_t v34 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v55 != v36) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v39 = objc_alloc_init(MSConversationContextItem);
          v40 = [v38 objectForKeyedSubscript:@"CKGenerativeContextTimestamp"];
          [(MSConversationContextItem *)v39 setTimestamp:v40];

          v41 = [v38 objectForKeyedSubscript:@"CKGenerativeContextText"];
          [(MSConversationContextItem *)v39 setMessageContent:v41];

          v42 = [v38 objectForKeyedSubscript:@"CKGenerativeContextHandle"];
          [(MSConversationContextItem *)v39 setSenderHandle:v42];

          v43 = [v38 objectForKeyedSubscript:@"CKGenerativeContextDisplayName"];
          [(MSConversationContextItem *)v39 setSenderDisplayName:v43];

          [v33 addObject:v39];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v35);
    }

    uint64_t v44 = [v33 copy];
    v8 = v50;
    contextItems = v50->_contextItems;
    v50->_contextItems = (NSArray *)v44;

    v50->_isiMessage = [v6 isiMessage];
    v50->_isBusiness = [v6 isBusiness];
    v46 = [v6 draftAssetArchives];
    uint64_t v47 = [v46 copy];
    draftAssetArchives = v50->_draftAssetArchives;
    v50->_draftAssetArchives = (NSArray *)v47;

    objc_storeStrong((id *)&v50->_context, v52);
    id v7 = v51;
  }

  return v8;
}

- (void)_updateWithState:(id)a3
{
  id v4 = a3;
  remoteParticipantIdentifiers = self->_remoteParticipantIdentifiers;
  id v16 = v4;
  id v6 = [v4 recipientIdentifiers];
  LOBYTE(remoteParticipantIdentifiers) = [(NSArray *)remoteParticipantIdentifiers isEqual:v6];

  if ((remoteParticipantIdentifiers & 1) == 0)
  {
    id v7 = [v16 recipientIdentifiers];
    [(MSConversation *)self setRemoteParticipantIdentifiers:v7];
  }
  selectedMessage = self->_selectedMessage;
  if (!selectedMessage
    || ([v16 activeMessage],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [(MSMessage *)selectedMessage isEqual:v9],
        v9,
        !v10))
  {
    id v11 = [(MSConversation *)self delegate];
    uint64_t v12 = [v16 activeMessage];
    [v11 _conversation:self willSelectMessage:v12];

    v13 = [v16 activeMessage];
    [(MSConversation *)self setSelectedMessage:v13];

    v14 = [(MSConversation *)self delegate];
    uint64_t v15 = [v16 activeMessage];
    [v14 _conversation:self didSelectMessage:v15];
  }
}

- (void)insertMessage:(MSMessage *)message completionHandler:(void *)completionHandler
{
}

- (void)insertMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5
{
}

- (void)insertText:(NSString *)text completionHandler:(void *)completionHandler
{
}

- (void)insertAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler
{
}

- (void)insertRichLink:(id)a3 completionHandler:(id)a4
{
}

- (void)insertSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler
{
}

- (void)insertSticker:(id)a3 withSourceFrame:(CGRect)a4 completionHandler:(id)a5
{
}

- (void)sendMessage:(MSMessage *)message completionHandler:(void *)completionHandler
{
}

- (void)sendMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5
{
}

- (void)sendText:(NSString *)text completionHandler:(void *)completionHandler
{
}

- (void)sendAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler
{
}

- (void)sendRichLink:(id)a3 completionHandler:(id)a4
{
}

- (void)sendSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler
{
}

- (void)_insertMessage:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = [(MSConversation *)self context];
  id v12 = v10;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__block_literal_global_6;
  }
  [v10 stageAppItem:v9 skipShelf:v5 completionHandler:v11];
}

- (void)_insertMessage:(id)a3 localizedChangeDescription:(id)a4 skipShelf:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  [v11 setBreadcrumbText:a4];
  id v12 = [(MSConversation *)self context];
  id v14 = v12;
  if (v10) {
    v13 = v10;
  }
  else {
    v13 = &__block_literal_global_20;
  }
  [v12 stageAppItem:v11 skipShelf:v6 completionHandler:v13];
}

- (void)_insertText:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v13 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v13 setText:v9];

  id v10 = [(MSConversation *)self context];
  id v11 = v10;
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = &__block_literal_global_23;
  }
  [v10 stageMediaItem:v13 skipShelf:v5 forceStage:0 completionHandler:v12];
}

- (void)_insertAttachment:(id)a3 withAlternateFilename:(id)a4 skipShelf:(BOOL)a5 generativePlaygroundRecipe:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v23 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  uint64_t v15 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v15 setMediaURL:v23];
  if (!v12
    || ([v12 pathExtension],
        id v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 length],
        v16,
        !v17))
  {
    id v18 = [v23 standardizedURL];
    uint64_t v19 = [v18 lastPathComponent];

    id v12 = (id)v19;
  }
  [(_MSMessageMediaPayload *)v15 setMediaFilename:v12];
  [(_MSMessageMediaPayload *)v15 setGenerativePlaygroundRecipeData:v14];

  v20 = [(MSConversation *)self context];
  uint64_t v21 = v20;
  if (v13) {
    v22 = v13;
  }
  else {
    v22 = &__block_literal_global_25;
  }
  [v20 stageMediaItem:v15 skipShelf:v9 forceStage:0 completionHandler:v22];
}

- (void)_insertRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MSConversation *)self context];
  id v12 = v10;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__block_literal_global_27;
  }
  [v10 stageRichLink:v9 skipShelf:v5 completionHandler:v11];
}

- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v13 = [[_MSMessageMediaPayload alloc] initWithSticker:v9];

  id v10 = [(MSConversation *)self context];
  id v11 = v10;
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = &__block_literal_global_29;
  }
  [v10 stageMediaItem:v13 skipShelf:v5 forceStage:0 completionHandler:v12];
}

- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 frameInWindowCoordinates:(CGRect)a5 completionHandler:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v10 = a4;
  id v13 = a6;
  id v14 = a3;
  id v18 = [[_MSMessageMediaPayload alloc] initWithSticker:v14];

  -[_MSMessageMediaPayload setSourceFrame:](v18, "setSourceFrame:", x, y, width, height);
  uint64_t v15 = [(MSConversation *)self context];
  id v16 = v15;
  if (v13) {
    uint64_t v17 = v13;
  }
  else {
    uint64_t v17 = &__block_literal_global_31;
  }
  [v15 stageMediaItem:v18 skipShelf:v10 forceStage:0 completionHandler:v17];
}

- (void)_insertAttachment:(id)a3 adamID:(id)a4 appName:(id)a5 completionHandler:(id)a6
{
  id v16 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = objc_alloc_init(_MSMessageMediaPayload);
  [(_MSMessageMediaPayload *)v13 setMediaURL:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v16 && ([v16 isEqualToNumber:&unk_1F406F0D8] & 1) == 0) {
    [v14 setValue:v16 forKey:@"adam-id"];
  }
  if ([v10 length]) {
    [v14 setValue:v10 forKey:@"name"];
  }
  if ([v14 count]) {
    [(_MSMessageMediaPayload *)v13 setAttributionInfo:v14];
  }
  uint64_t v15 = [(MSConversation *)self context];
  [v15 stageMediaItem:v13 skipShelf:0 forceStage:0 completionHandler:v11];
}

- (void)_insertAssetArchive:(id)a3 completionHandler:(id)a4
{
}

- (void)_sendAssetArchive:(id)a3 completionHandler:(id)a4
{
}

- (void)_insertAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MSConversation *)self context];
  id v12 = v10;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__block_literal_global_35;
  }
  [v10 stageAssetArchive:v9 skipShelf:v5 completionHandler:v11];
}

- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSConversation *)self context];
  [v8 removeAssetArchiveWithIdentifier:v7 completionHandler:v6];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSData)engramID
{
  return self->_engramID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (MSMessage)selectedMessage
{
  return self->_selectedMessage;
}

- (void)setSelectedMessage:(id)a3
{
}

- (NSUUID)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (NSArray)remoteParticipantIdentifiers
{
  return self->_remoteParticipantIdentifiers;
}

- (void)setRemoteParticipantIdentifiers:(id)a3
{
}

- (_MSMessageAppContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)draftAssetArchives
{
  return self->_draftAssetArchives;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSString)iMessageLoginID
{
  return self->_iMessageLoginID;
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (NSString)generatedSummary
{
  return self->_generatedSummary;
}

- (NSArray)contextItems
{
  return self->_contextItems;
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (MSConversationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSConversationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextItems, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_iMessageLoginID, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_draftAssetArchives, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_localParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedMessage, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end