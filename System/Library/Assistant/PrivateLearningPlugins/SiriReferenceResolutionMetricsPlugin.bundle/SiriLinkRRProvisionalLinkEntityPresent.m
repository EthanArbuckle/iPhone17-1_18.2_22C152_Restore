@interface SiriLinkRRProvisionalLinkEntityPresent
- (BOOL)entityPresent;
- (BOOL)hasEntityPresent;
- (BOOL)hasExecutionStage;
- (BOOL)hasLinkEntityType;
- (BOOL)hasSourceBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)linkEntityType;
- (NSString)sourceBundleId;
- (SiriLinkRRProvisionalLinkEntityPresent)initWithDictionary:(id)a3;
- (SiriLinkRRProvisionalLinkEntityPresent)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)executionStage;
- (unint64_t)hash;
- (void)setEntityPresent:(BOOL)a3;
- (void)setExecutionStage:(int)a3;
- (void)setHasEntityPresent:(BOOL)a3;
- (void)setHasExecutionStage:(BOOL)a3;
- (void)setHasLinkEntityType:(BOOL)a3;
- (void)setHasSourceBundleId:(BOOL)a3;
- (void)setLinkEntityType:(id)a3;
- (void)setSourceBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkRRProvisionalLinkEntityPresent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntityType, 0);

  objc_storeStrong((id *)&self->_sourceBundleId, 0);
}

- (void)setHasLinkEntityType:(BOOL)a3
{
  self->_hasLinkEntityType = a3;
}

- (void)setHasSourceBundleId:(BOOL)a3
{
  self->_hasSourceBundleId = a3;
}

- (BOOL)entityPresent
{
  return self->_entityPresent;
}

- (int)executionStage
{
  return self->_executionStage;
}

- (void)setLinkEntityType:(id)a3
{
}

- (NSString)linkEntityType
{
  return self->_linkEntityType;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (SiriLinkRRProvisionalLinkEntityPresent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriLinkRRProvisionalLinkEntityPresent;
  v5 = [(SiriLinkRRProvisionalLinkEntityPresent *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sourceBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(SiriLinkRRProvisionalLinkEntityPresent *)v5 setSourceBundleId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"linkEntityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 copy];
      [(SiriLinkRRProvisionalLinkEntityPresent *)v5 setLinkEntityType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"executionStage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SiriLinkRRProvisionalLinkEntityPresent setExecutionStage:](v5, "setExecutionStage:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"entityPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SiriLinkRRProvisionalLinkEntityPresent setEntityPresent:](v5, "setEntityPresent:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (SiriLinkRRProvisionalLinkEntityPresent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SiriLinkRRProvisionalLinkEntityPresent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkRRProvisionalLinkEntityPresent *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithBool:[(SiriLinkRRProvisionalLinkEntityPresent *)self entityPresent]];
    [v3 setObject:v5 forKeyedSubscript:@"entityPresent"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(SiriLinkRRProvisionalLinkEntityPresent *)self executionStage] - 1;
    if (v6 > 6) {
      CFStringRef v7 = @"LINK_EXECUTION_STAGE_UNKNOWN";
    }
    else {
      CFStringRef v7 = *(&off_14C68 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"executionStage"];
  }
  if (self->_linkEntityType)
  {
    v8 = [(SiriLinkRRProvisionalLinkEntityPresent *)self linkEntityType];
    id v9 = [v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"linkEntityType"];
  }
  if (self->_sourceBundleId)
  {
    v10 = [(SiriLinkRRProvisionalLinkEntityPresent *)self sourceBundleId];
    id v11 = [v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"sourceBundleId"];
  }
  [(SiriLinkRRProvisionalLinkEntityPresent *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceBundleId hash];
  NSUInteger v4 = [(NSString *)self->_linkEntityType hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_executionStage;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_entityPresent;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SiriLinkRRProvisionalLinkEntityPresent *)self sourceBundleId];
  uint64_t v6 = [v4 sourceBundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SiriLinkRRProvisionalLinkEntityPresent *)self sourceBundleId];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(SiriLinkRRProvisionalLinkEntityPresent *)self sourceBundleId];
    v10 = [v4 sourceBundleId];
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SiriLinkRRProvisionalLinkEntityPresent *)self linkEntityType];
  uint64_t v6 = [v4 linkEntityType];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SiriLinkRRProvisionalLinkEntityPresent *)self linkEntityType];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(SiriLinkRRProvisionalLinkEntityPresent *)self linkEntityType];
    v15 = [v4 linkEntityType];
    unsigned int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $E87377682638DF33EB3C0F1EF5C3CF44 has = self->_has;
  int v20 = v4[32];
  if ((v20 & 1) == (*(unsigned char *)&has & 1))
  {
    if (*(unsigned char *)&has)
    {
      int executionStage = self->_executionStage;
      if (executionStage != [v4 executionStage]) {
        goto LABEL_12;
      }
      $E87377682638DF33EB3C0F1EF5C3CF44 has = self->_has;
      int v20 = v4[32];
    }
    if (((v20 ^ *(_DWORD *)&has) & 2) == 0)
    {
      if ((*(unsigned char *)&has & 2) == 0
        || (int entityPresent = self->_entityPresent, entityPresent == [v4 entityPresent]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(SiriLinkRRProvisionalLinkEntityPresent *)self sourceBundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(SiriLinkRRProvisionalLinkEntityPresent *)self linkEntityType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkRRProvisionalLinkEntityPresentReadFrom(self, (uint64_t)a3);
}

- (void)setHasEntityPresent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntityPresent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEntityPresent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int entityPresent = a3;
}

- (void)setHasExecutionStage:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExecutionStage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExecutionStage:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int executionStage = a3;
}

- (BOOL)hasLinkEntityType
{
  return self->_linkEntityType != 0;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

@end