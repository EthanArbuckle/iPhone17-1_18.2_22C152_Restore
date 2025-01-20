@interface CPLRecordChangeDiffTracker
- (BOOL)areObjectsDifferentOnProperty:(id)a3 changeType:(unint64_t)a4;
- (CPLRecordChangeDiffTracker)init;
- (CPLRecordChangeDiffTracker)initWithTrackingChangeTypeMask:(unint64_t)a3;
- (NSArray)updatedProperties;
- (id)description;
- (id)redactedDescription;
- (void)withTrackerForChangeType:(unint64_t)a3 block:(id)a4;
@end

@implementation CPLRecordChangeDiffTracker

- (void).cxx_destruct
{
}

- (id)redactedDescription
{
  v2 = [(CPLDiffTracker *)self->_diffTracker description];
  v3 = v2;
  if (!v2) {
    v2 = @"[no differences]";
  }
  v4 = v2;

  return v4;
}

- (id)description
{
  v2 = [(CPLDiffTracker *)self->_diffTracker description];
  v3 = v2;
  if (!v2) {
    v2 = @"[no differences]";
  }
  v4 = v2;

  return v4;
}

- (BOOL)areObjectsDifferentOnProperty:(id)a3 changeType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t trackingChangeType = self->_trackingChangeType;
  if (!trackingChangeType) {
    goto LABEL_7;
  }
  if ((a4 & 0xFFFFFFFFFFFFFBFFLL) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v20 = a4;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Invalid change type %ld", buf, 0xCu);
      }
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1502, @"Invalid change type %ld", a4, v18);
LABEL_19:

    abort();
  }
  unint64_t v9 = trackingChangeType & a4;
  if (!v9)
  {
LABEL_7:
    char v11 = 1;
    goto LABEL_8;
  }
  if (v9 != a4)
  {
    if (!_CPLSilentLogging)
    {
      v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = self->_trackingChangeType;
        *(_DWORD *)buf = 134218240;
        unint64_t v20 = a4;
        __int16 v21 = 2048;
        unint64_t v22 = v17;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Invalid change type %ld - tracked %ld", buf, 0x16u);
      }
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m"];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1508, @"Invalid change type %ld - tracked %ld", a4, self->_trackingChangeType);
    goto LABEL_19;
  }
  diffTracker = self->_diffTracker;
  if (!diffTracker) {
    goto LABEL_7;
  }
  char v11 = [(CPLDiffTracker *)diffTracker areObjectsDifferentOnProperty:v7];
LABEL_8:

  return v11;
}

- (NSArray)updatedProperties
{
  v2 = [(CPLDiffTracker *)self->_diffTracker differingProperties];
  v3 = [v2 allObjects];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = v3;

  return v5;
}

- (void)withTrackerForChangeType:(unint64_t)a3 block:(id)a4
{
  unint64_t v9 = (void (**)(id, CPLDiffTracker *))a4;
  diffTracker = self->_diffTracker;
  if (!diffTracker)
  {
    id v7 = objc_alloc_init(CPLDiffTracker);
    v8 = self->_diffTracker;
    self->_diffTracker = v7;

    diffTracker = self->_diffTracker;
  }
  [(CPLDiffTracker *)diffTracker setShouldCompareAllProperties:(self->_trackingChangeType & a3) != 0];
  v9[2](v9, self->_diffTracker);
}

- (CPLRecordChangeDiffTracker)initWithTrackingChangeTypeMask:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLRecordChangeDiffTracker;
  result = [(CPLRecordChangeDiffTracker *)&v5 init];
  if (result) {
    result->_unint64_t trackingChangeType = a3;
  }
  return result;
}

- (CPLRecordChangeDiffTracker)init
{
  return [(CPLRecordChangeDiffTracker *)self initWithTrackingChangeTypeMask:0];
}

@end