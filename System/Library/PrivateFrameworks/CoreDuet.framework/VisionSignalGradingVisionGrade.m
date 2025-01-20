@interface VisionSignalGradingVisionGrade
+ (Class)extractedSignalsType;
- (BOOL)cameraRollGrade;
- (BOOL)childGrade;
- (BOOL)extractedGrade;
- (BOOL)hasCameraRollGrade;
- (BOOL)hasChildAge;
- (BOOL)hasChildGrade;
- (BOOL)hasExtractedGrade;
- (BOOL)hasIdentifier;
- (BOOL)hasImageGrade;
- (BOOL)hasNumPeople;
- (BOOL)imageGrade;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)extractedSignals;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedSignalsAtIndex:(unint64_t)a3;
- (int)childAge;
- (int)numPeople;
- (unint64_t)extractedSignalsCount;
- (unint64_t)hash;
- (void)addExtractedSignals:(id)a3;
- (void)clearExtractedSignals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCameraRollGrade:(BOOL)a3;
- (void)setChildAge:(int)a3;
- (void)setChildGrade:(BOOL)a3;
- (void)setExtractedGrade:(BOOL)a3;
- (void)setExtractedSignals:(id)a3;
- (void)setHasCameraRollGrade:(BOOL)a3;
- (void)setHasChildAge:(BOOL)a3;
- (void)setHasChildGrade:(BOOL)a3;
- (void)setHasExtractedGrade:(BOOL)a3;
- (void)setHasImageGrade:(BOOL)a3;
- (void)setHasNumPeople:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageGrade:(BOOL)a3;
- (void)setNumPeople:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VisionSignalGradingVisionGrade

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setImageGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_imageGrade = a3;
}

- (void)setHasImageGrade:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasImageGrade
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumPeople:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numPeople = a3;
}

- (void)setHasNumPeople:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumPeople
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCameraRollGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cameraRollGrade = a3;
}

- (void)setHasCameraRollGrade:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCameraRollGrade
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearExtractedSignals
{
}

- (void)addExtractedSignals:(id)a3
{
  id v4 = a3;
  extractedSignals = self->_extractedSignals;
  id v8 = v4;
  if (!extractedSignals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_extractedSignals;
    self->_extractedSignals = v6;

    id v4 = v8;
    extractedSignals = self->_extractedSignals;
  }
  [(NSMutableArray *)extractedSignals addObject:v4];
}

- (unint64_t)extractedSignalsCount
{
  return [(NSMutableArray *)self->_extractedSignals count];
}

- (id)extractedSignalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_extractedSignals objectAtIndex:a3];
}

+ (Class)extractedSignalsType
{
  return (Class)objc_opt_class();
}

- (void)setExtractedGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_extractedGrade = a3;
}

- (void)setHasExtractedGrade:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasExtractedGrade
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setChildGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_childGrade = a3;
}

- (void)setHasChildGrade:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasChildGrade
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setChildAge:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_childAge = a3;
}

