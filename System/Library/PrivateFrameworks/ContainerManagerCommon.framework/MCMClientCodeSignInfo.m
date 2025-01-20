@interface MCMClientCodeSignInfo
- (BOOL)cached;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientCodeSignInfo:(id)a3;
- (BOOL)isPlatformBinary;
- (BOOL)isSignatureValid;
- (BOOL)isSigned;
- (MCMClientCodeSignInfo)initWithCDHash:(id)a3 entitlements:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 status:(unint64_t)a7;
- (MCMEntitlements)entitlements;
- (NSData)cdhash;
- (NSString)identifier;
- (NSString)teamIdentifier;
- (id)clientCodeSignInfoByChangingCached:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MCMClientCodeSignInfo

- (BOOL)isSigned
{
  return self->_isSigned;
}

- (BOOL)cached
{
  return self->_cached;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (BOOL)isSignatureValid
{
  return self->_isSignatureValid;
}

- (BOOL)isPlatformBinary
{
  return self->_isPlatformBinary;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMEntitlements)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdhash, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_entitlements, 0);
}

- (MCMClientCodeSignInfo)initWithCDHash:(id)a3 entitlements:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 status:(unint64_t)a7
{
  char v7 = a7;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MCMClientCodeSignInfo;
  v17 = [(MCMClientCodeSignInfo *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_isSigned = v7 & 1;
    v17->_isSignatureValid = (v7 & 2) != 0;
    v17->_isPlatformBinary = (v7 & 4) != 0;
    objc_storeStrong((id *)&v17->_cdhash, a3);
    objc_storeStrong((id *)&v18->_entitlements, a4);
    objc_storeStrong((id *)&v18->_identifier, a5);
    objc_storeStrong((id *)&v18->_teamIdentifier, a6);
    v18->_cached = 0;
  }

  return v18;
}

- (id)clientCodeSignInfoByChangingCached:(BOOL)a3
{
  v4 = (unsigned char *)[(MCMClientCodeSignInfo *)self copy];
  v4[8] = a3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_entitlements);
    objc_storeStrong((id *)(v5 + 24), self->_identifier);
    *(unsigned char *)(v5 + 8) = self->_cached;
    *(unsigned char *)(v5 + 9) = self->_isSigned;
    *(unsigned char *)(v5 + 10) = self->_isSignatureValid;
    *(unsigned char *)(v5 + 11) = self->_isPlatformBinary;
    objc_storeStrong((id *)(v5 + 32), self->_teamIdentifier);
  }
  return (id)v5;
}

- (NSData)cdhash
{
  return self->_cdhash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MCMClientCodeSignInfo *)self isEqualToClientCodeSignInfo:v4];

  return v5;
}

- (BOOL)isEqualToClientCodeSignInfo:(id)a3
{
  id v4 = a3;
  if ([(NSData *)self->_cdhash isEqualToData:v4[5]]) {
    BOOL v5 = [(NSString *)self->_identifier isEqualToString:v4[3]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_cdhash hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

@end