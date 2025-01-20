@interface _HDWorkoutCondenserAnalyticsAccumulator
- (_HDWorkoutCondenserAnalyticsAccumulator)init;
- (id)description;
@end

@implementation _HDWorkoutCondenserAnalyticsAccumulator

- (_HDWorkoutCondenserAnalyticsAccumulator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_HDWorkoutCondenserAnalyticsAccumulator;
  result = [(_HDWorkoutCondenserAnalyticsAccumulator *)&v3 init];
  if (result)
  {
    result->_hasProcessedWorkout = 0;
    *(_OWORD *)&result->_workoutsToCondense = 0u;
    *(_OWORD *)&result->_condensedWorkouts = 0u;
    *(_OWORD *)&result->_createdSeries = 0u;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_HDWorkoutCondenserAnalyticsAccumulator;
  v4 = [(_HDWorkoutCondenserAnalyticsAccumulator *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ workoutsToCondense (%ld) workoutsToRecondense (%ld) condensedWorkouts (%ld) processedWorkouts (%ld) createdSeries (%ld) deletedSamples (%ld)>", v4, self->_workoutsToCondense, self->_workoutsToRecondense, self->_condensedWorkouts, self->_processedWorkouts, self->_createdSeries, self->_deletedSamples];

  return v5;
}

@end