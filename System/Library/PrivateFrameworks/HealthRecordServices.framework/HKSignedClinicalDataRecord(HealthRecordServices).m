@interface HKSignedClinicalDataRecord(HealthRecordServices)
- (void)copyWithItems:()HealthRecordServices;
@end

@implementation HKSignedClinicalDataRecord(HealthRecordServices)

- (void)copyWithItems:()HealthRecordServices
{
  id v4 = a3;
  v22 = objc_opt_class();
  v28 = [MEMORY[0x263F0A758] signedClinicalDataRecordType];
  v27 = [a1 note];
  unsigned int v21 = [a1 enteredInError];
  v20 = [a1 modifiedDate];
  v19 = [a1 originIdentifier];
  v18 = [a1 locale];
  uint64_t v17 = [a1 extractionVersion];
  v26 = [a1 device];
  v25 = [a1 metadata];
  v16 = [a1 sortDate];
  v24 = [a1 country];
  uint64_t v15 = [a1 state];
  v14 = [a1 credentialTypes];
  v13 = [a1 issuerIdentifier];
  v12 = [a1 issuedDate];
  v5 = [a1 relevantDate];
  v6 = [a1 expirationDate];
  uint64_t v7 = [a1 signatureStatus];
  v8 = [a1 subject];
  v9 = [a1 dataValue];
  objc_msgSend(v22, "signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:", v28, v27, v21, v20, v19, v18, v17, v26, v25, v16, v24, v15, v14, v13, v12,
    v5,
    v6,
    v7,
    v8,
    v4,
    v9,
  v23 = [a1 sourceType]);

  v10 = [a1 UUID];
  [v23 _setUUID:v10];

  return v23;
}

@end