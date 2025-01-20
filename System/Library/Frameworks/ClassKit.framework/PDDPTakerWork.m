@interface PDDPTakerWork
+ (Class)infoDictType;
- (BOOL)hasDateCreated;
- (BOOL)hasDateLastModified;
- (BOOL)hasEtag;
- (BOOL)hasGraderMarkupAsset;
- (BOOL)hasGraderScoreAsset;
- (BOOL)hasMakerUserId;
- (BOOL)hasObjectId;
- (BOOL)hasParentObjectId;
- (BOOL)hasSelfIdentifiedName;
- (BOOL)hasTakerMarkupAsset;
- (BOOL)hasTakerUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)infoDicts;
- (NSString)etag;
- (NSString)makerUserId;
- (NSString)objectId;
- (NSString)parentObjectId;
- (NSString)selfIdentifiedName;
- (NSString)takerUserId;
- (PDDPAsset)graderMarkupAsset;
- (PDDPAsset)graderScoreAsset;
- (PDDPAsset)takerMarkupAsset;
- (PDDPDate)dateCreated;
- (PDDPDate)dateLastModified;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)infoDictAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)infoDictsCount;
- (void)addInfoDict:(id)a3;
- (void)clearInfoDicts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateLastModified:(id)a3;
- (void)setEtag:(id)a3;
- (void)setGraderMarkupAsset:(id)a3;
- (void)setGraderScoreAsset:(id)a3;
- (void)setInfoDicts:(id)a3;
- (void)setMakerUserId:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setParentObjectId:(id)a3;
- (void)setSelfIdentifiedName:(id)a3;
- (void)setTakerMarkupAsset:(id)a3;
- (void)setTakerUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPTakerWork

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (BOOL)hasTakerUserId
{
  return self->_takerUserId != 0;
}

- (BOOL)hasMakerUserId
{
  return self->_makerUserId != 0;
}

- (BOOL)hasParentObjectId
{
  return self->_parentObjectId != 0;
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

- (BOOL)hasSelfIdentifiedName
{
  return self->_selfIdentifiedName != 0;
}

- (BOOL)hasTakerMarkupAsset
{
  return self->_takerMarkupAsset != 0;
}

- (BOOL)hasGraderMarkupAsset
{
  return self->_graderMarkupAsset != 0;
}

- (BOOL)hasGraderScoreAsset
{
  return self->_graderScoreAsset != 0;
}

- (void)clearInfoDicts
{
}

- (void)addInfoDict:(id)a3
{
  id v4 = a3;
  infoDicts = self->_infoDicts;
  id v8 = v4;
  if (!infoDicts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_infoDicts;
    self->_infoDicts = v6;

    id v4 = v8;
    infoDicts = self->_infoDicts;
  }
  [(NSMutableArray *)infoDicts addObject:v4];
}

- (unint64_t)infoDictsCount
{
  return (unint64_t)[(NSMutableArray *)self->_infoDicts count];
}

- (id)infoDictAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_infoDicts objectAtIndex:a3];
}

