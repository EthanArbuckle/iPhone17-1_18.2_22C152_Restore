@interface IPMessage
- (BOOL)isGroupConversation;
- (BOOL)isReply;
- (BOOL)isSenderSignificant;
- (BOOL)isSent;
- (IPMessage)init;
- (IPMessage)initWithDateSent:(id)a3;
- (IPMessage)initWithDateSent:(id)a3 subject:(id)a4;
- (IPMessage)initWithHTMLContent:(id)a3 emailHeadersDictionary:(id)a4 dateSent:(id)a5;
- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7;
- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7 type:(id)a8;
- (IPMessage)initWithSGIPMessage:(id)a3;
- (IPPerson)sender;
- (NSArray)messageUnits;
- (NSArray)recipients;
- (NSDate)dateSent;
- (NSString)htmlContent;
- (NSString)identifier;
- (NSString)lowercaseSubject;
- (NSString)subject;
- (NSString)threadIdentifier;
- (NSString)type;
- (id)detectedKeywordsDictionary;
- (id)firstHeaderValueForKey:(id)a3 inHeaders:(id)a4;
- (unint64_t)messageUnitsTextLength;
- (void)addDetectedKeyword:(id)a3 classificationTypeIdentifier:(id)a4;
- (void)addMessageUnit:(id)a3;
- (void)setDateSent:(id)a3;
- (void)setHtmlContent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsGroupConversation:(BOOL)a3;
- (void)setIsReply:(BOOL)a3;
- (void)setIsSenderSignificant:(BOOL)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setMessageUnits:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation IPMessage

- (void)setIdentifier:(id)a3
{
}

- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7 type:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)IPMessage;
  v20 = [(IPMessage *)&v28 init];
  v21 = v20;
  if (v20)
  {
    [(IPMessage *)v20 setIdentifier:v14];
    [(IPMessage *)v21 setSubject:v15];
    [(IPMessage *)v21 setSender:v16];
    [(IPMessage *)v21 setRecipients:v17];
    [(IPMessage *)v21 setDateSent:v18];
    [(IPMessage *)v21 setType:v19];
    [(IPMessage *)v21 setIsReply:0];
    v22 = [(IPMessage *)v21 subject];

    if (v22)
    {
      unint64_t v23 = [v15 length];
      if (v23 >= 0x2710) {
        uint64_t v24 = 10000;
      }
      else {
        uint64_t v24 = v23;
      }
      v25 = +[IPRegexToolbox emailSubjectPrefixRegex];
      uint64_t v26 = objc_msgSend(v25, "numberOfMatchesInString:options:range:", v15, 2, 0, v24);

      [(IPMessage *)v21 setIsReply:v26 != 0];
    }
  }

  return v21;
}

- (IPMessage)init
{
  return 0;
}

- (IPMessage)initWithSGIPMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = [v4 recipients];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[IPPerson alloc] initWithSGIPPerson:*(void *)(*((void *)&v27 + 1) + 8 * v10)];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v24 = [v4 messageId];
  v12 = (void *)[v24 copy];
  v13 = [v4 subject];
  id v14 = (void *)[v13 copy];
  id v15 = [IPPerson alloc];
  id v16 = [v4 sender];
  id v17 = [(IPPerson *)v15 initWithSGIPPerson:v16];
  id v18 = [v4 dateSent];
  id v19 = (void *)[v18 copy];
  v20 = [(IPMessage *)self initWithIdentifier:v12 subject:v14 sender:v17 recipients:v5 dateSent:v19 type:IPMessageTypeEmail];

  -[IPMessage setIsSent:](v20, "setIsSent:", [v4 isSent]);
  -[IPMessage setIsGroupConversation:](v20, "setIsGroupConversation:", [v4 isGroupConversation]);
  -[IPMessage setIsSenderSignificant:](v20, "setIsSenderSignificant:", [v4 isSenderSignificant]);
  v21 = [v4 messageUnits];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __33__IPMessage_initWithSGIPMessage___block_invoke;
  v25[3] = &unk_264722D48;
  v22 = v20;
  uint64_t v26 = v22;
  [v21 enumerateObjectsUsingBlock:v25];

  return v22;
}

void __33__IPMessage_initWithSGIPMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [[IPMessageUnit alloc] initWithText:v6 originalMessage:*(void *)(a1 + 32) index:a3];

  [v5 addMessageUnit:v7];
}

- (IPMessage)initWithDateSent:(id)a3
{
  return [(IPMessage *)self initWithDateSent:a3 subject:0];
}

