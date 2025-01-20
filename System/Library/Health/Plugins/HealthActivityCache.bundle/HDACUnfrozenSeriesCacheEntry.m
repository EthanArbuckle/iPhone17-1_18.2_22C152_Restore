@interface HDACUnfrozenSeriesCacheEntry
- (BOOL)didFreeze;
- (BOOL)isConnectedGymSource;
- (BOOL)isWatchSource;
- (BOOL)typeIsValidForAllDayFromCompanion;
- (HDACUnfrozenSeriesCacheEntry)initWithSeriesId:(int64_t)a3 timestamp:(double)a4 dataTypeCode:(int64_t)a5 workoutSourceIdentifier:(int64_t)a6 sourceIdentifier:(int64_t)a7 isWatchSource:(BOOL)a8 isConnectedGymSource:(BOOL)a9 typeIsValidForAllDayFromCompanion:(BOOL)a10;
- (double)timestamp;
- (id)predicateForSeries;
- (int64_t)dataTypeCode;
- (int64_t)series_identifier;
- (int64_t)sourceIdentifier;
- (int64_t)workoutSourceIdentifier;
- (void)setFrozen;
- (void)setTimestamp:(double)a3;
@end

@implementation HDACUnfrozenSeriesCacheEntry

- (HDACUnfrozenSeriesCacheEntry)initWithSeriesId:(int64_t)a3 timestamp:(double)a4 dataTypeCode:(int64_t)a5 workoutSourceIdentifier:(int64_t)a6 sourceIdentifier:(int64_t)a7 isWatchSource:(BOOL)a8 isConnectedGymSource:(BOOL)a9 typeIsValidForAllDayFromCompanion:(BOOL)a10
{
  v18.receiver = self;
  v18.super_class = (Class)HDACUnfrozenSeriesCacheEntry;
  result = [(HDACUnfrozenSeriesCacheEntry *)&v18 init];
  if (result)
  {
    result->_series_identifier = a3;
    result->_timestamp = a4;
    result->_dataTypeCode = a5;
    result->_workoutSourceIdentifier = a6;
    result->_sourceIdentifier = a7;
    result->_isWatchSource = a8;
    result->_isConnectedGymSource = a9;
    result->_typeIsValidForAllDayFromCompanion = a10;
    *(_WORD *)&result->_hasTimestampBeenSet = 0;
  }
  return result;
}

- (void)setFrozen
{
  self->_didFreeze = 1;
}

- (void)setTimestamp:(double)a3
{
  if (self->_timestamp < a3) {
    self->_timestamp = a3;
  }
  self->_hasTimestampBeenSet = 1;
}

- (id)predicateForSeries
{
  v3 = +[NSNumber numberWithLongLong:self->_series_identifier];
  v4 = +[HDSQLiteComparisonPredicate predicateWithProperty:@"series_identifier" equalToValue:v3];

  BOOL hasTimestampBeenSet = self->_hasTimestampBeenSet;
  v6 = +[NSNumber numberWithDouble:self->_timestamp];
  if (hasTimestampBeenSet) {
    +[HDSQLiteComparisonPredicate predicateWithProperty:@"timestamp" greaterThanValue:v6];
  }
  else {
  v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:@"timestamp" greaterThanOrEqualToValue:v6];
  }

  v8 = +[HDSQLitePredicate compoundPredicateWithPredicate:v4 otherPredicate:v7];

  return v8;
}

- (int64_t)series_identifier
{
  return self->_series_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)dataTypeCode
{
  return self->_dataTypeCode;
}

- (int64_t)workoutSourceIdentifier
{
  return self->_workoutSourceIdentifier;
}

- (int64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)didFreeze
{
  return self->_didFreeze;
}

- (BOOL)isWatchSource
{
  return self->_isWatchSource;
}

- (BOOL)isConnectedGymSource
{
  return self->_isConnectedGymSource;
}

- (BOOL)typeIsValidForAllDayFromCompanion
{
  return self->_typeIsValidForAllDayFromCompanion;
}

@end