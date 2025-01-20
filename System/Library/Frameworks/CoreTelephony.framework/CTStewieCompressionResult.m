@interface CTStewieCompressionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredCodec;
- (CTStewieCompressionResult)initWithCoder:(id)a3;
- (NSData)compressedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)codecId;
- (void)encodeWithCoder:(id)a3;
- (void)setCodecId:(int64_t)a3;
- (void)setCompressedData:(id)a3;
- (void)setIsPreferredCodec:(BOOL)a3;
@end

@implementation CTStewieCompressionResult

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieCompressionResult *)self compressedData];

  if (v4)
  {
    v5 = [(CTStewieCompressionResult *)self compressedData];
    [v3 appendFormat:@", compressedData length=%lu", objc_msgSend(v5, "length")];
  }
  else
  {
    [v3 appendFormat:@", compressedData=nil"];
  }
  [v3 appendFormat:@", codecId=%lu", -[CTStewieCompressionResult codecId](self, "codecId")];
  BOOL v6 = [(CTStewieCompressionResult *)self isPreferredCodec];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  [v3 appendFormat:@", isPreferredCodec=%s", v7];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTStewieCompressionResult *)a3;
  if (v7 == self)
  {
    LOBYTE(v11) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v11) = 0;
    goto LABEL_19;
  }
  v8 = v7;
  v9 = [(CTStewieCompressionResult *)self compressedData];
  if (v9
    || ([(CTStewieCompressionResult *)v8 compressedData],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(CTStewieCompressionResult *)self compressedData];
    v5 = [(CTStewieCompressionResult *)v8 compressedData];
    if (![v4 isEqual:v5])
    {
      LOBYTE(v11) = 0;
      goto LABEL_15;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  int64_t v12 = [(CTStewieCompressionResult *)self codecId];
  if (v12 == [(CTStewieCompressionResult *)v8 codecId])
  {
    BOOL v13 = [(CTStewieCompressionResult *)self isPreferredCodec];
    BOOL v11 = v13 ^ [(CTStewieCompressionResult *)v8 isPreferredCodec] ^ 1;
    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
  if (v10)
  {
LABEL_15:
  }
LABEL_16:
  if (!v9) {

  }
LABEL_19:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v6 = [(CTStewieCompressionResult *)self compressedData];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setCompressedData:v7];

  objc_msgSend(v5, "setCodecId:", -[CTStewieCompressionResult codecId](self, "codecId"));
  objc_msgSend(v5, "setIsPreferredCodec:", -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTStewieCompressionResult *)self compressedData];
  [v5 encodeObject:v4 forKey:@"compressedData"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieCompressionResult codecId](self, "codecId"), @"codecId");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec"), @"isPreferredCodec");
}

- (CTStewieCompressionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieCompressionResult;
  id v5 = [(CTStewieCompressionResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compressedData"];
    compressedData = v5->_compressedData;
    v5->_compressedData = (NSData *)v6;

    v5->_codecId = [v4 decodeIntegerForKey:@"codecId"];
    v5->_isPreferredCodec = [v4 decodeBoolForKey:@"isPreferredCodec"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)compressedData
{
  return self->_compressedData;
}

- (void)setCompressedData:(id)a3
{
}

- (int64_t)codecId
{
  return self->_codecId;
}

- (void)setCodecId:(int64_t)a3
{
  self->_codecId = a3;
}

- (BOOL)isPreferredCodec
{
  return self->_isPreferredCodec;
}

- (void)setIsPreferredCodec:(BOOL)a3
{
  self->_isPreferredCodec = a3;
}

- (void).cxx_destruct
{
}

@end