@interface SiriLinkFlowProvisionalLinkActionCompletion
- (BOOL)hasAction;
- (BOOL)hasErrorDescription;
- (BOOL)hasIsSuccess;
- (BOOL)hasTargetBundle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDescription;
- (NSString)targetBundle;
- (SiriLinkFlowProvisionalLinkAction)action;
- (SiriLinkFlowProvisionalLinkActionCompletion)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionCompletion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAction:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasErrorDescription:(BOOL)a3;
- (void)setHasIsSuccess:(BOOL)a3;
- (void)setHasTargetBundle:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
- (void)setTargetBundle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionCompletion

- (BOOL)hasTargetBundle
{
  return self->_targetBundle != 0;
}

- (BOOL)hasAction
{
  return self->_action != 0;
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

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionCompletionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  v4 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self targetBundle];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];

  if (v5)
  {
    v6 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v7 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self errorDescription];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  v5 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self targetBundle];
  v6 = [v4 targetBundle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self targetBundle];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self targetBundle];
    v10 = [v4 targetBundle];
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v5 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];
  v6 = [v4 action];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];
    v15 = [v4 action];
    unsigned int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((v4[40] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isSuccess = self->_isSuccess;
    if (isSuccess != [v4 isSuccess]) {
      goto LABEL_20;
    }
  }
  v5 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self errorDescription];
  v6 = [v4 errorDescription];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self errorDescription];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self errorDescription];
    v21 = [v4 errorDescription];
    unsigned __int8 v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_targetBundle hash];
  unint64_t v4 = [(SiriLinkFlowProvisionalLinkAction *)self->_action hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isSuccess;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_errorDescription hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  if (self->_action)
  {
    unint64_t v4 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self action];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"action"];
    }
    else
    {
      v6 = +[NSNull null];
      [v3 setObject:v6 forKeyedSubscript:@"action"];
    }
  }
  if (self->_errorDescription)
  {
    uint64_t v7 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self errorDescription];
    id v8 = [v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"errorDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v9 = +[NSNumber numberWithBool:[(SiriLinkFlowProvisionalLinkActionCompletion *)self isSuccess]];
    [v3 setObject:v9 forKeyedSubscript:@"isSuccess"];
  }
  if (self->_targetBundle)
  {
    v10 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self targetBundle];
    id v11 = [v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"targetBundle"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkFlowProvisionalLinkActionCompletion *)self dictionaryRepresentation];
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

- (SiriLinkFlowProvisionalLinkActionCompletion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(SiriLinkFlowProvisionalLinkActionCompletion *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (SiriLinkFlowProvisionalLinkActionCompletion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriLinkFlowProvisionalLinkActionCompletion;
  uint64_t v5 = [(SiriLinkFlowProvisionalLinkActionCompletion *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"targetBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(SiriLinkFlowProvisionalLinkActionCompletion *)v5 setTargetBundle:v7];
    }
    id v8 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [[SiriLinkFlowProvisionalLinkAction alloc] initWithDictionary:v8];
      [(SiriLinkFlowProvisionalLinkActionCompletion *)v5 setAction:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SiriLinkFlowProvisionalLinkActionCompletion setIsSuccess:](v5, "setIsSuccess:", [v10 BOOLValue]);
    }
    id v11 = [v4 objectForKeyedSubscript:@"errorDescription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 copy];
      [(SiriLinkFlowProvisionalLinkActionCompletion *)v5 setErrorDescription:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (NSString)targetBundle
{
  return self->_targetBundle;
}

- (void)setTargetBundle:(id)a3
{
}

- (SiriLinkFlowProvisionalLinkAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (void)setHasTargetBundle:(BOOL)a3
{
  self->_hasTargetBundle = a3;
}

- (void)setHasAction:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void)setHasErrorDescription:(BOOL)a3
{
  self->_hasErrorDescription = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_targetBundle, 0);
}

@end