+ (Class)infoDictType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPTakerWork;
  v3 = [(PDDPTakerWork *)&v7 description];
  id v4 = [(PDDPTakerWork *)self dictionaryRepresentation];
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
  takerUserId = self->_takerUserId;
  if (takerUserId) {
    [v4 setObject:takerUserId forKey:@"taker_user_id"];
  }
  makerUserId = self->_makerUserId;
  if (makerUserId) {
    [v4 setObject:makerUserId forKey:@"maker_user_id"];
  }
  parentObjectId = self->_parentObjectId;
  if (parentObjectId) {
    [v4 setObject:parentObjectId forKey:@"parent_object_id"];
  }
  dateCreated = self->_dateCreated;
  if (dateCreated)
  {
    v10 = [(PDDPDate *)dateCreated dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"date_created"];
  }
  dateLastModified = self->_dateLastModified;
  if (dateLastModified)
  {
    v12 = [(PDDPDate *)dateLastModified dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"date_last_modified"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }
  selfIdentifiedName = self->_selfIdentifiedName;
  if (selfIdentifiedName) {
    [v4 setObject:selfIdentifiedName forKey:@"self_identified_name"];
  }
  takerMarkupAsset = self->_takerMarkupAsset;
  if (takerMarkupAsset)
  {
    v16 = [(PDDPAsset *)takerMarkupAsset dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"taker_markup_asset"];
  }
  graderMarkupAsset = self->_graderMarkupAsset;
  if (graderMarkupAsset)
  {
    v18 = [(PDDPAsset *)graderMarkupAsset dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"grader_markup_asset"];
  }
  graderScoreAsset = self->_graderScoreAsset;
  if (graderScoreAsset)
  {
    v20 = [(PDDPAsset *)graderScoreAsset dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"grader_score_asset"];
  }
  if ([(NSMutableArray *)self->_infoDicts count])
  {
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_infoDicts, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v22 = self->_infoDicts;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (void)v29);
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"info_dict"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000534C4((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
  if (self->_takerUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_makerUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentObjectId) {
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
  if (self->_selfIdentifiedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_takerMarkupAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_graderMarkupAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_graderScoreAsset) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_infoDicts;
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
  id v8 = a3;
  if (self->_objectId) {
    objc_msgSend(v8, "setObjectId:");
  }
  if (self->_takerUserId) {
    objc_msgSend(v8, "setTakerUserId:");
  }
  if (self->_makerUserId) {
    objc_msgSend(v8, "setMakerUserId:");
  }
  if (self->_parentObjectId) {
    objc_msgSend(v8, "setParentObjectId:");
  }
  if (self->_dateCreated) {
    objc_msgSend(v8, "setDateCreated:");
  }
  if (self->_dateLastModified) {
    objc_msgSend(v8, "setDateLastModified:");
  }
  if (self->_etag) {
    objc_msgSend(v8, "setEtag:");
  }
  if (self->_selfIdentifiedName) {
    objc_msgSend(v8, "setSelfIdentifiedName:");
  }
  if (self->_takerMarkupAsset) {
    objc_msgSend(v8, "setTakerMarkupAsset:");
  }
  if (self->_graderMarkupAsset) {
    objc_msgSend(v8, "setGraderMarkupAsset:");
  }
  if (self->_graderScoreAsset) {
    objc_msgSend(v8, "setGraderScoreAsset:");
  }
  if ([(PDDPTakerWork *)self infoDictsCount])
  {
    [v8 clearInfoDicts];
    unint64_t v4 = [(PDDPTakerWork *)self infoDictsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(PDDPTakerWork *)self infoDictAtIndex:i];
        [v8 addInfoDict:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_objectId copyWithZone:a3];
  objc_super v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(NSString *)self->_takerUserId copyWithZone:a3];
  v9 = (void *)v5[12];
  v5[12] = v8;

  id v10 = [(NSString *)self->_makerUserId copyWithZone:a3];
  long long v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(NSString *)self->_parentObjectId copyWithZone:a3];
  long long v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(PDDPDate *)self->_dateCreated copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  id v16 = [(PDDPDate *)self->_dateLastModified copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  id v18 = [(NSString *)self->_etag copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(NSString *)self->_selfIdentifiedName copyWithZone:a3];
  id v21 = (void *)v5[10];
  v5[10] = v20;

  id v22 = [(PDDPAsset *)self->_takerMarkupAsset copyWithZone:a3];
  id v23 = (void *)v5[11];
  v5[11] = v22;

  id v24 = [(PDDPAsset *)self->_graderMarkupAsset copyWithZone:a3];
  uint64_t v25 = (void *)v5[4];
  v5[4] = v24;

  id v26 = [(PDDPAsset *)self->_graderScoreAsset copyWithZone:a3];
  v27 = (void *)v5[5];
  v5[5] = v26;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = self->_infoDicts;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      long long v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)v32), "copyWithZone:", a3, (void)v35);
        [v5 addInfoDict:v33];

        long long v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | v4[8])
  {
    if (!-[NSString isEqual:](objectId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  takerUserId = self->_takerUserId;
  if ((unint64_t)takerUserId | v4[12] && !-[NSString isEqual:](takerUserId, "isEqual:")) {
    goto LABEL_26;
  }
  makerUserId = self->_makerUserId;
  if ((unint64_t)makerUserId | v4[7] && !-[NSString isEqual:](makerUserId, "isEqual:")) {
    goto LABEL_26;
  }
  parentObjectId = self->_parentObjectId;
  if ((unint64_t)parentObjectId | v4[9] && !-[NSString isEqual:](parentObjectId, "isEqual:")) {
    goto LABEL_26;
  }
  if (((dateCreated = self->_dateCreated, !((unint64_t)dateCreated | v4[1]))
     || -[PDDPDate isEqual:](dateCreated, "isEqual:"))
    && ((dateLastModified = self->_dateLastModified, !((unint64_t)dateLastModified | v4[2]))
     || -[PDDPDate isEqual:](dateLastModified, "isEqual:"))
    && ((etag = self->_etag, !((unint64_t)etag | v4[3])) || -[NSString isEqual:](etag, "isEqual:"))
    && ((selfIdentifiedName = self->_selfIdentifiedName, !((unint64_t)selfIdentifiedName | v4[10]))
     || -[NSString isEqual:](selfIdentifiedName, "isEqual:"))
    && ((takerMarkupAsset = self->_takerMarkupAsset, !((unint64_t)takerMarkupAsset | v4[11]))
     || -[PDDPAsset isEqual:](takerMarkupAsset, "isEqual:"))
    && ((graderMarkupAsset = self->_graderMarkupAsset, !((unint64_t)graderMarkupAsset | v4[4]))
     || -[PDDPAsset isEqual:](graderMarkupAsset, "isEqual:"))
    && ((graderScoreAsset = self->_graderScoreAsset, !((unint64_t)graderScoreAsset | v4[5]))
     || -[PDDPAsset isEqual:](graderScoreAsset, "isEqual:")))
  {
    infoDicts = self->_infoDicts;
    if ((unint64_t)infoDicts | v4[6]) {
      unsigned __int8 v17 = -[NSMutableArray isEqual:](infoDicts, "isEqual:");
    }
    else {
      unsigned __int8 v17 = 1;
    }
  }
  else
  {
LABEL_26:
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectId hash];
  unint64_t v4 = [(NSString *)self->_takerUserId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_makerUserId hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_parentObjectId hash];
  unint64_t v7 = [(PDDPDate *)self->_dateCreated hash];
  unint64_t v8 = v7 ^ [(PDDPDate *)self->_dateLastModified hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_etag hash];
  NSUInteger v10 = [(NSString *)self->_selfIdentifiedName hash];
  unint64_t v11 = v10 ^ [(PDDPAsset *)self->_takerMarkupAsset hash];
  unint64_t v12 = v11 ^ [(PDDPAsset *)self->_graderMarkupAsset hash];
  unint64_t v13 = v9 ^ v12 ^ [(PDDPAsset *)self->_graderScoreAsset hash];
  return v13 ^ (unint64_t)[(NSMutableArray *)self->_infoDicts hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[PDDPTakerWork setObjectId:](self, "setObjectId:");
  }
  if (*((void *)v4 + 12)) {
    -[PDDPTakerWork setTakerUserId:](self, "setTakerUserId:");
  }
  if (*((void *)v4 + 7)) {
    -[PDDPTakerWork setMakerUserId:](self, "setMakerUserId:");
  }
  if (*((void *)v4 + 9)) {
    -[PDDPTakerWork setParentObjectId:](self, "setParentObjectId:");
  }
  dateCreated = self->_dateCreated;
  uint64_t v6 = *((void *)v4 + 1);
  if (dateCreated)
  {
    if (v6) {
      -[PDDPDate mergeFrom:](dateCreated, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPTakerWork setDateCreated:](self, "setDateCreated:");
  }
  dateLastModified = self->_dateLastModified;
  uint64_t v8 = *((void *)v4 + 2);
  if (dateLastModified)
  {
    if (v8) {
      -[PDDPDate mergeFrom:](dateLastModified, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPTakerWork setDateLastModified:](self, "setDateLastModified:");
  }
  if (*((void *)v4 + 3)) {
    -[PDDPTakerWork setEtag:](self, "setEtag:");
  }
  if (*((void *)v4 + 10)) {
    -[PDDPTakerWork setSelfIdentifiedName:](self, "setSelfIdentifiedName:");
  }
  takerMarkupAsset = self->_takerMarkupAsset;
  uint64_t v10 = *((void *)v4 + 11);
  if (takerMarkupAsset)
  {
    if (v10) {
      -[PDDPAsset mergeFrom:](takerMarkupAsset, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPTakerWork setTakerMarkupAsset:](self, "setTakerMarkupAsset:");
  }
  graderMarkupAsset = self->_graderMarkupAsset;
  uint64_t v12 = *((void *)v4 + 4);
  if (graderMarkupAsset)
  {
    if (v12) {
      -[PDDPAsset mergeFrom:](graderMarkupAsset, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[PDDPTakerWork setGraderMarkupAsset:](self, "setGraderMarkupAsset:");
  }
  graderScoreAsset = self->_graderScoreAsset;
  uint64_t v14 = *((void *)v4 + 5);
  if (graderScoreAsset)
  {
    if (v14) {
      -[PDDPAsset mergeFrom:](graderScoreAsset, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[PDDPTakerWork setGraderScoreAsset:](self, "setGraderScoreAsset:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 6);
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PDDPTakerWork addInfoDict:](self, "addInfoDict:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (NSString)takerUserId
{
  return self->_takerUserId;
}

- (void)setTakerUserId:(id)a3
{
}

- (NSString)makerUserId
{
  return self->_makerUserId;
}

- (void)setMakerUserId:(id)a3
{
}

- (NSString)parentObjectId
{
  return self->_parentObjectId;
}

- (void)setParentObjectId:(id)a3
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

- (NSString)selfIdentifiedName
{
  return self->_selfIdentifiedName;
}

- (void)setSelfIdentifiedName:(id)a3
{
}

- (PDDPAsset)takerMarkupAsset
{
  return self->_takerMarkupAsset;
}

- (void)setTakerMarkupAsset:(id)a3
{
}

- (PDDPAsset)graderMarkupAsset
{
  return self->_graderMarkupAsset;
}

- (void)setGraderMarkupAsset:(id)a3
{
}

- (PDDPAsset)graderScoreAsset
{
  return self->_graderScoreAsset;
}

- (void)setGraderScoreAsset:(id)a3
{
}

- (NSMutableArray)infoDicts
{
  return self->_infoDicts;
}

- (void)setInfoDicts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_takerUserId, 0);
  objc_storeStrong((id *)&self->_takerMarkupAsset, 0);
  objc_storeStrong((id *)&self->_selfIdentifiedName, 0);
  objc_storeStrong((id *)&self->_parentObjectId, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_makerUserId, 0);
  objc_storeStrong((id *)&self->_infoDicts, 0);
  objc_storeStrong((id *)&self->_graderScoreAsset, 0);
  objc_storeStrong((id *)&self->_graderMarkupAsset, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end