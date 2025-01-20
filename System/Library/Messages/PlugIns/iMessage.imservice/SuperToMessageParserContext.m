@interface SuperToMessageParserContext
- (BOOL)includeMessageParts;
- (BOOL)isAudioMessage;
- (BOOL)isSimpleString;
- (BOOL)shouldPreprocess;
- (NSString)AuxHTML;
- (NSString)outHTML;
- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4;
- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4 isAudioMessage:(BOOL)a5;
- (id)name;
- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 atCharacterIndex:(int64_t)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parser:(id)a3 foundBreadcrumbText:(id)a4 withOptions:(unsigned int)a5;
- (void)parserDidEnd:(id)a3;
- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4;
@end

@implementation SuperToMessageParserContext

- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4
{
  return [(SuperToMessageParserContext *)self initWithAttributedString:a3 includeMessageParts:a4 isAudioMessage:0];
}

- (SuperToMessageParserContext)initWithAttributedString:(id)a3 includeMessageParts:(BOOL)a4 isAudioMessage:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SuperToMessageParserContext;
  v7 = [(SuperToMessageParserContext *)&v9 initWithAttributedString:a3];
  if (v7)
  {
    v7->_outHTML = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    v7->_isSimpleString = 1;
    v7->_includeMessageParts = a4;
    v7->_isAudioMessage = a5;
    v7->_AuxHTML = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SuperToMessageParserContext;
  [(SuperToMessageParserContext *)&v3 dealloc];
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
  [(NSMutableString *)self->_AuxHTML appendString:@"<html>"];
  [(NSMutableString *)self->_AuxHTML appendString:@"<body"];
  id v6 = objc_alloc_init((Class)NSMutableString);
  id v7 = [a4 objectForKey:IMMessageBackgroundColorAttributeName];
  if (v7) {
    [v6 appendFormat:@"background-color:%@;", v7];
  }
  id v8 = [a4 objectForKey:IMMessageForegroundColorAttributeName];
  if (v8) {
    [v6 appendFormat:@"color:%@;", v8];
  }
  if ([v6 length])
  {
    [(NSMutableString *)self->_outHTML appendFormat:@" style=\"%@\"", v6];
    [(NSMutableString *)self->_AuxHTML appendFormat:@" style=\"%@\"", v6];
  }
  id v9 = [a4 objectForKey:IMBaseWritingDirectionAttributeName];
  if (v9)
  {
    v10 = (char *)[v9 integerValue];
    if (v10 == (unsigned char *)&dword_0 + 1)
    {
      CFStringRef v11 = @" dir=\"rtl\"";
      goto LABEL_12;
    }
    if (!v10)
    {
      CFStringRef v11 = @" dir=\"ltr\"";
LABEL_12:
      [(NSMutableString *)self->_outHTML appendString:v11];
      [(NSMutableString *)self->_AuxHTML appendString:v11];
    }
  }
  [(NSMutableString *)self->_outHTML appendString:@">"];
  [(NSMutableString *)self->_AuxHTML appendString:@">"];
  if (([(NSMutableString *)self->_AuxHTML isEqualToString:self->_outHTML] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        AuxHTML = self->_AuxHTML;
        outHTML = self->_outHTML;
        *(_DWORD *)buf = 138412546;
        v16 = AuxHTML;
        __int16 v17 = 2112;
        v18 = outHTML;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "SuperToMessageParser parseDidStart _AuxHTML != _outHML, _AuxHTML %@, _outHTML %@", buf, 0x16u);
      }
    }
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  id v8 = [a4 _stringForKey:IMBackgroundColorAttributeName];
  id v41 = [a4 _stringForKey:IMForegroundColorAttributeName];
  id v9 = [a4 _stringForKey:IMFontFamilyAttributeName];
  id v40 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMFontSizeAttributeName), "integerValue");
  unsigned int v10 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMUnderlineAttributeName), "BOOLValue");
  unsigned int v39 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMBoldAttributeName), "BOOLValue");
  unsigned int v38 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMItalicAttributeName), "BOOLValue");
  unsigned int v37 = objc_msgSend(objc_msgSend(a4, "_numberForKey:", IMStrikethroughAttributeName), "BOOLValue");
  id v11 = [a4 objectForKey:IMLinkAttributeName];
  id v12 = [a4 objectForKey:IMLinkIsRichLinkAttributeName];
  id v13 = [a4 objectForKey:IMMentionConfirmedMention];
  id v43 = [a4 objectForKey:IMTextEffectAttributeName];
  [a4 objectForKey:IMTextBoldAttributeName];
  [a4 objectForKey:IMTextItalicAttributeName];
  [a4 objectForKey:IMTextUnderlineAttributeName];
  [a4 objectForKey:IMTextStrikethroughAttributeName];
  if (self->_includeMessageParts) {
    unint64_t v14 = (unint64_t)[a4 objectForKey:IMMessagePartAttributeName];
  }
  else {
    unint64_t v14 = 0;
  }
  id v15 = objc_alloc_init((Class)NSMutableString);
  v16 = v15;
  id v42 = v11;
  if (v11)
  {
    unint64_t v36 = v14;
    id v17 = v15;
    [v11 absoluteString];
    v18 = (void *)IMCreateEscapedAttributeValueFromString();
    [(NSMutableString *)self->_outHTML appendString:@"<a href=\""];
    [(NSMutableString *)self->_AuxHTML appendString:@"<a href=\""];
    [(NSMutableString *)self->_outHTML appendString:v18];
    [(NSMutableString *)self->_AuxHTML appendString:v18];
    if (v12)
    {
      unsigned int v19 = [v12 BOOLValue];
      [(NSMutableString *)self->_outHTML appendString:@"\" isRichLink=\""];
      if (v19) {
        CFStringRef v20 = @"1";
      }
      else {
        CFStringRef v20 = @"0";
      }
      [(NSMutableString *)self->_outHTML appendString:v20];
      [(NSMutableString *)self->_AuxHTML appendString:@"\" isRichLink=\""];
      [(NSMutableString *)self->_AuxHTML appendString:v20];
    }
    [(NSMutableString *)self->_outHTML appendString:@"\">"];
    [(NSMutableString *)self->_AuxHTML appendString:@"\">"];

    v16 = v17;
    unint64_t v14 = v36;
  }
  if (v39) {
    [v16 appendString:@"font-weight: bold;"];
  }
  v21 = v43;
  if (v38) {
    [v16 appendString:@"font-style: italic;"];
  }
  if ((v10 | v37) == 1)
  {
    if (v10) {
      CFStringRef v22 = @"text-decoration: underline;";
    }
    else {
      CFStringRef v22 = @"text-decoration: line-through;";
    }
    [v16 appendString:v22];
  }
  if ([v9 length])
  {
    v23 = (void *)IMCopySafeNameOfFontFamilyName();
    v24 = (void *)IMCreateEscapedAttributeValueFromString();
    [v16 appendFormat:@"font-family: '%@';", v24];
  }
  if (v40) {
    objc_msgSend(v16, "appendFormat:", @"font-size: %dpx;", v40);
  }
  if ([v41 length]) {
    [v16 appendFormat:@"color: %@;", v41];
  }
  if ([v8 length]) {
    [v16 appendFormat:@"background-color: %@;", v8];
  }
  unint64_t v25 = (unint64_t)[v16 length];
  BOOL v26 = (v25 | v14) != 0;
  if (v25 | v14)
  {
    [(NSMutableString *)self->_outHTML appendString:@"<span"];
    [(NSMutableString *)self->_AuxHTML appendString:@"<span"];
    if ([v16 length]) {
      [(NSMutableString *)self->_outHTML appendFormat:@" style=\"%@\"", v16];
    }
    if (v14)
    {
      -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" message-part=\"%d\"", [(id)v14 intValue]);
      -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" message-part=\"%d\"", [(id)v14 intValue]);
    }
    [(NSMutableString *)self->_outHTML appendString:@">"];
    [(NSMutableString *)self->_AuxHTML appendString:@">"];
    v21 = v43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 length])
  {
    [(NSMutableString *)self->_outHTML appendString:@"<mention uri=\""];
    [(NSMutableString *)self->_AuxHTML appendString:@"<mention uri=\""];
    id v27 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:IMMentionHandleAllowedCharacterSet()];
    [(NSMutableString *)self->_outHTML appendString:v27];
    [(NSMutableString *)self->_AuxHTML appendString:v27];
    [(NSMutableString *)self->_outHTML appendString:@"\">"];
    [(NSMutableString *)self->_AuxHTML appendString:@"\">"];
    int v28 = 1;
  }
  else
  {
    int v28 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @"<texteffect type=\"%u\">", [v21 unsignedIntValue]);
    -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @"<texteffect type=\"%u\">", [v21 unsignedIntValue]);
  }
  objc_opt_class();
  char v30 = objc_opt_isKindOfClass();
  if (v30)
  {
    [(NSMutableString *)self->_outHTML appendString:@"<b>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"<b>"];
  }
  objc_opt_class();
  char v31 = objc_opt_isKindOfClass();
  if (v31)
  {
    [(NSMutableString *)self->_outHTML appendString:@"<i>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"<i>"];
  }
  objc_opt_class();
  char v32 = objc_opt_isKindOfClass();
  if (v32)
  {
    [(NSMutableString *)self->_outHTML appendString:@"<u>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"<u>"];
  }
  objc_opt_class();
  char v33 = objc_opt_isKindOfClass();
  if (v33)
  {
    [(NSMutableString *)self->_outHTML appendString:@"<s>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"<s>"];
  }
  v34 = (void *)IMCreateEscapedStringFromString();
  if (v34)
  {
    [(NSMutableString *)self->_outHTML appendString:v34];
    [(NSMutableString *)self->_AuxHTML appendString:v34];
  }

  if (v33)
  {
    [(NSMutableString *)self->_outHTML appendString:@"</s>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"</s>"];
  }
  if (v32)
  {
    [(NSMutableString *)self->_outHTML appendString:@"</u>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"</u>"];
  }
  if (v31)
  {
    [(NSMutableString *)self->_outHTML appendString:@"</i>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"</i>"];
    if ((v30 & 1) == 0)
    {
LABEL_56:
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_57;
      }
      goto LABEL_63;
    }
  }
  else if ((v30 & 1) == 0)
  {
    goto LABEL_56;
  }
  [(NSMutableString *)self->_outHTML appendString:@"</b>"];
  [(NSMutableString *)self->_AuxHTML appendString:@"</b>"];
  if ((isKindOfClass & 1) == 0)
  {
LABEL_57:
    if (!v28) {
      goto LABEL_58;
    }
    goto LABEL_64;
  }
LABEL_63:
  [(NSMutableString *)self->_outHTML appendString:@"</texteffect>"];
  [(NSMutableString *)self->_AuxHTML appendString:@"</texteffect>"];
  if (!v28)
  {
LABEL_58:
    if (!v26) {
      goto LABEL_59;
    }
LABEL_65:
    [(NSMutableString *)self->_outHTML appendString:@"</span>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"</span>"];
    if (!v42) {
      goto LABEL_66;
    }
    goto LABEL_60;
  }
LABEL_64:
  [(NSMutableString *)self->_outHTML appendString:@"</mention>"];
  [(NSMutableString *)self->_AuxHTML appendString:@"</mention>"];
  if (v26) {
    goto LABEL_65;
  }
LABEL_59:
  if (v42)
  {
LABEL_60:
    [(NSMutableString *)self->_outHTML appendString:@"</a>"];
    [(NSMutableString *)self->_AuxHTML appendString:@"</a>"];
  }
LABEL_66:
  if (([(NSMutableString *)self->_AuxHTML isEqualToString:self->_outHTML] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "SuperToMessageParser parser:foundAtrributes:inRange:characters: _AuxHTML != _outHTML", buf, 2u);
      }
    }
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.length >= 2)
  {
    id v17 = a7;
    v18 = IMLogHandleForCategory();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    a7 = v17;
    if (v19)
    {
      *(_DWORD *)buf = 134217984;
      NSUInteger v28 = length;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Adjacent characters share the same file transfer. Length=%ld", buf, 0xCu);
      a7 = v17;
    }
  }
  if (location < location + length)
  {
    do
    {
      id v20 = a3;
      id v21 = a4;
      id v22 = a6;
      id v23 = a3;
      id v24 = a4;
      id v25 = a6;
      id v26 = a7;
      [(SuperToMessageParserContext *)self parser:v20 foundAttributes:v21 atCharacterIndex:location fileTransferGUID:v22 filename:a7 bookmark:a8 width:a9 height:a10 isAnimoji:a11];
      a7 = v26;
      a6 = v25;
      a4 = v24;
      a3 = v23;
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 atCharacterIndex:(int64_t)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  id v12 = (_UNKNOWN **)a9;
  id v11 = (_UNKNOWN **)a10;
  if (!a9) {
    id v12 = &off_E3750;
  }
  if (!a10) {
    id v11 = &off_E3750;
  }
  v67 = v11;
  v68 = v12;
  if (a6)
  {
    id v13 = a7;
    self->_isSimpleString = 0;
    id v16 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:a6];
    if (v16)
    {
      id v17 = v16;
      if (objc_msgSend(objc_msgSend(v16, "transferredFilename"), "length"))
      {
        id v13 = objc_msgSend(objc_msgSend(v17, "transferredFilename"), "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v13;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
          }
        }
      }
      if (![v13 length])
      {
        id v13 = objc_msgSend(objc_msgSend(v17, "localPath"), "lastPathComponent");
        if (IMOSLoggingEnabled())
        {
          BOOL v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v13;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
          }
        }
      }
      if (v13)
      {
        id v20 = [v13 lastPathComponent];
        if (IMOSLoggingEnabled())
        {
          id v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v20;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
          }
        }
        if (v20)
        {
          id v22 = +[IMFileManager defaultHFSFileManager];
          v65 = (void *)IMCreateEscapedAttributeValueFromString();
          v64 = (__CFString *)[v17 userInfo];
          uint64_t v74 = 0;
          id v23 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "attributesOfItemAtPath:error:", objc_msgSend(v17, "localPath"), &v74);
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\", v65, [v68 integerValue], objc_msgSend(v67, "integerValue"), objc_msgSend(v23, "fileSize""));
          -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\", v65, [v68 integerValue], objc_msgSend(v67, "integerValue"), objc_msgSend(v23, "fileSize""));
          if (a11)
          {
            id v24 = (void *)IMCreateEscapedAttributeValueFromString();
            [a11 stringValue];
            uint64_t v25 = IMCreateEscapedAttributeValueFromString();
            id v26 = (void *)v25;
            if (v24 && v25)
            {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v24, v25];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v24, v26];
            }
          }
          if (objc_msgSend(objc_msgSend(v22, "MIMETypeOfPath:", v20), "length"))
          {
            id v27 = (void *)IMCreateEscapedAttributeValueFromString();
            uint64_t v28 = IMCreateEscapedAttributeValueFromString();
            v29 = (void *)v28;
            if (v27 && v28)
            {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v27, v28];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v27, v29];
            }
          }
          if (objc_msgSend(objc_msgSend(v22, "UTITypeOfPath:", v20), "length"))
          {
            char v30 = (void *)IMCreateEscapedAttributeValueFromString();
            uint64_t v31 = IMCreateEscapedAttributeValueFromString();
            char v32 = (void *)v31;
            if (v30 && v31)
            {
              [(NSMutableString *)self->_outHTML appendFormat:@" %@=\"%@\"", v30, v31];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v30, v32];
            }
          }
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_38694;
          v73[3] = &unk_DE278;
          v73[4] = self;
          [(__CFString *)v64 enumerateKeysAndObjectsUsingBlock:v73];
          if (IMOSLoggingEnabled())
          {
            char v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              unsigned int v34 = [v17 isSticker];
              CFStringRef v35 = @"NO";
              if (v34) {
                CFStringRef v35 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              id v76 = v17;
              __int16 v77 = 2112;
              CFStringRef v78 = v35;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "transfer %@ isSticker %@", buf, 0x16u);
            }
          }
          if ([v17 isSticker])
          {
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_38778;
            v70[3] = &unk_DE2A0;
            id v71 = [v17 stickerUserInfo];
            v72 = self;
            [v71 enumerateKeysAndObjectsUsingBlock:v70];
          }
          if ([v17 isAdaptiveImageGlyph])
          {
            if (objc_msgSend(objc_msgSend(v17, "adaptiveImageGlyphContentIdentifier"), "length"))
            {
              unint64_t v36 = (void *)IMCreateEscapedAttributeValueFromString();
              [(NSMutableString *)self->_outHTML appendFormat:@" emoji-image-id=\"%@\"", v36];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" emoji-image-id=\"%@\"", v36];
            }
            if (objc_msgSend(objc_msgSend(v17, "adaptiveImageGlyphContentDescription"), "length"))
            {
              unsigned int v37 = (void *)IMCreateEscapedAttributeValueFromString();
              [(NSMutableString *)self->_outHTML appendFormat:@" emoji-image-description=\"%@\"", v37];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" emoji-image-description=\"%@\"", v37];
            }
          }
          if (self->_includeMessageParts)
          {
            id v38 = [a4 objectForKey:IMMessagePartAttributeName];
            unsigned int v39 = v38;
            if (v38)
            {
              -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", @" message-part=\"%d\"", [v38 intValue]);
              -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @" message-part=\"%d\"", [v39 intValue]);
            }
          }
          if (self->_isAudioMessage)
          {
            id v40 = [a4 objectForKey:IMAudioTranscription];
            if (v40)
            {
              [(NSMutableString *)self->_outHTML appendFormat:@" audio-transcription=\"%@\"", v40];
              [(NSMutableString *)self->_AuxHTML appendFormat:@" audio-transcription=\"%@\"", v40];
            }
          }

          [(NSMutableString *)self->_outHTML appendString:@"/>"];
          [(NSMutableString *)self->_AuxHTML appendString:@"/>"];
          if ([v17 isAuxImage])
          {
            id v41 = -[IMDFileTransferCenter transferForGUID:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "transferForGUID:", +[IMFileTransfer AuxGUIDFromFileTransferGUID:](IMFileTransfer, "AuxGUIDFromFileTransferGUID:", [v17 guid]));
            int v42 = IMOSLoggingEnabled();
            if (v41)
            {
              if (v42)
              {
                id v43 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  id v44 = [v17 guid];
                  *(_DWORD *)buf = 138412290;
                  id v76 = v44;
                  _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "We have an Aux transfer %@", buf, 0xCu);
                }
              }
              if (objc_msgSend(objc_msgSend(v41, "transferredFilename"), "length"))
              {
                id v45 = objc_msgSend(objc_msgSend(v41, "transferredFilename"), "lastPathComponent");
                if (IMOSLoggingEnabled())
                {
                  v46 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v76 = v45;
                    _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
                  }
                }
              }
              else
              {
                id v45 = 0;
              }
              if (![v45 length])
              {
                id v45 = objc_msgSend(objc_msgSend(v41, "localPath"), "lastPathComponent");
                if (IMOSLoggingEnabled())
                {
                  v49 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v76 = v45;
                    _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
                  }
                }
              }
              if (v45)
              {
                id v50 = [v45 lastPathComponent];
                if (IMOSLoggingEnabled())
                {
                  v51 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v76 = v50;
                    _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
                  }
                }
                if (v50)
                {
                  id v52 = +[IMFileManager defaultHFSFileManager];
                  v66 = (void *)IMCreateEscapedAttributeValueFromString();
                  v64 = (__CFString *)[v41 userInfo];
                  -[NSMutableString appendFormat:](self->_AuxHTML, "appendFormat:", @"<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\" ", v66, [v68 integerValue], objc_msgSend(v67, "integerValue"), objc_msgSend(objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "attributesOfItemAtPath:error:", objc_msgSend(v41, "localPath"), &v74), "fileSize"));
                  [(NSMutableString *)self->_AuxHTML appendFormat:@"iris=\"%@\", @"yes""];
                  if (a11)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v53 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v76 = a11;
                        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "WARNING emoji %@ not nil seems wrong for Aux transfer ", buf, 0xCu);
                      }
                    }
                    v54 = (void *)IMCreateEscapedAttributeValueFromString();
                    [a11 stringValue];
                    uint64_t v55 = IMCreateEscapedAttributeValueFromString();
                    v56 = (void *)v55;
                    if (v54 && v55) {
                      [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v54, v55];
                    }
                  }
                  if (objc_msgSend(objc_msgSend(v52, "MIMETypeOfPath:", v50), "length"))
                  {
                    v57 = (void *)IMCreateEscapedAttributeValueFromString();
                    uint64_t v58 = IMCreateEscapedAttributeValueFromString();
                    v59 = (void *)v58;
                    if (v57 && v58) {
                      [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v57, v58];
                    }
                  }
                  if (objc_msgSend(objc_msgSend(v52, "UTITypeOfPath:", v50), "length"))
                  {
                    v60 = (void *)IMCreateEscapedAttributeValueFromString();
                    uint64_t v61 = IMCreateEscapedAttributeValueFromString();
                    v62 = (void *)v61;
                    if (v60 && v61) {
                      [(NSMutableString *)self->_AuxHTML appendFormat:@" %@=\"%@\"", v60, v61];
                    }
                  }
                  v69[0] = _NSConcreteStackBlock;
                  v69[1] = 3221225472;
                  v69[2] = sub_38970;
                  v69[3] = &unk_DE278;
                  v69[4] = self;
                  [(__CFString *)v64 enumerateKeysAndObjectsUsingBlock:v69];
                  [(NSMutableString *)self->_AuxHTML appendString:@"/>"];
                }
              }
            }
            else if (v42)
            {
              v47 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                id v48 = [v17 guid];
                *(_DWORD *)buf = 138412290;
                id v76 = v48;
                _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Expected to find video transfer guid %@", buf, 0xCu);
              }
            }
          }
          if (IMOSLoggingEnabled())
          {
            v63 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v76 = v17;
              __int16 v77 = 2112;
              CFStringRef v78 = v64;
              _os_log_impl(&dword_0, v63, OS_LOG_TYPE_INFO, "Parsed file transfer: %@    user info: %@", buf, 0x16u);
            }
          }
        }
      }
    }
  }
}

