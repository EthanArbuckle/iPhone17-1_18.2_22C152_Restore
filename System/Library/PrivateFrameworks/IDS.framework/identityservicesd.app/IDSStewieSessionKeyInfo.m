@interface IDSStewieSessionKeyInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)lastResort;
- (IDSStewieSessionKeyInfo)initWithSessionKey:(id)a3 ctIndex:(int)a4 epki:(id)a5 repki:(id)a6 lastResort:(BOOL)a7;
- (NSData)keyEPKI;
- (NSData)retiredEPKI;
- (NSData)serverPublicKey;
- (NSData)sessionKey;
- (id)copyWithServerPublicKey:(id)a3;
- (id)description;
- (int)ctIndex;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setServerPublicKey:(id)a3;
@end

@implementation IDSStewieSessionKeyInfo

- (IDSStewieSessionKeyInfo)initWithSessionKey:(id)a3 ctIndex:(int)a4 epki:(id)a5 repki:(id)a6 lastResort:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSStewieSessionKeyInfo;
  v16 = [(IDSStewieSessionKeyInfo *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sessionKey, a3);
    v17->_ctIndex = a4;
    objc_storeStrong((id *)&v17->_keyEPKI, a5);
    objc_storeStrong((id *)&v17->_retiredEPKI, a6);
    v17->_lastResort = a7;
  }

  return v17;
}

- (id)copyWithServerPublicKey:(id)a3
{
  id v4 = a3;
  v5 = [IDSStewieSessionKeyInfo alloc];
  v6 = [(IDSStewieSessionKeyInfo *)self sessionKey];
  uint64_t v7 = [(IDSStewieSessionKeyInfo *)self ctIndex];
  v8 = [(IDSStewieSessionKeyInfo *)self keyEPKI];
  v9 = [(IDSStewieSessionKeyInfo *)self retiredEPKI];
  v10 = [(IDSStewieSessionKeyInfo *)v5 initWithSessionKey:v6 ctIndex:v7 epki:v8 repki:v9 lastResort:[(IDSStewieSessionKeyInfo *)self lastResort]];

  [(IDSStewieSessionKeyInfo *)v10 setServerPublicKey:v4];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 sessionKey];
    uint64_t v7 = [(IDSStewieSessionKeyInfo *)self sessionKey];
    if ([v6 isEqualToData:v7])
    {
      v8 = [v5 keyEPKI];
      v9 = [(IDSStewieSessionKeyInfo *)self keyEPKI];
      if ([v8 isEqualToData:v9])
      {
        v10 = [v5 retiredEPKI];
        v11 = [(IDSStewieSessionKeyInfo *)self retiredEPKI];
        if ([v10 isEqualToData:v11])
        {
          v17 = v10;
          v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v5 ctIndex]);
          id v13 = +[NSNumber numberWithInteger:[(IDSStewieSessionKeyInfo *)self ctIndex]];
          v18 = v12;
          if ([v12 isEqualToNumber:v13])
          {
            unsigned int v14 = [v5 lastResort];
            unsigned int v15 = v14 ^ [(IDSStewieSessionKeyInfo *)self lastResort] ^ 1;
          }
          else
          {
            LOBYTE(v15) = 0;
          }

          v10 = v17;
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(IDSStewieSessionKeyInfo *)self keyEPKI];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (unint64_t)type
{
  return 2;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSStewieSessionKeyInfo *)self sessionKey];
  uint64_t v5 = [(IDSStewieSessionKeyInfo *)self ctIndex];
  v6 = [(IDSStewieSessionKeyInfo *)self keyEPKI];
  uint64_t v7 = [(IDSStewieSessionKeyInfo *)self retiredEPKI];
  if ([(IDSStewieSessionKeyInfo *)self lastResort]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  v9 = [(IDSStewieSessionKeyInfo *)self serverPublicKey];
  v10 = +[NSString stringWithFormat:@"<%@: %p { sessionKey: %@, ctIndex: %d, keyEPKI: %@, retiredEPKI: %@, lastResort: %@, serverPublicKey: %@ }>", v3, self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (int)ctIndex
{
  return self->_ctIndex;
}

- (NSData)keyEPKI
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)retiredEPKI
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)lastResort
{
  return self->_lastResort;
}

- (NSData)serverPublicKey
{
  return self->_serverPublicKey;
}

- (void)setServerPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverPublicKey, 0);
  objc_storeStrong((id *)&self->_retiredEPKI, 0);
  objc_storeStrong((id *)&self->_keyEPKI, 0);

  objc_storeStrong((id *)&self->_sessionKey, 0);
}

@end