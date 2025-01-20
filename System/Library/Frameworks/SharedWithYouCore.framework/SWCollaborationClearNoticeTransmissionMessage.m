@interface SWCollaborationClearNoticeTransmissionMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)collaborationId;
- (NSString)guidString;
- (double)dateAsTimeIntervalSince1970;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollaborationId:(id)a3;
- (void)setDateAsTimeIntervalSince1970:(double)a3;
- (void)setGuidString:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SWCollaborationClearNoticeTransmissionMessage

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationClearNoticeTransmissionMessage;
  v4 = [(SWCollaborationClearNoticeTransmissionMessage *)&v8 description];
  v5 = [(SWCollaborationClearNoticeTransmissionMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  guidString = self->_guidString;
  if (guidString) {
    [v3 setObject:guidString forKey:@"guidString"];
  }
  collaborationId = self->_collaborationId;
  if (collaborationId) {
    [v3 setObject:collaborationId forKey:@"collaborationId"];
  }
  v7 = [NSNumber numberWithDouble:self->_dateAsTimeIntervalSince1970];
  [v3 setObject:v7 forKey:@"dateAsTimeIntervalSince1970"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SWCollaborationClearNoticeTransmissionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_guidString) {
    -[SWCollaborationClearNoticeTransmissionMessage writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_collaborationId) {
    -[SWCollaborationClearNoticeTransmissionMessage writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 8) = self->_version;
  guidString = self->_guidString;
  v5 = (double *)a3;
  [v5 setGuidString:guidString];
  [v5 setCollaborationId:self->_collaborationId];
  v5[1] = self->_dateAsTimeIntervalSince1970;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_version;
  uint64_t v6 = [(NSString *)self->_guidString copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_collaborationId copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(double *)(v5 + 8) = self->_dateAsTimeIntervalSince1970;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 8)
    && ((guidString = self->_guidString, !((unint64_t)guidString | *((void *)v4 + 3)))
     || -[NSString isEqual:](guidString, "isEqual:"))
    && ((collaborationId = self->_collaborationId, !((unint64_t)collaborationId | *((void *)v4 + 2)))
     || -[NSString isEqual:](collaborationId, "isEqual:"))
    && self->_dateAsTimeIntervalSince1970 == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v4 = [(NSString *)self->_guidString hash];
  NSUInteger v5 = [(NSString *)self->_collaborationId hash];
  double dateAsTimeIntervalSince1970 = self->_dateAsTimeIntervalSince1970;
  double v7 = -dateAsTimeIntervalSince1970;
  if (dateAsTimeIntervalSince1970 >= 0.0) {
    double v7 = self->_dateAsTimeIntervalSince1970;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0) {
    unint64_t v13 = v12;
  }
  return v4 ^ v5 ^ (2654435761 * version) ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 8);
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SWCollaborationClearNoticeTransmissionMessage setGuidString:](self, "setGuidString:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SWCollaborationClearNoticeTransmissionMessage setCollaborationId:](self, "setCollaborationId:");
    id v4 = v5;
  }
  self->_double dateAsTimeIntervalSince1970 = *((double *)v4 + 1);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void)setGuidString:(id)a3
{
}

- (NSString)collaborationId
{
  return self->_collaborationId;
}

- (void)setCollaborationId:(id)a3
{
}

- (double)dateAsTimeIntervalSince1970
{
  return self->_dateAsTimeIntervalSince1970;
}

- (void)setDateAsTimeIntervalSince1970:(double)a3
{
  self->_double dateAsTimeIntervalSince1970 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidString, 0);

  objc_storeStrong((id *)&self->_collaborationId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SWCollaborationClearNoticeTransmissionMessage writeTo:]", "SWCollaborationClearNoticeTransmissionMessage.m", 101, "nil != self->_guidString");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SWCollaborationClearNoticeTransmissionMessage writeTo:]", "SWCollaborationClearNoticeTransmissionMessage.m", 106, "nil != self->_collaborationId");
}

@end