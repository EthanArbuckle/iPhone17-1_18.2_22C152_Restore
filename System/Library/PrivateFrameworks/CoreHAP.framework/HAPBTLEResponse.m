@interface HAPBTLEResponse
- (BOOL)isBodyComplete;
- (BOOL)isComplete;
- (BOOL)isEncrypted;
- (BOOL)isHeaderComplete;
- (BOOL)isValid;
- (HAPBTLERequest)request;
- (HAPBTLEResponse)init;
- (HAPBTLEResponse)initWithRequest:(id)a3;
- (HAPBTLETransactionIdentifier)identifier;
- (NSData)body;
- (NSMutableData)_internalBody;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4;
- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4;
- (unint64_t)_remainingBodyLength;
- (unint64_t)appendData:(id)a3 error:(id *)a4;
- (unint64_t)bodyLength;
- (unsigned)statusCode;
- (void)_setInternalBody:(id)a3;
- (void)setBody:(id)a3;
- (void)setHeaderComplete:(BOOL)a3;
@end

@implementation HAPBTLEResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_setInternalBody:(id)a3
{
}

- (NSMutableData)_internalBody
{
  return self->__internalBody;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (void)setBody:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setHeaderComplete:(BOOL)a3
{
  self->_headerComplete = a3;
}

- (BOOL)isHeaderComplete
{
  return self->_headerComplete;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (HAPBTLERequest)request
{
  return self->_request;
}

- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((unint64_t)[v6 length] > 1)
  {
    LOWORD(v13) = 0;
    unint64_t v11 = 2;
    objc_msgSend(v6, "getBytes:range:", &v13, 0, 2);
    self->_bodyLength = (unsigned __int16)v13;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [(HAPBTLEResponse *)self shortDescription];
      int v13 = 138543874;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse header body length with control body: %@", (uint8_t *)&v13, 0x20u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:15 description:@"Failed to parse response." reason:@"Failed to parse header body length." suggestion:0 underlyingError:0];
      unint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = 2;
  [v6 getBytes:v14 length:2];
  v8 = [HAPBTLETransactionIdentifier alloc];
  v9 = [(HAPBTLETransactionIdentifier *)v8 initWithUnsignedCharValue:v14[0]];
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_statusCode = v14[1];
  if ((unint64_t)[v6 length] >= 3)
  {
    unint64_t v11 = objc_msgSend(v6, "subdataWithRange:", 2, objc_msgSend(v6, "length") - 2);
    unint64_t v12 = [(HAPBTLEResponse *)self _deserializeHeaderBodyLengthWithData:v11 error:a4];

    if (!v12)
    {
      unint64_t v7 = 0;
      goto LABEL_6;
    }
    unint64_t v7 = v12 + 2;
  }
  [(HAPBTLEResponse *)self setHeaderComplete:1];
LABEL_6:

  return v7;
}

- (unint64_t)appendData:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(HAPBTLEResponse *)self isComplete])
  {
    unint64_t v7 = (void *)MEMORY[0x1D944E080]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [(HAPBTLEResponse *)self shortDescription];
      int v27 = 138543618;
      v28 = v9;
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not appending data, the response is complete", (uint8_t *)&v27, 0x16u);
    }
    if (a4)
    {
      unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v12 = @"Response is complete.";
LABEL_6:
      [v11 hapErrorWithCode:3 description:@"Failed to parse response." reason:v12 suggestion:0 underlyingError:0];
      unint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if ([(HAPBTLEResponse *)self isHeaderComplete])
  {
    unint64_t v13 = 0;
  }
  else
  {
    if ((unint64_t)[v6 length] <= 1)
    {
      v14 = (void *)MEMORY[0x1D944E080]();
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        __int16 v17 = [(HAPBTLEResponse *)self shortDescription];
        int v27 = 138543874;
        v28 = v16;
        __int16 v29 = 2112;
        v30 = v17;
        __int16 v31 = 2112;
        id v32 = v6;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] The data, %@, does not contain the entire response header", (uint8_t *)&v27, 0x20u);
      }
      if (a4)
      {
        unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        unint64_t v12 = @"The entire header was not present.";
        goto LABEL_6;
      }
LABEL_14:
      unint64_t v13 = 0;
      goto LABEL_27;
    }
    unint64_t v13 = [(HAPBTLEResponse *)self _deserializeHeaderWithData:v6 error:a4];
    if (!v13) {
      goto LABEL_27;
    }
  }
  uint64_t v18 = [v6 length];
  if (![(HAPBTLEResponse *)self isBodyComplete] && v18 != v13)
  {
    unint64_t v19 = [(HAPBTLEResponse *)self _remainingBodyLength];
    if (v19)
    {
      if (v19 >= v18 - v13) {
        unint64_t v20 = v18 - v13;
      }
      else {
        unint64_t v20 = v19;
      }
      v21 = [(HAPBTLEResponse *)self _internalBody];

      if (!v21)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", -[HAPBTLEResponse bodyLength](self, "bodyLength"));
        [(HAPBTLEResponse *)self _setInternalBody:v22];
      }
      v23 = [(HAPBTLEResponse *)self _internalBody];
      v24 = objc_msgSend(v6, "subdataWithRange:", v13, v20);
      [v23 appendData:v24];

      v13 += v20;
    }
    if (![(HAPBTLEResponse *)self _remainingBodyLength])
    {
      v25 = [(HAPBTLEResponse *)self _internalBody];
      [(HAPBTLEResponse *)self setBody:v25];

      [(HAPBTLEResponse *)self _setInternalBody:0];
    }
  }
