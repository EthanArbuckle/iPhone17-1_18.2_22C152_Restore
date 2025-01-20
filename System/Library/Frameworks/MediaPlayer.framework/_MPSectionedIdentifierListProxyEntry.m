@interface _MPSectionedIdentifierListProxyEntry
+ (id)endEntry;
+ (id)startEntry;
- (NSString)description;
- (id)itemResult;
- (id)trackingEntryResult;
- (int64_t)branchDepth;
- (int64_t)entryType;
@end

@implementation _MPSectionedIdentifierListProxyEntry

- (int64_t)entryType
{
  return self->_entryType;
}

+ (id)startEntry
{
  v2 = objc_alloc_init(_MPSectionedIdentifierListProxyEntry);
  v2->_entryType = 1;

  return v2;
}

+ (id)endEntry
{
  v2 = objc_alloc_init(_MPSectionedIdentifierListProxyEntry);
  v2->_entryType = 5;

  return v2;
}

- (int64_t)branchDepth
{
  return 0;
}

- (id)trackingEntryResult
{
  return 0;
}

- (id)itemResult
{
  return 0;
}

- (NSString)description
{
  unint64_t entryType = self->_entryType;
  if (entryType > 5) {
    v3 = 0;
  }
  else {
    v3 = off_1E57EEDE8[entryType];
  }
  return (NSString *)[NSString stringWithFormat:@"<%@: %p entryType=%@>", objc_opt_class(), self, v3];
}

@end