@interface ATXPBPredictionContext
- (ATXPBPredictionAmbientLightContext)ambientLightContext;
- (ATXPBPredictionDeviceStateContext)deviceStateContext;
- (ATXPBPredictionLocationMotionContext)locationMotionContext;
- (ATXPBPredictionTimeContext)timeContext;
- (ATXPBPredictionUserContext)userContext;
- (BOOL)hasAmbientLightContext;
- (BOOL)hasDeviceStateContext;
- (BOOL)hasIsOverridden;
- (BOOL)hasLocationMotionContext;
- (BOOL)hasTimeContext;
- (BOOL)hasUserContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOverridden;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmbientLightContext:(id)a3;
- (void)setDeviceStateContext:(id)a3;
- (void)setHasIsOverridden:(BOOL)a3;
- (void)setIsOverridden:(BOOL)a3;
- (void)setLocationMotionContext:(id)a3;
- (void)setTimeContext:(id)a3;
- (void)setUserContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionContext

- (void)setIsOverridden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isOverridden = a3;
}

- (void)setHasIsOverridden:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsOverridden
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDeviceStateContext
{
  return self->_deviceStateContext != 0;
}

- (BOOL)hasTimeContext
{
  return self->_timeContext != 0;
}

- (BOOL)hasLocationMotionContext
{
  return self->_locationMotionContext != 0;
}

- (BOOL)hasAmbientLightContext
{
  return self->_ambientLightContext != 0;
}

- (BOOL)hasUserContext
{
  return self->_userContext != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionContext;
  v4 = [(ATXPBPredictionContext *)&v8 description];
  v5 = [(ATXPBPredictionContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isOverridden];
    [v3 setObject:v4 forKey:@"isOverridden"];
  }
  deviceStateContext = self->_deviceStateContext;
  if (deviceStateContext)
  {
    v6 = [(ATXPBPredictionDeviceStateContext *)deviceStateContext dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"deviceStateContext"];
  }
  timeContext = self->_timeContext;
  if (timeContext)
  {
    objc_super v8 = [(ATXPBPredictionTimeContext *)timeContext dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"timeContext"];
  }
  locationMotionContext = self->_locationMotionContext;
  if (locationMotionContext)
  {
    v10 = [(ATXPBPredictionLocationMotionContext *)locationMotionContext dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"locationMotionContext"];
  }
  ambientLightContext = self->_ambientLightContext;
  if (ambientLightContext)
  {
    v12 = [(ATXPBPredictionAmbientLightContext *)ambientLightContext dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"ambientLightContext"];
  }
  userContext = self->_userContext;
  if (userContext)
  {
    v14 = [(ATXPBPredictionUserContext *)userContext dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"userContext"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_deviceStateContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_timeContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_locationMotionContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_ambientLightContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_isOverridden;
    v4[52] |= 1u;
  }
  id v5 = v4;
  if (self->_deviceStateContext)
  {
    objc_msgSend(v4, "setDeviceStateContext:");
    id v4 = v5;
  }
  if (self->_timeContext)
  {
    objc_msgSend(v5, "setTimeContext:");
    id v4 = v5;
  }
  if (self->_locationMotionContext)
  {
    objc_msgSend(v5, "setLocationMotionContext:");
    id v4 = v5;
  }
  if (self->_ambientLightContext)
  {
    objc_msgSend(v5, "setAmbientLightContext:");
    id v4 = v5;
  }
  if (self->_userContext)
  {
    objc_msgSend(v5, "setUserContext:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_isOverridden;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v7 = [(ATXPBPredictionDeviceStateContext *)self->_deviceStateContext copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(ATXPBPredictionTimeContext *)self->_timeContext copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(ATXPBPredictionLocationMotionContext *)self->_locationMotionContext copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(ATXPBPredictionAmbientLightContext *)self->_ambientLightContext copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  id v15 = [(ATXPBPredictionUserContext *)self->_userContext copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_isOverridden)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_10;
      }
    }
LABEL_20:
    char v10 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_20;
  }
LABEL_10:
  deviceStateContext = self->_deviceStateContext;
  if ((unint64_t)deviceStateContext | *((void *)v4 + 2)
    && !-[ATXPBPredictionDeviceStateContext isEqual:](deviceStateContext, "isEqual:"))
  {
    goto LABEL_20;
  }
  timeContext = self->_timeContext;
  if ((unint64_t)timeContext | *((void *)v4 + 4))
  {
    if (!-[ATXPBPredictionTimeContext isEqual:](timeContext, "isEqual:")) {
      goto LABEL_20;
    }
  }
  locationMotionContext = self->_locationMotionContext;
  if ((unint64_t)locationMotionContext | *((void *)v4 + 3))
  {
    if (!-[ATXPBPredictionLocationMotionContext isEqual:](locationMotionContext, "isEqual:")) {
      goto LABEL_20;
    }
  }
  ambientLightContext = self->_ambientLightContext;
  if ((unint64_t)ambientLightContext | *((void *)v4 + 1))
  {
    if (!-[ATXPBPredictionAmbientLightContext isEqual:](ambientLightContext, "isEqual:")) {
      goto LABEL_20;
    }
  }
  userContext = self->_userContext;
  if ((unint64_t)userContext | *((void *)v4 + 5)) {
    char v10 = -[ATXPBPredictionUserContext isEqual:](userContext, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isOverridden;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ATXPBPredictionDeviceStateContext *)self->_deviceStateContext hash] ^ v3;
  unint64_t v5 = [(ATXPBPredictionTimeContext *)self->_timeContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(ATXPBPredictionLocationMotionContext *)self->_locationMotionContext hash];
  unint64_t v7 = [(ATXPBPredictionAmbientLightContext *)self->_ambientLightContext hash];
  return v6 ^ v7 ^ [(ATXPBPredictionUserContext *)self->_userContext hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 52))
  {
    self->_isOverridden = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
  deviceStateContext = self->_deviceStateContext;
  uint64_t v7 = v5[2];
  v16 = v5;
  if (deviceStateContext)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ATXPBPredictionDeviceStateContext mergeFrom:](deviceStateContext, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ATXPBPredictionContext setDeviceStateContext:](self, "setDeviceStateContext:");
  }
  unint64_t v5 = v16;
