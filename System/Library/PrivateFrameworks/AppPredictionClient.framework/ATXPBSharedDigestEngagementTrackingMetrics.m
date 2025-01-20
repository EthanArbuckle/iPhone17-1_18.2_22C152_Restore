@interface ATXPBSharedDigestEngagementTrackingMetrics
- (BOOL)hasNumDigestExpansions;
- (BOOL)hasNumEngagementsAfterExpiration;
- (BOOL)hasNumEngagementsInScheduled;
- (BOOL)hasNumEngagementsInUpcoming;
- (BOOL)hasNumExpansions;
- (BOOL)hasSectionIdentifier;
- (BOOL)hasSectionPosition;
- (BOOL)hasSectionSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)numDigestExpansions;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsInScheduled;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numExpansions;
- (unint64_t)sectionPosition;
- (unint64_t)sectionSize;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumDigestExpansions:(BOOL)a3;
- (void)setHasNumEngagementsAfterExpiration:(BOOL)a3;
- (void)setHasNumEngagementsInScheduled:(BOOL)a3;
- (void)setHasNumEngagementsInUpcoming:(BOOL)a3;
- (void)setHasNumExpansions:(BOOL)a3;
- (void)setHasSectionPosition:(BOOL)a3;
- (void)setHasSectionSize:(BOOL)a3;
- (void)setNumDigestExpansions:(unint64_t)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsInScheduled:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumExpansions:(unint64_t)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSectionPosition:(unint64_t)a3;
- (void)setSectionSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSharedDigestEngagementTrackingMetrics

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [v6 objectForKeyedSubscript:@"numEngagementsInUpcoming"];
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsInUpcoming:](v5, "setNumEngagementsInUpcoming:", [v7 unsignedIntegerValue]);

      v8 = [v6 objectForKeyedSubscript:@"numEngagementsInScheduled"];
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsInScheduled:](v5, "setNumEngagementsInScheduled:", [v8 unsignedIntegerValue]);

      v9 = [v6 objectForKeyedSubscript:@"numEngagementsAfterExpiration"];
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumEngagementsAfterExpiration:](v5, "setNumEngagementsAfterExpiration:", [v9 unsignedIntegerValue]);

      v10 = [v6 objectForKeyedSubscript:@"numExpansions"];
      -[ATXPBSharedDigestEngagementTrackingMetrics setNumExpansions:](v5, "setNumExpansions:", [v10 unsignedIntegerValue]);

      v11 = [v6 objectForKeyedSubscript:@"sectionIdentifier"];
      v12 = +[ATXJSONHelper unwrapObject:v11];
      [(ATXPBSharedDigestEngagementTrackingMetrics *)v5 setSectionIdentifier:v12];

      v13 = [v6 objectForKeyedSubscript:@"sectionPosition"];
      -[ATXPBSharedDigestEngagementTrackingMetrics setSectionPosition:](v5, "setSectionPosition:", [v13 unsignedIntegerValue]);

      v14 = [v6 objectForKeyedSubscript:@"sectionSize"];

      -[ATXPBSharedDigestEngagementTrackingMetrics setSectionSize:](v5, "setSectionSize:", [v14 unsignedIntegerValue]);
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v20[7] = *MEMORY[0x1E4F143B8];
  v19[0] = @"numEngagementsInUpcoming";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v17 = +[ATXJSONHelper wrapObject:v18];
  v20[0] = v17;
  v19[1] = @"numEngagementsInScheduled";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v15 = +[ATXJSONHelper wrapObject:v16];
  v20[1] = v15;
  v19[2] = @"numEngagementsAfterExpiration";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPBSharedDigestEngagementTrackingMetrics hasNumEngagementsAfterExpiration](self, "hasNumEngagementsAfterExpiration"));
  v3 = +[ATXJSONHelper wrapObject:v14];
  v20[2] = v3;
  v19[3] = @"numExpansions";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics numExpansions](self, "numExpansions"));
  v5 = +[ATXJSONHelper wrapObject:v4];
  v20[3] = v5;
  v19[4] = @"sectionIdentifier";
  id v6 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self sectionIdentifier];
  v7 = +[ATXJSONHelper wrapObject:v6];
  v20[4] = v7;
  v19[5] = @"sectionPosition";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics sectionPosition](self, "sectionPosition"));
  v9 = +[ATXJSONHelper wrapObject:v8];
  v20[5] = v9;
  v19[6] = @"sectionSize";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ATXPBSharedDigestEngagementTrackingMetrics sectionSize](self, "sectionSize"));
  v11 = +[ATXJSONHelper wrapObject:v10];
  v20[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:7];

  return v12;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numEngagementsInUpcoming = a3;
}

- (void)setHasNumEngagementsInUpcoming:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumEngagementsInUpcoming
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numEngagementsInScheduled = a3;
}

- (void)setHasNumEngagementsInScheduled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumEngagementsInScheduled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numEngagementsAfterExpiration = a3;
}

- (void)setHasNumEngagementsAfterExpiration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumEngagementsAfterExpiration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumExpansions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numExpansions = a3;
}

- (void)setHasNumExpansions:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumExpansions
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSectionIdentifier
{
  return self->_sectionIdentifier != 0;
}

- (void)setSectionPosition:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_sectionPosition = a3;
}

