@interface NEFlowMetaData
+ (BOOL)supportsSecureCoding;
- (BOOL)fastOpenRequested;
- (BOOL)multipathRequested;
- (NEFlowMetaData)initWithCoder:(id)a3;
- (NSData)sourceAppAuditToken;
- (NSData)sourceAppUniqueIdentifier;
- (NSString)sourceAppSigningIdentifier;
- (NSUUID)filterFlowIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEFlowMetaData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterFlowIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAuditToken, 0);
  objc_storeStrong((id *)&self->_sourceAppSigningIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceAppUniqueIdentifier, 0);
}

- (BOOL)multipathRequested
{
  return self->_multipathRequested;
}

- (BOOL)fastOpenRequested
{
  return self->_fastOpenRequested;
}

- (NSUUID)filterFlowIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)sourceAppAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)sourceAppSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)sourceAppUniqueIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEFlowMetaData allocWithZone:a3];
  v5 = [(NEFlowMetaData *)self sourceAppUniqueIdentifier];
  v6 = [(NEFlowMetaData *)self sourceAppSigningIdentifier];
  BOOL v16 = [(NEFlowMetaData *)self fastOpenRequested];
  BOOL v7 = [(NEFlowMetaData *)self multipathRequested];
  v8 = [(NEFlowMetaData *)self sourceAppAuditToken];
  v9 = [(NEFlowMetaData *)self filterFlowIdentifier];
  id v10 = v5;
  id v11 = v6;
  id v12 = v8;
  id v13 = v9;
  if (v4)
  {
    v17.receiver = v4;
    v17.super_class = (Class)NEFlowMetaData;
    v14 = [(NEFlowMetaData *)&v17 init];
    v4 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_sourceAppSigningIdentifier, v6);
      objc_storeStrong((id *)&v4->_sourceAppUniqueIdentifier, v5);
      v4->_fastOpenRequested = v16;
      v4->_multipathRequested = v7;
      objc_storeStrong((id *)&v4->_sourceAppAuditToken, v8);
      objc_storeStrong((id *)&v4->_filterFlowIdentifier, v9);
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NEFlowMetaData *)self sourceAppSigningIdentifier];
  [v4 encodeObject:v5 forKey:@"sourceAppSigningIdentifier"];

  v6 = [(NEFlowMetaData *)self sourceAppUniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"sourceAppUniqueIdentifier"];

  BOOL v7 = [(NEFlowMetaData *)self sourceAppAuditToken];
  [v4 encodeObject:v7 forKey:@"sourceAppAuditToken"];

  id v8 = [(NEFlowMetaData *)self filterFlowIdentifier];
  [v4 encodeObject:v8 forKey:@"filterFlowID"];
}

- (NEFlowMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEFlowMetaData;
  v5 = [(NEFlowMetaData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppSigningIdentifier"];
    sourceAppSigningIdentifier = v5->_sourceAppSigningIdentifier;
    v5->_sourceAppSigningIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppUniqueIdentifier"];
    sourceAppUniqueIdentifier = v5->_sourceAppUniqueIdentifier;
    v5->_sourceAppUniqueIdentifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppAuditToken"];
    sourceAppAuditToken = v5->_sourceAppAuditToken;
    v5->_sourceAppAuditToken = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterFlowID"];
    filterFlowIdentifier = v5->_filterFlowIdentifier;
    v5->_filterFlowIdentifier = (NSUUID *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NEFlowMetaData *)self sourceAppSigningIdentifier];
  v5 = [(NEFlowMetaData *)self sourceAppUniqueIdentifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@[%@]", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end