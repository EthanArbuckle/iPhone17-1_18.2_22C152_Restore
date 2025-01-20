@interface LegacySuperToSMSRelayMessageParser
- (BOOL)isSimpleString;
- (BOOL)shouldPreprocess;
- (LegacySuperToSMSRelayMessageParser)initWithAttributedString:(id)a3;
- (NSString)outHTML;
- (id)name;
- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parserDidEnd:(id)a3;
- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4;
@end

@implementation LegacySuperToSMSRelayMessageParser

- (LegacySuperToSMSRelayMessageParser)initWithAttributedString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LegacySuperToSMSRelayMessageParser;
  v3 = [(LegacySuperToSMSRelayMessageParser *)&v5 initWithAttributedString:a3];
  if (v3)
  {
    v3->_outHTML = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    v3->_isSimpleString = 1;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LegacySuperToSMSRelayMessageParser;
  [(LegacySuperToSMSRelayMessageParser *)&v3 dealloc];
}

- (id)name
{
  return @"SuperToMessage";
}

- (id)resultsForLogging
{
  return +[NSArray arrayWithObjects:@"outHTML", 0];
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  [(NSMutableString *)self->_outHTML appendString:@"<html>"];
  [(NSMutableString *)self->_outHTML appendString:@"<body"];
  id v11 = objc_alloc_init((Class)NSMutableString);
  id v6 = [a4 objectForKey:IMMessageBackgroundColorAttributeName];
  if (v6) {
    [v11 appendFormat:@"background-color:%@;", v6];
  }
  id v7 = [a4 objectForKey:IMMessageForegroundColorAttributeName];
  if (v7) {
    [v11 appendFormat:@"color:%@;", v7];
  }
  if ([v11 length]) {
    [(NSMutableString *)self->_outHTML appendFormat:@" style=\"%@\"", v11];
  }
  id v8 = [a4 objectForKey:IMBaseWritingDirectionAttributeName];
  if (v8)
  {
    v9 = (char *)[v8 integerValue];
    if (v9 == (unsigned char *)&dword_0 + 1)
    {
      CFStringRef v10 = @" dir=\"rtl\"";
    }
    else
    {
      if (v9) {
        goto LABEL_13;
      }
      CFStringRef v10 = @" dir=\"ltr\"";
    }
    [(NSMutableString *)self->_outHTML appendString:v10];
  }
LABEL_13:
  [(NSMutableString *)self->_outHTML appendString:@">"];
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  id v8 = [a4 _stringForKey:IMBackgroundColorAttributeName];
  id v24 = [a4 _stringForKey:IMForegroundColorAttributeName];
  id v9 = [a4 _stringForKey:IMFontFamilyAttributeName];
  id v23 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMFontSizeAttributeName), "integerValue");
  unsigned int v22 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMUnderlineAttributeName), "BOOLValue");
  unsigned int v21 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMBoldAttributeName), "BOOLValue");
  unsigned int v10 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMItalicAttributeName), "BOOLValue");
  unsigned int v11 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMStrikethroughAttributeName), "BOOLValue");
  id v12 = [a4 objectForKey:IMLinkAttributeName];
  id v25 = objc_alloc_init((Class)NSMutableString);
  if (v12)
  {
    [v12 absoluteString];
    id v13 = v9;
    v14 = (void *)IMCreateEscapedAttributeValueFromString();
    [(NSMutableString *)self->_outHTML appendString:@"<a href=\""];
    [(NSMutableString *)self->_outHTML appendString:v14];
    [(NSMutableString *)self->_outHTML appendString:@"\">"];

    id v9 = v13;
  }
  if (v21) {
    [v25 appendString:@"font-weight: bold;"];
  }
  if (v10) {
    [v25 appendString:@"font-style: italic;"];
  }
  if ((v22 | v11) == 1)
  {
    if (v22) {
      CFStringRef v15 = @"text-decoration: underline;";
    }
    else {
      CFStringRef v15 = @"text-decoration: line-through;";
    }
    [v25 appendString:v15];
  }
  if ([v9 length])
  {
    v16 = (void *)IMCopySafeNameOfFontFamilyName();
    v17 = (void *)IMCreateEscapedAttributeValueFromString();
    [v25 appendFormat:@"font-family: '%@';", v17];
  }
  if (v23) {
    objc_msgSend(v25, "appendFormat:", @"font-size: %dpx;", v23);
  }
  if ([v24 length]) {
    [v25 appendFormat:@"color: %@;", v24];
  }
  id v18 = [v8 length];
  v19 = v25;
  if (v18)
  {
    [v25 appendFormat:@"background-color: %@;", v8];
    v19 = v25;
  }
  if ([v19 length])
  {
    [(NSMutableString *)self->_outHTML appendString:@"<span style=\""];
    [(NSMutableString *)self->_outHTML appendString:v25];
    [(NSMutableString *)self->_outHTML appendString:@"\">"];
  }
  v20 = (void *)IMCreateEscapedStringFromString();
  if (v20) {
    [(NSMutableString *)self->_outHTML appendString:v20];
  }

  if ([v25 length]) {
    [(NSMutableString *)self->_outHTML appendString:@"</span>"];
  }
  if (v12) {
    [(NSMutableString *)self->_outHTML appendString:@"</a>"];
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  if (a9) {
    unsigned int v11 = (_UNKNOWN **)a9;
  }
  else {
    unsigned int v11 = &off_90D20;
  }
  if (a10) {
    id v12 = (_UNKNOWN **)a10;
  }
  else {
    id v12 = &off_90D20;
  }
  if (a6)
  {
    self->_isSimpleString = 0;
    id v15 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:a6];
    if (v15)
    {
      v16 = v15;
      if (objc_msgSend(objc_msgSend(v15, "transferredFilename"), "length"))
      {
        a7 = objc_msgSend(objc_msgSend(v16, "transferredFilename"), "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = a7;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
          }
        }
      }
      if (![a7 length])
      {
        a7 = objc_msgSend(objc_msgSend(v16, "localPath"), "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = a7;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
          }
        }
      }
      if (a7)
      {
        id v19 = [a7 lastPathComponent];
        if (IMOSLoggingEnabled())
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v19;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
          }
        }
        if (v19)
        {
          id v21 = +[IMFileManager defaultHFSFileManager];
          unsigned int v22 = (void *)IMCreateEscapedAttributeValueFromString();
          id v33 = [v16 userInfo];
          uint64_t v35 = 0;
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\", v22, [v11 integerValue], objc_msgSend(v12, "integerValue"), objc_msgSend(objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "attributesOfItemAtPath:error:", objc_msgSend(v16, "localPath"), &v35), "fileSize""));
          if (a11 && [a11 BOOLValue])
          {
            id v23 = (void *)IMCreateEscapedAttributeValueFromString();
            [a11 stringValue];
            uint64_t v24 = IMCreateEscapedAttributeValueFromString();
            id v25 = (void *)v24;
            if (v23 && v24) {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v23, v24];
            }
          }
          if (objc_msgSend(objc_msgSend(v21, "MIMETypeOfPath:", v19), "length"))
          {
            v26 = (void *)IMCreateEscapedAttributeValueFromString();
            uint64_t v27 = IMCreateEscapedAttributeValueFromString();
            v28 = (void *)v27;
            if (v26 && v27) {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v26, v27];
            }
          }
          if (objc_msgSend(objc_msgSend(v21, "UTITypeOfPath:", v19), "length"))
          {
            v29 = (void *)IMCreateEscapedAttributeValueFromString();
            uint64_t v30 = IMCreateEscapedAttributeValueFromString();
            v31 = (void *)v30;
            if (v29 && v30) {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v29, v30];
            }
          }
          if (qword_99C48 != -1) {
            dispatch_once(&qword_99C48, &stru_8D2D0);
          }
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_120C4;
          v34[3] = &unk_8D2F8;
          v34[4] = self;
          [v33 enumerateKeysAndObjectsUsingBlock:v34];
          [(NSMutableString *)self->_outHTML appendString:@"/>"];
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v16;
              __int16 v38 = 2112;
              id v39 = v33;
              _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Parsed file transfer: %@    user info: %@", buf, 0x16u);
            }
          }
        }
      }
    }
  }
}

