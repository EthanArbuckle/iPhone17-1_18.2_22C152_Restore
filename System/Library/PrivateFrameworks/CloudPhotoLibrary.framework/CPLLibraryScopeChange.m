@interface CPLLibraryScopeChange
- (BOOL)hasProblematicFormerSharedScope;
- (NSData)rewindAnchorsPerSharingScopesData;
- (NSString)problematicFormerSharedScopeIdentifier;
- (id)rewindAnchorsPerSharingScopes;
- (void)setProblematicFormerSharedScopeIdentifier:(id)a3;
- (void)setRewindAnchorsPerSharingScopes:(id)a3;
- (void)setRewindAnchorsPerSharingScopesData:(id)a3;
@end

@implementation CPLLibraryScopeChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problematicFormerSharedScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_rewindAnchorsPerSharingScopesData, 0);
}

- (void)setProblematicFormerSharedScopeIdentifier:(id)a3
{
}

- (NSString)problematicFormerSharedScopeIdentifier
{
  return self->_problematicFormerSharedScopeIdentifier;
}

- (void)setRewindAnchorsPerSharingScopesData:(id)a3
{
}

- (NSData)rewindAnchorsPerSharingScopesData
{
  return self->_rewindAnchorsPerSharingScopesData;
}

- (BOOL)hasProblematicFormerSharedScope
{
  v2 = [(CPLLibraryScopeChange *)self problematicFormerSharedScopeIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setRewindAnchorsPerSharingScopes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v11 = 0;
    v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;
    if (!v6)
    {
      if (!_CPLSilentLogging)
      {
        v8 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v13 = v5;
          __int16 v14 = 2112;
          id v15 = v7;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Failed to serialize %@ to NSData *rewindAnchorsPerSharingScopesData: %@", buf, 0x16u);
        }
      }
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m"];
      [v9 handleFailureInMethod:a2, self, v10, 360, @"Failed to serialize %@ to NSData *rewindAnchorsPerSharingScopesData: %@", v5, v7 object file lineNumber description];

      abort();
    }
    [(CPLLibraryScopeChange *)self setRewindAnchorsPerSharingScopesData:v6];
  }
  else
  {
    [(CPLLibraryScopeChange *)self setRewindAnchorsPerSharingScopesData:0];
  }
}

- (id)rewindAnchorsPerSharingScopes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CPLLibraryScopeChange *)self rewindAnchorsPerSharingScopesData];
  if (!v3)
  {
    v4 = 0;
    goto LABEL_15;
  }
  id v8 = 0;
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    if (_CPLSilentLogging)
    {
LABEL_13:
      v4 = 0;
      goto LABEL_14;
    }
    v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Failed to deserialize rewindAnchorsPerSharingScopesData for %@: %@", buf, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v6 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v10 = self;
        __int16 v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Invalid rewindAnchorsPerSharingScopesData for %@: %@", buf, 0x16u);
      }
    }
    goto LABEL_12;
  }
LABEL_14:

LABEL_15:
  return v4;
}

@end