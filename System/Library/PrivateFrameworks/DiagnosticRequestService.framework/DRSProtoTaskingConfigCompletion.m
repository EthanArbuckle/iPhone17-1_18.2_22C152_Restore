@interface DRSProtoTaskingConfigCompletion
- (BOOL)hasActiveDuration;
- (BOOL)hasCompletionDescription;
- (BOOL)hasCompletionType;
- (BOOL)hasTaskingConfigMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata;
- (NSString)completionDescription;
- (NSString)completionType;
- (NSString)description;
- (float)activeDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveDuration:(float)a3;
- (void)setCompletionDescription:(id)a3;
- (void)setCompletionType:(id)a3;
- (void)setHasActiveDuration:(BOOL)a3;
- (void)setTaskingConfigMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoTaskingConfigCompletion

- (BOOL)hasTaskingConfigMetadata
{
  return self->_taskingConfigMetadata != 0;
}

- (BOOL)hasCompletionType
{
  return self->_completionType != 0;
}

- (BOOL)hasCompletionDescription
{
  return self->_completionDescription != 0;
}

- (void)setActiveDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActiveDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingConfigCompletion;
  v4 = [(DRSProtoTaskingConfigCompletion *)&v8 description];
  v5 = [(DRSProtoTaskingConfigCompletion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if (taskingConfigMetadata)
  {
    v6 = [(DRSProtoTaskingConfigMetadata *)taskingConfigMetadata dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"tasking_config_metadata"];
  }
  completionType = self->_completionType;
  if (completionType) {
    [v3 setObject:completionType forKey:@"completion_type"];
  }
  completionDescription = self->_completionDescription;
  if (completionDescription) {
    [v3 setObject:completionDescription forKey:@"completion_description"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_activeDuration;
    v9 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"active_duration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigCompletionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_completionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_completionDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    objc_msgSend(v4, "setTaskingConfigMetadata:");
    id v4 = v5;
  }
  if (self->_completionType)
  {
    objc_msgSend(v5, "setCompletionType:");
    id v4 = v5;
  }
  if (self->_completionDescription)
  {
    objc_msgSend(v5, "setCompletionDescription:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_activeDuration);
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoTaskingConfigMetadata *)self->_taskingConfigMetadata copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_completionType copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_completionDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 8) = self->_activeDuration;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if ((unint64_t)taskingConfigMetadata | *((void *)v4 + 4))
  {
    if (!-[DRSProtoTaskingConfigMetadata isEqual:](taskingConfigMetadata, "isEqual:")) {
      goto LABEL_12;
    }
  }
  completionType = self->_completionType;
  if ((unint64_t)completionType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](completionType, "isEqual:")) {
      goto LABEL_12;
    }
  }
  completionDescription = self->_completionDescription;
  if ((unint64_t)completionDescription | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](completionDescription, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_activeDuration == *((float *)v4 + 2))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoTaskingConfigMetadata *)self->_taskingConfigMetadata hash];
  NSUInteger v4 = [(NSString *)self->_completionType hash];
  NSUInteger v5 = [(NSString *)self->_completionDescription hash];
  if (*(unsigned char *)&self->_has)
  {
    float activeDuration = self->_activeDuration;
    float v8 = -activeDuration;
    if (activeDuration >= 0.0) {
      float v8 = self->_activeDuration;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  taskingConfigMetadata = self->_taskingConfigMetadata;
  uint64_t v6 = *((void *)v4 + 4);
  id v7 = v4;
  if (taskingConfigMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingConfigMetadata mergeFrom:](taskingConfigMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingConfigCompletion setTaskingConfigMetadata:](self, "setTaskingConfigMetadata:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 3))
  {
    -[DRSProtoTaskingConfigCompletion setCompletionType:](self, "setCompletionType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[DRSProtoTaskingConfigCompletion setCompletionDescription:](self, "setCompletionDescription:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_float activeDuration = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata
{
  return self->_taskingConfigMetadata;
}

- (void)setTaskingConfigMetadata:(id)a3
{
}

- (NSString)completionType
{
  return self->_completionType;
}

- (void)setCompletionType:(id)a3
{
}

- (NSString)completionDescription
{
  return self->_completionDescription;
}

- (void)setCompletionDescription:(id)a3
{
}

- (float)activeDuration
{
  return self->_activeDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, 0);
  objc_storeStrong((id *)&self->_completionType, 0);

  objc_storeStrong((id *)&self->_completionDescription, 0);
}

@end