@interface MUUserInteractionUserGuide
- (BOOL)hasUserGuideId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)userGuideId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUserGuideId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUUserInteractionUserGuide

- (BOOL)hasUserGuideId
{
  return self->_userGuideId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUUserInteractionUserGuide;
  v4 = [(MUUserInteractionUserGuide *)&v8 description];
  v5 = [(MUUserInteractionUserGuide *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  userGuideId = self->_userGuideId;
  if (userGuideId) {
    [v3 setObject:userGuideId forKey:@"userGuideId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionUserGuideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_userGuideId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  userGuideId = self->_userGuideId;
  if (userGuideId) {
    [a3 setUserGuideId:userGuideId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userGuideId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    userGuideId = self->_userGuideId;
    if ((unint64_t)userGuideId | v4[1]) {
      char v6 = -[NSString isEqual:](userGuideId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_userGuideId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[MUUserInteractionUserGuide setUserGuideId:](self, "setUserGuideId:");
  }
}

- (NSString)userGuideId
{
  return self->_userGuideId;
}

- (void)setUserGuideId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end