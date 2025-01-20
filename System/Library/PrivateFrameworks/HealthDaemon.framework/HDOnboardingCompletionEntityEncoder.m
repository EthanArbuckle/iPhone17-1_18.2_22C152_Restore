@interface HDOnboardingCompletionEntityEncoder
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation HDOnboardingCompletionEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v5 = objc_alloc_init(HDCodableOnboardingCompletion);
  v6 = HDSQLiteColumnWithNameAsUUID();
  v7 = objc_msgSend(v6, "hk_dataForUUIDBytes");
  [(HDCodableOnboardingCompletion *)v5 setUuid:v7];

  v8 = HDSQLiteColumnWithNameAsString();
  if (([v8 isEqualToString:&stru_1F1728D60] & 1) == 0) {
    [(HDCodableOnboardingCompletion *)v5 setFeatureIdentifier:v8];
  }
  uint64_t v9 = HDSQLiteColumnWithNameAsInt64();
  if (v9 >= 1) {
    [(HDCodableOnboardingCompletion *)v5 setVersion:v9];
  }
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableOnboardingCompletion setCompletionDate:](v5, "setCompletionDate:");
  v10 = HDSQLiteColumnWithNameAsString();
  [(HDCodableOnboardingCompletion *)v5 setCountryCode:v10];

  [(HDCodableOnboardingCompletion *)v5 setCountryCodeProvenance:HDSQLiteColumnWithNameAsInt64()];
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableOnboardingCompletion setModificationDate:](v5, "setModificationDate:");
  [(HDCodableOnboardingCompletion *)v5 setDeleted:HDSQLiteColumnWithNameAsBoolean()];

  return v5;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  return _OnboardingCompletionFromRow((uint64_t)a4, (uint64_t)a5);
}

@end