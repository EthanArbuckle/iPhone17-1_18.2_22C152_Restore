@interface IMServiceReachabilityContext
+ (BOOL)supportsSecureCoding;
- (BOOL)conversationWasDowngraded;
- (BOOL)forceMMS;
- (BOOL)hasConversationHistory;
- (BOOL)isForPendingConversation;
- (BOOL)shouldForceServerStatusRefresh;
- (IMServiceReachabilityContext)initWithCoder:(id)a3;
- (NSSet)preconditionsIgnoredForServices;
- (NSString)chatIdentifier;
- (NSString)lastUsedServiceName;
- (NSString)senderLastAddressedHandle;
- (NSString)senderLastAddressedSIMID;
- (NSString)serviceOfLastMessage;
- (id)_signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDictionary;
- (id)description;
- (unsigned)chatStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setChatStyle:(unsigned __int8)a3;
- (void)setConversationWasDowngraded:(BOOL)a3;
- (void)setForceMMS:(BOOL)a3;
- (void)setHasConversationHistory:(BOOL)a3;
- (void)setIsForPendingConversation:(BOOL)a3;
- (void)setLastUsedServiceName:(id)a3;
- (void)setPreconditionsIgnoredForServices:(id)a3;
- (void)setSenderLastAddressedHandle:(id)a3;
- (void)setSenderLastAddressedSIMID:(id)a3;
- (void)setServiceOfLastMessage:(id)a3;
- (void)setShouldForceServerStatusRefresh:(BOOL)a3;
@end

@implementation IMServiceReachabilityContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  chatIdentifier = self->_chatIdentifier;
  id v5 = a3;
  [v5 encodeObject:chatIdentifier forKey:@"ci"];
  [v5 encodeInteger:self->_chatStyle forKey:@"cs"];
  [v5 encodeObject:self->_senderLastAddressedHandle forKey:@"slah"];
  [v5 encodeObject:self->_senderLastAddressedSIMID forKey:@"slas"];
  [v5 encodeObject:self->_lastUsedServiceName forKey:@"lus"];
  [v5 encodeObject:self->_serviceOfLastMessage forKey:@"slm"];
  [v5 encodeBool:self->_conversationWasDowngraded forKey:@"cd"];
  [v5 encodeBool:self->_hasConversationHistory forKey:@"hh"];
  [v5 encodeBool:self->_shouldForceServerStatusRefresh forKey:@"fr"];
  [v5 encodeBool:self->_forceMMS forKey:@"fm"];
  [v5 encodeBool:self->_isForPendingConversation forKey:@"pc"];
}

