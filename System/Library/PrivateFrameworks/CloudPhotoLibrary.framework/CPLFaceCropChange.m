@interface CPLFaceCropChange
+ (BOOL)supportsDeletion;
+ (BOOL)supportsDirectDeletion;
+ (Class)relatedRecordClass;
- (BOOL)validateChangeWithError:(id *)a3;
- (BOOL)validateFullRecord;
- (NSData)resourceData;
- (NSString)personIdentifier;
- (NSString)rejectedPersonIdentifier;
- (id)personScopedIdentifier;
- (id)propertiesDescription;
- (int64_t)faceCropType;
- (void)setFaceCropType:(int64_t)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setPersonScopedIdentifier:(id)a3;
- (void)setRejectedPersonIdentifier:(id)a3;
- (void)setResourceData:(id)a3;
@end

@implementation CPLFaceCropChange

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceData, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

- (void)setRejectedPersonIdentifier:(id)a3
{
}

- (NSString)rejectedPersonIdentifier
{
  return self->_rejectedPersonIdentifier;
}

- (void)setFaceCropType:(int64_t)a3
{
  self->_faceCropType = a3;
}

- (int64_t)faceCropType
{
  return self->_faceCropType;
}

- (void)setResourceData:(id)a3
{
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (id)propertiesDescription
{
  v3 = NSString;
  personIdentifier = self->_personIdentifier;
  NSUInteger v5 = [(NSData *)self->_resourceData length];
  v6 = _CPLShortDescriptionForFaceCropType(self->_faceCropType);
  v7 = [v3 stringWithFormat:@"person: %@ resource: %lub [%@]", personIdentifier, v5, v6];

  return v7;
}

- (BOOL)validateChangeWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPLFaceCropChange;
  BOOL v5 = -[CPLRecordChange validateChangeWithError:](&v9, sel_validateChangeWithError_);
  if (v5)
  {
    if (![(CPLRecordChange *)self hasChangeType:2])
    {
LABEL_5:
      LOBYTE(v5) = 1;
      return v5;
    }
    if (self->_personIdentifier)
    {
      if (self->_faceCropType) {
        goto LABEL_5;
      }
      if (a3)
      {
        v6 = @"%@ has no valid type";
        goto LABEL_10;
      }
    }
    else if (a3)
    {
      v6 = @"%@ has no person identifier";
LABEL_10:
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 18, v6, self);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)validateFullRecord
{
  v5.receiver = self;
  v5.super_class = (Class)CPLFaceCropChange;
  BOOL v3 = [(CPLRecordChange *)&v5 validateFullRecord];
  if (v3)
  {
    if (self->_personIdentifier) {
      LOBYTE(v3) = self->_faceCropType != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setPersonScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v5 = [v21 scopeIdentifier];
  v6 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v7 = [v6 scopeIdentifier];

  if (v5 && v7)
  {
    char v8 = [(id)v5 isEqual:v7];

    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        objc_super v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = NSStringFromSelector(a2);
          v11 = [(CPLRecordChange *)self scopedIdentifier];
          v12 = [v11 scopeIdentifier];
          v13 = [v21 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          __int16 v24 = 2112;
          v25 = v12;
          __int16 v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFaceCropChange.m"];
      v16 = NSStringFromSelector(a2);
      v17 = [(CPLRecordChange *)self scopedIdentifier];
      v18 = [v17 scopeIdentifier];
      v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 45, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [v21 identifier];
  [(CPLFaceCropChange *)self setPersonIdentifier:v20];
}

- (id)personScopedIdentifier
{
  BOOL v3 = [(CPLFaceCropChange *)self personIdentifier];
  if (v3)
  {
    v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

@end