@interface CTLazuliMessageGroupDispositionNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageGroupDispositionNotification:(id)a3;
- (CTLazuliGroupChatInformation)chatInformation;
- (CTLazuliMessageGroupDispositionNotification)initWithCoder:(id)a3;
- (CTLazuliMessageGroupDispositionNotification)initWithReflection:(const void *)a3;
- (CTLazuliMessageID)messageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deliveryType;
- (void)encodeWithCoder:(id)a3;
- (void)setChatInformation:(id)a3;
- (void)setDeliveryType:(int64_t)a3;
- (void)setMessageID:(id)a3;
@end

@implementation CTLazuliMessageGroupDispositionNotification

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliMessageGroupDispositionNotification *)self chatInformation];
  [v3 appendFormat:@", chatInformation = %@", v4];

  int64_t v5 = [(CTLazuliMessageGroupDispositionNotification *)self deliveryType];
  int64_t v8 = [(CTLazuliMessageGroupDispositionNotification *)self deliveryType];
  [v3 appendFormat:@", deliveryType = [%ld - %s]", v5, print_CTLazuliMessageDispositionNotificationType(&v8)];
  v6 = [(CTLazuliMessageGroupDispositionNotification *)self messageID];
  [v3 appendFormat:@", messageID = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupDispositionNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliMessageGroupDispositionNotification *)self chatInformation];
  v6 = [v4 chatInformation];
  if ([v5 isEqualToCTLazuliGroupChatInformation:v6]
    && (int64_t v7 = [(CTLazuliMessageGroupDispositionNotification *)self deliveryType],
        v7 == [v4 deliveryType]))
  {
    int64_t v8 = [(CTLazuliMessageGroupDispositionNotification *)self messageID];
    v9 = [v4 messageID];
    char v10 = [v8 isEqualToCTLazuliMessageID:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliMessageGroupDispositionNotification *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageGroupDispositionNotification *)self isEqualToCTLazuliMessageGroupDispositionNotification:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliMessageGroupDispositionNotification allocWithZone:a3];
  [(CTLazuliMessageGroupDispositionNotification *)v4 setChatInformation:self->_chatInformation];
  [(CTLazuliMessageGroupDispositionNotification *)v4 setDeliveryType:self->_deliveryType];
  [(CTLazuliMessageGroupDispositionNotification *)v4 setMessageID:self->_messageID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_chatInformation forKey:@"kChatInformationKey"];
  id v4 = [NSNumber numberWithLong:self->_deliveryType];
  [v5 encodeObject:v4 forKey:@"kDeliveryTypeKey"];

  [v5 encodeObject:self->_messageID forKey:@"kMessageIDKey"];
}

- (CTLazuliMessageGroupDispositionNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliMessageGroupDispositionNotification;
  id v5 = [(CTLazuliMessageGroupDispositionNotification *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatInformationKey"];
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDeliveryTypeKey"];
    v5->_deliveryType = [v8 longValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDKey"];
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v9;
  }
  return v5;
}

- (CTLazuliMessageGroupDispositionNotification)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliMessageGroupDispositionNotification;
  id v4 = [(CTLazuliMessageGroupDispositionNotification *)&v10 init];
  if (v4)
  {
    id v5 = [[CTLazuliGroupChatInformation alloc] initWithReflection:a3];
    chatInformation = v4->_chatInformation;
    v4->_chatInformation = v5;

    v4->_deliveryType = encode_CTLazuliMessageDispositionNotificationType((unsigned int *)a3 + 80);
    int64_t v7 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 328];
    messageID = v4->_messageID;
    v4->_messageID = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chatInformation
{
  return self->_chatInformation;
}

- (void)setChatInformation:(id)a3
{
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
  objc_storeStrong((id *)&self->_messageID, 0);

  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end