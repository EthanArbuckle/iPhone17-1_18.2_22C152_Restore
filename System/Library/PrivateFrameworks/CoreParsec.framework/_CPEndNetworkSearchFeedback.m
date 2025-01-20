@interface _CPEndNetworkSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fbq;
- (NSString)parsecStatus;
- (NSString)partialClientIp;
- (NSString)uuid;
- (_CPEndNetworkSearchFeedback)init;
- (_CPEndNetworkSearchFeedback)initWithFacade:(id)a3;
- (_CPEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 parsecStatus:(id)a6 parsecDuration:(double)a7 fbq:(id)a8 partialClientIp:(id)a9 networkTimingData:(id)a10;
- (_CPNetworkTimingData)timingData;
- (double)duration;
- (int)endpointType;
- (int)statusCode;
- (int64_t)responseSize;
- (unint64_t)decompressedResponseSize;
- (unint64_t)hash;
- (unint64_t)rawResponseSize;
- (unint64_t)timestamp;
- (void)setDecompressedResponseSize:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setEndpointType:(int)a3;
- (void)setFbq:(id)a3;
- (void)setParsecStatus:(id)a3;
- (void)setPartialClientIp:(id)a3;
- (void)setRawResponseSize:(unint64_t)a3;
- (void)setResponseSize:(int64_t)a3;
- (void)setStatusCode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTimingData:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPEndNetworkSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_partialClientIp, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_parsecStatus, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setDecompressedResponseSize:(unint64_t)a3
{
  self->_decompressedResponseSize = a3;
}

- (unint64_t)decompressedResponseSize
{
  return self->_decompressedResponseSize;
}

- (void)setRawResponseSize:(unint64_t)a3
{
  self->_rawResponseSize = a3;
}

- (unint64_t)rawResponseSize
{
  return self->_rawResponseSize;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setTimingData:(id)a3
{
}

- (_CPNetworkTimingData)timingData
{
  return self->_timingData;
}

- (void)setPartialClientIp:(id)a3
{
}

- (NSString)partialClientIp
{
  return self->_partialClientIp;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setFbq:(id)a3
{
}

- (NSString)fbq
{
  return self->_fbq;
}

- (void)setParsecStatus:(id)a3
{
}

- (NSString)parsecStatus
{
  return self->_parsecStatus;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setStatusCode:(int)a3
{
  self->_statusCode = a3;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void)setResponseSize:(int64_t)a3
{
  self->_responseSize = a3;
}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = (2654435761 * self->_responseSize) ^ (2654435761u * self->_timestamp);
  uint64_t v4 = 2654435761 * self->_statusCode;
  NSUInteger v5 = v3 ^ v4 ^ [(NSString *)self->_uuid hash];
  NSUInteger v6 = [(NSString *)self->_parsecStatus hash];
  NSUInteger v7 = [(NSString *)self->_fbq hash];
  double duration = self->_duration;
  NSUInteger v9 = v6 ^ v7;
  double v10 = -duration;
  if (duration >= 0.0) {
    double v10 = self->_duration;
  }
  long double v11 = round(v10);
  unint64_t v12 = (unint64_t)(fmod(v11, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v10 - v11, 0x40uLL);
  NSUInteger v13 = [(NSString *)self->_partialClientIp hash];
  return v5 ^ v9 ^ v13 ^ [(_CPNetworkTimingData *)self->_timingData hash] ^ (2654435761 * self->_endpointType) ^ (2654435761u * self->_rawResponseSize) ^ (2654435761u * self->_decompressedResponseSize) ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_31;
  }
  int64_t responseSize = self->_responseSize;
  if (responseSize != [v4 responseSize]) {
    goto LABEL_31;
  }
  int statusCode = self->_statusCode;
  if (statusCode != [v4 statusCode]) {
    goto LABEL_31;
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self uuid];
  NSUInteger v9 = [v4 uuid];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_30;
  }
  uint64_t v10 = [(_CPEndNetworkSearchFeedback *)self uuid];
  if (v10)
  {
    long double v11 = (void *)v10;
    unint64_t v12 = [(_CPEndNetworkSearchFeedback *)self uuid];
    NSUInteger v13 = [v4 uuid];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self parsecStatus];
  NSUInteger v9 = [v4 parsecStatus];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_30;
  }
  uint64_t v15 = [(_CPEndNetworkSearchFeedback *)self parsecStatus];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(_CPEndNetworkSearchFeedback *)self parsecStatus];
    v18 = [v4 parsecStatus];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self fbq];
  NSUInteger v9 = [v4 fbq];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_30;
  }
  uint64_t v20 = [(_CPEndNetworkSearchFeedback *)self fbq];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(_CPEndNetworkSearchFeedback *)self fbq];
    v23 = [v4 fbq];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  double duration = self->_duration;
  [v4 duration];
  if (duration != v26) {
    goto LABEL_31;
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self partialClientIp];
  NSUInteger v9 = [v4 partialClientIp];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_30;
  }
  uint64_t v27 = [(_CPEndNetworkSearchFeedback *)self partialClientIp];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_CPEndNetworkSearchFeedback *)self partialClientIp];
    v30 = [v4 partialClientIp];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self timingData];
  NSUInteger v9 = [v4 timingData];
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v32 = [(_CPEndNetworkSearchFeedback *)self timingData];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_CPEndNetworkSearchFeedback *)self timingData];
    v35 = [v4 timingData];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int endpointType = self->_endpointType;
  if (endpointType == [v4 endpointType])
  {
    unint64_t rawResponseSize = self->_rawResponseSize;
    if (rawResponseSize == [v4 rawResponseSize])
    {
      unint64_t decompressedResponseSize = self->_decompressedResponseSize;
      BOOL v37 = decompressedResponseSize == [v4 decompressedResponseSize];
      goto LABEL_32;
    }
  }
