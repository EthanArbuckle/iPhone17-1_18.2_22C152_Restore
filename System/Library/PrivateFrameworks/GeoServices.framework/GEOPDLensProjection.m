@interface GEOPDLensProjection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLensProjection

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLensProjection;
  v4 = [(GEOPDLensProjection *)&v8 description];
  v5 = [(GEOPDLensProjection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLensProjection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_29;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x200) != 0)
  {
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
    [v4 setObject:v6 forKey:@"type"];

    __int16 v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_4;
  }
  v7 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    objc_super v8 = @"fovS";
  }
  else {
    objc_super v8 = @"fov_s";
  }
  [v4 setObject:v7 forKey:v8];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_18:
  v9 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v10 = @"fovH";
  }
  else {
    v10 = @"fov_h";
  }
  [v4 setObject:v9 forKey:v10];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v11 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v4 setObject:v11 forKey:@"k2"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v12 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v4 setObject:v12 forKey:@"k3"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v13 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v13 forKey:@"k4"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  [v4 setObject:v14 forKey:@"cx"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_27:
    v16 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v4 setObject:v16 forKey:@"lx"];

    if ((*(_WORD *)(a1 + 84) & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_26:
  v15 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v4 setObject:v15 forKey:@"cy"];

  __int16 v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x80) != 0) {
    goto LABEL_27;
  }
LABEL_11:
  if ((v5 & 0x100) != 0)
  {
LABEL_28:
    v17 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    [v4 setObject:v17 forKey:@"ly"];
  }
LABEL_29:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLensProjection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLensProjectionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_flags & 0x100) != 0) {
LABEL_11:
  }
    PBDataWriterWriteDoubleField();
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    *((_DWORD *)result + 20) = self->_type;
    *((_WORD *)result + 42) |= 0x200u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_fovS;
  *((_WORD *)result + 42) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 3) = *(void *)&self->_fovH;
  *((_WORD *)result + 42) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 5) = *(void *)&self->_k2;
  *((_WORD *)result + 42) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 6) = *(void *)&self->_k3;
  *((_WORD *)result + 42) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 7) = *(void *)&self->_k4;
  *((_WORD *)result + 42) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 1) = *(void *)&self->_cx;
  *((_WORD *)result + 42) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 2) = *(void *)&self->_cy;
  *((_WORD *)result + 42) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((void *)result + 8) = *(void *)&self->_lx;
  *((_WORD *)result + 42) |= 0x80u;
  if ((*(_WORD *)&self->_flags & 0x100) == 0) {
    return result;
  }
LABEL_11:
  *((void *)result + 9) = *(void *)&self->_ly;
  *((_WORD *)result + 42) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x200) == 0 || self->_type != *((_DWORD *)v4 + 20)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x200) != 0)
  {
LABEL_52:
    BOOL v7 = 0;
    goto LABEL_53;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_fovS != *((double *)v4 + 4)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fovH != *((double *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_k2 != *((double *)v4 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_k3 != *((double *)v4 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_k4 != *((double *)v4 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_cx != *((double *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (v6)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cy != *((double *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lx != *((double *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_ly != *((double *)v4 + 9)) {
      goto LABEL_52;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_53:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    uint64_t v53 = 2654435761 * self->_type;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v53 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double fovS = self->_fovS;
  double v5 = -fovS;
  if (fovS >= 0.0) {
    double v5 = self->_fovS;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
    double fovH = self->_fovH;
    double v11 = -fovH;
    if (fovH >= 0.0) {
      double v11 = self->_fovH;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    double k2 = self->_k2;
    double v16 = -k2;
    if (k2 >= 0.0) {
      double v16 = self->_k2;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    double k3 = self->_k3;
    double v21 = -k3;
    if (k3 >= 0.0) {
      double v21 = self->_k3;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((flags & 0x40) != 0)
  {
    double k4 = self->_k4;
    double v26 = -k4;
    if (k4 >= 0.0) {
      double v26 = self->_k4;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v52 = v19;
  if (flags)
  {
    double cx = self->_cx;
    double v32 = -cx;
    if (cx >= 0.0) {
      double v32 = self->_cx;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    unint64_t v29 = v9;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v29 = v9;
    unint64_t v30 = 0;
  }
  unint64_t v35 = v8;
  if ((flags & 2) != 0)
  {
    double cy = self->_cy;
    double v38 = -cy;
    if (cy >= 0.0) {
      double v38 = self->_cy;
    }
    long double v39 = floor(v38 + 0.5);
    double v40 = (v38 - v39) * 1.84467441e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    unint64_t v36 = 0;
  }
  if ((flags & 0x80) != 0)
  {
    double lx = self->_lx;
    double v43 = -lx;
    if (lx >= 0.0) {
      double v43 = self->_lx;
    }
    long double v44 = floor(v43 + 0.5);
    double v45 = (v43 - v44) * 1.84467441e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    unint64_t v41 = 0;
  }
  if ((flags & 0x100) != 0)
  {
    double ly = self->_ly;
    double v48 = -ly;
    if (ly >= 0.0) {
      double v48 = self->_ly;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  return v35 ^ v53 ^ v29 ^ v14 ^ v52 ^ v24 ^ v30 ^ v36 ^ v41 ^ v46;
}

@end