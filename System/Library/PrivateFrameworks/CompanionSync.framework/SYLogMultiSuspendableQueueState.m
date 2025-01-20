@interface SYLogMultiSuspendableQueueState
- (BOOL)hasLabel;
- (BOOL)hasResumeCount;
- (BOOL)hasTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (NSString)target;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)resumeCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResumeCount:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setResumeCount:(int)a3;
- (void)setTarget:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogMultiSuspendableQueueState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setTarget:(id)a3
{
}

- (void)setResumeCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_resumeCount = a3;
}

- (void)setLabel:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_target)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)setHasResumeCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResumeCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogMultiSuspendableQueueState;
  id v4 = [(SYLogMultiSuspendableQueueState *)&v8 description];
  id v5 = [(SYLogMultiSuspendableQueueState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_resumeCount];
    [v3 setObject:v4 forKey:@"resumeCount"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  target = self->_target;
  if (target) {
    [v3 setObject:target forKey:@"target"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogMultiSuspendableQueueStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_resumeCount;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v5;
  }
  if (self->_target)
  {
    objc_msgSend(v5, "setTarget:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_resumeCount;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_target copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_resumeCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 1) && !-[NSString isEqual:](label, "isEqual:")) {
    goto LABEL_11;
  }
  target = self->_target;
  if ((unint64_t)target | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](target, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_resumeCount;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_label hash] ^ v3;
  return v4 ^ [(NSString *)self->_target hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[8])
  {
    self->_resumeCount = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SYLogMultiSuspendableQueueState setLabel:](self, "setLabel:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[SYLogMultiSuspendableQueueState setTarget:](self, "setTarget:");
    NSUInteger v4 = v5;
  }
}

- (int)resumeCount
{
  return self->_resumeCount;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)target
{
  return self->_target;
}

@end