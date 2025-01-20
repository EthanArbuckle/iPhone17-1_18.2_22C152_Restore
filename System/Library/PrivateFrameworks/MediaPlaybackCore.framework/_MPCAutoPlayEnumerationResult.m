@interface _MPCAutoPlayEnumerationResult
- (BOOL)isRemoved;
- (NSString)itemIdentifier;
- (NSString)sectionIdentifier;
- (_MPCAutoPlayEnumerationResult)initWithSectionIdentifier:(id)a3;
- (id)trackingEntryResult;
- (int64_t)branchDepth;
- (int64_t)entryType;
@end

@implementation _MPCAutoPlayEnumerationResult

- (void).cxx_destruct
{
}

- (BOOL)isRemoved
{
  return 0;
}

- (NSString)itemIdentifier
{
  return (NSString *)@"_PLACEHOLDER_AUTOPLAY_";
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (id)trackingEntryResult
{
  return 0;
}

- (int64_t)entryType
{
  return 3;
}

- (int64_t)branchDepth
{
  return 0;
}

- (_MPCAutoPlayEnumerationResult)initWithSectionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCAutoPlayEnumerationResult;
  v5 = [(_MPCAutoPlayEnumerationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v6;
  }
  return v5;
}

@end