@interface CPLSharedRemapFixUpTask
- (CPLScopedIdentifier)privateCloudScopedIdentifier;
- (CPLScopedIdentifier)proposedPrivateScopedIdentifier;
- (CPLScopedIdentifier)realCloudScopedIdentifier;
- (CPLScopedIdentifier)sharedCloudScopedIdentifier;
- (CPLSharedRemapFixUpTask)initWithSharedCloudScopedIdentifier:(id)a3 realCloudScopedIdentifier:(id)a4 privateCloudScopedIdentifier:(id)a5 proposedPrivateScopedIdentifier:(id)a6 recordClass:(Class)a7;
- (Class)recordClass;
- (id)description;
@end

@implementation CPLSharedRemapFixUpTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_proposedPrivateScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_privateCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_realCloudScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedCloudScopedIdentifier, 0);
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (CPLScopedIdentifier)proposedPrivateScopedIdentifier
{
  return self->_proposedPrivateScopedIdentifier;
}

- (CPLScopedIdentifier)privateCloudScopedIdentifier
{
  return self->_privateCloudScopedIdentifier;
}

- (CPLScopedIdentifier)realCloudScopedIdentifier
{
  return self->_realCloudScopedIdentifier;
}

- (CPLScopedIdentifier)sharedCloudScopedIdentifier
{
  return self->_sharedCloudScopedIdentifier;
}

- (id)description
{
  id v3 = [NSString alloc];
  realCloudScopedIdentifier = self->_realCloudScopedIdentifier;
  privateCloudScopedIdentifier = self->_privateCloudScopedIdentifier;
  v6 = [(CPLScopedIdentifier *)self->_sharedCloudScopedIdentifier identifier];
  v7 = (void *)[v3 initWithFormat:@"[%@.sharingRecordScopedIdentifier = %@ instead of %@]", privateCloudScopedIdentifier, realCloudScopedIdentifier, v6];

  return v7;
}

- (CPLSharedRemapFixUpTask)initWithSharedCloudScopedIdentifier:(id)a3 realCloudScopedIdentifier:(id)a4 privateCloudScopedIdentifier:(id)a5 proposedPrivateScopedIdentifier:(id)a6 recordClass:(Class)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CPLSharedRemapFixUpTask;
  v17 = [(CPLSharedRemapFixUpTask *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sharedCloudScopedIdentifier, a3);
    objc_storeStrong((id *)&v18->_realCloudScopedIdentifier, a4);
    objc_storeStrong((id *)&v18->_privateCloudScopedIdentifier, a5);
    objc_storeStrong((id *)&v18->_proposedPrivateScopedIdentifier, a6);
    objc_storeStrong((id *)&v18->_recordClass, a7);
  }

  return v18;
}

@end