- (IMServiceReachabilityContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMServiceReachabilityContext;
  id v5 = [(IMServiceReachabilityContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ci"];
    chatIdentifier = v5->_chatIdentifier;
    v5->_chatIdentifier = (NSString *)v6;

    v5->_chatStyle = [v4 decodeIntegerForKey:@"cs"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slah"];
    senderLastAddressedHandle = v5->_senderLastAddressedHandle;
    v5->_senderLastAddressedHandle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slas"];
    senderLastAddressedSIMID = v5->_senderLastAddressedSIMID;
    v5->_senderLastAddressedSIMID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lus"];
    lastUsedServiceName = v5->_lastUsedServiceName;
    v5->_lastUsedServiceName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slm"];
    serviceOfLastMessage = v5->_serviceOfLastMessage;
    v5->_serviceOfLastMessage = (NSString *)v14;

    v5->_conversationWasDowngraded = [v4 decodeBoolForKey:@"cd"];
    v5->_hasConversationHistory = [v4 decodeBoolForKey:@"hh"];
    v5->_shouldForceServerStatusRefresh = [v4 decodeBoolForKey:@"fr"];
    v5->_forceMMS = [v4 decodeBoolForKey:@"fm"];
    v5->_isForPendingConversation = [v4 decodeBoolForKey:@"pc"];
  }

  return v5;
}

- (id)createDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(IMServiceReachabilityContext *)self chatIdentifier];

  if (v4)
  {
    id v5 = [(IMServiceReachabilityContext *)self chatIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"ci"];
  }
  if ([(IMServiceReachabilityContext *)self chatStyle])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMServiceReachabilityContext chatStyle](self, "chatStyle"));
    [v3 setObject:v6 forKeyedSubscript:@"cs"];
  }
  v7 = [(IMServiceReachabilityContext *)self senderLastAddressedHandle];

  if (v7)
  {
    uint64_t v8 = [(IMServiceReachabilityContext *)self senderLastAddressedHandle];
    [v3 setObject:v8 forKeyedSubscript:@"slah"];
  }
  v9 = [(IMServiceReachabilityContext *)self senderLastAddressedSIMID];

  if (v9)
  {
    uint64_t v10 = [(IMServiceReachabilityContext *)self senderLastAddressedSIMID];
    [v3 setObject:v10 forKeyedSubscript:@"slas"];
  }
  v11 = [(IMServiceReachabilityContext *)self lastUsedServiceName];

  if (v11)
  {
    uint64_t v12 = [(IMServiceReachabilityContext *)self lastUsedServiceName];
    [v3 setObject:v12 forKeyedSubscript:@"lus"];
  }
  v13 = [(IMServiceReachabilityContext *)self serviceOfLastMessage];

  if (v13)
  {
    uint64_t v14 = [(IMServiceReachabilityContext *)self serviceOfLastMessage];
    [v3 setObject:v14 forKeyedSubscript:@"slm"];
  }
  if ([(IMServiceReachabilityContext *)self conversationWasDowngraded])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityContext conversationWasDowngraded](self, "conversationWasDowngraded"));
    [v3 setObject:v15 forKeyedSubscript:@"cd"];
  }
  if ([(IMServiceReachabilityContext *)self hasConversationHistory])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityContext hasConversationHistory](self, "hasConversationHistory"));
    [v3 setObject:v16 forKeyedSubscript:@"hh"];
  }
  if ([(IMServiceReachabilityContext *)self shouldForceServerStatusRefresh])
  {
    objc_super v17 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"));
    [v3 setObject:v17 forKeyedSubscript:@"fr"];
  }
  if ([(IMServiceReachabilityContext *)self forceMMS])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityContext forceMMS](self, "forceMMS"));
    [v3 setObject:v18 forKeyedSubscript:@"fm"];
  }
  if ([(IMServiceReachabilityContext *)self isForPendingConversation])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation"));
    [v3 setObject:v19 forKeyedSubscript:@"pc"];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(IMServiceReachabilityContext);
  id v5 = [(IMServiceReachabilityContext *)self chatIdentifier];
  [(IMServiceReachabilityContext *)v4 setChatIdentifier:v5];

  [(IMServiceReachabilityContext *)v4 setChatStyle:[(IMServiceReachabilityContext *)self chatStyle]];
  uint64_t v6 = [(IMServiceReachabilityContext *)self senderLastAddressedHandle];
  [(IMServiceReachabilityContext *)v4 setSenderLastAddressedHandle:v6];

  v7 = [(IMServiceReachabilityContext *)self senderLastAddressedSIMID];
  [(IMServiceReachabilityContext *)v4 setSenderLastAddressedSIMID:v7];

  uint64_t v8 = [(IMServiceReachabilityContext *)self lastUsedServiceName];
  [(IMServiceReachabilityContext *)v4 setLastUsedServiceName:v8];

  v9 = [(IMServiceReachabilityContext *)self serviceOfLastMessage];
  [(IMServiceReachabilityContext *)v4 setServiceOfLastMessage:v9];

  [(IMServiceReachabilityContext *)v4 setConversationWasDowngraded:[(IMServiceReachabilityContext *)self conversationWasDowngraded]];
  [(IMServiceReachabilityContext *)v4 setHasConversationHistory:[(IMServiceReachabilityContext *)self hasConversationHistory]];
  [(IMServiceReachabilityContext *)v4 setShouldForceServerStatusRefresh:[(IMServiceReachabilityContext *)self shouldForceServerStatusRefresh]];
  [(IMServiceReachabilityContext *)v4 setForceMMS:[(IMServiceReachabilityContext *)self forceMMS]];
  [(IMServiceReachabilityContext *)v4 setIsForPendingConversation:[(IMServiceReachabilityContext *)self isForPendingConversation]];
  return v4;
}

