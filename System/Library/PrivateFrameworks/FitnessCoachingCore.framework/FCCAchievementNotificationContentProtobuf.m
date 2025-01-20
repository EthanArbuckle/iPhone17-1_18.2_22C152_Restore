@interface FCCAchievementNotificationContentProtobuf
- (BOOL)hasAchievementData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)achievementData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievementData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCAchievementNotificationContentProtobuf

- (BOOL)hasAchievementData
{
  return self->_achievementData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCAchievementNotificationContentProtobuf;
  v4 = [(FCCAchievementNotificationContentProtobuf *)&v8 description];
  v5 = [(FCCAchievementNotificationContentProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  achievementData = self->_achievementData;
  if (achievementData) {
    [v3 setObject:achievementData forKey:@"achievementData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCAchievementNotificationContentProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_achievementData) {
    MEMORY[0x1F41471B0](a3);
  }
}

- (void)copyTo:(id)a3
{
  achievementData = self->_achievementData;
  if (achievementData) {
    [a3 setAchievementData:achievementData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_achievementData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    achievementData = self->_achievementData;
    if ((unint64_t)achievementData | v4[1]) {
      char v6 = -[NSData isEqual:](achievementData, "isEqual:");
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
  return [(NSData *)self->_achievementData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[FCCAchievementNotificationContentProtobuf setAchievementData:](self, "setAchievementData:");
  }
}

- (NSData)achievementData
{
  return self->_achievementData;
}

- (void)setAchievementData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end