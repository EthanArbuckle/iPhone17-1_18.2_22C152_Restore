@interface HDHeadphoneAudioExposureStatisticsSnapshot
- (BOOL)includesPrunableData;
- (HDHeadphoneAudioExposureStatisticsSnapshot)initWithStatistics:(id)a3 includesPrunableData:(BOOL)a4 previousNotificationDate:(id)a5;
- (HKStatistics)statistics;
- (NSDate)previousNotificationDate;
- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:(id)a3 error:(id *)a4;
@end

@implementation HDHeadphoneAudioExposureStatisticsSnapshot

- (HDHeadphoneAudioExposureStatisticsSnapshot)initWithStatistics:(id)a3 includesPrunableData:(BOOL)a4 previousNotificationDate:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDHeadphoneAudioExposureStatisticsBucket.m", 764, @"Invalid parameter not satisfying: %@", @"statistics" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HDHeadphoneAudioExposureStatisticsSnapshot;
  v12 = [(HDHeadphoneAudioExposureStatisticsSnapshot *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statistics, a3);
    v13->_includesPrunableData = a4;
    objc_storeStrong((id *)&v13->_previousNotificationDate, a5);
    v14 = v13;
  }

  return v13;
}

- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:(id)a3 error:(id *)a4
{
  return (id)[(HKStatistics *)self->_statistics unitTesting_hearingSevenDayDoseCategorySampleWithNow:a3 includesPrunableData:self->_includesPrunableData error:a4];
}

- (HKStatistics)statistics
{
  return self->_statistics;
}

- (BOOL)includesPrunableData
{
  return self->_includesPrunableData;
}

- (NSDate)previousNotificationDate
{
  return self->_previousNotificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousNotificationDate, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end