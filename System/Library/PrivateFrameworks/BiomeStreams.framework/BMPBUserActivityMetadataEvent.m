@interface BMPBUserActivityMetadataEvent
+ (Class)topicsType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasActivityType;
- (BOOL)hasAssociatedBundleId;
- (BOOL)hasAssociatedImageRepresentation;
- (BOOL)hasAssociatedURLString;
- (BOOL)hasHasAssociatedImageRepresentation;
- (BOOL)hasModeIdentifier;
- (BOOL)hasTitle;
- (BOOL)hasUserActivityData;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userActivityData;
- (NSMutableArray)topics;
- (NSString)activityType;
- (NSString)associatedBundleId;
- (NSString)associatedURLString;
- (NSString)modeIdentifier;
- (NSString)title;
- (NSString)uuid;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicsCount;
- (void)addTopics:(id)a3;
- (void)clearTopics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setActivityType:(id)a3;
- (void)setAssociatedBundleId:(id)a3;
- (void)setAssociatedURLString:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasAssociatedImageRepresentation:(BOOL)a3;
- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopics:(id)a3;
- (void)setUserActivityData:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserActivityMetadataEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserActivityData
{
  return self->_userActivityData != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasAssociatedBundleId
{
  return self->_associatedBundleId != 0;
}

- (BOOL)hasAssociatedURLString
{
  return self->_associatedURLString != 0;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
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

- (void)setHasAssociatedImageRepresentation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasAssociatedImageRepresentation = a3;
}

- (void)setHasHasAssociatedImageRepresentation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasAssociatedImageRepresentation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserActivityMetadataEvent;
  id v4 = [(BMPBUserActivityMetadataEvent *)&v8 description];
  v5 = [(BMPBUserActivityMetadataEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  userActivityData = self->_userActivityData;
  if (userActivityData) {
    [v3 setObject:userActivityData forKey:@"userActivityData"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  activityType = self->_activityType;
  if (activityType) {
    [v3 setObject:activityType forKey:@"activityType"];
  }
  associatedBundleId = self->_associatedBundleId;
  if (associatedBundleId) {
    [v3 setObject:associatedBundleId forKey:@"associatedBundleId"];
  }
  associatedURLString = self->_associatedURLString;
  if (associatedURLString) {
    [v3 setObject:associatedURLString forKey:@"associatedURLString"];
  }
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier) {
    [v3 setObject:modeIdentifier forKey:@"modeIdentifier"];
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = self->_topics;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"topics"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_hasAssociatedImageRepresentation];
    [v3 setObject:v18 forKey:@"hasAssociatedImageRepresentation"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserActivityMetadataEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userActivityData) {
    PBDataWriterWriteDataField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityType) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_modeIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_topics;
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  long long v10 = v4;
  if (self->_userActivityData) {
    objc_msgSend(v4, "setUserActivityData:");
  }
  if (self->_title) {
    objc_msgSend(v10, "setTitle:");
  }
  if (self->_activityType) {
    objc_msgSend(v10, "setActivityType:");
  }
  if (self->_associatedBundleId) {
    objc_msgSend(v10, "setAssociatedBundleId:");
  }
  if (self->_associatedURLString) {
    objc_msgSend(v10, "setAssociatedURLString:");
  }
  if (self->_modeIdentifier) {
    objc_msgSend(v10, "setModeIdentifier:");
  }
  if ([(BMPBUserActivityMetadataEvent *)self topicsCount])
  {
    [v10 clearTopics];
    unint64_t v5 = [(BMPBUserActivityMetadataEvent *)self topicsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBUserActivityMetadataEvent *)self topicsAtIndex:i];
        [v10 addTopics:v8];
      }
    }
  }
  uint64_t v9 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[80] = self->_hasAssociatedImageRepresentation;
    v10[84] |= 2u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v10, "setUuid:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_userActivityData copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  long long v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_activityType copyWithZone:a3];
  long long v12 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_associatedBundleId copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_associatedURLString copyWithZone:a3];
  v16 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v15;

  uint64_t v17 = [(NSString *)self->_modeIdentifier copyWithZone:a3];
  v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = self->_topics;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v23), "copyWithZone:", a3, (void)v28);
        [(id)v6 addTopics:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_hasAssociatedImageRepresentation;
    *(unsigned char *)(v6 + 84) |= 2u;
  }
  uint64_t v25 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3, (void)v28);
  uint64_t v26 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_25;
  }
  userActivityData = self->_userActivityData;
  if ((unint64_t)userActivityData | *((void *)v4 + 8)
    && !-[NSData isEqual:](userActivityData, "isEqual:"))
  {
    goto LABEL_25;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_25;
    }
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:")) {
      goto LABEL_25;
    }
  }
  associatedBundleId = self->_associatedBundleId;
  if ((unint64_t)associatedBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](associatedBundleId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  associatedURLString = self->_associatedURLString;
  if ((unint64_t)associatedURLString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](associatedURLString, "isEqual:")) {
      goto LABEL_25;
    }
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:")) {
      goto LABEL_25;
    }
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](topics, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0) {
      goto LABEL_31;
    }
LABEL_25:
    char v12 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 84) & 2) == 0) {
    goto LABEL_25;
  }
  if (!self->_hasAssociatedImageRepresentation)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  if (!*((unsigned char *)v4 + 80)) {
    goto LABEL_25;
  }
LABEL_31:
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 9)) {
    char v12 = -[NSString isEqual:](uuid, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSData *)self->_userActivityData hash];
  NSUInteger v9 = [(NSString *)self->_title hash];
  NSUInteger v10 = [(NSString *)self->_activityType hash];
  NSUInteger v11 = [(NSString *)self->_associatedBundleId hash];
  NSUInteger v12 = [(NSString *)self->_associatedURLString hash];
  NSUInteger v13 = [(NSString *)self->_modeIdentifier hash];
  uint64_t v14 = [(NSMutableArray *)self->_topics hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v15 = 2654435761 * self->_hasAssociatedImageRepresentation;
  }
  else {
    uint64_t v15 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_uuid hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 84))
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8)) {
    -[BMPBUserActivityMetadataEvent setUserActivityData:](self, "setUserActivityData:");
  }
  if (*((void *)v5 + 6)) {
    -[BMPBUserActivityMetadataEvent setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 2)) {
    -[BMPBUserActivityMetadataEvent setActivityType:](self, "setActivityType:");
  }
  if (*((void *)v5 + 3)) {
    -[BMPBUserActivityMetadataEvent setAssociatedBundleId:](self, "setAssociatedBundleId:");
  }
  if (*((void *)v5 + 4)) {
    -[BMPBUserActivityMetadataEvent setAssociatedURLString:](self, "setAssociatedURLString:");
  }
  if (*((void *)v5 + 5)) {
    -[BMPBUserActivityMetadataEvent setModeIdentifier:](self, "setModeIdentifier:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 7);
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
        -[BMPBUserActivityMetadataEvent addTopics:](self, "addTopics:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v5 + 84) & 2) != 0)
  {
    self->_hasAssociatedImageRepresentation = *((unsigned char *)v5 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 9)) {
    -[BMPBUserActivityMetadataEvent setUuid:](self, "setUuid:");
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)associatedBundleId
{
  return self->_associatedBundleId;
}

- (void)setAssociatedBundleId:(id)a3
{
}

- (NSString)associatedURLString
{
  return self->_associatedURLString;
}

- (void)setAssociatedURLString:(id)a3
{
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (BOOL)hasAssociatedImageRepresentation
{
  return self->_hasAssociatedImageRepresentation;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedURLString, 0);
  objc_storeStrong((id *)&self->_associatedBundleId, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end