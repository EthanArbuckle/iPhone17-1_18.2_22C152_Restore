@interface IMSharedEmergencyInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoFromDictionary:(id)a3 isStewieTranscriptSharingMessage:(BOOL *)a4;
- (IMSharedEmergencyInfo)initWithCoder:(id)a3;
- (IMSharedEmergencyInfo)initWithStewieUserPersona:(id)a3 stewieUserPersona:(id)a4 conversationID:(id)a5 messageType:(int64_t)a6;
- (IMSharedPersona)emergencyUserPersona;
- (IMSharedPersona)senderPersona;
- (NSDictionary)dictionaryRepresentation;
- (NSString)conversationID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)messageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMSharedEmergencyInfo

+ (id)infoFromDictionary:(id)a3 isStewieTranscriptSharingMessage:(BOOL *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  v7 = [v5 _dictionaryForKey:@"eufo"];
  if (v7)
  {
  }
  else
  {
    v8 = [v6 _dictionaryForKey:@"prsna"];

    if (!v8)
    {
      v19 = 0;
      goto LABEL_25;
    }
  }
  if (a4) {
    *a4 = 1;
  }
  v9 = [v6 _dictionaryForKey:@"eufo"];
  v10 = +[IMSharedPersona personaFromDictionaryRepresentation:v9];

  v11 = [v6 _dictionaryForKey:@"prsna"];
  v12 = +[IMSharedPersona personaFromDictionaryRepresentation:v11];

  v13 = [v6 _dictionaryForKey:@"eufo"];
  v14 = [v13 _stringForKey:@"cid"];

  v15 = [v6 _dictionaryForKey:@"eufo"];
  v16 = [v15 _stringForKey:@"t"];

  if ([v16 isEqualToString:@"message"])
  {
    uint64_t v17 = 1;
    if (!a4)
    {
LABEL_10:
      uint64_t v18 = [v6 _stringForKey:@"cid"];

      v14 = (void *)v18;
    }
  }
  else
  {
    if ([v16 isEqualToString:@"information"]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    if (!a4) {
      goto LABEL_10;
    }
  }
  v19 = [[IMSharedEmergencyInfo alloc] initWithStewieUserPersona:v10 stewieUserPersona:v12 conversationID:v14 messageType:v17];
  if (!v10 || v12)
  {
    if (v10 || !v12) {
      goto LABEL_20;
    }
    if (_IMWillLog()) {
      goto LABEL_18;
    }
  }
  else if (_IMWillLog())
  {
LABEL_18:
    _IMAlwaysLog();
  }

  v19 = 0;
LABEL_20:
  if (!v14)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }

    v19 = 0;
  }

LABEL_25:

  return v19;
}

- (IMSharedEmergencyInfo)initWithStewieUserPersona:(id)a3 stewieUserPersona:(id)a4 conversationID:(id)a5 messageType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMSharedEmergencyInfo;
  v14 = [(IMSharedEmergencyInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_emergencyUserPersona, a3);
    objc_storeStrong((id *)&v15->_senderPersona, a4);
    objc_storeStrong((id *)&v15->_conversationID, a5);
    v15->_messageType = a6;
  }

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(IMSharedPersona *)self->_emergencyUserPersona dictionaryRepresentation];
  [v3 setValue:v4 forKey:@"eufo"];

  id v5 = [(IMSharedPersona *)self->_senderPersona dictionaryRepresentation];
  [v3 setValue:v5 forKey:@"prsna"];

  [v3 setValue:self->_conversationID forKey:@"cid"];
  v6 = [NSNumber numberWithInteger:self->_messageType];
  [v3 setValue:v6 forKey:@"t"];

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [IMSharedEmergencyInfo alloc];
  emergencyUserPersona = self->_emergencyUserPersona;
  senderPersona = self->_senderPersona;
  conversationID = self->_conversationID;
  int64_t messageType = self->_messageType;

  return [(IMSharedEmergencyInfo *)v4 initWithStewieUserPersona:emergencyUserPersona stewieUserPersona:senderPersona conversationID:conversationID messageType:messageType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSharedEmergencyInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eufo"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prsna"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cid"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"t"];

  v9 = [(IMSharedEmergencyInfo *)self initWithStewieUserPersona:v5 stewieUserPersona:v6 conversationID:v7 messageType:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  emergencyUserPersona = self->_emergencyUserPersona;
  id v5 = a3;
  [v5 encodeObject:emergencyUserPersona forKey:@"eufo"];
  [v5 encodeObject:self->_senderPersona forKey:@"prsna"];
  [v5 encodeObject:self->_conversationID forKey:@"cid"];
  [v5 encodeInteger:self->_messageType forKey:@"t"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_conversationID withName:@"ConversationID"];
  id v4 = (id)[v3 appendInteger:self->_messageType withName:@"messageType"];
  id v5 = (id)[v3 appendObject:self->_emergencyUserPersona withName:@"emergencyUserPersona"];
  id v6 = (id)[v3 appendObject:self->_senderPersona withName:@"senderPersona"];
  v7 = [v3 build];

  return v7;
}

- (IMSharedPersona)emergencyUserPersona
{
  return self->_emergencyUserPersona;
}

- (IMSharedPersona)senderPersona
{
  return self->_senderPersona;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_senderPersona, 0);

  objc_storeStrong((id *)&self->_emergencyUserPersona, 0);
}

@end