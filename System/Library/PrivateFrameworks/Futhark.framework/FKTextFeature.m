@interface FKTextFeature
+ (id)featureFromConcompIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 type:(int64_t)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8;
+ (id)featureFromSequenceIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 createConcompFeatures:(BOOL)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8;
- (CGRect)boundingBox;
- (FKTextFeature)initWithType:(int64_t)a3 boundingBox:(CGRect *)a4 corners:(id)a5 featureID:(int64_t)a6 session:(FKSession *)a7 backingIndex:(id)a8 scale:(int)a9;
- (NSArray)candidates;
- (NSArray)corners;
- (NSArray)subFeatures;
- (NSString)text;
- (float)confidence;
- (int64_t)featureID;
- (int64_t)type;
- (void)dealloc;
- (void)setConfidence:(float)a3;
- (void)setSubFeatures:(id)a3;
- (void)setText:(id)a3;
@end

@implementation FKTextFeature

- (FKTextFeature)initWithType:(int64_t)a3 boundingBox:(CGRect *)a4 corners:(id)a5 featureID:(int64_t)a6 session:(FKSession *)a7 backingIndex:(id)a8 scale:(int)a9
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)FKTextFeature;
  v15 = [(FKTextFeature *)&v42 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v15->_backingIndex.seqInd = a8.var0;
    v15->_session = a7;
    v15->_scale = a9;
    if (a5)
    {
      v15->_corners = (NSArray *)a5;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v17 = [a5 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v39;
        __asm { FMOV            V0.2D, #1.0 }
        float64x2_t v34 = _Q0;
        float64x2_t v25 = 0uLL;
        CGPoint v33 = (CGPoint)*MEMORY[0x1E4F1DAD8];
        do
        {
          uint64_t v26 = 0;
          do
          {
            float64x2_t v35 = v25;
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(a5);
            }
            CFDictionaryRef v27 = *(const __CFDictionary **)(*((void *)&v38 + 1) + 8 * v26);
            CGPoint point = v33;
            if (CGPointMakeWithDictionaryRepresentation(v27, &point))
            {
              float64x2_t v34 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v34, (float64x2_t)point), (int8x16_t)point, (int8x16_t)v34);
              float64x2_t v25 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v35, (float64x2_t)point), (int8x16_t)v35, (int8x16_t)point);
            }
            else
            {
              float64x2_t v25 = v35;
            }
            ++v26;
          }
          while (v18 != v26);
          float64x2_t v36 = v25;
          uint64_t v28 = [a5 countByEnumeratingWithState:&v38 objects:v43 count:16];
          float64x2_t v25 = v36;
          uint64_t v18 = v28;
        }
        while (v28);
      }
      else
      {
        __asm { FMOV            V0.2D, #1.0 }
        float64x2_t v34 = _Q0;
        float64x2_t v25 = 0uLL;
      }
      v16->_boundingBox.origin = (CGPoint)v34;
      v16->_boundingBox.CGSize size = (CGSize)vsubq_f64(v25, v34);
      v16->_featureID = a6;
    }
    else if (a4)
    {
      CGSize size = a4->size;
      v15->_boundingBox.origin = a4->origin;
      v15->_boundingBox.CGSize size = size;
      CGFloat x = a4->origin.x;
      size.width = a4->origin.y;
      v44[0] = CGPointCreateDictionaryRepresentation(*(CGPoint *)((char *)&size - 8));
      v45.CGFloat x = a4->origin.x;
      v45.y = a4->origin.y + a4->size.height;
      v44[1] = CGPointCreateDictionaryRepresentation(v45);
      v46.CGFloat x = a4->origin.x + a4->size.width;
      v46.y = a4->origin.y + a4->size.height;
      v44[2] = CGPointCreateDictionaryRepresentation(v46);
      v47.y = a4->origin.y;
      v47.CGFloat x = a4->origin.x + a4->size.width;
      v44[3] = CGPointCreateDictionaryRepresentation(v47);
      v16->_corners = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    }
    else
    {
      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FKTextFeature;
  [(FKTextFeature *)&v3 dealloc];
}

