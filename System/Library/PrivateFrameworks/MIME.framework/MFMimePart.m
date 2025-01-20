@interface MFMimePart
+ (BOOL)isRecognizedClassForContent:(id)a3;
+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5;
+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5 info:(id *)a6;
+ (Class)attachmentClass;
+ (OS_os_log)log;
+ (void)initialize;
- (BOOL)_hasCompleteBodyDataToOffset:(unint64_t)a3;
- (BOOL)_shouldContinueDecodingProcess;
- (BOOL)hasContentType:(id)a3 subtype:(id)a4;
- (BOOL)hasContents;
- (BOOL)hasSecureSubparts;
- (BOOL)hasValidMultipartSignedContentType;
- (BOOL)isAttachment;
- (BOOL)isDecodingComplete;
- (BOOL)isGenerated;
- (BOOL)isHTML;
- (BOOL)isReadableText;
- (BOOL)isRich;
- (BOOL)isSecurePart;
- (BOOL)parseIMAPPropertyList:(id)a3;
- (BOOL)parseMimeBody;
- (BOOL)parseMimeBodyDownloadIfNecessary:(BOOL)a3;
- (BOOL)parseMimeBodyFromHeaderData:(id)a3 bodyData:(id)a4 isPartial:(BOOL)a5;
- (BOOL)shouldConsiderInlineOverridingExchangeServer;
- (BOOL)usesKnownSignatureProtocol;
- (ECSubject)wrappedSubject;
- (MFMimePart)init;
- (NSArray)languages;
- (NSString)contentDescription;
- (NSString)contentID;
- (NSString)contentLocation;
- (NSString)contentTransferEncoding;
- (NSString)description;
- (NSString)disposition;
- (NSString)subtype;
- (NSString)type;
- (SEL)_selectorForCString:(char *)a3;
- (_NSRange)range;
- (id)_fullMimeTypeEvenInsideAppleDouble;
- (id)_objectInOtherIvarsForKey:(id)a3;
- (id)_partThatIsAttachment;
- (id)alternativeAtIndex:(int64_t)a3;
- (id)attachmentFilename;
- (id)attachmentURLs;
- (id)attachments;
- (id)bodyData;
- (id)bodyDataForcingDownload:(BOOL)a3;
- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5;
- (id)bodyParameterForKey:(id)a3;
- (id)bodyParameterKeys;
- (id)childPartWithNumber:(id)a3;
- (id)chosenAlternativePart;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7;
- (id)contentsForTextSystem;
- (id)contentsForTextSystemForcingDownload:(BOOL)a3;
- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5;
- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6;
- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7;
- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4;
- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5;
- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6;
- (id)decodeApplicationOctet_stream;
- (id)decodeApplicationZip;
- (id)decodeMultipart;
- (id)decodeMultipartAlternative;
- (id)decodeMultipartRelated;
- (id)decodeText;
- (id)decodedDataForData:(id)a3;
- (id)decryptedMessageBodyIsEncrypted:(BOOL *)a3 isSigned:(BOOL *)a4;
- (id)dispositionParameterForKey:(id)a3;
- (id)dispositionParameterKeys;
- (id)fileWrapper;
- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4;
- (id)fileWrapperForcingDownload:(BOOL)a3;
- (id)firstChildPart;
- (id)mimeBody;
- (id)nextSiblingPart;
- (id)parentPart;
- (id)partNumber;
- (id)partURL;
- (id)rfc822DecodedMessageBody;
- (id)signedData;
- (id)startPart;
- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5;
- (id)subpartAtIndex:(int64_t)a3;
- (id)subparts;
- (id)textHtmlPart;
- (int64_t)numberOfAlternatives;
- (unint64_t)totalTextSize;
- (unsigned)numberOfAttachments;
- (unsigned)textEncoding;
- (void)_clearNextAndSibling;
- (void)_clearParent;
- (void)_contents:(id *)a3 toOffset:(unint64_t)a4 resultOffset:(unint64_t *)a5 downloadIfNecessary:(BOOL)a6 asHTML:(BOOL)a7 isComplete:(BOOL *)a8;
- (void)_ensureBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6 decoded:(id *)a7;
- (void)_fixupBodyParametersRFC2231Values;
- (void)_fixupDispositionParametersRFC2231Values;
- (void)_setDecryptedMessageBody:(id)a3 isEncrypted:(BOOL)a4 isSigned:(BOOL)a5;
- (void)_setDecryptedMessageInDictionary:(id)a3;
- (void)_setObjectInOtherIvars:(id)a3 forKey:(id)a4;
- (void)_setRFC822DecodedMessageBody:(id)a3;
- (void)_setWrappedSubject:(id)a3;
- (void)addSubpart:(id)a3;
- (void)clearCachedDescryptedMessageBody;
- (void)configureFileWrapper:(id)a3;
- (void)dealloc;
- (void)decodeIfNecessary;
- (void)download;
- (void)getNumberOfAttachments:(unsigned int *)a3 isSigned:(BOOL *)a4 isEncrypted:(BOOL *)a5;
- (void)setBodyParameter:(id)a3 forKey:(id)a4;
- (void)setContentDescription:(id)a3;
- (void)setContentID:(id)a3;
- (void)setContentLocation:(id)a3;
- (void)setContentTransferEncoding:(id)a3;
- (void)setDisposition:(id)a3;
- (void)setDispositionParameter:(id)a3 forKey:(id)a4;
- (void)setIsGenerated:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setMimeBody:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSubparts:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MFMimePart

- (BOOL)parseMimeBodyFromHeaderData:(id)a3 bodyData:(id)a4 isPartial:(BOOL)a5
{
  unsigned int v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = [(MFMimePart *)self mimeBody];
  if (v9)
  {
    unsigned int v10 = objc_msgSend((id)objc_msgSend(v9, "message"), "preferredEncoding");
    if (a3 && a4)
    {
      unsigned int v11 = v10;
      -[MFMimePart setRange:](self, "setRange:", 0, [a4 length]);
      id v12 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      [a3 length];
      if ((ECGetNextHeaderFromDataInRange() & 1) != 0
        || (v13 = _parseUuencodedParts(self, v11, a4, self->_range.location, self->_range.length)) == 0)
      {
        _parseHeaders((uint64_t)self, v11, a3, a4, v5);
      }
      else
      {
        v14 = v13;
        [(MFMimePart *)self setType:@"multipart"];
        [(MFMimePart *)self setSubtype:@"mixed"];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              [(MFMimePart *)self addSubpart:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v16);
        }
      }
      [v12 drain];
      LOBYTE(v9) = 1;
    }
    else
    {
      v19 = MFLogGeneral();
      LODWORD(v9) = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v9)
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = [a4 length];
        __int16 v27 = 2048;
        uint64_t v28 = [a3 length];
        _os_log_impl(&dword_1AFB03000, v19, OS_LOG_TYPE_INFO, "Mime parsing: Failed to parse mime body!  bodyData: %lu\theaderData: %lu", buf, 0x16u);
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
}

- (BOOL)parseMimeBodyDownloadIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message");
  char v10 = 1;
  unsigned __int8 v9 = 0;
  uint64_t v6 = [v5 bodyDataIsComplete:&v10 isPartial:&v9 downloadIfNecessary:v3];
  uint64_t v7 = [v5 headerDataDownloadIfNecessary:v3];
  return [(MFMimePart *)self parseMimeBodyFromHeaderData:v7 bodyData:v6 isPartial:v9];
}

- (void)setMimeBody:(id)a3
{
  id v5 = +[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:");
  body = self->_body;
  self->_body = (MFWeakReferenceHolder *)v5;

  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "message"), "messageURL");
  if (!self->_partURL) {
    self->_partURL = (NSURL *)(id)objc_msgSend(v7, "URLByAppendingPathComponent:", -[MFMimePart partNumber](self, "partNumber"));
  }
}

- (id)partNumber
{
  BOOL v3 = self;
  uint64_t v4 = [(MFWeakReferenceHolder *)v3->_parent retainedReference];
  if (v4)
  {
    id v5 = 0;
    while (1)
    {
      uint64_t v6 = (id *)v4;
      if (([*(id *)(v4 + 8) isEqualToString:@"multipart"] & 1) == 0
        && (![v6[1] isEqualToString:@"message"]
         || ![v6[2] isEqualToString:@"rfc822"]))
      {
        unsigned int v11 = v6;
        goto LABEL_21;
      }
      uint64_t v7 = (void *)[v6 type];
      if ([v7 isEqualToString:@"multipart"])
      {
        v8 = (MFMimePart *)[v6 firstChildPart];
        for (int i = 1; v8; v8 = [(MFMimePart *)v8 nextSiblingPart])
        {
          if (v3 == v8) {
            break;
          }
          ++i;
        }
        char v10 = (__CFString *)EFStringWithInt();
        if (!v10) {
          goto LABEL_17;
        }
      }
      else
      {
        if (![v7 isEqualToString:@"message"]) {
          goto LABEL_17;
        }
        char v10 = @"1";
        if ([(NSString *)[(MFMimePart *)v3 type] isEqualToString:@"multipart"]) {
          goto LABEL_17;
        }
      }
      if (v5)
      {
        objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, @".");
        objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, v10);
      }
      else
      {
        id v5 = (id)[(__CFString *)v10 mutableCopy];
      }
LABEL_17:

      uint64_t v4 = [v6[8] retainedReference];
      BOOL v3 = (MFMimePart *)v6;
      if (!v4)
      {
        unsigned int v11 = 0;
        BOOL v3 = (MFMimePart *)v6;
        goto LABEL_21;
      }
    }
  }
  unsigned int v11 = 0;
  id v5 = 0;
LABEL_21:

  if (!v5 && ![(NSString *)self->_type isEqualToString:@"multipart"]) {
    return @"1";
  }
  return v5;
}

- (id)mimeBody
{
  p_otherIvarsLock = &self->_otherIvarsLock;
  os_unfair_lock_lock(&self->_otherIvarsLock);
  uint64_t v4 = [(MFWeakReferenceHolder *)self->_parent retainedReference];
  id v5 = [(MFWeakReferenceHolder *)self->_body retainedReference];
  while (!v5 && v4)
  {
    id v5 = (id)[v4[9] retainedReference];
    uint64_t v6 = [v4[8] retainedReference];

    uint64_t v4 = (id *)v6;
  }

  os_unfair_lock_unlock(p_otherIvarsLock);
  return v5;
}

- (BOOL)isAttachment
{
  BOOL v3 = [(MFMimePart *)self disposition];
  if ([(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"])
  {
    if ([(MFMimePart *)self isReadableText])
    {
      if ([(MFMimePart *)self shouldConsiderInlineOverridingExchangeServer])
      {
LABEL_4:
        LOBYTE(v4) = 0;
        return v4;
      }
      if (![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"css"])
      {
        if (!v3) {
          goto LABEL_4;
        }
LABEL_23:
        LOBYTE(v4) = [(NSString *)v3 isEqualToString:@"attachment"];
        return v4;
      }
    }
LABEL_19:
    LOBYTE(v4) = 1;
    return v4;
  }
  if ([(NSString *)self->_type isEqualToString:@"multipart"])
  {
    if ([(NSString *)self->_subtype isEqualToString:@"x-folder"]) {
      goto LABEL_19;
    }
    if (![(NSString *)self->_subtype isEqualToString:@"appledouble"])
    {
      BOOL v6 = [(NSString *)self->_subtype isEqualToString:@"digest"];
      LOBYTE(v4) = 0;
      if (v6 || !v3) {
        return v4;
      }
      goto LABEL_23;
    }
    id v5 = objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart");
    LOBYTE(v4) = [v5 isAttachment];
  }
  else
  {
    if ([(NSString *)self->_type isEqualToString:@"message"])
    {
      LOBYTE(v4) = ![(MFMimePart *)self isGenerated];
      return v4;
    }
    if (![(NSString *)self->_type isEqualToString:@"application"]) {
      goto LABEL_19;
    }
    uint64_t v4 = objc_msgSend(@"pkcs7-signature", "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype"));
    if (v4) {
      LOBYTE(v4) = objc_msgSend(@"pkcs7-mime", "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype")) != 0;
    }
  }
  return v4;
}

- (BOOL)shouldConsiderInlineOverridingExchangeServer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFMimePart *)self dispositionParameterForKey:@"filename"];
  pthread_mutex_lock(&shouldConsiderInlineOverridingExchangeServer_reg_exp_mutex);
  uint64_t v6 = 0;
  if (!shouldConsiderInlineOverridingExchangeServer_regex)
  {
    shouldConsiderInlineOverridingExchangeServer_regex = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^ATT\\d{3,}\\.\\.?([A-z]{3}|c)$" options:0 error:&v6];
    if (!shouldConsiderInlineOverridingExchangeServer_regex)
    {
      BOOL v3 = MFLogGeneral();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1AFB03000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Could not generate regex: %@", buf, 0xCu);
      }
    }
  }
  if ([v2 length])
  {
    if (objc_msgSend((id)shouldConsiderInlineOverridingExchangeServer_regex, "numberOfMatchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length")))
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v4 = 1;
      if ([v2 compare:@"mime-attachment.txt" options:1]) {
        BOOL v4 = [v2 compare:@"mime-attachment.html" options:1] == 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  pthread_mutex_unlock(&shouldConsiderInlineOverridingExchangeServer_reg_exp_mutex);
  return v4;
}

