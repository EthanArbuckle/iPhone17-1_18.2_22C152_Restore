@interface MFMessageBody
- (BOOL)isEncrypted;
- (BOOL)isHTML;
- (BOOL)isRich;
- (id)attachmentURLs;
- (id)attachments;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6;
- (id)htmlContent;
- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)message;
- (id)rawData;
- (id)textHtmlPart;
- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4;
- (void)setMessage:(id)a3;
@end

@implementation MFMessageBody

- (void)setMessage:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_message, a3);
  _MFUnlockGlobalLock();
}

- (void).cxx_destruct
{
}

- (id)message
{
  return self->_message;
}

- (id)rawData
{
  return [(MFMessage *)self->_message bodyData];
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5
{
  return [(MFMessageBody *)self contentToOffset:a3 resultOffset:a4 asHTML:a5 isComplete:0];
}

- (id)htmlContentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return [(MFMessageBody *)self contentToOffset:a3 resultOffset:a4 asHTML:1];
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6
{
  return 0;
}

- (id)htmlContent
{
  return [(MFMessageBody *)self htmlContentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0];
}

- (BOOL)isHTML
{
  return 0;
}

- (BOOL)isRich
{
  return 0;
}

- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4
{
  return 0;
}

- (id)attachments
{
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AFB03000, v2, OS_LOG_TYPE_INFO, "[MFMessageBody attachments]", v4, 2u);
  }

  return 0;
}

- (id)attachmentURLs
{
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AFB03000, v2, OS_LOG_TYPE_INFO, "[MFMessageBody attachmentURLs]", v4, 2u);
  }

  return 0;
}

- (id)textHtmlPart
{
  return 0;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

@end