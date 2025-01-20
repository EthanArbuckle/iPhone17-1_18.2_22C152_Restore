@interface CTLazuliChatBotMediaEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMediaEntry:(id)a3;
- (CTLazuliChatBotMedia)media;
- (CTLazuliChatBotMediaEntry)initWithCoder:(id)a3;
- (CTLazuliChatBotMediaEntry)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)content;
- (int64_t)label;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(int64_t)a3;
- (void)setLabel:(int64_t)a3;
- (void)setMedia:(id)a3;
@end

@implementation CTLazuliChatBotMediaEntry

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliChatBotMediaEntry *)self label];
  int64_t v8 = [(CTLazuliChatBotMediaEntry *)self label];
  [v3 appendFormat:@", label = [%ld - %s]", v4, print_CTLazuliChatBotMediaLabelType(&v8)];
  v5 = [(CTLazuliChatBotMediaEntry *)self media];
  [v3 appendFormat:@", media = %@", v5];

  int64_t v6 = [(CTLazuliChatBotMediaEntry *)self content];
  int64_t v8 = [(CTLazuliChatBotMediaEntry *)self content];
  [v3 appendFormat:@", content = [%ld - %s]", v6, print_CTLazuliChatBotMediaContentType(&v8)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaEntry:(id)a3
{
  id v7 = a3;
  int64_t v8 = [(CTLazuliChatBotMediaEntry *)self label];
  if (v8 != [v7 label])
  {
    BOOL v11 = 0;
    goto LABEL_14;
  }
  v9 = [(CTLazuliChatBotMediaEntry *)self media];
  if (v9 || ([v7 media], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v4 = [(CTLazuliChatBotMediaEntry *)self media];
    v5 = [v7 media];
    if (![v4 isEqualToCTLazuliChatBotMedia:v5])
    {
      BOOL v11 = 0;
LABEL_10:

      goto LABEL_11;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  int64_t v12 = [(CTLazuliChatBotMediaEntry *)self content];
  BOOL v11 = v12 == [v7 content];
  if (v10) {
    goto LABEL_10;
  }
LABEL_11:
  if (!v9) {

  }
LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTLazuliChatBotMediaEntry *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMediaEntry *)self isEqualToCTLazuliChatBotMediaEntry:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CTLazuliChatBotMediaEntry allocWithZone:a3];
  [(CTLazuliChatBotMediaEntry *)v4 setLabel:self->_label];
  [(CTLazuliChatBotMediaEntry *)v4 setMedia:self->_media];
  [(CTLazuliChatBotMediaEntry *)v4 setContent:self->_content];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  int64_t v4 = [NSNumber numberWithLong:self->_label];
  [v6 encodeObject:v4 forKey:@"kLabelKey"];

  [v6 encodeObject:self->_media forKey:@"kMediaKey"];
  v5 = [NSNumber numberWithLong:self->_content];
  [v6 encodeObject:v5 forKey:@"kContentKey"];
}

- (CTLazuliChatBotMediaEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMediaEntry;
  v5 = [(CTLazuliChatBotMediaEntry *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    v5->_label = [v6 longValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaKey"];
    media = v5->_media;
    v5->_media = (CTLazuliChatBotMedia *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentKey"];
    v5->_content = [v9 longValue];
  }
  return v5;
}

- (CTLazuliChatBotMediaEntry)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaEntry;
  id v4 = [(CTLazuliChatBotMediaEntry *)&v9 init];
  if (!v4) {
    return v4;
  }
  v4->_label = encode_CTLazuliChatBotMediaLabelType(a3);
  if (!*((unsigned char *)a3 + 64))
  {
    media = v4->_media;
    v4->_media = 0;
    goto LABEL_6;
  }
  v5 = [CTLazuliChatBotMedia alloc];
  if (*((unsigned char *)a3 + 64))
  {
    uint64_t v6 = [(CTLazuliChatBotMedia *)v5 initWithReflection:(char *)a3 + 8];
    media = v4->_media;
    v4->_media = (CTLazuliChatBotMedia *)v6;
LABEL_6:

    v4->_content = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 18);
    return v4;
  }
  result = (CTLazuliChatBotMediaEntry *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (CTLazuliChatBotMedia)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
}

- (int64_t)content
{
  return self->_content;
}

- (void)setContent:(int64_t)a3
{
  self->_content = a3;
}

- (void).cxx_destruct
{
}

@end