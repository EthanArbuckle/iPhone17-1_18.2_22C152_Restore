@interface CPLPrequeliteRemappedRecord
- (id)description;
@end

@implementation CPLPrequeliteRemappedRecord

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  scopedIdentifier = self->_scopedIdentifier;
  v5 = [(CPLScopedIdentifier *)self->_realScopedIdentifier identifier];
  id v6 = [v3 initWithFormat:@"[%@ -> %@]", scopedIdentifier, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
}

@end