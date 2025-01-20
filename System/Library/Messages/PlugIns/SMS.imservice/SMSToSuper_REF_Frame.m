@interface SMSToSuper_REF_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation SMSToSuper_REF_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v13 = (void *)IMCopyNormalizedAttributes();
  id v14 = [v13 objectForKey:@"src"];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Found ref part with attributes: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a5;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "    element name: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a6;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "    namespaceURI: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a7;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "   qualifiedName: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  [(SMSToSuper_Default_Frame *)self _addAttachmentPartWithSource:v14 toContext:a4];
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v7 = objc_msgSend(objc_msgSend(a4, "orderedParts", a3), "lastObject");
  id v8 = objc_msgSend(objc_msgSend(v7, "attachmentParts"), "lastObject");
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Ending SMSPart(%@)'s attachmentPart: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

@end