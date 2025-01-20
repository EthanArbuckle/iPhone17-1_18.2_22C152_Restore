@interface FPImportItemPendingScanningDisk
+ (BOOL)supportsSecureCoding;
- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration;
- (FPImportItemPendingScanningDisk)initWithCoder:(id)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes;
- (NSString)itemIdentifier;
- (id)json;
- (int64_t)itemPendingScanningDiskEnumerationStatus;
- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticAttributes:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3;
- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3;
@end

@implementation FPImportItemPendingScanningDisk

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"_itemIdentifier"];
  [v5 encodeObject:self->_diagnosticAttributes forKey:@"_diagnosticAttributes"];
  [v5 encodeInteger:self->_itemPendingScanningDiskEnumerationStatus forKey:@"_itemPendingScanningDiskEnumerationStatus"];
  [v5 encodeBool:self->_itemPendingScanningDiskHasMultiplePagesEnumeration forKey:@"_itemPendingScanningDiskHasMultiplePagesEnumeration"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingReconciliation"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation forKey:@"_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUp"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDown"];
  [v5 encodeInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingRejection forKey:@"_itemPendingScanningDiskNumberOfChildrenPendingRejection"];
}

- (FPImportItemPendingScanningDisk)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingScanningDisk;
  id v5 = [(FPImportItemPendingScanningDisk *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_diagnosticAttributes"];
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v8;

    v5->_itemPendingScanningDiskEnumerationStatus = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskEnumerationStatus"];
    v5->_itemPendingScanningDiskHasMultiplePagesEnumeration = [v4 decodeBoolForKey:@"_itemPendingScanningDiskHasMultiplePagesEnumeration"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingReconciliation"];
    v5->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncUp"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingSyncDown"];
    v5->_itemPendingScanningDiskNumberOfChildrenPendingRejection = [v4 decodeIntegerForKey:@"_itemPendingScanningDiskNumberOfChildrenPendingRejection"];
  }

  return v5;
}

- (id)json
{
  v3 = objc_opt_new();
  [v3 setObject:self->_itemIdentifier forKeyedSubscript:@"itemIdentifier"];
  id v4 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskEnumerationStatus];
  [v3 setObject:v4 forKeyedSubscript:@"itemPendingScanningDiskEnumerationStatus"];

  id v5 = [NSNumber numberWithBool:self->_itemPendingScanningDiskHasMultiplePagesEnumeration];
  [v3 setObject:v5 forKeyedSubscript:@"itemPendingScanningDiskHasMultiplePagesEnumeration"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation];
  [v3 setObject:v6 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingReconciliation"];

  v7 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation];
  [v3 setObject:v7 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion];
  [v3 setObject:v8 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"];

  v9 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion];
  [v3 setObject:v9 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"];

  v10 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent];
  [v3 setObject:v10 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"];

  objc_super v11 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp];
  [v3 setObject:v11 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUp"];

  v12 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent];
  [v3 setObject:v12 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"];

  v13 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown];
  [v3 setObject:v13 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDown"];

  v14 = [NSNumber numberWithInteger:self->_itemPendingScanningDiskNumberOfChildrenPendingRejection];
  [v3 setObject:v14 forKeyedSubscript:@"itemPendingScanningDiskNumberOfChildrenPendingRejection"];

  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
}

- (int64_t)itemPendingScanningDiskEnumerationStatus
{
  return self->_itemPendingScanningDiskEnumerationStatus;
}

- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3
{
  self->_itemPendingScanningDiskEnumerationStatus = a3;
}

- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
}

- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
}

- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end