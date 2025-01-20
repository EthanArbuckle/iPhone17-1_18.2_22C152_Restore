@interface CPLPullSessionUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)applyToStore:(id)a3 error:(id *)a4;
- (BOOL)discardFromStore:(id)a3 error:(id *)a4;
- (CPLChangeBatch)clientBatch;
- (CPLChangeBatch)cloudBatch;
- (CPLPullSessionUpdate)initWithCoder:(id)a3;
- (CPLPullSessionUpdate)initWithStore:(id)a3 expandedClientBatch:(id)a4 expandedCloudBatch:(id)a5;
- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3;
- (id)statusDescription;
- (id)storageForStatusInStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLPullSessionUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudBatch, 0);
  objc_storeStrong((id *)&self->_clientBatch, 0);
}

- (CPLChangeBatch)cloudBatch
{
  return self->_cloudBatch;
}

- (CPLChangeBatch)clientBatch
{
  return self->_clientBatch;
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  return [(CPLChangeBatch *)self->_clientBatch recordWithScopedIdentifier:a3];
}

- (id)statusDescription
{
  return [(CPLChangeBatch *)self->_clientBatch summaryDescription];
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)[a3 pullQueue];
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionUpdate;
  return [(CPLChangeSessionUpdate *)&v5 discardFromStore:a3 error:a4];
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLPullSessionUpdate;
  if ([(CPLChangeSessionUpdate *)&v16 applyToStore:v6 error:a4])
  {
    v7 = [v6 pullQueue];
    if (![v7 popNextBatchWithError:a4]) {
      goto LABEL_14;
    }
    if (!_CPLSilentLogging)
    {
      v8 = __CPLPushSessionOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        clientBatch = self->_clientBatch;
        *(_DWORD *)buf = 138412290;
        v18 = clientBatch;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Applying to client cache %@", buf, 0xCu);
      }
    }
    v10 = [v6 cloudCache];
    if (!_CPLSilentLogging)
    {
      v11 = __CPLPushSessionOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        cloudBatch = self->_cloudBatch;
        *(_DWORD *)buf = 138412290;
        v18 = cloudBatch;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Committing to cloud cache %@", buf, 0xCu);
      }
    }
    int v13 = [v10 applyBatch:self->_cloudBatch isFinal:1 direction:2 withError:a4];

    if (v13)
    {
      [v7 notifyClientDidAcknowledgeBatch:self->_clientBatch];
      BOOL v14 = 1;
    }
    else
    {
LABEL_14:
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionUpdate;
  id v4 = a3;
  [(CPLChangeSessionUpdate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientBatch, @"cli", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_cloudBatch forKey:@"clo"];
}

- (CPLPullSessionUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionUpdate;
  objc_super v5 = [(CPLChangeSessionUpdate *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cli"];
    clientBatch = v5->_clientBatch;
    v5->_clientBatch = (CPLChangeBatch *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clo"];
    cloudBatch = v5->_cloudBatch;
    v5->_cloudBatch = (CPLChangeBatch *)v8;
  }
  return v5;
}

- (CPLPullSessionUpdate)initWithStore:(id)a3 expandedClientBatch:(id)a4 expandedCloudBatch:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CPLPullSessionUpdate;
  objc_super v11 = [(CPLChangeSessionUpdate *)&v15 initWithStore:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientBatch, a4);
    objc_storeStrong((id *)&v12->_cloudBatch, a5);
    int v13 = [v8 pullQueue];
    [v13 notifyClientWillAcknowledgeBatch:v12->_clientBatch];
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end