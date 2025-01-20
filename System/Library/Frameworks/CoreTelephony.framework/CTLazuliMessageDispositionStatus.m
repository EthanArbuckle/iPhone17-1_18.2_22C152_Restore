@interface CTLazuliMessageDispositionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageDispositionStatus:(id)a3;
- (CTLazuliDestination)from;
- (CTLazuliGroupChatUri)forGroupChat;
- (CTLazuliMessageDispositionStatus)initWithCoder:(id)a3;
- (CTLazuliMessageDispositionStatus)initWithReflection:(const void *)a3;
- (CTLazuliMessageID)forMessageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deliveryType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryType:(int64_t)a3;
- (void)setForGroupChat:(id)a3;
- (void)setForMessageID:(id)a3;
- (void)setFrom:(id)a3;
@end

@implementation CTLazuliMessageDispositionStatus

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliMessageDispositionStatus *)self deliveryType];
  int64_t v9 = [(CTLazuliMessageDispositionStatus *)self deliveryType];
  [v3 appendFormat:@", deliveryType = [%ld - %s]", v4, print_CTLazuliMessageDispositionNotificationType(&v9)];
  v5 = [(CTLazuliMessageDispositionStatus *)self forMessageID];
  [v3 appendFormat:@", forMessageID = %@", v5];

  v6 = [(CTLazuliMessageDispositionStatus *)self from];
  [v3 appendFormat:@", from = %@", v6];

  v7 = [(CTLazuliMessageDispositionStatus *)self forGroupChat];
  [v3 appendFormat:@", forGroupChat = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageDispositionStatus:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(CTLazuliMessageDispositionStatus *)self deliveryType];
  if (v6 == [v5 deliveryType])
  {
    v7 = [(CTLazuliMessageDispositionStatus *)self forMessageID];
    v8 = [v5 forMessageID];
    if (![v7 isEqualToCTLazuliMessageID:v8])
    {
      char v14 = 0;
LABEL_15:

      goto LABEL_16;
    }
    int64_t v9 = [(CTLazuliMessageDispositionStatus *)self from];
    v10 = [v5 from];
    if (![v9 isEqualToCTLazuliDestination:v10])
    {
      char v14 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v11 = [(CTLazuliMessageDispositionStatus *)self forGroupChat];
    if (v11 || ([v5 forGroupChat], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(CTLazuliMessageDispositionStatus *)self forGroupChat];
      v13 = [v5 forGroupChat];
      char v14 = [v12 isEqualToCTLazuliGroupChatUri:v13];

      if (v11)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      char v14 = 1;
    }
    v11 = (void *)v3;
    goto LABEL_13;
  }
  char v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTLazuliMessageDispositionStatus *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageDispositionStatus *)self isEqualToCTLazuliMessageDispositionStatus:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CTLazuliMessageDispositionStatus allocWithZone:a3];
  [(CTLazuliMessageDispositionStatus *)v4 setDeliveryType:self->_deliveryType];
  [(CTLazuliMessageDispositionStatus *)v4 setForMessageID:self->_forMessageID];
  [(CTLazuliMessageDispositionStatus *)v4 setFrom:self->_from];
  [(CTLazuliMessageDispositionStatus *)v4 setForGroupChat:self->_forGroupChat];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  int64_t v4 = [NSNumber numberWithLong:self->_deliveryType];
  [v5 encodeObject:v4 forKey:@"kDeliveryTypeKey"];

  [v5 encodeObject:self->_forMessageID forKey:@"kForMessageIDKey"];
  [v5 encodeObject:self->_from forKey:@"kFromKey"];
  [v5 encodeObject:self->_forGroupChat forKey:@"kForGroupChatKey"];
}

- (CTLazuliMessageDispositionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageDispositionStatus;
  id v5 = [(CTLazuliMessageDispositionStatus *)&v14 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDeliveryTypeKey"];
    v5->_deliveryType = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kForMessageIDKey"];
    forMessageID = v5->_forMessageID;
    v5->_forMessageID = (CTLazuliMessageID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFromKey"];
    from = v5->_from;
    v5->_from = (CTLazuliDestination *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kForGroupChatKey"];
    forGroupChat = v5->_forGroupChat;
    v5->_forGroupChat = (CTLazuliGroupChatUri *)v11;
  }
  return v5;
}

- (CTLazuliMessageDispositionStatus)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageDispositionStatus;
  id v4 = [(CTLazuliMessageDispositionStatus *)&v13 init];
  if (!v4) {
    return v4;
  }
  v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3);
  id v5 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 8];
  forMessageID = v4->_forMessageID;
  v4->_forMessageID = v5;

  uint64_t v7 = [[CTLazuliDestination alloc] initWithReflection:(char *)a3 + 32];
  from = v4->_from;
  v4->_from = v7;

  if (!*((unsigned char *)a3 + 216))
  {
    forGroupChat = v4->_forGroupChat;
    v4->_forGroupChat = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [CTLazuliGroupChatUri alloc];
  if (*((unsigned char *)a3 + 216))
  {
    uint64_t v10 = [(CTLazuliGroupChatUri *)v9 initWithReflection:(char *)a3 + 144];
    forGroupChat = v4->_forGroupChat;
    v4->_forGroupChat = (CTLazuliGroupChatUri *)v10;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageDispositionStatus *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)deliveryType
{
  return self->_deliveryType;
}

- (void)setDeliveryType:(int64_t)a3
{
  self->_deliveryType = a3;
}

- (CTLazuliMessageID)forMessageID
{
  return self->_forMessageID;
}

- (void)setForMessageID:(id)a3
{
}

- (CTLazuliDestination)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (CTLazuliGroupChatUri)forGroupChat
{
  return self->_forGroupChat;
}

- (void)setForGroupChat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forGroupChat, 0);
  objc_storeStrong((id *)&self->_from, 0);

  objc_storeStrong((id *)&self->_forMessageID, 0);
}

@end