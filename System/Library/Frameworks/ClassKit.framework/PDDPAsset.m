@interface PDDPAsset
+ (Class)contentMetadataType;
- (BOOL)hasContentDownloadUrl;
- (BOOL)hasContentDownloadUrlExpiration;
- (BOOL)hasContentFileName;
- (BOOL)hasContentSizeInBytes;
- (BOOL)hasContentUtType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEtag;
- (BOOL)hasObjectId;
- (BOOL)hasUploadResponseJson;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentMetadatas;
- (NSString)contentDownloadUrl;
- (NSString)contentFileName;
- (NSString)contentUtType;
- (NSString)etag;
- (NSString)objectId;
- (NSString)uploadResponseJson;
- (PDDPDate)contentDownloadUrlExpiration;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)contentMetadataAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)contentSizeInBytes;
- (unint64_t)contentMetadatasCount;
- (unint64_t)hash;
- (void)addContentMetadata:(id)a3;
- (void)clearContentMetadatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentDownloadUrl:(id)a3;
- (void)setContentDownloadUrlExpiration:(id)a3;
- (void)setContentFileName:(id)a3;
- (void)setContentMetadatas:(id)a3;
- (void)setContentSizeInBytes:(int64_t)a3;
- (void)setContentUtType:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasContentSizeInBytes:(BOOL)a3;
- (void)setObjectId:(id)a3;
- (void)setUploadResponseJson:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAsset

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (BOOL)hasDateLastModified
{
  return self->_dateLastModified != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasUploadResponseJson
{
  return self->_uploadResponseJson != 0;
}

- (BOOL)hasContentFileName
{
  return self->_contentFileName != 0;
}

- (BOOL)hasContentUtType
{
  return self->_contentUtType != 0;
}

- (void)setContentSizeInBytes:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentSizeInBytes = a3;
}

- (void)setHasContentSizeInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentSizeInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContentDownloadUrl
{
  return self->_contentDownloadUrl != 0;
}

- (BOOL)hasContentDownloadUrlExpiration
{
  return self->_contentDownloadUrlExpiration != 0;
}

- (void)clearContentMetadatas
{
}

- (void)addContentMetadata:(id)a3
{
  id v4 = a3;
  contentMetadatas = self->_contentMetadatas;
  id v8 = v4;
  if (!contentMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contentMetadatas;
    self->_contentMetadatas = v6;

    id v4 = v8;
    contentMetadatas = self->_contentMetadatas;
  }
  [(NSMutableArray *)contentMetadatas addObject:v4];
}

- (unint64_t)contentMetadatasCount
{
  return (unint64_t)[(NSMutableArray *)self->_contentMetadatas count];
}

- (id)contentMetadataAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contentMetadatas objectAtIndex:a3];
}

