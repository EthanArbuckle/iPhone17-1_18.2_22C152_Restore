@interface ATXPBHomeScreenWidgetIdentifiable
- (BOOL)hasAppBundleId;
- (BOOL)hasExtensionBundleId;
- (BOOL)hasIntent;
- (BOOL)hasPredictionSource;
- (BOOL)hasWidgetKind;
- (BOOL)hasWidgetUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)onboardingWidget;
- (BOOL)readFrom:(id)a3;
- (BOOL)suggestedWidget;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sizeAsString:(void *)a1;
- (uint64_t)appBundleId;
- (uint64_t)extensionBundleId;
- (uint64_t)hasOnboardingWidget;
- (uint64_t)hasScore;
- (uint64_t)hasSize;
- (uint64_t)hasSuggestedWidget;
- (uint64_t)intent;
- (uint64_t)predictionSource;
- (uint64_t)setHasOnboardingWidget:(uint64_t)result;
- (uint64_t)setHasScore:(uint64_t)result;
- (uint64_t)setHasSize:(uint64_t)result;
- (uint64_t)setHasSuggestedWidget:(uint64_t)result;
- (uint64_t)setOnboardingWidget:(uint64_t)result;
- (uint64_t)setScore:(uint64_t)result;
- (uint64_t)setSize:(uint64_t)result;
- (uint64_t)setSuggestedWidget:(uint64_t)result;
- (uint64_t)size;
- (uint64_t)widgetKind;
- (uint64_t)widgetUniqueId;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setAppBundleId:(uint64_t)a1;
- (void)setExtensionBundleId:(uint64_t)a1;
- (void)setIntent:(uint64_t)a1;
- (void)setPredictionSource:(uint64_t)a1;
- (void)setWidgetKind:(uint64_t)a1;
- (void)setWidgetUniqueId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBHomeScreenWidgetIdentifiable

- (BOOL)hasExtensionBundleId
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasWidgetKind
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (BOOL)hasAppBundleId
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (BOOL)hasIntent
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result) {
    return *(void *)(result + 64) != 0;
  }
  return result;
}

- (uint64_t)size
{
  if (result)
  {
    if ((*(unsigned char *)(result + 76) & 2) != 0) {
      return *(unsigned int *)(result + 48);
    }
    else {
      return 1;
    }
  }
  return result;
}

- (uint64_t)setSize:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 2u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasSize:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSize
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 1) & 1;
  }
  return result;
}

- (id)sizeAsString:(void *)a1
{
  if (a1)
  {
    if ((a2 - 1) >= 5)
    {
      a1 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    }
    else
    {
      a1 = *(&off_1E5D0A138 + (int)a2 - 1);
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 8u;
    *(unsigned char *)(result + 73) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedWidget
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setOnboardingWidget:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 4u;
    *(unsigned char *)(result + 72) = a2;
  }
  return result;
}

- (uint64_t)setHasOnboardingWidget:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasOnboardingWidget
{
  if (result) {
    return (*(unsigned __int8 *)(result + 76) >> 2) & 1;
  }
  return result;
}

- (uint64_t)setScore:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 76) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasScore:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 76) = *(unsigned char *)(result + 76) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasScore
{
  if (result) {
    return *(unsigned char *)(result + 76) & 1;
  }
  return result;
}

- (BOOL)hasPredictionSource
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHomeScreenWidgetIdentifiable;
  v4 = [(ATXPBHomeScreenWidgetIdentifiable *)&v8 description];
  v5 = [(ATXPBHomeScreenWidgetIdentifiable *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  extensionBundleId = self->_extensionBundleId;
  if (extensionBundleId) {
    [v3 setObject:extensionBundleId forKey:@"extensionBundleId"];
  }
  widgetKind = self->_widgetKind;
  if (widgetKind) {
    [v4 setObject:widgetKind forKey:@"widgetKind"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v4 setObject:appBundleId forKey:@"appBundleId"];
  }
  intent = self->_intent;
  if (intent) {
    [v4 setObject:intent forKey:@"intent"];
  }
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId) {
    [v4 setObject:widgetUniqueId forKey:@"widgetUniqueId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int v11 = self->_size - 1;
    if (v11 >= 5)
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_size);
    }
    else
    {
      v12 = *(&off_1E5D0A138 + v11);
    }
    [v4 setObject:v12 forKey:@"size"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_suggestedWidget];
    [v4 setObject:v16 forKey:@"suggestedWidget"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_18;
  }
  v17 = [NSNumber numberWithBool:self->_onboardingWidget];
  [v4 setObject:v17 forKey:@"onboardingWidget"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_19:
    v13 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v13 forKey:@"score"];
  }
