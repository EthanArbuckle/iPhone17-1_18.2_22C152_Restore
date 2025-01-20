@interface HKFHIRResourceDownloadRequestResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRCredentialRefreshResult)refreshResult;
- (HKFHIRRequestTaskEndStates)endStates;
- (HKFHIRResourceDownloadRequestResult)init;
- (HKFHIRResourceDownloadRequestResult)initWithCoder:(id)a3;
- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3;
- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3 endStates:(id)a4 refreshResult:(id)a5;
- (HKFHIRResourceDownloadRequestResult)initWithResourceBundleData:(id)a3 endStates:(id)a4 refreshResult:(id)a5;
- (NSData)resourceBundleData;
- (NSError)error;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRResourceDownloadRequestResult

- (HKFHIRResourceDownloadRequestResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRResourceDownloadRequestResult)initWithResourceBundleData:(id)a3 endStates:(id)a4 refreshResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRResourceDownloadRequestResult;
  v11 = [(HKFHIRResourceDownloadRequestResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    resourceBundleData = v11->_resourceBundleData;
    v11->_resourceBundleData = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    endStates = v11->_endStates;
    v11->_endStates = (HKFHIRRequestTaskEndStates *)v14;

    uint64_t v16 = [v10 copy];
    refreshResult = v11->_refreshResult;
    v11->_refreshResult = (HKFHIRCredentialRefreshResult *)v16;
  }
  return v11;
}

- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3
{
  return [(HKFHIRResourceDownloadRequestResult *)self initWithError:a3 endStates:0 refreshResult:0];
}

- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3 endStates:(id)a4 refreshResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRResourceDownloadRequestResult;
  v11 = [(HKFHIRResourceDownloadRequestResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    error = v11->_error;
    v11->_error = (NSError *)v12;

    uint64_t v14 = [v9 copy];
    endStates = v11->_endStates;
    v11->_endStates = (HKFHIRRequestTaskEndStates *)v14;

    uint64_t v16 = [v10 copy];
    refreshResult = v11->_refreshResult;
    v11->_refreshResult = (HKFHIRCredentialRefreshResult *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKFHIRResourceDownloadRequestResult *)a3;
  v7 = v6;
  if (self != v6)
  {
    id v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    resourceBundleData = self->_resourceBundleData;
    id v10 = [(HKFHIRResourceDownloadRequestResult *)v8 resourceBundleData];
    if (resourceBundleData != v10)
    {
      uint64_t v11 = [(HKFHIRResourceDownloadRequestResult *)v8 resourceBundleData];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      uint64_t v12 = self->_resourceBundleData;
      v13 = [(HKFHIRResourceDownloadRequestResult *)v8 resourceBundleData];
      if (![(NSData *)v12 isEqual:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    endStates = self->_endStates;
    uint64_t v16 = [(HKFHIRResourceDownloadRequestResult *)v8 endStates];
    if (endStates == v16)
    {
      v42 = endStates;
    }
    else
    {
      uint64_t v17 = [(HKFHIRResourceDownloadRequestResult *)v8 endStates];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = endStates;
      objc_super v19 = self->_endStates;
      uint64_t v4 = [(HKFHIRResourceDownloadRequestResult *)v8 endStates];
      if (![(HKFHIRRequestTaskEndStates *)v19 isEqual:v4])
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    refreshResult = self->_refreshResult;
    v21 = [(HKFHIRResourceDownloadRequestResult *)v8 refreshResult];
    v41 = v4;
    if (refreshResult == v21)
    {
      v39 = v3;
      v40 = refreshResult;
    }
    else
    {
      uint64_t v22 = [(HKFHIRResourceDownloadRequestResult *)v8 refreshResult];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (resourceBundleData != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = refreshResult;
      v37 = (void *)v22;
      v23 = self->_refreshResult;
      uint64_t v24 = [(HKFHIRResourceDownloadRequestResult *)v8 refreshResult];
      v25 = v23;
      v26 = (void *)v24;
      if (![(HKFHIRCredentialRefreshResult *)v25 isEqual:v24])
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    error = self->_error;
    uint64_t v28 = [(HKFHIRResourceDownloadRequestResult *)v8 error];
    char v14 = error == (NSError *)v28;
    if (error == (NSError *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      uint64_t v30 = [(HKFHIRResourceDownloadRequestResult *)v8 error];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_error;
        v33 = [(HKFHIRResourceDownloadRequestResult *)v8 error];
        char v14 = [(NSError *)v32 isEqual:v33];

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  double v6 = (double)[(NSData *)self->_resourceBundleData length] * 0.0009765625;
  v7 = HKStringFromBool();
  id v8 = HKStringFromBool();
  id v9 = [v3 stringWithFormat:@"<%@ %p, resource bundle data: %.2f KB, did refresh token: %@ error: %@>", v5, self, *(void *)&v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  resourceBundleData = self->_resourceBundleData;
  id v5 = a3;
  [v5 encodeObject:resourceBundleData forKey:@"resourceBundleData"];
  [v5 encodeObject:self->_endStates forKey:@"endStates"];
  [v5 encodeObject:self->_refreshResult forKey:@"refreshResult"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (HKFHIRResourceDownloadRequestResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceBundleData"];
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshResult"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStates"];
  if (v5)
  {
    id v9 = [(HKFHIRResourceDownloadRequestResult *)self initWithResourceBundleData:v5 endStates:v8 refreshResult:v7];
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      id v10 = 0;
      goto LABEL_6;
    }
    id v9 = [(HKFHIRResourceDownloadRequestResult *)self initWithError:v6 endStates:v8 refreshResult:v7];
  }
  self = v9;
  id v10 = self;
LABEL_6:

  return v10;
}

- (NSData)resourceBundleData
{
  return self->_resourceBundleData;
}

- (HKFHIRRequestTaskEndStates)endStates
{
  return self->_endStates;
}

- (HKFHIRCredentialRefreshResult)refreshResult
{
  return self->_refreshResult;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_refreshResult, 0);
  objc_storeStrong((id *)&self->_endStates, 0);

  objc_storeStrong((id *)&self->_resourceBundleData, 0);
}

@end