@interface SGDCKEvent
+ (Class)locationsType;
- (BOOL)allDay;
- (BOOL)cancelled;
- (BOOL)hasAllDay;
- (BOOL)hasCancelled;
- (BOOL)hasCategoryType;
- (BOOL)hasContent;
- (BOOL)hasCreationTimestamp;
- (BOOL)hasDomain;
- (BOOL)hasExtraKey;
- (BOOL)hasGroupId;
- (BOOL)hasInteractionInfo;
- (BOOL)hasLastModifiedTimestamp;
- (BOOL)hasMetadata;
- (BOOL)hasParentEntityType;
- (BOOL)hasSchemaOrg;
- (BOOL)hasSourceKey;
- (BOOL)hasTemplateName;
- (BOOL)hasTitle;
- (BOOL)hasWhen;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSData)schemaOrg;
- (NSMutableArray)locations;
- (NSString)content;
- (NSString)domain;
- (NSString)extraKey;
- (NSString)groupId;
- (NSString)sourceKey;
- (NSString)templateName;
- (NSString)title;
- (SGDCKInteractionInfo)interactionInfo;
- (SGDCKTimeRange)when;
- (double)creationTimestamp;
- (double)lastModifiedTimestamp;
- (id)categoryTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationsAtIndex:(unint64_t)a3;
- (int)StringAsCategoryType:(id)a3;
- (int)categoryType;
- (int64_t)parentEntityType;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (void)addLocations:(id)a3;
- (void)clearLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCategoryType:(int)a3;
- (void)setContent:(id)a3;
- (void)setCreationTimestamp:(double)a3;
- (void)setDomain:(id)a3;
- (void)setExtraKey:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setHasAllDay:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasCategoryType:(BOOL)a3;
- (void)setHasCreationTimestamp:(BOOL)a3;
- (void)setHasLastModifiedTimestamp:(BOOL)a3;
- (void)setHasParentEntityType:(BOOL)a3;
- (void)setInteractionInfo:(id)a3;
- (void)setLastModifiedTimestamp:(double)a3;
- (void)setLocations:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setParentEntityType:(int64_t)a3;
- (void)setSchemaOrg:(id)a3;
- (void)setSourceKey:(id)a3;
- (void)setTemplateName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWhen:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGDCKEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_interactionInfo, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_extraKey, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (int64_t)parentEntityType
{
  return self->_parentEntityType;
}

- (void)setInteractionInfo:(id)a3
{
}

- (SGDCKInteractionInfo)interactionInfo
{
  return self->_interactionInfo;
}

- (int)categoryType
{
  return self->_categoryType;
}

- (void)setTemplateName:(id)a3
{
}

