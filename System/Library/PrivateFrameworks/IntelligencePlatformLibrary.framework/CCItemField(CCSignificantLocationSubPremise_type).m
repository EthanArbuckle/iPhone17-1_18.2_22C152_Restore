@interface CCItemField(CCSignificantLocationSubPremise_type)
- (uint64_t)significantLocationSubPremiseType;
@end

@implementation CCItemField(CCSignificantLocationSubPremise_type)

- (uint64_t)significantLocationSubPremiseType
{
  LODWORD(result) = [a1 uint32Value];
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

@end