+ (Class)contentMetadataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAsset;
  v3 = [(PDDPAsset *)&v7 description];
  id v4 = [(PDDPAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    objc_super v7 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v9 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"date_last_modified"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }
  uploadResponseJson = self->_uploadResponseJson;
  if (uploadResponseJson) {
    [v4 setObject:uploadResponseJson forKey:@"upload_response_json"];
  }
  contentFileName = self->_contentFileName;
  if (contentFileName) {
    [v4 setObject:contentFileName forKey:@"content_file_name"];
  }
  contentUtType = self->_contentUtType;
  if (contentUtType) {
    [v4 setObject:contentUtType forKey:@"content_ut_type"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = +[NSNumber numberWithLongLong:self->_contentSizeInBytes];
    [v4 setObject:v14 forKey:@"content_size_in_bytes"];
  }
  contentDownloadUrl = self->_contentDownloadUrl;
  if (contentDownloadUrl) {
    [v4 setObject:contentDownloadUrl forKey:@"content_download_url"];
  }
  contentDownloadUrlExpiration = self->_contentDownloadUrlExpiration;
  if (contentDownloadUrlExpiration)
  {
    v17 = [(PDDPDate *)contentDownloadUrlExpiration dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"content_download_url_expiration"];
  }
  if ([(NSMutableArray *)self->_contentMetadatas count])
  {
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_contentMetadatas, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = self->_contentMetadatas;
    id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          [v18 addObject:v24];
        }
        id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v21);
    }

    [v4 setObject:v18 forKey:@"content_metadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013CC9C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateCreated) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dateLastModified) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if (self->_uploadResponseJson) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentFileName) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentUtType) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_contentDownloadUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentDownloadUrlExpiration) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_contentMetadatas;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_objectId)
  {
    objc_msgSend(v4, "setObjectId:");
    id v4 = v9;
  }
  if (self->_dateCreated)
  {
    objc_msgSend(v9, "setDateCreated:");
    id v4 = v9;
  }
  if (self->_dateLastModified)
  {
    objc_msgSend(v9, "setDateLastModified:");
    id v4 = v9;
  }
  if (self->_etag)
  {
    objc_msgSend(v9, "setEtag:");
    id v4 = v9;
  }
  if (self->_uploadResponseJson)
  {
    objc_msgSend(v9, "setUploadResponseJson:");
    id v4 = v9;
  }
  if (self->_contentFileName)
  {
    objc_msgSend(v9, "setContentFileName:");
    id v4 = v9;
  }
  if (self->_contentUtType)
  {
    objc_msgSend(v9, "setContentUtType:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_contentSizeInBytes;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_contentDownloadUrl) {
    objc_msgSend(v9, "setContentDownloadUrl:");
  }
  if (self->_contentDownloadUrlExpiration) {
    objc_msgSend(v9, "setContentDownloadUrlExpiration:");
  }
  if ([(PDDPAsset *)self contentMetadatasCount])
  {
    [v9 clearContentMetadatas];
    unint64_t v5 = [(PDDPAsset *)self contentMetadatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPAsset *)self contentMetadataAtIndex:i];
        [v9 addContentMetadata:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  id v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  long long v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(NSString *)self->_etag copyWithZone:a3];
  long long v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(NSString *)self->_uploadResponseJson copyWithZone:a3];
  v15 = (void *)v5[11];
  v5[11] = v14;

  id v16 = [(NSString *)self->_contentFileName copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  id v18 = [(NSString *)self->_contentUtType copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_contentSizeInBytes;
    *((unsigned char *)v5 + 96) |= 1u;
  }
  id v20 = [(NSString *)self->_contentDownloadUrl copyWithZone:a3];
  id v21 = (void *)v5[2];
  v5[2] = v20;

  id v22 = [(PDDPDate *)self->_contentDownloadUrlExpiration copyWithZone:a3];
  v23 = (void *)v5[3];
  v5[3] = v22;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self->_contentMetadatas;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (void)v31);
        [v5 addContentMetadata:v29];
      }
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v26);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateCreated = self->_dateCreated;
  if ((unint64_t)dateCreated | *((void *)v4 + 7))
  {
    if (!-[PDDPDate isEqual:](dateCreated, "isEqual:")) {
      goto LABEL_27;
    }
  }
  dateLastModified = self->_dateLastModified;
  if ((unint64_t)dateLastModified | *((void *)v4 + 8))
  {
    if (!-[PDDPDate isEqual:](dateLastModified, "isEqual:")) {
      goto LABEL_27;
    }
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_27;
    }
  }
  uploadResponseJson = self->_uploadResponseJson;
  if ((unint64_t)uploadResponseJson | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](uploadResponseJson, "isEqual:")) {
      goto LABEL_27;
    }
  }
  contentFileName = self->_contentFileName;
  if ((unint64_t)contentFileName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](contentFileName, "isEqual:")) {
      goto LABEL_27;
    }
  }
  contentUtType = self->_contentUtType;
  if ((unint64_t)contentUtType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](contentUtType, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_contentSizeInBytes != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
LABEL_27:
    unsigned __int8 v15 = 0;
    goto LABEL_28;
  }
  contentDownloadUrl = self->_contentDownloadUrl;
  if ((unint64_t)contentDownloadUrl | *((void *)v4 + 2)
    && !-[NSString isEqual:](contentDownloadUrl, "isEqual:"))
  {
    goto LABEL_27;
  }
  contentDownloadUrlExpiration = self->_contentDownloadUrlExpiration;
  if ((unint64_t)contentDownloadUrlExpiration | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](contentDownloadUrlExpiration, "isEqual:")) {
      goto LABEL_27;
    }
  }
  contentMetadatas = self->_contentMetadatas;
  if ((unint64_t)contentMetadatas | *((void *)v4 + 5)) {
    unsigned __int8 v15 = -[NSMutableArray isEqual:](contentMetadatas, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v5 = [(PDDPDate *)self->_dateLastModified hash];
  NSUInteger v6 = [(NSString *)self->_etag hash];
  NSUInteger v7 = [(NSString *)self->_uploadResponseJson hash];
  NSUInteger v8 = [(NSString *)self->_contentFileName hash];
  NSUInteger v9 = [(NSString *)self->_contentUtType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_contentSizeInBytes;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v12 = v10 ^ [(NSString *)self->_contentDownloadUrl hash];
  unint64_t v13 = v12 ^ [(PDDPDate *)self->_contentDownloadUrlExpiration hash];
  return v11 ^ v13 ^ (unint64_t)[(NSMutableArray *)self->_contentMetadatas hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[PDDPAsset setObjectId:](self, "setObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 7);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPAsset setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 8);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPAsset setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPAsset setEtag:](self, "setEtag:");
  }
  if (*((void *)v4 + 11)) {
    -[PDDPAsset setUploadResponseJson:](self, "setUploadResponseJson:");
  }
  if (*((void *)v4 + 4)) {
    -[PDDPAsset setContentFileName:](self, "setContentFileName:");
  }
  if (*((void *)v4 + 6)) {
    -[PDDPAsset setContentUtType:](self, "setContentUtType:");
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_contentSizeInBytes = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[PDDPAsset setContentDownloadUrl:](self, "setContentDownloadUrl:");
  }
  contentDownloadUrlExpiration = self->_contentDownloadUrlExpiration;
  uint64_t v10 = *((void *)v4 + 3);
  if (contentDownloadUrlExpiration)
  {
    if (v10) {
      -[PDDPDate mergeFrom:](contentDownloadUrlExpiration, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPAsset setContentDownloadUrlExpiration:](self, "setContentDownloadUrlExpiration:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 5);
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
        -[PDDPAsset addContentMetadata:](self, "addContentMetadata:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (PDDPDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (PDDPDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void)setDateLastModified:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSString)uploadResponseJson
{
  return self->_uploadResponseJson;
}

- (void)setUploadResponseJson:(id)a3
{
}

- (NSString)contentFileName
{
  return self->_contentFileName;
}

- (void)setContentFileName:(id)a3
{
}

- (NSString)contentUtType
{
  return self->_contentUtType;
}

- (void)setContentUtType:(id)a3
{
}

- (int64_t)contentSizeInBytes
{
  return self->_contentSizeInBytes;
}

- (NSString)contentDownloadUrl
{
  return self->_contentDownloadUrl;
}

- (void)setContentDownloadUrl:(id)a3
{
}

- (PDDPDate)contentDownloadUrlExpiration
{
  return self->_contentDownloadUrlExpiration;
}

- (void)setContentDownloadUrlExpiration:(id)a3
{
}

- (NSMutableArray)contentMetadatas
{
  return self->_contentMetadatas;
}

- (void)setContentMetadatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadResponseJson, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_contentUtType, 0);
  objc_storeStrong((id *)&self->_contentMetadatas, 0);
  objc_storeStrong((id *)&self->_contentFileName, 0);
  objc_storeStrong((id *)&self->_contentDownloadUrlExpiration, 0);

  objc_storeStrong((id *)&self->_contentDownloadUrl, 0);
}

@end