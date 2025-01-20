@interface PDDPActivityReport
+ (Class)additionalItemsType;
- (BOOL)hasAttachmentType;
- (BOOL)hasContextIdentifierPath;
- (BOOL)hasContextObjectIdPath;
- (BOOL)hasContextStableObjectIdPath;
- (BOOL)hasContextTitle;
- (BOOL)hasContextTopic;
- (BOOL)hasContextType;
- (BOOL)hasContextUniversalLink;
- (BOOL)hasHandoutAuthorizedObjectId;
- (BOOL)hasPrimaryItem;
- (BOOL)hasProgress;
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)additionalItems;
- (NSString)contextIdentifierPath;
- (NSString)contextObjectIdPath;
- (NSString)contextStableObjectIdPath;
- (NSString)contextTitle;
- (NSString)contextTopic;
- (NSString)contextType;
- (NSString)contextUniversalLink;
- (NSString)handoutAuthorizedObjectId;
- (PDDPActivityReportItem)primaryItem;
- (PDDPAggregatedValue)progress;
- (PDDPAggregatedValue)time;
- (id)additionalItemsAtIndex:(unint64_t)a3;
- (id)attachmentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAttachmentType:(id)a3;
- (int)attachmentType;
- (unint64_t)additionalItemsCount;
- (unint64_t)hash;
- (void)addAdditionalItems:(id)a3;
- (void)clearAdditionalItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalItems:(id)a3;
- (void)setAttachmentType:(int)a3;
- (void)setContextIdentifierPath:(id)a3;
- (void)setContextObjectIdPath:(id)a3;
- (void)setContextStableObjectIdPath:(id)a3;
- (void)setContextTitle:(id)a3;
- (void)setContextTopic:(id)a3;
- (void)setContextType:(id)a3;
- (void)setContextUniversalLink:(id)a3;
- (void)setHandoutAuthorizedObjectId:(id)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setPrimaryItem:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPActivityReport

- (BOOL)hasContextType
{
  return self->_contextType != 0;
}

- (BOOL)hasContextTopic
{
  return self->_contextTopic != 0;
}

- (BOOL)hasContextTitle
{
  return self->_contextTitle != 0;
}

- (BOOL)hasContextIdentifierPath
{
  return self->_contextIdentifierPath != 0;
}

- (BOOL)hasContextObjectIdPath
{
  return self->_contextObjectIdPath != 0;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)hasProgress
{
  return self->_progress != 0;
}

- (BOOL)hasPrimaryItem
{
  return self->_primaryItem != 0;
}

- (void)clearAdditionalItems
{
}

- (void)addAdditionalItems:(id)a3
{
  id v4 = a3;
  additionalItems = self->_additionalItems;
  id v8 = v4;
  if (!additionalItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_additionalItems;
    self->_additionalItems = v6;

    id v4 = v8;
    additionalItems = self->_additionalItems;
  }
  [(NSMutableArray *)additionalItems addObject:v4];
}

- (unint64_t)additionalItemsCount
{
  return (unint64_t)[(NSMutableArray *)self->_additionalItems count];
}

- (id)additionalItemsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_additionalItems objectAtIndex:a3];
}

+ (Class)additionalItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContextUniversalLink
{
  return self->_contextUniversalLink != 0;
}

- (BOOL)hasContextStableObjectIdPath
{
  return self->_contextStableObjectIdPath != 0;
}

- (BOOL)hasHandoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId != 0;
}

- (int)attachmentType
{
  if (*(unsigned char *)&self->_has) {
    return self->_attachmentType;
  }
  else {
    return 0;
  }
}

- (void)setAttachmentType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAttachmentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)attachmentTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F4080 + a3);
  }

  return v3;
}

