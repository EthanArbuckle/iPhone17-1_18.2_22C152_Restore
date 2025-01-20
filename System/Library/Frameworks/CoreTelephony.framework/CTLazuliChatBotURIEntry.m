@interface CTLazuliChatBotURIEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotURIEntry:(id)a3;
- (CTLazuliChatBotURIEntry)initWithCoder:(id)a3;
- (CTLazuliChatBotURIEntry)initWithReflection:(const void *)a3;
- (NSString)addressUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)addressUriType;
- (int64_t)label;
- (void)encodeWithCoder:(id)a3;
- (void)setAddressUri:(id)a3;
- (void)setAddressUriType:(int64_t)a3;
- (void)setLabel:(int64_t)a3;
@end

@implementation CTLazuliChatBotURIEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotURIEntry *)self addressUri];
  [v3 appendFormat:@", addressUri = %@", v4];

  int64_t v5 = [(CTLazuliChatBotURIEntry *)self addressUriType];
  int64_t v8 = [(CTLazuliChatBotURIEntry *)self addressUriType];
  [v3 appendFormat:@", addressUriType = [%ld - %s]", v5, print_CTLazuliChatBotAddressUriType(&v8)];
  int64_t v6 = [(CTLazuliChatBotURIEntry *)self label];
  int64_t v8 = [(CTLazuliChatBotURIEntry *)self label];
  [v3 appendFormat:@", label = [%ld - %s]", v6, print_CTLazuliChatBotAddressLabelType(&v8)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotURIEntry:(id)a3
{
  id v7 = a3;
  int64_t v8 = [(CTLazuliChatBotURIEntry *)self addressUri];
  if (v8 || ([v7 addressUri], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(CTLazuliChatBotURIEntry *)self addressUri];
    int64_t v5 = [v7 addressUri];
    if (![v4 isEqualToString:v5])
    {
      BOOL v10 = 0;
      goto LABEL_11;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  int64_t v11 = [(CTLazuliChatBotURIEntry *)self addressUriType];
  if (v11 != [v7 addressUriType])
  {
    BOOL v10 = 0;
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int64_t v12 = [(CTLazuliChatBotURIEntry *)self label];
  BOOL v10 = v12 == [v7 label];
  if (v9)
  {
LABEL_11:
  }
LABEL_12:
  if (!v8) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotURIEntry *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotURIEntry *)self isEqualToCTLazuliChatBotURIEntry:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotURIEntry allocWithZone:a3];
  [(CTLazuliChatBotURIEntry *)v4 setAddressUri:self->_addressUri];
  [(CTLazuliChatBotURIEntry *)v4 setAddressUriType:self->_addressUriType];
  [(CTLazuliChatBotURIEntry *)v4 setLabel:self->_label];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_addressUri forKey:@"kAddressUriKey"];
  v4 = [NSNumber numberWithLong:self->_addressUriType];
  [v6 encodeObject:v4 forKey:@"kAddressUriTypeKey"];

  int64_t v5 = [NSNumber numberWithLong:self->_label];
  [v6 encodeObject:v5 forKey:@"kLabelKey"];
}

- (CTLazuliChatBotURIEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotURIEntry;
  int64_t v5 = [(CTLazuliChatBotURIEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAddressUriKey"];
    addressUri = v5->_addressUri;
    v5->_addressUri = (NSString *)v6;

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAddressUriTypeKey"];
    v5->_addressUriType = [v8 longValue];

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    v5->_label = [v9 longValue];
  }
  return v5;
}

- (CTLazuliChatBotURIEntry)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotURIEntry;
  id v4 = [(CTLazuliChatBotURIEntry *)&v10 init];
  int64_t v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v6 = a3;
      }
      else {
        uint64_t v6 = *(const void **)a3;
      }
      uint64_t v7 = [NSString stringWithUTF8String:v6];
      addressUri = v5->_addressUri;
      v5->_addressUri = (NSString *)v7;
    }
    else
    {
      addressUri = v4->_addressUri;
      v4->_addressUri = 0;
    }

    v5->_addressUriType = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 8);
    v5->_label = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 9);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)addressUri
{
  return self->_addressUri;
}

- (void)setAddressUri:(id)a3
{
}

- (int64_t)addressUriType
{
  return self->_addressUriType;
}

- (void)setAddressUriType:(int64_t)a3
{
  self->_addressUriType = a3;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (void).cxx_destruct
{
}

@end