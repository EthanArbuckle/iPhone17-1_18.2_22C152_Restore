@interface SMSToSuper_PAR_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation SMSToSuper_PAR_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v12 = (void *)IMCopyNormalizedAttributes();
  id v13 = objc_alloc_init((Class)IMDSMSPart);
  [a4 _addPart:v13];
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v12;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Found PART with attributes: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a5;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "    element name: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a6;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "    namespaceURI: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = a7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "   qualifiedName: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "         smsPart: %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v7 = objc_msgSend(objc_msgSend(a4, "orderedParts", a3), "lastObject");
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Ending SMSPart: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

@end