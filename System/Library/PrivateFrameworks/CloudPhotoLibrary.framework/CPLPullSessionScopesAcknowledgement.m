@interface CPLPullSessionScopesAcknowledgement
+ (BOOL)supportsSecureCoding;
- (BOOL)applyToStore:(id)a3 error:(id *)a4;
- (BOOL)discardFromStore:(id)a3 error:(id *)a4;
- (CPLChangeBatch)scopesChangeBatch;
- (CPLPullSessionScopesAcknowledgement)initWithCoder:(id)a3;
- (CPLPullSessionScopesAcknowledgement)initWithStore:(id)a3 scopesChangeBatch:(id)a4;
- (id)statusDescription;
- (id)storageForStatusInStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLPullSessionScopesAcknowledgement

- (void).cxx_destruct
{
}

- (CPLChangeBatch)scopesChangeBatch
{
  return self->_scopesChangeBatch;
}

- (id)statusDescription
{
  return [(CPLChangeBatch *)self->_scopesChangeBatch summaryDescription];
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)[a3 scopes];
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  return [(CPLChangeSessionUpdate *)&v5 discardFromStore:a3 error:a4];
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  if ([(CPLChangeSessionUpdate *)&v12 applyToStore:v6 error:a4])
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLPushSessionOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        scopesChangeBatch = self->_scopesChangeBatch;
        *(_DWORD *)buf = 138412290;
        v14 = scopesChangeBatch;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Client acknowledged scope changes %@", buf, 0xCu);
      }
    }
    v9 = [v6 scopes];
    char v10 = [v9 clientAcknowledgedScopeChanges:self->_scopesChangeBatch error:a4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  id v4 = a3;
  [(CPLChangeSessionUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_scopesChangeBatch, @"scb", v5.receiver, v5.super_class);
}

- (CPLPullSessionScopesAcknowledgement)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  objc_super v5 = [(CPLChangeSessionUpdate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scb"];
    scopesChangeBatch = v5->_scopesChangeBatch;
    v5->_scopesChangeBatch = (CPLChangeBatch *)v6;
  }
  return v5;
}

- (CPLPullSessionScopesAcknowledgement)initWithStore:(id)a3 scopesChangeBatch:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionScopesAcknowledgement;
  v8 = [(CPLChangeSessionUpdate *)&v11 initWithStore:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_scopesChangeBatch, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end