@interface CTLazuliMessageRevokeData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageRevokeData:(id)a3;
- (CTLazuliDestination)destination;
- (CTLazuliMessageID)messageID;
- (CTLazuliMessageRevokeData)initWithCoder:(id)a3;
- (CTLazuliMessageRevokeData)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setMessageID:(id)a3;
@end

@implementation CTLazuliMessageRevokeData

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageRevokeData *)self destination];
  [v3 appendFormat:@", destination = %@", v4];

  v5 = [(CTLazuliMessageRevokeData *)self messageID];
  [v3 appendFormat:@", messageID = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageRevokeData:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliMessageRevokeData *)self destination];
  v6 = [v4 destination];
  if ([v5 isEqualToCTLazuliDestination:v6])
  {
    v7 = [(CTLazuliMessageRevokeData *)self messageID];
    v8 = [v4 messageID];
    char v9 = [v7 isEqualToCTLazuliMessageID:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageRevokeData *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageRevokeData *)self isEqualToCTLazuliMessageRevokeData:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageRevokeData allocWithZone:a3];
  [(CTLazuliMessageRevokeData *)v4 setDestination:self->_destination];
  [(CTLazuliMessageRevokeData *)v4 setMessageID:self->_messageID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_destination forKey:@"kDestinationKey"];
  [v4 encodeObject:self->_messageID forKey:@"kMessageIDKey"];
}

- (CTLazuliMessageRevokeData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageRevokeData;
  v5 = [(CTLazuliMessageRevokeData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDestinationKey"];
    destination = v5->_destination;
    v5->_destination = (CTLazuliDestination *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDKey"];
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v8;
  }
  return v5;
}

- (CTLazuliMessageRevokeData)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageRevokeData;
  id v4 = [(CTLazuliMessageRevokeData *)&v10 init];
  if (v4)
  {
    v5 = [[CTLazuliDestination alloc] initWithReflection:a3];
    destination = v4->_destination;
    v4->_destination = v5;

    v7 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 112];
    messageID = v4->_messageID;
    v4->_messageID = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end