LABEL_31:
  BOOL v37 = 0;
LABEL_32:

  return v37;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPEndNetworkSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPEndNetworkSearchFeedback *)self responseSize]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_CPEndNetworkSearchFeedback *)self statusCode]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPEndNetworkSearchFeedback *)self uuid];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_CPEndNetworkSearchFeedback *)self parsecStatus];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(_CPEndNetworkSearchFeedback *)self fbq];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  [(_CPEndNetworkSearchFeedback *)self duration];
  if (v7 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  v8 = [(_CPEndNetworkSearchFeedback *)self partialClientIp];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v9 = [(_CPEndNetworkSearchFeedback *)self timingData];

  if (v9)
  {
    uint64_t v10 = [(_CPEndNetworkSearchFeedback *)self timingData];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPEndNetworkSearchFeedback *)self endpointType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPEndNetworkSearchFeedback *)self rawResponseSize]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPEndNetworkSearchFeedback *)self decompressedResponseSize]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPEndNetworkSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPEndNetworkSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPEndNetworkSearchFeedback;
  v2 = [(_CPEndNetworkSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPEndNetworkSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPEndNetworkSearchFeedback)initWithStartSearch:(id)a3 responseSize:(int64_t)a4 statusCode:(int64_t)a5 parsecStatus:(id)a6 parsecDuration:(double)a7 fbq:(id)a8 partialClientIp:(id)a9 networkTimingData:(id)a10
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v22 = [(_CPEndNetworkSearchFeedback *)self init];
  if (v22)
  {
    v23 = [v17 uuid];

    if (v23)
    {
      int v24 = [v17 uuid];
      [(_CPEndNetworkSearchFeedback *)v22 setUuid:v24];
    }
    if (a4) {
      [(_CPEndNetworkSearchFeedback *)v22 setResponseSize:a4];
    }
    if (a5) {
      [(_CPEndNetworkSearchFeedback *)v22 setStatusCode:a5];
    }
    [(_CPEndNetworkSearchFeedback *)v22 setParsecStatus:v18];
    if (a7 != 0.0) {
      [(_CPEndNetworkSearchFeedback *)v22 setDuration:a7];
    }
    [(_CPEndNetworkSearchFeedback *)v22 setFbq:v19];
    [(_CPEndNetworkSearchFeedback *)v22 setPartialClientIp:v20];
    if ([v21 count])
    {
      v25 = [[_CPNetworkTimingData alloc] initWithTelemetryDictionary:v21];
      [(_CPEndNetworkSearchFeedback *)v22 setTimingData:v25];
    }
    -[_CPEndNetworkSearchFeedback setEndpointType:](v22, "setEndpointType:", [v17 endpointType]);
    double v26 = v22;
  }

  return v22;
}

- (_CPEndNetworkSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_CPEndNetworkSearchFeedback *)self init];
  if (v5)
  {
    -[_CPEndNetworkSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    NSUInteger v6 = [v4 uuid];
    [(_CPEndNetworkSearchFeedback *)v5 setUuid:v6];

    if ([v4 responseSize]) {
      -[_CPEndNetworkSearchFeedback setResponseSize:](v5, "setResponseSize:", [v4 responseSize]);
    }
    if ([v4 statusCode]) {
      -[_CPEndNetworkSearchFeedback setStatusCode:](v5, "setStatusCode:", [v4 statusCode]);
    }
    double v7 = [v4 networkTimingData];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      NSUInteger v9 = [_CPNetworkTimingData alloc];
      uint64_t v10 = [v4 networkTimingData];
      long double v11 = [(_CPNetworkTimingData *)v9 initWithTelemetryDictionary:v10];
      [(_CPEndNetworkSearchFeedback *)v5 setTimingData:v11];
    }
    unint64_t v12 = v5;
  }

  return v5;
}

@end