@interface VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithDictionary:(id)a3;
- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo

- (BOOL)readFrom:(id)a3
{
  return VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  v2 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)self dictionaryRepresentation];
  if (+[NSJSONSerialization isValidJSONObject:v2])
  {
    id v3 = +[NSJSONSerialization dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unsigned __int8 v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo;
  id v3 = [(VoiceCmdsSchemaProvisionalVoiceCmdsWaitForRequestContextInfo *)&v7 init];
  unsigned __int8 v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end