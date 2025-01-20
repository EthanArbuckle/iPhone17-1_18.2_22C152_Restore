@interface HDInsertSerializedUDCLinkDataForConceptWithIdentifier
@end

@implementation HDInsertSerializedUDCLinkDataForConceptWithIdentifier

__CFString *___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke()
{
  return @"SELECT target_uuid, link_type FROM user_domain_concept_links WHERE udc_id = ? ORDER BY ROWID";
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F2B640]);
  v5 = MEMORY[0x1C1879F90](a2, 0);
  v6 = (void *)[v4 initWithTarget:v5 type:HDSQLiteColumnAsInt64()];

  [*(id *)(a1 + 32) addObject:v6];
  return 1;
}

__CFString *___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_4()
{
  return @"UPDATE user_domain_concepts SET link_collection_data = ? WHERE udc_id = ?";
}

uint64_t ___HDInsertSerializedUDCLinkDataForConceptWithIdentifier_block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

@end