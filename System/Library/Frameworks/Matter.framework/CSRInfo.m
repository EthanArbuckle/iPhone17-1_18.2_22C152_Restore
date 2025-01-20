@interface CSRInfo
- (CSRInfo)initWithNonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature csr:(NSData *)csr;
- (NSData)csr;
- (NSData)elements;
- (NSData)elementsSignature;
- (NSData)nonce;
- (void)setCsr:(NSData *)csr;
- (void)setElements:(NSData *)elements;
- (void)setElementsSignature:(NSData *)elementsSignature;
- (void)setNonce:(NSData *)nonce;
@end

@implementation CSRInfo

- (CSRInfo)initWithNonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature csr:(NSData *)csr
{
  v11 = nonce;
  v12 = elements;
  v13 = elementsSignature;
  v14 = csr;
  v18.receiver = self;
  v18.super_class = (Class)CSRInfo;
  v15 = [(CSRInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_nonce, nonce);
    objc_storeStrong((id *)&v16->_elements, elements);
    objc_storeStrong((id *)&v16->_elementsSignature, elementsSignature);
    objc_storeStrong((id *)&v16->_csr, csr);
  }

  return v16;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
}

- (NSData)elements
{
  return self->_elements;
}

- (void)setElements:(NSData *)elements
{
}

- (NSData)elementsSignature
{
  return self->_elementsSignature;
}

- (void)setElementsSignature:(NSData *)elementsSignature
{
}

- (NSData)csr
{
  return self->_csr;
}

- (void)setCsr:(NSData *)csr
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csr, 0);
  objc_storeStrong((id *)&self->_elementsSignature, 0);
  objc_storeStrong((id *)&self->_elements, 0);

  objc_storeStrong((id *)&self->_nonce, 0);
}

@end