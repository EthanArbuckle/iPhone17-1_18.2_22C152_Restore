@interface HDInsertAttachmentReferenceOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertAttachmentReferenceOperation)initWithCoder:(id)a3;
- (HDInsertAttachmentReferenceOperation)initWithReference:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertAttachmentReferenceOperation

- (HDInsertAttachmentReferenceOperation)initWithReference:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertAttachmentReferenceOperation;
  v5 = [(HDInsertAttachmentReferenceOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reference = v5->_reference;
    v5->_reference = (HDAttachmentReference *)v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v5 = +[HDAttachmentReferenceEntity _insertReference:self->_reference databaseTransaction:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertAttachmentReferenceOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachment_reference"];

  BOOL v6 = [(HDInsertAttachmentReferenceOperation *)self initWithReference:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end