@interface GEOLogMsgStateSummaryLookAroundLog
+ (BOOL)isValid:(id)a3;
- (BOOL)hadMoveActions;
- (BOOL)hadPanActions;
- (BOOL)hadPoiTapActions;
- (BOOL)hadShareActions;
- (BOOL)hadZoomActions;
- (BOOL)hasDurationSec;
- (BOOL)hasHadMoveActions;
- (BOOL)hasHadPanActions;
- (BOOL)hasHadPoiTapActions;
- (BOOL)hasHadShareActions;
- (BOOL)hasHadZoomActions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateSummaryLookAroundLog)initWithDictionary:(id)a3;
- (GEOLogMsgStateSummaryLookAroundLog)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)durationSec;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationSec:(unsigned int)a3;
- (void)setHadMoveActions:(BOOL)a3;
- (void)setHadPanActions:(BOOL)a3;
- (void)setHadPoiTapActions:(BOOL)a3;
- (void)setHadShareActions:(BOOL)a3;
- (void)setHadZoomActions:(BOOL)a3;
- (void)setHasDurationSec:(BOOL)a3;
- (void)setHasHadMoveActions:(BOOL)a3;
- (void)setHasHadPanActions:(BOOL)a3;
- (void)setHasHadPoiTapActions:(BOOL)a3;
- (void)setHasHadShareActions:(BOOL)a3;
- (void)setHasHadZoomActions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateSummaryLookAroundLog

- (unsigned)durationSec
{
  return self->_durationSec;
}

- (void)setDurationSec:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDurationSec
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hadPanActions
{
  return self->_hadPanActions;
}

- (void)setHadPanActions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_hadPanActions = a3;
}

- (void)setHasHadPanActions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHadPanActions
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hadZoomActions
{
  return self->_hadZoomActions;
}

- (void)setHadZoomActions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_hadZoomActions = a3;
}

- (void)setHasHadZoomActions:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasHadZoomActions
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)hadMoveActions
{
  return self->_hadMoveActions;
}

- (void)setHadMoveActions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_hadMoveActions = a3;
}

- (void)setHasHadMoveActions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHadMoveActions
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hadPoiTapActions
{
  return self->_hadPoiTapActions;
}

- (void)setHadPoiTapActions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_hadPoiTapActions = a3;
}

- (void)setHasHadPoiTapActions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHadPoiTapActions
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hadShareActions
{
  return self->_hadShareActions;
}

- (void)setHadShareActions:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_hadShareActions = a3;
}

- (void)setHasHadShareActions:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasHadShareActions
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateSummaryLookAroundLog;
  v4 = [(GEOLogMsgStateSummaryLookAroundLog *)&v8 description];
  v5 = [(GEOLogMsgStateSummaryLookAroundLog *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateSummaryLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_33;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if (v5)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
    if (a2) {
      v7 = @"durationSec";
    }
    else {
      v7 = @"duration_sec";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 20);
  }
  if ((v5 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 13)];
    if (a2) {
      v9 = @"hadPanActions";
    }
    else {
      v9 = @"had_pan_actions";
    }
    [v4 setObject:v8 forKey:v9];

    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 0x20) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
  if (a2) {
    v11 = @"hadZoomActions";
  }
  else {
    v11 = @"had_zoom_actions";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
LABEL_25:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 14)];
    if (a2) {
      v15 = @"hadPoiTapActions";
    }
    else {
      v15 = @"had_poi_tap_actions";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 20) & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_21:
  v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
  if (a2) {
    v13 = @"hadMoveActions";
  }
  else {
    v13 = @"had_move_actions";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 8) != 0) {
    goto LABEL_25;
  }
LABEL_11:
  if ((v5 & 0x10) != 0)
  {
LABEL_29:
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 15)];
    if (a2) {
      v17 = @"hadShareActions";
    }
    else {
      v17 = @"had_share_actions";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateSummaryLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateSummaryLookAroundLog)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateSummaryLookAroundLog *)-[GEOLogMsgStateSummaryLookAroundLog _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"durationSec";
      }
      else {
        v6 = @"duration_sec";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDurationSec:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"hadPanActions";
      }
      else {
        objc_super v8 = @"had_pan_actions";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHadPanActions:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"hadZoomActions";
      }
      else {
        v10 = @"had_zoom_actions";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHadZoomActions:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"hadMoveActions";
      }
      else {
        v12 = @"had_move_actions";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHadMoveActions:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"hadPoiTapActions";
      }
      else {
        v14 = @"had_poi_tap_actions";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHadPoiTapActions:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"hadShareActions";
      }
      else {
        v16 = @"had_share_actions";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHadShareActions:", objc_msgSend(v17, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateSummaryLookAroundLog)initWithJSON:(id)a3
{
  return (GEOLogMsgStateSummaryLookAroundLog *)-[GEOLogMsgStateSummaryLookAroundLog _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateSummaryLookAroundLogIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateSummaryLookAroundLogReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateSummaryLookAroundLog *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_durationSec;
    *((unsigned char *)v5 + 20) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 13) = self->_hadPanActions;
  *((unsigned char *)v5 + 20) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)v5 + 16) = self->_hadZoomActions;
  *((unsigned char *)v5 + 20) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 12) = self->_hadMoveActions;
  *((unsigned char *)v5 + 20) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((unsigned char *)v5 + 14) = self->_hadPoiTapActions;
  *((unsigned char *)v5 + 20) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_7:
    *((unsigned char *)v5 + 15) = self->_hadShareActions;
    *((unsigned char *)v5 + 20) |= 0x10u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_durationSec;
    *((unsigned char *)result + 20) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 13) = self->_hadPanActions;
  *((unsigned char *)result + 20) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 16) = self->_hadZoomActions;
  *((unsigned char *)result + 20) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 12) = self->_hadMoveActions;
  *((unsigned char *)result + 20) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 14) = self->_hadPoiTapActions;
  *((unsigned char *)result + 20) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    return result;
  }
LABEL_7:
  *((unsigned char *)result + 15) = self->_hadShareActions;
  *((unsigned char *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  [(GEOLogMsgStateSummaryLookAroundLog *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_durationSec != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_41;
    }
    if (self->_hadPanActions)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x20) == 0) {
      goto LABEL_41;
    }
    if (self->_hadZoomActions)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_41;
    }
    if (self->_hadMoveActions)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) == 0) {
      goto LABEL_41;
    }
    if (self->_hadPoiTapActions)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) != 0)
  {
    goto LABEL_41;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
    {
      if (self->_hadShareActions)
      {
        if (!*((unsigned char *)v4 + 15)) {
          goto LABEL_41;
        }
      }
      else if (*((unsigned char *)v4 + 15))
      {
        goto LABEL_41;
      }
      BOOL v5 = 1;
      goto LABEL_42;
    }
LABEL_41:
    BOOL v5 = 0;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateSummaryLookAroundLog *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_durationSec;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_hadPanActions;
      if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_hadZoomActions;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_hadMoveActions;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_hadPoiTapActions;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_hadShareActions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if (v4)
  {
    self->_durationSec = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_hadPanActions = *((unsigned char *)v5 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_hadZoomActions = *((unsigned char *)v5 + 16);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_hadMoveActions = *((unsigned char *)v5 + 12);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_hadPoiTapActions = *((unsigned char *)v5 + 14);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 20) & 0x10) != 0)
  {
LABEL_7:
    self->_hadShareActions = *((unsigned char *)v5 + 15);
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_8:
}

@end