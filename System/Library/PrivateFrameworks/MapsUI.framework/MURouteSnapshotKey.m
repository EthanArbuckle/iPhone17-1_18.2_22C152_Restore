@interface MURouteSnapshotKey
- (BOOL)darkMode;
- (BOOL)isEqual:(id)a3;
- (MURouteSnapshotKey)initWithIdentifier:(id)a3 width:(double)a4 height:(double)a5 scale:(double)a6 padding:(UIEdgeInsets)a7 darkMode:(BOOL)a8;
- (NSString)fileName;
- (NSUUID)identifier;
- (UIEdgeInsets)padding;
- (double)height;
- (double)scale;
- (double)width;
- (id)description;
- (unint64_t)hash;
@end

@implementation MURouteSnapshotKey

- (MURouteSnapshotKey)initWithIdentifier:(id)a3 width:(double)a4 height:(double)a5 scale:(double)a6 padding:(UIEdgeInsets)a7 darkMode:(BOOL)a8
{
  BOOL v8 = a8;
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  id v17 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MURouteSnapshotKey;
  v18 = [(MURouteSnapshotKey *)&v29 init];
  if (v18)
  {
    uint64_t v19 = [v17 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v19;

    unint64_t v21 = vcvtmd_u64_f64(a4);
    unint64_t v22 = vcvtmd_u64_f64(a5);
    unint64_t v23 = vcvtmd_u64_f64(a6);
    if (!v23) {
      unint64_t v23 = 2;
    }
    v18->_width = (double)(unint64_t)floor(a4);
    v18->_height = (double)(unint64_t)floor(a5);
    v18->_scale = (double)v23;
    v18->_padding.double top = (double)(unint64_t)floor(top);
    v18->_padding.double left = (double)(unint64_t)floor(left);
    v18->_padding.double bottom = (double)(unint64_t)floor(bottom);
    v18->_padding.double right = (double)(unint64_t)floor(right);
    v18->_darkMode = v8;
    uint64_t v24 = [NSString stringWithFormat:@"RouteSnapshot-%@-%lux%lu@%lu~%lu-%lu-%lu-%lu~%d", v18->_identifier, v21, v22, v23, vcvtmd_u64_f64(left), vcvtmd_u64_f64(right), vcvtmd_u64_f64(top), vcvtmd_u64_f64(bottom), v8];
    fileName = v18->_fileName;
    v18->_fileName = (NSString *)v24;

    uint64_t v26 = [NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), v18, v18->_fileName];
    internalDescription = v18->_internalDescription;
    v18->_internalDescription = (NSString *)v26;
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    identifier = self->_identifier;
    unint64_t v7 = (unint64_t)*((id *)v5 + 3);
    id v8 = identifier;
    BOOL v11 = (!(v7 | (unint64_t)v8)
        || (v9 = v8, int v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10))
       && vabdd_f64(*((double *)v5 + 4), self->_width) <= 2.22044605e-16
       && vabdd_f64(*((double *)v5 + 5), self->_height) <= 2.22044605e-16
       && vabdd_f64(*((double *)v5 + 6), self->_scale) <= 2.22044605e-16
       && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*((float64x2_t *)v5 + 4), *(float64x2_t *)&self->_padding.top), (int32x4_t)vceqq_f64(*((float64x2_t *)v5 + 5), *(float64x2_t *)&self->_padding.bottom))), 0xFuLL))) & 1) != 0&& v5[16] == self->_darkMode;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  double width = self->_width;
  double v5 = -width;
  if (width >= 0.0) {
    double v5 = self->_width;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  double height = self->_height;
  double v14 = -height;
  if (height >= 0.0) {
    double v14 = self->_height;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  double scale = self->_scale;
  double v23 = -scale;
  if (scale >= 0.0) {
    double v23 = self->_scale;
  }
  long double v24 = floor(v23 + 0.5);
  double v25 = (v23 - v24) * 1.84467441e19;
  double v26 = fmod(v24, 1.84467441e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabs(v25);
  if (v25 >= 0.0) {
    unint64_t v29 = v28;
  }
  return v12 ^ v3 ^ v21 ^ v29 ^ PBHashBytes() ^ (2654435761 * self->_darkMode);
}

- (id)description
{
  return self->_internalDescription;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (double)scale
{
  return self->_scale;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_internalDescription, 0);
}

@end