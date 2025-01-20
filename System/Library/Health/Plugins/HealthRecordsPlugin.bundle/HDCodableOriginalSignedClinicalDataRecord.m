@interface HDCodableOriginalSignedClinicalDataRecord
- (id)asOriginalSignedClinicalDataRecord;
- (id)asTombstone;
@end

@implementation HDCodableOriginalSignedClinicalDataRecord

- (id)asOriginalSignedClinicalDataRecord
{
  id v3 = objc_alloc((Class)HDHRSOriginalSignedClinicalDataRecord);
  v4 = [(HDCodableOriginalSignedClinicalDataRecord *)self rawContent];
  id v5 = [(HDCodableOriginalSignedClinicalDataRecord *)self sourceType];
  v18 = [(HDCodableOriginalSignedClinicalDataRecord *)self sourceURL];
  v16 = +[NSURL URLWithString:v18];
  v15 = [(HDCodableOriginalSignedClinicalDataRecord *)self issuerIdentifier];
  v14 = [(HDCodableOriginalSignedClinicalDataRecord *)self types];
  v17 = [(HDCodableOriginalSignedClinicalDataRecord *)self syncIdentifier];
  v6 = +[NSUUID hk_UUIDWithData:v17];
  v7 = [(HDCodableOriginalSignedClinicalDataRecord *)self metadata];
  v8 = +[NSDictionary hk_dictionaryWithCodableMetadata:v7];
  [(HDCodableOriginalSignedClinicalDataRecord *)self receivedDate];
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = [(HDCodableOriginalSignedClinicalDataRecord *)self receivedDateTimeZoneName];
  v11 = +[NSTimeZone timeZoneWithName:v10];
  id v13 = objc_msgSend(v3, "initWithRawContent:sourceType:sourceURL:issuerIdentifier:credentialTypes:syncIdentifier:metadata:receivedDate:receivedDateTimeZone:signatureStatus:", v4, v5, v16, v15, v14, v6, v8, v9, v11, -[HDCodableOriginalSignedClinicalDataRecord signatureStatus](self, "signatureStatus"));

  return v13;
}

- (id)asTombstone
{
  id v2 = [(HDCodableOriginalSignedClinicalDataRecord *)self copy];
  [v2 setRawContent:0];
  id v3 = [v2 syncIdentifier];
  [v2 setUniquenessChecksum:v3];

  [v2 setDeleted:1];
  +[NSDate timeIntervalSinceReferenceDate];
  objc_msgSend(v2, "setLastModifiedDate:");

  return v2;
}

@end