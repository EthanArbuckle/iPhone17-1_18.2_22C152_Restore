@interface BMPBUserFocusComputedModeEvent
- (BOOL)hasMode;
- (BOOL)hasModeSemanticType;
- (BOOL)hasModeUpdateReason;
- (BOOL)hasModeUpdateSource;
- (BOOL)hasSemanticModeIdentifier;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (NSString)mode;
- (NSString)semanticModeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeSemanticTypeAsString:(int)a3;
- (id)modeUpdateReasonAsString:(int)a3;
- (id)modeUpdateSourceAsString:(int)a3;
- (int)StringAsModeSemanticType:(id)a3;
- (int)StringAsModeUpdateReason:(id)a3;
- (int)StringAsModeUpdateSource:(id)a3;
- (int)modeSemanticType;
- (int)modeUpdateReason;
- (int)modeUpdateSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasModeSemanticType:(BOOL)a3;
- (void)setHasModeUpdateReason:(BOOL)a3;
- (void)setHasModeUpdateSource:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setMode:(id)a3;
- (void)setModeSemanticType:(int)a3;
- (void)setModeUpdateReason:(int)a3;
- (void)setModeUpdateSource:(int)a3;
- (void)setSemanticModeIdentifier:(id)a3;
- (void)setStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserFocusComputedModeEvent

- (BOOL)hasMode
{
  return self->_mode != 0;
}

- (void)setStarting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStarting
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)modeUpdateReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_modeUpdateReason;
  }
  else {
    return 0;
  }
}

- (void)setModeUpdateReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_modeUpdateReason = a3;
}

- (void)setHasModeUpdateReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModeUpdateReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)modeUpdateReasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8128[a3];
  }

  return v3;
}

- (int)StringAsModeUpdateReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UserAction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Scheduled"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Automation"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)modeSemanticType
{
  if (*(unsigned char *)&self->_has) {
    return self->_modeSemanticType;
  }
  else {
    return 0;
  }
}

- (void)setModeSemanticType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modeSemanticType = a3;
}

- (void)setHasModeSemanticType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModeSemanticType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)modeSemanticTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55D8148[a3];
  }

  return v3;
}

- (int)StringAsModeSemanticType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Custom"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Sleep"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Exercise"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PersonalTime"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Reading"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Gaming"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Mindfulness"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)modeUpdateSource
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_modeUpdateSource;
  }
  else {
    return 0;
  }
}

- (void)setModeUpdateSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modeUpdateSource = a3;
}

- (void)setHasModeUpdateSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeUpdateSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)modeUpdateSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8198[a3];
  }

  return v3;
}

- (int)StringAsModeUpdateSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Local"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Cloud"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Paired"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSemanticModeIdentifier
{
  return self->_semanticModeIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserFocusComputedModeEvent;
  int v4 = [(BMPBUserFocusComputedModeEvent *)&v8 description];
  v5 = [(BMPBUserFocusComputedModeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  mode = self->_mode;
  if (mode) {
    [v3 setObject:mode forKey:@"mode"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_starting];
    [v4 setObject:v7 forKey:@"starting"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t modeUpdateReason = self->_modeUpdateReason;
  if (modeUpdateReason >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeUpdateReason);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E55D8128[modeUpdateReason];
  }
  [v4 setObject:v9 forKey:@"modeUpdateReason"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t modeSemanticType = self->_modeSemanticType;
  if (modeSemanticType >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeSemanticType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E55D8148[modeSemanticType];
  }
  [v4 setObject:v11 forKey:@"modeSemanticType"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_17:
    uint64_t modeUpdateSource = self->_modeUpdateSource;
    if (modeUpdateSource >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeUpdateSource);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E55D8198[modeUpdateSource];
    }
    [v4 setObject:v13 forKey:@"modeUpdateSource"];
  }
LABEL_21:
  semanticModeIdentifier = self->_semanticModeIdentifier;
  if (semanticModeIdentifier) {
    [v4 setObject:semanticModeIdentifier forKey:@"semanticModeIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserFocusComputedModeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_mode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_semanticModeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_mode)
  {
    objc_msgSend(v4, "setMode:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_starting;
    *((unsigned char *)v4 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 5) = self->_modeUpdateReason;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_modeSemanticType;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 6) = self->_modeUpdateSource;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_8:
  if (self->_semanticModeIdentifier)
  {
    objc_msgSend(v6, "setSemanticModeIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mode copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_starting;
    *(unsigned char *)(v5 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 16) = self->_modeSemanticType;
      *(unsigned char *)(v5 + 44) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_modeUpdateReason;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_modeUpdateSource;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_semanticModeIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  mode = self->_mode;
  if ((unint64_t)mode | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](mode, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) != 0)
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_29;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
LABEL_29:
    char v7 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 44) & 8) != 0) {
    goto LABEL_29;
  }
LABEL_12:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_modeUpdateReason != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_modeSemanticType != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_modeUpdateSource != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  semanticModeIdentifier = self->_semanticModeIdentifier;
  if ((unint64_t)semanticModeIdentifier | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](semanticModeIdentifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mode hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_starting;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_modeUpdateReason;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_semanticModeIdentifier hash];
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_modeSemanticType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_modeUpdateSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_semanticModeIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[BMPBUserFocusComputedModeEvent setMode:](self, "setMode:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_starting = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_uint64_t modeUpdateReason = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_uint64_t modeSemanticType = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_7:
    self->_uint64_t modeUpdateSource = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((void *)v4 + 4))
  {
    -[BMPBUserFocusComputedModeEvent setSemanticModeIdentifier:](self, "setSemanticModeIdentifier:");
    id v4 = v6;
  }
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (void)setSemanticModeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);

  objc_storeStrong((id *)&self->_mode, 0);
}

@end