- (NSString)disposition
{
  return (NSString *)[(MFMimePart *)self _objectInOtherIvarsForKey:*MEMORY[0x1E4F60670]];
}

- (id)dispositionParameterForKey:(id)a3
{
  id v5 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
  if (![a3 isEqualToString:@"filename"]
    || ![(NSString *)[(MFMimePart *)self type] isEqualToString:@"message"]
    || (id result = [(MFMimePart *)self contentDescription]) == 0)
  {
    uint64_t v7 = [a3 lowercaseString];
    return (id)[v5 objectForKey:v7];
  }
  return result;
}

+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5 info:(id *)a6
{
  v18[0] = (const char *)[a3 UTF8String];
  v18[1] = &v18[0][strlen(v18[0])];
  v18[2] = (const char *)0xAAAAAAAA08000100;
  id v19 = 0;
  uint64_t v9 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  char v10 = _copyNextMimeToken((unsigned int *)v18, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  id v16 = 0;
  id v17 = 0;
  unsigned int v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  while (_scanMimeKeyValuePair((uint64_t)v18, &v17, &v16))
  {
    id v12 = v17;
    if (v17) {
      BOOL v13 = v16 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      [v11 setObject:v16 forKey:_UniqueString((__CFString *)v17)];
      id v12 = v17;
    }
  }
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = v11;
  }
  if (v19) {

  }
  if (v9) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  return !v14;
}

- (NSString)type
{
  if (self->_type) {
    return self->_type;
  }
  else {
    return (NSString *)@"text";
  }
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)_UniqueString((__CFString *)a3);
}

- (void)setSubtype:(id)a3
{
  self->_subtype = (NSString *)_UniqueString((__CFString *)a3);
}

- (void)setBodyParameter:(id)a3 forKey:(id)a4
{
  uint64_t v6 = (__CFString *)_UniqueString((__CFString *)a4);
  if (([(__CFString *)v6 isEqualToString:@"charset"] & 1) != 0
    || [(__CFString *)v6 isEqualToString:@"format"])
  {
    a3 = _UniqueString((__CFString *)a3);
  }
  uint64_t v7 = _UniqueString(v6);
  _MFSetValueInDictionary(self, (void **)&self->_bodyParameters, (uint64_t)v7, (uint64_t)a3);
}

- (id)partURL
{
  id result = self->_partURL;
  if (!result)
  {
    parentPartURL = self->_parentPartURL;
    if (!parentPartURL)
    {
      if ([(MFMimePart *)self parentPart]) {
        id v5 = objc_msgSend(-[MFMimePart parentPart](self, "parentPart"), "partURL");
      }
      else {
        id v5 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:@"x-attach://"];
      }
      parentPartURL = v5;
      self->_parentPartURL = parentPartURL;
    }
    uint64_t v6 = [(MFMimePart *)self partNumber];
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = @"1";
    }
    id result = [(NSURL *)parentPartURL URLByAppendingPathComponent:v7 isDirectory:0];
    self->_partURL = (NSURL *)result;
  }
  return result;
}

- (BOOL)isReadableText
{
  BOOL v3 = [(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"];
  if (v3)
  {
    BOOL v4 = [(MFMimePart *)self subtype];
    if ([(NSString *)v4 isEqualToString:@"html"]
      || [(NSString *)v4 isEqualToString:@"enriched"]
      || [(NSString *)v4 isEqualToString:@"plain"])
    {
      LOBYTE(v3) = 1;
    }
    else if ([(NSString *)v4 isEqualToString:@"calendar"])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(NSString *)v4 isEqualToString:@"directory"];
    }
  }
  return v3;
}

- (NSString)subtype
{
  id result = self->_subtype;
  if (!result)
  {
    BOOL v4 = [(MFMimePart *)self type];
    if ([(NSString *)v4 isEqualToString:@"text"])
    {
      return (NSString *)@"plain";
    }
    else if ([(NSString *)v4 isEqualToString:@"multipart"])
    {
      return (NSString *)@"mixed";
    }
    else if ([(NSString *)v4 isEqualToString:@"message"])
    {
      return (NSString *)@"rfc822";
    }
    else if ([(NSString *)v4 isEqualToString:@"application"])
    {
      return (NSString *)@"octet-stream";
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = self;
  if (v4)
  {
    id v5 = v4;
    do
    {
      uint64_t v6 = [(MFMimePart *)v5 firstChildPart];
      if (v6) {
        [v3 addObject:v6];
      }
      uint64_t v7 = (MFMimePart *)[(MFMimePart *)v5 nextSiblingPart];
      [(MFMimePart *)v5 _clearNextAndSibling];

      if (!v7)
      {
        if (![v3 count]) {
          break;
        }
        uint64_t v7 = (MFMimePart *)(id)[v3 objectAtIndexedSubscript:0];
        [v3 removeObjectAtIndex:0];
      }
      id v5 = v7;
    }
    while (v7);
  }

  id v8 = (id)[(NSMutableDictionary *)self->_otherIvars objectForKey:@"x-decrypted-message-body"];
  id v9 = (id)[(NSMutableDictionary *)self->_otherIvars objectForKey:@"x-wrapped-subject"];
  id v10 = (id)[(NSMutableDictionary *)self->_otherIvars objectForKey:@"x-decrypted-message"];
  id v11 = (id)[(NSMutableDictionary *)self->_otherIvars objectForKey:@"x-decrypted-message-store"];

  v12.receiver = self;
  v12.super_class = (Class)MFMimePart;
  [(MFMimePart *)&v12 dealloc];
}

- (id)firstChildPart
{
  if ([(NSString *)self->_type isEqualToString:@"multipart"]
    || [(NSString *)self->_type isEqualToString:@"message"]
    && [(NSString *)self->_subtype isEqualToString:@"rfc822"])
  {
    return self->_nextPart;
  }
  else
  {
    return 0;
  }
}

- (void)_clearNextAndSibling
{
  self->_nextPart = 0;
}

- (id)_objectInOtherIvarsForKey:(id)a3
{
  p_otherIvarsLock = &self->_otherIvarsLock;
  os_unfair_lock_lock(&self->_otherIvarsLock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_otherIvars objectForKeyedSubscript:a3];
  os_unfair_lock_unlock(p_otherIvarsLock);
  return v6;
}

- (void)_setObjectInOtherIvars:(id)a3 forKey:(id)a4
{
  p_otherIvarsLock = &self->_otherIvarsLock;
  os_unfair_lock_lock(&self->_otherIvarsLock);
  otherIvars = self->_otherIvars;
  if (a3)
  {
    if (!otherIvars)
    {
      otherIvars = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      self->_otherIvars = otherIvars;
    }
    [(NSMutableDictionary *)otherIvars setObject:a3 forKey:a4];
  }
  else if (otherIvars)
  {
    [(NSMutableDictionary *)otherIvars removeObjectForKey:a4];
  }
  os_unfair_lock_unlock(p_otherIvarsLock);
}

- (id)nextSiblingPart
{
  if (![(NSString *)self->_type isEqualToString:@"multipart"]
    && (![(NSString *)self->_type isEqualToString:@"message"]
     || ![(NSString *)self->_subtype isEqualToString:@"rfc822"]))
  {
    return self->_nextPart;
  }
  return [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-nextsibling"];
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_range = a3;
  uint64_t v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    int v7 = 138543618;
    id v8 = NSStringFromRange(v12);
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_1AFB03000, v6, OS_LOG_TYPE_INFO, "Setting range %{public}@ for part %@", (uint8_t *)&v7, 0x16u);
  }
}

- (MFMimePart)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMimePart;
  id result = [(MFMimePart *)&v3 init];
  if (result)
  {
    result->_range = (_NSRange)xmmword_1AFB404B0;
    result->_otherIvarsLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setContentTransferEncoding:(id)a3
{
  self->_contentTransferEncoding = (NSString *)_UniqueString((__CFString *)a3);
}

- (void)addSubpart:(id)a3
{
  if (a3
    && ([(NSString *)self->_type isEqualToString:@"multipart"]
     || [(NSString *)self->_type isEqualToString:@"message"]
     && [(NSString *)self->_subtype isEqualToString:@"rfc822"]))
  {
    nextPart = self->_nextPart;
    if (nextPart)
    {
      for (int i = self->_nextPart; ; nextPart = i)
      {
        int i = [(MFMimePart *)i nextSiblingPart];
        if (!i) {
          break;
        }
      }
      type = nextPart->_type;
      if (type
        && ([(NSString *)type isEqualToString:@"multipart"]
         || [(NSString *)nextPart->_type isEqualToString:@"message"]
         && [(NSString *)nextPart->_subtype isEqualToString:@"rfc822"]))
      {
        [(MFMimePart *)nextPart _setObjectInOtherIvars:a3 forKey:@"x-nextsibling"];
      }
      else
      {
        nextPart->_nextPart = (MFMimePart *)a3;
      }
    }
    else
    {
      self->_nextPart = (MFMimePart *)a3;
    }
    setParent((uint64_t)a3, self);
  }
}

- (void)_clearParent
{
}

- (id)parentPart
{
  id v2 = [(MFWeakReferenceHolder *)self->_parent retainedReference];
  return v2;
}

- (void)decodeIfNecessary
{
  if (![(MFMimePart *)self decryptedMessageBodyIsEncrypted:0 isSigned:0])
  {
    if ((objc_super v3 = [(MFMimePart *)self type],
          BOOL v4 = [(MFMimePart *)self subtype],
          [(NSString *)v3 isEqualToString:@"multipart"])
      && [(NSString *)v4 isEqualToString:@"signed"]
      || !objc_msgSend(@"application", "mf_caseInsensitiveCompareExcludingXDash:", v3)
      && !objc_msgSend(@"pkcs7-mime", "mf_caseInsensitiveCompareExcludingXDash:", v4))
    {
      [(MFMimePart *)self contentsForTextSystem];
    }
  }
}

- (id)attachments
{
  id v3 = [(MFMimePart *)self decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v3)
  {
    return (id)[v3 attachments];
  }
  else
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    _getAttachmentsAndAddToCount(self, 0, v5);
    return v5;
  }
}

- (id)decryptedMessageBodyIsEncrypted:(BOOL *)a3 isSigned:(BOOL *)a4
{
  if (a3) {
    *a3 = objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", @"x-is-encrypted"), "BOOLValue");
  }
  if (a4) {
    *a4 = objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", @"x-is-signed"), "BOOLValue");
  }
  return [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-decrypted-message-body"];
}

- (void)setDisposition:(id)a3
{
  BOOL v4 = _UniqueString((__CFString *)a3);
  uint64_t v5 = *MEMORY[0x1E4F60670];
  [(MFMimePart *)self _setObjectInOtherIvars:v4 forKey:v5];
}

- (BOOL)hasValidMultipartSignedContentType
{
  BOOL v3 = [(MFMimePart *)self hasContentType:@"multipart" subtype:@"signed"];
  if (v3)
  {
    LOBYTE(v3) = [(MFMimePart *)self usesKnownSignatureProtocol];
  }
  return v3;
}

- (BOOL)hasContentType:(id)a3 subtype:(id)a4
{
  BOOL v6 = [(NSString *)[(MFMimePart *)self type] isEqualToString:a3];
  if (v6)
  {
    if (a4)
    {
      int v7 = [(MFMimePart *)self subtype];
      LOBYTE(v6) = [(NSString *)v7 isEqualToString:a4];
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)bodyParameterForKey:(id)a3
{
  bodyParameters = self->_bodyParameters;
  uint64_t v4 = [a3 lowercaseString];
  return (id)[(NSMutableDictionary *)bodyParameters objectForKey:v4];
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6
{
  id v7 = 0;
  [(MFMimePart *)self _ensureBodyDataToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 isComplete:a6 decoded:&v7];
  return v7;
}

- (void)_ensureBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 isComplete:(BOOL *)a6 decoded:(id *)a7
{
  BOOL v9 = a5;
  BOOL v44 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (![self mf_tryLock])
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal")
        && (BOOL v13 = MFLogGeneral(), os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)))
      {
        -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:](v13);
        if (!a6)
        {
LABEL_7:
          if (a7) {
            *a7 = 0;
          }
          return;
        }
      }
      else if (!a6)
      {
        goto LABEL_7;
      }
      *a6 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    [self mf_lock];
  }
  id v14 = [(MFWeakReferenceHolder *)self->_decodedData retainedReference];
  if (!v14)
  {
    [(MFMimePart *)self range];
    if (v17 >= a3) {
      unint64_t v18 = a3;
    }
    else {
      unint64_t v18 = v17;
    }
    fullData = self->_fullData;
    if (fullData)
    {
      v20 = fullData;
      if (a4)
      {
        [(MFMimePart *)self range];
        *a4 = v21;
      }
LABEL_20:
      BOOL v44 = 1;
LABEL_21:
      if (a7)
      {
        [self mf_unlock];
        id v15 = [(MFMimePart *)self decodedDataForData:v20];
        [self mf_lock];
        if (v15 && v44)
        {

          self->_decodedData = (MFWeakReferenceHolder *)+[MFWeakReferenceHolder weakReferenceWithObject:v15];
        }
      }
      else
      {
        id v15 = 0;
      }

      goto LABEL_41;
    }
    unint64_t v22 = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length];
    if (v22 >= v18)
    {
      if (v18)
      {
        v20 = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer copyDataWithUnixLineEndings];
        if (a4) {
          *a4 = v22;
        }
        goto LABEL_21;
      }
      v20 = objc_alloc_init(MFMutableData);
      goto LABEL_20;
    }
    long long v23 = objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message");
    if (!self->_partialDataConsumer) {
      self->_partialDataConsumer = objc_alloc_init(MFPartialNetworkDataConsumer);
    }
    char v24 = 0;
    while (1)
    {
      int v25 = objc_msgSend(v23, "fetchDataForMimePart:inRange:withConsumer:isComplete:downloadIfNecessary:", self, v22, v18 - v22, self->_partialDataConsumer, &v44, v9);
      unint64_t v26 = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length];
      if (v44) {
        break;
      }
      unint64_t v22 = v26;
      [(MFMimePart *)self range];
      if (v22 >= v27) {
        break;
      }
      if (!v25) {
        goto LABEL_50;
      }
      if (![(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length])
      {
        if (([(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length] != 0) | v24 & 1) {
          goto LABEL_50;
        }
        uint64_t v28 = MFLogGeneral();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[MFMimePart _ensureBodyDataToOffset:resultOffset:downloadIfNecessary:isComplete:decoded:](&buf, v43, v28);
        }

        self->_partialDataConsumer = objc_alloc_init(MFPartialNetworkDataConsumer);
        char v24 = 1;
      }
      if (v18 <= v22)
      {
LABEL_50:
        v20 = 0;
        goto LABEL_60;
      }
    }
    [(MFMimePart *)self range];
    if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
      -[MFMimePart setRange:](self, "setRange:", [(MFMimePart *)self range], [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length]);
    }
    BOOL v31 = [(NSString *)[(MFMimePart *)self contentTransferEncoding] isEqualToString:@"binary"];
    partialDataConsumer = self->_partialDataConsumer;
    if (v31) {
      v33 = (MFMutableData *)[(MFPartialNetworkDataConsumer *)partialDataConsumer data];
    }
    else {
      v33 = [(MFPartialNetworkDataConsumer *)partialDataConsumer copyDataWithUnixLineEndings];
    }
    v20 = v33;

    self->_partialDataConsumer = 0;
    self->_fullData = (NSData *)v20;
    if (a4)
    {
      [(MFMimePart *)self range];
      *a4 = v34;
    }
    BOOL v44 = 1;
