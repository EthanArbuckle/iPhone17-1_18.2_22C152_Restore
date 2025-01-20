@interface CPLChangedRecordView
- (CPLChangedRecordView)initWithChange:(id)a3 overRecordView:(id)a4;
- (CPLRecordChange)change;
- (CPLRecordView)baseRecordView;
- (Class)recordClass;
- (id)changeForType:(unint64_t)a3;
- (id)description;
- (id)placeholderRecord;
- (id)recordChangeData;
- (id)redactedDescription;
- (id)scopedIdentifier;
- (id)sharingRecordChangeData;
- (id)synthesizedRecord;
@end

@implementation CPLChangedRecordView

- (Class)recordClass
{
  v2 = [(CPLChangedRecordView *)self change];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_baseRecordView, 0);
}

- (CPLRecordChange)change
{
  return self->_change;
}

- (CPLRecordView)baseRecordView
{
  return self->_baseRecordView;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  v4 = [(CPLRecordView *)self->_baseRecordView redactedDescription];
  v5 = [(CPLRecordChange *)self->_change redactedDescription];
  v6 = (void *)[v3 initWithFormat:@"%@+[%@]", v4, v5];

  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@+[%@]", self->_baseRecordView, self->_change];
  return v2;
}

- (id)sharingRecordChangeData
{
  id v3 = [(CPLRecordChange *)self->_change sharingRecordChangeData];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CPLRecordView *)self->_baseRecordView sharingRecordChangeData];
  }
  v6 = v5;

  return v6;
}

- (id)recordChangeData
{
  id v3 = [(CPLRecordChange *)self->_change recordChangeData];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CPLRecordView *)self->_baseRecordView recordChangeData];
  }
  v6 = v5;

  return v6;
}

- (id)changeForType:(unint64_t)a3
{
  if (!a3)
  {
    v7 = [(CPLChangedRecordView *)self synthesizedRecord];
    goto LABEL_9;
  }
  BOOL v5 = [(CPLRecordChange *)self->_change isFullRecord];
  change = self->_change;
  if (v5)
  {
    v7 = change;
LABEL_9:
    v9 = v7;
    goto LABEL_10;
  }
  unint64_t v8 = [(CPLRecordChange *)change changeType] & a3;
  if (!v8)
  {
    v7 = [(CPLRecordView *)self->_baseRecordView changeForType:a3];
    goto LABEL_9;
  }
  if (v8 == a3)
  {
    v7 = self->_change;
    goto LABEL_9;
  }
  v11 = [(CPLRecordView *)self->_baseRecordView changeForType:v8 ^ a3];
  v9 = (CPLRecordChange *)[v11 copy];

  [(CPLRecordChange *)v9 applyChangeType:v8 fromChange:self->_change];
LABEL_10:
  return v9;
}

- (id)placeholderRecord
{
  if ([(CPLRecordChange *)self->_change hasChangeType:2])
  {
    id v3 = [[CPLPlaceholderRecord alloc] initWithRecord:self->_change];
  }
  else
  {
    id v3 = [(CPLRecordView *)self->_baseRecordView placeholderRecord];
  }
  return v3;
}

- (id)synthesizedRecord
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(CPLRecordChange *)self->_change isFullRecord];
  change = self->_change;
  if (v4)
  {
    v6 = change;
  }
  else
  {
    uint64_t v7 = [(CPLRecordChange *)change changeType];
    unint64_t v8 = [(CPLRecordChange *)self->_change fullChangeTypeForFullRecord];
    if ((v8 & ~v7) != 0)
    {
      unint64_t v9 = v8;
      v10 = [(CPLRecordView *)self->_baseRecordView synthesizedRecord];
      if (([v10 isFullRecord] & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v12 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v10;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "%@ should be a full record", buf, 0xCu);
          }
        }
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
        [v13 handleFailureInMethod:a2, self, v14, 63, @"%@ should be a full record", v10 object file lineNumber description];

        abort();
      }
      v6 = (CPLRecordChange *)[v10 copyChangeType:v9 & ~v7];
      [(CPLRecordChange *)v6 applyChange:self->_change];
      [(CPLRecordChange *)v6 setChangeType:0];
    }
    else
    {
      v6 = (CPLRecordChange *)[(CPLRecordChange *)self->_change copy];
      [(CPLRecordChange *)v6 setChangeType:0];
    }
  }
  return v6;
}

- (id)scopedIdentifier
{
  return [(CPLRecordChange *)self->_change scopedIdentifier];
}

- (CPLChangedRecordView)initWithChange:(id)a3 overRecordView:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isDelete])
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2112;
        id v21 = v8;
        id v14 = v19;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Should not create a %@ with %@", buf, 0x16u);
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m"];
    [v15 handleFailureInMethod:a2, self, v16, 37, @"Should not create a %@ with %@", objc_opt_class(), v8 object file lineNumber description];

    abort();
  }
  v17.receiver = self;
  v17.super_class = (Class)CPLChangedRecordView;
  v10 = [(CPLChangedRecordView *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_baseRecordView, a4);
    objc_storeStrong((id *)&v11->_change, a3);
  }

  return v11;
}

@end