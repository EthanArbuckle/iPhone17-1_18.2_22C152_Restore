@interface SMSToSuper_Default_Frame
- (void)_addAttachmentPartWithSource:(id)a3 toContext:(id)a4;
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation SMSToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SMSToSuper_Default_Frame;
  -[SMSToSuper_Default_Frame parser:context:foundCharacters:](&v5, "parser:context:foundCharacters:", a3, a4, objc_msgSend(a5, "stringByRemovingCharactersFromSet:", +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet")));
}

- (void)_addAttachmentPartWithSource:(id)a3 toContext:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "orderedParts"), "lastObject");
  if (!v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Unexpected lack of PART, creating one", (uint8_t *)&v10, 2u);
      }
    }
    id v5 = objc_alloc_init((Class)IMDSMSPart);
    [a4 _addPart:v5];
  }
  v7 = (void *)SMSCopySanitizedContentLocation();
  id v8 = [objc_alloc((Class)IMDSMSAttachmentPart) initWithContentLocation:v7];
  [v5 addAttachmentPart:v8];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Adding attachmentPart %@ to latestPart %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

@end