LABEL_60:
    p_super = &v20->super.super;
    if (!v20)
    {
      p_super = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer data];
      if (!p_super)
      {
        v20 = 0;
        goto LABEL_21;
      }
    }
    if (v25
      && (id v36 = [(MFMimePart *)self storeData:p_super inMessage:v23 isComplete:p_super == (NSData *)v20]) != 0)
    {
      v37 = v36;
      if (p_super != self->_fullData)
      {

        v38 = objc_alloc_init(MFPartialNetworkDataConsumer);
        self->_partialDataConsumer = v38;
        [(MFPartialNetworkDataConsumer *)v38 appendData:v37];
        int v39 = objc_msgSend(@"base64", "isEqualToString:", -[MFMimePart contentTransferEncoding](self, "contentTransferEncoding"));

        v40 = self->_partialDataConsumer;
        if (v39)
        {
          v41 = (MFMutableData *)[(MFPartialNetworkDataConsumer *)v40 data];
          goto LABEL_70;
        }
LABEL_69:
        v41 = [(MFPartialNetworkDataConsumer *)v40 copyDataWithUnixLineEndings];
LABEL_70:
        v20 = v41;
        if (a4) {
          *a4 = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length];
        }
        goto LABEL_76;
      }

      self->_fullData = (NSData *)v37;
      v20 = v37;
    }
    else if (!v20)
    {
      v40 = self->_partialDataConsumer;
      goto LABEL_69;
    }
LABEL_76:
    [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer purge];
    goto LABEL_21;
  }
  id v15 = v14;
  if (a4)
  {
    [(MFMimePart *)self range];
    *a4 = v16;
  }
  BOOL v44 = 1;
LABEL_41:
  [self mf_unlock];
  if (a6) {
    *a6 = v44;
  }
  if (a7) {
    *a7 = v15;
  }
  id v29 = v15;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

+ (void)initialize
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!sFore) {
    sFore = [[MFLock alloc] initWithName:@"fore" andDelegate:a1];
  }
  if (!sStringsCache)
  {
    v5.hash = (NSUInteger (__cdecl *)(NSHashTable *, const void *))_UniquingHash;
    v5.isEqual = (BOOL (__cdecl *)(NSHashTable *, const void *, const void *))_UniquingIsEqual;
    *(_OWORD *)&v5.retain = *(_OWORD *)(MEMORY[0x1E4F28770] + 16);
    v5.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))_UniquingDescribe;
    sStringsCache = (uint64_t)NSCreateHashTable(&v5, 0x19uLL);
    BOOL v3 = @"multipart";
    v5.hash = (NSUInteger (__cdecl *)(NSHashTable *, const void *))@"multipart";
    v5.isEqual = (BOOL (__cdecl *)(NSHashTable *, const void *, const void *))@"message";
    v5.retain = (void (__cdecl *)(NSHashTable *, const void *))@"text";
    v5.release = (void (__cdecl *)(NSHashTable *, void *))@"application";
    v5.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))@"image";
    BOOL v6 = @"audio";
    id v7 = @"video";
    id v8 = @"alternative";
    BOOL v9 = @"mixed";
    id v10 = @"related";
    uint64_t v11 = @"x-folder";
    NSRange v12 = @"appledouble";
    BOOL v13 = @"digest";
    id v14 = @"signed";
    id v15 = @"plain";
    unint64_t v16 = @"enriched";
    unint64_t v17 = @"html";
    unint64_t v18 = @"css";
    id v19 = @"rfc822";
    v20 = @"applefile";
    unint64_t v21 = @"filename";
    unint64_t v22 = @"name";
    long long v23 = @"x-mac-type";
    char v24 = @"x-mac-creator";
    int v25 = @"format";
    unint64_t v26 = @"flowed";
    unsigned int v4 = 1;
    uint64_t v27 = 0;
    do
    {
      NSHashInsert((NSHashTable *)sStringsCache, v3);
      BOOL v3 = (__CFString *)*((void *)&v5.hash + v4++);
    }
    while (v3);
  }
  if (!sNSXMLLock) {
    sNSXMLLock = [[MFLock alloc] initWithName:@"NSXMLLock" andDelegate:a1];
  }
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v30[2] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_type isEqualToString:@"multipart"]
    && [(NSString *)self->_subtype isEqualToString:@"alternative"])
  {
    id v13 = (id)objc_msgSend(-[MFMimePart chosenAlternativePart](self, "chosenAlternativePart"), "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", a3, a4, v9, v8, a7);
    if (!v13) {
      goto LABEL_13;
    }
LABEL_39:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v27 = v13;
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    }
    return v13;
  }
  if ([(MFMimePart *)self isAttachment]
    && (![(NSString *)self->_type isEqualToString:@"application"]
     || [(NSString *)self->_subtype mf_caseInsensitiveCompareExcludingXDash:@"pkcs7-mime"]))
  {
    id v13 = _createAttachment(self);
    if (v13)
    {
      if (a4)
      {
        [(MFMimePart *)self range];
        *a4 = v14;
      }
      if (a7) {
        *a7 = 1;
      }
      goto LABEL_39;
    }
  }
LABEL_13:
  id v15 = [(MFMimePart *)self contentsForTextSystemToOffset:a3 resultOffset:a4 downloadIfNecessary:v9 asHTML:v8 isComplete:a7];
  if (!v15 && v9)
  {
    if ([(MFMimePart *)self _shouldContinueDecodingProcess]) {
      id v15 = (id)[NSNumber numberWithInt:4294967254];
    }
    else {
      id v15 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v16 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "attachmentClass")), "initWithWrapper:", v15);
    BOOL v17 = [(NSString *)[(MFMimePart *)self type] isEqualToString:@"application"];
    unint64_t v18 = self;
    if (v17)
    {
      uint64_t v19 = objc_msgSend(@"pkcs7-mime", "mf_caseInsensitiveCompareExcludingXDash:", -[MFMimePart subtype](self, "subtype", self));
      unint64_t v18 = self;
      if (!v19) {
        unint64_t v18 = (MFMimePart *)objc_msgSend((id)objc_msgSend(-[MFMimePart decryptedMessageBodyIsEncrypted:isSigned:](self, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0), "topLevelPart"), "_partThatIsAttachment");
      }
    }
    [v16 setMimePart:v18];
    id v13 = v16;
