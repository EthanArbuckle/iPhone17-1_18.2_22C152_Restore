@interface _HDWorkoutCondensationConfiguration
+ (_HDWorkoutCondensationConfiguration)configurationWithProfile:(uint64_t)a1 minimumSeriesSize:(void *)a2 maximumSeriesSize:(int64_t)a3 deletedSampleThreshold:(int64_t)a4 analyticsAccumulator:(int64_t)a5 error:(void *)a6;
@end

@implementation _HDWorkoutCondensationConfiguration

+ (_HDWorkoutCondensationConfiguration)configurationWithProfile:(uint64_t)a1 minimumSeriesSize:(void *)a2 maximumSeriesSize:(int64_t)a3 deletedSampleThreshold:(int64_t)a4 analyticsAccumulator:(int64_t)a5 error:(void *)a6
{
  id v11 = a6;
  id v12 = a2;
  self;
  v13 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
  v14 = [_HDWorkoutCondensationConfiguration alloc];
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  if (v14)
  {
    v20.receiver = v14;
    v20.super_class = (Class)_HDWorkoutCondensationConfiguration;
    v18 = (_HDWorkoutCondensationConfiguration *)objc_msgSendSuper2(&v20, sel_init);
    v14 = v18;
    if (v18)
    {
      objc_storeWeak((id *)&v18->_profile, v15);
      objc_storeStrong((id *)&v14->_predicate, v13);
      v14->_minimumWorkoutDuration = 300.0;
      v14->_minimumSeriesSize = a3;
      v14->_maximumSeriesSize = a4;
      v14->_deletedSampleThreshold = a5;
      objc_storeStrong((id *)&v14->_analyticsAccumulator, a6);
    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsAccumulator, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end