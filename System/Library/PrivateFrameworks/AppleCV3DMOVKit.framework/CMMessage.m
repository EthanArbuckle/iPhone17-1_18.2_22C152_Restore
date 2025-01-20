@interface CMMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isSent;
- (CMMessage)initWithCoder:(id)a3;
- (CMMessage)initWithMessageType:(unint64_t)a3;
- (NSArray)toPeerDisplays;
- (NSData)cmAdditionalData;
- (NSData)cmData;
- (NSNumber)movLowestTimestamp;
- (NSNumber)sessionID;
- (NSString)fromPeerDisplayName;
- (NSUUID)uuid;
- (double)timestamp;
- (id)description;
- (int64_t)cmDataType;
- (unint64_t)messageType;
- (void)encodeWithCoder:(id)a3;
- (void)setCmAdditionalData:(id)a3;
- (void)setCmData:(id)a3;
- (void)setCmDataType:(int64_t)a3;
- (void)setFromPeerDisplayName:(id)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setMovLowestTimestamp:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setToPeerDisplays:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CMMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMessage)initWithMessageType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMMessage;
  result = [(CMMessage *)&v5 init];
  if (result) {
    result->_messageType = a3;
  }
  return result;
}

- (CMMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CMMessage;
  objc_super v5 = [(CMMessage *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    v5->_messageType = [v4 decodeIntegerForKey:@"cmd"];
    uint64_t v7 = [v4 decodeObjectForKey:@"pd"];
    fromPeerDisplayName = v5->_fromPeerDisplayName;
    v5->_fromPeerDisplayName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"pds"];
    toPeerDisplays = v5->_toPeerDisplays;
    v5->_toPeerDisplays = (NSArray *)v9;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v11;
    v5->_cmDataType = [v4 decodeIntegerForKey:@"cmType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmData"];
    cmData = v5->_cmData;
    v5->_cmData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmAddData"];
    cmAdditionalData = v5->_cmAdditionalData;
    v5->_cmAdditionalData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"sid"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"mlt"];
    movLowestTimestamp = v5->_movLowestTimestamp;
    v5->_movLowestTimestamp = (NSNumber *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeInteger:self->_messageType forKey:@"cmd"];
  [v5 encodeObject:self->_fromPeerDisplayName forKey:@"pd"];
  [v5 encodeObject:self->_toPeerDisplays forKey:@"pds"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInteger:self->_cmDataType forKey:@"cmType"];
  [v5 encodeObject:self->_cmData forKey:@"cmData"];
  [v5 encodeObject:self->_cmAdditionalData forKey:@"cmAddData"];
  [v5 encodeObject:self->_sessionID forKey:@"sid"];
  [v5 encodeObject:self->_movLowestTimestamp forKey:@"mlt"];
}

- (id)description
{
  unint64_t messageType = self->_messageType;
  if (messageType == 1)
  {
    [NSString stringWithFormat:@"SessionID: %@ %@", self->_sessionID, self->_movLowestTimestamp];
    goto LABEL_5;
  }
  if (!messageType)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DataType: %ld", self->_cmDataType, v7);
LABEL_5:
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v4 = &stru_26CB5E6E0;
LABEL_7:
  id v5 = [NSString stringWithFormat:@"CMMessage: %lu %.6lf: %@", self->_messageType, *(void *)&self->_timestamp, v4];

  return v5;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_unint64_t messageType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSString)fromPeerDisplayName
{
  return self->_fromPeerDisplayName;
}

- (void)setFromPeerDisplayName:(id)a3
{
}

- (NSArray)toPeerDisplays
{
  return self->_toPeerDisplays;
}

- (void)setToPeerDisplays:(id)a3
{
}

- (int64_t)cmDataType
{
  return self->_cmDataType;
}

- (void)setCmDataType:(int64_t)a3
{
  self->_cmDataType = a3;
}

- (NSData)cmData
{
  return self->_cmData;
}

- (void)setCmData:(id)a3
{
}

- (NSData)cmAdditionalData
{
  return self->_cmAdditionalData;
}

- (void)setCmAdditionalData:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSNumber)movLowestTimestamp
{
  return self->_movLowestTimestamp;
}

- (void)setMovLowestTimestamp:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_movLowestTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_cmAdditionalData, 0);
  objc_storeStrong((id *)&self->_cmData, 0);
  objc_storeStrong((id *)&self->_toPeerDisplays, 0);
  objc_storeStrong((id *)&self->_fromPeerDisplayName, 0);
}

@end