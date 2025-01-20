@interface HDROutputTransform
- ($B776AB1D653B08CFC4C797E54316E8EA)storage;
- (const)gainMap;
- (const)image;
- (id)description;
- (unsigned)flags;
- (void)dealloc;
@end

@implementation HDROutputTransform

- (void)dealloc
{
  p_t = &self->t;
  v4 = *(void **)&self[1].t.image.pixel.type;
  if (v4) {

  }
  v5 = *(void **)&p_t->image.color.trc.params.f;
  if (v5) {

  }
  v6 = *(void **)&p_t[1].image.color.tm.trc.params.gamma;
  if (v6) {

  }
  v7.receiver = self;
  v7.super_class = (Class)HDROutputTransform;
  [(HDROutputTransform *)&v7 dealloc];
}

- ($B776AB1D653B08CFC4C797E54316E8EA)storage
{
  return ($B776AB1D653B08CFC4C797E54316E8EA *)&self->t;
}

- (unsigned)flags
{
  return self->t.flags;
}

- (const)image
{
  return (const $952D62A909593DCC84CDA4A025E8BB3E *)&self->t.image.color.tm;
}

- (const)gainMap
{
  return (const $011FDAD128C43BF22EC5593579CBEDC4 *)&self[2].t.image.color.tm.trc.params.f;
}

