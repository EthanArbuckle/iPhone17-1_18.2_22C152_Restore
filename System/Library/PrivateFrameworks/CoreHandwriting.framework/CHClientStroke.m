@interface CHClientStroke
+ (id)strokesFromDrawing:(id)a3 classification:(int64_t)a4;
+ (int64_t)strokeIdentifierOffset;
+ (void)setStrokeIdentifierOffset:(int64_t)a3;
- (BOOL)isFinished;
- (CGRect)boundingBox;
- (CHClientStroke)initWithAllPoints:(CHClientStrokePoint *)a3 pointCount:(int64_t)a4 type:(int64_t)a5;
- (CHClientStroke)initWithArray:(id)a3 channels:(id)a4 withTimeOffset:(double)a5 type:(int64_t)a6;
- (CHClientStrokePoint)pointAtIndex:(SEL)a3;
- (CHClientStrokePoint)points;
- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier;
- (CHStrokeIdentifier)strokeIdentifier;
- (NSString)description;
- (double)_strokePathLength;
- (double)endTimestamp;
- (double)startTimestamp;
- (id)newStrokeWithTransformation:(id)a3;
- (id)newStrokeWithoutTransformation;
- (int64_t)identifier;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)pointsCapacity;
- (unint64_t)pointsCount;
- (unint64_t)strokeAttributes;
- (void)_expandPointsArrayIfNeeded;
- (void)addAllPoints:(CHClientStrokePoint *)a3 count:(int64_t)a4;
- (void)addPoint:(CHClientStrokePoint *)a3;
- (void)dealloc;
- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4;
- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4;
- (void)setBoundingBox:(CGRect)a3;
- (void)setEncodedStrokeIdentifier:(id)a3;
- (void)setPoints:(CHClientStrokePoint *)a3;
- (void)setPointsCapacity:(unint64_t)a3;
- (void)setPointsCount:(unint64_t)a3;
- (void)setStrokeAttributes:(unint64_t)a3;
@end

@implementation CHClientStroke

