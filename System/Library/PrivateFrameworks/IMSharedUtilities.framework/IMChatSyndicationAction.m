@interface IMChatSyndicationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)autoSyndicateMessages;
- (BOOL)isAutoDonatingMessages;
- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5;
- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5 version:(unsigned __int8)a6;
- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 deserializedSyndicationActionType:(unsigned __int8)a5 version:(unsigned __int8)a6;
- (IMChatSyndicationAction)initWithCoder:(id)a3;
- (IMChatSyndicationAction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)syndicatedItemType;
@end

@implementation IMChatSyndicationAction

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5
{
  return [(IMChatSyndicationAction *)self initWithChatGUID:a3 syndicationStartDate:a4 autoDonateMessages:a5 version:IMSyndicationActionCurrentVersion];
}

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5 version:(unsigned __int8)a6
{
  v6 = self;
  if (IMSyndicationActionCurrentVersion == a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMChatSyndicationAction;
    if (a5) {
      v8 = [(IMSyndicationAction *)&v12 initWithChatGUID:a3 syndicationStartDate:a4 syndicationActionType:4];
    }
    else {
      v8 = [(IMSyndicationAction *)&v12 initWithChatGUID:a3 syndicationStartDate:a4 syndicationActionType:8];
    }
    if (v8) {
      v8->_autoDonateMessages = a5;
    }
    v6 = v8;
    v9 = v6;
  }
  else
  {
    v10 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFCB8();
    }

    v9 = 0;
  }

  return v9;
}

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 deserializedSyndicationActionType:(unsigned __int8)a5 version:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  unsigned int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ((unsigned __int16)IMSyndicationActionCurrentVersion == v6)
  {
    unsigned int v12 = v7 & 0xFFFFFFFB;
    if ((v7 & 4) == 0) {
      unsigned int v12 = v7;
    }
    if ((v7 & 8) != 0) {
      v12 &= ~8u;
    }
    if ((v7 & 0x10) != 0) {
      v12 &= ~0x10u;
    }
    if ((v7 & 0x20) != 0) {
      v12 &= ~0x20u;
    }
    if ((v7 & 0x40) != 0) {
      v12 &= ~0x40u;
    }
    if (!v12)
    {
      self = [(IMChatSyndicationAction *)self initWithChatGUID:v10 syndicationStartDate:v11 autoDonateMessages:(v7 >> 2) & 1 version:v6];
      v15 = self;
      goto LABEL_20;
    }
    v13 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFD20(v7, v13);
    }
  }
  else
  {
    v14 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFCB8();
    }
  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (IMChatSyndicationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sacg"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sasd"];
  unsigned __int8 v7 = [v4 decodeInt64ForKey:@"sat2"];
  unsigned __int8 v8 = [v4 decodeInt64ForKey:@"savs"];

  v9 = [(IMChatSyndicationAction *)self initWithChatGUID:v5 syndicationStartDate:v6 deserializedSyndicationActionType:v7 version:v8];
  return v9;
}

- (IMChatSyndicationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"sacg"];
  uint64_t v6 = objc_opt_class();
  unsigned __int8 v7 = [v4 objectForKeyedSubscript:@"sasd"];
  unsigned __int8 v8 = [v6 dateFromNanoSeconds:v7];
  v9 = [v4 objectForKeyedSubscript:@"sat2"];
  uint64_t v10 = [v9 unsignedCharValue];
  id v11 = [v4 objectForKeyedSubscript:@"savs"];

  unsigned int v12 = -[IMChatSyndicationAction initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:](self, "initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:", v5, v8, v10, [v11 unsignedCharValue]);
  return v12;
}

- (BOOL)autoSyndicateMessages
{
  return [(IMSyndicationAction *)self syndicationActionType] == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)syndicatedItemType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(IMSyndicationAction *)self chatGUID];
  uint64_t v6 = [(IMSyndicationAction *)self syndicationStartDate];
  unsigned __int8 v7 = objc_msgSend(v4, "initWithChatGUID:syndicationStartDate:autoDonateMessages:version:", v5, v6, -[IMChatSyndicationAction autoSyndicateMessages](self, "autoSyndicateMessages"), -[IMSyndicationAction version](self, "version"));

  return v7;
}

- (BOOL)isAutoDonatingMessages
{
  return self->_autoDonateMessages;
}

@end