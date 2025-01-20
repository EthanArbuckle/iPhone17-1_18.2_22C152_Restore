@interface OTAuthenticatedCiphertext
+ (id)fromSFAuthenticatedCiphertext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authenticationCode;
- (NSData)ciphertext;
- (NSData)initializationVector;
- (id)asSFAuthenticatedCiphertext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthenticationCode:(id)a3;
- (void)setCiphertext:(id)a3;
- (void)setInitializationVector:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAuthenticatedCiphertext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);

  objc_storeStrong((id *)&self->_authenticationCode, 0);
}

- (void)setInitializationVector:(id)a3
{
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setAuthenticationCode:(id)a3
{
}

- (NSData)authenticationCode
{
  return self->_authenticationCode;
}

- (void)setCiphertext:(id)a3
{
}

- (NSData)ciphertext
{
  return self->_ciphertext;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[OTAuthenticatedCiphertext setCiphertext:](self, "setCiphertext:");
  }
  if (v4[1]) {
    -[OTAuthenticatedCiphertext setAuthenticationCode:](self, "setAuthenticationCode:");
  }
  if (v4[3]) {
    -[OTAuthenticatedCiphertext setInitializationVector:](self, "setInitializationVector:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_ciphertext hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_authenticationCode hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_initializationVector hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ciphertext = self->_ciphertext, !((unint64_t)ciphertext | v4[2]))
     || -[NSData isEqual:](ciphertext, "isEqual:"))
    && ((authenticationCode = self->_authenticationCode, !((unint64_t)authenticationCode | v4[1]))
     || -[NSData isEqual:](authenticationCode, "isEqual:")))
  {
    initializationVector = self->_initializationVector;
    if ((unint64_t)initializationVector | v4[3]) {
      unsigned __int8 v8 = -[NSData isEqual:](initializationVector, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_ciphertext copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_authenticationCode copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSData *)self->_initializationVector copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  ciphertext = self->_ciphertext;
  id v5 = a3;
  [v5 setCiphertext:ciphertext];
  [v5 setAuthenticationCode:self->_authenticationCode];
  [v5 setInitializationVector:self->_initializationVector];
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return sub_100210044((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  unint64_t v4 = v3;
  ciphertext = self->_ciphertext;
  if (ciphertext) {
    [v3 setObject:ciphertext forKey:@"ciphertext"];
  }
  authenticationCode = self->_authenticationCode;
  if (authenticationCode) {
    [v4 setObject:authenticationCode forKey:@"authenticationCode"];
  }
  initializationVector = self->_initializationVector;
  if (initializationVector) {
    [v4 setObject:initializationVector forKey:@"initializationVector"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTAuthenticatedCiphertext;
  id v3 = [(OTAuthenticatedCiphertext *)&v7 description];
  unint64_t v4 = [(OTAuthenticatedCiphertext *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)asSFAuthenticatedCiphertext
{
  id v3 = objc_alloc((Class)_SFAuthenticatedCiphertext);
  unint64_t v4 = [(OTAuthenticatedCiphertext *)self ciphertext];
  id v5 = [(OTAuthenticatedCiphertext *)self authenticationCode];
  id v6 = [(OTAuthenticatedCiphertext *)self initializationVector];
  id v7 = [v3 initWithCiphertext:v4 authenticationCode:v5 initializationVector:v6];

  return v7;
}

+ (id)fromSFAuthenticatedCiphertext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  id v5 = [v3 ciphertext];
  [v4 setCiphertext:v5];

  id v6 = [v3 authenticationCode];
  [v4 setAuthenticationCode:v6];

  id v7 = [v3 initializationVector];

  [v4 setInitializationVector:v7];

  return v4;
}

@end