LABEL_38:
    if (!v13) {
      return v13;
    }
    goto LABEL_39;
  }
  if ([(id)objc_opt_class() isRecognizedClassForContent:v15])
  {
    if ([(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"]
      && (id v20 = [(MFMimePart *)self parentPart],
          objc_msgSend((id)objc_msgSend(v20, "type"), "isEqualToString:", @"multipart"))
      && objc_msgSend((id)objc_msgSend(v20, "subtype"), "isEqualToString:", @"alternative")
      && (unint64_t v21 = (MFMimePart *)objc_msgSend((id)objc_msgSend(v20, "subparts"), "lastObject"), v22 = v21, v21 != self)
      && _isCalendar(v21))
    {
      Attachment = _createAttachment(v22);
      v30[0] = v15;
      v30[1] = Attachment;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (v24) {
      id v13 = (id)v24;
    }
    else {
      id v13 = v15;
    }
    goto LABEL_38;
  }
  if (v15)
  {
    int v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint8_t buf = 138412290;
      uint64_t v29 = objc_opt_class();
      _os_log_impl(&dword_1AFB03000, v25, OS_LOG_TYPE_INFO, "Got back unrecognized class %@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6 isComplete:(BOOL *)a7
{
  BOOL v8 = 0;
  [(MFMimePart *)self _contents:&v8 toOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:a6 isComplete:a7];
  return v8;
}

- (void)_contents:(id *)a3 toOffset:(unint64_t)a4 resultOffset:(unint64_t *)a5 downloadIfNecessary:(BOOL)a6 asHTML:(BOOL)a7 isComplete:(BOOL *)a8
{
  BOOL v9 = a7;
  BOOL v39 = a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  NSRange v12 = [(MFMimePart *)self type];
  id v13 = [(MFMimePart *)self subtype];
  strcpy(__source, "decode");
  CFIndex v14 = [(__CFString *)v12 length];
  uint64_t v15 = [(__CFString *)v13 length];
  uint64_t v16 = v15;
  size_t v17 = v14 + v15 + 8;
  v37 = a8;
  if (v17 < 0x41)
  {
    unint64_t v18 = (char *)v42;
    size_t v17 = 64;
  }
  else
  {
    unint64_t v18 = (char *)malloc_type_malloc(v14 + v15 + 8, 0xE22AB7FFuLL);
  }
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42[2] = v19;
  v42[3] = v19;
  v42[0] = v19;
  v42[1] = v19;
  strlcpy(v18, __source, v17);
  id v20 = (UInt8 *)index(v18, 0);
  if (v14)
  {
    int v21 = [(__CFString *)v12 hasPrefix:@"x-"];
    if (v21) {
      v14 -= 2;
    }
    if (v14 >= 1)
    {
      v22.NSUInteger location = v21 ? 2 : 0;
      v22.NSUInteger length = v14;
      if (v14 == MFStringGetBytes(v12, v22, 0x600u, 0, 0, v20, (CFIndex)&v18[v17 + ~(unint64_t)v20], 0))
      {
        UInt8 *v20 = __toupper((char)*v20);
        v20 += v14;
      }
    }
  }
  long long v23 = v20;
  if (v16)
  {
    int v24 = [(__CFString *)v13 hasPrefix:@"x-"];
    CFIndex v25 = v24 ? v16 - 2 : v16;
    long long v23 = v20;
    if (v25 >= 1)
    {
      v26.NSUInteger location = v24 ? 2 : 0;
      v26.NSUInteger length = v25;
      CFIndex Bytes = MFStringGetBytes(v13, v26, 0x600u, 0, 0, v20, (CFIndex)&v18[v17 + ~(unint64_t)v20], 0);
      long long v23 = v20;
      if (v25 == Bytes)
      {
        UInt8 *v20 = __toupper((char)*v20);
        long long v23 = &v20[v25];
      }
    }
  }
  *long long v23 = 0;
  for (int i = index(v18, 45); i; int i = index(i + 1, 45))
    *int i = 95;
  uint64_t v29 = [(MFMimePart *)self _selectorForCString:v18];
  uint64_t v30 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v39), @"__MIME_PART_DECODE_DOWNLOAD");
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v9), @"__MIME_PART_DECODE_AS_HTML");
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4), @"__MIME_PART_DECODE_OFFSET");
  }
  id v31 = (id)[v30 objectForKey:@"__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"];
  objc_msgSend(v30, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"__MIME_PART_COLLECT_DECODED_MESSAGE_BODY");
  if (v29 && (objc_opt_respondsToSelector() & 1) != 0
    || *v20
    && (UInt8 *v20 = 0, (v32 = [(MFMimePart *)self _selectorForCString:v18]) != 0)
    && (uint64_t v29 = v32, (objc_opt_respondsToSelector() & 1) != 0))
  {
    id v33 = (id)[(MFMimePart *)self performSelector:v29];
  }
  else
  {
    id v33 = 0;
  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    [v30 removeObjectForKey:@"__MIME_PART_DECODE_OFFSET"];
  }
  if (a5)
  {
    unint64_t v34 = (void *)[v30 objectForKey:@"__MIME_PART_DECODE_RESULT_OFFSET"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *a5 = [v34 unsignedIntValue];
    }
    [v30 removeObjectForKey:@"__MIME_PART_DECODE_RESULT_OFFSET"];
  }
  if (v37)
  {
    v35 = (void *)[v30 objectForKey:@"__MIME_PART_RESULT_IS_COMPLETE"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL *v37 = [v35 BOOLValue];
    }
    [v30 removeObjectForKey:@"__MIME_PART_RESULT_IS_COMPLETE"];
  }
  uint64_t v36 = [v30 objectForKey:@"__MIME_PART_DECODED_MESSAGE_BODY"];
  if (v36)
  {
    [(MFMimePart *)self _setRFC822DecodedMessageBody:v36];
    [v30 removeObjectForKey:@"__MIME_PART_DECODED_MESSAGE_BODY"];
  }
  if (v31)
  {
    [v30 setObject:v31 forKey:@"__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"];
  }
  else
  {
    [v30 removeObjectForKey:@"__MIME_PART_COLLECT_DECODED_MESSAGE_BODY"];
  }
  if (v18 != (char *)v42) {
    free(v18);
  }
  if (v33
    || ![(MFMimePart *)self _shouldContinueDecodingProcess]
    || [(NSString *)self->_type isEqualToString:@"multipart"])
  {
    if (!a3) {
      return;
    }
    goto LABEL_55;
  }
  if (a3)
  {
    id v33 = [(MFMimePart *)self copyBodyDataToOffset:a4 resultOffset:a5 downloadIfNecessary:v39 isComplete:v37];
LABEL_55:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = (id)[objc_allocWithZone((Class)MFMessageFileWrapper) initRegularFileWithContents:v33];
      [(MFMimePart *)self configureFileWrapper:v33];
    }
    *a3 = v33;
    return;
  }
  if (v37) {
    BOOL *v37 = [(MFMimePart *)self _hasCompleteBodyDataToOffset:a4];
  }
}

- (SEL)_selectorForCString:(char *)a3
{
  if (_selectorForCString__onceToken != -1) {
    dispatch_once(&_selectorForCString__onceToken, &__block_literal_global_8);
  }
  unsigned int v4 = (NSString *)[NSString stringWithUTF8String:a3];
  if (![(id)_selectorForCString__allowedMethodNames containsObject:v4]) {
    return 0;
  }
  return NSSelectorFromString(v4);
}

- (id)childPartWithNumber:(id)a3
{
  NSHashTableCallBacks v5 = self;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(MFMimePart *)self parentPart]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"MimePart.m", 780, @"%@ cannot be called on non-top-level MIME parts", NSStringFromSelector(a2));
  }
  if ([(MFMimePart *)v5 firstChildPart])
  {
    BOOL v6 = (void *)[a3 componentsSeparatedByString:@"."];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_6:
      uint64_t v10 = 0;
LABEL_7:
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) integerValue];
      if (v11 < 1)
      {
        return 0;
      }
      else
      {
        uint64_t v12 = v11;
        for (int i = [(MFMimePart *)v5 firstChildPart];
              ;
              int i = [(MFMimePart *)i nextSiblingPart])
        {
          NSHashTableCallBacks v5 = i;
          if (!i) {
            break;
          }
          if (!--v12)
          {
            if (++v10 != v8) {
              goto LABEL_7;
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
            if (v8) {
              goto LABEL_6;
            }
            return v5;
          }
        }
      }
    }
  }
  else if (![a3 isEqualToString:@"1"])
  {
    return 0;
  }
  return v5;
}

- (id)attachmentFilename
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  FilenameEncodingHint = _getFilenameEncodingHint((id *)&self->super.isa);
  id v4 = [(MFMimePart *)self dispositionParameterForKey:@"filename"];
  NSHashTableCallBacks v5 = objc_msgSend(v4, "mf_decodeMimeHeaderValueWithCharsetHint:", FilenameEncodingHint);
  if ([v5 isEqualToString:&stru_1F08428B0]) {
    NSHashTableCallBacks v5 = v4;
  }
  BOOL v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1AFB03000, v6, OS_LOG_TYPE_INFO, "---filename=%@", buf, 0xCu);
  }
  if (v5
    || ![(NSString *)[(MFMimePart *)self type] isEqualToString:@"message"]
    && ![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"external-body"]
    && (NSHashTableCallBacks v5 = objc_msgSend(-[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", @"name"), "mf_decodeMimeHeaderValueWithCharsetHint:", _getFilenameEncodingHint((id *)&self->super.isa))) != 0|| -[NSString isEqualToString:](self->_type, "isEqualToString:", @"multipart")&& -[NSString isEqualToString:](self->_subtype, "isEqualToString:", @"appledouble")&& ((NSHashTableCallBacks v5 = objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "attachmentFilename")) != 0|| (NSHashTableCallBacks v5 = objc_msgSend((id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart"), "attachmentFilename")) != 0))
  {
    uint64_t v7 = objc_msgSend(v5, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
    if ((unint64_t)[v7 length] >= 0x100) {
      uint64_t v7 = (void *)[v7 substringToIndex:255];
    }
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", @"/", @"_"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @" "), "stringByReplacingOccurrencesOfString:withString:", @"\t", @" ");
  }
  else
  {
    uint64_t v9 = objc_alloc_init(MFTypeInfo);
    -[MFTypeInfo setMimeType:](v9, "setMimeType:", [NSString stringWithFormat:@"%@/%@", -[MFMimePart type](self, "type"), -[MFMimePart subtype](self, "subtype")]);
    MFGetTypeInfo(v9, 2);
    if ([(MFTypeInfo *)v9 pathExtension]) {
      uint64_t v8 = (__CFString *)objc_msgSend(@"mime-attachment", "stringByAppendingPathExtension:", -[MFTypeInfo pathExtension](v9, "pathExtension"));
    }
    else {
      uint64_t v8 = @"mime-attachment";
    }
  }
  return v8;
}

- (id)_fullMimeTypeEvenInsideAppleDouble
{
  if (![(NSString *)self->_type isEqualToString:@"multipart"]
    || ![(NSString *)self->_subtype isEqualToString:@"appledouble"]
    || (BOOL v3 = objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "nextSiblingPart")) == 0)
  {
    if (objc_msgSend(@"application", "isEqualToString:", -[MFMimePart type](self, "type"))
      && objc_msgSend(@"zip", "isEqualToString:", -[MFMimePart subtype](self, "subtype")))
    {
      id v5 = [(MFMimePart *)self attachmentFilename];
      if ([v5 hasSuffix:@".pages.zip"]) {
        return @"application/vnd.iwork.pages.archive";
      }
      if ([v5 hasSuffix:@".key.zip"]) {
        return @"application/vnd.iwork.keynote.archive";
      }
      if ([v5 hasSuffix:@".numbers.zip"]) {
        return @"application/vnd.iwork.numbers.archive";
      }
    }
    else
    {
      if (!objc_msgSend(@"application", "isEqualToString:", -[MFMimePart type](self, "type"))
        || !objc_msgSend(@"octet-stream", "isEqualToString:", -[MFMimePart subtype](self, "subtype")))
      {
        goto LABEL_22;
      }
      BOOL v6 = objc_msgSend(-[MFMimePart attachmentFilename](self, "attachmentFilename"), "pathExtension");
      if ([v6 isEqualToString:@"pages"]) {
        return @"application/x-iwork-pages-sffpages";
      }
      if ([v6 isEqualToString:@"key"]) {
        return @"application/x-iwork-keynote-sffkey";
      }
      if ([v6 isEqualToString:@"numbers"]) {
        return @"application/x-iwork-numbers-sffnumbers";
      }
    }
LABEL_22:
    id v4 = (id)[(NSString *)[(MFMimePart *)self type] mutableCopy];
    [v4 appendString:@"/"];
    objc_msgSend(v4, "appendString:", -[MFMimePart subtype](self, "subtype"));
    return v4;
  }
  id v4 = (id)[v3 _fullMimeTypeEvenInsideAppleDouble];
  if (!v4) {
    goto LABEL_22;
  }
  return v4;
}