- (CHClientStroke)initWithArray:(id)a3 channels:(id)a4 withTimeOffset:(double)a5 type:(int64_t)a6
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v14 = v9;
    objc_msgSend_valueForKey_(v9, v10, @"x", v11, v12, v13);
  }
  else
  {
    v14 = &unk_1F203CF40;
    objc_msgSend_valueForKey_(&unk_1F203CF40, v10, @"x", v11, v12, v13);
  v15 = };
  int v21 = objc_msgSend_intValue(v15, v16, v17, v18, v19, v20);

  v26 = objc_msgSend_valueForKey_(v14, v22, @"y", v23, v24, v25);
  int v32 = objc_msgSend_intValue(v26, v27, v28, v29, v30, v31);

  v41 = objc_msgSend_valueForKey_(v14, v33, @"t", v34, v35, v36);
  if (v41)
  {
    v42 = objc_msgSend_valueForKey_(v14, v37, @"t", v38, v39, v40);
    int v180 = objc_msgSend_intValue(v42, v43, v44, v45, v46, v47);
    unint64_t v177 = v180;
  }
  else
  {
    int v180 = -1;
    unint64_t v177 = -1;
  }

  v56 = objc_msgSend_valueForKey_(v14, v48, @"azimuth", v49, v50, v51);
  if (v56)
  {
    v57 = objc_msgSend_valueForKey_(v14, v52, @"azimuth", v53, v54, v55);
    int v179 = objc_msgSend_intValue(v57, v58, v59, v60, v61, v62);
    unint64_t v176 = v179;
  }
  else
  {
    int v179 = -1;
    unint64_t v176 = -1;
  }

  v71 = objc_msgSend_valueForKey_(v14, v63, @"altitude", v64, v65, v66);
  if (v71)
  {
    v72 = objc_msgSend_valueForKey_(v14, v67, @"altitude", v68, v69, v70);
    unint64_t v78 = (int)objc_msgSend_intValue(v72, v73, v74, v75, v76, v77);
  }
  else
  {
    unint64_t v78 = -1;
  }

  v87 = objc_msgSend_valueForKey_(v14, v79, @"force", v80, v81, v82);
  v172 = v14;
  if (v87)
  {
    v88 = objc_msgSend_valueForKey_(v14, v83, @"force", v84, v85, v86, v14);
    unint64_t v94 = (int)objc_msgSend_intValue(v88, v89, v90, v91, v92, v93);
  }
  else
  {
    unint64_t v94 = -1;
  }

  size_t v100 = objc_msgSend_count(v8, v95, v96, v97, v98, v99);
  v181 = (char *)malloc_type_calloc(v100, 0x30uLL, 0x1000040EED21634uLL);
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id obj = v8;
  uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v182, (uint64_t)v186, 16, v102);
  if (v103)
  {
    uint64_t v109 = v103;
    uint64_t v110 = 0;
    uint64_t v178 = v21;
    uint64_t v111 = *(void *)v183;
    double v112 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v109; ++i)
      {
        if (*(void *)v183 != v111) {
          objc_enumerationMutation(obj);
        }
        v115 = *(void **)(*((void *)&v182 + 1) + 8 * i);
        if (objc_msgSend_count(v115, v104, v105, v106, v107, v108, v172))
        {
          if ((v180 & 0x80000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v177)
          {
            v116 = objc_msgSend_objectAtIndex_(v115, v104, v177, v106, v107, v108);
            objc_msgSend_doubleValue(v116, v117, v118, v119, v120, v121);
            double v112 = v122;
          }
          v123 = objc_msgSend_objectAtIndex_(v115, v104, v178, v106, v107, v108);
          objc_msgSend_floatValue(v123, v124, v125, v126, v127, v128);
          float v130 = v129;
          v135 = objc_msgSend_objectAtIndex_(v115, v131, v32, v132, v133, v134);
          objc_msgSend_floatValue(v135, v136, v137, v138, v139, v140);
          float v142 = v141;

          double v143 = 0.0;
          double v144 = 0.0;
          if ((v179 & 0x80000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v176)
          {
            v145 = objc_msgSend_objectAtIndex_(v115, v104, v176, v106, v107, v108);
            objc_msgSend_floatValue(v145, v146, v147, v148, v149, v150);
            double v144 = v151;
          }
          if ((v78 & 0x8000000000000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v78)
          {
            v152 = objc_msgSend_objectAtIndex_(v115, v104, v78, v106, v107, v108);
            objc_msgSend_floatValue(v152, v153, v154, v155, v156, v157);
            double v143 = v158;
          }
          double v159 = 0.0;
          if ((v94 & 0x8000000000000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v94)
          {
            v160 = objc_msgSend_objectAtIndex_(v115, v104, v94, v106, v107, v108);
            objc_msgSend_floatValue(v160, v161, v162, v163, v164, v165);
            double v159 = v166;
          }
          v114 = (double *)&v181[48 * v110];
          double *v114 = v130;
          v114[1] = v142;
          v114[2] = v112 + a5;
          v114[3] = v144;
          v114[4] = v143;
          v114[5] = v159;
          ++v110;
          double v112 = v112 + 0.00416666667;
        }
      }
      uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v104, (uint64_t)&v182, (uint64_t)v186, 16, v108);
    }
    while (v109);
  }
  else
  {
    uint64_t v110 = 0;
  }

  v167 = [CHClientStroke alloc];
  v170 = (CHClientStroke *)objc_msgSend_initWithAllPoints_pointCount_type_(v167, v168, (uint64_t)v181, v110, a6, v169);
  free(v181);

  return v170;
}

- (CHClientStroke)initWithAllPoints:(CHClientStrokePoint *)a3 pointCount:(int64_t)a4 type:(int64_t)a5
{
  if (qword_1EA3C90C0 != -1) {
    dispatch_once(&qword_1EA3C90C0, &unk_1F2012A10);
  }
  v21.receiver = self;
  v21.super_class = (Class)CHClientStroke;
  id v9 = [(CHClientStroke *)&v21 init];
  v10 = (CHClientStroke *)v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v9 + 88) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v9 + 104) = v11;
    *((void *)v9 + 6) = a5;
    *((void *)v9 + 7) = 1;
    uint64_t v12 = (void *)*((void *)v9 + 10);
    *((void *)v9 + 10) = 0;

    v10->_isFinished = 1;
    uint64_t v13 = qword_1EA3C90C8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C49A3810;
    block[3] = &unk_1E64E16D8;
    v14 = v10;
    uint64_t v20 = v14;
    dispatch_sync(v13, block);
    objc_msgSend_addAllPoints_count_(v14, v15, (uint64_t)a3, a4, v16, v17);
  }
  return v10;
}

