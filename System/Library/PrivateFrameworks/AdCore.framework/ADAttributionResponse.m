@interface ADAttributionResponse
+ (Class)versionedAttributionDetailsType;
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)versionedAttributionDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)versionedAttributionDetailsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)versionedAttributionDetailsCount;
- (void)addVersionedAttributionDetails:(id)a3;
- (void)clearVersionedAttributionDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVersionedAttributionDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADAttributionResponse

+ (id)options
{
  if (options_once_11 != -1) {
    dispatch_once(&options_once_11, &__block_literal_global_18);
  }
  v2 = (void *)options_sOptions_11;
  return v2;
}

void __32__ADAttributionResponse_options__block_invoke()
{
  v0 = (void *)options_sOptions_11;
  options_sOptions_11 = (uint64_t)&unk_1F27155F0;
}

- (void)clearVersionedAttributionDetails
{
}

- (void)addVersionedAttributionDetails:(id)a3
{
  id v4 = a3;
  versionedAttributionDetails = self->_versionedAttributionDetails;
  id v8 = v4;
  if (!versionedAttributionDetails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_versionedAttributionDetails;
    self->_versionedAttributionDetails = v6;

    id v4 = v8;
    versionedAttributionDetails = self->_versionedAttributionDetails;
  }
  [(NSMutableArray *)versionedAttributionDetails addObject:v4];
}

- (unint64_t)versionedAttributionDetailsCount
{
  return [(NSMutableArray *)self->_versionedAttributionDetails count];
}

- (id)versionedAttributionDetailsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_versionedAttributionDetails objectAtIndex:a3];
}

+ (Class)versionedAttributionDetailsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADAttributionResponse;
  id v4 = [(ADAttributionResponse *)&v8 description];
  v5 = [(ADAttributionResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_versionedAttributionDetails count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_versionedAttributionDetails, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_versionedAttributionDetails;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"versionedAttributionDetails"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADAttributionResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_versionedAttributionDetails;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(ADAttributionResponse *)self versionedAttributionDetailsCount])
  {
    [v8 clearVersionedAttributionDetails];
    unint64_t v4 = [(ADAttributionResponse *)self versionedAttributionDetailsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ADAttributionResponse *)self versionedAttributionDetailsAtIndex:i];
        [v8 addVersionedAttributionDetails:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_versionedAttributionDetails;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addVersionedAttributionDetails:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    versionedAttributionDetails = self->_versionedAttributionDetails;
    if ((unint64_t)versionedAttributionDetails | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](versionedAttributionDetails, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_versionedAttributionDetails hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ADAttributionResponse addVersionedAttributionDetails:](self, "addVersionedAttributionDetails:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)versionedAttributionDetails
{
  return self->_versionedAttributionDetails;
}

- (void)setVersionedAttributionDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end