LABEL_9:
  timeContext = self->_timeContext;
  uint64_t v9 = v5[4];
  if (timeContext)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ATXPBPredictionTimeContext mergeFrom:](timeContext, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ATXPBPredictionContext setTimeContext:](self, "setTimeContext:");
  }
  unint64_t v5 = v16;
LABEL_15:
  locationMotionContext = self->_locationMotionContext;
  uint64_t v11 = v5[3];
  if (locationMotionContext)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[ATXPBPredictionLocationMotionContext mergeFrom:](locationMotionContext, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[ATXPBPredictionContext setLocationMotionContext:](self, "setLocationMotionContext:");
  }
  unint64_t v5 = v16;
LABEL_21:
  ambientLightContext = self->_ambientLightContext;
  uint64_t v13 = v5[1];
  if (ambientLightContext)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[ATXPBPredictionAmbientLightContext mergeFrom:](ambientLightContext, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[ATXPBPredictionContext setAmbientLightContext:](self, "setAmbientLightContext:");
  }
  unint64_t v5 = v16;
LABEL_27:
  userContext = self->_userContext;
  uint64_t v15 = v5[5];
  if (userContext)
  {
    if (!v15) {
      goto LABEL_33;
    }
    userContext = (ATXPBPredictionUserContext *)-[ATXPBPredictionUserContext mergeFrom:](userContext, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    userContext = (ATXPBPredictionUserContext *)-[ATXPBPredictionContext setUserContext:](self, "setUserContext:");
  }
  unint64_t v5 = v16;
LABEL_33:
  MEMORY[0x1F41817F8](userContext, v5);
}

- (BOOL)isOverridden
{
  return self->_isOverridden;
}

- (ATXPBPredictionDeviceStateContext)deviceStateContext
{
  return self->_deviceStateContext;
}

- (void)setDeviceStateContext:(id)a3
{
}

- (ATXPBPredictionTimeContext)timeContext
{
  return self->_timeContext;
}

- (void)setTimeContext:(id)a3
{
}

- (ATXPBPredictionLocationMotionContext)locationMotionContext
{
  return self->_locationMotionContext;
}

- (void)setLocationMotionContext:(id)a3
{
}

- (ATXPBPredictionAmbientLightContext)ambientLightContext
{
  return self->_ambientLightContext;
}

- (void)setAmbientLightContext:(id)a3
{
}

- (ATXPBPredictionUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_timeContext, 0);
  objc_storeStrong((id *)&self->_locationMotionContext, 0);
  objc_storeStrong((id *)&self->_deviceStateContext, 0);
  objc_storeStrong((id *)&self->_ambientLightContext, 0);
}

@end