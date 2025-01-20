@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo
- (BOOL)hasClockSeconds;
- (BOOL)hasShortcutName;
- (BOOL)hasWfRunnerEventName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)shortcutName;
- (NSString)wfRunnerEventName;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithJSON:(id)a3;
- (float)clockSeconds;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteClockSeconds;
- (void)deleteShortcutName;
- (void)deleteWfRunnerEventName;
- (void)setClockSeconds:(float)a3;
- (void)setHasClockSeconds:(BOOL)a3;
- (void)setHasShortcutName:(BOOL)a3;
- (void)setHasWfRunnerEventName:(BOOL)a3;
- (void)setShortcutName:(id)a3;
- (void)setWfRunnerEventName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo

- (BOOL)hasShortcutName
{
  return self->_shortcutName != 0;
}

- (void)deleteShortcutName
{
}

- (void)setClockSeconds:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clockSeconds = a3;
}

- (BOOL)hasClockSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasClockSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteClockSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (BOOL)hasWfRunnerEventName
{
  return self->_wfRunnerEventName != 0;
}

- (void)deleteWfRunnerEventName
{
}

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  v4 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self shortcutName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
  v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self wfRunnerEventName];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self shortcutName];
  v6 = [v4 shortcutName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self shortcutName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self shortcutName];
    v10 = [v4 shortcutName];
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    float clockSeconds = self->_clockSeconds;
    [v4 clockSeconds];
    if (clockSeconds != v13) {
      goto LABEL_15;
    }
  }
  v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self wfRunnerEventName];
  v6 = [v4 wfRunnerEventName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self wfRunnerEventName];
    if (!v14)
    {

LABEL_18:
      BOOL v19 = 1;
      goto LABEL_16;
    }
    v15 = (void *)v14;
    v16 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self wfRunnerEventName];
    v17 = [v4 wfRunnerEventName];
    unsigned __int8 v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v19 = 0;
LABEL_16:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_shortcutName hash];
  if (*(unsigned char *)&self->_has)
  {
    float clockSeconds = self->_clockSeconds;
    double v6 = clockSeconds;
    if (clockSeconds < 0.0) {
      double v6 = -clockSeconds;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_wfRunnerEventName hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self clockSeconds];
    unint64_t v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v3 setObject:v4 forKeyedSubscript:@"clockSeconds"];
  }
  if (self->_shortcutName)
  {
    v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self shortcutName];
    id v6 = [v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"shortcutName"];
  }
  if (self->_wfRunnerEventName)
  {
    long double v7 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self wfRunnerEventName];
    id v8 = [v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"wfRunnerEventName"];
  }
  [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self dictionaryRepresentation];
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

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo;
  v5 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)&v13 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"shortcutName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 copy];
      [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)v5 setShortcutName:v7];
    }
    id v8 = [v4 objectForKeyedSubscript:@"clockSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo setClockSeconds:](v5, "setClockSeconds:");
    }
    v9 = [v4 objectForKeyedSubscript:@"wfRunnerEventName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 copy];
      [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestRemovalInfo *)v5 setWfRunnerEventName:v10];
    }
    unsigned int v11 = v5;
  }
  return v5;
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (void)setShortcutName:(id)a3
{
}

- (float)clockSeconds
{
  return self->_clockSeconds;
}

- (NSString)wfRunnerEventName
{
  return self->_wfRunnerEventName;
}

- (void)setWfRunnerEventName:(id)a3
{
}

- (void)setHasShortcutName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasWfRunnerEventName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wfRunnerEventName, 0);

  objc_storeStrong((id *)&self->_shortcutName, 0);
}

@end