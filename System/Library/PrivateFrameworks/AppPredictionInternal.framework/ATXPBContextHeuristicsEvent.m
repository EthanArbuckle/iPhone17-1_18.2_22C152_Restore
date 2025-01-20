@interface ATXPBContextHeuristicsEvent
- (BOOL)hasContextName;
- (BOOL)hasContextType;
- (BOOL)hasIsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (NSString)contextName;
- (NSString)contextType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextName:(id)a3;
- (void)setContextType:(id)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBContextHeuristicsEvent

- (BOOL)hasContextName
{
  return self->_contextName != 0;
}

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStart
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContextType
{
  return self->_contextType != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBContextHeuristicsEvent;
  v4 = [(ATXPBContextHeuristicsEvent *)&v8 description];
  v5 = [(ATXPBContextHeuristicsEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  contextName = self->_contextName;
  if (contextName) {
    [v3 setObject:contextName forKey:@"contextName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isStart];
    [v4 setObject:v6 forKey:@"isStart"];
  }
  contextType = self->_contextType;
  if (contextType) {
    [v4 setObject:contextType forKey:@"contextType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContextHeuristicsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contextName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_contextType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contextName)
  {
    objc_msgSend(v4, "setContextName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isStart;
    v4[28] |= 1u;
  }
  if (self->_contextType)
  {
    objc_msgSend(v5, "setContextType:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contextName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isStart;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_contextType copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  contextName = self->_contextName;
  if ((unint64_t)contextName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](contextName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_isStart)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  contextType = self->_contextType;
  if ((unint64_t)contextType | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](contextType, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contextName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isStart;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_contextType hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ATXPBContextHeuristicsEvent setContextName:](self, "setContextName:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_isStart = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXPBContextHeuristicsEvent setContextType:](self, "setContextType:");
    uint64_t v4 = v5;
  }
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setContextName:(id)a3
{
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
}

@end