+ (id)featureFromConcompIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 type:(int64_t)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8
{
  int64_t v11 = a6;
  unsigned int v14 = a3;
  v15 = 0;
  int var2 = a5->var2;
  double v17 = 0.5;
  if (!var2) {
    double v17 = 0.0;
  }
  var22 = a4->var22;
  double v19 = (float)(1 << var2);
  v20 = (_WORD *)((char *)var22 + 100 * a3);
  LOWORD(v8) = v20[40];
  double x = a5->var1.x;
  double y = a5->var1.y;
  double v23 = x + v19 * ((double)v8 - v17);
  LOWORD(v9) = v20[41];
  *(double *)&unint64_t v24 = v17 + (double)v9;
  double v25 = x + v19 * *(double *)&v24;
  LOWORD(v24) = v20[42];
  double v26 = y + v19 * ((double)v24 - v17);
  LOWORD(v10) = v20[43];
  double v27 = y + v19 * (v17 + (double)v10);
  double width = (double)(int)a5->var0.width;
  double height = (double)(int)a5->var0.height;
  double v30 = v23 / width;
  double v31 = v26 / height;
  double v32 = (v25 - v23 + 1.0) / width;
  double v33 = (v27 - v26 + 1.0) / height;
  double v52 = v23 / width;
  double v53 = v26 / height;
  double v54 = v32;
  double v55 = v33;
  int64_t v34 = (*a8)++;
  if (a6 == 1 && a7)
  {
    if (*((_DWORD *)var22 + 25 * a3 + 16) == -1)
    {
      v15 = 0;
    }
    else
    {
      int64_t v50 = v34;
      v15 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      uint64_t v37 = 0;
      char v38 = 1;
      do
      {
        char v39 = v38;
        uint64_t v40 = *((unsigned int *)var22 + 25 * a3 + v37 + 16);
        if (v40 == -1) {
          break;
        }
        id v41 = +[FKTextFeature featureFromConcompIndex:v40 session:a4 scaling:a5 type:2 createDiacriticFeatures:0 featureID:a8];
        [v15 addObject:v41];
        [v41 boundingBox];
        v58.origin.double x = v42;
        v58.origin.double y = v43;
        v58.size.double width = v44;
        v58.size.double height = v45;
        v56.origin.double x = v30;
        v56.origin.double y = v31;
        v56.size.double width = v32;
        v56.size.double height = v33;
        CGRect v57 = CGRectUnion(v56, v58);
        double v30 = v57.origin.x;
        double v31 = v57.origin.y;
        double v32 = v57.size.width;
        double v33 = v57.size.height;
        char v38 = 0;
        uint64_t v37 = 1;
      }
      while ((v39 & 1) != 0);
      double v54 = v32;
      double v55 = v33;
      double v52 = v30;
      double v53 = v31;
      unsigned int v14 = a3;
      int64_t v11 = 1;
      int64_t v34 = v50;
    }
  }
  CGPoint v46 = [FKTextFeature alloc];
  LODWORD(v49) = a5->var2;
  CGPoint v47 = [(FKTextFeature *)v46 initWithType:v11 boundingBox:&v52 corners:0 featureID:v34 session:a4 backingIndex:v14 scale:v49];
  [(FKTextFeature *)v47 setSubFeatures:v15];
  return v47;
}

