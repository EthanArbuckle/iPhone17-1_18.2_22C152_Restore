@interface EDAddSearchableDataDetectionResultsTableUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddSearchableDataDetectionResultsTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"CREATE TABLE IF NOT EXISTS searchable_data_detection_results (ROWID INTEGER PRIMARY KEY, data_detection_result INTEGER, message INTEGER, transaction_id INTEGER NOT NULL);",
         @"Creating searchable_data_detection_results table");
  if (v4) {
    int v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"CREATE INDEX IF NOT EXISTS searchable_data_detection_results_message_index ON searchable_data_detection_results(message); CREATE INDEX searchable_data_detection_results_data_detection_result_index ON searchable_data_detection_results(data_detection_result);",
  }
           @"Unable to add searchable_data_detection_results_message_index");
  int v5 = v4 ^ 1;

  return v5;
}

@end