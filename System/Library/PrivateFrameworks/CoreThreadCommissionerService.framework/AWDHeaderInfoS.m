@interface AWDHeaderInfoS
- (BOOL)hasDaemonVersion;
- (BOOL)hasVendorVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)daemonVersion;
- (NSString)vendorVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDaemonVersion:(id)a3;
- (void)setVendorVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDHeaderInfoS

- (BOOL)hasDaemonVersion
{
  return self->_daemonVersion != 0;
}

- (BOOL)hasVendorVersion
{
  return self->_vendorVersion != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDHeaderInfoS;
  v3 = [(AWDHeaderInfoS *)&v7 description];
  v4 = [(AWDHeaderInfoS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  daemonVersion = self->_daemonVersion;
  if (daemonVersion) {
    [v3 setObject:daemonVersion forKey:@"daemon_version"];
  }
  vendorVersion = self->_vendorVersion;
  if (vendorVersion) {
    [v4 setObject:vendorVersion forKey:@"vendor_version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100003200((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_daemonVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_vendorVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_daemonVersion)
  {
    objc_msgSend(v4, "setDaemonVersion:");
    id v4 = v5;
  }
  if (self->_vendorVersion)
  {
    objc_msgSend(v5, "setVendorVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_daemonVersion copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_vendorVersion copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((daemonVersion = self->_daemonVersion, !((unint64_t)daemonVersion | v4[1]))
     || -[NSString isEqual:](daemonVersion, "isEqual:")))
  {
    vendorVersion = self->_vendorVersion;
    if ((unint64_t)vendorVersion | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](vendorVersion, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_daemonVersion hash];
  return [(NSString *)self->_vendorVersion hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[AWDHeaderInfoS setDaemonVersion:](self, "setDaemonVersion:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[AWDHeaderInfoS setVendorVersion:](self, "setVendorVersion:");
    id v4 = v5;
  }
}

- (NSString)daemonVersion
{
  return self->_daemonVersion;
}

- (void)setDaemonVersion:(id)a3
{
}

- (NSString)vendorVersion
{
  return self->_vendorVersion;
}

- (void)setVendorVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorVersion, 0);

  objc_storeStrong((id *)&self->_daemonVersion, 0);
}

@end