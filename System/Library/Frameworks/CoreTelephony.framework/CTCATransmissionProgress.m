@interface CTCATransmissionProgress
+ (BOOL)supportsSecureCoding;
- (CTCATransmissionProgress)initWithCoder:(id)a3;
- (NSDate)startedAt;
- (NSNumber)estimatedDurationSeconds;
- (NSNumber)progressPercents;
- (NSString)messageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)payloadType;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedDurationSeconds:(id)a3;
- (void)setMessageId:(id)a3;
- (void)setPayloadType:(int64_t)a3;
- (void)setProgressPercents:(id)a3;
- (void)setStartedAt:(id)a3;
@end

@implementation CTCATransmissionProgress

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCATransmissionProgress *)self messageId];
  [v3 appendFormat:@", messageId=%@", v4];

  v5 = [(CTCATransmissionProgress *)self startedAt];
  [v3 appendFormat:@", startedAt=%@", v5];

  v6 = [(CTCATransmissionProgress *)self estimatedDurationSeconds];
  [v3 appendFormat:@", estimatedDurationSeconds=%@", v6];

  v7 = [(CTCATransmissionProgress *)self progressPercents];
  [v3 appendFormat:@", progressPercents=%@", v7];

  unint64_t v8 = [(CTCATransmissionProgress *)self payloadType];
  if (v8 > 7) {
    v9 = "???";
  }
  else {
    v9 = off_1E5266B28[v8];
  }
  [v3 appendFormat:@", payloadType=%s", v9];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCATransmissionProgress *)self messageId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setMessageId:v7];

  unint64_t v8 = [(CTCATransmissionProgress *)self startedAt];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setStartedAt:v9];

  v10 = [(CTCATransmissionProgress *)self estimatedDurationSeconds];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setEstimatedDurationSeconds:v11];

  v12 = [(CTCATransmissionProgress *)self progressPercents];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setProgressPercents:v13];

  objc_msgSend(v5, "setPayloadType:", -[CTCATransmissionProgress payloadType](self, "payloadType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(CTCATransmissionProgress *)self messageId];
  [v8 encodeObject:v4 forKey:@"messageId"];

  v5 = [(CTCATransmissionProgress *)self startedAt];
  [v8 encodeObject:v5 forKey:@"startedAt"];

  v6 = [(CTCATransmissionProgress *)self estimatedDurationSeconds];
  [v8 encodeObject:v6 forKey:@"estimatedDurationSeconds"];

  v7 = [(CTCATransmissionProgress *)self progressPercents];
  [v8 encodeObject:v7 forKey:@"progressPercents"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTCATransmissionProgress payloadType](self, "payloadType"), @"payloadType");
}

- (CTCATransmissionProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCATransmissionProgress;
  v5 = [(CTCATransmissionProgress *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startedAt"];
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedDurationSeconds"];
    estimatedDurationSeconds = v5->_estimatedDurationSeconds;
    v5->_estimatedDurationSeconds = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progressPercents"];
    progressPercents = v5->_progressPercents;
    v5->_progressPercents = (NSNumber *)v12;

    v5->_payloadType = [v4 decodeIntegerForKey:@"payloadType"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSNumber)estimatedDurationSeconds
{
  return self->_estimatedDurationSeconds;
}

- (void)setEstimatedDurationSeconds:(id)a3
{
}

- (NSNumber)progressPercents
{
  return self->_progressPercents;
}

- (void)setProgressPercents:(id)a3
{
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(int64_t)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressPercents, 0);
  objc_storeStrong((id *)&self->_estimatedDurationSeconds, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);

  objc_storeStrong((id *)&self->_messageId, 0);
}

@end