@interface CTLazuliChatBotCommunicationAddress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCommunicationAddress:(id)a3;
- (CTLazuliChatBotCommunicationAddress)initWithCoder:(id)a3;
- (CTLazuliChatBotCommunicationAddress)initWithReflection:(const void *)a3;
- (CTLazuliChatBotTelephoneInformation)telInformation;
- (CTLazuliChatBotURIEntryList)uriList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTelInformation:(id)a3;
- (void)setUriList:(id)a3;
@end

@implementation CTLazuliChatBotCommunicationAddress

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCommunicationAddress *)self telInformation];
  [v3 appendFormat:@", telInformation = %@", v4];

  v5 = [(CTLazuliChatBotCommunicationAddress *)self uriList];
  [v3 appendFormat:@", uriList = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCommunicationAddress:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotCommunicationAddress *)self telInformation];
  v6 = [v4 telInformation];
  if ([v5 isEqualToCTLazuliChatBotTelephoneInformation:v6])
  {
    v7 = [(CTLazuliChatBotCommunicationAddress *)self uriList];
    v8 = [v4 uriList];
    char v9 = [v7 isEqualToCTLazuliChatBotURIEntryList:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotCommunicationAddress *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCommunicationAddress *)self isEqualToCTLazuliChatBotCommunicationAddress:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotCommunicationAddress allocWithZone:a3];
  [(CTLazuliChatBotCommunicationAddress *)v4 setTelInformation:self->_telInformation];
  [(CTLazuliChatBotCommunicationAddress *)v4 setUriList:self->_uriList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_telInformation forKey:@"kTelInformationKey"];
  [v4 encodeObject:self->_uriList forKey:@"kUriListKey"];
}

- (CTLazuliChatBotCommunicationAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotCommunicationAddress;
  v5 = [(CTLazuliChatBotCommunicationAddress *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTelInformationKey"];
    telInformation = v5->_telInformation;
    v5->_telInformation = (CTLazuliChatBotTelephoneInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUriListKey"];
    uriList = v5->_uriList;
    v5->_uriList = (CTLazuliChatBotURIEntryList *)v8;
  }
  return v5;
}

- (CTLazuliChatBotCommunicationAddress)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotCommunicationAddress;
  id v4 = [(CTLazuliChatBotCommunicationAddress *)&v10 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotTelephoneInformation alloc] initWithReflection:a3];
    telInformation = v4->_telInformation;
    v4->_telInformation = v5;

    v7 = [[CTLazuliChatBotURIEntryList alloc] initWithReflection:(char *)a3 + 72];
    uriList = v4->_uriList;
    v4->_uriList = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotTelephoneInformation)telInformation
{
  return self->_telInformation;
}

- (void)setTelInformation:(id)a3
{
}

- (CTLazuliChatBotURIEntryList)uriList
{
  return self->_uriList;
}

- (void)setUriList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uriList, 0);

  objc_storeStrong((id *)&self->_telInformation, 0);
}

@end