@interface HMDCameraClipSegmentMetadata
- (BOOL)hasByteLength;
- (BOOL)hasByteOffset;
- (BOOL)hasDuration;
- (BOOL)hasTimeOffset;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)duration;
- (double)timeOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)byteLength;
- (unint64_t)byteOffset;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setByteLength:(unint64_t)a3;
- (void)setByteOffset:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setHasByteLength:(BOOL)a3;
- (void)setHasByteOffset:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimeOffset:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDCameraClipSegmentMetadata

- (double)duration
{
  return self->_duration;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (unint64_t)byteLength
{
  return self->_byteLength;
}

- (unint64_t)byteOffset
{
  return self->_byteOffset;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_byteOffset = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_byteLength = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_timeOffset = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_duration = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
LABEL_6:
    self->_type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  unint64_t v4 = 2654435761u * self->_byteOffset;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_byteLength;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timeOffset = self->_timeOffset;
  double v7 = -timeOffset;
  if (timeOffset >= 0.0) {
    double v7 = self->_timeOffset;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 4) != 0)
  {
    double duration = self->_duration;
    double v13 = -duration;
    if (duration >= 0.0) {
      double v13 = self->_duration;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 0x10) != 0) {
    uint64_t v16 = 2654435761 * self->_type;
  }
  else {
    uint64_t v16 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11 ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_byteOffset != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_byteLength != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_timeOffset != *((double *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_duration != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_byteOffset;
    *((unsigned char *)result + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_byteLength;
  *((unsigned char *)result + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 4) = *(void *)&self->_timeOffset;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 3) = *(void *)&self->_duration;
  *((unsigned char *)result + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 10) = self->_type;
  *((unsigned char *)result + 44) |= 0x10u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_byteOffset;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_byteLength;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = *(void *)&self->_timeOffset;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[3] = *(void *)&self->_duration;
  *((unsigned char *)v4 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 10) = self->_type;
    *((unsigned char *)v4 + 44) |= 0x10u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    long double v8 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        uint64_t v13 = *(void *)((char *)a3 + v12);
        unint64_t v14 = v13 + 1;
        if (v13 == -1 || v14 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v16 = v10++ >= 9;
        if (v16)
        {
          unint64_t v11 = 0;
          int v17 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v17 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v17 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          char v19 = 0;
          unsigned int v20 = 0;
          unint64_t v21 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (1)
          {
            uint64_t v22 = *v4;
            uint64_t v23 = *(void *)((char *)a3 + v22);
            unint64_t v24 = v23 + 1;
            if (v23 == -1 || v24 > *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
            *(void *)((char *)a3 + v22) = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0) {
              goto LABEL_49;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              unint64_t v21 = 0;
              goto LABEL_51;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_49:
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v21 = 0;
          }
LABEL_51:
          uint64_t v45 = 16;
          goto LABEL_56;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          unint64_t v21 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v29 = *v4;
            uint64_t v30 = *(void *)((char *)a3 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v30);
              *(void *)((char *)a3 + v29) = v31;
              v21 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  unint64_t v21 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v21 = 0;
          }
LABEL_55:
          uint64_t v45 = 8;
LABEL_56:
          *(Class *)((char *)&self->super.super.isa + v45) = (Class)v21;
          continue;
        case 3u:
          *(unsigned char *)&self->_has |= 8u;
          uint64_t v33 = *v4;
          unint64_t v34 = *(void *)((char *)a3 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)((char *)a3 + *v5))
          {
            v35 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v34);
            *(void *)((char *)a3 + v33) = v34 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            v35 = 0;
          }
          uint64_t v46 = 32;
          goto LABEL_65;
        case 4u:
          *(unsigned char *)&self->_has |= 4u;
          uint64_t v36 = *v4;
          unint64_t v37 = *(void *)((char *)a3 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)((char *)a3 + *v5))
          {
            v35 = *(objc_class **)(*(void *)((char *)a3 + *v8) + v37);
            *(void *)((char *)a3 + v36) = v37 + 8;
          }
          else
          {
            *((unsigned char *)a3 + *v6) = 1;
            v35 = 0;
          }
          uint64_t v46 = 24;
LABEL_65:
          *(Class *)((char *)&self->super.super.isa + v46) = v35;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)&self->_has |= 0x10u;
          break;
        default:
          int v26 = PBReaderSkipValueWithTag();
          if (!v26) {
            return v26;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v4;
        uint64_t v42 = *(void *)((char *)a3 + v41);
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v42);
        *(void *)((char *)a3 + v41) = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0) {
          goto LABEL_58;
        }
        v38 += 7;
        BOOL v16 = v39++ >= 9;
        if (v16)
        {
          LODWORD(v40) = 0;
          goto LABEL_60;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_58:
      if (*((unsigned char *)a3 + *v6)) {
        LODWORD(v40) = 0;
      }
LABEL_60:
      self->_type = v40;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v5 = [NSNumber numberWithUnsignedLongLong:self->_byteOffset];
    [v3 setObject:v5 forKey:@"byteOffset"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithUnsignedLongLong:self->_byteLength];
  [v3 setObject:v6 forKey:@"byteLength"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    long double v8 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v8 forKey:@"duration"];

    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_11:
    uint64_t type = self->_type;
    if (type >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      unsigned int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v10 = off_264A27348[type];
    }
    [v3 setObject:v10 forKey:@"type"];

    goto LABEL_15;
  }
LABEL_9:
  double v7 = [NSNumber numberWithDouble:self->_timeOffset];
  [v3 setObject:v7 forKey:@"timeOffset"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_15:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraClipSegmentMetadata;
  id v4 = [(HMDCameraClipSegmentMetadata *)&v8 description];
  id v5 = [(HMDCameraClipSegmentMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FMP4_INIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FMP4_SEGMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POSTER_FRAME"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264A27348[a3];
  }
  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double duration = a3;
}

- (BOOL)hasTimeOffset
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTimeOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTimeOffset:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double timeOffset = a3;
}

- (BOOL)hasByteLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasByteLength:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setByteLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_byteLength = a3;
}

- (BOOL)hasByteOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasByteOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setByteOffset:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_byteOffset = a3;
}

@end