- (IPMessage)initWithDateSent:(id)a3 subject:(id)a4
{
  if (!a4) {
    a4 = &stru_26D895C60;
  }
  return [(IPMessage *)self initWithIdentifier:@"0" subject:a4 sender:0 recipients:MEMORY[0x263EFFA68] dateSent:a3 type:0];
}

- (IPMessage)initWithIdentifier:(id)a3 subject:(id)a4 sender:(id)a5 recipients:(id)a6 dateSent:(id)a7
{
  return [(IPMessage *)self initWithIdentifier:a3 subject:a4 sender:a5 recipients:a6 dateSent:a7 type:IPMessageTypeEmail];
}

- (id)firstHeaderValueForKey:(id)a3 inHeaders:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  if ([v4 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IPMessage)initWithHTMLContent:(id)a3 emailHeadersDictionary:(id)a4 dateSent:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(IPMessage *)self firstHeaderValueForKey:@"Message-Id" inHeaders:v9];
  v12 = [(IPMessage *)self firstHeaderValueForKey:@"Subject" inHeaders:v9];

  v13 = [(IPMessage *)self initWithIdentifier:v11 subject:v12 sender:0 recipients:0 dateSent:v8 type:IPMessageTypeEmail];
  [(IPMessage *)v13 setHtmlContent:v10];

  return v13;
}

- (void)addMessageUnit:(id)a3
{
  id v4 = a3;
  messageUnits = self->_messageUnits;
  id v9 = v4;
  if (!messageUnits)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_messageUnits;
    self->_messageUnits = v6;

    id v4 = v9;
    self->_messageUnitsTextLength = 0;
    messageUnits = self->_messageUnits;
  }
  [(NSMutableArray *)messageUnits addObject:v4];
  id v8 = [v9 text];
  self->_messageUnitsTextLength += [v8 length];
}

- (NSArray)messageUnits
{
  v13[1] = *MEMORY[0x263EF8340];
  messageUnits = self->_messageUnits;
  if (!messageUnits)
  {
    id v4 = [(IPMessage *)self htmlContent];
    v5 = +[IPQuoteParser strippedQuoteBlockWithHtml:v4];

    id v6 = [v5 dataUsingEncoding:4];
    uint64_t v7 = _MDPlainTextFromHTMLData();

    id v8 = [[IPMessageUnit alloc] initWithText:v7 originalMessage:self index:0];
    v13[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    id v10 = (NSMutableArray *)[v9 mutableCopy];
    v11 = self->_messageUnits;
    self->_messageUnits = v10;

    messageUnits = self->_messageUnits;
  }
  return (NSArray *)messageUnits;
}

- (void)setMessageUnits:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  messageUnits = self->_messageUnits;
  self->_messageUnits = 0;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IPMessage addMessageUnit:](self, "addMessageUnit:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)lowercaseSubject
{
  lowercaseSubject = self->_lowercaseSubject;
  if (!lowercaseSubject)
  {
    id v4 = [(IPMessage *)self subject];
    v5 = [v4 lowercaseString];
    id v6 = self->_lowercaseSubject;
    self->_lowercaseSubject = v5;

    lowercaseSubject = self->_lowercaseSubject;
  }
  return lowercaseSubject;
}

- (void)addDetectedKeyword:(id)a3 classificationTypeIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    keywordsDictionary = self->_keywordsDictionary;
    if (!keywordsDictionary)
    {
      uint64_t v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:10];
      uint64_t v9 = self->_keywordsDictionary;
      self->_keywordsDictionary = v8;

      keywordsDictionary = self->_keywordsDictionary;
    }
    [(NSMutableDictionary *)keywordsDictionary setObject:v6 forKeyedSubscript:v10];
  }
}

- (id)detectedKeywordsDictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_keywordsDictionary copy];
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)threadIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubject:(id)a3
{
}

- (IPPerson)sender
{
  return (IPPerson *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSender:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRecipients:(id)a3
{
}

- (NSDate)dateSent
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateSent:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setType:(id)a3
{
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (BOOL)isSenderSignificant
{
  return self->_isSenderSignificant;
}

- (void)setIsSenderSignificant:(BOOL)a3
{
  self->_isSenderSignificant = a3;
}

- (NSString)htmlContent
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHtmlContent:(id)a3
{
}

- (unint64_t)messageUnitsTextLength
{
  return self->_messageUnitsTextLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lowercaseSubject, 0);
  objc_storeStrong((id *)&self->_keywordsDictionary, 0);
  objc_storeStrong((id *)&self->_messageUnits, 0);
}

@end