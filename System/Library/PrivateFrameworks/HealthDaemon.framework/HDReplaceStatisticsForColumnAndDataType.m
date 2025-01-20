@interface HDReplaceStatisticsForColumnAndDataType
@end

@implementation HDReplaceStatisticsForColumnAndDataType

__CFString *___HDReplaceStatisticsForColumnAndDataType_block_invoke()
{
  return @"INSERT OR REPLACE INTO workout_statistics (workout_activity_id, data_type, quantity) VALUES (?, ?, ?)";
}

uint64_t ___HDReplaceStatisticsForColumnAndDataType_block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  double v4 = *((double *)a1 + 6);

  return sqlite3_bind_double(a2, 3, v4);
}

@end