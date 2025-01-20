@interface MFAttachmentMarkup
+ (id)attachmentMarkupWithProperties:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6 contextID:(id)a7;
- (NSData)attachmentData;
- (NSString)contentID;
- (NSString)contextID;
- (NSString)filename;
- (NSString)mimeType;
- (void)setAttachmentData:(id)a3;
- (void)setContentID:(id)a3;
- (void)setContextID:(id)a3;
- (void)setFilename:(id)a3;
- (void)setMimeType:(id)a3;
@end

@implementation MFAttachmentMarkup

+ (id)attachmentMarkupWithProperties:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6 contextID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_alloc_init(MFAttachmentMarkup);
  [(MFAttachmentMarkup *)v16 setAttachmentData:v11];
  [(MFAttachmentMarkup *)v16 setContentID:v12];
  [(MFAttachmentMarkup *)v16 setMimeType:v13];
  [(MFAttachmentMarkup *)v16 setFilename:v14];
  [(MFAttachmentMarkup *)v16 setContextID:v15];

  return v16;
}

- (NSData)attachmentData
{
  return self->_attachmentData;
}

- (void)setAttachmentData:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_contentID, 0);

  objc_storeStrong((id *)&self->_attachmentData, 0);
}

@end