@interface FamilyInfoLookupResult
- (id)description;
@end

@implementation FamilyInfoLookupResult

- (id)description
{
  familyMembers = self;
  if (self)
  {
    BOOL cached = self->_cached;
    familyMembers = self->_familyMembers;
  }
  else
  {
    BOOL cached = 0;
  }
  return +[NSString stringWithFormat:@"{ cached: %d familyMembers: %@ }", cached, familyMembers];
}

- (void).cxx_destruct
{
}

@end