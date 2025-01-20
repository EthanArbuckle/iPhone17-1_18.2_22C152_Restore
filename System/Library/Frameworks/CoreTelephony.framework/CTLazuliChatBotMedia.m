@interface CTLazuliChatBotMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotMedia:(id)a3;
- (CTLazuliChatBotMedia)initWithCoder:(id)a3;
- (CTLazuliChatBotMedia)initWithReflection:(const void *)a3;
- (CTLazuliChatBotMediaFingerprint)fingerprint;
- (CTLazuliChatBotMediaUrl)mediaUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFingerprint:(id)a3;
- (void)setMediaUrl:(id)a3;
@end

@implementation CTLazuliChatBotMedia

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotMedia *)self mediaUrl];
  [v3 appendFormat:@", mediaUrl = %@", v4];

  v5 = [(CTLazuliChatBotMedia *)self fingerprint];
  [v3 appendFormat:@", fingerprint = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMedia:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliChatBotMedia *)self mediaUrl];
  v7 = [v5 mediaUrl];
  if ([v6 isEqualToCTLazuliChatBotMediaUrl:v7])
  {
    v8 = [(CTLazuliChatBotMedia *)self fingerprint];
    if (v8 || ([v5 fingerprint], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(CTLazuliChatBotMedia *)self fingerprint];
      v10 = [v5 fingerprint];
      char v11 = [v9 isEqualToCTLazuliChatBotMediaFingerprint:v10];

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotMedia *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotMedia *)self isEqualToCTLazuliChatBotMedia:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotMedia allocWithZone:a3];
  [(CTLazuliChatBotMedia *)v4 setMediaUrl:self->_mediaUrl];
  [(CTLazuliChatBotMedia *)v4 setFingerprint:self->_fingerprint];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_mediaUrl forKey:@"kMediaUrlKey"];
  [v4 encodeObject:self->_fingerprint forKey:@"kFingerprintKey"];
}

- (CTLazuliChatBotMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMedia;
  id v5 = [(CTLazuliChatBotMedia *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaUrlKey"];
    mediaUrl = v5->_mediaUrl;
    v5->_mediaUrl = (CTLazuliChatBotMediaUrl *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFingerprintKey"];
    fingerprint = v5->_fingerprint;
    v5->_fingerprint = (CTLazuliChatBotMediaFingerprint *)v8;
  }
  return v5;
}

- (CTLazuliChatBotMedia)initWithReflection:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMedia;
  id v4 = [(CTLazuliChatBotMedia *)&v11 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliChatBotMediaUrl alloc] initWithReflection:a3];
  mediaUrl = v4->_mediaUrl;
  v4->_mediaUrl = v5;

  if (!*((unsigned char *)a3 + 48))
  {
    fingerprint = v4->_fingerprint;
    v4->_fingerprint = 0;
    goto LABEL_6;
  }
  v7 = [CTLazuliChatBotMediaFingerprint alloc];
  if (*((unsigned char *)a3 + 48))
  {
    uint64_t v8 = [(CTLazuliChatBotMediaFingerprint *)v7 initWithReflection:(char *)a3 + 24];
    fingerprint = v4->_fingerprint;
    v4->_fingerprint = (CTLazuliChatBotMediaFingerprint *)v8;
LABEL_6:

    return v4;
  }
  result = (CTLazuliChatBotMedia *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotMediaUrl)mediaUrl
{
  return self->_mediaUrl;
}

- (void)setMediaUrl:(id)a3
{
}

- (CTLazuliChatBotMediaFingerprint)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);

  objc_storeStrong((id *)&self->_mediaUrl, 0);
}

@end