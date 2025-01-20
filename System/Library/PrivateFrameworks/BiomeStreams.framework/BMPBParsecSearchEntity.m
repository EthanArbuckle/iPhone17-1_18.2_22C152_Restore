@interface BMPBParsecSearchEntity
+ (Class)topicsType;
- (BOOL)hasCategory;
- (BOOL)hasName;
- (BOOL)hasProbabilityScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)topics;
- (NSString)name;
- (float)probabilityScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicsCount;
- (unsigned)category;
- (void)addTopics:(id)a3;
- (void)clearTopics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(unsigned int)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasProbabilityScore:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProbabilityScore:(float)a3;
- (void)setTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBParsecSearchEntity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setCategory:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProbabilityScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_probabilityScore = a3;
}

- (void)setHasProbabilityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProbabilityScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearTopics
{
}

- (void)addTopics:(id)a3
{
  id v4 = a3;
  topics = self->_topics;
  id v8 = v4;
  if (!topics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_topics;
    self->_topics = v6;

    id v4 = v8;
    topics = self->_topics;
  }
  [(NSMutableArray *)topics addObject:v4];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBParsecSearchEntity;
  id v4 = [(BMPBParsecSearchEntity *)&v8 description];
  v5 = [(BMPBParsecSearchEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_category];
    [v5 setObject:v8 forKey:@"category"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_probabilityScore;
    v9 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v9 forKey:@"probabilityScore"];
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_topics;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v5 setObject:v10 forKey:@"topics"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBParsecSearchEntityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_topics;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_category;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = LODWORD(self->_probabilityScore);
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if ([(BMPBParsecSearchEntity *)self topicsCount])
  {
    [v10 clearTopics];
    unint64_t v6 = [(BMPBParsecSearchEntity *)self topicsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BMPBParsecSearchEntity *)self topicsAtIndex:i];
        [v10 addTopics:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_category;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 24) = self->_probabilityScore;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_topics;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addTopics:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_category != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_probabilityScore != *((float *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](topics, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_category;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9 ^ [(NSMutableArray *)self->_topics hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float probabilityScore = self->_probabilityScore;
  float v6 = -probabilityScore;
  if (probabilityScore >= 0.0) {
    float v6 = self->_probabilityScore;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
  return v4 ^ v3 ^ v9 ^ [(NSMutableArray *)self->_topics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BMPBParsecSearchEntity setName:](self, "setName:");
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_category = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_float probabilityScore = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BMPBParsecSearchEntity addTopics:](self, "addTopics:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)category
{
  return self->_category;
}

- (float)probabilityScore
{
  return self->_probabilityScore;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end