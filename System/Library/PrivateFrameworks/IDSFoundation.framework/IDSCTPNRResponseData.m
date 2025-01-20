@interface IDSCTPNRResponseData
- (BOOL)success;
- (IDSCTPNRResponseData)initWithCTResponse:(id)a3 phoneBookNumber:(id)a4;
- (NSData)signature;
- (NSString)phoneBookNumber;
- (NSString)phoneNumber;
- (NSString)status;
- (void)setPhoneBookNumber:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSignature:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation IDSCTPNRResponseData

- (IDSCTPNRResponseData)initWithCTResponse:(id)a3 phoneBookNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IDSCTPNRResponseData;
  v9 = [(IDSCTPNRResponseData *)&v22 init];
  if (v9)
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v8, *MEMORY[0x1E4F23E90], v10);
    phoneNumber = v9->_phoneNumber;
    v9->_phoneNumber = (NSString *)v11;

    objc_storeStrong((id *)&v9->_phoneBookNumber, a4);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v6, v13, *MEMORY[0x1E4F23EA8], v14);
    signature = v9->_signature;
    v9->_signature = (NSData *)v15;

    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v6, v17, *MEMORY[0x1E4F23E98], v18);
    status = v9->_status;
    v9->_status = (NSString *)v19;

    v9->_success = CFEqual((CFTypeRef)*MEMORY[0x1E4F23EA0], v9->_status) != 0;
  }

  return v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_phoneBookNumber, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end