- (NSString)description
{
  v22.receiver = self;
  v22.super_class = (Class)CHClientStroke;
  v3 = [(CHClientStroke *)&v22 description];
  id v9 = objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_pointsCount(self, v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_stringByAppendingFormat_(v3, v16, @" Identifier: %@, Points: %ld", v17, v18, v19, v9, v15);

  return (NSString *)v20;
}

- (void)dealloc
{
  points = self->_points;
  if (points) {
    free(points);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHClientStroke;
  [(CHClientStroke *)&v4 dealloc];
}

+ (int64_t)strokeIdentifierOffset
{
  return qword_1EA3C9D38;
}

+ (void)setStrokeIdentifierOffset:(int64_t)a3
{
  qword_1EA3C9D38 = a3;
}

+ (id)strokesFromDrawing:(id)a3 classification:(int64_t)a4
{
  int64_t v71 = a4;
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  if (objc_msgSend_strokeCount(v4, v11, v12, v13, v14, v15))
  {
    unint64_t v21 = 0;
    do
    {
      uint64_t v35 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20, v71);
      if (objc_msgSend_pointCountForStrokeIndex_(v4, v36, v21, v37, v38, v39))
      {
        unint64_t v43 = 0;
        do
        {
          objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v40, v21, v43, v41, v42);
          double v45 = v44;
          uint64_t v51 = objc_msgSend_numberWithDouble_(NSNumber, v46, v47, v48, v49, v50);
          v72[0] = v51;
          v57 = objc_msgSend_numberWithDouble_(NSNumber, v52, v53, v54, v55, v56, v45);
          v72[1] = v57;
          uint64_t v61 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v58, (uint64_t)v72, 2, v59, v60);
          objc_msgSend_addObject_(v35, v62, (uint64_t)v61, v63, v64, v65);

          ++v43;
        }
        while (v43 < objc_msgSend_pointCountForStrokeIndex_(v4, v66, v21, v67, v68, v69));
      }
      objc_super v22 = [CHClientStroke alloc];
      uint64_t v25 = objc_msgSend_initWithArray_channels_withTimeOffset_type_(v22, v23, (uint64_t)v35, 0, v71, v24, 0.0);
      objc_msgSend_addObject_(v10, v26, (uint64_t)v25, v27, v28, v29);

      ++v21;
    }
    while (v21 < objc_msgSend_strokeCount(v4, v30, v31, v32, v33, v34));
  }

  return v10;
}

- (CHClientStrokePoint)pointAtIndex:(SEL)a3
{
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0 = 0u;
  result = (CHClientStrokePoint *)objc_msgSend_points(self, a3, a4, v4, v5, v6);
  v10 = &result[a4];
  long long v11 = *(_OWORD *)&v10->var1;
  retstr->var0 = v10->var0;
  *(_OWORD *)&retstr->var1 = v11;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&v10->var3;
  return result;
}

- (void)addAllPoints:(CHClientStrokePoint *)a3 count:(int64_t)a4
{
  if (a4 >= 1)
  {
    uint64_t v13 = v6;
    uint64_t v14 = v7;
    int64_t v8 = a4;
    do
    {
      long long v11 = *(_OWORD *)&a3->var1;
      v12[0] = a3->var0;
      v12[1] = v11;
      v12[2] = *(_OWORD *)&a3->var3;
      objc_msgSend_addPoint_(self, a2, (uint64_t)v12, a4, v4, v5);
      ++a3;
      --v8;
    }
    while (v8);
  }
}

- (void)addPoint:(CHClientStrokePoint *)a3
{
  objc_msgSend_boundingBox(self, a2, (uint64_t)a3, v3, v4, v5);
  if (CGRectIsNull(v32)) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = 24;
  }
  *(Class *)((char *)&self->super.isa + v13) = *(Class *)&a3->var1;
  objc_msgSend__expandPointsArrayIfNeeded(self, v8, v9, v10, v11, v12);
  unint64_t pointsCount = self->_pointsCount;
  objc_msgSend_setPointsCount_(self, v15, pointsCount + 1, v16, v17, v18);
  uint64_t v28 = objc_msgSend_points(self, v19, v20, v21, v22, v23) + 48 * pointsCount;
  long long v30 = *(_OWORD *)&a3->var1;
  long long v29 = *(_OWORD *)&a3->var3;
  *(CGPoint *)uint64_t v28 = a3->var0;
  *(_OWORD *)(v28 + 16) = v30;
  *(_OWORD *)(v28 + 32) = v29;
  MEMORY[0x1F4181798](self, sel_setBoundingBox_, v24, v25, v26, v27);
}

