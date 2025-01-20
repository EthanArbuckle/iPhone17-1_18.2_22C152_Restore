@interface IMDSuperToRelayMessageParser
- (BOOL)isSimpleString;
- (BOOL)shouldPreprocess;
- (IMDSuperToRelayMessageParser)initWithAttributedString:(id)a3;
- (NSString)outHTML;
- (id)name;
- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5;
- (id)resultsForLogging;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parserDidEnd:(id)a3;
- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4;
@end

@implementation IMDSuperToRelayMessageParser

- (IMDSuperToRelayMessageParser)initWithAttributedString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IMDSuperToRelayMessageParser;
  v3 = [(IMFromSuperParserContext *)&v7 initWithAttributedString:a3];
  if (v3)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    outHTML = v3->_outHTML;
    v3->_outHTML = v4;

    v3->_isSimpleString = 1;
  }
  return v3;
}

- (id)name
{
  return @"SuperToMessage";
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"outHTML", 0);
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  id v14 = a4;
  [(NSMutableString *)self->_outHTML appendString:@"<html>"];
  [(NSMutableString *)self->_outHTML appendString:@"<body"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [v14 objectForKey:*MEMORY[0x1E4F6C1E8]];
  objc_super v7 = (void *)v6;
  if (v6) {
    [v5 appendFormat:@"background-color:%@;", v6];
  }
  uint64_t v8 = [v14 objectForKey:*MEMORY[0x1E4F6C1F0]];
  v9 = (void *)v8;
  if (v8) {
    [v5 appendFormat:@"color:%@;", v8];
  }
  if ([v5 length]) {
    [(NSMutableString *)self->_outHTML appendFormat:@" style=\"%@\"", v5];
  }
  v10 = [v14 objectForKey:*MEMORY[0x1E4F6C120]];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 integerValue];
    if (v12 == 1)
    {
      v13 = @" dir=\"rtl\"";
    }
    else
    {
      if (v12) {
        goto LABEL_13;
      }
      v13 = @" dir=\"ltr\"";
    }
    [(NSMutableString *)self->_outHTML appendString:v13];
  }
