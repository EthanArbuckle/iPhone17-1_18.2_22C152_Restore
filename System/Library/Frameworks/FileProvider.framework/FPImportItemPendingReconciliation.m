@interface FPImportItemPendingReconciliation
+ (BOOL)supportsSecureCoding;
- (BOOL)itemPendingReconciliationIsLocked;
- (BOOL)itemPendingReconciliationIsLockedInDB;
- (FPImportItemPendingReconciliation)initWithCoder:(id)a3;
- (FPImportItemPendingReconciliation)initWithItemIdentifier:(id)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes;
- (NSString)itemIdentifier;
- (id)json;
- (int64_t)itemPendingReconciliationJobBlockingCode;
- (int64_t)itemPendingReconciliationJobCode;
- (int64_t)itemPendingReconciliationJobSchedulingState;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticAttributes:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemPendingReconciliationIsLocked:(BOOL)a3;
- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3;
- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3;
- (void)setItemPendingReconciliationJobCode:(int64_t)a3;
- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3;
@end

@implementation FPImportItemPendingReconciliation

- (FPImportItemPendingReconciliation)initWithItemIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPImportItemPendingReconciliation;
  v6 = [(FPImportItemPendingReconciliation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemIdentifier, a3);
    v7->_itemPendingReconciliationIsLocked = 0;
    v7->_itemPendingReconciliationJobBlockingCode = -1;
  }

  return v7;
}

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
  [v5 encodeBool:self->_itemPendingReconciliationIsLocked forKey:@"_itemPendingReconciliationIsLocked"];
  [v5 encodeBool:self->_itemPendingReconciliationIsLockedInDB forKey:@"_itemPendingReconciliationIsLockedInDB"];
  [v5 encodeInteger:self->_itemPendingReconciliationJobCode forKey:@"_itemPendingReconciliationJobCode"];
  [v5 encodeInteger:self->_itemPendingReconciliationJobSchedulingState forKey:@"_itemPendingReconciliationJobSchedulingState"];
  [v5 encodeInteger:self->_itemPendingReconciliationJobBlockingCode forKey:@"_itemPendingReconciliationJobBlockingCode"];
}

- (FPImportItemPendingReconciliation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingReconciliation;
  id v5 = [(FPImportItemPendingReconciliation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_diagnosticAttributes"];
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v8;

    v5->_itemPendingReconciliationIsLocked = [v4 decodeBoolForKey:@"_itemPendingReconciliationIsLocked"];
    v5->_itemPendingReconciliationIsLockedInDB = [v4 decodeBoolForKey:@"_itemPendingReconciliationIsLockedInDB"];
    v5->_itemPendingReconciliationJobCode = [v4 decodeIntegerForKey:@"_itemPendingReconciliationJobCode"];
    v5->_itemPendingReconciliationJobSchedulingState = [v4 decodeIntegerForKey:@"_itemPendingReconciliationJobSchedulingState"];
    v5->_itemPendingReconciliationJobBlockingCode = [v4 decodeIntegerForKey:@"_itemPendingReconciliationJobBlockingCode"];
  }

  return v5;
}

- (id)json
{
  v3 = objc_opt_new();
  [v3 setObject:self->_itemIdentifier forKeyedSubscript:@"itemIdentifier"];
  id v4 = [NSNumber numberWithBool:self->_itemPendingReconciliationIsLocked];
  [v3 setObject:v4 forKeyedSubscript:@"itemPendingReconciliationIsLocked"];

  id v5 = [NSNumber numberWithBool:self->_itemPendingReconciliationIsLockedInDB];
  [v3 setObject:v5 forKeyedSubscript:@"itemPendingReconciliationIsLockedInDB"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_itemPendingReconciliationJobCode];
  [v3 setObject:v6 forKeyedSubscript:@"itemPendingReconciliationJobCode"];

  v7 = [NSNumber numberWithInteger:self->_itemPendingReconciliationJobSchedulingState];
  [v3 setObject:v7 forKeyedSubscript:@"itemPendingReconciliationJobSchedulingState"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_itemPendingReconciliationJobBlockingCode];
  [v3 setObject:v8 forKeyedSubscript:@"itemPendingReconciliationJobBlockingCode"];

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

- (BOOL)itemPendingReconciliationIsLocked
{
  return self->_itemPendingReconciliationIsLocked;
}

- (void)setItemPendingReconciliationIsLocked:(BOOL)a3
{
  self->_itemPendingReconciliationIsLocked = a3;
}

- (BOOL)itemPendingReconciliationIsLockedInDB
{
  return self->_itemPendingReconciliationIsLockedInDB;
}

- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  self->_itemPendingReconciliationIsLockedInDB = a3;
}

- (int64_t)itemPendingReconciliationJobCode
{
  return self->_itemPendingReconciliationJobCode;
}

- (void)setItemPendingReconciliationJobCode:(int64_t)a3
{
  self->_itemPendingReconciliationJobCode = a3;
}

- (int64_t)itemPendingReconciliationJobSchedulingState
{
  return self->_itemPendingReconciliationJobSchedulingState;
}

- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3
{
  self->_itemPendingReconciliationJobSchedulingState = a3;
}

- (int64_t)itemPendingReconciliationJobBlockingCode
{
  return self->_itemPendingReconciliationJobBlockingCode;
}

- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3
{
  self->_itemPendingReconciliationJobBlockingCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end