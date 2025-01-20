@interface GDPersonRankingServiceConfiguration
- (GDPersonRankingServiceConfiguration)init;
- (GDPersonRankingServiceConfiguration)initWithIsFavoriteMultiplier:(double)a3 emergencyContactMultiplier:(double)a4 iCloudFamilyMemberMultiplier:(double)a5 relationshipTagMultplier:(double)a6;
- (double)emergencyContactMultiplier;
- (double)iCloudFamilyMemberMultiplier;
- (double)isFavoriteMultiplier;
- (double)relationshipTagMultiplier;
@end

@implementation GDPersonRankingServiceConfiguration

- (double)relationshipTagMultiplier
{
  return self->_relationshipTagMultiplier;
}

- (double)iCloudFamilyMemberMultiplier
{
  return self->_iCloudFamilyMemberMultiplier;
}

- (double)emergencyContactMultiplier
{
  return self->_emergencyContactMultiplier;
}

- (double)isFavoriteMultiplier
{
  return self->_isFavoriteMultiplier;
}

- (GDPersonRankingServiceConfiguration)init
{
  return (GDPersonRankingServiceConfiguration *)((uint64_t (*)(GDPersonRankingServiceConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_initWithIsFavoriteMultiplier_emergencyContactMultiplier_iCloudFamilyMemberMultiplier_relationshipTagMultplier_);
}

- (GDPersonRankingServiceConfiguration)initWithIsFavoriteMultiplier:(double)a3 emergencyContactMultiplier:(double)a4 iCloudFamilyMemberMultiplier:(double)a5 relationshipTagMultplier:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)GDPersonRankingServiceConfiguration;
  result = [(GDPersonRankingServiceConfiguration *)&v11 init];
  if (result)
  {
    result->_isFavoriteMultiplier = a3;
    result->_emergencyContactMultiplier = a4;
    result->_iCloudFamilyMemberMultiplier = a5;
    result->_relationshipTagMultiplier = a6;
  }
  return result;
}

@end