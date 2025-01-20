@interface CAMSubjectGroupResult
- (AVMetadataObject)underlyingMetadataObject;
- (CAMSubjectGroupResult)initWithMetadataObjects:(id)a3 groupID:(int64_t)a4;
- (NSArray)metadataObjects;
- (NSString)description;
- (NSString)metadataType;
- (NSString)uniqueIdentifier;
- (int64_t)_groupID;
- (unint64_t)syntheticFocusMode;
- (void)set_groupID:(int64_t)a3;
@end

@implementation CAMSubjectGroupResult

- (CAMSubjectGroupResult)initWithMetadataObjects:(id)a3 groupID:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMSubjectGroupResult;
  v7 = [(CAMSubjectGroupResult *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    metadataObjects = v7->_metadataObjects;
    v7->_metadataObjects = (NSArray *)v8;

    uint64_t v10 = [NSString stringWithFormat:@"%@ %ld", @"CAMMetadataObjectTypeSubjectGroup", a4];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v10;

    v7->__groupID = a4;
    v12 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p type: %@ groupID: %ld>", v5, self, @"CAMMetadataObjectTypeSubjectGroup", -[CAMSubjectGroupResult _groupID](self, "_groupID")];

  return (NSString *)v6;
}

- (AVMetadataObject)underlyingMetadataObject
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(CAMSubjectGroupResult *)self metadataObjects];
  v4 = [v3 firstObject];
  v5 = [v4 underlyingMetadataObject];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CAMSubjectGroupResult *)self metadataObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 underlyingMetadataObject];

          v5 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (AVMetadataObject *)v5;
}

- (NSString)metadataType
{
  return (NSString *)@"CAMMetadataObjectTypeSubjectGroup";
}

- (unint64_t)syntheticFocusMode
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CAMSubjectGroupResult *)self metadataObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [v7 syntheticFocusMode];
          if (v8)
          {
            unint64_t v9 = v8;
            goto LABEL_12;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  unint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- (int64_t)_groupID
{
  return self->__groupID;
}

- (void)set_groupID:(int64_t)a3
{
  self->__groupID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataObjects, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end