LABEL_13:
  [(NSMutableString *)self->_outHTML appendString:@">"];
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  id v40 = a6;
  uint64_t v8 = *MEMORY[0x1E4F6C118];
  id v9 = a4;
  v10 = [v9 _stringForKey:v8];
  v11 = [v9 _stringForKey:*MEMORY[0x1E4F6C1A8]];
  uint64_t v12 = [v9 _stringForKey:*MEMORY[0x1E4F6C198]];
  v13 = [v9 _numberForKey:*MEMORY[0x1E4F6C1A0]];
  uint64_t v39 = [v13 integerValue];

  id v14 = [v9 _numberForKey:*MEMORY[0x1E4F6C2B0]];
  int v15 = [v14 BOOLValue];

  v16 = [v9 _numberForKey:*MEMORY[0x1E4F6C128]];
  int v38 = [v16 BOOLValue];

  v17 = [v9 _numberForKey:*MEMORY[0x1E4F6C1C8]];
  int v37 = [v17 BOOLValue];

  v18 = [v9 _numberForKey:*MEMORY[0x1E4F6C2A8]];
  int v19 = [v18 BOOLValue];

  v20 = [v9 objectForKey:*MEMORY[0x1E4F6C1D0]];

  id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v22 = &OBJC_IVAR___IMDMessageActiveDevice__latestActiveDate;
  if (v20)
  {
    [v20 absoluteString];
    int v23 = v19;
    int v24 = v15;
    v26 = v25 = v20;
    v27 = v12;
    v28 = v11;
    v29 = v10;
    v30 = (void *)IMCreateEscapedAttributeValueFromString();

    [(NSMutableString *)self->_outHTML appendString:@"<a href=\""];
    [(NSMutableString *)self->_outHTML appendString:v30];
    v20 = v25;
    int v15 = v24;
    int v19 = v23;
    [(NSMutableString *)self->_outHTML appendString:@"\">"];

    v10 = v29;
    v11 = v28;
    uint64_t v12 = v27;
    v22 = &OBJC_IVAR___IMDMessageActiveDevice__latestActiveDate;
  }
  if (v38) {
    [v21 appendString:@"font-weight: bold;"];
  }
  if (v37) {
    [v21 appendString:@"font-style: italic;"];
  }
  if ((v15 | v19) == 1)
  {
    if (v15) {
      v31 = @"text-decoration: underline;";
    }
    else {
      v31 = @"text-decoration: line-through;";
    }
    [v21 appendString:v31];
  }
  if ([v12 length])
  {
    v32 = (void *)IMCopySafeNameOfFontFamilyName();
    v33 = v20;
    v34 = (void *)IMCreateEscapedAttributeValueFromString();
    [v21 appendFormat:@"font-family: '%@';", v34];

    v20 = v33;
  }
  if (v39) {
    objc_msgSend(v21, "appendFormat:", @"font-size: %dpx;", v39);
  }
  if ([v11 length]) {
    [v21 appendFormat:@"color: %@;", v11];
  }
  if ([v10 length]) {
    [v21 appendFormat:@"background-color: %@;", v10];
  }
  if ([v21 length])
  {
    uint64_t v35 = v22[554];
    [*(id *)((char *)&self->super.super.super.isa + v35) appendString:@"<span style=\""];
    [*(id *)((char *)&self->super.super.super.isa + v35) appendString:v21];
    [*(id *)((char *)&self->super.super.super.isa + v35) appendString:@"\">"];
  }
  v36 = (void *)IMCreateEscapedStringFromString();
  if (v36) {
    [*(id *)((char *)&self->super.super.super.isa + v22[554]) appendString:v36];
  }
  if ([v21 length]) {
    [*(id *)((char *)&self->super.super.super.isa + v22[554]) appendString:@"</span>"];
  }
  if (v20) {
    [*(id *)((char *)&self->super.super.super.isa + v22[554]) appendString:@"</a>"];
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v57 = a4;
  id v15 = a6;
  id v16 = a7;
  id v58 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  if (v17) {
    v20 = v17;
  }
  else {
    v20 = &unk_1F33C5C10;
  }
  if (v18) {
    id v21 = v18;
  }
  else {
    id v21 = &unk_1F33C5C10;
  }
  if (v15)
  {
    self->_isSimpleString = 0;
    v22 = +[IMDFileTransferCenter sharedInstance];
    int v23 = [v22 transferForGUID:v15];

    if (!v23)
    {
LABEL_57:

      goto LABEL_58;
    }
    int v24 = [v23 transferredFilename];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = [v23 transferredFilename];
      v27 = [v26 lastPathComponent];

      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v27;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v27 = v16;
    }
    if ([v27 length])
    {
      v29 = v27;
      if (!v27)
      {
LABEL_56:
        id v16 = 0;
        goto LABEL_57;
      }
    }
    else
    {
      v30 = [v23 localPath];
      v29 = [v30 lastPathComponent];

      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v29;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
        }
      }
      if (!v29) {
        goto LABEL_56;
      }
    }
    id v16 = [v29 lastPathComponent];

    if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v62 = v16;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
      }
    }
    if (v16)
    {
      v55 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
      v51 = (void *)IMCreateEscapedAttributeValueFromString();
      v52 = [v23 userInfo];
      v33 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
      v34 = [v23 localPath];
      id v60 = 0;
      v50 = [v33 attributesOfItemAtPath:v34 error:&v60];
      id v49 = v60;

      -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\", v51, [v20 integerValue], objc_msgSend(v21, "integerValue"), objc_msgSend(v50, "fileSize""));
      if (v19)
      {
        uint64_t v35 = (void *)IMCreateEscapedAttributeValueFromString();
        v36 = [v19 stringValue];
        int v37 = (void *)IMCreateEscapedAttributeValueFromString();

        if (v35 && v37) {
          [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v35, v37];
        }
      }
      v54 = [v55 MIMETypeOfPath:v16];
      if ([v54 length])
      {
        int v38 = (void *)IMCreateEscapedAttributeValueFromString();
        uint64_t v39 = IMCreateEscapedAttributeValueFromString();
        id v40 = (void *)v39;
        if (v38 && v39) {
          [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v38, v39];
        }
      }
      v53 = [v55 UTITypeOfPath:v16];
      if ([v53 length])
      {
        v41 = (void *)IMCreateEscapedAttributeValueFromString();
        uint64_t v42 = IMCreateEscapedAttributeValueFromString();
        v43 = (void *)v42;
        if (v41 && v42) {
          [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v41, v42];
        }
      }
      if ([v23 isAdaptiveImageGlyph])
      {
        v44 = [v23 adaptiveImageGlyphContentIdentifier];
        if ([v44 length])
        {
          v45 = (void *)IMCreateEscapedAttributeValueFromString();
          [(NSMutableString *)self->_outHTML appendFormat:@" emoji-image-id=\"%@\"", v45];
        }
        v46 = [v23 adaptiveImageGlyphContentDescription];
        if ([v46 length])
        {
          v47 = (void *)IMCreateEscapedAttributeValueFromString();
          [(NSMutableString *)self->_outHTML appendFormat:@" emoji-image-description=\"%@\"", v47];
        }
      }
      if (qword_1EA8CA590 != -1) {
        dispatch_once(&qword_1EA8CA590, &unk_1F33918A0);
      }
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = sub_1D97BCBE0;
      v59[3] = &unk_1E6B767A0;
      v59[4] = self;
      [v52 enumerateKeysAndObjectsUsingBlock:v59];
      [(NSMutableString *)self->_outHTML appendString:@"/>"];
      if (IMOSLoggingEnabled())
      {
        v48 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v62 = v23;
          __int16 v63 = 2112;
          v64 = v52;
          _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, "Parsed file transfer: %@    user info: %@", buf, 0x16u);
        }
      }
    }
    goto LABEL_57;
  }
