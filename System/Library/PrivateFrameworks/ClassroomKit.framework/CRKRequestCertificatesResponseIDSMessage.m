@interface CRKRequestCertificatesResponseIDSMessage
+ (id)instanceWithDictionary:(id)a3;
- (CRKRequestCertificatesResponseIDSMessage)initWithRequestIdentifier:(id)a3 certificateDataCollection:(id)a4 error:(id)a5;
- (NSArray)certificateDataCollection;
- (NSDictionary)dictionaryValue;
- (NSError)error;
- (NSUUID)requestIdentifier;
- (int64_t)messageType;
@end

@implementation CRKRequestCertificatesResponseIDSMessage

- (CRKRequestCertificatesResponseIDSMessage)initWithRequestIdentifier:(id)a3 certificateDataCollection:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKRequestCertificatesResponseIDSMessage;
  v12 = [(CRKRequestCertificatesResponseIDSMessage *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestIdentifier, a3);
    uint64_t v14 = [v10 copy];
    certificateDataCollection = v13->_certificateDataCollection;
    v13->_certificateDataCollection = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (int64_t)messageType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CRKRequestCertificatesResponseIDSMessage *)self requestIdentifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"RequestIdentifier"];

  v6 = [(CRKRequestCertificatesResponseIDSMessage *)self certificateDataCollection];
  [v3 setObject:v6 forKeyedSubscript:@"CertificateDataCollection"];

  v7 = [(CRKRequestCertificatesResponseIDSMessage *)self error];

  if (v7)
  {
    v8 = [CRKErrorBox alloc];
    id v9 = [(CRKRequestCertificatesResponseIDSMessage *)self error];
    id v10 = [(CRKErrorBox *)v8 initWithError:v9];
    id v11 = [(CRKErrorBox *)v10 dictionaryValue];
    [v3 setObject:v11 forKeyedSubscript:@"ErrorBox"];
  }
  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"RequestIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"ErrorBox"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v4 objectForKeyedSubscript:@"CertificateDataCollection"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v7)
  {
    v18 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  if (v14)
  {
    if (!v10)
    {
      objc_super v17 = 0;
      goto LABEL_18;
    }
    v15 = +[CRKErrorBox instanceWithDictionary:v10];
    if (v15)
    {
      v16 = v15;
      objc_super v17 = [v15 error];

LABEL_18:
      v18 = (void *)[objc_alloc((Class)a1) initWithRequestIdentifier:v14 certificateDataCollection:v13 error:v17];

      goto LABEL_19;
    }
  }
  v18 = 0;
LABEL_19:

LABEL_20:

  return v18;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSArray)certificateDataCollection
{
  return self->_certificateDataCollection;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_certificateDataCollection, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end