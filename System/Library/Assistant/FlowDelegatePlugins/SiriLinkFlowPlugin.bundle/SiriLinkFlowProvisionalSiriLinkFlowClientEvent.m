@interface SiriLinkFlowProvisionalSiriLinkFlowClientEvent
- (BOOL)hasEventMetadata;
- (BOOL)hasLinkActionCompletion;
- (BOOL)hasLinkActionConversion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEventMetadata)eventMetadata;
- (NSData)jsonData;
- (SiriLinkFlowProvisionalLinkActionCompletion)linkActionCompletion;
- (SiriLinkFlowProvisionalLinkActionConversion)linkActionConversion;
- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasLinkActionCompletion:(BOOL)a3;
- (void)setHasLinkActionConversion:(BOOL)a3;
- (void)setLinkActionCompletion:(id)a3;
- (void)setLinkActionConversion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalSiriLinkFlowClientEvent

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
  return @"com.apple.aiml.siri.link.flow.provisional.SiriLinkFlowClientEvent";
}

- (id)getVersion
{
  return &off_293F00;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)setLinkActionCompletion:(id)a3
{
  v4 = (SiriLinkFlowProvisionalLinkActionCompletion *)a3;
  linkActionConversion = self->_linkActionConversion;
  self->_linkActionConversion = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichEvent_Type = v6;
  linkActionCompletion = self->_linkActionCompletion;
  self->_linkActionCompletion = v4;
}

- (SiriLinkFlowProvisionalLinkActionCompletion)linkActionCompletion
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_linkActionCompletion;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setLinkActionConversion:(id)a3
{
  v4 = (SiriLinkFlowProvisionalLinkActionConversion *)a3;
  linkActionCompletion = self->_linkActionCompletion;
  self->_linkActionCompletion = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_whichEvent_Type = v6;
  linkActionConversion = self->_linkActionConversion;
  self->_linkActionConversion = v4;
}

- (SiriLinkFlowProvisionalLinkActionConversion)linkActionConversion
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_linkActionConversion;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalSiriLinkFlowClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];

  if (v4)
  {
    v5 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];

  if (v6)
  {
    v7 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];

  if (v8)
  {
    v9 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  id whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_18;
  }
  unint64_t v6 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];
  v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];
    v11 = [v4 eventMetadata];
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];
  v7 = [v4 linkActionCompletion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];
    v16 = [v4 linkActionCompletion];
    unsigned int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];
  v7 = [v4 linkActionConversion];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];
    v21 = [v4 linkActionConversion];
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
  unint64_t v3 = (unint64_t)[(FLOWSchemaFLOWEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self->_linkActionCompletion hash] ^ v3;
  return v4 ^ [(SiriLinkFlowProvisionalLinkActionConversion *)self->_linkActionConversion hash];
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  if (self->_eventMetadata)
  {
    unint64_t v4 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      unint64_t v6 = +[NSNull null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_linkActionCompletion)
  {
    v7 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionCompletion];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"linkActionCompletion"];
    }
    else
    {
      v9 = +[NSNull null];
      [v3 setObject:v9 forKeyedSubscript:@"linkActionCompletion"];
    }
  }
  if (self->_linkActionConversion)
  {
    id v10 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self linkActionConversion];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"linkActionConversion"];
    }
    else
    {
      unsigned int v12 = +[NSNull null];
      [v3 setObject:v12 forKeyedSubscript:@"linkActionConversion"];
    }
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self dictionaryRepresentation];
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

- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SiriLinkFlowProvisionalSiriLinkFlowClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriLinkFlowProvisionalSiriLinkFlowClientEvent;
  v5 = [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)&v14 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [objc_alloc((Class)FLOWSchemaFLOWEventMetadata) initWithDictionary:v6];
      [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"linkActionCompletion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SiriLinkFlowProvisionalLinkActionCompletion alloc] initWithDictionary:v8];
      [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)v5 setLinkActionCompletion:v9];
    }
    id v10 = [v4 objectForKeyedSubscript:@"linkActionConversion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SiriLinkFlowProvisionalLinkActionConversion alloc] initWithDictionary:v10];
      [(SiriLinkFlowProvisionalSiriLinkFlowClientEvent *)v5 setLinkActionConversion:v11];
    }
    unsigned int v12 = v5;
  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasLinkActionCompletion
{
  return self->_hasLinkActionCompletion;
}

- (void)setHasLinkActionCompletion:(BOOL)a3
{
  self->_hasLinkActionCompletion = a3;
}

- (BOOL)hasLinkActionConversion
{
  return self->_hasLinkActionConversion;
}

- (void)setHasLinkActionConversion:(BOOL)a3
{
  self->_hasLinkActionConversion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkActionConversion, 0);
  objc_storeStrong((id *)&self->_linkActionCompletion, 0);

  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

@end