- (void)setHasChildAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChildAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VisionSignalGradingVisionGrade;
  id v4 = [(VisionSignalGradingVisionGrade *)&v8 description];
  v5 = [(VisionSignalGradingVisionGrade *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_imageGrade];
    [v4 setObject:v12 forKey:@"imageGrade"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v13 = [NSNumber numberWithInt:self->_numPeople];
  [v4 setObject:v13 forKey:@"numPeople"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithBool:self->_cameraRollGrade];
    [v4 setObject:v7 forKey:@"cameraRollGrade"];
  }
LABEL_7:
  extractedSignals = self->_extractedSignals;
  if (extractedSignals) {
    [v4 setObject:extractedSignals forKey:@"extractedSignals"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_extractedGrade];
    [v4 setObject:v14 forKey:@"extractedGrade"];

    char v9 = (char)self->_has;
    if ((v9 & 8) == 0)
    {
LABEL_11:
      if ((v9 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v15 = [NSNumber numberWithBool:self->_childGrade];
  [v4 setObject:v15 forKey:@"childGrade"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    v10 = [NSNumber numberWithInt:self->_childAge];
    [v4 setObject:v10 forKey:@"childAge"];
  }
LABEL_13:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VisionSignalGradingVisionGradeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_extractedSignals;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_16;
    }
LABEL_23:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0) {
    goto LABEL_23;
  }
LABEL_16:
  if (v11) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_19:
    *((_DWORD *)v4 + 8) = self->_numPeople;
    *((unsigned char *)v4 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *((unsigned char *)v4 + 39) = self->_imageGrade;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_19;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 36) = self->_cameraRollGrade;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_7:
  if ([(VisionSignalGradingVisionGrade *)self extractedSignalsCount])
  {
    [v11 clearExtractedSignals];
    unint64_t v6 = [(VisionSignalGradingVisionGrade *)self extractedSignalsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(VisionSignalGradingVisionGrade *)self extractedSignalsAtIndex:i];
        [v11 addExtractedSignals:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 0x10) != 0)
  {
    *((unsigned char *)v11 + 38) = self->_extractedGrade;
    *((unsigned char *)v11 + 40) |= 0x10u;
    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_13:
      if ((v10 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v11 + 37) = self->_childGrade;
  *((unsigned char *)v11 + 40) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    *((_DWORD *)v11 + 2) = self->_childAge;
    *((unsigned char *)v11 + 40) |= 1u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 39) = self->_imageGrade;
    *(unsigned char *)(v5 + 40) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_numPeople;
  *(unsigned char *)(v5 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 36) = self->_cameraRollGrade;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_extractedSignals;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addExtractedSignals:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  char v15 = (char)self->_has;
  if ((v15 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_21:
    *(unsigned char *)(v5 + 37) = self->_childGrade;
    *(unsigned char *)(v5 + 40) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
  *(unsigned char *)(v5 + 38) = self->_extractedGrade;
  *(unsigned char *)(v5 + 40) |= 0x10u;
  char v15 = (char)self->_has;
  if ((v15 & 8) != 0) {
    goto LABEL_21;
  }
LABEL_14:
  if (v15)
  {
LABEL_15:
    *(_DWORD *)(v5 + 8) = self->_childAge;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0) {
      goto LABEL_48;
    }
    if (self->_imageGrade)
    {
      if (!*((unsigned char *)v4 + 39)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 39))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_numPeople != *((_DWORD *)v4 + 8)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_48;
    }
    if (self->_cameraRollGrade)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_48;
  }
  extractedSignals = self->_extractedSignals;
  if ((unint64_t)extractedSignals | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](extractedSignals, "isEqual:")) {
      goto LABEL_48;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_extractedGrade)
    {
      if (!*((unsigned char *)v4 + 38)) {
        goto LABEL_48;
      }
    }
    else if (*((unsigned char *)v4 + 38))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) != 0)
    {
      if (self->_childGrade)
      {
        if (!*((unsigned char *)v4 + 37)) {
          goto LABEL_48;
        }
        goto LABEL_44;
      }
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_44;
      }
    }
LABEL_48:
    BOOL v8 = 0;
    goto LABEL_49;
  }
  if ((*((unsigned char *)v4 + 40) & 8) != 0) {
    goto LABEL_48;
  }
LABEL_44:
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_childAge != *((_DWORD *)v4 + 2)) {
      goto LABEL_48;
    }
    BOOL v8 = 1;
  }
LABEL_49:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_imageGrade;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numPeople;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_cameraRollGrade;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  uint64_t v7 = [(NSMutableArray *)self->_extractedSignals hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v8 = 2654435761 * self->_extractedGrade;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_childGrade;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_childAge;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[VisionSignalGradingVisionGrade setIdentifier:](self, "setIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x20) != 0)
  {
    self->_imageGrade = *((unsigned char *)v4 + 39);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_numPeople = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_6:
    self->_cameraRollGrade = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[VisionSignalGradingVisionGrade addExtractedSignals:](self, "addExtractedSignals:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v4 + 40);
  if ((v11 & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0) {
      goto LABEL_16;
    }
LABEL_23:
    self->_childGrade = *((unsigned char *)v4 + 37);
    *(unsigned char *)&self->_has |= 8u;
    if ((*((unsigned char *)v4 + 40) & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  self->_extractedGrade = *((unsigned char *)v4 + 38);
  *(unsigned char *)&self->_has |= 0x10u;
  char v11 = *((unsigned char *)v4 + 40);
  if ((v11 & 8) != 0) {
    goto LABEL_23;
  }
LABEL_16:
  if (v11)
  {
LABEL_17:
    self->_childAge = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_18:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)imageGrade
{
  return self->_imageGrade;
}

- (int)numPeople
{
  return self->_numPeople;
}

- (BOOL)cameraRollGrade
{
  return self->_cameraRollGrade;
}

- (NSMutableArray)extractedSignals
{
  return self->_extractedSignals;
}

- (void)setExtractedSignals:(id)a3
{
}

- (BOOL)extractedGrade
{
  return self->_extractedGrade;
}

- (BOOL)childGrade
{
  return self->_childGrade;
}

- (int)childAge
{
  return self->_childAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extractedSignals, 0);
}

@end