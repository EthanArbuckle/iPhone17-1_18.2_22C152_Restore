@interface CTLazuliMessageRevokeResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageRevokeResult:(id)a3;
- (CTLazuliMessageID)messageID;
- (CTLazuliMessageRevokeResult)initWithCoder:(id)a3;
- (CTLazuliMessageRevokeResult)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CTLazuliMessageRevokeResult

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageRevokeResult *)self messageID];
  [v3 appendFormat:@", messageID = %@", v4];

  int64_t v5 = [(CTLazuliMessageRevokeResult *)self status];
  int64_t v7 = [(CTLazuliMessageRevokeResult *)self status];
  [v3 appendFormat:@", status = [%ld - %s]", v5, print_CTLazuliMessageRevokationStatusType(&v7)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageRevokeResult:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliMessageRevokeResult *)self messageID];
  v6 = [v4 messageID];
  if ([v5 isEqualToCTLazuliMessageID:v6])
  {
    int64_t v7 = [(CTLazuliMessageRevokeResult *)self status];
    BOOL v8 = v7 == [v4 status];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageRevokeResult *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageRevokeResult *)self isEqualToCTLazuliMessageRevokeResult:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageRevokeResult allocWithZone:a3];
  [(CTLazuliMessageRevokeResult *)v4 setMessageID:self->_messageID];
  [(CTLazuliMessageRevokeResult *)v4 setStatus:self->_status];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_messageID forKey:@"kMessageIDKey"];
  id v4 = [NSNumber numberWithLong:self->_status];
  [v5 encodeObject:v4 forKey:@"kStatusKey"];
}

- (CTLazuliMessageRevokeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageRevokeResult;
  id v5 = [(CTLazuliMessageRevokeResult *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDKey"];
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v6;

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStatusKey"];
    v5->_status = [v8 longValue];
  }
  return v5;
}

- (CTLazuliMessageRevokeResult)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageRevokeResult;
  id v4 = [(CTLazuliMessageRevokeResult *)&v8 init];
  if (v4)
  {
    id v5 = [[CTLazuliMessageID alloc] initWithReflection:a3];
    messageID = v4->_messageID;
    v4->_messageID = v5;

    v4->_status = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 6);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end