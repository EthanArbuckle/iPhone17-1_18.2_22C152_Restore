@interface SiriLinkRRProvisionalSRRLinkMetricClientEvent
- (BOOL)hasLinkEntityPresent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SiriLinkRRProvisionalLinkEntityPresent)linkEntityPresent;
- (SiriLinkRRProvisionalSRRLinkMetricClientEvent)initWithDictionary:(id)a3;
- (SiriLinkRRProvisionalSRRLinkMetricClientEvent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)setHasLinkEntityPresent:(BOOL)a3;
- (void)setLinkEntityPresent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkRRProvisionalSRRLinkMetricClientEvent

- (void).cxx_destruct
{
}

- (void)setHasLinkEntityPresent:(BOOL)a3
{
  self->_hasLinkEntityPresent = a3;
}

- (BOOL)hasLinkEntityPresent
{
  return self->_hasLinkEntityPresent;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SiriLinkRRProvisionalSRRLinkMetricClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriLinkRRProvisionalSRRLinkMetricClientEvent;
  v5 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkEntityPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SiriLinkRRProvisionalLinkEntityPresent alloc] initWithDictionary:v6];
      [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)v5 setLinkEntityPresent:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (SiriLinkRRProvisionalSRRLinkMetricClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self dictionaryRepresentation];
  if (+[NSJSONSerialization isValidJSONObject:v2])
  {
    v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (self->_linkEntityPresent)
  {
    id v4 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkEntityPresent"];
    }
    else
    {
      v6 = +[NSNull null];
      [v3 setObject:v6 forKeyedSubscript:@"linkEntityPresent"];
    }
  }
  [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (unint64_t)hash
{
  return [(SiriLinkRRProvisionalLinkEntityPresent *)self->_linkEntityPresent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id whichEvent_Type = self->_whichEvent_Type;
    if (whichEvent_Type == objc_msgSend(v4, "whichEvent_Type"))
    {
      v6 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];
      uint64_t v7 = [v4 linkEntityPresent];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];
        v12 = [v4 linkEntityPresent];
        unsigned __int8 v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];

  if (v4)
  {
    v5 = [(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self linkEntityPresent];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkRRProvisionalSRRLinkMetricClientEventReadFrom(self, (uint64_t)a3);
}

- (SiriLinkRRProvisionalLinkEntityPresent)linkEntityPresent
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_linkEntityPresent;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setLinkEntityPresent:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_id whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_linkEntityPresent, a3);
}

- (id)qualifiedMessageName
{
  if ((char *)[(SiriLinkRRProvisionalSRRLinkMetricClientEvent *)self whichEvent_Type] == (char *)&stru_20.flags + 1) {
    return @"com.apple.aiml.siri.link.rr.provisional.SRRLinkMetricClientEvent.LinkEntityPresent";
  }
  else {
    return @"com.apple.aiml.siri.link.rr.provisional.SRRLinkMetricClientEvent";
  }
}

- (id)getVersion
{
  return &off_14F30;
}

- (id)getTypeId
{
  return @"com.apple.aiml.siri.link.rr.provisional.SRRLinkMetricClientEvent";
}

- (BOOL)isProvisional
{
  return 1;
}

- (int)getAnyEventType
{
  return 7;
}

@end