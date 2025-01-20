@interface HDRInputTransform
- ($AC718E4E1D1D761EFCA992956E534F39)storage;
- (const)gainMap;
- (const)image;
- (id)description;
- (unsigned)flags;
- (void)dealloc;
@end

@implementation HDRInputTransform

- (void)dealloc
{
  p_t = &self->t;
  v4 = *(void **)&self[5].t.image.pixel.var0;
  if (v4) {

  }
  v5 = *(void **)&p_t[14].image.pixel.var0;
  if (v5) {

  }
  v6 = *(void **)&p_t[21].image.pixel.var1;
  if (v6) {

  }
  v7.receiver = self;
  v7.super_class = (Class)HDRInputTransform;
  [(HDRInputTransform *)&v7 dealloc];
}

- ($AC718E4E1D1D761EFCA992956E534F39)storage
{
  return ($AC718E4E1D1D761EFCA992956E534F39 *)&self->t;
}

- (unsigned)flags
{
  return self->t.flags;
}

- (const)image
{
  return (const $C8D1ACB0DEE3B0D7530FADC997030A81 *)&self->t.image.pixel.var2;
}

- (const)gainMap
{
  return (const $7F5F757F935EFDA1B622558C1678222D *)self[13]._anon_8;
}

- (id)description
{
  p_t = &self->t;
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"HDRInputTransform{hasGainMap:%d,baseIsSDR:%d}", self->t.flags & 1, (self->t.flags >> 1) & 1);
  v4 = NSString;
  long long v5 = *(_OWORD *)&p_t[4].image.pixel.var2;
  v52[4] = *(_OWORD *)&p_t[4].flags;
  v52[5] = v5;
  long long v6 = *(_OWORD *)&p_t[6].image.pixel.var0;
  v52[6] = *(_OWORD *)&p_t[5].image.pixel.var1;
  v52[7] = v6;
  long long v7 = *(_OWORD *)&p_t[1].image.pixel.var1;
  v52[0] = *(_OWORD *)&p_t->image.pixel.var2;
  v52[1] = v7;
  $79C168461E1A180C7FA664BD10925E28 image = p_t[3].image;
  v52[2] = *(_OWORD *)&p_t[2].image.pixel.var0;
  v52[3] = image;
  v9 = HDRPixelTransformInDescription((uint64_t)v52);
  long long v10 = *(_OWORD *)&p_t[9].image.pixel.var1;
  v51[2] = *(_OWORD *)&p_t[8].image.pixel.var2;
  v51[3] = v10;
  v51[4] = *(_OWORD *)&p_t[10].image.pixel.var0;
  long long v11 = *(_OWORD *)&p_t[8].flags;
  v51[0] = p_t[7].image;
  v51[1] = v11;
  v12 = HDRColorTRCToString((uint64_t)v51);
  long long v13 = *(_OWORD *)&p_t[16].flags;
  v50[0] = p_t[15].image;
  v50[1] = v13;
  long long v14 = *(_OWORD *)&p_t[17].image.pixel.var1;
  v50[2] = *(_OWORD *)&p_t[16].image.pixel.var2;
  v50[3] = v14;
  v15 = HDRColorMatrixToString((uint64_t)v50);
  long long v16 = *(_OWORD *)&p_t[20].flags;
  v49[10] = p_t[19].image;
  v49[11] = v16;
  long long v17 = *(_OWORD *)&p_t[21].image.pixel.var1;
  v49[12] = *(_OWORD *)&p_t[20].image.pixel.var2;
  v49[13] = v17;
  long long v18 = *(_OWORD *)&p_t[16].image.pixel.var2;
  v49[6] = *(_OWORD *)&p_t[16].flags;
  v49[7] = v18;
  long long v19 = *(_OWORD *)&p_t[18].image.pixel.var0;
  v49[8] = *(_OWORD *)&p_t[17].image.pixel.var1;
  v49[9] = v19;
  long long v20 = *(_OWORD *)&p_t[13].image.pixel.var1;
  v49[2] = *(_OWORD *)&p_t[12].image.pixel.var2;
  v49[3] = v20;
  $79C168461E1A180C7FA664BD10925E28 v21 = p_t[15].image;
  v49[4] = *(_OWORD *)&p_t[14].image.pixel.var0;
  v49[5] = v21;
  long long v22 = *(_OWORD *)&p_t[12].flags;
  v49[0] = p_t[11].image;
  v49[1] = v22;
  v23 = HDRToneMappingToString((uint64_t)v49);
  $79C168461E1A180C7FA664BD10925E28 v24 = p_t[23].image;
  v48[0] = *(_OWORD *)&p_t[22].image.pixel.var0;
  v48[1] = v24;
  long long v25 = *(_OWORD *)&p_t[24].image.pixel.var2;
  v48[2] = *(_OWORD *)&p_t[24].flags;
  v48[3] = v25;
  v26 = HDRColorMatrixToString((uint64_t)v48);
  v27 = [v4 stringWithFormat:@"\nImage Steps:\n\t  IN: %@\n\t TRC: %@\n\tTMAT: %@\n\t  TM: %@\n\t MAT: %@", v9, v12, v15, v23, v26];

  v28 = [v3 stringByAppendingString:v27];

  if (p_t->flags)
  {
    v29 = NSString;
    long long v30 = *(_OWORD *)&p_t[29].image.pixel.var1;
    v47[4] = *(_OWORD *)&p_t[28].image.pixel.var2;
    v47[5] = v30;
    $79C168461E1A180C7FA664BD10925E28 v31 = p_t[31].image;
    v47[6] = *(_OWORD *)&p_t[30].image.pixel.var0;
    v47[7] = v31;
    long long v32 = *(_OWORD *)&p_t[26].image.pixel.var0;
    v47[0] = *(_OWORD *)&p_t[25].image.pixel.var1;
    v47[1] = v32;
    long long v33 = *(_OWORD *)&p_t[28].flags;
    v47[2] = p_t[27].image;
    v47[3] = v33;
    v34 = HDRPixelTransformInDescription((uint64_t)v47);
    long long v35 = *(_OWORD *)&p_t[36].flags;
    v46[4] = p_t[35].image;
    v46[5] = v35;
    v46[6] = *(_OWORD *)&p_t[36].image.pixel.var2;
    long long v36 = *(_OWORD *)&p_t[32].image.pixel.var2;
    v46[0] = *(_OWORD *)&p_t[32].flags;
    v46[1] = v36;
    long long v37 = *(_OWORD *)&p_t[34].image.pixel.var0;
    v46[2] = *(_OWORD *)&p_t[33].image.pixel.var1;
    v46[3] = v37;
    v38 = HDRGainMappingToString((float *)v46);
    long long v39 = *(_OWORD *)&p_t[38].image.pixel.var0;
    v45[0] = *(_OWORD *)&p_t[37].image.pixel.var1;
    v45[1] = v39;
    long long v40 = *(_OWORD *)&p_t[40].flags;
    v45[2] = p_t[39].image;
    v45[3] = v40;
    v41 = HDRColorMatrixToString((uint64_t)v45);
    v42 = [v29 stringWithFormat:@"\nGainMap Steps:\n\t  IN: %@\n\tGAIN: %@\n\t MAT: %@\n", v34, v38, v41];

    uint64_t v43 = [v28 stringByAppendingString:v42];

    v28 = (void *)v43;
  }

  return v28;
}

@end