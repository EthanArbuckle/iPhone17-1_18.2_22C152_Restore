@interface SWCollaborationNoticeTransmissionMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)highlightChangeEvent;
- (NSString)guidString;
- (double)dateAsTimeIntervalSince1970;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)highlightChangeEventType;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateAsTimeIntervalSince1970:(double)a3;
- (void)setGuidString:(id)a3;
- (void)setHighlightChangeEvent:(id)a3;
- (void)setHighlightChangeEventType:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SWCollaborationNoticeTransmissionMessage

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationNoticeTransmissionMessage;
  v4 = [(SWCollaborationNoticeTransmissionMessage *)&v8 description];
  v5 = [(SWCollaborationNoticeTransmissionMessage *)self dictionaryRepresentation];
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
  highlightChangeEvent = self->_highlightChangeEvent;
  if (highlightChangeEvent) {
    [v3 setObject:highlightChangeEvent forKey:@"highlightChangeEvent"];
  }
  v7 = [NSNumber numberWithLongLong:self->_highlightChangeEventType];
  [v3 setObject:v7 forKey:@"highlightChangeEventType"];

  objc_super v8 = [NSNumber numberWithDouble:self->_dateAsTimeIntervalSince1970];
  [v3 setObject:v8 forKey:@"dateAsTimeIntervalSince1970"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SWCollaborationNoticeTransmissionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_guidString) {
    -[SWCollaborationNoticeTransmissionMessage writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_highlightChangeEvent) {
    -[SWCollaborationNoticeTransmissionMessage writeTo:]();
  }
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 10) = self->_version;
  guidString = self->_guidString;
  id v5 = a3;
  [v5 setGuidString:guidString];
  [v5 setHighlightChangeEvent:self->_highlightChangeEvent];
  *((void *)v5 + 2) = self->_highlightChangeEventType;
  *((void *)v5 + 1) = *(void *)&self->_dateAsTimeIntervalSince1970;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  uint64_t v6 = [(NSString *)self->_guidString copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_highlightChangeEvent copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(void *)(v5 + 16) = self->_highlightChangeEventType;
  *(double *)(v5 + 8) = self->_dateAsTimeIntervalSince1970;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 10)
    && ((guidString = self->_guidString, !((unint64_t)guidString | *((void *)v4 + 3)))
     || -[NSString isEqual:](guidString, "isEqual:"))
    && ((highlightChangeEvent = self->_highlightChangeEvent,
         !((unint64_t)highlightChangeEvent | *((void *)v4 + 4)))
     || -[NSData isEqual:](highlightChangeEvent, "isEqual:"))
    && self->_highlightChangeEventType == *((void *)v4 + 2)
    && self->_dateAsTimeIntervalSince1970 == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v4 = [(NSString *)self->_guidString hash];
  uint64_t v5 = [(NSData *)self->_highlightChangeEvent hash];
  int64_t highlightChangeEventType = self->_highlightChangeEventType;
  double dateAsTimeIntervalSince1970 = self->_dateAsTimeIntervalSince1970;
  double v8 = -dateAsTimeIntervalSince1970;
  if (dateAsTimeIntervalSince1970 >= 0.0) {
    double v8 = self->_dateAsTimeIntervalSince1970;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  double v11 = fmod(v9, 1.84467441e19);
  unint64_t v12 = 2654435761u * (unint64_t)v11;
  unint64_t v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0) {
    unint64_t v13 = 2654435761u * (unint64_t)v11;
  }
  unint64_t v14 = v12 - (unint64_t)fabs(v10);
  if (v10 >= 0.0) {
    unint64_t v14 = v13;
  }
  return v4 ^ v5 ^ (2654435761 * version) ^ (2654435761 * highlightChangeEventType) ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 10);
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SWCollaborationNoticeTransmissionMessage setGuidString:](self, "setGuidString:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[SWCollaborationNoticeTransmissionMessage setHighlightChangeEvent:](self, "setHighlightChangeEvent:");
    id v4 = v5;
  }
  self->_int64_t highlightChangeEventType = *((void *)v4 + 2);
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

- (NSData)highlightChangeEvent
{
  return self->_highlightChangeEvent;
}

- (void)setHighlightChangeEvent:(id)a3
{
}

- (int64_t)highlightChangeEventType
{
  return self->_highlightChangeEventType;
}

- (void)setHighlightChangeEventType:(int64_t)a3
{
  self->_int64_t highlightChangeEventType = a3;
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
  objc_storeStrong((id *)&self->_highlightChangeEvent, 0);

  objc_storeStrong((id *)&self->_guidString, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SWCollaborationNoticeTransmissionMessage writeTo:]", "SWCollaborationNoticeTransmissionMessage.m", 108, "nil != self->_guidString");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SWCollaborationNoticeTransmissionMessage writeTo:]", "SWCollaborationNoticeTransmissionMessage.m", 113, "nil != self->_highlightChangeEvent");
}

@end