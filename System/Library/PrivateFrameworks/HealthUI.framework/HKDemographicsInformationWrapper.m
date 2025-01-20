@interface HKDemographicsInformationWrapper
- (HKBiologicalSexObject)biologicalSexObject;
- (HKBloodTypeObject)bloodTypeObject;
- (HKCardioFitnessMedicationsUseObject)cardioFitnessMedicationsUseObject;
- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeObject;
- (HKQuantity)heightQuantity;
- (HKQuantity)weightQuantity;
- (HKWheelchairUseObject)wheelchairUseObject;
- (NSArray)emailAddresses;
- (NSArray)postalAddresses;
- (NSDateComponents)dateOfBirthComponents;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (void)setBiologicalSexObject:(id)a3;
- (void)setBloodTypeObject:(id)a3;
- (void)setCardioFitnessMedicationsUseObject:(id)a3;
- (void)setDateOfBirthComponents:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFitzpatrickSkinTypeObject:(id)a3;
- (void)setHeightQuantity:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setPostalAddresses:(id)a3;
- (void)setWeightQuantity:(id)a3;
- (void)setWheelchairUseObject:(id)a3;
@end

@implementation HKDemographicsInformationWrapper

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
}

- (HKBiologicalSexObject)biologicalSexObject
{
  return self->_biologicalSexObject;
}

- (void)setBiologicalSexObject:(id)a3
{
}

- (HKQuantity)heightQuantity
{
  return self->_heightQuantity;
}

- (void)setHeightQuantity:(id)a3
{
}

- (HKQuantity)weightQuantity
{
  return self->_weightQuantity;
}

- (void)setWeightQuantity:(id)a3
{
}

- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeObject
{
  return self->_fitzpatrickSkinTypeObject;
}

- (void)setFitzpatrickSkinTypeObject:(id)a3
{
}

- (HKBloodTypeObject)bloodTypeObject
{
  return self->_bloodTypeObject;
}

- (void)setBloodTypeObject:(id)a3
{
}

- (HKWheelchairUseObject)wheelchairUseObject
{
  return self->_wheelchairUseObject;
}

- (void)setWheelchairUseObject:(id)a3
{
}

- (HKCardioFitnessMedicationsUseObject)cardioFitnessMedicationsUseObject
{
  return self->_cardioFitnessMedicationsUseObject;
}

- (void)setCardioFitnessMedicationsUseObject:(id)a3
{
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPostalAddresses:(id)a3
{
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_cardioFitnessMedicationsUseObject, 0);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeObject, 0);
  objc_storeStrong((id *)&self->_weightQuantity, 0);
  objc_storeStrong((id *)&self->_heightQuantity, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end