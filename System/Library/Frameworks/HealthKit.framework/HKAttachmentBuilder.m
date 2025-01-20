@interface HKAttachmentBuilder
- (HKAttachmentBuilder)initWithAttachmentStore:(id)a3;
- (NSDictionary)attachmentMetadata;
- (NSDictionary)referenceMetadata;
- (NSString)name;
- (NSString)objectIdentifier;
- (NSString)schemaIdentifier;
- (NSURL)fileURL;
- (UTType)contentType;
- (void)finishWithCompletion:(id)a3;
- (void)setAttachmentMetadata:(id)a3;
- (void)setContentType:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setReferenceMetadata:(id)a3;
- (void)setSchemaIdentifier:(id)a3;
@end

@implementation HKAttachmentBuilder

- (HKAttachmentBuilder)initWithAttachmentStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKAttachmentBuilder;
  v6 = [(HKAttachmentBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attachmentStore, a3);
  }

  return v7;
}

- (void)finishWithCompletion:(id)a3
{
  contentType = self->_contentType;
  attachmentStore = self->_attachmentStore;
  name = self->_name;
  objectIdentifier = self->_objectIdentifier;
  schemaIdentifier = self->_schemaIdentifier;
  attachmentMetadata = self->_attachmentMetadata;
  referenceMetadata = self->_referenceMetadata;
  v11 = self->_fileURL;
  v12 = contentType;
  v13 = name;
  [(HKAttachmentStore *)attachmentStore addAttachmentWithName:v13 contentType:v12 URL:v11 toObjectWithIdentifier:objectIdentifier schemaIdentifier:schemaIdentifier attachmentMetadata:attachmentMetadata referenceMetadata:referenceMetadata completion:a3];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
}

- (NSDictionary)attachmentMetadata
{
  return self->_attachmentMetadata;
}

- (void)setAttachmentMetadata:(id)a3
{
}

- (NSDictionary)referenceMetadata
{
  return self->_referenceMetadata;
}

- (void)setReferenceMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceMetadata, 0);
  objc_storeStrong((id *)&self->_attachmentMetadata, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_attachmentStore, 0);
}

@end