- (int)StringAsAttachmentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"URL_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTEXT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ASSET_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"APP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HAND_IN_REQUEST_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SURVEY_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ASSESSMENT_TYPE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPActivityReport;
  id v3 = [(PDDPActivityReport *)&v7 description];
  int v4 = [(PDDPActivityReport *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  contextType = self->_contextType;
  if (contextType) {
    [v3 setObject:contextType forKey:@"context_type"];
  }
  contextTopic = self->_contextTopic;
  if (contextTopic) {
    [v4 setObject:contextTopic forKey:@"context_topic"];
  }
  contextTitle = self->_contextTitle;
  if (contextTitle) {
    [v4 setObject:contextTitle forKey:@"context_title"];
  }
  contextIdentifierPath = self->_contextIdentifierPath;
  if (contextIdentifierPath) {
    [v4 setObject:contextIdentifierPath forKey:@"context_identifier_path"];
  }
  contextObjectIdPath = self->_contextObjectIdPath;
  if (contextObjectIdPath) {
    [v4 setObject:contextObjectIdPath forKey:@"context_object_id_path"];
  }
  time = self->_time;
  if (time)
  {
    v11 = [(PDDPAggregatedValue *)time dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"time"];
  }
  progress = self->_progress;
  if (progress)
  {
    v13 = [(PDDPAggregatedValue *)progress dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"progress"];
  }
  primaryItem = self->_primaryItem;
  if (primaryItem)
  {
    v15 = [(PDDPActivityReportItem *)primaryItem dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"primary_item"];
  }
  if ([(NSMutableArray *)self->_additionalItems count])
  {
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_additionalItems, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v17 = self->_additionalItems;
    id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"additional_items"];
  }
  contextUniversalLink = self->_contextUniversalLink;
  if (contextUniversalLink) {
    [v4 setObject:contextUniversalLink forKey:@"context_universal_link"];
  }
  contextStableObjectIdPath = self->_contextStableObjectIdPath;
  if (contextStableObjectIdPath) {
    [v4 setObject:contextStableObjectIdPath forKey:@"context_stable_object_id_path"];
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if (handoutAuthorizedObjectId) {
    [v4 setObject:handoutAuthorizedObjectId forKey:@"handout_authorized_object_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t attachmentType = self->_attachmentType;
    if (attachmentType >= 8)
    {
      v27 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attachmentType];
    }
    else
    {
      v27 = *(&off_1001F4080 + attachmentType);
    }
    [v4 setObject:v27 forKey:@"attachment_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B67A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_contextType) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextTopic) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextObjectIdPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_time) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_progress) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_primaryItem) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_additionalItems;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_contextUniversalLink) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextIdentifierPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_contextStableObjectIdPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_handoutAuthorizedObjectId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_contextType) {
    objc_msgSend(v9, "setContextType:");
  }
  if (self->_contextTopic) {
    objc_msgSend(v9, "setContextTopic:");
  }
  if (self->_contextTitle) {
    objc_msgSend(v9, "setContextTitle:");
  }
  if (self->_contextObjectIdPath) {
    objc_msgSend(v9, "setContextObjectIdPath:");
  }
  if (self->_time) {
    objc_msgSend(v9, "setTime:");
  }
  if (self->_progress) {
    objc_msgSend(v9, "setProgress:");
  }
  if (self->_primaryItem) {
    objc_msgSend(v9, "setPrimaryItem:");
  }
  if ([(PDDPActivityReport *)self additionalItemsCount])
  {
    [v9 clearAdditionalItems];
    unint64_t v4 = [(PDDPActivityReport *)self additionalItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPActivityReport *)self additionalItemsAtIndex:i];
        [v9 addAdditionalItems:v7];
      }
    }
  }
  if (self->_contextUniversalLink) {
    objc_msgSend(v9, "setContextUniversalLink:");
  }
  uint64_t v8 = v9;
  if (self->_contextIdentifierPath)
  {
    objc_msgSend(v9, "setContextIdentifierPath:");
    uint64_t v8 = v9;
  }
  if (self->_contextStableObjectIdPath)
  {
    objc_msgSend(v9, "setContextStableObjectIdPath:");
    uint64_t v8 = v9;
  }
  if (self->_handoutAuthorizedObjectId)
  {
    objc_msgSend(v9, "setHandoutAuthorizedObjectId:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[4] = self->_attachmentType;
    *((unsigned char *)v8 + 112) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_contextType copyWithZone:a3];
  objc_super v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_contextTopic copyWithZone:a3];
  id v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(NSString *)self->_contextTitle copyWithZone:a3];
  long long v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(NSString *)self->_contextObjectIdPath copyWithZone:a3];
  long long v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(PDDPAggregatedValue *)self->_time copyWithZone:a3];
  v15 = (void *)v5[13];
  v5[13] = v14;

  id v16 = [(PDDPAggregatedValue *)self->_progress copyWithZone:a3];
  v17 = (void *)v5[12];
  v5[12] = v16;

  id v18 = [(PDDPActivityReportItem *)self->_primaryItem copyWithZone:a3];
  id v19 = (void *)v5[11];
  v5[11] = v18;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v20 = self->_additionalItems;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (void)v35);
        [v5 addAdditionalItems:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v22);
  }

  id v26 = [(NSString *)self->_contextUniversalLink copyWithZone:a3];
  v27 = (void *)v5[9];
  v5[9] = v26;

  id v28 = [(NSString *)self->_contextIdentifierPath copyWithZone:a3];
  long long v29 = (void *)v5[3];
  v5[3] = v28;

  id v30 = [(NSString *)self->_contextStableObjectIdPath copyWithZone:a3];
  long long v31 = (void *)v5[5];
  v5[5] = v30;

  id v32 = [(NSString *)self->_handoutAuthorizedObjectId copyWithZone:a3];
  v33 = (void *)v5[10];
  v5[10] = v32;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_attachmentType;
    *((unsigned char *)v5 + 112) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  contextType = self->_contextType;
  if ((unint64_t)contextType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](contextType, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextTopic = self->_contextTopic;
  if ((unint64_t)contextTopic | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](contextTopic, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextTitle = self->_contextTitle;
  if ((unint64_t)contextTitle | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](contextTitle, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextObjectIdPath = self->_contextObjectIdPath;
  if ((unint64_t)contextObjectIdPath | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](contextObjectIdPath, "isEqual:")) {
      goto LABEL_30;
    }
  }
  time = self->_time;
  if ((unint64_t)time | *((void *)v4 + 13))
  {
    if (!-[PDDPAggregatedValue isEqual:](time, "isEqual:")) {
      goto LABEL_30;
    }
  }
  progress = self->_progress;
  if ((unint64_t)progress | *((void *)v4 + 12))
  {
    if (!-[PDDPAggregatedValue isEqual:](progress, "isEqual:")) {
      goto LABEL_30;
    }
  }
  primaryItem = self->_primaryItem;
  if ((unint64_t)primaryItem | *((void *)v4 + 11))
  {
    if (!-[PDDPActivityReportItem isEqual:](primaryItem, "isEqual:")) {
      goto LABEL_30;
    }
  }
  additionalItems = self->_additionalItems;
  if ((unint64_t)additionalItems | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](additionalItems, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextUniversalLink = self->_contextUniversalLink;
  if ((unint64_t)contextUniversalLink | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](contextUniversalLink, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextIdentifierPath = self->_contextIdentifierPath;
  if ((unint64_t)contextIdentifierPath | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contextIdentifierPath, "isEqual:")) {
      goto LABEL_30;
    }
  }
  contextStableObjectIdPath = self->_contextStableObjectIdPath;
  if ((unint64_t)contextStableObjectIdPath | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](contextStableObjectIdPath, "isEqual:")) {
      goto LABEL_30;
    }
  }
  handoutAuthorizedObjectId = self->_handoutAuthorizedObjectId;
  if ((unint64_t)handoutAuthorizedObjectId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](handoutAuthorizedObjectId, "isEqual:")) {
      goto LABEL_30;
    }
  }
  BOOL v17 = (*((unsigned char *)v4 + 112) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) != 0 && self->_attachmentType == *((_DWORD *)v4 + 4))
    {
      BOOL v17 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v17 = 0;
  }
