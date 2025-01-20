@interface PNRProvisionalSageFailureInfo
- (BOOL)hasError;
- (BOOL)hasFailureSubType;
- (BOOL)hasFailureType;
- (BOOL)hasUnderUnderlyingError;
- (BOOL)hasUnderlyingError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)failureSubType;
- (NSString)failureType;
- (PNRProvisionalSageErrorInfo)error;
- (PNRProvisionalSageErrorInfo)underUnderlyingError;
- (PNRProvisionalSageErrorInfo)underlyingError;
- (PNRProvisionalSageFailureInfo)initWithDictionary:(id)a3;
- (PNRProvisionalSageFailureInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteError;
- (void)deleteFailureSubType;
- (void)deleteFailureType;
- (void)deleteUnderUnderlyingError;
- (void)deleteUnderlyingError;
- (void)setError:(id)a3;
- (void)setFailureSubType:(id)a3;
- (void)setFailureType:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasFailureSubType:(BOOL)a3;
- (void)setHasFailureType:(BOOL)a3;
- (void)setHasUnderUnderlyingError:(BOOL)a3;
- (void)setHasUnderlyingError:(BOOL)a3;
- (void)setUnderUnderlyingError:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalSageFailureInfo

- (BOOL)hasFailureType
{
  return self->_failureType != 0;
}

- (void)deleteFailureType
{
}

- (BOOL)hasFailureSubType
{
  return self->_failureSubType != 0;
}

- (void)deleteFailureSubType
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (void)deleteUnderlyingError
{
}

- (BOOL)hasUnderUnderlyingError
{
  return self->_underUnderlyingError != 0;
}

- (void)deleteUnderUnderlyingError
{
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSageFailureInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  v4 = [(PNRProvisionalSageFailureInfo *)self failureType];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self failureSubType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PNRProvisionalSageFailureInfo *)self error];

  if (v6)
  {
    v7 = [(PNRProvisionalSageFailureInfo *)self error];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(PNRProvisionalSageFailureInfo *)self underlyingError];

  if (v8)
  {
    v9 = [(PNRProvisionalSageFailureInfo *)self underlyingError];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];

  if (v10)
  {
    v11 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self failureType];
  v6 = [v4 failureType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(PNRProvisionalSageFailureInfo *)self failureType];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PNRProvisionalSageFailureInfo *)self failureType];
    v10 = [v4 failureType];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self failureSubType];
  v6 = [v4 failureSubType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(PNRProvisionalSageFailureInfo *)self failureSubType];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PNRProvisionalSageFailureInfo *)self failureSubType];
    v15 = [v4 failureSubType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self error];
  v6 = [v4 error];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(PNRProvisionalSageFailureInfo *)self error];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PNRProvisionalSageFailureInfo *)self error];
    v20 = [v4 error];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self underlyingError];
  v6 = [v4 underlyingError];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(PNRProvisionalSageFailureInfo *)self underlyingError];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PNRProvisionalSageFailureInfo *)self underlyingError];
    v25 = [v4 underlyingError];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];
  v6 = [v4 underUnderlyingError];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];
    v30 = [v4 underUnderlyingError];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_failureType hash];
  NSUInteger v4 = [(NSString *)self->_failureSubType hash] ^ v3;
  unint64_t v5 = [(PNRProvisionalSageErrorInfo *)self->_error hash];
  unint64_t v6 = v4 ^ v5 ^ [(PNRProvisionalSageErrorInfo *)self->_underlyingError hash];
  return v6 ^ [(PNRProvisionalSageErrorInfo *)self->_underUnderlyingError hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_error)
  {
    NSUInteger v4 = [(PNRProvisionalSageFailureInfo *)self error];
    unint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"error"];
    }
    else
    {
      unint64_t v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"error"];
    }
  }
  if (self->_failureSubType)
  {
    uint64_t v7 = [(PNRProvisionalSageFailureInfo *)self failureSubType];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"failureSubType"];
  }
  if (self->_failureType)
  {
    v9 = [(PNRProvisionalSageFailureInfo *)self failureType];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"failureType"];
  }
  if (self->_underUnderlyingError)
  {
    int v11 = [(PNRProvisionalSageFailureInfo *)self underUnderlyingError];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"underUnderlyingError"];
    }
    else
    {
      v13 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v13 forKeyedSubscript:@"underUnderlyingError"];
    }
  }
  if (self->_underlyingError)
  {
    v14 = [(PNRProvisionalSageFailureInfo *)self underlyingError];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"underlyingError"];
    }
    else
    {
      int v16 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v16 forKeyedSubscript:@"underlyingError"];
    }
  }
  [(PNRProvisionalSageFailureInfo *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalSageFailureInfo *)self dictionaryRepresentation];
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

- (PNRProvisionalSageFailureInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  NSUInteger v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalSageFailureInfo *)self initWithDictionary:v4];
    unint64_t v5 = self;
  }

  return v5;
}

- (PNRProvisionalSageFailureInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PNRProvisionalSageFailureInfo;
  unint64_t v5 = [(PNRProvisionalSageFailureInfo *)&v18 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"failureType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNRProvisionalSageFailureInfo *)v5 setFailureType:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"failureSubType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PNRProvisionalSageFailureInfo *)v5 setFailureSubType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNRProvisionalSageErrorInfo alloc] initWithDictionary:v10];
      [(PNRProvisionalSageFailureInfo *)v5 setError:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"underlyingError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PNRProvisionalSageErrorInfo alloc] initWithDictionary:v12];
      [(PNRProvisionalSageFailureInfo *)v5 setUnderlyingError:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"underUnderlyingError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PNRProvisionalSageErrorInfo alloc] initWithDictionary:v14];
      [(PNRProvisionalSageFailureInfo *)v5 setUnderUnderlyingError:v15];
    }
    int v16 = v5;
  }
  return v5;
}

- (NSString)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(id)a3
{
}

- (NSString)failureSubType
{
  return self->_failureSubType;
}

- (void)setFailureSubType:(id)a3
{
}

- (PNRProvisionalSageErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (PNRProvisionalSageErrorInfo)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (PNRProvisionalSageErrorInfo)underUnderlyingError
{
  return self->_underUnderlyingError;
}

- (void)setUnderUnderlyingError:(id)a3
{
}

- (void)setHasFailureType:(BOOL)a3
{
  self->_hasFailureType = a3;
}

- (void)setHasFailureSubType:(BOOL)a3
{
  self->_hasFailureSubType = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  self->_hasUnderlyingError = a3;
}

- (void)setHasUnderUnderlyingError:(BOOL)a3
{
  self->_hasUnderUnderlyingError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underUnderlyingError, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failureSubType, 0);

  objc_storeStrong((id *)&self->_failureType, 0);
}

@end