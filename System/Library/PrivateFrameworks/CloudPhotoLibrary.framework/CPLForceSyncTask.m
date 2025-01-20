@interface CPLForceSyncTask
- (BOOL)isCancelled;
- (CPLForceSyncTask)initWithScopeIdentifiers:(id)a3;
- (NSArray)scopeIdentifiers;
- (NSString)taskIdentifier;
- (id)description;
- (void)cancelTask;
- (void)launchTask;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation CPLForceSyncTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiers, 0);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSArray)scopeIdentifiers
{
  return self->_scopeIdentifiers;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLForceSyncTask *)self taskIdentifier];
  v6 = [(CPLForceSyncTask *)self scopeIdentifiers];
  v7 = [v6 componentsJoinedByString:@", "];
  v8 = (void *)[v3 initWithFormat:@"<%@ %@ (%@)>", v4, v5, v7];

  return v8;
}

- (void)cancelTask
{
  self->_cancelled = 1;
}

- (void)launchTask
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLForceSyncTask.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 23, @"%@ should be overriden by subclasses", v6 object file lineNumber description];

  abort();
}

- (CPLForceSyncTask)initWithScopeIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLForceSyncTask;
  v5 = [(CPLForceSyncTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    scopeIdentifiers = v5->_scopeIdentifiers;
    v5->_scopeIdentifiers = (NSArray *)v6;
  }
  return v5;
}

@end