+ (id)featureFromSequenceIndex:(int)a3 session:(FKSession *)a4 scaling:(id *)a5 createConcompFeatures:(BOOL)a6 createDiacriticFeatures:(BOOL)a7 featureID:(int64_t *)a8
{
  unint64_t v9 = a8;
  uint64_t v10 = a7;
  BOOL v11 = a6;
  v12 = a5;
  unsigned int v14 = a3;
  v118[4] = *MEMORY[0x1E4F143B8];
  var29 = a4->var29;
  int v16 = a3;
  double v17 = (char *)var29 + 104 * a3;
  unsigned int v20 = *((unsigned __int16 *)v17 + 12);
  double v19 = (unsigned __int16 *)(v17 + 24);
  unsigned int v18 = v20;
  int v21 = *((_DWORD *)v19 + 2);
  int v22 = *((_DWORD *)v19 + 3);
  int v23 = *((_DWORD *)v19 + 4);
  double v24 = (double)v20;
  int v25 = v19[1];
  double v26 = (double)(v25 + 1);
  if (a5->var2)
  {
    BOOL v27 = v21 > v22;
    int v28 = 2 * (v23 + v21);
    int v116 = v28;
    int v117 = 1;
    int v29 = 2 * (v23 + v22);
    int v115 = v29;
    LOWORD(v118[0]) = 2 * v18 - 1;
    WORD1(v118[0]) = (2 * v25) | 1;
    double v30 = (char *)var29 + 104 * a3;
    int v32 = *((_DWORD *)v30 + 5);
    double v31 = (int *)(v30 + 20);
    WORD2(v118[0]) = 2 * *((_WORD *)v31 + 4) - 1;
    HIWORD(v118[0]) = (2 * *((_WORD *)v31 + 5)) | 1;
    if (v32 < 1)
    {
      double v42 = 0.5;
    }
    else
    {
      v104 = v19 + 1;
      v105 = v19;
      BOOL v106 = a6;
      BOOL v109 = a7;
      uint64_t v33 = 0;
      v108 = var29;
      v113 = (void *)((char *)var29 + 104 * a3 + 8);
      do
      {
        uint64_t v114 = 0;
        var22 = a4->var22;
        int v35 = *(_DWORD *)(*v113 + 4 * v33);
        float64x2_t v36 = (_WORD *)((char *)var22 + 100 * v35);
        LOWORD(v114) = 2 * v36[40] - 1;
        char v37 = 1;
        WORD1(v114) = (2 * v36[41]) | 1;
        WORD2(v114) = 2 * v36[42] - 1;
        HIWORD(v114) = (2 * v36[43]) | 1;
        FKSequenceAdjustSlantedLines((uint64_t)a4, (unsigned __int16 *)v118, (uint64_t)&v114, v27, &v116, &v115, &v117);
        uint64_t v38 = 0;
        do
        {
          int v39 = *((_DWORD *)var22 + 25 * v35 + v38 + 16);
          if (v39 == -1) {
            break;
          }
          char v40 = v37;
          id v41 = (_WORD *)((char *)a4->var22 + 100 * v39);
          LOWORD(v114) = 2 * v41[40] - 1;
          WORD1(v114) = (2 * v41[41]) | 1;
          WORD2(v114) = 2 * v41[42] - 1;
          HIWORD(v114) = (2 * v41[43]) | 1;
          FKSequenceAdjustSlantedLines((uint64_t)a4, (unsigned __int16 *)v118, (uint64_t)&v114, v27, &v116, &v115, &v117);
          char v37 = 0;
          uint64_t v38 = 1;
        }
        while ((v40 & 1) != 0);
        ++v33;
      }
      while (v33 < *v31);
      int v29 = v115;
      int v28 = v116;
      double v42 = (double)v117 * 0.5;
      unsigned int v18 = *v105;
      int v25 = *v104;
      unint64_t v9 = a8;
      uint64_t v10 = v109;
      int v16 = a3;
      var29 = v108;
      BOOL v11 = v106;
    }
    double v43 = (double)v28 * 0.5;
    double v44 = (double)v29 * 0.5;
    unint64_t v8 = -0.5;
    double v24 = v24 + -0.5;
    double v26 = v26 + 0.5;
    unsigned int v14 = a3;
    v12 = a5;
  }
  else
  {
    double v43 = (double)v21;
    double v44 = (double)v22;
    double v42 = (double)v23;
  }
  CGFloat v45 = (_WORD *)((char *)var29 + 104 * v16 + 28);
  if (v44 >= v43)
  {
    LOWORD(v8) = *v45;
    double v46 = (double)v8;
    double v47 = (double)(*((unsigned __int16 *)var29 + 52 * v16 + 15) + 1);
  }
  else
  {
    double v46 = (double)(*((unsigned __int16 *)var29 + 52 * v16 + 15) + 1);
    LOWORD(v8) = *v45;
    double v47 = (double)v8;
  }
  double v48 = v43 + v42;
  double v49 = (double)(v25 + 1);
  double v50 = v44 + v42;
  double v51 = (double)v18 - (v44 - v43);
  double v52 = v26 - v24 + v46;
  double v53 = v49 - (v44 - v43);
  double v54 = v26 - v24 + v47;
  double v55 = (double)v18 * v52 - v46 * v51;
  double v56 = (double)v18 - v51;
  double v57 = v24 * v44 - v43 * v26;
  double v58 = v43 - v44;
  double v59 = v46 - v52;
  double v60 = v56 * v58 - (v46 - v52) * (v24 - v26);
  double v61 = (v55 * (v24 - v26) - v56 * v57) / v60;
  double v62 = (v55 * v58 - (v46 - v52) * v57) / v60;
  double v63 = v24 * v50 - v48 * v26;
  double v64 = v48 - v50;
  double v65 = v56 * v64 - v59 * (v24 - v26);
  double v66 = (v55 * (v24 - v26) - v56 * v63) / v65;
  double v67 = (v55 * v64 - v59 * v63) / v65;
  double v68 = v49 * v54 - v47 * v53;
  double v69 = v49 - v53;
  double v70 = v68 * (v24 - v26) - v69 * v57;
  double v71 = v47 - v54;
  double v72 = v68 * v58 - v71 * v57;
  double v73 = -(v71 * (v24 - v26));
  double v74 = v69 * v58 - v71 * (v24 - v26);
  double v75 = v70 / v74;
  double v76 = v72 / v74;
  double v77 = v68 * v64 - v71 * v63;
  double v78 = v73 + v69 * v64;
  double v79 = (v68 * (v24 - v26) - v69 * v63) / v78;
  double v80 = v77 / v78;
  double v81 = (float)(1 << v12->var2);
  double x = v12->var1.x;
  double y = v12->var1.y;
  double height = v12->var0.height;
  v119.double x = (x + v81 * v61) / v12->var0.width;
  v119.double y = (y + v81 * v62) / height;
  CGFloat v85 = (x + v81 * v66) / v12->var0.width;
  CGFloat v86 = (y + v81 * v67) / height;
  CGFloat v87 = (x + v81 * v75) / v12->var0.width;
  CGFloat v88 = (y + v81 * v76) / height;
  CGFloat v89 = (x + v81 * v79) / v12->var0.width;
  CGFloat v90 = (y + v81 * v80) / height;
  v118[0] = CGPointCreateDictionaryRepresentation(v119);
  v120.double x = v85;
  v120.double y = v86;
  v118[1] = CGPointCreateDictionaryRepresentation(v120);
  v121.double x = v89;
  v121.double y = v90;
  v118[2] = CGPointCreateDictionaryRepresentation(v121);
  v122.double x = v87;
  v122.double y = v88;
  v118[3] = CGPointCreateDictionaryRepresentation(v122);
  uint64_t v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:4];
  v92 = [FKTextFeature alloc];
  LODWORD(v103) = v12->var2;
  v93 = [(FKTextFeature *)v92 initWithType:0 boundingBox:0 corners:v91 featureID:(*v9)++ session:a4 backingIndex:v14 scale:v103];
  if (v11)
  {
    v94 = (char *)var29 + 104 * v16;
    int v96 = *((_DWORD *)v94 + 5);
    v95 = (int *)(v94 + 20);
    if (v96 >= 1)
    {
      int v97 = v16;
      v98 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      if (*v95 >= 1)
      {
        v99 = var29;
        uint64_t v100 = 0;
        v101 = (void *)((char *)v99 + 104 * v97 + 8);
        do
          objc_msgSend(v98, "addObject:", +[FKTextFeature featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:](FKTextFeature, "featureFromConcompIndex:session:scaling:type:createDiacriticFeatures:featureID:", *(unsigned int *)(*v101 + 4 * v100++), a4, v12, 1, v10, v9));
        while (v100 < *v95);
      }
      [(FKTextFeature *)v93 setSubFeatures:v98];
    }
  }
  return v93;
}

- (NSArray)candidates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  candidates = self->_candidates;
  if (!candidates)
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    FKRecognizeGetCandidates((uint64_t)self->_session->var22 + 100 * self->_backingIndex.seqInd, (int *)v13, v11);
    candidates = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = 0; i != 56; i += 4)
    {
      if (!*(_DWORD *)((char *)v13 + i)) {
        break;
      }
      v5 = [FKTextCandidate alloc];
      uint64_t v6 = [NSString stringWithUTF8String:(char *)v11 + i];
      *(float *)&double v7 = (float)*(int *)((char *)v13 + i) / 100.0;
      unint64_t v8 = [(FKTextCandidate *)v5 initWithText:v6 confidence:v7];
      unint64_t v9 = v8;
      [(NSArray *)candidates addObject:v8];
    }
    self->_candidates = candidates;
  }
  return candidates;
}

- (int64_t)featureID
{
  return self->_featureID;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)corners
{
  return self->_corners;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (NSArray)subFeatures
{
  return self->_subFeatures;
}

- (void)setSubFeatures:(id)a3
{
}

@end