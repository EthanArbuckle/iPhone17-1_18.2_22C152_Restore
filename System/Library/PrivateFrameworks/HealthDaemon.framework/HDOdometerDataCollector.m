@interface HDOdometerDataCollector
- (BOOL)canResumeCollectionFromLastSensorDatum;
- (Class)coreMotionDatumClass;
- (HDOdometerDataCollector)initWithProfile:(id)a3 collectedDistanceType:(id)a4;
- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5;
- (id)collectedTypes;
- (id)persistentIdentifier;
- (id)queue_newDataSource;
- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3;
@end

@implementation HDOdometerDataCollector

- (HDOdometerDataCollector)initWithProfile:(id)a3 collectedDistanceType:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDOdometerDataCollector;
  v7 = [(HDCoreMotionDataCollector *)&v11 initWithProfile:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    distanceType = v7->_distanceType;
    v7->_distanceType = (HKQuantityType *)v8;
  }
  return v7;
}

- (id)collectedTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:self->_distanceType];
}

- (Class)coreMotionDatumClass
{
  return (Class)objc_opt_class();
}

- (id)queue_newDataSource
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F22240]);

  return v2;
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([a5 isEqual:self->_distanceType] & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDOdometerDataCollector.m", 55, @"Invalid parameter not satisfying: %@", @"[type isEqual:_distanceType]" object file lineNumber description];
  }
  objc_super v11 = objc_msgSend(v10, "hd_epochDatestamp");
  v12 = objc_msgSend(v9, "hd_epochDatestamp");
  int v13 = [v11 isEqualToDate:v12];

  v14 = objc_msgSend(v9, "hd_epochDatestamp");
  v15 = objc_msgSend(v9, "hd_datestamp");
  if ([v14 isEqualToDate:v15])
  {
  }
  else
  {
    v16 = objc_msgSend(v10, "hd_epochDatestamp");
    v17 = objc_msgSend(v10, "hd_datestamp");
    int v18 = [v16 isEqualToDate:v17];

    if (((v13 | v18) & 1) == 0)
    {
      [v10 deltaDistance];
      double v23 = v24;
      goto LABEL_10;
    }
  }
  [v10 deltaDistance];
  double v20 = v19;
  [v9 deltaDistance];
  double v22 = v20 - v21;
  if (v22 >= 0.0) {
    double v23 = v22;
  }
  else {
    double v23 = 0.0;
  }
LABEL_10:

  return v23;
}

- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_1BD32D9B0[a3];
  }
}

- (id)persistentIdentifier
{
  return (id)[NSString stringWithFormat:@"HDOdometerDataCollector.%@", self->_distanceType];
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return 0;
}

- (void).cxx_destruct
{
}

@end