@interface CPLPlaceholderRecord
- (CPLPlaceholderRecord)initWithRecord:(id)a3;
- (CPLPlaceholderRecord)initWithRecordClass:(Class)a3 scopedIdentifier:(id)a4 relatedRecordClass:(Class)a5 relatedIdentifier:(id)a6;
- (CPLScopedIdentifier)relatedScopedIdentifier;
- (CPLScopedIdentifier)scopedIdentifier;
- (Class)recordClass;
- (Class)relatedRecordClass;
- (NSString)relatedIdentifier;
- (id)description;
- (id)translateToClientRecordUsingIDMapping:(id)a3;
- (id)translateToCloudRecordUsingIDMapping:(id)a3;
@end

@implementation CPLPlaceholderRecord

- (id)translateToClientRecordUsingIDMapping:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  v5 = [(CPLPlaceholderRecord *)self scopedIdentifier];
  v6 = [v4 localScopedIdentifierForCloudScopedIdentifier:v5 isFinal:&v16];
  uint64_t v7 = [(CPLPlaceholderRecord *)self relatedScopedIdentifier];
  v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6 = (void *)[v5 copy];
  if (!v8) {
    goto LABEL_6;
  }
LABEL_3:
  v9 = [v4 localScopedIdentifierForCloudScopedIdentifier:0 isFinal:&v16];
  if (!v9) {
    v9 = (void *)[v8 copy];
  }
LABEL_7:
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [(CPLPlaceholderRecord *)self recordClass];
  v12 = [(CPLPlaceholderRecord *)self relatedRecordClass];
  v13 = [v9 identifier];
  v14 = (void *)[v10 initWithRecordClass:v11 scopedIdentifier:v6 relatedRecordClass:v12 relatedIdentifier:v13];

  return v14;
}

- (id)translateToCloudRecordUsingIDMapping:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  v5 = [(CPLPlaceholderRecord *)self scopedIdentifier];
  v6 = [v4 cloudScopedIdentifierForLocalScopedIdentifier:v5 isFinal:&v16];
  uint64_t v7 = [(CPLPlaceholderRecord *)self relatedScopedIdentifier];
  v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v6 = (void *)[v5 copy];
  if (!v8) {
    goto LABEL_6;
  }
LABEL_3:
  v9 = [v4 cloudScopedIdentifierForLocalScopedIdentifier:v8 isFinal:&v16];
  if (!v9) {
    v9 = (void *)[v8 copy];
  }
LABEL_7:
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [(CPLPlaceholderRecord *)self recordClass];
  v12 = [(CPLPlaceholderRecord *)self relatedRecordClass];
  v13 = [v9 identifier];
  v14 = (void *)[v10 initWithRecordClass:v11 scopedIdentifier:v6 relatedRecordClass:v12 relatedIdentifier:v13];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedRecordClass, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_recordClass, 0);
}

- (NSString)relatedIdentifier
{
  return self->_relatedIdentifier;
}

- (Class)relatedRecordClass
{
  return self->_relatedRecordClass;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[(%@ %@)]", self->_recordClass, self->_scopedIdentifier];
  return v2;
}

- (CPLScopedIdentifier)relatedScopedIdentifier
{
  relatedIdentifier = self->_relatedIdentifier;
  if (relatedIdentifier)
  {
    id v4 = relatedIdentifier;
    v5 = [CPLScopedIdentifier alloc];
    v6 = [(CPLPlaceholderRecord *)self scopedIdentifier];
    id v7 = [(CPLScopedIdentifier *)v5 initRelativeToScopedIdentifier:v6 identifier:v4];
  }
  else
  {
    id v7 = 0;
  }
  return (CPLScopedIdentifier *)v7;
}

- (CPLPlaceholderRecord)initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 relatedIdentifier];
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 scopedIdentifier];
  if (v5)
  {
    uint64_t v8 = [v4 relatedRecordClass];

    v9 = self;
    uint64_t v10 = v6;
    v11 = v7;
    uint64_t v12 = v8;
    v13 = v5;
  }
  else
  {

    v9 = self;
    uint64_t v10 = v6;
    v11 = v7;
    uint64_t v12 = 0;
    v13 = 0;
  }
  v14 = [(CPLPlaceholderRecord *)v9 initWithRecordClass:v10 scopedIdentifier:v11 relatedRecordClass:v12 relatedIdentifier:v13];

  return v14;
}

- (CPLPlaceholderRecord)initWithRecordClass:(Class)a3 scopedIdentifier:(id)a4 relatedRecordClass:(Class)a5 relatedIdentifier:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CPLPlaceholderRecord;
  v13 = [(CPLPlaceholderRecord *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recordClass, a3);
    objc_storeStrong((id *)&v14->_scopedIdentifier, a4);
    if (v12)
    {
      objc_storeStrong((id *)&v14->_relatedIdentifier, a6);
      objc_storeStrong((id *)&v14->_relatedRecordClass, a5);
    }
  }

  return v14;
}

@end