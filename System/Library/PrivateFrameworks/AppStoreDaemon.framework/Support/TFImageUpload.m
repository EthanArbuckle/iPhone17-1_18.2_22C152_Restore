@interface TFImageUpload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TFImageUpload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TFImageUpload

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFImageUpload;
  v3 = [(TFImageUpload *)&v7 description];
  v4 = [(TFImageUpload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uploadUrl = self->_uploadUrl;
  if (uploadUrl) {
    [v3 setObject:uploadUrl forKey:@"uploadUrl"];
  }
  xiCloudVersionIdHeader = self->_xiCloudVersionIdHeader;
  if (xiCloudVersionIdHeader) {
    [v4 setObject:xiCloudVersionIdHeader forKey:@"xiCloudVersionIdHeader"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100209800((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uploadUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_xiCloudVersionIdHeader)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_uploadUrl copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_xiCloudVersionIdHeader copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uploadUrl = self->_uploadUrl, !((unint64_t)uploadUrl | v4[1]))
     || -[NSString isEqual:](uploadUrl, "isEqual:")))
  {
    xiCloudVersionIdHeader = self->_xiCloudVersionIdHeader;
    if ((unint64_t)xiCloudVersionIdHeader | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](xiCloudVersionIdHeader, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uploadUrl hash];
  return [(NSString *)self->_xiCloudVersionIdHeader hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xiCloudVersionIdHeader, 0);
  objc_storeStrong((id *)&self->_uploadUrl, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uploadUrl = self->_uploadUrl;
  id v5 = a3;
  [v5 encodeObject:uploadUrl forKey:@"A"];
  [v5 encodeObject:self->_xiCloudVersionIdHeader forKey:@"B"];
}

- (TFImageUpload)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFImageUpload;
  id v5 = [(TFImageUpload *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    uploadUrl = v5->_uploadUrl;
    v5->_uploadUrl = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    xiCloudVersionIdHeader = v5->_xiCloudVersionIdHeader;
    v5->_xiCloudVersionIdHeader = (NSString *)v8;
  }
  return v5;
}

@end