LABEL_20:
  predictionSource = self->_predictionSource;
  if (predictionSource) {
    [v4 setObject:predictionSource forKey:@"predictionSource"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenWidgetIdentifiableReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_extensionBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_widgetKind)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_appBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_intent)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_widgetUniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_15:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_16:
  if (self->_predictionSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_19;
  }
  id v4 = *(void **)(a1 + 24);
  id v11 = v3;
  if (v4)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setExtensionBundleId:]((uint64_t)v3, v4);
    id v3 = v11;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setWidgetKind:]((uint64_t)v11, v5);
    id v3 = v11;
  }
  id v6 = *(void **)(a1 + 16);
  if (v6)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setAppBundleId:]((uint64_t)v11, v6);
    id v3 = v11;
  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setIntent:]((uint64_t)v11, v7);
    id v3 = v11;
  }
  objc_super v8 = *(void **)(a1 + 64);
  if (v8)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setWidgetUniqueId:]((uint64_t)v11, v8);
    id v3 = v11;
  }
  char v9 = *(unsigned char *)(a1 + 76);
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
    *((unsigned char *)v3 + 76) |= 2u;
    char v9 = *(unsigned char *)(a1 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)(a1 + 76) & 8) == 0)
  {
    goto LABEL_14;
  }
  *((unsigned char *)v3 + 73) = *(unsigned char *)(a1 + 73);
  *((unsigned char *)v3 + 76) |= 8u;
  char v9 = *(unsigned char *)(a1 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_15:
    if ((v9 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_24:
  *((unsigned char *)v3 + 72) = *(unsigned char *)(a1 + 72);
  *((unsigned char *)v3 + 76) |= 4u;
  if (*(unsigned char *)(a1 + 76))
  {
LABEL_16:
    *((void *)v3 + 1) = *(void *)(a1 + 8);
    *((unsigned char *)v3 + 76) |= 1u;
  }
LABEL_17:
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    -[ATXPBHomeScreenWidgetIdentifiable setPredictionSource:]((uint64_t)v11, v10);
    id v3 = v11;
  }
LABEL_19:
}

- (void)setExtensionBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setWidgetKind:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setAppBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setIntent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setPredictionSource:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_extensionBundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_widgetKind copyWithZone:a3];
  char v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  id v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSData *)self->_intent copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_widgetUniqueId copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_size;
    *(unsigned char *)(v5 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v5 + 72) = self->_onboardingWidget;
      *(unsigned char *)(v5 + 76) |= 4u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 73) = self->_suggestedWidget;
  *(unsigned char *)(v5 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
LABEL_6:
  uint64_t v17 = [(NSString *)self->_predictionSource copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  extensionBundleId = self->_extensionBundleId;
  if ((unint64_t)extensionBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](extensionBundleId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:")) {
      goto LABEL_40;
    }
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  intent = self->_intent;
  if ((unint64_t)intent | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](intent, "isEqual:")) {
      goto LABEL_40;
    }
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_size != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_suggestedWidget)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) != 0)
    {
      if (self->_onboardingWidget)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_40;
        }
        goto LABEL_33;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_33;
      }
    }
LABEL_40:
    char v11 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0) {
    goto LABEL_40;
  }
LABEL_33:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_40;
  }
  predictionSource = self->_predictionSource;
  if ((unint64_t)predictionSource | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](predictionSource, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_41:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_extensionBundleId hash];
  NSUInteger v4 = [(NSString *)self->_widgetKind hash];
  NSUInteger v5 = [(NSString *)self->_appBundleId hash];
  uint64_t v6 = [(NSData *)self->_intent hash];
  NSUInteger v7 = [(NSString *)self->_widgetUniqueId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_size;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v9 = 2654435761 * self->_suggestedWidget;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v10 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v15 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ [(NSString *)self->_predictionSource hash];
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v10 = 2654435761 * self->_onboardingWidget;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double score = self->_score;
  double v12 = -score;
  if (score >= 0.0) {
    double v12 = self->_score;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ [(NSString *)self->_predictionSource hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (!a1) {
    goto LABEL_19;
  }
  NSUInteger v4 = (void *)v3[3];
  char v11 = v3;
  if (v4)
  {
    objc_storeStrong((id *)(a1 + 24), v4);
    NSUInteger v3 = v11;
  }
  NSUInteger v5 = (void *)v3[7];
  if (v5)
  {
    objc_storeStrong((id *)(a1 + 56), v5);
    NSUInteger v3 = v11;
  }
  uint64_t v6 = (void *)v3[2];
  if (v6)
  {
    objc_storeStrong((id *)(a1 + 16), v6);
    NSUInteger v3 = v11;
  }
  NSUInteger v7 = (void *)v3[4];
  if (v7)
  {
    objc_storeStrong((id *)(a1 + 32), v7);
    NSUInteger v3 = v11;
  }
  uint64_t v8 = (void *)v3[8];
  if (v8)
  {
    objc_storeStrong((id *)(a1 + 64), v8);
    NSUInteger v3 = v11;
  }
  char v9 = *((unsigned char *)v3 + 76);
  if ((v9 & 2) != 0)
  {
    *(_DWORD *)(a1 + 48) = *((_DWORD *)v3 + 12);
    *(unsigned char *)(a1 + 76) |= 2u;
    char v9 = *((unsigned char *)v3 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v3 + 76) & 8) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(a1 + 73) = *((unsigned char *)v3 + 73);
  *(unsigned char *)(a1 + 76) |= 8u;
  char v9 = *((unsigned char *)v3 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_15:
    if ((v9 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_24:
  *(unsigned char *)(a1 + 72) = *((unsigned char *)v3 + 72);
  *(unsigned char *)(a1 + 76) |= 4u;
  if (*((unsigned char *)v3 + 76))
  {
LABEL_16:
    *(void *)(a1 + 8) = v3[1];
    *(unsigned char *)(a1 + 76) |= 1u;
  }
LABEL_17:
  uint64_t v10 = (void *)v3[5];
  if (v10)
  {
    objc_storeStrong((id *)(a1 + 40), v10);
    NSUInteger v3 = v11;
  }
LABEL_19:
}

- (uint64_t)extensionBundleId
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)widgetKind
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)appBundleId
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)intent
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)widgetUniqueId
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (BOOL)suggestedWidget
{
  if (result) {
    return *(unsigned char *)(result + 73) != 0;
  }
  return result;
}

- (BOOL)onboardingWidget
{
  if (result) {
    return *(unsigned char *)(result + 72) != 0;
  }
  return result;
}

- (double)score
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)predictionSource
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end