- (unsigned)textEncoding
{
  CFStringRef SomeCharsetFromPartTree = [(MFMimePart *)self bodyParameterForKey:@"charset"];
  if (!SomeCharsetFromPartTree) {
    CFStringRef SomeCharsetFromPartTree = (const __CFString *)_getSomeCharsetFromPartTree((id *)&self->super.isa);
  }
  return MFEncodingForCharsetWithFallback(SomeCharsetFromPartTree, 0xFFFFFFFFLL);
}

- (void)setDispositionParameter:(id)a3 forKey:(id)a4
{
  id v7 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
  uint64_t v10 = v7;
  uint64_t v8 = _UniqueString((__CFString *)a4);
  uint64_t v9 = _MFSetValueInDictionary(self, &v10, (uint64_t)v8, (uint64_t)a3);
  if (v10) {
    uint64_t v9 = (void *)[(MFMimePart *)self _setObjectInOtherIvars:v10 forKey:@"x-disposition-parameters"];
  }
  if (!v7)
  {
    MEMORY[0x1F41817F8](v9);
  }
}

- (void)setContentID:(id)a3
{
}

- (id)decodedDataForData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v5 = [(MFMimePart *)self contentTransferEncoding];
  if (!v5) {
    return a3;
  }
  BOOL v6 = v5;
  if ([(NSString *)v5 isEqualToString:@"7bit"]
    || [(NSString *)v6 isEqualToString:@"8bit"]
    || [(NSString *)v6 isEqualToString:@"binary"])
  {
    return a3;
  }
  if ([(NSString *)v6 isEqualToString:@"quoted-printable"])
  {
    id result = (id)objc_msgSend(a3, "mf_decodeQuotedPrintableForText:", -[NSString isEqualToString:](-[MFMimePart type](self, "type"), "isEqualToString:", @"text"));
  }
  else if ([(NSString *)v6 isEqualToString:@"base64"])
  {
    id result = (id)objc_msgSend(a3, "mf_decodeBase64");
  }
  else
  {
    if (![(NSString *)v6 isEqualToString:@"x-uuencode"]) {
      goto LABEL_16;
    }
    id result = (id)objc_msgSend(a3, "mf_decodeUuencoded");
  }
  if (!result)
  {
LABEL_16:
    uint64_t v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1AFB03000, v8, OS_LOG_TYPE_INFO, "*** Failed to decode %@ data, treating as binary", (uint8_t *)&v9, 0xCu);
    }
    return a3;
  }
  return result;
}

- (NSString)contentTransferEncoding
{
  return self->_contentTransferEncoding;
}

- (NSString)contentID
{
  return (NSString *)[(MFMimePart *)self _objectInOtherIvarsForKey:*MEMORY[0x1E4F60678]];
}

- (void)configureFileWrapper:(id)a3
{
  id v5 = [(MFMimePart *)self bodyParameterForKey:@"x-unix-mode"];
  if (![a3 preferredFilename]) {
    objc_msgSend(a3, "setPreferredFilename:", -[MFMimePart attachmentFilename](self, "attachmentFilename"));
  }
  if (![a3 mimeType] && -[MFMimePart subtype](self, "subtype")) {
    objc_msgSend(a3, "setMimeType:", -[MFMimePart _fullMimeTypeEvenInsideAppleDouble](self, "_fullMimeTypeEvenInsideAppleDouble"));
  }
  if (v5)
  {
    unint64_t v6 = strtoul((const char *)objc_msgSend(v5, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v6)
    {
      id v7 = (void *)[a3 fileAttributes];
      if (v7) {
        uint64_t v8 = [v7 mutableCopyWithZone:0];
      }
      else {
        uint64_t v8 = [objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      int v9 = (void *)v8;
      uint64_t v10 = [NSNumber numberWithUnsignedLong:v6];
      [v9 setObject:v10 forKey:*MEMORY[0x1E4F28330]];
      [a3 setFileAttributes:v9];
    }
  }
  uint64_t v11 = [(MFMimePart *)self contentID];
  if (v11)
  {
    [a3 setContentID:v11];
  }
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__MFMimePart_log__block_invoke;
  block[3] = &unk_1E5F89BF8;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  return (OS_os_log *)log_log_0;
}

os_log_t __17__MFMimePart_log__block_invoke(uint64_t a1)
{
  v1 = [NSStringFromClass(*(Class *)(a1 + 32)) UTF8String];
  os_log_t result = os_log_create("com.apple.email", v1);
  log_log_0 = (uint64_t)result;
  return result;
}

- (id)bodyParameterKeys
{
  return (id)[(NSMutableDictionary *)self->_bodyParameters allKeys];
}

- (id)dispositionParameterKeys
{
  id v2 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
  return (id)[v2 allKeys];
}

- (NSString)contentDescription
{
  return (NSString *)[(MFMimePart *)self _objectInOtherIvarsForKey:*MEMORY[0x1E4F60668]];
}

- (void)setContentDescription:(id)a3
{
}

- (NSString)contentLocation
{
  return (NSString *)[(MFMimePart *)self _objectInOtherIvarsForKey:*MEMORY[0x1E4F60688]];
}

- (void)setContentLocation:(id)a3
{
}

- (NSArray)languages
{
  return (NSArray *)[(MFMimePart *)self _objectInOtherIvarsForKey:*MEMORY[0x1E4F60680]];
}

- (void)setLanguages:(id)a3
{
}

- (id)subparts
{
  if (![(NSString *)self->_type isEqualToString:@"multipart"]
    && (![(NSString *)self->_type isEqualToString:@"message"]
     || ![(NSString *)self->_subtype isEqualToString:@"rfc822"]))
  {
    return 0;
  }
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(MFMimePart *)self firstChildPart];
  if (v4)
  {
    id v5 = v4;
    do
    {
      [v3 addObject:v5];
      id v5 = (void *)[v5 nextSiblingPart];
    }
    while (v5);
  }
  return v3;
}

- (id)subpartAtIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  id result = [(MFMimePart *)self firstChildPart];
  if (result)
  {
    int64_t v5 = a3 + 1;
    do
    {
      if (!--v5) {
        break;
      }
      id result = (id)[result nextSiblingPart];
    }
    while (result);
  }
  return result;
}

- (void)setSubparts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_type isEqualToString:@"multipart"]
    || [(NSString *)self->_type isEqualToString:@"message"]
    && [(NSString *)self->_subtype isEqualToString:@"rfc822"])
  {
    id v5 = [(MFMimePart *)self firstChildPart];
    if (v5)
    {
      unint64_t v6 = v5;
      do
      {
        id v7 = (id)[v6 nextSiblingPart];
        setParent((uint64_t)v6, 0);
        [v6 _setObjectInOtherIvars:0 forKey:@"x-nextsibling"];

        unint64_t v6 = v7;
      }
      while (v7);
    }

    self->_nextPart = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(a3);
          }
          [(MFMimePart *)self addSubpart:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)isDecodingComplete
{
  return [(MFMimePart *)self decryptedMessageBodyIsEncrypted:0 isSigned:0] != 0;
}

- (BOOL)isSecurePart
{
  BOOL v3 = [(MFMimePart *)self type];
  if (![(NSString *)v3 ef_caseInsensitiveIsEqualToString:@"application"])return [(NSString *)v3 ef_caseInsensitiveIsEqualToString:@"multipart"]&& [(NSString *)[(MFMimePart *)self subtype] ef_caseInsensitiveIsEqualToString:@"signed"]&& [(MFMimePart *)self usesKnownSignatureProtocol]; {
  id v4 = [(MFMimePart *)self subtype];
  }
  if (([(NSString *)v4 ef_caseInsensitiveIsEqualToString:@"pkcs7-mime"] & 1) != 0
    || ([(NSString *)v4 ef_caseInsensitiveIsEqualToString:@"pkcs7-signature"] & 1) != 0)
  {
    return 1;
  }
  if (![(NSString *)v4 ef_caseInsensitiveIsEqualToString:@"octet-stream"])return 0; {
  id v5 = objc_msgSend(-[MFMimePart attachmentFilename](self, "attachmentFilename"), "pathExtension");
  }
  if ((objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", @"p7m") & 1) != 0
    || (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", @"p7s") & 1) != 0
    || (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", @"p7c") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", @"p7z");
}

- (BOOL)hasSecureSubparts
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v9 = __31__MFMimePart_hasSecureSubparts__block_invoke;
  uint64_t v10 = &unk_1E5F89C20;
  uint64_t v11 = &v12;
  char v16 = 0;
  BOOL v3 = [(MFMimePart *)self firstChildPart];
  if (v3)
  {
    while (1)
    {
      id v4 = v3;
      v9((uint64_t)&v8, v3, &v16);
      if (v16) {
        break;
      }
      BOOL v3 = [(MFMimePart *)v4 firstChildPart];
      if (!v3)
      {
        while (1)
        {
          BOOL v3 = [(MFMimePart *)v4 nextSiblingPart];
          if (v3) {
            break;
          }
          id v5 = [(MFMimePart *)v4 parentPart];
          id v4 = v5;
          if (v5 == self || !v5) {
            goto LABEL_9;
          }
        }
      }
    }
  }
LABEL_9:
  char v6 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __31__MFMimePart_hasSecureSubparts__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isSecurePart];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (NSString)description
{
  BOOL v3 = (void *)[MEMORY[0x1E4F28E78] string];
  id v4 = [(MFMimePart *)self parentPart];
  for (unsigned int i = 0; v4; v4 = (id)[v4 parentPart])
    ++i;
  _appendToDescriptionWithIndent((uint64_t)self, v3, i);
  return (NSString *)v3;
}

- (id)_partThatIsAttachment
{
  id v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MFMimePart *)self isAttachment]) {
    return v2;
  }
  if (![(NSString *)v2->_type isEqualToString:@"multipart"]) {
    return 0;
  }
  if (![(NSString *)v2->_subtype isEqualToString:@"alternative"])
  {
    id v5 = [(MFMimePart *)v2 subparts];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * i) _partThatIsAttachment];
          if (v10) {
            return v10;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        id v2 = 0;
        if (v7) {
          continue;
        }
        break;
      }
      return v2;
    }
    return 0;
  }
  id v3 = [(MFMimePart *)v2 chosenAlternativePart];
  return (id)[v3 _partThatIsAttachment];
}

- (BOOL)isRich
{
  id v3 = [(MFMimePart *)self type];
  if ([(NSString *)v3 isEqualToString:@"text"])
  {
    if (![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"plain"]) {
      return ![(MFMimePart *)self isAttachment];
    }
LABEL_18:
    LOBYTE(v4) = 0;
    return v4;
  }
  if ([(NSString *)v3 isEqualToString:@"multipart"])
  {
    if (![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"alternative"])
    {
      id v8 = [(MFMimePart *)self firstChildPart];
      if (v8)
      {
        uint64_t v9 = v8;
        do
        {
          LOBYTE(v4) = [v9 isRich];
          uint64_t v10 = [v9 nextSiblingPart];
          if (!v10) {
            break;
          }
          uint64_t v9 = (void *)v10;
        }
        while ((v4 & 1) == 0);
        return v4;
      }
      goto LABEL_18;
    }
    id v5 = [(MFMimePart *)self chosenAlternativePart];
    return [v5 isRich];
  }
  else
  {
    if (![(NSString *)v3 isEqualToString:@"message"]) {
      goto LABEL_18;
    }
    uint64_t v7 = [(MFMimePart *)self subtype];
    return [(NSString *)v7 isEqualToString:@"rfc822"];
  }
}

