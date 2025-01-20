@interface _HKSharedSummaryQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKSharedSummaryTransaction)transaction;
- (NSSet)includedIdentifiers;
- (NSSet)includedObjectTypes;
- (NSString)package;
- (_HKSharedSummaryQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludedIdentifiers:(id)a3;
- (void)setIncludedObjectTypes:(id)a3;
- (void)setPackage:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation _HKSharedSummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setTransaction:self->_transaction];
  [v4 setPackage:self->_package];
  [v4 setIncludedIdentifiers:self->_includedIdentifiers];
  [v4 setIncludedObjectTypes:self->_includedObjectTypes];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSharedSummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transaction"];
    transaction = v5->_transaction;
    v5->_transaction = (HKSharedSummaryTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"package"];
    package = v5->_package;
    v5->_package = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"included-identifiers"];
    includedIdentifiers = v5->_includedIdentifiers;
    v5->_includedIdentifiers = (NSSet *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"included-objecttypes"];
    includedObjectTypes = v5->_includedObjectTypes;
    v5->_includedObjectTypes = (NSSet *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, @"transaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_package forKey:@"package"];
  [v4 encodeObject:self->_includedIdentifiers forKey:@"included-identifiers"];
  [v4 encodeObject:self->_includedObjectTypes forKey:@"included-objecttypes"];
}

- (HKSharedSummaryTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
}

- (NSSet)includedIdentifiers
{
  return self->_includedIdentifiers;
}

- (void)setIncludedIdentifiers:(id)a3
{
}

- (NSSet)includedObjectTypes
{
  return self->_includedObjectTypes;
}

- (void)setIncludedObjectTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end