- (void)setHasSectionPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSectionPosition
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSectionSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_sectionSize = a3;
}

- (void)setHasSectionSize:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSectionSize
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numDigestExpansions = a3;
}

- (void)setHasNumDigestExpansions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumDigestExpansions
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSharedDigestEngagementTrackingMetrics;
  id v4 = [(ATXPBSharedDigestEngagementTrackingMetrics *)&v8 description];
  v5 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_numEngagementsInUpcoming];
    [v3 setObject:v10 forKey:@"numEngagementsInUpcoming"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = [NSNumber numberWithUnsignedLongLong:self->_numEngagementsInScheduled];
  [v3 setObject:v11 forKey:@"numEngagementsInScheduled"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  v12 = [NSNumber numberWithUnsignedLongLong:self->_numEngagementsAfterExpiration];
  [v3 setObject:v12 forKey:@"numEngagementsAfterExpiration"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_numExpansions];
    [v3 setObject:v5 forKey:@"numExpansions"];
  }
LABEL_6:
  sectionIdentifier = self->_sectionIdentifier;
  if (sectionIdentifier) {
    [v3 setObject:sectionIdentifier forKey:@"sectionIdentifier"];
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:self->_sectionPosition];
    [v3 setObject:v13 forKey:@"sectionPosition"];

    char v7 = (char)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_10:
      if ((v7 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  v14 = [NSNumber numberWithUnsignedLongLong:self->_sectionSize];
  [v3 setObject:v14 forKey:@"sectionSize"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_numDigestExpansions];
    [v3 setObject:v8 forKey:@"numDigestExpansions"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_sectionIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  char v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_11:
  }
    PBDataWriterWriteUint64Field();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_numEngagementsInUpcoming;
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_numEngagementsInScheduled;
  *((unsigned char *)v4 + 72) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_numExpansions;
    *((unsigned char *)v4 + 72) |= 0x10u;
  }
LABEL_5:
  if (self->_sectionIdentifier)
  {
    char v7 = v4;
    objc_msgSend(v4, "setSectionIdentifier:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[6] = self->_sectionPosition;
    *((unsigned char *)v4 + 72) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  v4[7] = self->_sectionSize;
  *((unsigned char *)v4 + 72) |= 0x40u;
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  v4[2] = self->_numEngagementsAfterExpiration;
  *((unsigned char *)v4 + 72) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    v4[1] = self->_numDigestExpansions;
    *((unsigned char *)v4 + 72) |= 1u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_numEngagementsInUpcoming;
    *(unsigned char *)(v5 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_numEngagementsInScheduled;
  *(unsigned char *)(v5 + 72) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(void *)(v5 + 40) = self->_numExpansions;
    *(unsigned char *)(v5 + 72) |= 0x10u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_sectionIdentifier copyWithZone:a3];
  v9 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_sectionPosition;
    *(unsigned char *)(v6 + 72) |= 0x20u;
    char v10 = (char)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_7:
      if ((v10 & 2) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      *(void *)(v6 + 16) = self->_numEngagementsAfterExpiration;
      *(unsigned char *)(v6 + 72) |= 2u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 56) = self->_sectionSize;
  *(unsigned char *)(v6 + 72) |= 0x40u;
  char v10 = (char)self->_has;
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if (v10)
  {
LABEL_9:
    *(void *)(v6 + 8) = self->_numDigestExpansions;
    *(unsigned char *)(v6 + 72) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_numEngagementsInUpcoming != *((void *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_numEngagementsInScheduled != *((void *)v4 + 3)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_numExpansions != *((void *)v4 + 5)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  sectionIdentifier = self->_sectionIdentifier;
  if ((unint64_t)sectionIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionIdentifier, "isEqual:"))
    {
LABEL_39:
      BOOL v7 = 0;
      goto LABEL_40;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) == 0 || self->_sectionPosition != *((void *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x40) == 0 || self->_sectionSize != *((void *)v4 + 7)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x40) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_numEngagementsAfterExpiration != *((void *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_39;
  }
  BOOL v7 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_numDigestExpansions != *((void *)v4 + 1)) {
      goto LABEL_39;
    }
    BOOL v7 = 1;
  }
LABEL_40:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_numEngagementsInUpcoming;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_numEngagementsInScheduled;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_numExpansions;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_sectionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    unint64_t v7 = 2654435761u * self->_sectionPosition;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_10:
      unint64_t v8 = 2654435761u * self->_sectionSize;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      unint64_t v9 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_12;
      }
LABEL_16:
      unint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6;
    }
  }
  else
  {
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
  }
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  unint64_t v9 = 2654435761u * self->_numEngagementsAfterExpiration;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  unint64_t v10 = 2654435761u * self->_numDigestExpansions;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_numEngagementsInUpcoming = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numEngagementsInScheduled = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
LABEL_4:
    self->_numExpansions = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (*((void *)v4 + 8))
  {
    id v7 = v4;
    -[ATXPBSharedDigestEngagementTrackingMetrics setSectionIdentifier:](self, "setSectionIdentifier:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 0x20) != 0)
  {
    self->_sectionPosition = *((void *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 72);
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_sectionSize = *((void *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  self->_numEngagementsAfterExpiration = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 72))
  {
LABEL_11:
    self->_numDigestExpansions = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_12:
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void).cxx_destruct
{
}

@end