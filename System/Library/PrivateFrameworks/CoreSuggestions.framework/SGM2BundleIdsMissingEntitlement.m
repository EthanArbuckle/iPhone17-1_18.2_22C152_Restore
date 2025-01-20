@interface SGM2BundleIdsMissingEntitlement
- (BOOL)hasBundleId;
- (BOOL)hasEntitlement;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)entitlement;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setEntitlement:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2BundleIdsMissingEntitlement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setEntitlement:(id)a3
{
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[3]) {
    -[SGM2BundleIdsMissingEntitlement setKey:](self, "setKey:");
  }
  if (v4[1]) {
    -[SGM2BundleIdsMissingEntitlement setBundleId:](self, "setBundleId:");
  }
  if (v4[2]) {
    -[SGM2BundleIdsMissingEntitlement setEntitlement:](self, "setEntitlement:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_bundleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_entitlement hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[1]))
     || -[NSString isEqual:](bundleId, "isEqual:")))
  {
    entitlement = self->_entitlement;
    if ((unint64_t)entitlement | v4[2]) {
      char v8 = -[NSString isEqual:](entitlement, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_entitlement copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    id v4 = v5;
  }
  if (self->_entitlement)
  {
    objc_msgSend(v5, "setEntitlement:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_entitlement)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2BundleIdsMissingEntitlementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v4 setObject:bundleId forKey:@"bundleId"];
  }
  entitlement = self->_entitlement;
  if (entitlement) {
    [v4 setObject:entitlement forKey:@"entitlement"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2BundleIdsMissingEntitlement;
  id v4 = [(SGM2BundleIdsMissingEntitlement *)&v8 description];
  id v5 = [(SGM2BundleIdsMissingEntitlement *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEntitlement
{
  return self->_entitlement != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"BundleIdsMissingEntitlement";
  }
}

@end