@interface PNRProvisionalSagePnRWrapper
- (BOOL)hasSagePnR;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProvisional;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRProvisionalSagePnREvent)sagePnR;
- (PNRProvisionalSagePnRWrapper)initWithDictionary:(id)a3;
- (PNRProvisionalSagePnRWrapper)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)getTypeId;
- (id)getVersion;
- (id)qualifiedMessageName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEventtype;
- (void)deleteSagePnR;
- (void)setHasSagePnR:(BOOL)a3;
- (void)setSagePnR:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalSagePnRWrapper

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return @"com.apple.aiml.pnr.SagePnRWrapper";
}

- (id)getVersion
{
  return &unk_2703F7C88;
}

- (id)qualifiedMessageName
{
  if ([(PNRProvisionalSagePnRWrapper *)self whichEventtype] == 101) {
    return @"com.apple.aiml.pnr.ProvisionalSagePnRWrapper.ProvisionalSagePnREvent";
  }
  else {
    return @"com.apple.aiml.pnr.ProvisionalSagePnRWrapper";
  }
}

- (void)setSagePnR:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_whichEventtype = v3;
  objc_storeStrong((id *)&self->_sagePnR, a3);
}

- (PNRProvisionalSagePnREvent)sagePnR
{
  if (self->_whichEventtype == 101) {
    v2 = self->_sagePnR;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)deleteSagePnR
{
  if (self->_whichEventtype == 101)
  {
    self->_whichEventtype = 0;
    self->_sagePnR = 0;
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalSagePnRWrapperReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  v4 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];

  if (v4)
  {
    v5 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichEventtype = self->_whichEventtype;
    if (whichEventtype == [v4 whichEventtype])
    {
      id v6 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];
      v7 = [v4 sagePnR];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];
        v12 = [v4 sagePnR];
        char v13 = [v11 isEqual:v12];

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

- (unint64_t)hash
{
  return [(PNRProvisionalSagePnREvent *)self->_sagePnR hash];
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_sagePnR)
  {
    id v4 = [(PNRProvisionalSagePnRWrapper *)self sagePnR];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"sagePnR"];
    }
    else
    {
      id v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"sagePnR"];
    }
  }
  [(PNRProvisionalSagePnRWrapper *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalSagePnRWrapper *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalSagePnRWrapper)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalSagePnRWrapper *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalSagePnRWrapper)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PNRProvisionalSagePnRWrapper;
  v5 = [(PNRProvisionalSagePnRWrapper *)&v10 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"sagePnR"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[PNRProvisionalSagePnREvent alloc] initWithDictionary:v6];
      [(PNRProvisionalSagePnRWrapper *)v5 setSagePnR:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (unint64_t)whichEventtype
{
  return self->_whichEventtype;
}

- (BOOL)hasSagePnR
{
  return self->_hasSagePnR;
}

- (void)setHasSagePnR:(BOOL)a3
{
  self->_hasSagePnR = a3;
}

- (void).cxx_destruct
{
}

@end