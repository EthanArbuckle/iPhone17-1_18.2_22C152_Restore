@interface GEOSpokenGuidanceFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasShortPrompt;
- (BOOL)hasSpokenGuidanceIndex;
- (BOOL)hasTrafficCameraGuidanceFeedback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shortPrompt;
- (GEOSpokenGuidanceFeedback)initWithDictionary:(id)a3;
- (GEOSpokenGuidanceFeedback)initWithJSON:(id)a3;
- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)spokenGuidanceIndex;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShortPrompt:(BOOL)a3;
- (void)setHasSpokenGuidanceIndex:(BOOL)a3;
- (void)setShortPrompt:(BOOL)a3;
- (void)setSpokenGuidanceIndex:(int)a3;
- (void)setTrafficCameraGuidanceFeedback:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSpokenGuidanceFeedback

- (int)spokenGuidanceIndex
{
  if (*(unsigned char *)&self->_flags) {
    return self->_spokenGuidanceIndex;
  }
  else {
    return -1;
  }
}

- (void)setSpokenGuidanceIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_spokenGuidanceIndex = a3;
}

- (void)setHasSpokenGuidanceIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSpokenGuidanceIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)shortPrompt
{
  return self->_shortPrompt;
}

- (void)setShortPrompt:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_shortPrompt = a3;
}

- (void)setHasShortPrompt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasShortPrompt
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasTrafficCameraGuidanceFeedback
{
  return self->_trafficCameraGuidanceFeedback != 0;
}

- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback
{
  return self->_trafficCameraGuidanceFeedback;
}

- (void)setTrafficCameraGuidanceFeedback:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSpokenGuidanceFeedback;
  v4 = [(GEOSpokenGuidanceFeedback *)&v8 description];
  v5 = [(GEOSpokenGuidanceFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpokenGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v7 = @"spokenGuidanceIndex";
      }
      else {
        v7 = @"spoken_guidance_index";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      if (a2) {
        v9 = @"shortPrompt";
      }
      else {
        v9 = @"short_prompt";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 trafficCameraGuidanceFeedback];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"trafficCameraGuidanceFeedback";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"traffic_camera_guidance_feedback";
      }
      [v4 setObject:v12 forKey:v13];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSpokenGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSpokenGuidanceFeedback)initWithDictionary:(id)a3
{
  return (GEOSpokenGuidanceFeedback *)-[GEOSpokenGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"spokenGuidanceIndex";
      }
      else {
        v6 = @"spoken_guidance_index";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSpokenGuidanceIndex:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"shortPrompt";
      }
      else {
        objc_super v8 = @"short_prompt";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShortPrompt:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"trafficCameraGuidanceFeedback";
      }
      else {
        v10 = @"traffic_camera_guidance_feedback";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOTrafficCameraInformation alloc];
        if (a3) {
          uint64_t v13 = [(GEOTrafficCameraInformation *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOTrafficCameraInformation *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setTrafficCameraGuidanceFeedback:v13];
      }
    }
  }

  return a1;
}

- (GEOSpokenGuidanceFeedback)initWithJSON:(id)a3
{
  return (GEOSpokenGuidanceFeedback *)-[GEOSpokenGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpokenGuidanceFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpokenGuidanceFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOSpokenGuidanceFeedback *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_spokenGuidanceIndex;
    *((unsigned char *)v6 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v6 + 20) = self->_shortPrompt;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    objc_msgSend(v6, "setTrafficCameraGuidanceFeedback:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_spokenGuidanceIndex;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_shortPrompt;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  id v8 = [(GEOTrafficCameraInformation *)self->_trafficCameraGuidanceFeedback copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOSpokenGuidanceFeedback *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_spokenGuidanceIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 24) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_shortPrompt)
  {
    if (!*((unsigned char *)v4 + 20)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 20)) {
    goto LABEL_11;
  }
LABEL_17:
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  if ((unint64_t)trafficCameraGuidanceFeedback | *((void *)v4 + 1)) {
    char v5 = -[GEOTrafficCameraInformation isEqual:](trafficCameraGuidanceFeedback, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOSpokenGuidanceFeedback *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_spokenGuidanceIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(GEOTrafficCameraInformation *)self->_trafficCameraGuidanceFeedback hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_shortPrompt;
  return v4 ^ v3 ^ [(GEOTrafficCameraInformation *)self->_trafficCameraGuidanceFeedback hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 24);
  if (v5)
  {
    self->_spokenGuidanceIndex = *((_DWORD *)v8 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_shortPrompt = *((unsigned char *)v8 + 20);
    *(unsigned char *)&self->_flags |= 2u;
  }
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  uint64_t v7 = *((void *)v8 + 1);
  if (trafficCameraGuidanceFeedback)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOTrafficCameraInformation mergeFrom:](trafficCameraGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOSpokenGuidanceFeedback setTrafficCameraGuidanceFeedback:](self, "setTrafficCameraGuidanceFeedback:");
  }
  uint64_t v4 = v8;
LABEL_11:
}

- (void).cxx_destruct
{
}

@end