- (NSString)templateName
{
  return self->_templateName;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setSchemaOrg:(id)a3
{
}

- (NSData)schemaOrg
{
  return self->_schemaOrg;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setExtraKey:(id)a3
{
}

- (NSString)extraKey
{
  return self->_extraKey;
}

- (void)setLocations:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setWhen:(id)a3
{
}

- (SGDCKTimeRange)when
{
  return self->_when;
}

- (double)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setSourceKey:(id)a3
{
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[SGDCKEvent setGroupId:](self, "setGroupId:");
  }
  if (*((void *)v4 + 13)) {
    -[SGDCKEvent setSourceKey:](self, "setSourceKey:");
  }
  if (*((void *)v4 + 5)) {
    -[SGDCKEvent setContent:](self, "setContent:");
  }
  if (*((void *)v4 + 15)) {
    -[SGDCKEvent setTitle:](self, "setTitle:");
  }
  char v5 = *((unsigned char *)v4 + 140);
  if (v5)
  {
    self->_creationTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 140);
  }
  if ((v5 & 2) != 0)
  {
    self->_lastModifiedTimestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  when = self->_when;
  uint64_t v7 = *((void *)v4 + 16);
  if (when)
  {
    if (v7) {
      -[SGDCKTimeRange mergeFrom:](when, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SGDCKEvent setWhen:](self, "setWhen:");
  }
  if ((*((unsigned char *)v4 + 140) & 0x10) != 0)
  {
    self->_allDay = *((unsigned char *)v4 + 136);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v4 + 10);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SGDCKEvent addLocations:](self, "addLocations:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*((void *)v4 + 7)) {
    -[SGDCKEvent setExtraKey:](self, "setExtraKey:");
  }
  if ((*((unsigned char *)v4 + 140) & 0x20) != 0)
  {
    self->_cancelled = *((unsigned char *)v4 + 137);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 12)) {
    -[SGDCKEvent setSchemaOrg:](self, "setSchemaOrg:");
  }
  if (*((void *)v4 + 6)) {
    -[SGDCKEvent setDomain:](self, "setDomain:");
  }
  if (*((void *)v4 + 14)) {
    -[SGDCKEvent setTemplateName:](self, "setTemplateName:");
  }
  if ((*((unsigned char *)v4 + 140) & 8) != 0)
  {
    self->_categoryType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
  interactionInfo = self->_interactionInfo;
  uint64_t v14 = *((void *)v4 + 9);
  if (interactionInfo)
  {
    if (v14) {
      -[SGDCKInteractionInfo mergeFrom:](interactionInfo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SGDCKEvent setInteractionInfo:](self, "setInteractionInfo:");
  }
  if ((*((unsigned char *)v4 + 140) & 4) != 0)
  {
    self->_parentEntityType = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 11)) {
    -[SGDCKEvent setMetadata:](self, "setMetadata:");
  }
}

- (unint64_t)hash
{
  NSUInteger v32 = [(NSString *)self->_groupId hash];
  NSUInteger v31 = [(NSString *)self->_sourceKey hash];
  NSUInteger v30 = [(NSString *)self->_content hash];
  NSUInteger v29 = [(NSString *)self->_title hash];
  char has = (char)self->_has;
  if (has)
  {
    double creationTimestamp = self->_creationTimestamp;
    double v6 = -creationTimestamp;
    if (creationTimestamp >= 0.0) {
      double v6 = self->_creationTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v28 = v4;
  if ((has & 2) != 0)
  {
    double lastModifiedTimestamp = self->_lastModifiedTimestamp;
    double v11 = -lastModifiedTimestamp;
    if (lastModifiedTimestamp >= 0.0) {
      double v11 = self->_lastModifiedTimestamp;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v27 = v9;
  unint64_t v26 = [(SGDCKTimeRange *)self->_when hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v14 = [(NSMutableArray *)self->_locations hash];
  }
  else {
    uint64_t v14 = [(NSMutableArray *)self->_locations hash];
  }
  uint64_t v15 = v14;
  NSUInteger v16 = [(NSString *)self->_extraKey hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v17 = 2654435761 * self->_cancelled;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [(NSData *)self->_schemaOrg hash];
  NSUInteger v19 = [(NSString *)self->_domain hash];
  NSUInteger v20 = [(NSString *)self->_templateName hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v21 = 2654435761 * self->_categoryType;
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v22 = [(SGDCKInteractionInfo *)self->_interactionInfo hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v23 = 2654435761 * self->_parentEntityType;
  }
  else {
    uint64_t v23 = 0;
  }
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ [(NSData *)self->_metadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:")) {
      goto LABEL_64;
    }
  }
  sourceKey = self->_sourceKey;
  if ((unint64_t)sourceKey | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceKey, "isEqual:")) {
      goto LABEL_64;
    }
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](content, "isEqual:")) {
      goto LABEL_64;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_64;
    }
  }
  char has = (char)self->_has;
  char v10 = *((unsigned char *)v4 + 140);
  if (has)
  {
    if ((*((unsigned char *)v4 + 140) & 1) == 0 || self->_creationTimestamp != *((double *)v4 + 1)) {
      goto LABEL_64;
    }
  }
  else if (*((unsigned char *)v4 + 140))
  {
    goto LABEL_64;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 2) == 0 || self->_lastModifiedTimestamp != *((double *)v4 + 2)) {
      goto LABEL_64;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 2) != 0)
  {
    goto LABEL_64;
  }
  when = self->_when;
  if ((unint64_t)when | *((void *)v4 + 16))
  {
    if (!-[SGDCKTimeRange isEqual:](when, "isEqual:")) {
      goto LABEL_64;
    }
    char has = (char)self->_has;
    char v10 = *((unsigned char *)v4 + 140);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_64;
    }
    if (self->_allDay)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_64;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_64;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_64;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](locations, "isEqual:"))
  {
    goto LABEL_64;
  }
  extraKey = self->_extraKey;
  if ((unint64_t)extraKey | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](extraKey, "isEqual:")) {
      goto LABEL_64;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 0x20) == 0) {
      goto LABEL_64;
    }
    if (self->_cancelled)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_64;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_64;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 0x20) != 0)
  {
    goto LABEL_64;
  }
  schemaOrg = self->_schemaOrg;
  if ((unint64_t)schemaOrg | *((void *)v4 + 12) && !-[NSData isEqual:](schemaOrg, "isEqual:")) {
    goto LABEL_64;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_64;
    }
  }
  templateName = self->_templateName;
  if ((unint64_t)templateName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](templateName, "isEqual:")) {
      goto LABEL_64;
    }
  }
  char v17 = (char)self->_has;
  char v18 = *((unsigned char *)v4 + 140);
  if ((v17 & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 8) == 0 || self->_categoryType != *((_DWORD *)v4 + 8)) {
      goto LABEL_64;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 8) != 0)
  {
    goto LABEL_64;
  }
  interactionInfo = self->_interactionInfo;
  if ((unint64_t)interactionInfo | *((void *)v4 + 9))
  {
    if (-[SGDCKInteractionInfo isEqual:](interactionInfo, "isEqual:"))
    {
      char v17 = (char)self->_has;
      char v18 = *((unsigned char *)v4 + 140);
      goto LABEL_57;
    }
LABEL_64:
    char v21 = 0;
    goto LABEL_65;
  }
