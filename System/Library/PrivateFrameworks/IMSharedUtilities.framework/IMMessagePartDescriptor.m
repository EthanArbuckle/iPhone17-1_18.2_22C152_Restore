@interface IMMessagePartDescriptor
+ (NSString)defaultPrefix;
- (BOOL)hasLoadedTransferGUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessagePart:(id)a3 ignoringRange:(BOOL)a4;
- (IMMessagePartDescriptor)initWithMessagePartBody:(id)a3 messagePartIndex:(unint64_t)a4 messagePartRange:(_NSRange)a5;
- (NSArray)fileTransferGUIDsInMessagePartText;
- (NSArray)links;
- (NSArray)mapLocations;
- (NSAttributedString)messagePartBody;
- (NSString)transferGUID;
- (_NSRange)messagePartRange;
- (id)messagePartGUIDForMessageGUID:(id)a3;
- (unint64_t)messagePartIndex;
- (void)setHasLoadedTransferGUID:(BOOL)a3;
@end

@implementation IMMessagePartDescriptor

- (NSAttributedString)messagePartBody
{
  return self->_messagePartBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePartBody, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDsInMessagePartText, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_mapLocations, 0);

  objc_storeStrong((id *)&self->_links, 0);
}

- (IMMessagePartDescriptor)initWithMessagePartBody:(id)a3 messagePartIndex:(unint64_t)a4 messagePartRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartDescriptor;
  v10 = [(IMMessagePartDescriptor *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    messagePartBody = v10->_messagePartBody;
    v10->_messagePartBody = (NSAttributedString *)v11;

    v10->_messagePartRange.NSUInteger location = location;
    v10->_messagePartRange.NSUInteger length = length;
    v10->_messagePartIndex = a4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(IMMessagePartDescriptor *)self isEqualToMessagePart:v4 ignoringRange:0];

  return v5;
}

- (BOOL)isEqualToMessagePart:(id)a3 ignoringRange:(BOOL)a4
{
  id v6 = a3;
  if (a4
    || (uint64_t v7 = [(IMMessagePartDescriptor *)self messagePartRange],
        uint64_t v9 = v8,
        char v11 = 0,
        v7 == [v6 messagePartRange])
    && v9 == v10)
  {
    unint64_t v12 = [(IMMessagePartDescriptor *)self messagePartIndex];
    if (v12 == [v6 messagePartIndex])
    {
      v13 = [(IMMessagePartDescriptor *)self messagePartBody];
      objc_super v14 = [v6 messagePartBody];
      id v15 = v13;
      id v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v15 && v16) {
          char v11 = [v15 isEqualToAttributedString:v16];
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)messagePartGUIDForMessageGUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [IMMessagePartGUID alloc];
  id v6 = +[IMMessagePartDescriptor defaultPrefix];
  uint64_t v7 = [(IMMessagePartGUID *)v5 initWithMessageGUID:v4 prefix:v6 partNumber:[(IMMessagePartDescriptor *)self messagePartIndex]];

  return v7;
}

- (NSArray)links
{
  p_links = &self->_links;
  links = self->_links;
  if (!links)
  {
    uint64_t v5 = [(NSAttributedString *)self->_messagePartBody __im_dataDetectedURLsFromAttributes];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    else {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)p_links, v7);

    links = self->_links;
  }

  return links;
}

- (NSArray)mapLocations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  mapLocations = self->_mapLocations;
  if (!mapLocations)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [(IMMessagePartDescriptor *)self links];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[IMMapURLLocationInfo locationInfoFromURL:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
          if (v10) {
            [v4 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    char v11 = (NSArray *)[v4 copy];
    unint64_t v12 = self->_mapLocations;
    self->_mapLocations = v11;

    mapLocations = self->_mapLocations;
  }

  return mapLocations;
}

- (NSString)transferGUID
{
  if (!self->_hasLoadedTransferGUID)
  {
    v3 = [(NSAttributedString *)self->_messagePartBody string];
    int v4 = [v3 isEqualToString:*MEMORY[0x1E4F6C110]];

    if (v4)
    {
      uint64_t v5 = [(NSAttributedString *)self->_messagePartBody attribute:*MEMORY[0x1E4F6C188] atIndex:0 effectiveRange:0];
      transferGUID = self->_transferGUID;
      self->_transferGUID = v5;
    }
    self->_hasLoadedTransferGUID = 1;
  }
  uint64_t v7 = self->_transferGUID;

  return v7;
}

- (NSArray)fileTransferGUIDsInMessagePartText
{
  fileTransferGUIDsInMessagePartText = self->_fileTransferGUIDsInMessagePartText;
  if (!fileTransferGUIDsInMessagePartText)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    NSUInteger v5 = [(NSAttributedString *)self->_messagePartBody length];
    messagePartBody = self->_messagePartBody;
    uint64_t v7 = *MEMORY[0x1E4F6C188];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A0825AB4;
    v12[3] = &unk_1E5A105B0;
    id v13 = v4;
    id v8 = v4;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](messagePartBody, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v5, 0, v12);
    uint64_t v9 = [v8 array];
    uint64_t v10 = self->_fileTransferGUIDsInMessagePartText;
    self->_fileTransferGUIDsInMessagePartText = v9;

    fileTransferGUIDsInMessagePartText = self->_fileTransferGUIDsInMessagePartText;
  }

  return fileTransferGUIDsInMessagePartText;
}

+ (NSString)defaultPrefix
{
  return (NSString *)@"p";
}

- (unint64_t)messagePartIndex
{
  return self->_messagePartIndex;
}

- (_NSRange)messagePartRange
{
  NSUInteger length = self->_messagePartRange.length;
  NSUInteger location = self->_messagePartRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)hasLoadedTransferGUID
{
  return self->_hasLoadedTransferGUID;
}

- (void)setHasLoadedTransferGUID:(BOOL)a3
{
  self->_hasLoadedTransferGUID = a3;
}

@end