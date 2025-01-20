@interface HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria
+ (BOOL)supportsSecureCoding;
+ (id)criteriaIdentifier;
- (BOOL)isEqual:(id)a3;
- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCodableNotificationInstructionCriteria:(id)a3;
- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCoder:(id)a3;
- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithMessageDictionary:(id)a3;
- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithUUID:(id)a3 modificationDate:(id)a4;
- (id)_initWithUUID:(void *)a3 modificationDate:;
- (id)_initWithUUIDString:(void *)a3 modificationTimeInterval:;
- (id)codableCriteria;
- (id)description;
- (id)messageDictionary;
- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria

+ (id)criteriaIdentifier
{
  return @"HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria";
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 1;
  v7 = [v6 protectedDatabase];
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 6, @"Protected database is inaccessible");
    goto LABEL_5;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2;
  v12[3] = &unk_1E6337B30;
  v12[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3;
  v11[3] = &unk_1E63380A8;
  v11[4] = &v13;
  if (![v7 executeCachedStatementForKey:&isValidWithDatabaseTransaction_error__lookupKey error:a4 SQLGenerator:&__block_literal_global_14 bindingHandler:v12 enumerationHandler:v11])
  {
LABEL_5:
    int64_t v9 = 0;
    goto LABEL_6;
  }
  int64_t v9 = v14[3];
LABEL_6:

  _Block_object_dispose(&v13, 8);
  return v9;
}

id __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke()
{
  v0 = NSString;
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? AND %@ >= ? LIMIT 1", v1, @"uuid", @"creation_date"];

  return v2;
}

uint64_t __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_2()
{
  HDSQLiteBindFoundationValueToStatement();
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __113__HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria_isValidWithDatabaseTransaction_error___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
  return 0;
}

- (id)_initWithUUIDString:(void *)a3 modificationTimeInterval:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  id v8 = 0;
  if (a1 && v5 && v6)
  {
    int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    v10 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
    a1 = -[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUID:modificationDate:](a1, v9, v11);

    id v8 = a1;
  }

  return v8;
}

- (id)_initWithUUID:(void *)a3 modificationDate:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  id v8 = 0;
  if (a1 && v5 && v6)
  {
    a1 = (id)[a1 initWithUUID:v5 modificationDate:v6];
    id v8 = a1;
  }

  return v8;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithUUID:(id)a3 modificationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  id v8 = [(HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    modificationDate = v8->_modificationDate;
    v8->_modificationDate = (NSDate *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  if ([(HDNotificationInstructionCriteria *)&v12 isEqual:v4])
  {
    id v5 = v4;
    UUID = self->_UUID;
    id v7 = (NSUUID *)v5[1];
    if (UUID != v7 && (!v7 || !-[NSUUID isEqual:](UUID, "isEqual:"))) {
      goto LABEL_9;
    }
    modificationDate = self->_modificationDate;
    uint64_t v9 = (NSDate *)v5[2];
    if (modificationDate == v9)
    {
      char v10 = 1;
      goto LABEL_11;
    }
    if (v9) {
      char v10 = -[NSDate isEqual:](modificationDate, "isEqual:");
    }
    else {
LABEL_9:
    }
      char v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  unint64_t v3 = [(HDNotificationInstructionCriteria *)&v6 hash];
  uint64_t v4 = [(NSUUID *)self->_UUID hash] ^ v3;
  return v4 ^ [(NSDate *)self->_modificationDate hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %@ mtime:%@>", objc_opt_class(), self->_UUID, self->_modificationDate];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];

  id v7 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUID:modificationDate:](self, v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hk_safeStringForKeyPath:error:", @"UUID", 0);
  objc_super v6 = objc_msgSend(v4, "hk_safeNumberForKeyPath:error:", @"ModificationDate", 0);

  id v7 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUIDString:modificationTimeInterval:](self, v5, v6);
  return v7;
}

- (id)messageDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  unint64_t v3 = [(HDNotificationInstructionCriteria *)&v10 messageDictionary];
  v11[0] = @"UUID";
  id v4 = [(NSUUID *)self->_UUID UUIDString];
  v11[1] = @"ModificationDate";
  v12[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  [(NSDate *)self->_modificationDate timeIntervalSinceReferenceDate];
  objc_super v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v8 = objc_msgSend(v3, "hk_dictionaryByAddingEntriesFromDictionary:", v7);

  return v8;
}

- (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  id v4 = a3;
  if ([v4 hasUUIDString])
  {
    id v5 = [v4 uUIDString];
  }
  else
  {
    id v5 = 0;
  }
  if ([v4 hasModificationTimeInterval])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28ED0];
    [v4 modificationTimeInterval];
    id v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    id v7 = 0;
  }
  id v8 = (HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)-[HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria _initWithUUIDString:modificationTimeInterval:](self, v5, v7);

  return v8;
}

- (id)codableCriteria
{
  v6.receiver = self;
  v6.super_class = (Class)HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria;
  unint64_t v3 = [(HDNotificationInstructionCriteria *)&v6 codableCriteria];
  id v4 = [(NSUUID *)self->_UUID UUIDString];
  [v3 setUUIDString:v4];

  [(NSDate *)self->_modificationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setModificationTimeInterval:");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end