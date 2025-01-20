@interface CPLRecordView
- (BOOL)supportsResources;
- (CPLPlaceholderRecord)placeholderRecord;
- (CPLRecordChange)synthesizedRecord;
- (CPLScopedIdentifier)scopedIdentifier;
- (Class)recordClass;
- (NSData)recordChangeData;
- (NSData)sharingRecordChangeData;
- (id)description;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7;
- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6;
- (id)redactedDescription;
- (id)relatedScopedIdentifier;
- (id)relation;
- (id)secondaryScopedIdentifier;
@end

@implementation CPLRecordView

- (BOOL)supportsResources
{
  v2 = [(CPLRecordView *)self recordClass];
  return [(objc_class *)v2 supportsResources];
}

- (id)relation
{
  v2 = [(CPLRecordView *)self changeForType:2];
  v3 = [v2 relation];

  return v3;
}

- (Class)recordClass
{
  v2 = [(CPLRecordView *)self synthesizedRecord];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (id)secondaryScopedIdentifier
{
  v2 = [(CPLRecordView *)self changeForType:2];
  v3 = [v2 secondaryScopedIdentifier];

  return v3;
}

- (id)relatedScopedIdentifier
{
  v2 = [(CPLRecordView *)self changeForType:2];
  v3 = [v2 relatedScopedIdentifier];

  return v3;
}

- (NSData)sharingRecordChangeData
{
  v2 = [(CPLRecordView *)self synthesizedRecord];
  v3 = [v2 sharingRecordChangeData];

  return (NSData *)v3;
}

- (NSData)recordChangeData
{
  v2 = [(CPLRecordView *)self synthesizedRecord];
  v3 = [v2 recordChangeData];

  return (NSData *)v3;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5
{
  return [(CPLRecordView *)self realRecordChangeFromRecordChange:a3 direction:a4 newRecord:a5 diffTracker:0];
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [v11 changeType];
  if (v12) {
    uint64_t v13 = v12 | 0x100;
  }
  else {
    uint64_t v13 = 378;
  }
  v14 = [(CPLRecordView *)self realRecordChangeFromRecordChange:v11 direction:a4 newRecord:a5 changeType:v13 diffTracker:v10];

  return v14;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  v14 = [(CPLRecordView *)self synthesizedRecord];
  v15 = [v14 realRecordChangeFromRecordChange:v13 direction:a4 newRecord:a5 changeType:a6 diffTracker:v12];

  return v15;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  v4 = [(CPLRecordView *)self synthesizedRecord];
  v5 = [v4 redactedDescription];
  v6 = (void *)[v3 initWithFormat:@"%@", v5];

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(CPLRecordView *)self synthesizedRecord];
  v5 = (void *)[v3 initWithFormat:@"%@", v4];

  return v5;
}

- (CPLPlaceholderRecord)placeholderRecord
{
  id v3 = [CPLPlaceholderRecord alloc];
  v4 = [(CPLRecordView *)self synthesizedRecord];
  v5 = [(CPLPlaceholderRecord *)v3 initWithRecord:v4];

  return v5;
}

- (CPLRecordChange)synthesizedRecord
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 21, @"%@ should be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

- (CPLScopedIdentifier)scopedIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLRecordStorageView.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 16, @"%@ should be implemented by subclasses", v6 object file lineNumber description];

  abort();
}

@end