- (BOOL)isHTML
{
  id v3 = [(MFMimePart *)self type];
  if ([(NSString *)v3 isEqualToString:@"text"])
  {
    if ([(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"html"]) {
      return ![(NSString *)[(MFMimePart *)self disposition] isEqualToString:@"attachment"];
    }
LABEL_18:
    LOBYTE(v4) = 0;
    return v4;
  }
  if ([(NSString *)v3 isEqualToString:@"multipart"])
  {
    if (![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"alternative"])
    {
      id v7 = [(MFMimePart *)self firstChildPart];
      if (v7)
      {
        id v8 = v7;
        do
        {
          LOBYTE(v4) = [v8 isHTML];
          uint64_t v9 = [v8 nextSiblingPart];
          if (!v9) {
            break;
          }
          id v8 = (void *)v9;
        }
        while ((v4 & 1) == 0);
        return v4;
      }
      goto LABEL_18;
    }
    id v5 = [(MFMimePart *)self chosenAlternativePart];
  }
  else
  {
    if (![(NSString *)v3 isEqualToString:@"message"]
      || ![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"rfc822"])
    {
      goto LABEL_18;
    }
    id v5 = (id)objc_msgSend(-[MFMimePart firstChildPart](self, "firstChildPart"), "startPart");
  }
  return [v5 isHTML];
}

- (BOOL)usesKnownSignatureProtocol
{
  id v2 = (const char *)objc_msgSend(-[MFMimePart bodyParameterForKey:](self, "bodyParameterForKey:", @"protocol"), "UTF8String");
  if (!v2) {
    return 0;
  }
  v8[0] = v2;
  v8[1] = &v2[strlen(v2)];
  v8[2] = 0xAAAAAAAA08000100;
  id v9 = 0;
  CFMutableStringRef MimeToken = _copyNextMimeToken((unsigned int *)v8, (uint64_t)&SLASH_SEPARATOR_MASK, 1);
  CFMutableStringRef v4 = _copyNextMimeToken((unsigned int *)v8, (uint64_t)&SPACE_SEMICOLON_COMMA_SEPARATOR_MASK, 1);
  CFMutableStringRef v5 = v4;
  BOOL v6 = 0;
  if (MimeToken && v4)
  {
    if (objc_msgSend(@"application", "caseInsensitiveCompare:", MimeToken, v8[0])) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = objc_msgSend(@"pkcs7-signature", "mf_caseInsensitiveCompareExcludingXDash:", v5) == 0;
    }
  }

  if (v9) {
  return v6;
  }
}

- (id)rfc822DecodedMessageBody
{
  return [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-rfc822-decoded-message-body"];
}

- (void)_setRFC822DecodedMessageBody:(id)a3
{
}

- (void)_setWrappedSubject:(id)a3
{
}

- (void)_setDecryptedMessageBody:(id)a3 isEncrypted:(BOOL)a4 isSigned:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = (void *)[a3 message];
  uint64_t v10 = [v9 messageStore];
  [(MFMimePart *)self _setObjectInOtherIvars:a3 forKey:@"x-decrypted-message-body"];
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", [NSNumber numberWithBool:v6], @"x-is-encrypted");
  -[MFMimePart _setObjectInOtherIvars:forKey:](self, "_setObjectInOtherIvars:forKey:", [NSNumber numberWithBool:v5], @"x-is-signed");
  [(MFMimePart *)self _setDecryptedMessageInDictionary:v9];
  [(MFMimePart *)self _setObjectInOtherIvars:v10 forKey:@"x-decrypted-message-store"];
}

- (unint64_t)totalTextSize
{
  id v3 = [(MFMimePart *)self type];
  if (![(NSString *)v3 isEqualToString:@"multipart"])
  {
    if ([(NSString *)v3 isEqualToString:@"text"]
      || [(NSString *)v3 isEqualToString:@"message"])
    {
      [(MFMimePart *)self range];
      return v7;
    }
    return 0;
  }
  CFMutableStringRef v4 = [(MFMimePart *)self subtype];
  if (![(NSString *)v4 isEqualToString:@"alternative"])
  {
    BOOL v9 = [(NSString *)v4 isEqualToString:@"related"];
    id v6 = [(MFMimePart *)self firstChildPart];
    uint64_t v10 = v6;
    if (v9)
    {
      if (v6) {
        goto LABEL_10;
      }
    }
    else if (v6)
    {
      unint64_t v8 = 0;
      do
      {
        if (([v10 isAttachment] & 1) == 0) {
          v8 += [v10 totalTextSize];
        }
        uint64_t v10 = (void *)[v10 nextSiblingPart];
      }
      while (v10);
      return v8;
    }
    return 0;
  }
  id v5 = [(MFMimePart *)self chosenAlternativePart];
  if ([v5 isAttachment]) {
    return 0;
  }
  id v6 = v5;
LABEL_10:
  return [v6 totalTextSize];
}

- (id)startPart
{
  if (![(NSString *)self->_type isEqualToString:@"multipart"]) {
    return self;
  }
  id v3 = [(MFMimePart *)self subtype];
  if ([(NSString *)v3 isEqualToString:@"mixed"]
    && objc_msgSend(-[MFMimePart subparts](self, "subparts"), "count") == 1)
  {
    return [(MFMimePart *)self firstChildPart];
  }
  if (![(NSString *)v3 isEqualToString:@"related"]) {
    return self;
  }
  id v5 = [(MFMimePart *)self bodyParameterForKey:@"start"];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = [(MFMimePart *)self firstChildPart];
    if (v7)
    {
      unint64_t v8 = v7;
      do
      {
        if ([(NSString *)[(MFMimePart *)v8 contentID] isEqualToString:v6]) {
          BOOL v9 = v8;
        }
        else {
          BOOL v9 = self;
        }
        uint64_t v10 = [(MFMimePart *)v8 nextSiblingPart];
        if (!v10) {
          break;
        }
        unint64_t v8 = (MFMimePart *)v10;
      }
      while (v9 == self);
      if (v9 != self) {
        return v9;
      }
    }
  }
  return [(MFMimePart *)self subpartAtIndex:0];
}

- (int64_t)numberOfAlternatives
{
  if (![(NSString *)[(MFMimePart *)self type] isEqualToString:@"multipart"]) {
    return -1;
  }
  id v3 = [(MFMimePart *)self subtype];
  if ([(NSString *)v3 isEqualToString:@"alternative"])
  {
    id v4 = [(MFMimePart *)self firstChildPart];
    for (int64_t i = 0; v4; v4 = (id)[v4 nextSiblingPart])
      ++i;
    return i;
  }
  if ([(NSString *)v3 isEqualToString:@"mixed"])
  {
    id v6 = [(MFMimePart *)self firstChildPart];
    if (v6)
    {
      unint64_t v7 = v6;
      int64_t i = -1;
      do
      {
        uint64_t v8 = [v7 numberOfAlternatives];
        if (i <= v8) {
          int64_t i = v8;
        }
        unint64_t v7 = (void *)[v7 nextSiblingPart];
      }
      while (v7);
      return i;
    }
    return -1;
  }
  if (![(NSString *)v3 isEqualToString:@"signed"]) {
    return -1;
  }
  id v9 = [(MFMimePart *)self firstChildPart];
  if (!v9) {
    return -1;
  }
  uint64_t v10 = v9;
  int64_t i = -1;
  while (!objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", @"multipart"))
  {
    uint64_t v10 = (void *)[v10 nextSiblingPart];
    if (!v10) {
      return i;
    }
  }
  return [v10 numberOfAlternatives];
}

- (id)alternativeAtIndex:(int64_t)a3
{
  if ([(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"alternative"])
  {
    if (a3 == -1)
    {
      uint64_t v5 = objc_msgSend(-[MFMimePart subparts](self, "subparts"), "lastObject");
LABEL_26:
      uint64_t v10 = (void *)v5;
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  if (![(NSString *)self->_subtype isEqualToString:@"related"])
  {
    if ([(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"signed"])
    {
      id v15 = [(MFMimePart *)self firstChildPart];
      if (!v15)
      {
LABEL_23:
        uint64_t v10 = 0;
        goto LABEL_27;
      }
      uint64_t v16 = v15;
      while (!objc_msgSend((id)objc_msgSend(v16, "type"), "isEqualToString:", @"multipart"))
      {
        uint64_t v16 = (void *)[v16 nextSiblingPart];
        if (!v16) {
          goto LABEL_23;
        }
      }
      uint64_t v5 = [v16 alternativeAtIndex:a3];
      goto LABEL_26;
    }
LABEL_24:
    long long v13 = self;
    int64_t v14 = a3;
    goto LABEL_25;
  }
  id v6 = [(MFMimePart *)self bodyParameterForKey:@"start"];
  if (!v6) {
    goto LABEL_17;
  }
  id v7 = v6;
  id v8 = [(MFMimePart *)self firstChildPart];
  if (!v8) {
    goto LABEL_17;
  }
  id v9 = v8;
  do
  {
    if (objc_msgSend((id)objc_msgSend(v9, "contentID"), "isEqualToString:", v7)) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [v9 nextSiblingPart];
    id v9 = (void *)v11;
    if (v10) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
  }
  while (!v12);
  if (!v10)
  {
LABEL_17:
    long long v13 = self;
    int64_t v14 = 0;
LABEL_25:
    uint64_t v5 = [(MFMimePart *)v13 subpartAtIndex:v14];
    goto LABEL_26;
  }
LABEL_27:
  if (v10) {
    return v10;
  }
  else {
    return self;
  }
}

- (id)signedData
{
  id result = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-signed-data"];
  if (result)
  {
    id v3 = result;
    return v3;
  }
  return result;
}

- (id)textHtmlPart
{
  if ([(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"]
    && [(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"html"])
  {
    return self;
  }
  id v4 = [(MFMimePart *)self startPart];
  if (v4 == self || (id result = [(MFMimePart *)v4 textHtmlPart]) == 0)
  {
    if (objc_msgSend(-[MFMimePart subparts](self, "subparts"), "count") == 1)
    {
      id v5 = [(MFMimePart *)self firstChildPart];
      return (id)[v5 textHtmlPart];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (BOOL)parseContentTypeHeader:(id)a3 type:(id *)a4 subtype:(id *)a5
{
  return [a1 parseContentTypeHeader:a3 type:a4 subtype:a5 info:0];
}

- (ECSubject)wrappedSubject
{
  return (ECSubject *)[(MFMimePart *)self _objectInOtherIvarsForKey:@"x-wrapped-subject"];
}

- (void)clearCachedDescryptedMessageBody
{
  [(MFMimePart *)self _setObjectInOtherIvars:0 forKey:@"x-decrypted-message-body"];
  [(MFMimePart *)self _setObjectInOtherIvars:0 forKey:@"x-wrapped-subject"];
  [(MFMimePart *)self _setObjectInOtherIvars:0 forKey:@"x-is-encrypted"];
  [(MFMimePart *)self _setObjectInOtherIvars:0 forKey:@"x-is-signed"];
  [(MFMimePart *)self _setDecryptedMessageInDictionary:0];
  id v3 = _UniqueString(@"x-decrypted-message-store");
  [(MFMimePart *)self _setObjectInOtherIvars:0 forKey:v3];
}

- (void)_setDecryptedMessageInDictionary:(id)a3
{
  id v5 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-decrypted-message"];
  if ((MFMimePart *)[v5 parentPart] == self) {
    [v5 setStrongParentPart:1];
  }
  [(MFMimePart *)self _setObjectInOtherIvars:a3 forKey:@"x-decrypted-message"];
  if ((MFMimePart *)[a3 parentPart] == self)
  {
    [a3 setStrongParentPart:0];
  }
}

- (id)fileWrapperForDecodedObject:(id)a3 withFileData:(id *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id result = 0;
  if (a4 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(a3, "canBeConvertedToEncoding:", objc_msgSend(NSString, "defaultCStringEncoding")))uint64_t v8 = objc_msgSend(NSString, "defaultCStringEncoding"); {
    else
    }
      uint64_t v8 = 10;
    id v9 = (void *)[a3 dataUsingEncoding:v8];
    id result = 0;
    *a4 = v9;
  }
  return result;
}

- (void)download
{
}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = 0;
  if ([(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"])
  {
    id v5 = [(MFMimePart *)self bodyDataForcingDownload:v3];
    id v6 = 0;
    id v12 = v5;
  }
  else
  {
    id v6 = [(MFMimePart *)self contentsForTextSystemForcingDownload:v3];
  }
  id v7 = [(MFMimePart *)self fileWrapperForDecodedObject:v6 withFileData:&v12];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v12 == 0;
  }
  int v9 = !v8;
  if (!v8)
  {
    id v10 = objc_allocWithZone((Class)MFMessageFileWrapper);
    id v7 = (id)[v10 initRegularFileWithContents:v12];
  }
  if (v7 && ![v7 preferredFilename])
  {
    objc_msgSend(v7, "setPreferredFilename:", -[MFMimePart attachmentFilename](self, "attachmentFilename"));
    objc_msgSend(v7, "setFilename:", objc_msgSend(v7, "preferredFilename"));
    if (!v9) {
      return v7;
    }
    goto LABEL_15;
  }
  if (v9) {
LABEL_15:
  }
    [(MFMimePart *)self configureFileWrapper:v7];
  return v7;
}

- (id)fileWrapper
{
  return [(MFMimePart *)self fileWrapperForcingDownload:0];
}

- (id)storeData:(id)a3 inMessage:(id)a4 isComplete:(BOOL)a5
{
  return 0;
}

- (BOOL)_hasCompleteBodyDataToOffset:(unint64_t)a3
{
  BOOL v12 = 0;
  [self mf_lock];
  id v5 = [(MFWeakReferenceHolder *)self->_decodedData retainedReference];
  if (v5)
  {

LABEL_10:
    BOOL v12 = 1;
    goto LABEL_11;
  }
  [(MFMimePart *)self range];
  if (v6 >= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = v6;
  }
  if (self->_fullData) {
    goto LABEL_10;
  }
  unint64_t v8 = [(MFPartialNetworkDataConsumer *)self->_partialDataConsumer length];
  BOOL v9 = v7 > v8;
  unint64_t v10 = v7 - v8;
  if (!v9) {
    goto LABEL_10;
  }
  objc_msgSend((id)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message"), "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", self, v8, v10, &v12, 0, 0);
LABEL_11:
  [self mf_unlock];
  return v12;
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return [(MFMimePart *)self copyBodyDataToOffset:a3 resultOffset:a4 downloadIfNecessary:1];
}

- (id)copyBodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return [(MFMimePart *)self copyBodyDataToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 isComplete:0];
}

- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  id v5 = [(MFMimePart *)self copyBodyDataToOffset:a3 resultOffset:a4 downloadIfNecessary:a5];
  return v5;
}

- (id)bodyDataForcingDownload:(BOOL)a3
{
  BOOL v3 = a3;
  [(MFMimePart *)self range];
  return [(MFMimePart *)self bodyDataToOffset:v5 resultOffset:0 downloadIfNecessary:v3];
}

- (BOOL)_shouldContinueDecodingProcess
{
  return 1;
}

+ (Class)attachmentClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isRecognizedClassForContent:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5
{
  return [(MFMimePart *)self contentToOffset:a3 resultOffset:a4 downloadIfNecessary:1 asHTML:a5 isComplete:0];
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6
{
  return [(MFMimePart *)self contentToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:a6 isComplete:0];
}

- (unsigned)numberOfAttachments
{
  unsigned int v3 = 0;
  [(MFMimePart *)self getNumberOfAttachments:&v3 isSigned:0 isEncrypted:0];
  return v3;
}

- (void)getNumberOfAttachments:(unsigned int *)a3 isSigned:(BOOL *)a4 isEncrypted:(BOOL *)a5
{
  char v12 = -86;
  char v11 = -86;
  id v9 = [(MFMimePart *)self decryptedMessageBodyIsEncrypted:&v12 isSigned:&v11];
  if (v9)
  {
    unsigned int v10 = [v9 numberOfAttachmentsSigned:a4 encrypted:a5];
    if (a3) {
      *a3 = v10;
    }
  }
  else
  {
    if (a3)
    {
      *a3 = 0;
      _getAttachmentsAndAddToCount(self, a3, 0);
    }
    if (a4) {
      *a4 = [(MFMimePart *)self hasValidMultipartSignedContentType];
    }
  }
  if (a5 && v12) {
    *a5 = 1;
  }
  if (a4)
  {
    if (v11) {
      *a4 = 1;
    }
  }
}

- (id)attachmentURLs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(MFMimePart *)self isAttachment] && [(MFMimePart *)self partURL]) {
    objc_msgSend(v3, "addObject:", -[MFMimePart partURL](self, "partURL"));
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(MFMimePart *)self subparts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 isAttachment] && objc_msgSend(v9, "partURL")) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "partURL"));
        }
        if (![(NSString *)[(MFMimePart *)self type] isEqualToString:@"message"]
          || ![(NSString *)[(MFMimePart *)self subtype] isEqualToString:@"rfc822"])
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          unsigned int v10 = objc_msgSend(v9, "subparts", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "attachmentURLs"));
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)chosenAlternativePart
{
  id v3 = [(MFMimePart *)self subparts];
  unint64_t v4 = [v3 count];
  int64_t v5 = v4 - 1;
  unint64_t v6 = v4 - 2;
  if (v4 >= 2)
  {
    if ((uint64_t v7 = (void *)[v3 lastObject],
          unint64_t v8 = (void *)[v7 type],
          uint64_t v9 = [v7 subtype],
          [v8 isEqualToString:@"text"])
      && v9
      && ![@"calendar" caseInsensitiveCompare:v9]
      || objc_msgSend((id)objc_msgSend(v7, "type"), "isEqualToString:", @"text")
      && !objc_msgSend(@"earthlink-xml", "caseInsensitiveCompare:", objc_msgSend(v7, "subtype")))
    {
      if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v6), "isReadableText")) {
        int64_t v5 = v6;
      }
    }
  }
  id v10 = [(MFMimePart *)self firstChildPart];
  uint64_t v11 = 0;
  if (v10 && (v5 & 0x8000000000000000) == 0)
  {
    int64_t v12 = 0;
    do
    {
      uint64_t v11 = v10;
      id v10 = (id)[v10 nextSiblingPart];
      if (!v10) {
        break;
      }
    }
    while (v12++ < v5);
  }
  return v11;
}

