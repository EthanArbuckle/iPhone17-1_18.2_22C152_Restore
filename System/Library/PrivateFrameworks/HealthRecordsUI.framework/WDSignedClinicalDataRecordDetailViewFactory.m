@interface WDSignedClinicalDataRecordDetailViewFactory
+ (id)QRCodeViewControllerForSignedClinicalDataGroup:(id)a3;
+ (id)issuerDetailViewControllerForSignedClinicalDataGroup:(id)a3;
+ (id)multiRecordViewControllerForMedicalRecords:(id)a3 profile:(id)a4;
- (WDSignedClinicalDataRecordDetailViewFactory)init;
@end

@implementation WDSignedClinicalDataRecordDetailViewFactory

+ (id)issuerDetailViewControllerForSignedClinicalDataGroup:(id)a3
{
  id v3 = a3;
  v4 = _s15HealthRecordsUI41SignedClinicalDataRecordDetailViewFactoryC06issuerhI10Controller06signedeF5GroupSo06UIViewL0CSo08HKSignedefN0C_tFZ_0(v3);

  return v4;
}

+ (id)multiRecordViewControllerForMedicalRecords:(id)a3 profile:(id)a4
{
  sub_1C21AB51C(0, &qword_1EBB6F978);
  uint64_t v5 = sub_1C254F710();
  v6 = (objc_class *)type metadata accessor for SignedClinicalDataMultiRecordViewController();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_medicalRecords] = v5;
  *(void *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_profile] = a4;
  *(void *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups] = MEMORY[0x1E4FBC860];
  v11.receiver = v7;
  v11.super_class = v6;
  id v8 = a4;
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v11, sel_initWithUsingInsetStyling_, 1);
  if (result)
  {
    id v10 = result;

    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)QRCodeViewControllerForSignedClinicalDataGroup:(id)a3
{
  id v3 = a3;
  v4 = (void *)_s15HealthRecordsUI41SignedClinicalDataRecordDetailViewFactoryC06QRCodeI10Controller06signedeF5GroupSo06UIViewL0CSo08HKSignedefN0C_tFZ_0(v3);

  return v4;
}

- (WDSignedClinicalDataRecordDetailViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignedClinicalDataRecordDetailViewFactory();
  return [(WDSignedClinicalDataRecordDetailViewFactory *)&v3 init];
}

@end