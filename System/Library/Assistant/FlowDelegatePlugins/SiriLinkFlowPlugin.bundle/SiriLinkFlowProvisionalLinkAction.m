@interface SiriLinkFlowProvisionalLinkAction
- (BOOL)hasIdentifier;
- (BOOL)hasPresentationStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)parameters;
- (NSData)jsonData;
- (NSString)identifier;
- (SiriLinkFlowProvisionalLinkAction)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkAction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (int)presentationStyle;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (void)addParameters:(id)a3;
- (void)clearParameters;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasPresentationStyle:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPresentationStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkAction

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setPresentationStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_presentationStyle = a3;
}

- (BOOL)hasPresentationStyle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPresentationStyle:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)clearParameters
{
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = +[NSMutableArray array];
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSArray *)parameters addObject:v4];
}

- (unint64_t)parametersCount
{
  return [(NSArray *)self->_parameters count];
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameters objectAtIndexedSubscript:a3];
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = [(SiriLinkFlowProvisionalLinkAction *)self identifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_parameters;
  v7 = (char *)[(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SiriLinkFlowProvisionalLinkAction *)self identifier];
  v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SiriLinkFlowProvisionalLinkAction *)self identifier];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(SiriLinkFlowProvisionalLinkAction *)self identifier];
    v10 = [v4 identifier];
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((v4[32] & 1) != (*(unsigned char *)&self->_has & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int presentationStyle = self->_presentationStyle;
    if (presentationStyle != [v4 presentationStyle]) {
      goto LABEL_15;
    }
  }
  v5 = [(SiriLinkFlowProvisionalLinkAction *)self parameters];
  v6 = [v4 parameters];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SiriLinkFlowProvisionalLinkAction *)self parameters];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    long long v14 = (void *)v13;
    v15 = [(SiriLinkFlowProvisionalLinkAction *)self parameters];
    v16 = [v4 parameters];
    unsigned __int8 v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_presentationStyle;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ (unint64_t)[(NSArray *)self->_parameters hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  if (self->_identifier)
  {
    uint64_t v4 = [(SiriLinkFlowProvisionalLinkAction *)self identifier];
    id v5 = [v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  if ([(NSArray *)self->_parameters count])
  {
    v6 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = self->_parameters;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = +[NSNull null];
            [v6 addObject:v13];
          }
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"parameters"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v14 = [(SiriLinkFlowProvisionalLinkAction *)self presentationStyle];
    if (v14 >= 4)
    {
      v15 = +[NSString stringWithFormat:@"(unknown: %i)", v14];
    }
    else
    {
      v15 = off_2814A0[(int)v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"presentationStyle"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkFlowProvisionalLinkAction *)self dictionaryRepresentation];
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

- (SiriLinkFlowProvisionalLinkAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(SiriLinkFlowProvisionalLinkAction *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (SiriLinkFlowProvisionalLinkAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SiriLinkFlowProvisionalLinkAction;
  id v5 = [(SiriLinkFlowProvisionalLinkAction *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(SiriLinkFlowProvisionalLinkAction *)v5 setIdentifier:v7];
    }
    id v8 = [v4 objectForKeyedSubscript:@"presentationStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SiriLinkFlowProvisionalLinkAction setPresentationStyle:](v5, "setPresentationStyle:", [v8 intValue]);
    }
    id v9 = [v4 objectForKeyedSubscript:@"parameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = v8;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[SiriLinkFlowProvisionalLinkActionParameter alloc] initWithDictionary:v15];
              [(SiriLinkFlowProvisionalLinkAction *)v5 addParameters:v16];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      id v8 = v19;
    }
    long long v17 = v5;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_hasIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end