LABEL_58:
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
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F6C168];
  v29 = [v5 objectForKey:*MEMORY[0x1E4F6C168]];

  uint64_t v7 = *MEMORY[0x1E4F6C208];
  v28 = [v5 objectForKey:*MEMORY[0x1E4F6C208]];

  uint64_t v8 = *MEMORY[0x1E4F6C290];
  v27 = [v5 objectForKey:*MEMORY[0x1E4F6C290]];

  uint64_t v9 = *MEMORY[0x1E4F6C2A0];
  v26 = [v5 objectForKey:*MEMORY[0x1E4F6C2A0]];

  uint64_t v10 = *MEMORY[0x1E4F6C298];
  uint64_t v25 = [v5 objectForKey:*MEMORY[0x1E4F6C298]];

  uint64_t v11 = *MEMORY[0x1E4F6C2B8];
  int v24 = [v5 objectForKey:*MEMORY[0x1E4F6C2B8]];

  uint64_t v20 = v9;
  uint64_t v21 = v8;
  uint64_t v22 = v6;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F6C198], *MEMORY[0x1E4F6C1A0], *MEMORY[0x1E4F6C1C8], *MEMORY[0x1E4F6C128], *MEMORY[0x1E4F6C2B0], *MEMORY[0x1E4F6C2A8], *MEMORY[0x1E4F6C1D0], *MEMORY[0x1E4F6C258], *MEMORY[0x1E4F6C1A8], *MEMORY[0x1E4F6C118], *MEMORY[0x1E4F6C1E8], *MEMORY[0x1E4F6C1F0], *MEMORY[0x1E4F6C120], v11, v10, v7, v6,
    v8,
    v7,
    *MEMORY[0x1E4F6C1B8],
    *MEMORY[0x1E4F6C1C0],
    *MEMORY[0x1E4F6C288],
    v9,
    *MEMORY[0x1E4F6C260],
    *MEMORY[0x1E4F6C188],
    *MEMORY[0x1E4F6C180],
    *MEMORY[0x1E4F6C190],
    0);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v5 objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * i)];

        if (v17)
        {
          self->_isSimpleString = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v29 || v28 || v27 || v26 || v25 || (id v18 = v5, v24))
  {
    id v18 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];

    [v18 removeObjectForKey:v22];
    [v18 removeObjectForKey:v7];
    [v18 removeObjectForKey:v21];
    [v18 removeObjectForKey:v20];
    [v18 removeObjectForKey:v10];
    [v18 removeObjectForKey:v11];
  }

  return v18;
}

- (BOOL)isSimpleString
{
  return self->_isSimpleString;
}

- (NSString)outHTML
{
  return &self->_outHTML->super;
}

- (void).cxx_destruct
{
}

@end