@interface PNRProvisionalSageErrorInfo
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (PNRProvisionalSageErrorInfo)initWithDictionary:(id)a3;
- (PNRProvisionalSageErrorInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalSageErrorInfo

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)deleteErrorDomain
{
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSageErrorInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  v4 = [(PNRProvisionalSageErrorInfo *)self errorDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  id v5 = [(PNRProvisionalSageErrorInfo *)self errorDomain];
  v6 = [v4 errorDomain];
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PNRProvisionalSageErrorInfo *)self errorDomain];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PNRProvisionalSageErrorInfo *)self errorDomain];
    v11 = [v4 errorDomain];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRProvisionalSageErrorInfo errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    id v5 = [(PNRProvisionalSageErrorInfo *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  [(PNRProvisionalSageErrorInfo *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalSageErrorInfo *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    NSUInteger v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSageErrorInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalSageErrorInfo *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (PNRProvisionalSageErrorInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PNRProvisionalSageErrorInfo;
  id v5 = [(PNRProvisionalSageErrorInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNRProvisionalSageErrorInfo *)v5 setErrorDomain:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalSageErrorInfo setErrorCode:](v5, "setErrorCode:", [v8 longLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
}

@end