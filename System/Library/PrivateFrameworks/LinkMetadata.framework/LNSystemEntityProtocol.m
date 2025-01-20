@interface LNSystemEntityProtocol
+ (BOOL)supportsSecureCoding;
+ (LNSystemEntityProtocol)assistantEntityProtocol;
+ (LNSystemEntityProtocol)indexedEntityProtocol;
+ (LNSystemEntityProtocol)intentMessageProtocol;
+ (LNSystemEntityProtocol)mailAccountProtocol;
+ (LNSystemEntityProtocol)mailAddresseeProtocol;
+ (LNSystemEntityProtocol)mailMessageProtocol;
+ (LNSystemEntityProtocol)mailboxProtocol;
+ (LNSystemEntityProtocol)messageGroupProtocol;
+ (LNSystemEntityProtocol)messageParticipantProtocol;
+ (LNSystemEntityProtocol)persistentFileIdentifiableEntityProtocol;
+ (LNSystemEntityProtocol)protocolWithIdentifier:(id)a3;
+ (LNSystemEntityProtocol)uniqueEntityProtocol;
+ (LNSystemEntityProtocol)updatableEntityProtocol;
+ (LNSystemEntityProtocol)urlRepresentableProtocol;
+ (LNSystemEntityProtocol)visualSearchOCRProtocol;
+ (LNSystemEntityProtocol)visualSearchProtocol;
+ (NSArray)allProtocols;
+ (id)allProtocolsByIdentifier;
- (BOOL)isEqual:(id)a3;
- (LNSystemEntityProtocol)initWithCoder:(id)a3;
- (LNSystemEntityProtocol)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSystemEntityProtocol

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNSystemEntityProtocol *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNSystemEntityProtocol *)self identifier];
      v8 = [(LNSystemEntityProtocol *)v6 identifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(LNSystemEntityProtocol *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNSystemEntityProtocol *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (LNSystemEntityProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v5)
  {
    self = [(LNSystemEntityProtocol *)self initWithIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(LNSystemEntityProtocol *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return v7;
}

- (LNSystemEntityProtocol)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNSystemEntityProtocol.m", 170, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNSystemEntityProtocol;
  v6 = [(LNSystemEntityProtocol *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    char v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LNSystemEntityProtocol)protocolWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LNSystemEntityProtocol.m", 183, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v6 = [a1 allProtocolsByIdentifier];
  uint64_t v7 = [v6 valueForKey:v5];

  if (!v7)
  {
    v8 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_19C9AD000, v8, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid LNSystemEntityProtocolIdentifier", buf, 0xCu);
    }
  }
  return (LNSystemEntityProtocol *)v7;
}

+ (NSArray)allProtocols
{
  v2 = [a1 allProtocolsByIdentifier];
  unint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

+ (id)allProtocolsByIdentifier
{
  if (allProtocolsByIdentifier_onceToken != -1) {
    dispatch_once(&allProtocolsByIdentifier_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)allProtocolsByIdentifier_protocolsByIdentifier;
  return v2;
}

void __50__LNSystemEntityProtocol_allProtocolsByIdentifier__block_invoke()
{
  v18[15] = *MEMORY[0x1E4F143B8];
  v17[0] = @"com.apple.appintents.entity.AssistantEntity";
  v16 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.AssistantEntity"];
  v18[0] = v16;
  v17[1] = @"com.apple.appintents.entity.MailAccount";
  v15 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.MailAccount"];
  v18[1] = v15;
  v17[2] = @"com.apple.appintents.entity.MailAddressee";
  v14 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.MailAddressee"];
  v18[2] = v14;
  v17[3] = @"com.apple.appintents.entity.MailMessage";
  uint64_t v13 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.MailMessage"];
  v18[3] = v13;
  v17[4] = @"com.apple.appintents.entity.Mailbox";
  id v12 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.Mailbox"];
  v18[4] = v12;
  v17[5] = @"com.apple.appintents.entity.IntentMessage";
  v11 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.IntentMessage"];
  v18[5] = v11;
  v17[6] = @"com.apple.appintents.entity.MessageGroup";
  v0 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.MessageGroup"];
  v18[6] = v0;
  v17[7] = @"com.apple.appintents.entity.MessageParticipant";
  v1 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.MessageParticipant"];
  v18[7] = v1;
  v17[8] = @"com.apple.appintents.entity.SingleEntity";
  v2 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.SingleEntity"];
  v18[8] = v2;
  v17[9] = @"com.apple.appintents.entity.Updatable";
  unint64_t v3 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.Updatable"];
  v18[9] = v3;
  v17[10] = @"com.apple.appintents.entity.Indexed";
  id v4 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.Indexed"];
  v18[10] = v4;
  v17[11] = @"com.apple.appintents.entity.PersistentFileIdentifiable";
  id v5 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.PersistentFileIdentifiable"];
  v18[11] = v5;
  v17[12] = @"com.apple.appintents.entity.VisualSearch";
  v6 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.VisualSearch"];
  v18[12] = v6;
  v17[13] = @"com.apple.appintents.entity.VisualSearchOCR";
  uint64_t v7 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.VisualSearchOCR"];
  v18[13] = v7;
  v17[14] = @"com.apple.appintents.entity.URLRepresentable";
  v8 = [[LNSystemEntityProtocol alloc] initWithIdentifier:@"com.apple.appintents.entity.URLRepresentable"];
  v18[14] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:15];
  v10 = (void *)allProtocolsByIdentifier_protocolsByIdentifier;
  allProtocolsByIdentifier_protocolsByIdentifier = v9;
}

+ (LNSystemEntityProtocol)urlRepresentableProtocol
{
  if (urlRepresentableProtocol_onceToken != -1) {
    dispatch_once(&urlRepresentableProtocol_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)urlRepresentableProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __50__LNSystemEntityProtocol_urlRepresentableProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.URLRepresentable"];
  v1 = (void *)urlRepresentableProtocol_value;
  urlRepresentableProtocol_value = v0;
}

+ (LNSystemEntityProtocol)persistentFileIdentifiableEntityProtocol
{
  if (persistentFileIdentifiableEntityProtocol_onceToken != -1) {
    dispatch_once(&persistentFileIdentifiableEntityProtocol_onceToken, &__block_literal_global_69);
  }
  id v2 = (void *)persistentFileIdentifiableEntityProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __66__LNSystemEntityProtocol_persistentFileIdentifiableEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.PersistentFileIdentifiable"];
  v1 = (void *)persistentFileIdentifiableEntityProtocol_value;
  persistentFileIdentifiableEntityProtocol_value = v0;
}

+ (LNSystemEntityProtocol)indexedEntityProtocol
{
  if (indexedEntityProtocol_onceToken != -1) {
    dispatch_once(&indexedEntityProtocol_onceToken, &__block_literal_global_67);
  }
  id v2 = (void *)indexedEntityProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __47__LNSystemEntityProtocol_indexedEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.Indexed"];
  v1 = (void *)indexedEntityProtocol_value;
  indexedEntityProtocol_value = v0;
}

+ (LNSystemEntityProtocol)updatableEntityProtocol
{
  if (updatableEntityProtocol_onceToken != -1) {
    dispatch_once(&updatableEntityProtocol_onceToken, &__block_literal_global_65);
  }
  id v2 = (void *)updatableEntityProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __49__LNSystemEntityProtocol_updatableEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.Updatable"];
  v1 = (void *)updatableEntityProtocol_value;
  updatableEntityProtocol_value = v0;
}

+ (LNSystemEntityProtocol)uniqueEntityProtocol
{
  if (uniqueEntityProtocol_onceToken != -1) {
    dispatch_once(&uniqueEntityProtocol_onceToken, &__block_literal_global_63);
  }
  id v2 = (void *)uniqueEntityProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __46__LNSystemEntityProtocol_uniqueEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.SingleEntity"];
  v1 = (void *)uniqueEntityProtocol_value;
  uniqueEntityProtocol_value = v0;
}

+ (LNSystemEntityProtocol)visualSearchOCRProtocol
{
  if (visualSearchOCRProtocol_onceToken != -1) {
    dispatch_once(&visualSearchOCRProtocol_onceToken, &__block_literal_global_61);
  }
  id v2 = (void *)visualSearchOCRProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __49__LNSystemEntityProtocol_visualSearchOCRProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.VisualSearchOCR"];
  v1 = (void *)visualSearchOCRProtocol_value;
  visualSearchOCRProtocol_value = v0;
}

+ (LNSystemEntityProtocol)visualSearchProtocol
{
  if (visualSearchProtocol_onceToken != -1) {
    dispatch_once(&visualSearchProtocol_onceToken, &__block_literal_global_59);
  }
  id v2 = (void *)visualSearchProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __46__LNSystemEntityProtocol_visualSearchProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.VisualSearch"];
  v1 = (void *)visualSearchProtocol_value;
  visualSearchProtocol_value = v0;
}

+ (LNSystemEntityProtocol)messageParticipantProtocol
{
  if (messageParticipantProtocol_onceToken != -1) {
    dispatch_once(&messageParticipantProtocol_onceToken, &__block_literal_global_57);
  }
  id v2 = (void *)messageParticipantProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __52__LNSystemEntityProtocol_messageParticipantProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.MessageParticipant"];
  v1 = (void *)messageParticipantProtocol_value;
  messageParticipantProtocol_value = v0;
}

+ (LNSystemEntityProtocol)messageGroupProtocol
{
  if (messageGroupProtocol_onceToken != -1) {
    dispatch_once(&messageGroupProtocol_onceToken, &__block_literal_global_55);
  }
  id v2 = (void *)messageGroupProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __46__LNSystemEntityProtocol_messageGroupProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.MessageGroup"];
  v1 = (void *)messageGroupProtocol_value;
  messageGroupProtocol_value = v0;
}

+ (LNSystemEntityProtocol)intentMessageProtocol
{
  if (intentMessageProtocol_onceToken != -1) {
    dispatch_once(&intentMessageProtocol_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)intentMessageProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __47__LNSystemEntityProtocol_intentMessageProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.IntentMessage"];
  v1 = (void *)intentMessageProtocol_value;
  intentMessageProtocol_value = v0;
}

+ (LNSystemEntityProtocol)mailboxProtocol
{
  if (mailboxProtocol_onceToken != -1) {
    dispatch_once(&mailboxProtocol_onceToken, &__block_literal_global_51);
  }
  id v2 = (void *)mailboxProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __41__LNSystemEntityProtocol_mailboxProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.Mailbox"];
  v1 = (void *)mailboxProtocol_value;
  mailboxProtocol_value = v0;
}

+ (LNSystemEntityProtocol)mailMessageProtocol
{
  if (mailMessageProtocol_onceToken != -1) {
    dispatch_once(&mailMessageProtocol_onceToken, &__block_literal_global_49);
  }
  id v2 = (void *)mailMessageProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __45__LNSystemEntityProtocol_mailMessageProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.MailMessage"];
  v1 = (void *)mailMessageProtocol_value;
  mailMessageProtocol_value = v0;
}

+ (LNSystemEntityProtocol)mailAddresseeProtocol
{
  if (mailAddresseeProtocol_onceToken != -1) {
    dispatch_once(&mailAddresseeProtocol_onceToken, &__block_literal_global_47);
  }
  id v2 = (void *)mailAddresseeProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __47__LNSystemEntityProtocol_mailAddresseeProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.MailAddressee"];
  v1 = (void *)mailAddresseeProtocol_value;
  mailAddresseeProtocol_value = v0;
}

+ (LNSystemEntityProtocol)mailAccountProtocol
{
  if (mailAccountProtocol_onceToken != -1) {
    dispatch_once(&mailAccountProtocol_onceToken, &__block_literal_global_45);
  }
  id v2 = (void *)mailAccountProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __45__LNSystemEntityProtocol_mailAccountProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.MailAccount"];
  v1 = (void *)mailAccountProtocol_value;
  mailAccountProtocol_value = v0;
}

+ (LNSystemEntityProtocol)assistantEntityProtocol
{
  if (assistantEntityProtocol_onceToken != -1) {
    dispatch_once(&assistantEntityProtocol_onceToken, &__block_literal_global_2667);
  }
  id v2 = (void *)assistantEntityProtocol_value;
  return (LNSystemEntityProtocol *)v2;
}

void __49__LNSystemEntityProtocol_assistantEntityProtocol__block_invoke()
{
  id v2 = +[LNSystemEntityProtocol allProtocolsByIdentifier];
  uint64_t v0 = [v2 valueForKey:@"com.apple.appintents.entity.AssistantEntity"];
  v1 = (void *)assistantEntityProtocol_value;
  assistantEntityProtocol_value = v0;
}

@end