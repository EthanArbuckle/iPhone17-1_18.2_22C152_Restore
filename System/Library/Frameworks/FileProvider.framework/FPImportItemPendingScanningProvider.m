@interface FPImportItemPendingScanningProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration;
- (FPImportItemPendingScanningProvider)initWithCoder:(id)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes;
- (NSString)itemIdentifier;
- (id)json;
- (int64_t)itemPendingScanningProviderEnumerationStatus;
- (int64_t)itemPendingScanningProviderNumberOfChildren;
- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation;
- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation;
- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticAttributes:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3;
- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3;
- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3;
- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3;
- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3;
@end

@implementation FPImportItemPendingScanningProvider

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
  [v5 encodeInteger:self->_itemPendingScanningProviderEnumerationStatus forKey:@"_itemPendingScanningProviderEnumerationStatus"];
  [v5 encodeBool:self->_itemPendingScanningProviderHasMultiplePagesEnumeration forKey:@"_itemPendingScanningProviderHasMultiplePagesEnumeration"];
  [v5 encodeInteger:self->_itemPendingScanningProviderNumberOfChildren forKey:@"_itemPendingScanningProviderNumberOfChildren"];
  [v5 encodeInteger:self->_itemPendingScanningProviderNumberOfChildrenPendingCreation forKey:@"_itemPendingScanningProviderNumberOfChildrenPendingCreation"];
  [v5 encodeInteger:self->_itemPendingScanningProviderNumberOfChildrenFailingCreation forKey:@"_itemPendingScanningProviderNumberOfChildrenFailingCreation"];
  [v5 encodeInteger:self->_itemPendingScanningProviderRemovalOfDatalessBitStatus forKey:@"_itemPendingScanningProviderRemovalOfDatalessBitStatus"];
}

- (FPImportItemPendingScanningProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingScanningProvider;
  id v5 = [(FPImportItemPendingScanningProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_diagnosticAttributes"];
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v8;

    v5->_itemPendingScanningProviderEnumerationStatus = [v4 decodeIntegerForKey:@"_itemPendingScanningProviderEnumerationStatus"];
    v5->_itemPendingScanningProviderHasMultiplePagesEnumeration = [v4 decodeBoolForKey:@"_itemPendingScanningProviderHasMultiplePagesEnumeration"];
    v5->_itemPendingScanningProviderNumberOfChildren = [v4 decodeIntegerForKey:@"_itemPendingScanningProviderNumberOfChildren"];
    v5->_itemPendingScanningProviderNumberOfChildrenPendingCreation = [v4 decodeIntegerForKey:@"_itemPendingScanningProviderNumberOfChildrenPendingCreation"];
    v5->_itemPendingScanningProviderNumberOfChildrenFailingCreation = [v4 decodeIntegerForKey:@"_itemPendingScanningProviderNumberOfChildrenFailingCreation"];
    v5->_itemPendingScanningProviderRemovalOfDatalessBitStatus = [v4 decodeIntegerForKey:@"_itemPendingScanningProviderRemovalOfDatalessBitStatus"];
  }

  return v5;
}

- (id)json
{
  v3 = objc_opt_new();
  id v4 = [NSNumber numberWithInteger:self->_itemPendingScanningProviderEnumerationStatus];
  [v3 setObject:v4 forKeyedSubscript:@"itemPendingScanningProviderEnumerationStatus"];

  id v5 = [NSNumber numberWithBool:self->_itemPendingScanningProviderHasMultiplePagesEnumeration];
  [v3 setObject:v5 forKeyedSubscript:@"itemPendingScanningProviderHasMultiplePagesEnumeration"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_itemPendingScanningProviderNumberOfChildren];
  [v3 setObject:v6 forKeyedSubscript:@"itemPendingScanningProviderNumberOfChildren"];

  v7 = [NSNumber numberWithInteger:self->_itemPendingScanningProviderNumberOfChildrenPendingCreation];
  [v3 setObject:v7 forKeyedSubscript:@"itemPendingScanningProviderNumberOfChildrenPendingCreation"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_itemPendingScanningProviderNumberOfChildrenFailingCreation];
  [v3 setObject:v8 forKeyedSubscript:@"itemPendingScanningProviderNumberOfChildrenFailingCreation"];

  v9 = [NSNumber numberWithInteger:self->_itemPendingScanningProviderRemovalOfDatalessBitStatus];
  [v3 setObject:v9 forKeyedSubscript:@"itemPendingScanningProviderRemovalOfDatalessBitStatus"];

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

- (int64_t)itemPendingScanningProviderEnumerationStatus
{
  return self->_itemPendingScanningProviderEnumerationStatus;
}

- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3
{
  self->_itemPendingScanningProviderEnumerationStatus = a3;
}

- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
}

- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildren
{
  return self->_itemPendingScanningProviderNumberOfChildren;
}

- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildren = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
}

- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
}

- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = a3;
}

- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
}

- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3
{
  self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end