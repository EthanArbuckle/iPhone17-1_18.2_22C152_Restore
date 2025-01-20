@interface CESRCorrectionPronunciation
+ (Class)ttsPronunciationsType;
- (BOOL)hasApgId;
- (BOOL)hasAsrPronunciationData;
- (BOOL)hasLanguage;
- (BOOL)hasOrthography;
- (BOOL)hasTokenOffset;
- (BOOL)hasTtsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)asrPronunciationData;
- (NSMutableArray)ttsPronunciations;
- (NSString)apgId;
- (NSString)language;
- (NSString)orthography;
- (NSString)ttsVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ttsPronunciationsAtIndex:(unint64_t)a3;
- (int)tokenOffset;
- (unint64_t)hash;
- (unint64_t)ttsPronunciationsCount;
- (void)addTtsPronunciations:(id)a3;
- (void)clearTtsPronunciations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApgId:(id)a3;
- (void)setAsrPronunciationData:(id)a3;
- (void)setHasTokenOffset:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setTokenOffset:(int)a3;
- (void)setTtsPronunciations:(id)a3;
- (void)setTtsVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CESRCorrectionPronunciation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsVersion, 0);
  objc_storeStrong((id *)&self->_ttsPronunciations, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_asrPronunciationData, 0);

  objc_storeStrong((id *)&self->_apgId, 0);
}

- (void)setAsrPronunciationData:(id)a3
{
}

- (NSData)asrPronunciationData
{
  return self->_asrPronunciationData;
}

- (void)setTtsPronunciations:(id)a3
{
}

- (NSMutableArray)ttsPronunciations
{
  return self->_ttsPronunciations;
}

- (int)tokenOffset
{
  return self->_tokenOffset;
}

- (void)setTtsVersion:(id)a3
{
}

- (NSString)ttsVersion
{
  return self->_ttsVersion;
}

- (void)setApgId:(id)a3
{
}

- (NSString)apgId
{
  return self->_apgId;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setOrthography:(id)a3
{
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[CESRCorrectionPronunciation setOrthography:](self, "setOrthography:");
  }
  if (*((void *)v4 + 3)) {
    -[CESRCorrectionPronunciation setLanguage:](self, "setLanguage:");
  }
  if (*((void *)v4 + 1)) {
    -[CESRCorrectionPronunciation setApgId:](self, "setApgId:");
  }
  if (*((void *)v4 + 7)) {
    -[CESRCorrectionPronunciation setTtsVersion:](self, "setTtsVersion:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_tokenOffset = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CESRCorrectionPronunciation addTtsPronunciations:](self, "addTtsPronunciations:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[CESRCorrectionPronunciation setAsrPronunciationData:](self, "setAsrPronunciationData:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_orthography hash];
  NSUInteger v4 = [(NSString *)self->_language hash];
  NSUInteger v5 = [(NSString *)self->_apgId hash];
  NSUInteger v6 = [(NSString *)self->_ttsVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_tokenOffset;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSMutableArray *)self->_ttsPronunciations hash];
  return v8 ^ v9 ^ [(NSData *)self->_asrPronunciationData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  orthography = self->_orthography;
  if ((unint64_t)orthography | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](orthography, "isEqual:")) {
      goto LABEL_19;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_19;
    }
  }
  apgId = self->_apgId;
  if ((unint64_t)apgId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](apgId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  ttsVersion = self->_ttsVersion;
  if ((unint64_t)ttsVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](ttsVersion, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_tokenOffset != *((_DWORD *)v4 + 10)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  ttsPronunciations = self->_ttsPronunciations;
  if ((unint64_t)ttsPronunciations | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](ttsPronunciations, "isEqual:"))
  {
    goto LABEL_19;
  }
  asrPronunciationData = self->_asrPronunciationData;
  if ((unint64_t)asrPronunciationData | *((void *)v4 + 2)) {
    char v11 = -[NSData isEqual:](asrPronunciationData, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_orthography copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_language copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_apgId copyWithZone:a3];
  char v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_ttsVersion copyWithZone:a3];
  long long v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_tokenOffset;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = self->_ttsPronunciations;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (void)v23);
        [(id)v5 addTtsPronunciations:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSData *)self->_asrPronunciationData copyWithZone:a3];
  v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_orthography)
  {
    objc_msgSend(v4, "setOrthography:");
    id v4 = v9;
  }
  if (self->_language)
  {
    objc_msgSend(v9, "setLanguage:");
    id v4 = v9;
  }
  if (self->_apgId)
  {
    objc_msgSend(v9, "setApgId:");
    id v4 = v9;
  }
  if (self->_ttsVersion)
  {
    objc_msgSend(v9, "setTtsVersion:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_tokenOffset;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if ([(CESRCorrectionPronunciation *)self ttsPronunciationsCount])
  {
    [v9 clearTtsPronunciations];
    unint64_t v5 = [(CESRCorrectionPronunciation *)self ttsPronunciationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CESRCorrectionPronunciation *)self ttsPronunciationsAtIndex:i];
        [v9 addTtsPronunciations:v8];
      }
    }
  }
  if (self->_asrPronunciationData) {
    objc_msgSend(v9, "setAsrPronunciationData:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_orthography) {
    PBDataWriterWriteStringField();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  if (self->_apgId) {
    PBDataWriterWriteStringField();
  }
  if (self->_ttsVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_ttsPronunciations;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_asrPronunciationData) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CESRCorrectionPronunciationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  orthography = self->_orthography;
  if (orthography) {
    [v3 setObject:orthography forKey:@"orthography"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  apgId = self->_apgId;
  if (apgId) {
    [v4 setObject:apgId forKey:@"apg_id"];
  }
  ttsVersion = self->_ttsVersion;
  if (ttsVersion) {
    [v4 setObject:ttsVersion forKey:@"tts_version"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = [NSNumber numberWithInt:self->_tokenOffset];
    [v4 setObject:v9 forKey:@"token_offset"];
  }
  ttsPronunciations = self->_ttsPronunciations;
  if (ttsPronunciations) {
    [v4 setObject:ttsPronunciations forKey:@"tts_pronunciations"];
  }
  asrPronunciationData = self->_asrPronunciationData;
  if (asrPronunciationData) {
    [v4 setObject:asrPronunciationData forKey:@"asr_pronunciation_data"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CESRCorrectionPronunciation;
  id v4 = [(CESRCorrectionPronunciation *)&v8 description];
  unint64_t v5 = [(CESRCorrectionPronunciation *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAsrPronunciationData
{
  return self->_asrPronunciationData != 0;
}

- (id)ttsPronunciationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ttsPronunciations objectAtIndex:a3];
}

- (unint64_t)ttsPronunciationsCount
{
  return [(NSMutableArray *)self->_ttsPronunciations count];
}

- (void)addTtsPronunciations:(id)a3
{
  id v4 = a3;
  ttsPronunciations = self->_ttsPronunciations;
  id v8 = v4;
  if (!ttsPronunciations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_ttsPronunciations;
    self->_ttsPronunciations = v6;

    id v4 = v8;
    ttsPronunciations = self->_ttsPronunciations;
  }
  [(NSMutableArray *)ttsPronunciations addObject:v4];
}

- (void)clearTtsPronunciations
{
}

- (BOOL)hasTokenOffset
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTokenOffset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTokenOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tokenOffset = a3;
}

- (BOOL)hasTtsVersion
{
  return self->_ttsVersion != 0;
}

- (BOOL)hasApgId
{
  return self->_apgId != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasOrthography
{
  return self->_orthography != 0;
}

+ (Class)ttsPronunciationsType
{
  return (Class)objc_opt_class();
}

@end