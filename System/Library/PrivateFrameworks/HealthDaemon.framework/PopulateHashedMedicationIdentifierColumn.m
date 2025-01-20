@interface PopulateHashedMedicationIdentifierColumn
@end

@implementation PopulateHashedMedicationIdentifierColumn

__CFString *___PopulateHashedMedicationIdentifierColumn_block_invoke()
{
  return @"UPDATE medication_dose_event_samples_new SET hashed_medication_identifier = ? WHERE medication_identifier = ?";
}

void ___PopulateHashedMedicationIdentifierColumn_block_invoke_2(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F2B200]) initWithSemanticIdentifierString:*(void *)(a1 + 32)];
  v1 = [v2 underlyingIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
}

@end