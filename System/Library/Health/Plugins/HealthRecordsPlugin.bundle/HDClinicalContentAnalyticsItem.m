@interface HDClinicalContentAnalyticsItem
- (HDClinicalContentAnalyticsItem)initWithSourceURL:(id)a3 medicalRecord:(id)a4;
- (HKMedicalRecord)medicalRecord;
- (NSURL)sourceURL;
@end

@implementation HDClinicalContentAnalyticsItem

- (HDClinicalContentAnalyticsItem)initWithSourceURL:(id)a3 medicalRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalContentAnalyticsItem;
  v8 = [(HDClinicalContentAnalyticsItem *)&v14 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    sourceURL = v8->_sourceURL;
    v8->_sourceURL = v9;

    v11 = (HKMedicalRecord *)[v7 copy];
    medicalRecord = v8->_medicalRecord;
    v8->_medicalRecord = v11;
  }
  return v8;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalRecord, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end