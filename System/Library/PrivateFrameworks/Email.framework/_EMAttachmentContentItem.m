@interface _EMAttachmentContentItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isAvailableLocally;
- (EMMailDropMetadata)mailDropMetadata;
- (NSArray)availableRepresentations;
- (NSString)contentID;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSString)uniformTypeIdentifier;
- (UTType)type;
- (_EMAttachmentContentItem)init;
- (_EMAttachmentContentItem)initWithCoder:(id)a3;
- (id)loaderBlock;
- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4;
- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (int)exchangeEventUID;
- (int64_t)dataTransferByteCount;
- (int64_t)storageByteCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableRepresentations:(id)a3;
- (void)setContentID:(id)a3;
- (void)setDataTransferByteCount:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setExchangeEventUID:(int)a3;
- (void)setIsAvailableLocally:(BOOL)a3;
- (void)setLoaderBlock:(id)a3;
- (void)setMailDropMetadata:(id)a3;
- (void)setStorageByteCount:(int64_t)a3;
- (void)setUniformTypeIdentifier:(id)a3;
@end

@implementation _EMAttachmentContentItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMAttachmentContentItem)init
{
  return [(EMObject *)self initWithObjectID:0];
}

- (_EMAttachmentContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_EMAttachmentContentItem;
  v5 = [(EMObject *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_availableRepresentations"];
    availableRepresentations = v5->_availableRepresentations;
    v5->_availableRepresentations = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_uniformTypeIdentifier"];
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailDropMetadata"];
    mailDropMetadata = v5->_mailDropMetadata;
    v5->_mailDropMetadata = (EMMailDropMetadata *)v17;

    v5->_isAvailableLocally = [v4 decodeBoolForKey:@"EFPropertyKey_isAvailableLocally"];
    v5->_dataTransferByteCount = [v4 decodeInt64ForKey:@"EFPropertyKey_dataTransferByteCount"];
    v5->_storageByteCount = [v4 decodeInt64ForKey:@"EFPropertyKey_storageByteCount"];
    v5->_exchangeEventUID = [v4 decodeIntegerForKey:@"EFPropertyKey_exchangeEventUID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMAttachmentContentItem;
  [(EMObject *)&v10 encodeWithCoder:v4];
  v5 = [(_EMAttachmentContentItem *)self availableRepresentations];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_availableRepresentations"];

  v6 = [(_EMAttachmentContentItem *)self contentID];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_contentID"];

  uint64_t v7 = [(_EMAttachmentContentItem *)self displayName];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_displayName"];

  v8 = [(_EMAttachmentContentItem *)self uniformTypeIdentifier];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_uniformTypeIdentifier"];

  uint64_t v9 = [(_EMAttachmentContentItem *)self mailDropMetadata];
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_mailDropMetadata"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_EMAttachmentContentItem isAvailableLocally](self, "isAvailableLocally"), @"EFPropertyKey_isAvailableLocally");
  objc_msgSend(v4, "encodeInt64:forKey:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), @"EFPropertyKey_dataTransferByteCount");
  objc_msgSend(v4, "encodeInt64:forKey:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), @"EFPropertyKey_storageByteCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_EMAttachmentContentItem exchangeEventUID](self, "exchangeEventUID"), @"EFPropertyKey_exchangeEventUID");
}

- (NSString)debugDescription
{
  v18 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), 1);
  v3 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), 1);
  id v4 = NSString;
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [(EMObject *)self objectID];
  if ([(_EMAttachmentContentItem *)self isAvailableLocally]) {
    v5 = @"local";
  }
  else {
    v5 = @"remote";
  }
  v6 = [(_EMAttachmentContentItem *)self contentID];
  uint64_t v7 = [(_EMAttachmentContentItem *)self displayName];
  v8 = [(_EMAttachmentContentItem *)self uniformTypeIdentifier];
  uint64_t v9 = [(_EMAttachmentContentItem *)self exchangeEventUID];
  uint64_t v15 = [(_EMAttachmentContentItem *)self availableRepresentations];
  objc_super v10 = [v15 componentsJoinedByString:@", "];
  uint64_t v11 = [(_EMAttachmentContentItem *)self mailDropMetadata];
  v12 = @"YES";
  if (!v11) {
    v12 = @"NO";
  }
  uint64_t v13 = [v4 stringWithFormat:@"<%@: %p> %@, %@, size=%@/%@, contentID=%@, displayName=%@, uniformTypeIdentifier=%@, exchangeEventID=%d, representations=(%@) isMailDrop=%@", v16, self, v17, v5, v18, v3, v6, v7, v8, v9, v10, v12];

  return (NSString *)v13;
}

