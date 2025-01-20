@interface IMSPIOutgoingAttachmentObject
- (BOOL)isSensitive;
- (IMSPIOutgoingAttachmentObject)initWithFileURL:(id)a3 isSensitive:(BOOL)a4;
- (NSString)fileURL;
- (void)setFileURL:(id)a3;
- (void)setIsSensitive:(BOOL)a3;
@end

@implementation IMSPIOutgoingAttachmentObject

- (IMSPIOutgoingAttachmentObject)initWithFileURL:(id)a3 isSensitive:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMSPIOutgoingAttachmentObject;
  v8 = [(IMSPIOutgoingAttachmentObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    v9->_isSensitive = a4;
  }

  return v9;
}

- (NSString)fileURL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void)setIsSensitive:(BOOL)a3
{
  self->_isSensitive = a3;
}

- (void).cxx_destruct
{
}

@end