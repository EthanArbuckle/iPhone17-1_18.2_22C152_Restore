@interface TrustedPeersHelperTLKRecoveryResult
+ (BOOL)supportsSecureCoding;
- (NSDictionary)tlkRecoveryErrors;
- (NSSet)successfulKeysRecovered;
- (TrustedPeersHelperTLKRecoveryResult)initWithCoder:(id)a3;
- (TrustedPeersHelperTLKRecoveryResult)initWithSuccessfulKeyUUIDs:(id)a3 totalTLKSharesRecovered:(int64_t)a4 tlkRecoveryErrors:(id)a5;
- (id)description;
- (int64_t)totalTLKSharesRecovered;
- (void)encodeWithCoder:(id)a3;
- (void)setSuccessfulKeysRecovered:(id)a3;
- (void)setTlkRecoveryErrors:(id)a3;
- (void)setTotalTLKSharesRecovered:(int64_t)a3;
@end

@implementation TrustedPeersHelperTLKRecoveryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkRecoveryErrors, 0);

  objc_storeStrong((id *)&self->_successfulKeysRecovered, 0);
}

- (void)setTlkRecoveryErrors:(id)a3
{
}

- (NSDictionary)tlkRecoveryErrors
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTotalTLKSharesRecovered:(int64_t)a3
{
  self->_totalTLKSharesRecovered = a3;
}

- (int64_t)totalTLKSharesRecovered
{
  return self->_totalTLKSharesRecovered;
}

- (void)setSuccessfulKeysRecovered:(id)a3
{
}

- (NSSet)successfulKeysRecovered
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TrustedPeersHelperTLKRecoveryResult *)self successfulKeysRecovered];
  [v4 encodeObject:v5 forKey:@"keys"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[TrustedPeersHelperTLKRecoveryResult totalTLKSharesRecovered](self, "totalTLKSharesRecovered"), @"totalShares");
  id v6 = [(TrustedPeersHelperTLKRecoveryResult *)self tlkRecoveryErrors];
  [v4 encodeObject:v6 forKey:@"errors"];
}

- (TrustedPeersHelperTLKRecoveryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TrustedPeersHelperTLKRecoveryResult;
  v5 = [(TrustedPeersHelperTLKRecoveryResult *)&v14 init];
  if (v5)
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v15 count:2];
    v7 = +[NSSet setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"keys"];
    successfulKeysRecovered = v5->_successfulKeysRecovered;
    v5->_successfulKeysRecovered = (NSSet *)v8;

    v5->_totalTLKSharesRecovered = (int64_t)[v4 decodeInt64ForKey:@"totalShares"];
    v10 = +[SecXPCHelper safeErrorClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"errors"];
    tlkRecoveryErrors = v5->_tlkRecoveryErrors;
    v5->_tlkRecoveryErrors = (NSDictionary *)v11;
  }
  return v5;
}

- (id)description
{
  v3 = [(TrustedPeersHelperTLKRecoveryResult *)self successfulKeysRecovered];
  id v4 = +[NSString stringWithFormat:@"<TLKRecoveryResult: %@ totalTLKSharesRecovered:%d>", v3, [(TrustedPeersHelperTLKRecoveryResult *)self totalTLKSharesRecovered]];

  return v4;
}

- (TrustedPeersHelperTLKRecoveryResult)initWithSuccessfulKeyUUIDs:(id)a3 totalTLKSharesRecovered:(int64_t)a4 tlkRecoveryErrors:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TrustedPeersHelperTLKRecoveryResult;
  uint64_t v11 = [(TrustedPeersHelperTLKRecoveryResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_successfulKeysRecovered, a3);
    v12->_totalTLKSharesRecovered = a4;
    objc_storeStrong((id *)&v12->_tlkRecoveryErrors, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end