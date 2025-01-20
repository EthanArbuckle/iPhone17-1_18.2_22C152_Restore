@interface SiriLinkFlowProvisionalLinkActionConversion
- (BOOL)hasIsSuccess;
- (BOOL)hasOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)outcome;
- (SiriLinkFlowProvisionalLinkActionConversion)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionConversion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasIsSuccess:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setOutcome:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionConversion

- (BOOL)hasOutcome
{
  return self->_outcome != 0;
}

- (void)setIsSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSuccess = a3;
}

- (BOOL)hasIsSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionConversionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = [(SiriLinkFlowProvisionalLinkActionConversion *)self outcome];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  id v5 = [(SiriLinkFlowProvisionalLinkActionConversion *)self outcome];
  v6 = [v4 outcome];
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SiriLinkFlowProvisionalLinkActionConversion *)self outcome];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SiriLinkFlowProvisionalLinkActionConversion *)self outcome];
    v11 = [v4 outcome];
    unsigned int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((v4[20] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isSuccess = self->_isSuccess;
    if (isSuccess != [v4 isSuccess]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_outcome hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isSuccess;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = +[NSNumber numberWithBool:[(SiriLinkFlowProvisionalLinkActionConversion *)self isSuccess]];
    [v3 setObject:v4 forKeyedSubscript:@"isSuccess"];
  }
  if (self->_outcome)
  {
    id v5 = [(SiriLinkFlowProvisionalLinkActionConversion *)self outcome];
    id v6 = [v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"outcome"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkFlowProvisionalLinkActionConversion *)self dictionaryRepresentation];
  if (+[NSJSONSerialization isValidJSONObject:v2])
  {
    NSUInteger v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return (NSData *)v3;
}

- (SiriLinkFlowProvisionalLinkActionConversion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(SiriLinkFlowProvisionalLinkActionConversion *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (SiriLinkFlowProvisionalLinkActionConversion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriLinkFlowProvisionalLinkActionConversion;
  id v5 = [(SiriLinkFlowProvisionalLinkActionConversion *)&v11 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"outcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(SiriLinkFlowProvisionalLinkActionConversion *)v5 setOutcome:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"isSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SiriLinkFlowProvisionalLinkActionConversion setIsSuccess:](v5, "setIsSuccess:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setHasOutcome:(BOOL)a3
{
  self->_hasOutcome = a3;
}

- (void).cxx_destruct
{
}

@end