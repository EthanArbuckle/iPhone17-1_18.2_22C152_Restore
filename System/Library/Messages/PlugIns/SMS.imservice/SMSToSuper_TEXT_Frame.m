@interface SMSToSuper_TEXT_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation SMSToSuper_TEXT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v12 = (void *)IMCopyNormalizedAttributes();
  id v13 = objc_msgSend(objc_msgSend(a4, "orderedParts"), "lastObject");
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Unexpected lack of PART, creating one", (uint8_t *)&v23, 2u);
      }
    }
    id v13 = objc_alloc_init((Class)IMDSMSPart);
    [a4 _addPart:v13];
  }
  [v12 objectForKey:@"src"];
  v15 = (void *)SMSCopySanitizedContentLocation();
  id v16 = [objc_alloc((Class)IMDSMSTextPart) initWithContentLocation:v15];
  [v13 addTextPart:v16];
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v12;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Found text part with attributes: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = a5;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "    element name: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = a6;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "    namespaceURI: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = a7;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "   qualifiedName: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v13;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "      latestPart: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "        textPart: %@", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  id v9 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "orderedParts"), "lastObject"), "textParts"), "lastObject");
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = (uint64_t)v9;
        __int16 v16 = 2112;
        uint64_t v17 = MarcoLoggingStringForMessageData();
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "CurrentTextPart %@ is eating found characters %@", buf, 0x16u);
      }
    }
    [v9 appendText:a5];
  }
  else
  {
    if (v10)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = MarcoLoggingStringForMessageData();
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "SMS text parser found unexpected characters without a corresponding textPart! %@", buf, 0xCu);
      }
    }
    v13.receiver = self;
    v13.super_class = (Class)SMSToSuper_TEXT_Frame;
    [(SMSToSuper_Default_Frame *)&v13 parser:a3 context:a4 foundCharacters:a5];
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v7 = objc_msgSend(objc_msgSend(a4, "orderedParts", a3), "lastObject");
  id v8 = objc_msgSend(objc_msgSend(v7, "textParts"), "lastObject");
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Ending SMSPart(%@)'s textPart: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

@end