LABEL_31:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_contextType hash];
  NSUInteger v15 = [(NSString *)self->_contextTopic hash];
  NSUInteger v14 = [(NSString *)self->_contextTitle hash];
  NSUInteger v3 = [(NSString *)self->_contextObjectIdPath hash];
  unint64_t v4 = [(PDDPAggregatedValue *)self->_time hash];
  unint64_t v5 = [(PDDPAggregatedValue *)self->_progress hash];
  unint64_t v6 = [(PDDPActivityReportItem *)self->_primaryItem hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_additionalItems hash];
  NSUInteger v8 = [(NSString *)self->_contextUniversalLink hash];
  NSUInteger v9 = [(NSString *)self->_contextIdentifierPath hash];
  NSUInteger v10 = [(NSString *)self->_contextStableObjectIdPath hash];
  NSUInteger v11 = [(NSString *)self->_handoutAuthorizedObjectId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v12 = 2654435761 * self->_attachmentType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[PDDPActivityReport setContextType:](self, "setContextType:");
  }
  if (*((void *)v4 + 7)) {
    -[PDDPActivityReport setContextTopic:](self, "setContextTopic:");
  }
  if (*((void *)v4 + 6)) {
    -[PDDPActivityReport setContextTitle:](self, "setContextTitle:");
  }
  if (*((void *)v4 + 4)) {
    -[PDDPActivityReport setContextObjectIdPath:](self, "setContextObjectIdPath:");
  }
  time = self->_time;
  uint64_t v6 = *((void *)v4 + 13);
  if (time)
  {
    if (v6) {
      -[PDDPAggregatedValue mergeFrom:](time, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPActivityReport setTime:](self, "setTime:");
  }
  progress = self->_progress;
  uint64_t v8 = *((void *)v4 + 12);
  if (progress)
  {
    if (v8) {
      -[PDDPAggregatedValue mergeFrom:](progress, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPActivityReport setProgress:](self, "setProgress:");
  }
  primaryItem = self->_primaryItem;
  uint64_t v10 = *((void *)v4 + 11);
  if (primaryItem)
  {
    if (v10) {
      -[PDDPActivityReportItem mergeFrom:](primaryItem, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPActivityReport setPrimaryItem:](self, "setPrimaryItem:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 1);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[PDDPActivityReport addAdditionalItems:](self, "addAdditionalItems:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 9)) {
    -[PDDPActivityReport setContextUniversalLink:](self, "setContextUniversalLink:");
  }
  if (*((void *)v4 + 3)) {
    -[PDDPActivityReport setContextIdentifierPath:](self, "setContextIdentifierPath:");
  }
  if (*((void *)v4 + 5)) {
    -[PDDPActivityReport setContextStableObjectIdPath:](self, "setContextStableObjectIdPath:");
  }
  if (*((void *)v4 + 10)) {
    [(PDDPActivityReport *)self setHandoutAuthorizedObjectId:"setHandoutAuthorizedObjectId:"];
  }
  if (*((unsigned char *)v4 + 112))
  {
    self->_uint64_t attachmentType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
}

- (NSString)contextTopic
{
  return self->_contextTopic;
}

- (void)setContextTopic:(id)a3
{
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (void)setContextTitle:(id)a3
{
}

- (NSString)contextIdentifierPath
{
  return self->_contextIdentifierPath;
}

- (void)setContextIdentifierPath:(id)a3
{
}

- (NSString)contextObjectIdPath
{
  return self->_contextObjectIdPath;
}

- (void)setContextObjectIdPath:(id)a3
{
}

- (PDDPAggregatedValue)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (PDDPAggregatedValue)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (PDDPActivityReportItem)primaryItem
{
  return self->_primaryItem;
}

- (void)setPrimaryItem:(id)a3
{
}

- (NSMutableArray)additionalItems
{
  return self->_additionalItems;
}

- (void)setAdditionalItems:(id)a3
{
}

- (NSString)contextUniversalLink
{
  return self->_contextUniversalLink;
}

- (void)setContextUniversalLink:(id)a3
{
}

- (NSString)contextStableObjectIdPath
{
  return self->_contextStableObjectIdPath;
}

- (void)setContextStableObjectIdPath:(id)a3
{
}

- (NSString)handoutAuthorizedObjectId
{
  return self->_handoutAuthorizedObjectId;
}

- (void)setHandoutAuthorizedObjectId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_primaryItem, 0);
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectId, 0);
  objc_storeStrong((id *)&self->_contextUniversalLink, 0);
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_contextTopic, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
  objc_storeStrong((id *)&self->_contextStableObjectIdPath, 0);
  objc_storeStrong((id *)&self->_contextObjectIdPath, 0);
  objc_storeStrong((id *)&self->_contextIdentifierPath, 0);

  objc_storeStrong((id *)&self->_additionalItems, 0);
}

@end