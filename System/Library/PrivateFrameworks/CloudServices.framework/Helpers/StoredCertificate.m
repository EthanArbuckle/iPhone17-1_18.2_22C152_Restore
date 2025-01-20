@interface StoredCertificate
- (BOOL)hasDsid;
- (BOOL)hasDuplicateEscrowCertificate;
- (BOOL)hasEscrowBaseURL;
- (BOOL)hasEscrowCertificate;
- (BOOL)hasICloudEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)duplicateEscrowCertificate;
- (NSData)escrowCertificate;
- (NSString)dsid;
- (NSString)escrowBaseURL;
- (NSString)iCloudEnvironment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDsid:(id)a3;
- (void)setDuplicateEscrowCertificate:(id)a3;
- (void)setEscrowBaseURL:(id)a3;
- (void)setEscrowCertificate:(id)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation StoredCertificate

- (BOOL)hasICloudEnvironment
{
  return self->_iCloudEnvironment != 0;
}

- (BOOL)hasEscrowBaseURL
{
  return self->_escrowBaseURL != 0;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0;
}

- (BOOL)hasEscrowCertificate
{
  return self->_escrowCertificate != 0;
}

- (BOOL)hasDuplicateEscrowCertificate
{
  return self->_duplicateEscrowCertificate != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)StoredCertificate;
  v3 = [(StoredCertificate *)&v7 description];
  v4 = [(StoredCertificate *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  iCloudEnvironment = self->_iCloudEnvironment;
  if (iCloudEnvironment) {
    [v3 setObject:iCloudEnvironment forKey:@"iCloudEnvironment"];
  }
  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL) {
    [v4 setObject:escrowBaseURL forKey:@"escrowBaseURL"];
  }
  dsid = self->_dsid;
  if (dsid) {
    [v4 setObject:dsid forKey:@"dsid"];
  }
  escrowCertificate = self->_escrowCertificate;
  if (escrowCertificate) {
    [v4 setObject:escrowCertificate forKey:@"escrowCertificate"];
  }
  duplicateEscrowCertificate = self->_duplicateEscrowCertificate;
  if (duplicateEscrowCertificate) {
    [v4 setObject:duplicateEscrowCertificate forKey:@"duplicateEscrowCertificate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000BA24((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_escrowBaseURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dsid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_escrowCertificate)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_duplicateEscrowCertificate)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    objc_msgSend(v4, "setICloudEnvironment:");
    id v4 = v5;
  }
  if (self->_escrowBaseURL)
  {
    objc_msgSend(v5, "setEscrowBaseURL:");
    id v4 = v5;
  }
  if (self->_dsid)
  {
    objc_msgSend(v5, "setDsid:");
    id v4 = v5;
  }
  if (self->_escrowCertificate)
  {
    objc_msgSend(v5, "setEscrowCertificate:");
    id v4 = v5;
  }
  if (self->_duplicateEscrowCertificate)
  {
    objc_msgSend(v5, "setDuplicateEscrowCertificate:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_iCloudEnvironment copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSString *)self->_escrowBaseURL copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSString *)self->_dsid copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSData *)self->_escrowCertificate copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(NSData *)self->_duplicateEscrowCertificate copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((iCloudEnvironment = self->_iCloudEnvironment, !((unint64_t)iCloudEnvironment | v4[5]))
     || -[NSString isEqual:](iCloudEnvironment, "isEqual:"))
    && ((escrowBaseURL = self->_escrowBaseURL, !((unint64_t)escrowBaseURL | v4[3]))
     || -[NSString isEqual:](escrowBaseURL, "isEqual:"))
    && ((dsid = self->_dsid, !((unint64_t)dsid | v4[1])) || -[NSString isEqual:](dsid, "isEqual:"))
    && ((escrowCertificate = self->_escrowCertificate, !((unint64_t)escrowCertificate | v4[4]))
     || -[NSData isEqual:](escrowCertificate, "isEqual:")))
  {
    duplicateEscrowCertificate = self->_duplicateEscrowCertificate;
    if ((unint64_t)duplicateEscrowCertificate | v4[2]) {
      unsigned __int8 v10 = -[NSData isEqual:](duplicateEscrowCertificate, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_iCloudEnvironment hash];
  unint64_t v4 = [(NSString *)self->_escrowBaseURL hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_dsid hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSData *)self->_escrowCertificate hash];
  return v6 ^ (unint64_t)[(NSData *)self->_duplicateEscrowCertificate hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[5]) {
    -[StoredCertificate setICloudEnvironment:](self, "setICloudEnvironment:");
  }
  if (v4[3]) {
    -[StoredCertificate setEscrowBaseURL:](self, "setEscrowBaseURL:");
  }
  if (v4[1]) {
    -[StoredCertificate setDsid:](self, "setDsid:");
  }
  if (v4[4]) {
    -[StoredCertificate setEscrowCertificate:](self, "setEscrowCertificate:");
  }
  if (v4[2]) {
    -[StoredCertificate setDuplicateEscrowCertificate:](self, "setDuplicateEscrowCertificate:");
  }
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (NSString)escrowBaseURL
{
  return self->_escrowBaseURL;
}

- (void)setEscrowBaseURL:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSData)escrowCertificate
{
  return self->_escrowCertificate;
}

- (void)setEscrowCertificate:(id)a3
{
}

- (NSData)duplicateEscrowCertificate
{
  return self->_duplicateEscrowCertificate;
}

- (void)setDuplicateEscrowCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudEnvironment, 0);
  objc_storeStrong((id *)&self->_escrowCertificate, 0);
  objc_storeStrong((id *)&self->_escrowBaseURL, 0);
  objc_storeStrong((id *)&self->_duplicateEscrowCertificate, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end