@interface CPLMomentSharePreviewData
+ (Class)curatedAssetIdentifiersType;
+ (Class)previewImageDataType;
- (BOOL)hasCropRectString;
- (BOOL)hasKeyAssetIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)curatedAssetIdentifiers;
- (NSMutableArray)previewImageDatas;
- (NSString)cropRectString;
- (NSString)keyAssetIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatedAssetIdentifiersAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)previewImageDataAtIndex:(unint64_t)a3;
- (unint64_t)curatedAssetIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)previewImageDatasCount;
- (void)addCuratedAssetIdentifiers:(id)a3;
- (void)addPreviewImageData:(id)a3;
- (void)clearCuratedAssetIdentifiers;
- (void)clearPreviewImageDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCropRectString:(id)a3;
- (void)setCuratedAssetIdentifiers:(id)a3;
- (void)setKeyAssetIdentifier:(id)a3;
- (void)setPreviewImageDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLMomentSharePreviewData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageDatas, 0);
  objc_storeStrong((id *)&self->_keyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_curatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_cropRectString, 0);
}

- (void)setCuratedAssetIdentifiers:(id)a3
{
}

- (NSMutableArray)curatedAssetIdentifiers
{
  return self->_curatedAssetIdentifiers;
}

- (void)setCropRectString:(id)a3
{
}

- (NSString)cropRectString
{
  return self->_cropRectString;
}

- (void)setKeyAssetIdentifier:(id)a3
{
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (void)setPreviewImageDatas:(id)a3
{
}

- (NSMutableArray)previewImageDatas
{
  return self->_previewImageDatas;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[4];
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
        [(CPLMomentSharePreviewData *)self addPreviewImageData:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[CPLMomentSharePreviewData setKeyAssetIdentifier:](self, "setKeyAssetIdentifier:");
  }
  if (v4[1]) {
    -[CPLMomentSharePreviewData setCropRectString:](self, "setCropRectString:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
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
        -[CPLMomentSharePreviewData addCuratedAssetIdentifiers:](self, "addCuratedAssetIdentifiers:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_previewImageDatas hash];
  NSUInteger v4 = [(NSString *)self->_keyAssetIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_cropRectString hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_curatedAssetIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((previewImageDatas = self->_previewImageDatas, !((unint64_t)previewImageDatas | v4[4]))
     || -[NSMutableArray isEqual:](previewImageDatas, "isEqual:"))
    && ((keyAssetIdentifier = self->_keyAssetIdentifier, !((unint64_t)keyAssetIdentifier | v4[3]))
     || -[NSString isEqual:](keyAssetIdentifier, "isEqual:"))
    && ((cropRectString = self->_cropRectString, !((unint64_t)cropRectString | v4[1]))
     || -[NSString isEqual:](cropRectString, "isEqual:")))
  {
    curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
    if ((unint64_t)curatedAssetIdentifiers | v4[2]) {
      char v9 = -[NSMutableArray isEqual:](curatedAssetIdentifiers, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = self->_previewImageDatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addPreviewImageData:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_keyAssetIdentifier copyWithZone:a3];
  uint64_t v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_cropRectString copyWithZone:a3];
  long long v15 = (void *)v5[1];
  v5[1] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_curatedAssetIdentifiers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addCuratedAssetIdentifiers:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(CPLMomentSharePreviewData *)self previewImageDatasCount])
  {
    [v12 clearPreviewImageDatas];
    unint64_t v4 = [(CPLMomentSharePreviewData *)self previewImageDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CPLMomentSharePreviewData *)self previewImageDataAtIndex:i];
        [v12 addPreviewImageData:v7];
      }
    }
  }
  if (self->_keyAssetIdentifier) {
    objc_msgSend(v12, "setKeyAssetIdentifier:");
  }
  if (self->_cropRectString) {
    objc_msgSend(v12, "setCropRectString:");
  }
  if ([(CPLMomentSharePreviewData *)self curatedAssetIdentifiersCount])
  {
    [v12 clearCuratedAssetIdentifiers];
    unint64_t v8 = [(CPLMomentSharePreviewData *)self curatedAssetIdentifiersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(CPLMomentSharePreviewData *)self curatedAssetIdentifiersAtIndex:j];
        [v12 addCuratedAssetIdentifiers:v11];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_previewImageDatas;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_keyAssetIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_cropRectString) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_curatedAssetIdentifiers;
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
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLMomentSharePreviewDataReadFrom((char *)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  previewImageDatas = self->_previewImageDatas;
  if (previewImageDatas) {
    [v3 setObject:previewImageDatas forKey:@"previewImageData"];
  }
  keyAssetIdentifier = self->_keyAssetIdentifier;
  if (keyAssetIdentifier) {
    [v4 setObject:keyAssetIdentifier forKey:@"keyAssetIdentifier"];
  }
  cropRectString = self->_cropRectString;
  if (cropRectString) {
    [v4 setObject:cropRectString forKey:@"cropRectString"];
  }
  curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  if (curatedAssetIdentifiers) {
    [v4 setObject:curatedAssetIdentifiers forKey:@"curatedAssetIdentifiers"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentSharePreviewData;
  id v4 = [(CPLMomentSharePreviewData *)&v8 description];
  unint64_t v5 = [(CPLMomentSharePreviewData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)curatedAssetIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_curatedAssetIdentifiers objectAtIndex:a3];
}

- (unint64_t)curatedAssetIdentifiersCount
{
  return [(NSMutableArray *)self->_curatedAssetIdentifiers count];
}

- (void)addCuratedAssetIdentifiers:(id)a3
{
  id v4 = a3;
  curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  id v8 = v4;
  if (!curatedAssetIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_curatedAssetIdentifiers;
    self->_curatedAssetIdentifiers = v6;

    id v4 = v8;
    curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  }
  [(NSMutableArray *)curatedAssetIdentifiers addObject:v4];
}

- (void)clearCuratedAssetIdentifiers
{
}

- (BOOL)hasCropRectString
{
  return self->_cropRectString != 0;
}

- (BOOL)hasKeyAssetIdentifier
{
  return self->_keyAssetIdentifier != 0;
}

- (id)previewImageDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previewImageDatas objectAtIndex:a3];
}

- (unint64_t)previewImageDatasCount
{
  return [(NSMutableArray *)self->_previewImageDatas count];
}

- (void)addPreviewImageData:(id)a3
{
  id v4 = a3;
  previewImageDatas = self->_previewImageDatas;
  id v8 = v4;
  if (!previewImageDatas)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_previewImageDatas;
    self->_previewImageDatas = v6;

    id v4 = v8;
    previewImageDatas = self->_previewImageDatas;
  }
  [(NSMutableArray *)previewImageDatas addObject:v4];
}

- (void)clearPreviewImageDatas
{
}

+ (Class)curatedAssetIdentifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)previewImageDataType
{
  return (Class)objc_opt_class();
}

@end