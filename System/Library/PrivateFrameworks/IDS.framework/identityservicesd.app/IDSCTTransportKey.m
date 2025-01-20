@interface IDSCTTransportKey
- (BOOL)lastResort;
- (IDSCTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 repki:(id)a6 lastResort:(BOOL)a7;
- (NSData)key;
- (NSData)keyEPKI;
- (NSData)retiredEPKI;
- (id)description;
- (int)index;
@end

@implementation IDSCTTransportKey

- (IDSCTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 repki:(id)a6 lastResort:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSCTTransportKey;
  v16 = [(IDSCTTransportKey *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_key, a3);
    v17->_index = a5;
    objc_storeStrong((id *)&v17->_keyEPKI, a4);
    objc_storeStrong((id *)&v17->_retiredEPKI, a6);
    v17->_lastResort = a7;
  }

  return v17;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSCTTransportKey *)self key];
  uint64_t v5 = [(IDSCTTransportKey *)self index];
  v6 = [(IDSCTTransportKey *)self keyEPKI];
  v7 = [(IDSCTTransportKey *)self retiredEPKI];
  unsigned int v8 = [(IDSCTTransportKey *)self lastResort];
  CFStringRef v9 = @"NO";
  if (v8) {
    CFStringRef v9 = @"YES";
  }
  v10 = +[NSString stringWithFormat:@"<%@: %p { key: %@, index: %d, keyEPKI: %@ retiredEPKI: %@, lastResort: %@ }>", v3, self, v4, v5, v6, v7, v9];

  return v10;
}

- (int)index
{
  return self->_index;
}

- (NSData)key
{
  return self->_key;
}

- (NSData)keyEPKI
{
  return self->_keyEPKI;
}

- (NSData)retiredEPKI
{
  return self->_retiredEPKI;
}

- (BOOL)lastResort
{
  return self->_lastResort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retiredEPKI, 0);
  objc_storeStrong((id *)&self->_keyEPKI, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end