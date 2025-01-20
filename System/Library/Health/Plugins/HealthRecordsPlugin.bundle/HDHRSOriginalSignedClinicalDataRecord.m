@interface HDHRSOriginalSignedClinicalDataRecord
- (id)asNewCodableRecordWithRawDataUniquenessChecksumForUnitTestingWithSyncIdentity:(id)a3;
- (id)asNewCodableRecordWithUniquenessChecksum:(id)a3 syncIdentity:(id)a4;
@end

@implementation HDHRSOriginalSignedClinicalDataRecord

- (id)asNewCodableRecordWithRawDataUniquenessChecksumForUnitTestingWithSyncIdentity:(id)a3
{
  id v4 = a3;
  id v5 = +[HDOriginalSignedClinicalDataRecordEntity newCompatibleCodableSignedClinicalDataRecord];
  v6 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDate];
  [v6 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setFirstSeenDate:");

  v7 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDateTimeZone];
  v8 = [v7 name];
  [v5 setFirstSeenDateTimeZoneName:v8];

  v9 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDate];
  [v9 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setReceivedDate:");

  v10 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDateTimeZone];
  v11 = [v10 name];
  [v5 setReceivedDateTimeZoneName:v11];

  v12 = [(HDHRSOriginalSignedClinicalDataRecord *)self credentialTypes];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_330D0;
  v25[3] = &unk_112D30;
  id v13 = v5;
  id v26 = v13;
  [v12 enumerateObjectsUsingBlock:v25];

  objc_msgSend(v13, "setSignatureStatus:", -[HDHRSOriginalSignedClinicalDataRecord signatureStatus](self, "signatureStatus"));
  v14 = [(HDHRSOriginalSignedClinicalDataRecord *)self metadata];
  v15 = objc_msgSend(v14, "hk_codableMetadata");
  [v13 setMetadata:v15];

  v16 = [(HDHRSOriginalSignedClinicalDataRecord *)self rawContent];
  [v13 setRawContent:v16];

  v17 = [(HDHRSOriginalSignedClinicalDataRecord *)self rawContent];
  [v13 setUniquenessChecksum:v17];

  v18 = [(HDHRSOriginalSignedClinicalDataRecord *)self sourceURL];
  v19 = [v18 absoluteString];
  [v13 setSourceURL:v19];

  objc_msgSend(v13, "setSourceType:", -[HDHRSOriginalSignedClinicalDataRecord sourceType](self, "sourceType"));
  v20 = [(HDHRSOriginalSignedClinicalDataRecord *)self issuerIdentifier];
  [v13 setIssuerIdentifier:v20];

  v21 = [(HDHRSOriginalSignedClinicalDataRecord *)self syncIdentifier];
  v22 = objc_msgSend(v21, "hk_dataForUUIDBytes");
  [v13 setSyncIdentifier:v22];

  +[NSDate timeIntervalSinceReferenceDate];
  objc_msgSend(v13, "setLastModifiedDate:");
  [v13 setDeleted:0];
  if (v4)
  {
    v23 = [v4 codableSyncIdentity];
    [v13 setSyncIdentity:v23];
  }

  return v13;
}

- (id)asNewCodableRecordWithUniquenessChecksum:(id)a3 syncIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDHRSOriginalSignedClinicalDataRecord+HealthRecordsPlugin.m", 45, @"Invalid parameter not satisfying: %@", @"uniquenessChecksum" object file lineNumber description];
  }
  id v9 = +[HDOriginalSignedClinicalDataRecordEntity newCompatibleCodableSignedClinicalDataRecord];
  v10 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDate];
  [v10 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "setFirstSeenDate:");

  v11 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDateTimeZone];
  v12 = [v11 name];
  [v9 setFirstSeenDateTimeZoneName:v12];

  id v13 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDate];
  [v13 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "setReceivedDate:");

  v14 = [(HDHRSOriginalSignedClinicalDataRecord *)self receivedDateTimeZone];
  v15 = [v14 name];
  [v9 setReceivedDateTimeZoneName:v15];

  v16 = [(HDHRSOriginalSignedClinicalDataRecord *)self credentialTypes];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_33400;
  v29[3] = &unk_112D30;
  id v17 = v9;
  id v30 = v17;
  [v16 enumerateObjectsUsingBlock:v29];

  objc_msgSend(v17, "setSignatureStatus:", -[HDHRSOriginalSignedClinicalDataRecord signatureStatus](self, "signatureStatus"));
  v18 = [(HDHRSOriginalSignedClinicalDataRecord *)self metadata];
  v19 = objc_msgSend(v18, "hk_codableMetadata");
  [v17 setMetadata:v19];

  v20 = [(HDHRSOriginalSignedClinicalDataRecord *)self rawContent];
  [v17 setRawContent:v20];

  [v17 setUniquenessChecksum:v7];
  v21 = [(HDHRSOriginalSignedClinicalDataRecord *)self sourceURL];
  v22 = [v21 absoluteString];
  [v17 setSourceURL:v22];

  objc_msgSend(v17, "setSourceType:", -[HDHRSOriginalSignedClinicalDataRecord sourceType](self, "sourceType"));
  v23 = [(HDHRSOriginalSignedClinicalDataRecord *)self issuerIdentifier];
  [v17 setIssuerIdentifier:v23];

  v24 = [(HDHRSOriginalSignedClinicalDataRecord *)self syncIdentifier];
  v25 = objc_msgSend(v24, "hk_dataForUUIDBytes");
  [v17 setSyncIdentifier:v25];

  +[NSDate timeIntervalSinceReferenceDate];
  objc_msgSend(v17, "setLastModifiedDate:");
  [v17 setDeleted:0];
  id v26 = [v8 codableSyncIdentity];
  [v17 setSyncIdentity:v26];

  return v17;
}

@end