@interface FPImportItemError
+ (BOOL)supportsSecureCoding;
- (FPImportItemError)initWithCoder:(id)a3;
- (FPImportItemError)initWithItemIdentifier:(id)a3 error:(id)a4 retryCount:(int64_t)a5;
- (NSError)error;
- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes;
- (NSString)itemIdentifier;
- (id)json;
- (int64_t)retryCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticAttributes:(id)a3;
@end

@implementation FPImportItemError

- (FPImportItemError)initWithItemIdentifier:(id)a3 error:(id)a4 retryCount:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPImportItemError;
  v11 = [(FPImportItemError *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemIdentifier, a3);
    objc_storeStrong((id *)&v12->_error, a4);
    v12->_retryCount = a5;
  }

  return v12;
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
  [v5 encodeObject:self->_error forKey:@"_error"];
  [v5 encodeInteger:self->_retryCount forKey:@"_retryCount"];
  [v5 encodeObject:self->_diagnosticAttributes forKey:@"_diagnosticAttributes"];
}

- (FPImportItemError)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPImportItemError;
  id v5 = [(FPImportItemError *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v5->_retryCount = [v4 decodeIntegerForKey:@"_retryCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_diagnosticAttributes"];
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v10;
  }
  return v5;
}

- (id)json
{
  v3 = objc_opt_new();
  [v3 setObject:self->_itemIdentifier forKeyedSubscript:@"itemIdentifier"];
  id v4 = [(NSError *)self->_error fp_prettyDescription];
  id v5 = [v4 description];
  [v3 setObject:v5 forKeyedSubscript:@"errorDescription"];

  uint64_t v6 = [(NSError *)self->_error domain];
  [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](self->_error, "code"));
  [v3 setObject:v7 forKeyedSubscript:@"errorCode"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_retryCount];
  [v3 setObject:v8 forKeyedSubscript:@"retryCount"];

  id v9 = [(NSError *)self->_error underlyingErrors];
  uint64_t v10 = [v9 firstObject];

  if (v10)
  {
    v11 = [v10 domain];
    [v3 setObject:v11 forKeyedSubscript:@"underlyingErrorDomain"];

    v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
    [v3 setObject:v12 forKeyedSubscript:@"underlyingErrorCode"];
  }

  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end