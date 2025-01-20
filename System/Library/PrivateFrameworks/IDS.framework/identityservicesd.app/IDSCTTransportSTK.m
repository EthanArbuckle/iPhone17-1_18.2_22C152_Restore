@interface IDSCTTransportSTK
- (IDSCTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4 epki:(id)a5;
- (NSData)keyEPKI;
- (NSData)stk;
- (id)description;
- (int)index;
@end

@implementation IDSCTTransportSTK

- (IDSCTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4 epki:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSCTTransportSTK;
  v11 = [(IDSCTTransportSTK *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stk, a3);
    v12->_index = a4;
    objc_storeStrong((id *)&v12->_keyEPKI, a5);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSCTTransportSTK *)self stk];
  uint64_t v5 = [(IDSCTTransportSTK *)self index];
  v6 = [(IDSCTTransportSTK *)self keyEPKI];
  v7 = +[NSString stringWithFormat:@"<%@: %p { stk: %@, index: %d  keyEPKI: %@}>", v3, self, v4, v5, v6];

  return v7;
}

- (int)index
{
  return self->_index;
}

- (NSData)keyEPKI
{
  return self->_keyEPKI;
}

- (NSData)stk
{
  return self->_stk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stk, 0);

  objc_storeStrong((id *)&self->_keyEPKI, 0);
}

@end