- (void)parserDidEnd:(id)a3
{
}

- (BOOL)shouldPreprocess
{
  return 1;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  objc_super v5 = (NSMutableDictionary *)a4;
  uint64_t v6 = IMDataDetectorResultAttributeName;
  id v25 = [a4 objectForKey:IMDataDetectorResultAttributeName];
  uint64_t v7 = IMMyNameAttributeName;
  id v24 = [(NSMutableDictionary *)v5 objectForKey:IMMyNameAttributeName];
  uint64_t v8 = IMSmileyDescriptionAttributeName;
  id v23 = [(NSMutableDictionary *)v5 objectForKey:IMSmileyDescriptionAttributeName];
  uint64_t v9 = IMSmileySpeechDescriptionAttributeName;
  id v22 = [(NSMutableDictionary *)v5 objectForKey:IMSmileySpeechDescriptionAttributeName];
  uint64_t v10 = IMSmileyLengthAttributeName;
  id v21 = [(NSMutableDictionary *)v5 objectForKey:IMSmileyLengthAttributeName];
  uint64_t v11 = IMUniqueSmileyNumberAttributeName;
  id v20 = [(NSMutableDictionary *)v5 objectForKey:IMUniqueSmileyNumberAttributeName];
  uint64_t v18 = v6;
  id v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", IMFontFamilyAttributeName, IMFontSizeAttributeName, IMItalicAttributeName, IMBoldAttributeName, IMUnderlineAttributeName, IMStrikethroughAttributeName, IMLinkAttributeName, IMPreformattedAttributeName, IMForegroundColorAttributeName, IMBackgroundColorAttributeName, IMMessageBackgroundColorAttributeName, IMMessageForegroundColorAttributeName, IMBaseWritingDirectionAttributeName, v11, v10, v7, v6,
          v8,
          v7,
          IMInlineMediaHeightAttributeName,
          IMInlineMediaWidthAttributeName,
          IMSearchTermAttributeName,
          v9,
          IMReferencedHandleAttributeName,
          IMFileTransferGUIDAttributeName,
          IMFileBookmarkAttributeName,
          IMFilenameAttributeName,
          0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([(NSMutableDictionary *)v5 objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * i)])
        {
          self->_isSimpleString = 0;
          goto LABEL_11;
        }
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  if (v25 || v24 || v23 || v22 || v21 || v20)
  {
    objc_super v5 = +[NSMutableDictionary dictionaryWithDictionary:v5];
    [(NSMutableDictionary *)v5 removeObjectForKey:v18];
    [(NSMutableDictionary *)v5 removeObjectForKey:v7];
    [(NSMutableDictionary *)v5 removeObjectForKey:v8];
    [(NSMutableDictionary *)v5 removeObjectForKey:v9];
    [(NSMutableDictionary *)v5 removeObjectForKey:v10];
    [(NSMutableDictionary *)v5 removeObjectForKey:v11];
  }
  return v5;
}

- (BOOL)isSimpleString
{
  return self->_isSimpleString;
}

- (NSString)outHTML
{
  return &self->_outHTML->super;
}

@end