- (void)_expandPointsArrayIfNeeded
{
  if (!objc_msgSend_points(self, a2, v2, v3, v4, v5))
  {
    objc_msgSend_setPointsCapacity_(self, v7, 200, v9, v10, v11);
    size_t v28 = objc_msgSend_pointsCapacity(self, v23, v24, v25, v26, v27);
    long long v29 = malloc_type_calloc(v28, 0x30uLL, 0x1000040EED21634uLL);
    uint64_t v33 = self;
    goto _objc_msgSend$setPoints_;
  }
  unint64_t v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  if (v12 >= objc_msgSend_pointsCapacity(self, v13, v14, v15, v16, v17))
  {
    uint64_t v34 = objc_msgSend_pointsCapacity(self, v18, v19, v20, v21, v22);
    objc_msgSend_setPointsCapacity_(self, v35, v34 + 200, v36, v37, v38);
    double v44 = objc_msgSend_points(self, v39, v40, v41, v42, v43);
    uint64_t v50 = objc_msgSend_pointsCapacity(self, v45, v46, v47, v48, v49);
    long long v29 = malloc_type_realloc(v44, 48 * v50, 0x1000040EED21634uLL);
    uint64_t v33 = self;
_objc_msgSend$setPoints_:
    MEMORY[0x1F4181798](v33, sel_setPoints_, v29, v30, v31, v32);
  }
}

- (CHStrokeIdentifier)strokeIdentifier
{
  return (CHStrokeIdentifier *)objc_msgSend_numberWithInteger_(NSNumber, a2, self->_identifier, v2, v3, v4);
}

- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier
{
  encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
  if (encodedStrokeIdentifier)
  {
  }
  else
  {
    uint64_t v5 = [CHEncodedStrokeIdentifier alloc];
    uint64_t v6 = (void *)MEMORY[0x1E4F28DB0];
    unint64_t v12 = objc_msgSend_strokeIdentifier(self, v7, v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v6, v13, (uint64_t)v12, 1, 0, v14);
    uint64_t v20 = (CHEncodedStrokeIdentifier *)objc_msgSend_initWithData_(v5, v16, (uint64_t)v15, v17, v18, v19);
    uint64_t v21 = self->_encodedStrokeIdentifier;
    self->_encodedStrokeIdentifier = v20;

    encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
  }
  return encodedStrokeIdentifier;
}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, unsigned char *, double, double, double))a4;
  uint64_t v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  if (v12 >= 1)
  {
    uint64_t v17 = v12;
    char v26 = 0;
    objc_msgSend_pointAtIndex_(self, v13, 0, v14, v15, v16);
    v6[2](v6, &v26, 0.0, 0.0, 0.0);
    if (v17 != 1 && !v26)
    {
      for (uint64_t i = 1; i != v17; ++i)
      {
        char v26 = 0;
        if (i == v17 - 1 || i == i / (uint64_t)(a3 / 0.00416666667) * (uint64_t)(a3 / 0.00416666667))
        {
          objc_msgSend_pointAtIndex_(self, v18, i, v19, v20, v21, 0, 0, 0, 0, 0, 0);
          v6[2](v6, &v26, v23, v24, v25);
          if (v26) {
            break;
          }
        }
      }
    }
  }
}

