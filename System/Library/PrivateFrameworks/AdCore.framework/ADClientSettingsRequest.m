@interface ADClientSettingsRequest
+ (Class)currentSearchLandingAdsSettingParamsType;
+ (Class)currentSettingParamsType;
+ (id)options;
- (BOOL)hasIAdIDString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)currentSearchLandingAdsSettingParams;
- (NSMutableArray)currentSettingParams;
- (NSString)iAdIDString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentSearchLandingAdsSettingParamsAtIndex:(unint64_t)a3;
- (id)currentSettingParamsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)currentSearchLandingAdsSettingParamsCount;
- (unint64_t)currentSettingParamsCount;
- (unint64_t)hash;
- (void)addCurrentSearchLandingAdsSettingParams:(id)a3;
- (void)addCurrentSettingParams:(id)a3;
- (void)clearCurrentSearchLandingAdsSettingParams;
- (void)clearCurrentSettingParams;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentSearchLandingAdsSettingParams:(id)a3;
- (void)setCurrentSettingParams:(id)a3;
- (void)setIAdIDString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADClientSettingsRequest

+ (id)options
{
  if (options_once_2 != -1) {
    dispatch_once(&options_once_2, &__block_literal_global_4);
  }
  v2 = (void *)options_sOptions_2;
  return v2;
}

void __34__ADClientSettingsRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_2;
  options_sOptions_2 = (uint64_t)&unk_1F2715488;
}

- (BOOL)hasIAdIDString
{
  return self->_iAdIDString != 0;
}

- (void)clearCurrentSettingParams
{
}

- (void)addCurrentSettingParams:(id)a3
{
  id v4 = a3;
  currentSettingParams = self->_currentSettingParams;
  id v8 = v4;
  if (!currentSettingParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_currentSettingParams;
    self->_currentSettingParams = v6;

    id v4 = v8;
    currentSettingParams = self->_currentSettingParams;
  }
  [(NSMutableArray *)currentSettingParams addObject:v4];
}

- (unint64_t)currentSettingParamsCount
{
  return [(NSMutableArray *)self->_currentSettingParams count];
}

- (id)currentSettingParamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentSettingParams objectAtIndex:a3];
}

+ (Class)currentSettingParamsType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentSearchLandingAdsSettingParams
{
}

- (void)addCurrentSearchLandingAdsSettingParams:(id)a3
{
  id v4 = a3;
  currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
  id v8 = v4;
  if (!currentSearchLandingAdsSettingParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_currentSearchLandingAdsSettingParams;
    self->_currentSearchLandingAdsSettingParams = v6;

    id v4 = v8;
    currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
  }
  [(NSMutableArray *)currentSearchLandingAdsSettingParams addObject:v4];
}

- (unint64_t)currentSearchLandingAdsSettingParamsCount
{
  return [(NSMutableArray *)self->_currentSearchLandingAdsSettingParams count];
}

- (id)currentSearchLandingAdsSettingParamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentSearchLandingAdsSettingParams objectAtIndex:a3];
}

+ (Class)currentSearchLandingAdsSettingParamsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADClientSettingsRequest;
  id v4 = [(ADClientSettingsRequest *)&v8 description];
  v5 = [(ADClientSettingsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  iAdIDString = self->_iAdIDString;
  if (iAdIDString) {
    [v3 setObject:iAdIDString forKey:@"iAdIDString"];
  }
  if ([(NSMutableArray *)self->_currentSettingParams count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_currentSettingParams, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = self->_currentSettingParams;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
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
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"currentSettingParams"];
  }
  if ([(NSMutableArray *)self->_currentSearchLandingAdsSettingParams count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_currentSearchLandingAdsSettingParams, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_currentSearchLandingAdsSettingParams;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"currentSearchLandingAdsSettingParams"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADClientSettingsRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_iAdIDString) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_currentSettingParams;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_currentSearchLandingAdsSettingParams;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_iAdIDString) {
    objc_msgSend(v12, "setIAdIDString:");
  }
  if ([(ADClientSettingsRequest *)self currentSettingParamsCount])
  {
    [v12 clearCurrentSettingParams];
    unint64_t v4 = [(ADClientSettingsRequest *)self currentSettingParamsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ADClientSettingsRequest *)self currentSettingParamsAtIndex:i];
        [v12 addCurrentSettingParams:v7];
      }
    }
  }
  if ([(ADClientSettingsRequest *)self currentSearchLandingAdsSettingParamsCount])
  {
    [v12 clearCurrentSearchLandingAdsSettingParams];
    unint64_t v8 = [(ADClientSettingsRequest *)self currentSearchLandingAdsSettingParamsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ADClientSettingsRequest *)self currentSearchLandingAdsSettingParamsAtIndex:j];
        [v12 addCurrentSearchLandingAdsSettingParams:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_iAdIDString copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_currentSettingParams;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addCurrentSettingParams:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_currentSearchLandingAdsSettingParams;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addCurrentSearchLandingAdsSettingParams:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((iAdIDString = self->_iAdIDString, !((unint64_t)iAdIDString | v4[3]))
     || -[NSString isEqual:](iAdIDString, "isEqual:"))
    && ((currentSettingParams = self->_currentSettingParams, !((unint64_t)currentSettingParams | v4[2]))
     || -[NSMutableArray isEqual:](currentSettingParams, "isEqual:")))
  {
    currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
    if ((unint64_t)currentSearchLandingAdsSettingParams | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](currentSearchLandingAdsSettingParams, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_iAdIDString hash];
  uint64_t v4 = [(NSMutableArray *)self->_currentSettingParams hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_currentSearchLandingAdsSettingParams hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[ADClientSettingsRequest setIAdIDString:](self, "setIAdIDString:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ADClientSettingsRequest *)self addCurrentSettingParams:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ADClientSettingsRequest addCurrentSearchLandingAdsSettingParams:](self, "addCurrentSearchLandingAdsSettingParams:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)iAdIDString
{
  return self->_iAdIDString;
}

- (void)setIAdIDString:(id)a3
{
}

- (NSMutableArray)currentSettingParams
{
  return self->_currentSettingParams;
}

- (void)setCurrentSettingParams:(id)a3
{
}

- (NSMutableArray)currentSearchLandingAdsSettingParams
{
  return self->_currentSearchLandingAdsSettingParams;
}

- (void)setCurrentSearchLandingAdsSettingParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdIDString, 0);
  objc_storeStrong((id *)&self->_currentSettingParams, 0);
  objc_storeStrong((id *)&self->_currentSearchLandingAdsSettingParams, 0);
}

@end