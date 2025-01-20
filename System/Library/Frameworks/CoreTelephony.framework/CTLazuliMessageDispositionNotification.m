@interface CTLazuliMessageDispositionNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageDispositionNotification:(id)a3;
- (CTLazuliMessageDispositionNotification)initWithCoder:(id)a3;
- (CTLazuliMessageDispositionNotification)initWithReflection:(const void *)a3;
- (CTLazuliMessageID)messageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deliveryType;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryType:(int64_t)a3;
- (void)setMessageID:(id)a3;
@end

@implementation CTLazuliMessageDispositionNotification

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliMessageDispositionNotification *)self deliveryType];
  int64_t v7 = [(CTLazuliMessageDispositionNotification *)self deliveryType];
  [v3 appendFormat:@", deliveryType = [%ld - %s]", v4, print_CTLazuliMessageDispositionNotificationType(&v7)];
  v5 = [(CTLazuliMessageDispositionNotification *)self messageID];
  [v3 appendFormat:@", messageID = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageDispositionNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliMessageDispositionNotification *)self deliveryType];
  if (v5 == [v4 deliveryType])
  {
    v6 = [(CTLazuliMessageDispositionNotification *)self messageID];
    int64_t v7 = [v4 messageID];
    char v8 = [v6 isEqualToCTLazuliMessageID:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageDispositionNotification *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageDispositionNotification *)self isEqualToCTLazuliMessageDispositionNotification:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageDispositionNotification allocWithZone:a3];
  [(CTLazuliMessageDispositionNotification *)v4 setDeliveryType:self->_deliveryType];
  [(CTLazuliMessageDispositionNotification *)v4 setMessageID:self->_messageID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_deliveryType];
  [v5 encodeObject:v4 forKey:@"kDeliveryTypeKey"];

  [v5 encodeObject:self->_messageID forKey:@"kMessageIDKey"];
}

- (CTLazuliMessageDispositionNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageDispositionNotification;
  id v5 = [(CTLazuliMessageDispositionNotification *)&v10 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDeliveryTypeKey"];
    v5->_deliveryType = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDKey"];
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v7;
  }
  return v5;
}

- (CTLazuliMessageDispositionNotification)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageDispositionNotification;
  id v4 = [(CTLazuliMessageDispositionNotification *)&v8 init];
  if (v4)
  {
    v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3);
    id v5 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 8];
    messageID = v4->_messageID;
    v4->_messageID = v5;
  }
  return v4;
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

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end