- (BOOL)isGenerated
{
  id v2 = [(MFMimePart *)self contentID];
  return [(NSString *)v2 isEqualToString:@"5221C4CE-204E-45C0-95FC-7E20BAA21986"];
}

- (void)setIsGenerated:(BOOL)a3
{
  if (a3)
  {
    [(MFMimePart *)self setContentID:@"5221C4CE-204E-45C0-95FC-7E20BAA21986"];
  }
  else if ([(MFMimePart *)self isGenerated])
  {
    int64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MimePart.m" lineNumber:2215 description:@"Clearing generated state not implemented"];
  }
}

- (BOOL)parseMimeBody
{
  return [(MFMimePart *)self parseMimeBodyDownloadIfNecessary:1];
}

- (void)_fixupBodyParametersRFC2231Values
{
}

- (void)_fixupDispositionParametersRFC2231Values
{
  id v2 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
  objc_msgSend(v2, "mf_fixupRFC2231Values");
}

- (BOOL)parseIMAPPropertyList:(id)a3
{
  if (a3)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a3);
    if (Count >= 1)
    {
      unint64_t v6 = Count;
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, 0);
      if (!ValueAtIndex) {
        return (char)ValueAtIndex;
      }
      unint64_t v8 = ValueAtIndex;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (TypeID == CFGetTypeID(v8))
      {
        [(MFMimePart *)self setType:@"multipart"];
        CFIndex v10 = 0;
        while (1)
        {
          CFTypeID v11 = CFArrayGetTypeID();
          if (v11 != CFGetTypeID(v8)) {
            break;
          }
          id v12 = objc_alloc_init((Class)objc_opt_class());
          if (v12)
          {
            uint64_t v13 = v12;
            [(MFMimePart *)self addSubpart:v12];
            [v13 parseIMAPPropertyList:v8];
          }
          if (++v10 < (uint64_t)v6)
          {
            unint64_t v8 = CFArrayGetValueAtIndex((CFArrayRef)a3, v10);
            if (v8) {
              continue;
            }
          }
          goto LABEL_41;
        }
        CFTypeID v33 = CFStringGetTypeID();
        if (v33 == CFGetTypeID(v8)) {
          [(MFMimePart *)self setSubtype:v8];
        }
LABEL_41:
        if (v10 + 1 < (uint64_t)v6)
        {
          CFArrayRef v34 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, v10 + 1);
          if (v34)
          {
            CFArrayRef v35 = v34;
            CFTypeID v36 = CFArrayGetTypeID();
            if (v36 == CFGetTypeID(v35)) {
              _setupDictionaryFromArray(self, (void **)&self->_bodyParameters, v35);
            }
          }
        }
        if (v10 + 2 < (uint64_t)v6)
        {
          v37 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v10 + 2);
          values = v37;
          if (v37)
          {
            CFArrayRef v38 = (const __CFArray *)v37;
            CFTypeID v39 = CFArrayGetTypeID();
            if (v39 == CFGetTypeID(v38))
            {
              CFIndex v40 = CFArrayGetCount(v38);
              if (v40 >= 1)
              {
                unint64_t v41 = v40;
                v42 = CFArrayGetValueAtIndex(v38, 0);
                if (v42)
                {
                  uint64_t v43 = v42;
                  CFTypeID v44 = CFStringGetTypeID();
                  if (v44 == CFGetTypeID(v43)) {
                    [(MFMimePart *)self setDisposition:v43];
                  }
                }
                if (v41 >= 2)
                {
                  CFArrayRef v45 = (const __CFArray *)CFArrayGetValueAtIndex(v38, 1);
                  if (v45)
                  {
                    CFArrayRef v46 = v45;
                    CFTypeID v47 = CFArrayGetTypeID();
                    if (v47 == CFGetTypeID(v46))
                    {
                      id v48 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
                      v83 = v48;
                      _setupDictionaryFromArray(self, &v83, v46);
                      v49 = v83;
                      if (v83) {
                        [(MFMimePart *)self _setObjectInOtherIvars:v83 forKey:@"x-disposition-parameters"];
                      }
                      if (!v48) {
                    }
                      }
                  }
                }
              }
            }
          }
          goto LABEL_112;
        }
LABEL_111:
        values = 0;
