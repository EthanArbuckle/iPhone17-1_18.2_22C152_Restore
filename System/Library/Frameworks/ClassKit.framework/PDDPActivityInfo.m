@interface PDDPActivityInfo
- (BOOL)hasActivityId;
- (BOOL)hasPrimaryItemIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityId;
- (NSString)primaryItemIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityId:(id)a3;
- (void)setPrimaryItemIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPActivityInfo

- (BOOL)hasPrimaryItemIdentifier
{
  return self->_primaryItemIdentifier != 0;
}

- (BOOL)hasActivityId
{
  return self->_activityId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPActivityInfo;
  v3 = [(PDDPActivityInfo *)&v7 description];
  v4 = [(PDDPActivityInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  primaryItemIdentifier = self->_primaryItemIdentifier;
  if (primaryItemIdentifier) {
    [v3 setObject:primaryItemIdentifier forKey:@"primary_item_identifier"];
  }
  activityId = self->_activityId;
  if (activityId) {
    [v4 setObject:activityId forKey:@"activity_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A9DCC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_primaryItemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activityId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_primaryItemIdentifier)
  {
    objc_msgSend(v4, "setPrimaryItemIdentifier:");
    id v4 = v5;
  }
  if (self->_activityId)
  {
    objc_msgSend(v5, "setActivityId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_primaryItemIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_activityId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((primaryItemIdentifier = self->_primaryItemIdentifier, !((unint64_t)primaryItemIdentifier | v4[2]))
     || -[NSString isEqual:](primaryItemIdentifier, "isEqual:")))
  {
    activityId = self->_activityId;
    if ((unint64_t)activityId | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](activityId, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_primaryItemIdentifier hash];
  return [(NSString *)self->_activityId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[PDDPActivityInfo setPrimaryItemIdentifier:](self, "setPrimaryItemIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[PDDPActivityInfo setActivityId:](self, "setActivityId:");
    id v4 = v5;
  }
}

- (NSString)primaryItemIdentifier
{
  return self->_primaryItemIdentifier;
}

- (void)setPrimaryItemIdentifier:(id)a3
{
}

- (NSString)activityId
{
  return self->_activityId;
}

- (void)setActivityId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryItemIdentifier, 0);

  objc_storeStrong((id *)&self->_activityId, 0);
}

@end