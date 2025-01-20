@interface _CPCounterfactualInfo
- (BOOL)cfDiffered;
- (BOOL)cfUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (int)cfError;
- (unint64_t)hash;
- (void)setCfDiffered:(BOOL)a3;
- (void)setCfError:(int)a3;
- (void)setCfUsed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCounterfactualInfo

- (void)setCfError:(int)a3
{
  self->_cfError = a3;
}

- (int)cfError
{
  return self->_cfError;
}

- (void)setCfUsed:(BOOL)a3
{
  self->_cfUsed = a3;
}

- (BOOL)cfUsed
{
  return self->_cfUsed;
}

- (void)setCfDiffered:(BOOL)a3
{
  self->_cfDiffered = a3;
}

- (BOOL)cfDiffered
{
  return self->_cfDiffered;
}

- (unint64_t)hash
{
  return (2654435761 * self->_cfUsed) ^ (2654435761 * self->_cfDiffered) ^ (2654435761 * self->_cfError);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int cfDiffered = self->_cfDiffered, cfDiffered == [v4 cfDiffered])
    && (int cfUsed = self->_cfUsed, cfUsed == [v4 cfUsed]))
  {
    int cfError = self->_cfError;
    BOOL v8 = cfError == [v4 cfError];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPCounterfactualInfo *)self cfDiffered]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPCounterfactualInfo *)self cfUsed]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPCounterfactualInfo *)self cfError]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPCounterfactualInfoReadFrom(self, (uint64_t)a3);
}

@end