LABEL_112:
        [(NSMutableDictionary *)self->_bodyParameters mf_fixupRFC2231Values];
        objc_msgSend(-[MFMimePart _objectInOtherIvarsForKey:](self, "_objectInOtherIvarsForKey:", @"x-disposition-parameters"), "mf_fixupRFC2231Values");
        LOBYTE(ValueAtIndex) = 1;
        return (char)ValueAtIndex;
      }
      CFTypeID v14 = CFStringGetTypeID();
      if (v14 == CFGetTypeID(v8))
      {
        [(MFMimePart *)self setType:v8];
        if (v6 <= 1)
        {
          values = 0;
        }
        else
        {
          id v15 = CFArrayGetValueAtIndex((CFArrayRef)a3, 1);
          if (v15)
          {
            long long v16 = v15;
            CFTypeID v17 = CFStringGetTypeID();
            if (v17 == CFGetTypeID(v16)) {
              [(MFMimePart *)self setSubtype:v16];
            }
          }
          if (v6 >= 3)
          {
            CFArrayRef v18 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, 2);
            if (v18)
            {
              CFArrayRef v19 = v18;
              CFTypeID v20 = CFArrayGetTypeID();
              if (v20 == CFGetTypeID(v19)) {
                _setupDictionaryFromArray(self, (void **)&self->_bodyParameters, v19);
              }
            }
            if (v6 > 3)
            {
              long long v21 = CFArrayGetValueAtIndex((CFArrayRef)a3, 3);
              if (v21)
              {
                long long v22 = v21;
                CFTypeID v23 = CFStringGetTypeID();
                if (v23 == CFGetTypeID(v22)) {
                  [(MFMimePart *)self setContentID:v22];
                }
              }
              if (v6 >= 5)
              {
                int v24 = CFArrayGetValueAtIndex((CFArrayRef)a3, 4);
                if (v24)
                {
                  CFIndex v25 = v24;
                  CFTypeID v26 = CFStringGetTypeID();
                  if (v26 == CFGetTypeID(v25)) {
                    [(MFMimePart *)self setContentDescription:v25];
                  }
                }
                if (v6 > 5)
                {
                  id v27 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, 5);
                  values = v27;
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    CFTypeID v29 = CFStringGetTypeID();
                    if (v29 == CFGetTypeID(v28)) {
                      [(MFMimePart *)self setContentTransferEncoding:v28];
                    }
                  }
                  if (v6 >= 7)
                  {
                    uint64_t v30 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, 6);
                    if (v30)
                    {
                      id v31 = v30;
                      CFTypeID v32 = CFNumberGetTypeID();
                      if (v32 == CFGetTypeID(v31)) {
                        -[MFMimePart setRange:](self, "setRange:", 0x7FFFFFFFFFFFFFFFLL, [v31 unsignedIntegerValue]);
                      }
                    }
                  }
LABEL_62:
                  if ([(NSString *)[(MFMimePart *)self type] isEqualToString:@"text"])
                  {
                    unint64_t v50 = 9;
                  }
                  else if ([(NSString *)self->_type isEqualToString:@"message"] {
                         && [(NSString *)self->_subtype isEqualToString:@"rfc822"])
                  }
                  {
                    if (v6 <= 8)
                    {
                      values = 0;
                    }
                    else
                    {
                      v51 = CFArrayGetValueAtIndex((CFArrayRef)a3, 8);
                      if (v51)
                      {
                        v52 = v51;
                        CFTypeID v53 = CFArrayGetTypeID();
                        if (v53 == CFGetTypeID(v52))
                        {
                          id v54 = objc_alloc_init((Class)objc_opt_class());
                          if (v54)
                          {
                            v55 = v54;
                            [(MFMimePart *)self addSubpart:v54];
                            [v55 parseIMAPPropertyList:v52];
                          }
                        }
                      }
                    }
                    unint64_t v50 = 11;
                  }
                  else
                  {
                    unint64_t v50 = 8;
                  }
                  if (v50 >= v6)
                  {
                    values = 0;
                  }
                  else
                  {
                    CFArrayRef v56 = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50);
                    if (v56)
                    {
                      CFArrayRef v57 = v56;
                      CFTypeID v58 = CFArrayGetTypeID();
                      if (v58 == CFGetTypeID(v57))
                      {
                        CFIndex v59 = CFArrayGetCount(v57);
                        if (v59 >= 1)
                        {
                          unint64_t v60 = v59;
                          v61 = CFArrayGetValueAtIndex(v57, 0);
                          if (v61)
                          {
                            v62 = v61;
                            CFTypeID v63 = CFStringGetTypeID();
                            if (v63 == CFGetTypeID(v62)) {
                              [(MFMimePart *)self setDisposition:v62];
                            }
                          }
                          if (v60 >= 2)
                          {
                            CFArrayRef v64 = (const __CFArray *)CFArrayGetValueAtIndex(v57, 1);
                            if (v64)
                            {
                              CFArrayRef v65 = v64;
                              CFTypeID v66 = CFArrayGetTypeID();
                              if (v66 == CFGetTypeID(v65))
                              {
                                id v67 = [(MFMimePart *)self _objectInOtherIvarsForKey:@"x-disposition-parameters"];
                                v83 = v67;
                                _setupDictionaryFromArray(self, &v83, v65);
                                v68 = v83;
                                if (v83) {
                                  [(MFMimePart *)self _setObjectInOtherIvars:v83 forKey:@"x-disposition-parameters"];
                                }
                                if (!v67) {
                              }
                                }
                            }
                          }
                        }
                      }
                    }
                  }
                  if (v50 + 1 >= v6)
                  {
                    values = 0;
                    goto LABEL_106;
                  }
                  v69 = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50 + 1);
                  values = v69;
                  if (!v69) {
                    goto LABEL_106;
                  }
                  CFArrayRef v70 = (const __CFArray *)v69;
                  CFTypeID v71 = CFArrayGetTypeID();
                  if (v71 == CFGetTypeID(v70))
                  {
                    uint64_t v72 = CFArrayGetCount(v70);
                    v73 = (const void **)malloc_type_malloc(8 * v72, 0xC0040B8AA526DuLL);
                    v74 = malloc_type_malloc(8 * v72, 0x80040B8603338uLL);
                    v85.NSUInteger location = 0;
                    v85.NSUInteger length = v72;
                    CFArrayGetValues(v70, v85, v73);
                    if (v72 < 1) {
                      goto LABEL_102;
                    }
                    uint64_t v75 = 0;
                    v76 = v73;
                    do
                    {
                      if (*v76) {
                        v74[v75++] = *v76;
                      }
                      ++v76;
                      --v72;
                    }
                    while (v72);
                    if (v75) {
                      CFArrayRef v77 = (CFArrayRef)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v74 count:v75];
                    }
                    else {
LABEL_102:
                    }
                      CFArrayRef v77 = 0;
                    free(v73);
                    free(v74);
                  }
                  else
                  {
                    CFTypeID v78 = CFStringGetTypeID();
                    if (v78 != CFGetTypeID(v70)) {
                      goto LABEL_106;
                    }
                    CFArrayRef v77 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
                  }
                  if (v77)
                  {
                    [(MFMimePart *)self setLanguages:v77];
                    CFRelease(v77);
                  }
LABEL_106:
                  if ((uint64_t)(v50 + 2) < (uint64_t)v6)
                  {
                    values = (void *)CFArrayGetValueAtIndex((CFArrayRef)a3, v50 + 2);
                    if (values)
                    {
                      CFTypeID v79 = CFArrayGetTypeID();
                      if (v79 == CFGetTypeID(values) && CFArrayGetCount((CFArrayRef)values) >= 1)
                      {
                        v80 = (void *)CFArrayGetValueAtIndex((CFArrayRef)values, 0);
                        values = v80;
                      }
                      else
                      {
                        v80 = values;
                      }
                      if (v80)
                      {
                        CFTypeID v81 = CFStringGetTypeID();
                        if (v81 == CFGetTypeID(values)) {
                          [(MFMimePart *)self setContentLocation:values];
                        }
                      }
                    }
                    goto LABEL_112;
                  }
                  goto LABEL_111;
                }
              }
LABEL_61:
              values = 0;
              goto LABEL_62;
            }
          }
        }
        values = 0;
        goto LABEL_61;
      }
    }
    LOBYTE(ValueAtIndex) = 0;
  }
  else
  {
    LOBYTE(ValueAtIndex) = 0;
  }
  return (char)ValueAtIndex;
}

- (id)decodeText
{
  id v2 = _MFCopyDecodeText(self, 0);
  return v2;
}

void *__51__MFMimePart_DecodingSupport___selectorForCString___block_invoke()
{
  id result = &unk_1F084A9D0;
  _selectorForCString__allowedMethodNames = (uint64_t)result;
  return result;
}

- (BOOL)hasContents
{
  id v3 = objc_msgSend((id)objc_msgSend(-[MFMimePart mimeBody](self, "mimeBody"), "message"), "messageStore");
  return [v3 hasCompleteDataForMimePart:self];
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5 asHTML:(BOOL)a6
{
  return [(MFMimePart *)self contentsForTextSystemToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:a6 isComplete:0];
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 downloadIfNecessary:(BOOL)a5
{
  return [(MFMimePart *)self contentsForTextSystemToOffset:a3 resultOffset:a4 downloadIfNecessary:a5 asHTML:1];
}

- (id)contentsForTextSystemToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  return [(MFMimePart *)self contentsForTextSystemToOffset:a3 resultOffset:a4 downloadIfNecessary:1];
}

- (id)contentsForTextSystemForcingDownload:(BOOL)a3
{
  return [(MFMimePart *)self contentsForTextSystemToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 downloadIfNecessary:a3];
}

- (id)contentsForTextSystem
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "objectForKeyedSubscript:", @"__MIME_PART_DECODE_DOWNLOAD");
  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 1;
  }
  return [(MFMimePart *)self contentsForTextSystemForcingDownload:v4];
}

- (id)bodyDataToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4
{
  id v4 = [(MFMimePart *)self copyBodyDataToOffset:a3 resultOffset:a4 downloadIfNecessary:1];
  return v4;
}

- (id)bodyData
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "objectForKeyedSubscript:", @"__MIME_PART_DECODE_DOWNLOAD");
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  uint64_t v4 = [v3 BOOLValue];
  return [(MFMimePart *)self bodyDataForcingDownload:v4];
}

- (id)decodeApplicationZip
{
  return 0;
}

- (id)decodeApplicationOctet_stream
{
  return 0;
}

- (id)decodeMultipartRelated
{
  id v2 = [(MFMimePart *)self firstChildPart];
  id v3 = [v2 contentsForTextSystem];

  return v3;
}

- (id)decodeMultipartAlternative
{
  id v2 = [(MFMimePart *)self chosenAlternativePart];
  id v3 = [v2 contentsForTextSystem];

  return v3;
}

- (id)decodeMultipart
{
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v4 = [v3 threadDictionary];

  unint64_t v5 = _MFOffsetFromThreadDictionary(v4);
  unint64_t v6 = [v4 objectForKey:@"__MIME_PART_DECODE_AS_HTML"];
  uint64_t v7 = [v6 BOOLValue];

  unint64_t v8 = [v4 objectForKeyedSubscript:@"__MIME_PART_DECODE_DOWNLOAD"];

  if (v8)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"__MIME_PART_DECODE_DOWNLOAD"];
    uint64_t v10 = [v9 BOOLValue];
  }
  else
  {
    uint64_t v10 = 1;
  }
  CFTypeID v11 = [(MFMimePart *)self firstChildPart];
  CFTypeID v23 = v4;
  if (v11)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    char v14 = 1;
    while (1)
    {
      id v15 = (void *)MEMORY[0x1B3E87F20]();
      char v25 = 0;
      if (v5)
      {
        unint64_t v24 = 0;
        long long v16 = [v11 contentToOffset:v5 resultOffset:&v24 downloadIfNecessary:v10 asHTML:v7 isComplete:&v25];
        unint64_t v17 = v5 - v24;
        if (v5 < v24) {
          unint64_t v17 = 0;
        }
        if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v5 = v17;
        }
        uint64_t v12 = (v12 + v24);
        if (v13) {
          goto LABEL_12;
        }
      }
      else if ([v11 isAttachment])
      {
        [v11 contentToOffset:0x7FFFFFFFFFFFFFFFLL resultOffset:0 downloadIfNecessary:v10 asHTML:1 isComplete:&v25];
        v16 = unint64_t v5 = 0;
        if (v13) {
          goto LABEL_12;
        }
      }
      else
      {
        unint64_t v24 = 0;
        long long v16 = [v11 contentToOffset:1 resultOffset:&v24 downloadIfNecessary:v10 asHTML:v7 isComplete:&v25];
        unint64_t v5 = 0;
        int v18 = v24;
        if (!v16) {
          int v18 = 0;
        }
        uint64_t v12 = (v18 + v12);
        if (v13)
        {
LABEL_12:
          if (v16) {
            goto LABEL_21;
          }
          goto LABEL_25;
        }
      }
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v16)
      {
LABEL_21:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 addObjectsFromArray:v16];
        }
        else {
          [v13 addObject:v16];
        }
        v14 &= v25 != 0;
      }
LABEL_25:

      uint64_t v19 = [v11 nextSiblingPart];

      CFTypeID v11 = (void *)v19;
      if (!v19) {
        goto LABEL_28;
      }
    }
  }
  id v13 = 0;
  uint64_t v12 = 0;
  char v14 = 1;
LABEL_28:
  CFTypeID v20 = [NSNumber numberWithBool:v14 & 1];
  [v23 setObject:v20 forKey:@"__MIME_PART_RESULT_IS_COMPLETE"];

  long long v21 = [NSNumber numberWithUnsignedInt:v12];
  [v23 setObject:v21 forKey:@"__MIME_PART_DECODE_RESULT_OFFSET"];

  return v13;
}

- (void)_ensureBodyDataToOffset:(os_log_t)log resultOffset:downloadIfNecessary:isComplete:decoded:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AFB03000, log, OS_LOG_TYPE_ERROR, "Detected possible race, retrying once", buf, 2u);
}

- (void)_ensureBodyDataToOffset:(os_log_t)log resultOffset:downloadIfNecessary:isComplete:decoded:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AFB03000, log, OS_LOG_TYPE_ERROR, "#Attachments FIXME: Blocking call requested on the main thread", v1, 2u);
}

@end