@interface WFEmail
+ (BOOL)supportsSecureCoding;
- (EMDaemonInterface)interface;
- (NSArray)recipients;
- (NSData)identifier;
- (NSString)accountIdentifier;
- (NSString)subject;
- (NSString)wfName;
- (WFEmail)initWithCoder:(id)a3;
- (WFEmail)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 subject:(id)a5 sender:(id)a6 recipients:(id)a7;
- (WFEmailAddress)sender;
- (unint64_t)subjectPrefix;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAttachmentsWithCompletionHandler:(id)a3;
- (void)fetchContentRepresentationWithCompletionHandler:(id)a3;
@end

@implementation WFEmail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (WFEmailAddress)sender
{
  return self->_sender;
}

- (unint64_t)subjectPrefix
{
  return self->_subjectPrefix;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEmail *)self subject];
  [v4 encodeObject:v5 forKey:@"subject"];

  v6 = [(WFEmail *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(WFEmail *)self accountIdentifier];
  [v4 encodeObject:v7 forKey:@"accountIdentifier"];

  v8 = [(WFEmail *)self sender];
  [v4 encodeObject:v8 forKey:@"sender"];

  id v9 = [(WFEmail *)self recipients];
  [v4 encodeObject:v9 forKey:@"recipients"];
}

- (WFEmail)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEmail *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (WFEmailAddress *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (NSString)wfName
{
  v3 = [(WFEmail *)self subject];
  if ([v3 length]) {
    [(WFEmail *)self subject];
  }
  else {
  id v4 = WFLocalizedStringWithKey(@"Name of email", @"Email");
  }

  return (NSString *)v4;
}

- (void)fetchContentRepresentationWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = getWFContentItemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]";
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching Message Content", buf, 0xCu);
  }

  uint64_t v6 = [(WFEmail *)self interface];
  v7 = [v6 messageRepository];
  Class EMObjectIDClass = getEMObjectIDClass();
  id v9 = [(WFEmail *)self identifier];
  uint64_t v10 = [(objc_class *)EMObjectIDClass objectIDFromSerializedRepresentation:v9];

  v11 = [v7 messageForObjectID:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke;
  v16[3] = &unk_264289DF0;
  id v12 = v4;
  v16[4] = self;
  id v17 = v12;
  [v11 addSuccessBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_20;
  v14[3] = &unk_264289DA0;
  id v15 = v12;
  id v13 = v12;
  [v11 addFailureBlock:v14];
}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  Class EMContentRequestOptionsClass = getEMContentRequestOptionsClass();
  v5 = getEMContentRepresentationTypeHTML();
  uint64_t v6 = [(objc_class *)EMContentRequestOptionsClass optionsWithRequestedRepresentationType:v5 networkUsage:2];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_264289DC8;
  id v7 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v8 = (id)[v3 requestRepresentationWithOptions:v6 completionHandler:v9];
}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = getWFContentItemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [v3 localizedFailureReason];
    int v6 = 136315394;
    id v7 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_216505000, v4, OS_LOG_TYPE_DEBUG, "%s Failure fetching message content: %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__WFEmail_fetchContentRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFContentItemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    v14 = "-[WFEmail fetchContentRepresentationWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEBUG, "%s Recieved message content representation", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    __int16 v8 = [*(id *)(a1 + 32) subject];
    if ([v8 length])
    {
      id v9 = [*(id *)(a1 + 32) subject];
    }
    else
    {
      id v9 = 0;
    }

    uint64_t v10 = [v5 contentURL];
    v11 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
    id v12 = +[WFFileRepresentation fileWithURL:v10 options:5 ofType:v11 proposedFilename:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchAttachmentsWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = getWFContentItemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]";
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching Message Attachments", buf, 0xCu);
  }

  id v6 = [(WFEmail *)self interface];
  id v7 = [v6 messageRepository];
  Class EMObjectIDClass = getEMObjectIDClass();
  id v9 = [(WFEmail *)self identifier];
  uint64_t v10 = [(objc_class *)EMObjectIDClass objectIDFromSerializedRepresentation:v9];

  v11 = [v7 messageForObjectID:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke;
  v16[3] = &unk_264289D78;
  id v12 = v4;
  id v17 = v12;
  [v11 addSuccessBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_4;
  v14[3] = &unk_264289DA0;
  id v15 = v12;
  id v13 = v12;
  [v11 addFailureBlock:v14];
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  Class EMContentRequestOptionsClass = getEMContentRequestOptionsClass();
  id v5 = getEMContentRepresentationTypeHTML();
  id v6 = [(objc_class *)EMContentRequestOptionsClass optionsWithRequestedRepresentationType:v5 networkUsage:2];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_264289D50;
  id v9 = *(id *)(a1 + 32);
  id v7 = (id)[v3 requestRepresentationWithOptions:v6 completionHandler:v8];
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = getWFContentItemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 localizedFailureReason];
    int v6 = 136315394;
    id v7 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]_block_invoke_4";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_216505000, v4, OS_LOG_TYPE_DEBUG, "%s Failure fetching message attachments: %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFContentItemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[WFEmail fetchAttachmentsWithCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEBUG, "%s Recieved message content representation", buf, 0xCu);
  }

  if (v5)
  {
    __int16 v8 = [v5 relatedContentItems];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_26428AF18;
    id v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", &__block_literal_global_12_20605, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  Class EMContentRequestOptionsClass = getEMContentRequestOptionsClass();
  __int16 v8 = getEMContentRepresentationTypeRaw();
  id v9 = [(objc_class *)EMContentRequestOptionsClass optionsWithRequestedRepresentationType:v8 networkUsage:2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2_13;
  v12[3] = &unk_264289D50;
  id v13 = v6;
  id v10 = v6;
  id v11 = (id)[v5 requestRepresentationWithOptions:v9 completionHandler:v12];
}

void __49__WFEmail_fetchAttachmentsWithCompletionHandler___block_invoke_2_13(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 contentURL];
    id v5 = +[WFFileRepresentation fileWithURL:v3 options:5 ofType:0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (EMDaemonInterface)interface
{
  interface = self->_interface;
  if (!interface)
  {
    id v4 = (EMDaemonInterface *)objc_alloc_init(getEMDaemonInterfaceClass());
    id v5 = self->_interface;
    self->_interface = v4;

    interface = self->_interface;
  }
  return interface;
}

- (WFEmail)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 subject:(id)a5 sender:(id)a6 recipients:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"WFEmail.m", 45, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)WFEmail;
  v19 = [(WFEmail *)&v32 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    uint64_t v21 = [v15 copy];
    accountIdentifier = v20->_accountIdentifier;
    v20->_accountIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    subject = v20->_subject;
    v20->_subject = (NSString *)v23;

    uint64_t v25 = +[WFEmailAddress addressWithEmailAddress:v17];
    sender = v20->_sender;
    v20->_sender = (WFEmailAddress *)v25;

    uint64_t v27 = objc_msgSend(v18, "if_compactMap:", &__block_literal_global_20615);
    recipients = v20->_recipients;
    v20->_recipients = (NSArray *)v27;

    v29 = v20;
  }

  return v20;
}

WFEmailAddress *__74__WFEmail_initWithIdentifier_accountIdentifier_subject_sender_recipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFEmailAddress addressWithEmailAddress:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end