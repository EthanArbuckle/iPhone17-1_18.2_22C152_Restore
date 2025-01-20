@interface IMDMSAAttachment
- (BOOL)hideAttachment;
- (BOOL)isOutgoing;
- (BOOL)isSticker;
- (IMDMSAAttachment)initWithAttachment:(_IMDAttachmentRecordStruct *)a3;
- (NSString)GUID;
- (NSString)UTIType;
- (NSString)mimeType;
- (NSString)path;
- (void)dealloc;
@end

@implementation IMDMSAAttachment

- (IMDMSAAttachment)initWithAttachment:(_IMDAttachmentRecordStruct *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMDMSAAttachment;
  v4 = [(IMDMSAAttachment *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      _IMDAttachmentRecordBulkCopy();
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDMSAAttachment;
  [(IMDMSAAttachment *)&v3 dealloc];
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)UTIType
{
  return self->_UTIType;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

@end