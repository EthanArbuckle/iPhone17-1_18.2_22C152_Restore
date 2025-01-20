@interface CAXPBContextualActionParameter
- (BOOL)hasParameterMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)parameterMetadata;
- (NSString)parameterType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setParameterMetadata:(id)a3;
- (void)setParameterType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAXPBContextualActionParameter

- (BOOL)hasParameterMetadata
{
  return self->_parameterMetadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAXPBContextualActionParameter;
  v4 = [(CAXPBContextualActionParameter *)&v8 description];
  v5 = [(CAXPBContextualActionParameter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  parameterType = self->_parameterType;
  if (parameterType) {
    [v3 setObject:parameterType forKey:@"parameterType"];
  }
  parameterMetadata = self->_parameterMetadata;
  if (parameterMetadata) {
    [v4 setObject:parameterMetadata forKey:@"parameterMetadata"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_parameterType) {
    -[CAXPBContextualActionParameter writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_parameterMetadata) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setParameterType:self->_parameterType];
  if (self->_parameterMetadata) {
    objc_msgSend(v4, "setParameterMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_parameterType copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_parameterMetadata copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((parameterType = self->_parameterType, !((unint64_t)parameterType | v4[2]))
     || -[NSString isEqual:](parameterType, "isEqual:")))
  {
    parameterMetadata = self->_parameterMetadata;
    if ((unint64_t)parameterMetadata | v4[1]) {
      char v7 = -[NSData isEqual:](parameterMetadata, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_parameterType hash];
  return [(NSData *)self->_parameterMetadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[CAXPBContextualActionParameter setParameterType:](self, "setParameterType:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[CAXPBContextualActionParameter setParameterMetadata:](self, "setParameterMetadata:");
    id v4 = v5;
  }
}

- (NSString)parameterType
{
  return self->_parameterType;
}

- (void)setParameterType:(id)a3
{
}

- (NSData)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void)setParameterMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterType, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CAXPBContextualActionParameter writeTo:]", "CAXPBContextualActionParameter.m", 82, "nil != self->_parameterType");
}

@end