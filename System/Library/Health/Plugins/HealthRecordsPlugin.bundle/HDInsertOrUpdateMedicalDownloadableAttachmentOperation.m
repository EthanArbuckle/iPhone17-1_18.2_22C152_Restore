@interface HDInsertOrUpdateMedicalDownloadableAttachmentOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertOrUpdateMedicalDownloadableAttachmentOperation)initWithAttachment:(id)a3 shouldReplace:(BOOL)a4;
- (HDInsertOrUpdateMedicalDownloadableAttachmentOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertOrUpdateMedicalDownloadableAttachmentOperation

- (HDInsertOrUpdateMedicalDownloadableAttachmentOperation)initWithAttachment:(id)a3 shouldReplace:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertOrUpdateMedicalDownloadableAttachmentOperation;
  v7 = [(HDInsertOrUpdateMedicalDownloadableAttachmentOperation *)&v11 init];
  if (v7)
  {
    v8 = (HKMedicalDownloadableAttachment *)[v6 copy];
    attachment = v7->_attachment;
    v7->_attachment = v8;

    v7->_shouldReplace = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v5 = +[HDMedicalDownloadableAttachmentEntity _insertOrUpdateAttachment:self->_attachment shouldReplace:self->_shouldReplace databaseTransaction:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertOrUpdateMedicalDownloadableAttachmentOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Attachment"];
  if (v5 && ([v4 containsValueForKey:@"ShouldReplace"] & 1) != 0)
  {
    self = -[HDInsertOrUpdateMedicalDownloadableAttachmentOperation initWithAttachment:shouldReplace:](self, "initWithAttachment:shouldReplace:", v5, [v4 decodeBoolForKey:@"ShouldReplace"]);
    BOOL v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    BOOL v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  attachment = self->_attachment;
  id v5 = a3;
  [v5 encodeObject:attachment forKey:@"Attachment"];
  [v5 encodeBool:self->_shouldReplace forKey:@"ShouldReplace"];
}

- (void).cxx_destruct
{
}

@end