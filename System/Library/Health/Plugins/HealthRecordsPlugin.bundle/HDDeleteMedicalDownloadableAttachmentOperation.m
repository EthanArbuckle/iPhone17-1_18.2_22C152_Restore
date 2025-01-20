@interface HDDeleteMedicalDownloadableAttachmentOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDDeleteMedicalDownloadableAttachmentOperation)initWithAttachmentIdentifier:(id)a3;
- (HDDeleteMedicalDownloadableAttachmentOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDeleteMedicalDownloadableAttachmentOperation

- (HDDeleteMedicalDownloadableAttachmentOperation)initWithAttachmentIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDeleteMedicalDownloadableAttachmentOperation;
  v5 = [(HDDeleteMedicalDownloadableAttachmentOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSUUID *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDMedicalDownloadableAttachmentEntity _deleteAttachmentWithIdentifier:self->_identifier profile:a3 error:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeleteMedicalDownloadableAttachmentOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  if (v5)
  {
    self = [(HDDeleteMedicalDownloadableAttachmentOperation *)self initWithAttachmentIdentifier:v5];
    v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end