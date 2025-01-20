@interface CPLStagingScopeChange
- (CPLScopeChange)stagedScopeChange;
- (NSData)stagedTransportScope;
- (int64_t)stagedScopeFlags;
- (void)setStagedScopeChange:(id)a3;
- (void)setStagedScopeFlags:(int64_t)a3;
- (void)setStagedTransportScope:(id)a3;
@end

@implementation CPLStagingScopeChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedTransportScope, 0);
  objc_storeStrong((id *)&self->_stagedScopeChange, 0);
}

- (void)setStagedScopeFlags:(int64_t)a3
{
  self->_stagedScopeFlags = a3;
}

- (int64_t)stagedScopeFlags
{
  return self->_stagedScopeFlags;
}

- (void)setStagedTransportScope:(id)a3
{
}

- (NSData)stagedTransportScope
{
  return self->_stagedTransportScope;
}

- (void)setStagedScopeChange:(id)a3
{
}

- (CPLScopeChange)stagedScopeChange
{
  return self->_stagedScopeChange;
}

@end