@interface OTPrivateKey
+ (__SecKey)createSecKey:(id)a3;
+ (id)fromECKeyPair:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (id)asECKeyPair:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyTypeAsString:(int)a3;
- (int)StringAsKeyType:(id)a3;
- (int)keyType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTPrivateKey

- (id)asECKeyPair:(id *)a3
{
  if ([(OTPrivateKey *)self keyType] == 1)
  {
    v5 = [(OTPrivateKey *)self keyData];
    v6 = +[OTPrivateKey createSecKey:v5];

    id v7 = [objc_alloc((Class)_SFECKeyPair) initWithSecKey:v6];
    if (v6) {
      CFRelease(v6);
    }
  }
  else if (a3)
  {
    +[NSError errorWithDomain:OctagonErrorDomain code:29 userInfo:0];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (__SecKey)createSecKey:(id)a3
{
  v7[0] = kSecAttrKeyClass;
  v7[1] = kSecAttrKeyType;
  v8[0] = kSecAttrKeyClassPrivate;
  v8[1] = kSecAttrKeyTypeEC;
  CFDataRef v3 = (const __CFData *)a3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v5 = SecKeyCreateWithData(v3, v4, 0);

  return v5;
}

+ (id)fromECKeyPair:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = objc_opt_new();
  [v4 setKeyType:1];
  v5 = [v3 keyData];

  [v4 setKeyData:v5];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setKeyData:(id)a3
{
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyType:(int)a3
{
  self->_keyType = a3;
}

- (int)keyType
{
  return self->_keyType;
}

- (void)mergeFrom:(id)a3
{
  self->_keyType = *((_DWORD *)a3 + 4);
  if (*((void *)a3 + 1)) {
    -[OTPrivateKey setKeyData:](self, "setKeyData:");
  }
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_keyType;
  return (unint64_t)[(NSData *)self->_keyData hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  CFDictionaryRef v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_keyType == *((_DWORD *)v4 + 4))
  {
    keyData = self->_keyData;
    if ((unint64_t)keyData | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](keyData, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = self->_keyType;
  id v6 = [(NSData *)self->_keyData copyWithZone:a3];
  id v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_keyType;
  [a3 setKeyData:self->_keyData];
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return sub_100217544((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (self->_keyType == 1)
  {
    CFDictionaryRef v4 = @"EC_NIST_CURVES";
  }
  else
  {
    CFDictionaryRef v4 = +[NSString stringWithFormat:@"(unknown: %i)", self->_keyType];
  }
  [v3 setObject:v4 forKey:@"keyType"];

  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTPrivateKey;
  id v3 = [(OTPrivateKey *)&v7 description];
  CFDictionaryRef v4 = [(OTPrivateKey *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (int)StringAsKeyType:(id)a3
{
  return 1;
}

- (id)keyTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    CFDictionaryRef v4 = @"EC_NIST_CURVES";
  }
  else
  {
    CFDictionaryRef v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

@end