- (double)_strokePathLength
{
  uint64_t v7 = objc_msgSend_pointsCount(self, a2, v2, v3, v4, v5);
  double v12 = 0.0;
  if (v7 >= 2)
  {
    uint64_t v13 = v7;
    for (uint64_t i = 1; i != v13; ++i)
    {
      objc_msgSend_pointAtIndex_(self, v8, i - 1, v9, v10, v11);
      objc_msgSend_pointAtIndex_(self, v15, i, v16, v17, v18);
      float32x2_t v19 = vsub_f32(vcvt_f32_f64((float64x2_t)0), vcvt_f32_f64((float64x2_t)0));
      double v12 = v12 + sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    }
  }
  return v12;
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  uint64_t v6 = a4;
  uint64_t v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  unsigned __int8 v50 = 0;
  objc_msgSend__strokePathLength(self, v13, v14, v15, v16, v17);
  double v19 = v18;
  objc_msgSend_pointAtIndex_(self, v20, 0, v21, v22, v23);
  __n128 v28 = ((__n128 (*)(void *, unsigned __int8 *, double, double, double))v6[2])(v6, &v50, 0.0, 0.0, 0.0);
  double v29 = 0.0;
  v28.n128_u64[0] = 0;
  __n128 v49 = v28;
  int v30 = v50;
  if (!v50 && v19 >= a3 && v12 >= 2)
  {
    double v31 = 0.0;
    for (uint64_t i = 1; i != v12; ++i)
    {
      objc_msgSend_pointAtIndex_(self, v24, i - 1, v25, v26, v27, *(_OWORD *)&v49);
      objc_msgSend_pointAtIndex_(self, v33, i, v34, v35, v36);
      float32x2_t v37 = vcvt_f32_f64((float64x2_t)0);
      float32x2_t v38 = v37;
      float32x2_t v39 = vsub_f32(v37, v37);
      double v40 = sqrtf(vaddv_f32(vmul_f32(v39, v39)));
      double v31 = v31 + v40;
      int v30 = v50;
      BOOL v41 = v50 == 0;
      if (!v50 && v31 >= a3)
      {
        double v42 = 0.0;
        do
        {
          double v43 = (v40 - (v31 - a3)) / v40;
          float v44 = v43;
          float32x2_t v37 = vmla_n_f32(v37, vsub_f32(v38, v37), v44);
          float64x2_t v45 = vcvtq_f64_f32(v37);
          double v42 = v42 + v43 * (0.0 - v42);
          double v29 = v45.f64[1];
          __n128 v49 = (__n128)v45;
          ((void (*)(void *, unsigned __int8 *))v6[2])(v6, &v50);
          float32x2_t v46 = vsub_f32(v37, v38);
          float v47 = sqrtf(vaddv_f32(vmul_f32(v46, v46)));
          double v31 = v47;
          int v30 = v50;
          BOOL v41 = v50 == 0;
          if (v50) {
            break;
          }
          double v40 = v47;
        }
        while (v31 >= a3);
      }
      if (!v41) {
        break;
      }
    }
  }
  if (!v30 && v12 >= 2)
  {
    objc_msgSend_pointAtIndex_(self, v24, v12 - 1, v25, v26, v27);
    if (v49.n128_f64[0] != 0.0 || v29 != 0.0) {
      ((void (*)(void *, unsigned __int8 *))v6[2])(v6, &v50);
    }
  }
}

- (unint64_t)hash
{
  return (unint64_t)((self->_startTimestamp - (double)(unint64_t)self->_startTimestamp) * 1000.0)
       + ((unint64_t)((self->_endTimestamp - (double)(unint64_t)self->_endTimestamp) * 1000.0) << 10);
}

- (id)newStrokeWithTransformation:(id)a3
{
  uint64_t v4 = (double (**)(void, double, double))a3;
  size_t v10 = objc_msgSend_pointsCount(self, v5, v6, v7, v8, v9);
  uint64_t v11 = (char *)malloc_type_calloc(v10, 0x30uLL, 0x1000040EED21634uLL);
  if (self->_pointsCount)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = &self->_points[v12];
      long long v25 = *(_OWORD *)&v14->var1;
      double var3 = v14->var3;
      double var4 = v14->var4;
      double v17 = v4[2](v4, v14->var0.x, v14->var0.y);
      double v18 = &v11[v12 * 48];
      *(double *)double v18 = v17;
      *((void *)v18 + 1) = v19;
      *((_OWORD *)v18 + 1) = v25;
      *((double *)v18 + 4) = var3;
      *((double *)v18 + 5) = var4;
      ++v13;
      ++v12;
    }
    while (v13 < self->_pointsCount);
  }
  uint64_t v20 = [CHClientStroke alloc];
  uint64_t v23 = objc_msgSend_initWithAllPoints_pointCount_type_(v20, v21, (uint64_t)v11, self->_pointsCount, self->_type, v22);
  free(v11);

  return v23;
}

- (id)newStrokeWithoutTransformation
{
  uint64_t v3 = [CHClientStroke alloc];
  points = self->_points;
  unint64_t pointsCount = self->_pointsCount;
  int64_t type = self->_type;
  return (id)objc_msgSend_initWithAllPoints_pointCount_type_(v3, v4, (uint64_t)points, pointsCount, type, v5);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)pointsCount
{
  return self->_pointsCount;
}

- (void)setPointsCount:(unint64_t)a3
{
  self->_unint64_t pointsCount = a3;
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

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)strokeAttributes
{
  return self->_strokeAttributes;
}

- (void)setStrokeAttributes:(unint64_t)a3
{
  self->_strokeAttributes = a3;
}

- (CHClientStrokePoint)points
{
  return self->_points;
}

- (void)setPoints:(CHClientStrokePoint *)a3
{
  self->_points = a3;
}

- (unint64_t)pointsCapacity
{
  return self->_pointsCapacity;
}

- (void)setPointsCapacity:(unint64_t)a3
{
  self->_pointsCapacitdouble y = a3;
}

- (void)setEncodedStrokeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end