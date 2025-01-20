@interface CTLazuliFileDispositionInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliFileDispositionInformation:(id)a3;
- (CTLazuliFileDispositionInformation)init;
- (CTLazuliFileDispositionInformation)initWithCoder:(id)a3;
- (CTLazuliFileDispositionInformation)initWithReflection:(const void *)a3;
- (NSNumber)fileSizeInBytes;
- (NSNumber)playingLengthInSeconds;
- (NSString)originalFileName;
- (NSString)untrustedContentType;
- (NSString)validUntil;
- (NSURL)dataUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)disposition;
- (void)encodeWithCoder:(id)a3;
- (void)setDataUrl:(id)a3;
- (void)setDisposition:(int64_t)a3;
- (void)setFileSizeInBytes:(id)a3;
- (void)setOriginalFileName:(id)a3;
- (void)setPlayingLengthInSeconds:(id)a3;
- (void)setUntrustedContentType:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation CTLazuliFileDispositionInformation

- (CTLazuliFileDispositionInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliFileDispositionInformation;
  v2 = [(CTLazuliFileDispositionInformation *)&v6 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CTLazuliFileDispositionInformation *)v2 setFileSizeInBytes:v3];

    [(CTLazuliFileDispositionInformation *)v2 setOriginalFileName:&stru_1ECFD6720];
    [(CTLazuliFileDispositionInformation *)v2 setUntrustedContentType:&stru_1ECFD6720];
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1ECFD6720];
    [(CTLazuliFileDispositionInformation *)v2 setDataUrl:v4];

    [(CTLazuliFileDispositionInformation *)v2 setValidUntil:&stru_1ECFD6720];
    [(CTLazuliFileDispositionInformation *)v2 setDisposition:-1];
    [(CTLazuliFileDispositionInformation *)v2 setPlayingLengthInSeconds:0];
  }
  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliFileDispositionInformation *)self fileSizeInBytes];
  [v3 appendFormat:@", fileSizeInBytes = %@", v4];

  v5 = [(CTLazuliFileDispositionInformation *)self originalFileName];
  [v3 appendFormat:@", originalFileName = %@", v5];

  objc_super v6 = [(CTLazuliFileDispositionInformation *)self untrustedContentType];
  [v3 appendFormat:@", untrustedContentType = %@", v6];

  v7 = [(CTLazuliFileDispositionInformation *)self dataUrl];
  [v3 appendFormat:@", dataUrl = %@", v7];

  v8 = [(CTLazuliFileDispositionInformation *)self validUntil];
  [v3 appendFormat:@", validUntil = %@", v8];

  int64_t v9 = [(CTLazuliFileDispositionInformation *)self disposition];
  int64_t v12 = [(CTLazuliFileDispositionInformation *)self disposition];
  [v3 appendFormat:@", disposition = [%ld - %s]", v9, print_CTLazuliFileDispositionType(&v12)];
  v10 = [(CTLazuliFileDispositionInformation *)self playingLengthInSeconds];
  [v3 appendFormat:@", playingLengthInSeconds = %@", v10];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliFileDispositionInformation:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliFileDispositionInformation *)self fileSizeInBytes];
  uint64_t v6 = [v5 longValue];
  v7 = [v4 fileSizeInBytes];
  if (v6 == [v7 longValue])
  {
    v8 = [(CTLazuliFileDispositionInformation *)self originalFileName];
    int64_t v9 = [v4 originalFileName];
    if (![v8 isEqualToString:v9])
    {
      BOOL v16 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v10 = [(CTLazuliFileDispositionInformation *)self untrustedContentType];
    v11 = [v4 untrustedContentType];
    if (![v10 isEqualToString:v11])
    {
      BOOL v16 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v25 = [(CTLazuliFileDispositionInformation *)self dataUrl];
    int64_t v12 = [v4 dataUrl];
    if (![v25 isEqual:v12])
    {
      BOOL v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v24 = [(CTLazuliFileDispositionInformation *)self validUntil];
    v23 = [v4 validUntil];
    if (!objc_msgSend(v24, "isEqualToString:")
      || (int64_t v13 = [(CTLazuliFileDispositionInformation *)self disposition],
          v13 != [v4 disposition]))
    {
      BOOL v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v22 = [(CTLazuliFileDispositionInformation *)self playingLengthInSeconds];
    if (v22 || ([v4 playingLengthInSeconds], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v21 = [(CTLazuliFileDispositionInformation *)self playingLengthInSeconds];
      uint64_t v14 = [v21 longValue];
      v15 = [v4 playingLengthInSeconds];
      BOOL v16 = v14 == [v15 longValue];

      v17 = (void *)v22;
      if (v22)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v20 = 0;
      BOOL v16 = 1;
    }
    v17 = v20;
    goto LABEL_18;
  }
  BOOL v16 = 0;
LABEL_23:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliFileDispositionInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliFileDispositionInformation *)self isEqualToCTLazuliFileDispositionInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliFileDispositionInformation allocWithZone:a3];
  [(CTLazuliFileDispositionInformation *)v4 setFileSizeInBytes:self->_fileSizeInBytes];
  [(CTLazuliFileDispositionInformation *)v4 setOriginalFileName:self->_originalFileName];
  [(CTLazuliFileDispositionInformation *)v4 setUntrustedContentType:self->_untrustedContentType];
  [(CTLazuliFileDispositionInformation *)v4 setDataUrl:self->_dataUrl];
  [(CTLazuliFileDispositionInformation *)v4 setValidUntil:self->_validUntil];
  [(CTLazuliFileDispositionInformation *)v4 setDisposition:self->_disposition];
  [(CTLazuliFileDispositionInformation *)v4 setPlayingLengthInSeconds:self->_playingLengthInSeconds];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_fileSizeInBytes forKey:@"kFileSizeInBytesKey"];
  [v5 encodeObject:self->_originalFileName forKey:@"kOriginalFileNameKey"];
  [v5 encodeObject:self->_untrustedContentType forKey:@"kUntrustedContentTypeKey"];
  [v5 encodeObject:self->_dataUrl forKey:@"kDataUrlKey"];
  [v5 encodeObject:self->_validUntil forKey:@"kValidUntilKey"];
  id v4 = [NSNumber numberWithLong:self->_disposition];
  [v5 encodeObject:v4 forKey:@"kDispositionKey"];

  [v5 encodeObject:self->_playingLengthInSeconds forKey:@"kPlayingLengthInSecondsKey"];
}

- (CTLazuliFileDispositionInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTLazuliFileDispositionInformation;
  id v5 = [(CTLazuliFileDispositionInformation *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileSizeInBytesKey"];
    fileSizeInBytes = v5->_fileSizeInBytes;
    v5->_fileSizeInBytes = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOriginalFileNameKey"];
    originalFileName = v5->_originalFileName;
    v5->_originalFileName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUntrustedContentTypeKey"];
    untrustedContentType = v5->_untrustedContentType;
    v5->_untrustedContentType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDataUrlKey"];
    dataUrl = v5->_dataUrl;
    v5->_dataUrl = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kValidUntilKey"];
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSString *)v14;

    BOOL v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDispositionKey"];
    v5->_disposition = [v16 longValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPlayingLengthInSecondsKey"];
    playingLengthInSeconds = v5->_playingLengthInSeconds;
    v5->_playingLengthInSeconds = (NSNumber *)v17;
  }
  return v5;
}

- (CTLazuliFileDispositionInformation)initWithReflection:(const void *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CTLazuliFileDispositionInformation;
  id v4 = [(CTLazuliFileDispositionInformation *)&v28 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLong:*(void *)a3];
    fileSizeInBytes = v4->_fileSizeInBytes;
    v4->_fileSizeInBytes = (NSNumber *)v5;

    if (*((char *)a3 + 31) >= 0) {
      v7 = (char *)a3 + 8;
    }
    else {
      v7 = (char *)*((void *)a3 + 1);
    }
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    originalFileName = v4->_originalFileName;
    v4->_originalFileName = (NSString *)v8;

    if (*((char *)a3 + 55) >= 0) {
      uint64_t v10 = (char *)a3 + 32;
    }
    else {
      uint64_t v10 = (char *)*((void *)a3 + 4);
    }
    uint64_t v11 = [NSString stringWithUTF8String:v10];
    untrustedContentType = v4->_untrustedContentType;
    v4->_untrustedContentType = (NSString *)v11;

    int64_t v13 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v14 = NSString;
    v15 = (char *)*((void *)a3 + 7);
    int v16 = *((char *)a3 + 79);
    uint64_t v17 = [NSString defaultCStringEncoding];
    if (v16 >= 0) {
      v18 = (char *)a3 + 56;
    }
    else {
      v18 = v15;
    }
    uint64_t v19 = [v14 stringWithCString:v18 encoding:v17];
    uint64_t v20 = [v13 URLWithString:v19];
    dataUrl = v4->_dataUrl;
    v4->_dataUrl = (NSURL *)v20;

    if (*((char *)a3 + 103) >= 0) {
      uint64_t v22 = (char *)a3 + 80;
    }
    else {
      uint64_t v22 = (char *)*((void *)a3 + 10);
    }
    uint64_t v23 = [NSString stringWithUTF8String:v22];
    validUntil = v4->_validUntil;
    v4->_validUntil = (NSString *)v23;

    v4->_disposition = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 26);
    if (*((unsigned char *)a3 + 120))
    {
      uint64_t v25 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 14)];
      playingLengthInSeconds = v4->_playingLengthInSeconds;
      v4->_playingLengthInSeconds = (NSNumber *)v25;
    }
    else
    {
      playingLengthInSeconds = v4->_playingLengthInSeconds;
      v4->_playingLengthInSeconds = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (void)setFileSizeInBytes:(id)a3
{
}

- (NSString)originalFileName
{
  return self->_originalFileName;
}

- (void)setOriginalFileName:(id)a3
{
}

- (NSString)untrustedContentType
{
  return self->_untrustedContentType;
}

- (void)setUntrustedContentType:(id)a3
{
}

- (NSURL)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
}

- (NSString)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
}

- (int64_t)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(int64_t)a3
{
  self->_disposition = a3;
}

- (NSNumber)playingLengthInSeconds
{
  return self->_playingLengthInSeconds;
}

- (void)setPlayingLengthInSeconds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingLengthInSeconds, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
  objc_storeStrong((id *)&self->_untrustedContentType, 0);
  objc_storeStrong((id *)&self->_originalFileName, 0);

  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);
}

@end