- (void)parser:(id)a3 foundBreadcrumbText:(id)a4 withOptions:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (id)IMCreateEscapedAttributeValueFromString();
  id v7 = +[NSString stringWithFormat:@"<object breadcrumbText=\"%@\" breadcrumbOptions=\"%u\"></object>", v8, v5];
  [(NSMutableString *)self->_outHTML appendString:v7];
  [(NSMutableString *)self->_AuxHTML appendString:v7];
}

- (void)parserDidEnd:(id)a3
{
  [(NSMutableString *)self->_outHTML appendString:@"</body></html>"];
  AuxHTML = self->_AuxHTML;

  [(NSMutableString *)AuxHTML appendString:@"</body></html>"];
}

- (BOOL)shouldPreprocess
{
  return 1;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  uint64_t v5 = (NSMutableDictionary *)a4;
  uint64_t v21 = IMDataDetectorResultAttributeName;
  id v22 = objc_msgSend(a4, "objectForKey:");
  uint64_t v20 = IMMyNameAttributeName;
  id v16 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v19 = IMSmileyDescriptionAttributeName;
  id v15 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v18 = IMSmileySpeechDescriptionAttributeName;
  id v14 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v17 = IMSmileyLengthAttributeName;
  id v13 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  uint64_t v23 = IMUniqueSmileyNumberAttributeName;
  id v12 = -[NSMutableDictionary objectForKey:](v5, "objectForKey:");
  id v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", IMFontFamilyAttributeName, IMFontSizeAttributeName, IMItalicAttributeName, IMBoldAttributeName, IMUnderlineAttributeName, IMStrikethroughAttributeName, IMLinkAttributeName, IMPreformattedAttributeName, IMForegroundColorAttributeName, IMBackgroundColorAttributeName, IMMessageBackgroundColorAttributeName, IMMessageForegroundColorAttributeName, IMBaseWritingDirectionAttributeName, v23, v17, v20, v21,
         v19,
         v20,
         IMInlineMediaHeightAttributeName,
         IMInlineMediaWidthAttributeName,
         IMSearchTermAttributeName,
         v18,
         IMReferencedHandleAttributeName,
         IMFileTransferGUIDAttributeName,
         IMFileBookmarkAttributeName,
         IMFilenameAttributeName,
         IMBreadcrumbTextMarkerAttributeName,
         IMMentionConfirmedMention,
         IMTextEffectAttributeName,
         IMTextBoldAttributeName,
         IMTextItalicAttributeName,
         IMTextUnderlineAttributeName,
         IMTextStrikethroughAttributeName,
         0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([(NSMutableDictionary *)v5 objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)])
        {
          self->_isSimpleString = 0;
          goto LABEL_11;
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  if (self->_includeMessageParts) {
    self->_isSimpleString = 0;
  }
  if (v22 || v16 || v15 || v14 || v13 || v12)
  {
    uint64_t v5 = +[NSMutableDictionary dictionaryWithDictionary:v5];
    [(NSMutableDictionary *)v5 removeObjectForKey:v21];
    [(NSMutableDictionary *)v5 removeObjectForKey:v20];
    [(NSMutableDictionary *)v5 removeObjectForKey:v19];
    [(NSMutableDictionary *)v5 removeObjectForKey:v18];
    [(NSMutableDictionary *)v5 removeObjectForKey:v17];
    [(NSMutableDictionary *)v5 removeObjectForKey:v23];
  }
  return v5;
}

- (BOOL)isSimpleString
{
  return self->_isSimpleString;
}

- (BOOL)includeMessageParts
{
  return self->_includeMessageParts;
}

- (NSString)outHTML
{
  return &self->_outHTML->super;
}

- (NSString)AuxHTML
{
  return &self->_AuxHTML->super;
}

- (BOOL)isAudioMessage
{
  return self->_isAudioMessage;
}

@end