@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithJSON:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)startedOrChanged;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)ended;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteContextId;
- (void)deleteEnded;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.voicecmds.VoiceCmdsWaitForRequestContext";
}

- (id)getVersion
{
  return &off_293F18;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self whichContextevent];
  CFStringRef v3 = @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext";
  if (v2 == 101) {
    CFStringRef v3 = @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext.ProvisionalVoiceCmdsWaitForRequestRemovalInfo";
  }
  if (v2 == 100) {
    return @"com.apple.aiml.siri.voicecmds.ProvisionalVoiceCmdsWaitForRequestContext.ProvisionalVoiceCmdsWaitForRequestContextInfo";
  }
  else {
    return (id)v3;
  }
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
}

- (void)setStartedOrChanged:(id)a3
{
  v4 = (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)a3;
  ended = self->_ended;
  self->_ended = 0;

  unint64_t v6 = 100;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichContextevent = v6;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)startedOrChanged
{
  if (self->_whichContextevent == 100) {
    unint64_t v2 = self->_startedOrChanged;
  }
  else {
    unint64_t v2 = 0;
  }

  return v2;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 100)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;
  }
}

- (void)setEnded:(id)a3
{
  v4 = (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)ended
{
  if (self->_whichContextevent == 101) {
    unint64_t v2 = self->_ended;
  }
  else {
    unint64_t v2 = 0;
  }

  return v2;
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];

  if (v4)
  {
    v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];

  if (v6)
  {
    v7 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];

  if (v8)
  {
    v9 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  id whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_18;
  }
  unint64_t v6 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];
  v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];
    v11 = [v4 contextId];
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unint64_t v6 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];
  v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];
    v16 = [v4 startedOrChanged];
    unsigned int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unint64_t v6 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];
  v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];
    v21 = [v4 ended];
    unsigned __int8 v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(SISchemaUUID *)self->_contextId hash];
  unint64_t v4 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)self->_startedOrChanged hash] ^ v3;
  return v4 ^ [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self->_ended hash];
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  if (self->_contextId)
  {
    unint64_t v4 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      unint64_t v6 = +[NSNull null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if (self->_ended)
  {
    v7 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self ended];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ended"];
    }
    else
    {
      v9 = +[NSNull null];
      [v3 setObject:v9 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_startedOrChanged)
  {
    id v10 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self startedOrChanged];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      unsigned int v12 = +[NSNull null];
      [v3 setObject:v12 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  unint64_t v2 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self dictionaryRepresentation];
  if (+[NSJSONSerialization isValidJSONObject:v2])
  {
    unint64_t v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext;
  v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)&v14 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [objc_alloc((Class)SISchemaUUID) initWithDictionary:v6];
      [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)v5 setContextId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo alloc] initWithDictionary:v8];
      [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)v5 setStartedOrChanged:v9];
    }
    id v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo alloc] initWithDictionary:v10];
      [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContext *)v5 setEnded:v11];
    }
    unsigned int v12 = v5;
  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);

  objc_storeStrong((id *)&self->_contextId, 0);
}

@end