@interface CRXFLitePrescriptionRecordFetchSummary
- (CRXFLitePrescriptionRecordFetchSummary)initWithHealthKitError:(id)a3 keychainError:(id)a4 healthRecordCount:(unint64_t)a5 asaKeyCount:(unint64_t)a6 calibrationDataDownloadFailureCount:(unint64_t)a7 meanCalibrationDataDownloadTime:(double)a8 totalFetchTime:(double)a9;
- (NSError)healthKitError;
- (NSError)keychainError;
- (double)meanCalibrationDataDownloadTime;
- (double)totalFetchTime;
- (unint64_t)asaKeyCount;
- (unint64_t)calibrationDataDownloadFailureCount;
- (unint64_t)healthRecordCount;
@end

@implementation CRXFLitePrescriptionRecordFetchSummary

- (CRXFLitePrescriptionRecordFetchSummary)initWithHealthKitError:(id)a3 keychainError:(id)a4 healthRecordCount:(unint64_t)a5 asaKeyCount:(unint64_t)a6 calibrationDataDownloadFailureCount:(unint64_t)a7 meanCalibrationDataDownloadTime:(double)a8 totalFetchTime:(double)a9
{
  id v17 = a3;
  id v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRXFLitePrescriptionRecordFetchSummary;
  v19 = [(CRXFLitePrescriptionRecordFetchSummary *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_healthKitError, a3);
    objc_storeStrong((id *)&v20->_keychainError, a4);
    v20->_healthRecordCount = a5;
    v20->_asaKeyCount = a6;
    v20->_calibrationDataDownloadFailureCount = a7;
    v20->_meanCalibrationDataDownloadTime = a8;
    v20->_totalFetchTime = a9;
  }

  return v20;
}

- (NSError)healthKitError
{
  return self->_healthKitError;
}

- (NSError)keychainError
{
  return self->_keychainError;
}

- (unint64_t)healthRecordCount
{
  return self->_healthRecordCount;
}

- (unint64_t)asaKeyCount
{
  return self->_asaKeyCount;
}

- (unint64_t)calibrationDataDownloadFailureCount
{
  return self->_calibrationDataDownloadFailureCount;
}

- (double)meanCalibrationDataDownloadTime
{
  return self->_meanCalibrationDataDownloadTime;
}

- (double)totalFetchTime
{
  return self->_totalFetchTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainError, 0);
  objc_storeStrong((id *)&self->_healthKitError, 0);
}

@end