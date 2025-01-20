@interface CKSpotlightQueryResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (CKConversation)conversation;
- (CKSpotlightQueryResult)initWithSearchableItem:(id)a3 inSection:(id)a4 withConversation:(id)a5;
- (CSSearchableItem)item;
- (LPLinkMetadata)linkMetadata;
- (NSString)description;
- (NSString)identifier;
- (NSString)messageGUID;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (void)setConversation:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItem:(id)a3;
- (void)setLinkMetadata:(id)a3;
@end

@implementation CKSpotlightQueryResult

- (CKSpotlightQueryResult)initWithSearchableItem:(id)a3 inSection:(id)a4 withConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKSpotlightQueryResult;
  v11 = [(CKSpotlightQueryResult *)&v16 init];
  if (v11)
  {
    v12 = NSString;
    v13 = [v8 uniqueIdentifier];
    v14 = [v12 stringWithFormat:@"%@-%@", v9, v13];

    [(CKSpotlightQueryResult *)v11 setIdentifier:v14];
    [(CKSpotlightQueryResult *)v11 setItem:v8];
    [(CKSpotlightQueryResult *)v11 setConversation:v10];
  }
  return v11;
}

- (NSString)messageGUID
{
  v3 = [(CKSpotlightQueryResult *)self item];
  v4 = [v3 domainIdentifier];
  char v5 = [v4 isEqualToString:@"chatDomain"];

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = [(CKSpotlightQueryResult *)self item];
    id v8 = [v7 domainIdentifier];
    int v9 = [v8 isEqualToString:@"attachmentDomain"];

    id v10 = [(CKSpotlightQueryResult *)self item];
    v11 = v10;
    if (v9)
    {
      v12 = [v10 attributeSet];
      v6 = [v12 ownerIdentifier];
    }
    else
    {
      v6 = [v10 uniqueIdentifier];
    }
  }

  return (NSString *)v6;
}

- (NSURL)previewItemURL
{
  v3 = [(CKSpotlightQueryResult *)self item];
  v4 = [v3 domainIdentifier];
  int v5 = [v4 isEqualToString:@"attachmentDomain"];

  if (v5)
  {
    v6 = [(CKSpotlightQueryResult *)self item];
    v7 = [v6 attributeSet];

    id v8 = [v7 contentURL];
    int v9 = [v7 messageType];
    int v10 = [v9 isEqualToString:@"pto"];

    if (v10)
    {
      uint64_t v11 = +[CKLivePhotoBundleUtilities getLivePhotoBundleURL:v8];
      if (v11)
      {
        v12 = (void *)v11;

        goto LABEL_8;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  id v8 = v8;
  v12 = v8;
LABEL_8:

  return (NSURL *)v12;
}

- (NSString)previewItemTitle
{
  v3 = [(CKSpotlightQueryResult *)self item];
  v4 = [v3 domainIdentifier];
  int v5 = [v4 isEqualToString:@"attachmentDomain"];

  if (v5)
  {
    v6 = [(CKSpotlightQueryResult *)self item];
    v7 = [v6 attributeSet];
    id v8 = objc_msgSend(v7, "__ck_spotlightItemSnippet");
  }
  else
  {
    id v8 = 0;
  }

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    id v8 = [(CKSpotlightQueryResult *)self identifier];
    int v9 = [v7 identifier];

    char v6 = [v8 isEqualToString:v9];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)CKSpotlightQueryResult;
  id v4 = [(CKSpotlightQueryResult *)&v14 description];
  uint64_t v5 = [(CKSpotlightQueryResult *)self messageGUID];
  char v6 = [(CKSpotlightQueryResult *)self previewItemTitle];
  id v7 = [(CKSpotlightQueryResult *)self previewItemURL];
  id v8 = [(CKSpotlightQueryResult *)self item];
  int v9 = [(CKSpotlightQueryResult *)self item];
  int v10 = [v9 attributeSet];
  uint64_t v11 = [v10 attributeDictionary];
  v12 = [v3 stringWithFormat:@"%@: messageGUID: %@, title: %@, url: %@, item: %@, item attributes: %@", v4, v5, v6, v7, v8, v11];

  return (NSString *)v12;
}

- (BOOL)isFromMe
{
  v2 = [(CKSpotlightQueryResult *)self item];
  v3 = [v2 attributeSet];

  id v4 = [v3 isFromMe];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CSSearchableItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end