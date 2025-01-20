@interface NSFileProviderDiagnosticAttributesDescriptor
+ (BOOL)supportsSecureCoding;
- (NSDictionary)diagnosticAttributes;
- (NSError)error;
- (NSFileProviderDiagnosticAttributesDescriptor)initWithCoder:(id)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)initWithDocID:(unsigned int)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)initWithFileID:(unint64_t)a3;
- (NSFileProviderDiagnosticAttributesDescriptor)initWithItemID:(id)a3;
- (NSString)itemID;
- (unint64_t)fileID;
- (unsigned)docID;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticAttributes:(id)a3;
- (void)setError:(id)a3;
@end

@implementation NSFileProviderDiagnosticAttributesDescriptor

- (NSFileProviderDiagnosticAttributesDescriptor)initWithDocID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  result = [(NSFileProviderDiagnosticAttributesDescriptor *)&v5 init];
  if (result) {
    result->_docID = a3;
  }
  return result;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithFileID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  result = [(NSFileProviderDiagnosticAttributesDescriptor *)&v5 init];
  if (result) {
    result->_fileID = a3;
  }
  return result;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithItemID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  v6 = [(NSFileProviderDiagnosticAttributesDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  id v5 = [(NSFileProviderDiagnosticAttributesDescriptor *)&v17 init];
  if (v5)
  {
    v5->_docID = [v4 decodeInt32ForKey:@"_docID"];
    v5->_fileID = [v4 decodeInt64ForKey:@"_fileID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_diagnosticAttributes"];
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t docID = self->_docID;
  id v5 = a3;
  [v5 encodeInt32:docID forKey:@"_docID"];
  [v5 encodeInt64:self->_fileID forKey:@"_fileID"];
  [v5 encodeObject:self->_itemID forKey:@"_itemID"];
  [v5 encodeObject:self->_diagnosticAttributes forKey:@"_diagnosticAttributes"];
  [v5 encodeObject:self->_error forKey:@"_error"];
}

- (unsigned)docID
{
  return self->_docID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSDictionary)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end