- (id)description
{
  p_t = &self->t;
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"HDRInputTransform{hasGainMap:%d,baseIsSDR:%d}", self->t.flags & 1, (self->t.flags >> 1) & 1);
  v4 = NSString;
  long long v5 = *(_OWORD *)&p_t->image.color.tm.params.d;
  v57[0] = *(_OWORD *)&p_t->image.color.tm.type;
  v57[1] = v5;
  long long v6 = *(_OWORD *)&p_t->image.color.tm.mat.identity;
  v57[2] = *(_OWORD *)&p_t->image.color.tm.params.gamma;
  v57[3] = v6;
  objc_super v7 = HDRColorMatrixToString((uint64_t)v57);
  long long v8 = *(_OWORD *)&p_t[1].image.color.tm.trc.type;
  v56[10] = *(_OWORD *)&p_t[1].image.color.tm.lut;
  v56[11] = v8;
  long long v9 = *(_OWORD *)&p_t[1].image.color.tm.trc.params.gamma;
  v56[12] = *(_OWORD *)&p_t[1].image.color.tm.trc.params.d;
  v56[13] = v9;
  long long v10 = *(_OWORD *)&p_t[1].image.color.rgb.identity;
  v56[6] = *(_OWORD *)&p_t->image.pixel.var1;
  v56[7] = v10;
  long long v11 = *(_OWORD *)&p_t[1].image.color.tm.params.f;
  v56[8] = *(_OWORD *)&p_t[1].image.color.tm.params.b;
  v56[9] = v11;
  long long v12 = *(_OWORD *)&p_t->image.color.trc.params.b;
  v56[2] = *(_OWORD *)&p_t->image.color.tm.trc.lut;
  v56[3] = v12;
  long long v13 = *(_OWORD *)&p_t->image.color.trc.lut;
  v56[4] = *(_OWORD *)&p_t->image.color.trc.params.f;
  v56[5] = v13;
  long long v14 = *(_OWORD *)&p_t->image.color.tm.trc.params.f;
  v56[0] = *(_OWORD *)&p_t->image.color.tm.trc.params.b;
  v56[1] = v14;
  v15 = HDRToneMappingToString((uint64_t)v56);
  $346D2EBFF242A528E54B8456DF6A0748 pixel = p_t[1].image.pixel;
  v55[2] = *(_OWORD *)&p_t[1].image.color.trc.params.gamma;
  v55[3] = pixel;
  v55[4] = *(_OWORD *)&p_t[2].flags;
  long long v17 = *(_OWORD *)&p_t[1].image.color.trc.params.d;
  v55[0] = *(_OWORD *)&p_t[1].image.color.trc.type;
  v55[1] = v17;
  v18 = HDRColorTRCToString((uint64_t)v55);
  long long v19 = *(_OWORD *)&p_t[2].image.color.tm.trc.params.f;
  long long v52 = *(_OWORD *)&p_t[2].image.color.tm.trc.params.b;
  long long v53 = v19;
  long long v54 = *(_OWORD *)&p_t[2].image.color.tm.trc.lut;
  simd_float3 v20 = *(simd_float3 *)&p_t[2].image.color.tm.params.d;
  v50.columns[0] = *(simd_float3 *)&p_t[2].image.color.tm.type;
  v50.columns[1] = v20;
  long long v21 = *(_OWORD *)&p_t[2].image.color.tm.mat.identity;
  v50.columns[2] = *(simd_float3 *)&p_t[2].image.color.tm.params.gamma;
  long long v51 = v21;
  v22 = HDRPixelTransformOutDescription(&v50);
  v23 = [v4 stringWithFormat:@"\nImage Steps:\n\t MAT: %@\n\t  TM: %@\n\t TRC: %@\n\t OUT: %@", v7, v15, v18, v22];

  v24 = [v3 stringByAppendingString:v23];

  if (p_t->flags)
  {
    v25 = NSString;
    long long v26 = *(_OWORD *)&p_t[3].image.color.tm.trc.type;
    v49[0] = *(_OWORD *)&p_t[3].image.color.tm.lut;
    v49[1] = v26;
    long long v27 = *(_OWORD *)&p_t[3].image.color.tm.trc.params.gamma;
    v49[2] = *(_OWORD *)&p_t[3].image.color.tm.trc.params.d;
    v49[3] = v27;
    v28 = HDRColorMatrixToString((uint64_t)v49);
    int gamma_low = LOBYTE(p_t[3].image.color.trc.params.gamma);
    if (LOBYTE(p_t[3].image.color.trc.params.gamma))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[r=%g,g=%g,b=%g,max=%g]", p_t[3].image.color.trc.params.d, p_t[3].image.color.trc.params.e, p_t[3].image.color.trc.params.f, p_t[3].image.color.trc.params.g);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = @"n/a";
    }
    v31 = [NSString stringWithFormat:@"[x=%g, y=%g]", COERCE_FLOAT(*(void *)&p_t[3].image.color.trc.type), COERCE_FLOAT(HIDWORD(*(void *)&p_t[3].image.color.trc.type))];
    long long v32 = *(_OWORD *)&p_t[3].image.color.tm.params.b;
    v48[4] = *(_OWORD *)&p_t[3].image.color.rgb.identity;
    v48[5] = v32;
    v48[6] = *(_OWORD *)&p_t[3].image.color.tm.params.f;
    long long v33 = *(_OWORD *)&p_t[2].image.color.trc.params.f;
    v48[0] = *(_OWORD *)&p_t[2].image.color.trc.params.b;
    v48[1] = v33;
    long long v34 = *(_OWORD *)&p_t[2].image.pixel.var1;
    v48[2] = *(_OWORD *)&p_t[2].image.color.trc.lut;
    v48[3] = v34;
    v35 = HDRGainMappingToString((float *)v48);
    long long v36 = *(_OWORD *)&p_t[4].image.color.tm.mat.identity;
    long long v45 = *(_OWORD *)&p_t[4].image.color.tm.params.gamma;
    long long v46 = v36;
    long long v47 = *(_OWORD *)&p_t[4].image.color.tm.trc.params.b;
    simd_float3 v37 = *(simd_float3 *)&p_t[4].flags;
    v43.columns[0] = (simd_float3)p_t[3].image.pixel;
    v43.columns[1] = v37;
    long long v38 = *(_OWORD *)&p_t[4].image.color.tm.params.d;
    v43.columns[2] = *(simd_float3 *)&p_t[4].image.color.tm.type;
    long long v44 = v38;
    v39 = HDRPixelTransformOutDescription(&v43);
    v40 = [v25 stringWithFormat:@"\nGainMap Steps:\n\t MAT: %@\n\tLUMA: %@\n\tCLIP: %@\n\tGAIN: %@\n\t OUT: %@\n", v28, v30, v31, v35, v39];

    if (gamma_low) {
    uint64_t v41 = [v24 stringByAppendingString:v40];
    }

    v24 = (void *)v41;
  }

  return v24;
}

@end