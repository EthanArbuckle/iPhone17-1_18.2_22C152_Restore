@interface NSCoder(VNPersonsModel)
- (id)vn_decodePersonUniqueIdentifierForKey:()VNPersonsModel;
@end

@implementation NSCoder(VNPersonsModel)

- (id)vn_decodePersonUniqueIdentifierForKey:()VNPersonsModel
{
  id v4 = a3;
  v5 = VNEntityUniqueIdentifierClasses();
  v6 = [a1 decodeObjectOfClasses:v5 forKey:v4];

  return v6;
}

@end