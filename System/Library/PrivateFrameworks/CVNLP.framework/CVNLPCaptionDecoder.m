@interface CVNLPCaptionDecoder
- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4;
- (void)_fill_blob_data:(id *)a3 with:(float)a4;
@end

@implementation CVNLPCaptionDecoder

- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CA00];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v11 = objc_msgSend_stringWithFormat_(v7, v9, @"You must override %@ in a subclass", v10, v8);
  objc_msgSend_exceptionWithName_reason_userInfo_(v6, v12, *MEMORY[0x1E4F1C3B8], (uint64_t)v11, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)_fill_blob_data:(id *)a3 with:(float)a4
{
  int32x2_t v19 = *(int32x2_t *)&a4;
  var0 = (int32x4_t *)a3->var0;
  long long v6 = *(_OWORD *)&a3->var12;
  v20[8] = *(_OWORD *)&a3->var10;
  v20[9] = v6;
  uint64_t v21 = *(void *)&a3->var14;
  long long v7 = *(_OWORD *)&a3->var4;
  v20[4] = *(_OWORD *)&a3->var3[2];
  v20[5] = v7;
  long long v8 = *(_OWORD *)&a3->var8;
  v20[6] = *(_OWORD *)&a3->var6;
  v20[7] = v8;
  long long v9 = *(_OWORD *)a3->var2;
  v20[0] = *(_OWORD *)&a3->var0;
  v20[1] = v9;
  long long v10 = *(_OWORD *)a3->var3;
  v20[2] = *(_OWORD *)&a3->var2[2];
  v20[3] = v10;
  uint64_t v11 = objc_msgSend__blob_size_(self, a2, (uint64_t)v20, v4);
  if (v11 >= 1)
  {
    uint64_t v12 = v11 & 0x3FFFFFFFFFFFFFFFLL;
    unint64_t v13 = (v11 & 0x3FFFFFFFFFFFFFFFLL) - ((v11 & 0x3FFFFFFFFFFFFFFFLL) != 0) + 1;
    if (v13 < 8)
    {
      v14 = (char *)var0;
LABEL_7:
      unint64_t v18 = v12 + 1;
      do
      {
        *(_DWORD *)v14 = v19.i32[0];
        v14 += 4;
        --v18;
      }
      while (v18 > 1);
      return;
    }
    v14 = &var0->i8[4 * (v13 & 0xFFFFFFFFFFFFFFF8)];
    v12 -= v13 & 0xFFFFFFFFFFFFFFF8;
    int32x4_t v15 = vdupq_lane_s32(v19, 0);
    v16 = var0 + 1;
    unint64_t v17 = v13 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v16[-1] = v15;
      int32x4_t *v16 = v15;
      v16 += 2;
      v17 -= 8;
    }
    while (v17);
    if (v13 != (v13 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_7;
    }
  }
}

@end