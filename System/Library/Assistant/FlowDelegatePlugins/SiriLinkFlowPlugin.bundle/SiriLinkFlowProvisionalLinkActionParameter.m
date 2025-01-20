@interface SiriLinkFlowProvisionalLinkActionParameter
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)name;
- (SiriLinkFlowProvisionalLinkActionParameter)initWithDictionary:(id)a3;
- (SiriLinkFlowProvisionalLinkActionParameter)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SiriLinkFlowProvisionalLinkActionParameter

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)readFrom:(id)a3
{
  return SiriLinkFlowProvisionalLinkActionParameterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = [(SiriLinkFlowProvisionalLinkActionParameter *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(SiriLinkFlowProvisionalLinkActionParameter *)self name];
    v6 = [v4 name];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SiriLinkFlowProvisionalLinkActionParameter *)self name];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(SiriLinkFlowProvisionalLinkActionParameter *)self name];
      v11 = [v4 name];
      unsigned __int8 v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (self->_name)
  {
    id v4 = [(SiriLinkFlowProvisionalLinkActionParameter *)self name];
    id v5 = [v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }

  return v3;
}

- (NSData)jsonData
{
  v2 = [(SiriLinkFlowProvisionalLinkActionParameter *)self dictionaryRepresentation];
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

- (SiriLinkFlowProvisionalLinkActionParameter)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(SiriLinkFlowProvisionalLinkActionParameter *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (SiriLinkFlowProvisionalLinkActionParameter)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriLinkFlowProvisionalLinkActionParameter;
  id v5 = [(SiriLinkFlowProvisionalLinkActionParameter *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(SiriLinkFlowProvisionalLinkActionParameter *)v5 setName:v7];
    }
    uint64_t v8 = v5;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void).cxx_destruct
{
}

@end