- (NSString)ef_publicDescription
{
  v21 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem storageByteCount](self, "storageByteCount"), 1);
  v3 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[_EMAttachmentContentItem dataTransferByteCount](self, "dataTransferByteCount"), 1);
  id v4 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v4 isInternal])
  {
    objc_super v20 = [(id)objc_opt_class() description];
  }
  else
  {
    objc_super v20 = @"id<EMContentItem>";
  }

  v5 = (void *)MEMORY[0x1E4F60E00];
  v6 = [(_EMAttachmentContentItem *)self displayName];
  uint64_t v7 = [v5 fullyOrPartiallyRedactedStringForString:v6];

  if ([(_EMAttachmentContentItem *)self exchangeEventUID] <= 0)
  {
    int v9 = [(_EMAttachmentContentItem *)self exchangeEventUID];
    v8 = @"NO";
    if (v9 < 0) {
      v8 = @"INVALID";
    }
  }
  else
  {
    v8 = @"YES";
  }
  objc_super v10 = v8;
  uint64_t v11 = NSString;
  v19 = [(EMObject *)self objectID];
  if ([(_EMAttachmentContentItem *)self isAvailableLocally]) {
    v12 = @"local";
  }
  else {
    v12 = @"remote";
  }
  uint64_t v13 = [(_EMAttachmentContentItem *)self contentID];
  v14 = [(_EMAttachmentContentItem *)self uniformTypeIdentifier];
  uint64_t v15 = [(_EMAttachmentContentItem *)self availableRepresentations];
  uint64_t v16 = [v15 componentsJoinedByString:@", "];
  uint64_t v17 = [v11 stringWithFormat:@"<%@: %p> %@, %@, size=%@/%@, contentID=%@, displayName=%@, uniformTypeIdentifier=%@, exchangeEvent=%@, representations=(%@)", v20, self, v19, v12, v21, v3, v13, v7, v14, v10, v16];

  return (NSString *)v17;
}

- (UTType)type
{
  v3 = [(_EMAttachmentContentItem *)self uniformTypeIdentifier];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F442D8];
    v5 = [(_EMAttachmentContentItem *)self uniformTypeIdentifier];
    v6 = [v4 typeWithIdentifier:v5];
  }
  else
  {
    v6 = 0;
  }

  return (UTType *)v6;
}

- (id)requestRepresentationWithOptions:(id)a3 completionHandler:(id)a4
{
  id v4 = [(_EMAttachmentContentItem *)self requestRepresentationWithOptions:a3 delegate:0 completionHandler:a4];
  return v4;
}

- (id)requestRepresentationWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1BEFDB000, "attachment content representation request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  v12 = [(_EMAttachmentContentItem *)self availableRepresentations];
  uint64_t v13 = [v8 requestedRepresentation];
  char v14 = [v12 containsObject:v13];

  if (v14)
  {
    uint64_t v15 = [(_EMAttachmentContentItem *)self loaderBlock];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88___EMAttachmentContentItem_requestRepresentationWithOptions_delegate_completionHandler___block_invoke;
    v18[3] = &unk_1E63E2628;
    v18[4] = self;
    id v19 = v10;
    uint64_t v16 = ((void (**)(void, id, id, void *))v15)[2](v15, v8, v9, v18);
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMErrorDomain" code:2048 userInfo:0];
    uint64_t v16 = 0;
    (*((void (**)(id, void, void (**)(void, void, void, void)))v10 + 2))(v10, 0, v15);
  }

  os_activity_scope_leave(&state);
  return v16;
}

- (NSArray)availableRepresentations
{
  return self->_availableRepresentations;
}

- (void)setAvailableRepresentations:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (int64_t)dataTransferByteCount
{
  return self->_dataTransferByteCount;
}

- (void)setDataTransferByteCount:(int64_t)a3
{
  self->_dataTransferByteCount = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isAvailableLocally
{
  return self->_isAvailableLocally;
}

- (void)setIsAvailableLocally:(BOOL)a3
{
  self->_isAvailableLocally = a3;
}

- (id)loaderBlock
{
  return self->_loaderBlock;
}

- (void)setLoaderBlock:(id)a3
{
}

- (int64_t)storageByteCount
{
  return self->_storageByteCount;
}

- (void)setStorageByteCount:(int64_t)a3
{
  self->_storageByteCount = a3;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (EMMailDropMetadata)mailDropMetadata
{
  return self->_mailDropMetadata;
}

- (void)setMailDropMetadata:(id)a3
{
}

- (int)exchangeEventUID
{
  return self->_exchangeEventUID;
}

- (void)setExchangeEventUID:(int)a3
{
  self->_exchangeEventUID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailDropMetadata, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong(&self->_loaderBlock, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_availableRepresentations, 0);
}

@end