LABEL_57:
  if ((v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_parentEntityType != *((void *)v4 + 3)) {
      goto LABEL_64;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_64;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 11)) {
    char v21 = -[NSData isEqual:](metadata, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_65:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupId copyWithZone:a3];
  long double v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_sourceKey copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  uint64_t v10 = [(NSString *)self->_content copyWithZone:a3];
  double v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  double v13 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_creationTimestamp;
    *(unsigned char *)(v5 + 140) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastModifiedTimestamp;
    *(unsigned char *)(v5 + 140) |= 2u;
  }
  id v15 = [(SGDCKTimeRange *)self->_when copyWithZone:a3];
  NSUInteger v16 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v15;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 136) = self->_allDay;
    *(unsigned char *)(v5 + 140) |= 0x10u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  char v17 = self->_locations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        unint64_t v22 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (void)v36);
        [(id)v5 addLocations:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_extraKey copyWithZone:a3];
  v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 137) = self->_cancelled;
    *(unsigned char *)(v5 + 140) |= 0x20u;
  }
  uint64_t v25 = -[NSData copyWithZone:](self->_schemaOrg, "copyWithZone:", a3, (void)v36);
  unint64_t v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  uint64_t v27 = [(NSString *)self->_domain copyWithZone:a3];
  unint64_t v28 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v27;

  uint64_t v29 = [(NSString *)self->_templateName copyWithZone:a3];
  NSUInteger v30 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v29;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_categoryType;
    *(unsigned char *)(v5 + 140) |= 8u;
  }
  id v31 = [(SGDCKInteractionInfo *)self->_interactionInfo copyWithZone:a3];
  NSUInteger v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_parentEntityType;
    *(unsigned char *)(v5 + 140) |= 4u;
  }
  uint64_t v33 = [(NSData *)self->_metadata copyWithZone:a3];
  v34 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v33;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  double v11 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v11;
  }
  if (self->_sourceKey)
  {
    objc_msgSend(v11, "setSourceKey:");
    id v4 = v11;
  }
  if (self->_content)
  {
    objc_msgSend(v11, "setContent:");
    id v4 = v11;
  }
  if (self->_title)
  {
    objc_msgSend(v11, "setTitle:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationTimestamp;
    v4[140] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_lastModifiedTimestamp;
    v4[140] |= 2u;
  }
  if (self->_when)
  {
    objc_msgSend(v11, "setWhen:");
    id v4 = v11;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[136] = self->_allDay;
    v4[140] |= 0x10u;
  }
  if ([(SGDCKEvent *)self locationsCount])
  {
    [v11 clearLocations];
    unint64_t v6 = [(SGDCKEvent *)self locationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(SGDCKEvent *)self locationsAtIndex:i];
        [v11 addLocations:v9];
      }
    }
  }
  if (self->_extraKey) {
    objc_msgSend(v11, "setExtraKey:");
  }
  uint64_t v10 = v11;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v11[137] = self->_cancelled;
    v11[140] |= 0x20u;
  }
  if (self->_schemaOrg)
  {
    objc_msgSend(v11, "setSchemaOrg:");
    uint64_t v10 = v11;
  }
  if (self->_domain)
  {
    objc_msgSend(v11, "setDomain:");
    uint64_t v10 = v11;
  }
  if (self->_templateName)
  {
    objc_msgSend(v11, "setTemplateName:");
    uint64_t v10 = v11;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_categoryType;
    v10[140] |= 8u;
  }
  if (self->_interactionInfo)
  {
    objc_msgSend(v11, "setInteractionInfo:");
    uint64_t v10 = v11;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v10 + 3) = self->_parentEntityType;
    v10[140] |= 4u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v11, "setMetadata:");
    uint64_t v10 = v11;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_groupId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_content) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_when) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_locations;
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

  if (self->_extraKey) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_schemaOrg) {
    PBDataWriterWriteDataField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_templateName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_interactionInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteSint64Field();
  }
  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  sourceKey = self->_sourceKey;
  if (sourceKey) {
    [v4 setObject:sourceKey forKey:@"sourceKey"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKey:@"content"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v10 = [NSNumber numberWithDouble:self->_creationTimestamp];
    [v4 setObject:v10 forKey:@"creationTimestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    long long v11 = [NSNumber numberWithDouble:self->_lastModifiedTimestamp];
    [v4 setObject:v11 forKey:@"lastModifiedTimestamp"];
  }
  when = self->_when;
  if (when)
  {
    long long v13 = [(SGDCKTimeRange *)when dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"when"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    long long v14 = [NSNumber numberWithBool:self->_allDay];
    [v4 setObject:v14 forKey:@"allDay"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v16 = self->_locations;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "dictionaryRepresentation", (void)v34);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"locations"];
  }
  extraKey = self->_extraKey;
  if (extraKey) {
    [v4 setObject:extraKey forKey:@"extraKey"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v23 = [NSNumber numberWithBool:self->_cancelled];
    [v4 setObject:v23 forKey:@"cancelled"];
  }
  schemaOrg = self->_schemaOrg;
  if (schemaOrg) {
    [v4 setObject:schemaOrg forKey:@"schemaOrg"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  templateName = self->_templateName;
  if (templateName) {
    [v4 setObject:templateName forKey:@"templateName"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v27 = [NSNumber numberWithInt:self->_categoryType];
    unint64_t v28 = [v27 stringValue];
    [v4 setObject:v28 forKey:@"categoryType"];
  }
  interactionInfo = self->_interactionInfo;
  if (interactionInfo)
  {
    NSUInteger v30 = [(SGDCKInteractionInfo *)interactionInfo dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"interactionInfo"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v31 = [NSNumber numberWithLongLong:self->_parentEntityType];
    [v4 setObject:v31 forKey:@"parentEntityType"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGDCKEvent;
  id v4 = [(SGDCKEvent *)&v8 description];
  uint64_t v5 = [(SGDCKEvent *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasParentEntityType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasParentEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setParentEntityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_parentEntityType = a3;
}

- (BOOL)hasInteractionInfo
{
  return self->_interactionInfo != 0;
}

- (int)StringAsCategoryType:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[SGDCKEvent StringAsCategoryType:]", "SGDCKEvent.m", 166, "0");
}

- (id)categoryTypeAsString:(int)a3
{
  id v3 = [NSNumber numberWithInt:*(void *)&a3];
  id v4 = [v3 stringValue];

  return v4;
}

- (BOOL)hasCategoryType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasCategoryType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setCategoryType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_categoryType = a3;
}

- (BOOL)hasTemplateName
{
  return self->_templateName != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasSchemaOrg
{
  return self->_schemaOrg != 0;
}

- (BOOL)hasCancelled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasCancelled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setCancelled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_cancelled = a3;
}

- (BOOL)hasExtraKey
{
  return self->_extraKey != 0;
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locations objectAtIndex:a3];
}

- (unint64_t)locationsCount
{
  return [(NSMutableArray *)self->_locations count];
}

- (void)addLocations:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableArray *)locations addObject:v4];
}

- (void)clearLocations
{
}

- (BOOL)hasAllDay
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasAllDay:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_allDay = a3;
}

- (BOOL)hasWhen
{
  return self->_when != 0;
}

- (BOOL)hasLastModifiedTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLastModifiedTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLastModifiedTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double lastModifiedTimestamp = a3;
}

- (BOOL)hasCreationTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double creationTimestamp = a3;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (BOOL)hasSourceKey
{
  return self->_sourceKey != 0;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

@end