@interface ATXPBPredictionAmbientLightContext
- (BOOL)hasAmbientLightType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)ambientLightTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAmbientLightType:(id)a3;
- (int)ambientLightType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmbientLightType:(int)a3;
- (void)setHasAmbientLightType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionAmbientLightContext

- (void)setAmbientLightType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ambientLightType = a3;
}

- (void)setHasAmbientLightType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmbientLightType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)ambientLightTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68ADBC0[a3];
  }
  return v3;
}

- (int)StringAsAmbientLightType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeDark"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorDark"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoorDark"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorArtificialLight"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorBrightArtificialLight"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoor"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoorDirectSun"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeUnknown"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionAmbientLightContext;
  int v4 = [(ATXPBPredictionAmbientLightContext *)&v8 description];
  v5 = [(ATXPBPredictionAmbientLightContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t ambientLightType = self->_ambientLightType;
    if (ambientLightType >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ambientLightType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68ADBC0[ambientLightType];
    }
    [v3 setObject:v5 forKey:@"ambientLightType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionAmbientLightContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_ambientLightType;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_ambientLightType;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_ambientLightType == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_ambientLightType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t ambientLightType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)ambientLightType
{
  return self->_ambientLightType;
}

@end