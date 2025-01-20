@interface HKClinicalDocumentIndexingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalDocumentIndexingResult)initWithAttachmentIdentifiers:(id)a3;
- (HKClinicalDocumentIndexingResult)initWithCoder:(id)a3;
- (NSArray)attachmentIdentifiers;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalDocumentIndexingResult

- (HKClinicalDocumentIndexingResult)initWithAttachmentIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalDocumentIndexingResult;
  v5 = [(HKClinicalDocumentIndexingResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attachmentIdentifiers = v5->_attachmentIdentifiers;
    v5->_attachmentIdentifiers = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKClinicalDocumentIndexingResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      attachmentIdentifiers = self->_attachmentIdentifiers;
      v8 = [(HKClinicalDocumentIndexingResult *)v6 attachmentIdentifiers];
      if (attachmentIdentifiers == v8)
      {
        char v12 = 1;
      }
      else
      {
        objc_super v9 = [(HKClinicalDocumentIndexingResult *)v6 attachmentIdentifiers];
        if (v9)
        {
          v10 = self->_attachmentIdentifiers;
          v11 = [(HKClinicalDocumentIndexingResult *)v6 attachmentIdentifiers];
          char v12 = [(NSArray *)v10 isEqualToArray:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_attachmentIdentifiers hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKClinicalDocumentIndexingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AttachmentIdentifiers"];
  if (v5)
  {
    self = [(HKClinicalDocumentIndexingResult *)self initWithAttachmentIdentifiers:v5];
    uint64_t v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSArray)attachmentIdentifiers
{
  return self->_attachmentIdentifiers;
}

- (void).cxx_destruct
{
}

@end