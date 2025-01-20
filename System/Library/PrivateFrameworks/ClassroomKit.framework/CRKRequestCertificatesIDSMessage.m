@interface CRKRequestCertificatesIDSMessage
+ (id)instanceWithDictionary:(id)a3;
+ (id)messageWithControlGroupIdentifier:(id)a3 destinationDeviceIdentifier:(id)a4 sourceRole:(int64_t)a5 destinationRole:(int64_t)a6 requesterCertificate:(id)a7;
- (CRKRequestCertificatesIDSMessage)initWithRequestIdentifier:(id)a3 controlGroupIdentifier:(id)a4 destinationDeviceIdentifier:(id)a5 sourceRole:(int64_t)a6 destinationRole:(int64_t)a7 requesterCertificate:(id)a8;
- (DMFControlGroupIdentifier)controlGroupIdentifier;
- (NSData)requesterCertificate;
- (NSDictionary)dictionaryValue;
- (NSString)destinationDeviceIdentifier;
- (NSUUID)requestIdentifier;
- (int64_t)destinationRole;
- (int64_t)messageType;
- (int64_t)sourceRole;
@end

@implementation CRKRequestCertificatesIDSMessage

- (CRKRequestCertificatesIDSMessage)initWithRequestIdentifier:(id)a3 controlGroupIdentifier:(id)a4 destinationDeviceIdentifier:(id)a5 sourceRole:(int64_t)a6 destinationRole:(int64_t)a7 requesterCertificate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CRKRequestCertificatesIDSMessage;
  v19 = [(CRKRequestCertificatesIDSMessage *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_requestIdentifier, a3);
    objc_storeStrong((id *)&v20->_controlGroupIdentifier, a4);
    uint64_t v21 = [v17 copy];
    destinationDeviceIdentifier = v20->_destinationDeviceIdentifier;
    v20->_destinationDeviceIdentifier = (NSString *)v21;

    v20->_sourceRole = a6;
    v20->_destinationRole = a7;
    uint64_t v23 = [v18 copy];
    requesterCertificate = v20->_requesterCertificate;
    v20->_requesterCertificate = (NSData *)v23;
  }
  return v20;
}

+ (id)messageWithControlGroupIdentifier:(id)a3 destinationDeviceIdentifier:(id)a4 sourceRole:(int64_t)a5 destinationRole:(int64_t)a6 requesterCertificate:(id)a7
{
  v12 = (void *)MEMORY[0x263F08C38];
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 UUID];
  id v17 = (void *)[objc_alloc((Class)a1) initWithRequestIdentifier:v16 controlGroupIdentifier:v15 destinationDeviceIdentifier:v14 sourceRole:a5 destinationRole:a6 requesterCertificate:v13];

  return v17;
}

- (int64_t)messageType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v17[5] = *MEMORY[0x263EF8340];
  v16[0] = @"RequestIdentifier";
  v3 = [(CRKRequestCertificatesIDSMessage *)self requestIdentifier];
  v4 = [v3 UUIDString];
  v17[0] = v4;
  v16[1] = @"ControlGroupIdentifier";
  v5 = [(CRKRequestCertificatesIDSMessage *)self controlGroupIdentifier];
  v6 = [v5 stringValue];
  v17[1] = v6;
  v16[2] = @"DestinationDeviceIdentifier";
  v7 = [(CRKRequestCertificatesIDSMessage *)self destinationDeviceIdentifier];
  v17[2] = v7;
  v16[3] = @"SourceRole";
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKRequestCertificatesIDSMessage sourceRole](self, "sourceRole"));
  v17[3] = v8;
  v16[4] = @"DestinationRole";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKRequestCertificatesIDSMessage destinationRole](self, "destinationRole"));
  v17[4] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  v11 = (void *)[v10 mutableCopy];

  v12 = [(CRKRequestCertificatesIDSMessage *)self requesterCertificate];

  if (v12)
  {
    id v13 = [(CRKRequestCertificatesIDSMessage *)self requesterCertificate];
    [v11 setObject:v13 forKeyedSubscript:@"RequesterCertificate"];
  }
  id v14 = (void *)[v11 copy];

  return (NSDictionary *)v14;
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

  v8 = [v4 objectForKeyedSubscript:@"ControlGroupIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v4 objectForKeyedSubscript:@"DestinationDeviceIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  id v14 = [v4 objectForKeyedSubscript:@"SourceRole"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  id v17 = [v4 objectForKeyedSubscript:@"DestinationRole"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  v20 = [v4 objectForKeyedSubscript:@"RequesterCertificate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;

  uint64_t v23 = 0;
  if (v7 && v10 && v13 && v16 && v19)
  {
    v29 = (objc_class *)a1;
    id v30 = v7;
    v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
    v25 = (void *)[objc_alloc(MEMORY[0x263F39D20]) initWithString:v10];
    uint64_t v26 = [v16 integerValue];
    uint64_t v27 = [v19 integerValue];
    uint64_t v23 = 0;
    if (v24 && v25 && (v26 & 0x8000000000000000) == 0 && v26 <= 1 && (v27 & 0x8000000000000000) == 0 && v27 <= 1) {
      uint64_t v23 = (void *)[[v29 alloc] initWithRequestIdentifier:v24 controlGroupIdentifier:v25 destinationDeviceIdentifier:v13 sourceRole:v26 destinationRole:v27 requesterCertificate:v22];
    }

    id v7 = v30;
  }

  return v23;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (DMFControlGroupIdentifier)controlGroupIdentifier
{
  return self->_controlGroupIdentifier;
}

- (int64_t)sourceRole
{
  return self->_sourceRole;
}

- (int64_t)destinationRole
{
  return self->_destinationRole;
}

- (NSString)destinationDeviceIdentifier
{
  return self->_destinationDeviceIdentifier;
}

- (NSData)requesterCertificate
{
  return self->_requesterCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterCertificate, 0);
  objc_storeStrong((id *)&self->_destinationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_controlGroupIdentifier, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end