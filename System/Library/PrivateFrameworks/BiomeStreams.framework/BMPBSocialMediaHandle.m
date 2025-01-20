@interface BMPBSocialMediaHandle
- (BOOL)hasBundleId;
- (BOOL)hasHandle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHandle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSocialMediaHandle

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSocialMediaHandle;
  v4 = [(BMPBSocialMediaHandle *)&v8 description];
  v5 = [(BMPBSocialMediaHandle *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  handle = self->_handle;
  if (handle) {
    [v4 setObject:handle forKey:@"handle"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSocialMediaHandleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v5;
  }
  if (self->_handle)
  {
    objc_msgSend(v5, "setHandle:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_handle copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[1]))
     || -[NSString isEqual:](bundleId, "isEqual:")))
  {
    handle = self->_handle;
    if ((unint64_t)handle | v4[2]) {
      char v7 = -[NSString isEqual:](handle, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  return [(NSString *)self->_handle hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[BMPBSocialMediaHandle setBundleId:](self, "setBundleId:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[BMPBSocialMediaHandle setHandle:](self, "setHandle:");
    id v4 = v5;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end