LABEL_27:

  return v13;
}

- (unint64_t)_remainingBodyLength
{
  v3 = [(HAPBTLEResponse *)self body];

  if (v3) {
    return 0;
  }
  unint64_t v5 = [(HAPBTLEResponse *)self bodyLength];
  id v6 = [(HAPBTLEResponse *)self _internalBody];
  unint64_t v4 = v5 - [v6 length];

  return v4;
}

- (BOOL)isValid
{
  BOOL v3 = [(HAPBTLEResponse *)self isComplete];
  if (v3)
  {
    unint64_t v4 = [(HAPBTLEResponse *)self identifier];
    unint64_t v5 = [(HAPBTLEResponse *)self request];
    id v6 = [v5 identifier];
    char v7 = [v4 isEqual:v6];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)isBodyComplete
{
  if (![(HAPBTLEResponse *)self isHeaderComplete]) {
    return 0;
  }
  unint64_t v3 = [(HAPBTLEResponse *)self bodyLength];
  unint64_t v4 = [(HAPBTLEResponse *)self body];
  BOOL v5 = v3 == [v4 length];

  return v5;
}

- (BOOL)isComplete
{
  BOOL v3 = [(HAPBTLEResponse *)self isHeaderComplete];
  if (v3)
  {
    LOBYTE(v3) = [(HAPBTLEResponse *)self isBodyComplete];
  }
  return v3;
}

- (BOOL)isEncrypted
{
  v2 = [(HAPBTLEResponse *)self request];
  char v3 = [v2 isEncrypted];

  return v3;
}

- (id)description
{
  return [(HAPBTLEResponse *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HAPBTLEResponse *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = NSString;
  id v6 = [(HAPBTLEResponse *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1F2C4E778;
  }
  if ([(HAPBTLEResponse *)self isEncrypted]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = [(HAPBTLEResponse *)self identifier];
  unint64_t v10 = [(HAPBTLEResponse *)self bodyLength];
  unint64_t v11 = [(HAPBTLEResponse *)self request];
  unint64_t v12 = [(HAPBTLEResponse *)self body];
  unint64_t v13 = [v5 stringWithFormat:@"<%@%@, Encrypted = %@, Response Identifier = %@, Body Length = %tu, Request = %@> <Body: %@>", v6, v7, v8, v9, v10, v11, v12];

  if (v3) {

  }
  return v13;
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HAPBTLEResponse)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPBTLEResponse;
  id v6 = [(HAPBTLEResponse *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (HAPBTLEResponse)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  unint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end