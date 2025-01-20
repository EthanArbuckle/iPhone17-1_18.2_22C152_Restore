@interface _HMDNEHelperClientCacheEntry
- (NSArray)identifiers;
- (NSString)signingId;
- (_HMDNEHelperClientCacheEntry)initWithSigningId:(id)a3 identifiers:(id)a4;
@end

@implementation _HMDNEHelperClientCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_signingId, 0);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)signingId
{
  return self->_signingId;
}

- (_HMDNEHelperClientCacheEntry)initWithSigningId:(id)a3 identifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMDNEHelperClientCacheEntry;
  v9 = [(_HMDNEHelperClientCacheEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingId, a3);
    objc_storeStrong((id *)&v10->_identifiers, a4);
  }

  return v10;
}

@end