@interface BMPBMicroLocationTruthTagEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasClientBundleId;
- (BOOL)hasRecordingRequestIdentifier;
- (BOOL)hasTruthTagIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientBundleId;
- (NSString)recordingRequestIdentifier;
- (NSString)truthTagIdentifier;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setClientBundleId:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setRecordingRequestIdentifier:(id)a3;
- (void)setTruthTagIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMicroLocationTruthTagEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTruthTagIdentifier
{
  return self->_truthTagIdentifier != 0;
}

- (BOOL)hasRecordingRequestIdentifier
{
  return self->_recordingRequestIdentifier != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBMicroLocationTruthTagEvent;
  v4 = [(BMPBMicroLocationTruthTagEvent *)&v8 description];
  v5 = [(BMPBMicroLocationTruthTagEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  truthTagIdentifier = self->_truthTagIdentifier;
  if (truthTagIdentifier) {
    [v3 setObject:truthTagIdentifier forKey:@"truthTagIdentifier"];
  }
  recordingRequestIdentifier = self->_recordingRequestIdentifier;
  if (recordingRequestIdentifier) {
    [v3 setObject:recordingRequestIdentifier forKey:@"recordingRequestIdentifier"];
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v3 setObject:clientBundleId forKey:@"clientBundleId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMicroLocationTruthTagEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_truthTagIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recordingRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_truthTagIdentifier)
  {
    objc_msgSend(v4, "setTruthTagIdentifier:");
    id v4 = v5;
  }
  if (self->_recordingRequestIdentifier)
  {
    objc_msgSend(v5, "setRecordingRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_clientBundleId)
  {
    objc_msgSend(v5, "setClientBundleId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_truthTagIdentifier copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  uint64_t v9 = [(NSString *)self->_recordingRequestIdentifier copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_clientBundleId copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  truthTagIdentifier = self->_truthTagIdentifier;
  if ((unint64_t)truthTagIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](truthTagIdentifier, "isEqual:"))
  {
    goto LABEL_13;
  }
  recordingRequestIdentifier = self->_recordingRequestIdentifier;
  if ((unint64_t)recordingRequestIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](recordingRequestIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](clientBundleId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_truthTagIdentifier hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_recordingRequestIdentifier hash];
  return v8 ^ v9 ^ [(NSString *)self->_clientBundleId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[5])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  double v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[BMPBMicroLocationTruthTagEvent setTruthTagIdentifier:](self, "setTruthTagIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBMicroLocationTruthTagEvent setRecordingRequestIdentifier:](self, "setRecordingRequestIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBMicroLocationTruthTagEvent setClientBundleId:](self, "setClientBundleId:");
    id v4 = v5;
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)truthTagIdentifier
{
  return self->_truthTagIdentifier;
}

- (void)setTruthTagIdentifier:(id)a3
{
}

- (NSString)recordingRequestIdentifier
{
  return self->_recordingRequestIdentifier;
}

- (void)setRecordingRequestIdentifier:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truthTagIdentifier, 0);
  objc_storeStrong((id *)&self->_recordingRequestIdentifier, 0);

  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

@end