- (id)description
{
  objc_super v17 = NSString;
  uint64_t v16 = objc_opt_class();
  v15 = [(IMServiceReachabilityContext *)self chatIdentifier];
  signed __int8 v14 = [(IMServiceReachabilityContext *)self chatStyle];
  v13 = [(IMServiceReachabilityContext *)self senderLastAddressedHandle];
  id v3 = [(IMServiceReachabilityContext *)self senderLastAddressedSIMID];
  id v4 = [(IMServiceReachabilityContext *)self lastUsedServiceName];
  id v5 = [(IMServiceReachabilityContext *)self serviceOfLastMessage];
  if ([(IMServiceReachabilityContext *)self conversationWasDowngraded]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(IMServiceReachabilityContext *)self hasConversationHistory]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(IMServiceReachabilityContext *)self shouldForceServerStatusRefresh]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(IMServiceReachabilityContext *)self forceMMS]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(IMServiceReachabilityContext *)self isForPendingConversation]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v11 = [v17 stringWithFormat:@"<%@ %p [chatIdentifier: %@ style: %c senderLastAddressedHandle: %@ SIMID: %@ lastUsedService: %@ serviceOfLastMessage: %@ wasDowngraded: %@ hasHistory: %@ shouldForceRefresh: %@ forceMMS: %@ isForPendingConversation: %@]>", v16, self, v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)_signature
{
  id v3 = NSString;
  id v4 = [(IMServiceReachabilityContext *)self senderLastAddressedHandle];
  id v5 = [(IMServiceReachabilityContext *)self senderLastAddressedSIMID];
  uint64_t v6 = [v3 stringWithFormat:@"%@%@%b%b%b", v4, v5, -[IMServiceReachabilityContext shouldForceServerStatusRefresh](self, "shouldForceServerStatusRefresh"), -[IMServiceReachabilityContext forceMMS](self, "forceMMS"), -[IMServiceReachabilityContext isForPendingConversation](self, "isForPendingConversation")];

  return v6;
}

- (NSString)senderLastAddressedHandle
{
  return self->_senderLastAddressedHandle;
}

- (void)setSenderLastAddressedHandle:(id)a3
{
}

- (NSString)senderLastAddressedSIMID
{
  return self->_senderLastAddressedSIMID;
}

- (void)setSenderLastAddressedSIMID:(id)a3
{
}

- (NSString)lastUsedServiceName
{
  return self->_lastUsedServiceName;
}

- (void)setLastUsedServiceName:(id)a3
{
}

- (NSString)serviceOfLastMessage
{
  return self->_serviceOfLastMessage;
}

- (void)setServiceOfLastMessage:(id)a3
{
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

- (BOOL)shouldForceServerStatusRefresh
{
  return self->_shouldForceServerStatusRefresh;
}

- (void)setShouldForceServerStatusRefresh:(BOOL)a3
{
  self->_shouldForceServerStatusRefresh = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (BOOL)conversationWasDowngraded
{
  return self->_conversationWasDowngraded;
}

- (void)setConversationWasDowngraded:(BOOL)a3
{
  self->_conversationWasDowngraded = a3;
}

- (BOOL)hasConversationHistory
{
  return self->_hasConversationHistory;
}

- (void)setHasConversationHistory:(BOOL)a3
{
  self->_hasConversationHistory = a3;
}

- (BOOL)isForPendingConversation
{
  return self->_isForPendingConversation;
}

- (void)setIsForPendingConversation:(BOOL)a3
{
  self->_isForPendingConversation = a3;
}

- (NSSet)preconditionsIgnoredForServices
{
  return self->_preconditionsIgnoredForServices;
}

- (void)setPreconditionsIgnoredForServices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preconditionsIgnoredForServices, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceOfLastMessage, 0);
  objc_storeStrong((id *)&self->_lastUsedServiceName, 0);
  objc_storeStrong((id *)&self->_senderLastAddressedSIMID, 0);

  objc_storeStrong((id *)&self->_senderLastAddressedHandle, 0);
}

@end