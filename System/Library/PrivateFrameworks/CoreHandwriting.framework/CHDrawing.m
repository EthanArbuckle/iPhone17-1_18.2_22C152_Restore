@interface CHDrawing
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDrawing:(id)a3;
- (BOOL)isPrefixForDrawing:(id)a3;
- (CGPoint)centroidForStrokeIndexes:(id)a3;
- (CGPoint)pointForStrokeIndex:(unint64_t)a3 pointIndex:(unint64_t)a4;
- (CGRect)bounds;
- (CGRect)boundsForStrokeIndex:(unint64_t)a3;
- (CGRect)boundsForStrokeIndexes:(id)a3;
- (CHDrawing)drawingWithLastStrokes:(int64_t)a3;
- (CHDrawing)drawingWithStrokesFromIndexArray:(id)a3;
- (CHDrawing)drawingWithStrokesFromIndexSet:(id)a3;
- (CHDrawing)initWithCoder:(id)a3;
- (CHDrawing)initWithContentsOfFile:(id)a3;
- (CHDrawing)initWithContentsOfJSONDictionary:(id)a3;
- (CHDrawing)initWithContentsOfXYString:(id)a3;
- (Matrix<float>)bitmapRepresentationForSize:(SEL)a3;
- (Matrix<float>)orientationRepresentationForSampling:(SEL)a3 convolutionWidth:(unint64_t)a4;
- (_NSRange)matchingStrokePrefixRangeForDrawing:(id)a3;
- (double)averageCharacterHeightEstimation:(double)a3 minChunkHeight:(double)a4;
- (double)endTimeForStroke:(unint64_t)a3;
- (double)startTimeForStroke:(unint64_t)a3;
- (float)cumulativePointToPointDistance;
- (float)distanceBetweenFirstAndLastPoint;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)drawingByRemovingUnnaturalHorizontalGaps:(double)a3;
- (id)drawingResampledWithCatmullRomSplineInterpolation:(double)a3;
- (id)drawingScaledByFactor:(double)a3;
- (id)drawingSpatiallyResampled:(double)a3;
- (id)drawingSpatiallyResampled:(double)a3 maxPointsPerStroke:(int64_t)a4;
- (id)drawingSpatiallyResampled:(double)a3 outputPointMap:(void *)a4;
- (id)drawingTransformedWithTranslation:(CGVector)a3 scaleFactor:(double)a4;
- (id)indexesOfStrokesSmallerThanSize:(CGSize)a3;
- (id)jsonRepresentationWithContext:(id)a3;
- (id)newDrawingWithAffineTransform:(CGAffineTransform *)a3;
- (id)newDrawingWithTransform:(id)a3;
- (id)singleStrokeDrawing;
- (id)sortedDrawingUsingMinXCoordinate;
- (id)sortedDrawingUsingStrokeMidPoint:(id *)a3;
- (id)sortedDrawingUsingStrokeMidPointHorizontalOverlapAware:(id *)a3 shouldSortRTL:(BOOL)a4;
- (id)xyRepresentation;
- (unint64_t)hash;
- (unint64_t)pointCount;
- (unint64_t)pointCountForStrokeIndex:(unint64_t)a3;
- (unint64_t)strokeCount;
- (vector<long,)strokeIndicesSortedByMinXCoordinate;
- (void)addEndTime:(double)a3;
- (void)addPoint:(CGPoint)a3;
- (void)addStartTime:(double)a3;
- (void)appendDrawing:(id)a3;
- (void)appendSegment:(id)a3 fromDrawing:(id)a4;
- (void)clear;
- (void)encodeWithCoder:(id)a3;
- (void)endStroke;
- (void)setLineHeight:(double)a3;
- (void)writeToFile;
- (void)writeToFileWithContext:(id)a3 folder:(id)a4 basename:(id)a5;
@end

@implementation CHDrawing

- (CHDrawing)initWithContentsOfFile:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CHDrawing;
  v10 = [(CHDrawing *)&v50 init];
  if (!v10) {
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend_length(v4, v5, v6, v7, v8, v9) < 5
    || (uint64_t v16 = objc_msgSend_length(v4, v11, v12, v13, v14, v15),
        objc_msgSend_substringFromIndex_(v4, v17, v16 - 4, v18, v19, v20),
        v21 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v21, v22, @"json", v23, v24, v25),
        v21,
        !isEqualToString))
  {
    id v42 = v4;
    v47 = (const char *)objc_msgSend_cStringUsingEncoding_(v42, v43, 4, v44, v45, v46);
    CHDrawingStrokes::readCharacter(&v10->_drawing, v47);
LABEL_12:
    v41 = v10;
    goto LABEL_13;
  }
  v33 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], v27, (uint64_t)v4, v28, v29, v30);
  if (!v33)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v34 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v4;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_ERROR, "Could not read data from file %@", buf, 0xCu);
    }
  }
  id v49 = 0;
  v35 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v31, (uint64_t)v33, 1, (uint64_t)&v49, v32);
  id v36 = v49;
  v41 = (CHDrawing *)(id)objc_msgSend_initWithContentsOfJSONDictionary_(v10, v37, (uint64_t)v35, v38, v39, v40);

LABEL_13:
  return v41;
}

- (CHDrawing)initWithContentsOfXYString:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CHDrawing;
  uint64_t v8 = [(CHDrawing *)&v76 init];
  if (v8)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v9 = objc_msgSend_componentsSeparatedByString_(v71, v4, @"\n", v5, v6, v7);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v72, (uint64_t)v77, 16, v11);
    if (v16)
    {
      uint64_t v17 = *(void *)v73;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v73 != v17) {
            objc_enumerationMutation(v9);
          }
          uint64_t v19 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v72 + 1) + 8 * v18), v12, @" ", v13, v14, v15);
          if ((unint64_t)objc_msgSend_count(v19, v20, v21, v22, v23, v24) < 2)
          {
            if (objc_msgSend_count(v19, v25, v26, v27, v28, v29) == 1)
            {
              v59 = objc_msgSend_objectAtIndexedSubscript_(v19, v55, 0, v56, v57, v58);
              int isEqualToString = objc_msgSend_isEqualToString_(v59, v60, @";", v61, v62, v63);

              if (isEqualToString) {
                objc_msgSend_endStroke(v8, v65, v66, v67, v68, v69);
              }
            }
          }
          else
          {
            uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v19, v25, 0, v27, v28, v29);
            objc_msgSend_floatValue(v30, v31, v32, v33, v34, v35);
            float v37 = v36;
            id v42 = objc_msgSend_objectAtIndexedSubscript_(v19, v38, 1, v39, v40, v41);
            objc_msgSend_floatValue(v42, v43, v44, v45, v46, v47);
            float v49 = v48;

            objc_msgSend_addPoint_(v8, v50, v51, v52, v53, v54, v37, v49);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v72, (uint64_t)v77, 16, v15);
      }
      while (v16);
    }
  }
  return v8;
}

- (CHDrawing)initWithContentsOfJSONDictionary:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  v107.receiver = self;
  v107.super_class = (Class)CHDrawing;
  uint64_t v8 = [(CHDrawing *)&v107 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(v95, v4, @"channel", v5, v6, v7);
    BOOL v10 = v9 == 0;

    if (v10)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 1;
    }
    else
    {
      uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v95, v11, @"channel", v12, v13, v14);
      uint64_t v20 = objc_msgSend_objectForKey_(v15, v16, @"x", v17, v18, v19);
      BOOL v21 = v20 == 0;

      if (v21)
      {
        uint64_t v32 = 0;
      }
      else
      {
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v15, v22, @"x", v23, v24, v25);
        uint64_t v32 = objc_msgSend_integerValue(v26, v27, v28, v29, v30, v31);
      }
      uint64_t v34 = objc_msgSend_objectForKey_(v15, v22, @"y", v23, v24, v25);
      BOOL v35 = v34 == 0;

      if (v35)
      {
        uint64_t v33 = 1;
      }
      else
      {
        uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v15, v36, @"y", v37, v38, v39);
        uint64_t v33 = objc_msgSend_integerValue(v40, v41, v42, v43, v44, v45);
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v95, v11, @"data", v12, v13, v14);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v103, (uint64_t)v109, 16, v47);
    if (v48)
    {
      uint64_t v97 = *(void *)v104;
      do
      {
        uint64_t v98 = v48;
        for (uint64_t i = 0; i != v98; ++i)
        {
          if (*(void *)v104 != v97) {
            objc_enumerationMutation(obj);
          }
          objc_super v50 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v51 = v50;
          uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v99, (uint64_t)v108, 16, v53);
          if (v58)
          {
            uint64_t v59 = *(void *)v100;
            do
            {
              for (uint64_t j = 0; j != v58; ++j)
              {
                if (*(void *)v100 != v59) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v61 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(v61, v54, v32, v55, v56, v57);
                objc_msgSend_floatValue(v62, v63, v64, v65, v66, v67);
                float v69 = v68;
                long long v74 = objc_msgSend_objectAtIndexedSubscript_(v61, v70, v33, v71, v72, v73);
                objc_msgSend_floatValue(v74, v75, v76, v77, v78, v79);
                float v81 = v80;

                objc_msgSend_addPoint_(v8, v82, v83, v84, v85, v86, v69, v81);
              }
              uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v99, (uint64_t)v108, 16, v57);
            }
            while (v58);
          }

          objc_msgSend_endStroke(v8, v87, v88, v89, v90, v91);
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v92, (uint64_t)&v103, (uint64_t)v109, 16, v93);
      }
      while (v48);
    }
  }
  return v8;
}

- (CHDrawing)initWithCoder:(id)a3
{
  STACK[0xE18] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CHDrawing;
  uint64_t v5 = [(CHDrawing *)&v92 init];
  if (v5)
  {
    uint64_t v86 = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_opt_class();
    float v81 = objc_msgSend_setWithObjects_(v6, v8, v7, v9, v10, v11);
    uint64_t v83 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v81, @"drawingStrokes", v13, v14);
    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v81, @"drawingStrokesTimeStamps", v16, v17);
    if (v83)
    {
      sub_1C49C5610((uint64_t)&STACK[0xB20]);
      if (objc_msgSend_count(v83, v19, v20, v21, v22, v23))
      {
        uint64_t v24 = (void *)((unint64_t)&STACK[0xB20] | 0x60);
        unint64_t v25 = STACK[0xB80];
        if (STACK[0xB80])
        {
          unint64_t v26 = STACK[0xB88];
          uint64_t v27 = (void *)STACK[0xB80];
          if (STACK[0xB88] != v25)
          {
            unint64_t v28 = STACK[0xB88];
            do
            {
              uint64_t v30 = *(void **)(v28 - 24);
              v28 -= 24;
              uint64_t v29 = v30;
              if (v30)
              {
                *(void *)(v26 - 16) = v29;
                operator delete(v29);
              }
              unint64_t v26 = v28;
            }
            while (v28 != v25);
            uint64_t v27 = (void *)STACK[0xB80];
            uint64_t v24 = (void *)((unint64_t)&STACK[0xB20] | 0x60);
          }
          STACK[0xB88] = v25;
          operator delete(v27);
        }
        *uint64_t v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        obuint64_t j = v83;
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v88, (uint64_t)&STACK[0xAA0], 16, v32);
        if (v38)
        {
          unint64_t v39 = (unint64_t)&STACK[0xB20] | 0x70;
          uint64_t v87 = *(void *)v89;
          do
          {
            uint64_t v40 = 0;
            uint64_t v82 = v38;
            do
            {
              if (*(void *)v89 != v87) {
                objc_enumerationMutation(obj);
              }
              uint64_t v43 = *(void **)(*((void *)&v88 + 1) + 8 * v40);
              unint64_t v44 = objc_msgSend_length(v43, v33, v34, v35, v36, v37);
              if ((v44 & 0xF) != 0) {
                goto LABEL_50;
              }
              id v45 = v43;
              id v51 = (const void *)objc_msgSend_bytes(v45, v46, v47, v48, v49, v50);
              uint64_t v52 = (void *)STACK[0xB88];
              if (STACK[0xB88] >= STACK[0xB90])
              {
                unint64_t v55 = STACK[0xB80];
                unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v52 - STACK[0xB80]) >> 3);
                unint64_t v57 = v56 + 1;
                if (v56 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  sub_1C494A220();
                }
                if (0x5555555555555556 * ((uint64_t)(STACK[0xB90] - v55) >> 3) > v57) {
                  unint64_t v57 = 0x5555555555555556 * ((uint64_t)(STACK[0xB90] - v55) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(STACK[0xB90] - v55) >> 3) >= 0x555555555555555) {
                  unint64_t v58 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v58 = v57;
                }
                unint64_t v96 = v39;
                if (v58)
                {
                  if (v58 > 0xAAAAAAAAAAAAAAALL) {
                    sub_1C4949AA8();
                  }
                  uint64_t v59 = (char *)operator new(24 * v58);
                }
                else
                {
                  uint64_t v59 = 0;
                }
                uint64_t v93 = v59;
                v94 = &v59[24 * v56];
                v60 = v94;
                *((void *)v94 + 1) = 0;
                *(void *)&long long v95 = &v59[24 * v56];
                *((void *)&v95 + 1) = &v59[24 * v58];
                unint64_t vars0 = *((void *)&v95 + 1);
                *((void *)v60 + 2) = 0;
                *(void *)v60 = 0;
                if (v44 >= 8)
                {
                  int64_t v61 = v44 & 0xFFFFFFFFFFFFFFF8;
                  if (v61 < 0) {
                    sub_1C494A220();
                  }
                  unint64_t v62 = v39;
                  uint64_t v63 = (char *)operator new(v61);
                  *(void *)v60 = v63;
                  uint64_t v64 = &v63[8 * (v61 >> 3)];
                  *((void *)v60 + 2) = v64;
                  memcpy(v63, v51, v61);
                  *((void *)v60 + 1) = v64;
                  unint64_t v39 = v62;
                }
                unint64_t v42 = (unint64_t)(v60 + 24);
                *(void *)&long long v95 = v60 + 24;
                if (v52 == (void *)v55)
                {
                  STACK[0xB80] = (unint64_t)v60;
                  STACK[0xB88] = v42;
                  STACK[0xB90] = vars0;
                  uint64_t v38 = v82;
                }
                else
                {
                  do
                  {
                    uint64_t v65 = v60;
                    *((void *)v60 - 2) = 0;
                    *((void *)v60 - 1) = 0;
                    long long v66 = *(_OWORD *)(v52 - 3);
                    v52 -= 3;
                    *(_OWORD *)(v60 - 24) = v66;
                    v60 -= 24;
                    *((void *)v65 - 1) = v52[2];
                    *uint64_t v52 = 0;
                    v52[1] = 0;
                    v52[2] = 0;
                  }
                  while (v52 != (void *)v55);
                  uint64_t v52 = (void *)STACK[0xB80];
                  unint64_t v67 = STACK[0xB88];
                  STACK[0xB80] = (unint64_t)v60;
                  unint64_t v68 = v95;
                  *(_OWORD *)&STACK[0xB88] = v95;
                  unint64_t v42 = v68;
                  uint64_t v38 = v82;
                  if ((void *)v67 != v52)
                  {
                    float v69 = (void *)v67;
                    do
                    {
                      uint64_t v71 = (void *)*(v69 - 3);
                      v69 -= 3;
                      v70 = v71;
                      if (v71)
                      {
                        *(void *)(v67 - 16) = v70;
                        operator delete(v70);
                      }
                      unint64_t v67 = (unint64_t)v69;
                    }
                    while (v69 != v52);
                  }
                }
                if (v52) {
                  operator delete(v52);
                }
              }
              else
              {
                *uint64_t v52 = 0;
                v52[1] = 0;
                v52[2] = 0;
                if (v44 >= 8)
                {
                  int64_t v53 = v44 & 0xFFFFFFFFFFFFFFF8;
                  if (v53 < 0) {
                    sub_1C494A220();
                  }
                  uint64_t v54 = (char *)operator new(v53);
                  *uint64_t v52 = v54;
                  v52[1] = v54;
                  uint64_t v41 = &v54[8 * (v53 >> 3)];
                  v52[2] = v41;
                  memcpy(v54, v51, v53);
                  v52[1] = v41;
                }
                unint64_t v42 = (unint64_t)(v52 + 3);
              }
              STACK[0xB88] = v42;
              ++v40;
            }
            while (v40 != v38);
            uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v88, (uint64_t)&STACK[0xAA0], 16, v37);
          }
          while (v38);
        }
LABEL_50:

        STACK[0xB98] = objc_msgSend_count(obj, v72, v73, v74, v75, v76);
        sub_1C49BFCE4(&STACK[0xB20]);
      }
      else
      {
        sub_1C49B8F48((uint64_t *)&STACK[0xB20]);
      }
      sub_1C49C6374((uint64_t)v97, (uint64_t)&STACK[0xB20]);
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v77 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      uint64_t v78 = objc_opt_class();
      LODWORD(STACK[0xB20]) = 138412290;
      STACK[0xB24] = (unint64_t)v78;
      id v79 = v78;
      _os_log_impl(&dword_1C492D000, v77, OS_LOG_TYPE_ERROR, "%@ decoding failed. There was a problem decoding the stroke data.", (uint8_t *)&STACK[0xB20], 0xCu);
    }
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  STACK[0x618] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t vars0 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  if (objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14)) {
    sub_1C49C6374((uint64_t)v48, (uint64_t)&self->_drawing);
  }
  unint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17, v18, v19);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v20, v21, v22, v23, v24); ++i)
  {
    begin = self->_drawing.startTimes.__begin_;
    double v31 = -1.0;
    if (i < self->_drawing.startTimes.__end_ - begin) {
      double v31 = begin[i];
    }
    uint64_t v32 = (double *)operator new(8uLL);
    *uint64_t v32 = v31;
    uint64_t v33 = self->_drawing.endTimes.__begin_;
    double v34 = -1.0;
    if (i < self->_drawing.endTimes.__end_ - v33) {
      double v34 = v33[i];
    }
    uint64_t v35 = (double *)operator new(0x10uLL);
    double *v35 = v31;
    v35[1] = v34;
    operator delete(v32);
    unint64_t v39 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v36, (uint64_t)v35, 16, v37, v38);
    objc_msgSend_addObject_(v25, v40, (uint64_t)v39, v41, v42, v43);

    operator delete(v35);
  }
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)vars0, @"drawingStrokes", v28, v29);
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v25, @"drawingStrokesTimeStamps", v45, v46);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_msgSend_bounds(self, a2, v2, v3, v4, v5);
  uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, v7, @"origin: (%0.2f, %0.2f), size: (%0.2f, %0.2f)", v8, v9, v10, v11, v12, v13, v14);
  v35.receiver = self;
  v35.super_class = (Class)CHDrawing;
  uint64_t v16 = [(CHDrawing *)&v35 description];
  uint64_t v22 = objc_msgSend_strokeCount(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_pointCount(self, v23, v24, v25, v26, v27);
  uint64_t v33 = objc_msgSend_stringByAppendingFormat_(v16, v29, @" strokes: %lu, points: %lu, %@", v30, v31, v32, v22, v28, v15);

  return v33;
}

- (id)newDrawingWithTransform:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v10 = objc_alloc_init(CHDrawing);
  for (unint64_t i = 0; objc_msgSend_strokeCount(self, v5, v6, v7, v8, v9) > i; ++i)
  {
    for (unint64_t j = 0; objc_msgSend_pointCountForStrokeIndex_(self, v12, i, v13, v14, v15) > j; ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v17, i, j, v20, v21);
      v4[2](v4);
      objc_msgSend_addPoint_(v10, v22, v23, v24, v25, v26);
    }
    objc_msgSend_endStroke(v10, v17, v18, v19, v20, v21);
  }

  return v10;
}

- (id)newDrawingWithAffineTransform:(CGAffineTransform *)a3
{
  uint64_t v10 = objc_alloc_init(CHDrawing);
  for (unint64_t i = 0; objc_msgSend_strokeCount(self, v5, v6, v7, v8, v9) > i; ++i)
  {
    for (unint64_t j = 0; objc_msgSend_pointCountForStrokeIndex_(self, v12, i, v13, v14, v15) > j; ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v17, i, j, v20, v21);
      objc_msgSend_addPoint_(v10, v24, v25, v26, v27, v28, vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v22), *(float64x2_t *)&a3->a, v23)));
    }
    objc_msgSend_endStroke(v10, v17, v18, v19, v20, v21);
  }
  return v10;
}

- (id)drawingByRemovingUnnaturalHorizontalGaps:(double)a3
{
  uint64_t v4 = self;
  objc_msgSend_bounds(v4, v5, v6, v7, v8, v9);
  if (v15 <= a3 * 0.8)
  {
    unint64_t v56 = v4;
    goto LABEL_59;
  }
  objc_msgSend_strokeIndicesSortedByMinXCoordinate(v4, v10, v11, v12, v13, v14);
  uint64_t v84 = 0;
  uint64_t v20 = __p;
  if (v86 == __p)
  {
    unint64_t v56 = v4;
    if (__p) {
      goto LABEL_58;
    }
    goto LABEL_59;
  }
  uint64_t v21 = 0;
  double v22 = 0;
  double v23 = 0;
  unint64_t v24 = 0;
  uint64_t v83 = 0;
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  objc_msgSend_boundsForStrokeIndex_(v4, v16, *__p, v17, v18, v19, a3 + 50.0);
  while (1)
  {
    double v32 = v29;
    CGFloat v33 = v30;
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.double height = height;
    if (CGRectIsNull(v88)) {
      goto LABEL_8;
    }
    v93.origin.CGFloat y = 0.0;
    v93.size.double height = 1.0;
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.double height = height;
    v93.origin.CGFloat x = v32;
    v93.size.CGFloat width = v33;
    if (!CGRectIntersectsRect(v89, v93))
    {
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.CGFloat width = width;
      v92.size.double height = height;
      double v42 = v32 - CGRectGetMaxX(v92);
      if (v42 > a3 * 0.8)
      {
        double v43 = v42 + -50.0;
        if (v42 >= a3) {
          double v43 = a3;
        }
        if (v42 >= v82) {
          double v44 = v42 + -50.0;
        }
        else {
          double v44 = v43;
        }
        uint64_t v83 = (uint64_t)((double)v83 - v44);
      }
LABEL_8:
      CGFloat x = v32;
      CGFloat y = 0.0;
      CGFloat width = v33;
      double height = 1.0;
      if (v23 < v22) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
    v94.origin.CGFloat y = 0.0;
    v94.size.double height = 1.0;
    v90.origin.CGFloat x = x;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat width = width;
    v90.size.double height = height;
    v94.origin.CGFloat x = v32;
    v94.size.CGFloat width = v33;
    CGRect v91 = CGRectUnion(v90, v94);
    CGFloat x = v91.origin.x;
    CGFloat y = v91.origin.y;
    CGFloat width = v91.size.width;
    double height = v91.size.height;
    if (v23 < v22)
    {
LABEL_4:
      *double v23 = (double)v83;
      uint64_t v31 = v23 + 1;
      goto LABEL_5;
    }
LABEL_12:
    uint64_t v38 = v23 - v21;
    unint64_t v39 = v38 + 1;
    if ((unint64_t)(v38 + 1) >> 61) {
      sub_1C494A220();
    }
    if (((char *)v22 - (char *)v21) >> 2 > v39) {
      unint64_t v39 = ((char *)v22 - (char *)v21) >> 2;
    }
    if ((unint64_t)((char *)v22 - (char *)v21) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v40 = v39;
    }
    if (v40)
    {
      if (v40 >> 61) {
        sub_1C4949AA8();
      }
      uint64_t v41 = operator new(8 * v40);
    }
    else
    {
      uint64_t v41 = 0;
    }
    uint64_t v45 = (double *)&v41[8 * v38];
    *uint64_t v45 = (double)v83;
    uint64_t v31 = v45 + 1;
    if (v23 == v21) {
      goto LABEL_33;
    }
    unint64_t v46 = (char *)v23 - (char *)v21 - 8;
    if (v46 >= 0x168)
    {
      unint64_t v49 = ((char *)(v23 - 1) - (char *)v21) & 0xFFFFFFFFFFFFFFF8;
      if (&v41[(char *)v23 - (char *)v21 - 8 - v49] > &v41[(char *)v23 - (char *)v21 - 8])
      {
        uint64_t v47 = v23;
      }
      else if ((double *)((char *)v23 - v49 - 8) > v23 - 1)
      {
        uint64_t v47 = v23;
      }
      else if ((unint64_t)((char *)v21 - v41) >= 0x20)
      {
        uint64_t v50 = (v46 >> 3) + 1;
        uint64_t v51 = 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v47 = &v23[v51 / 0xFFFFFFFFFFFFFFF8];
        uint64_t v45 = (double *)((char *)v45 - v51);
        uint64_t v52 = &v41[8 * v38 - 16];
        int64_t v53 = v23 - 2;
        uint64_t v54 = v50 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v55 = *(_OWORD *)v53;
          *(v52 - 1) = *((_OWORD *)v53 - 1);
          *uint64_t v52 = v55;
          v52 -= 2;
          v53 -= 4;
          v54 -= 4;
        }
        while (v54);
        if (v50 == (v50 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v47 = v23;
      }
    }
    else
    {
      uint64_t v47 = v23;
    }
    do
    {
      uint64_t v48 = *((void *)v47-- - 1);
      *((void *)v45-- - 1) = v48;
    }
    while (v47 != v21);
LABEL_33:
    double v22 = (double *)&v41[8 * v40];
    uint64_t v84 = v45;
    if (v21) {
      operator delete(v21);
    }
    uint64_t v21 = v45;
LABEL_5:
    ++v24;
    double v23 = v31;
    if (v24 >= v86 - __p) {
      break;
    }
    objc_msgSend_boundsForStrokeIndex_(v4, v34, __p[v24], v35, v36, v37, *(void *)&v82);
  }
  if (v83)
  {
    unint64_t v57 = objc_alloc_init(CHDrawing);

    for (unint64_t i = 0; i < objc_msgSend_strokeCount(v4, v58, v59, v60, v61, v62); ++i)
    {
      unint64_t v68 = 0;
      double v69 = v84[__p[i]];
      while (v68 < objc_msgSend_pointCountForStrokeIndex_(v4, v64, i, v65, v66, v67))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v70, i, v68, v73, v74);
        objc_msgSend_addPoint_(v57, v76, v77, v78, v79, v80, v69 + v75);
        ++v68;
      }
      objc_msgSend_endStroke(v57, v70, v71, v72, v73, v74);
    }
    uint64_t v4 = v57;
  }
  unint64_t v56 = v4;
  if (v84) {
    operator delete(v84);
  }
  uint64_t v20 = __p;
  if (__p) {
LABEL_58:
  }
    operator delete(v20);
LABEL_59:

  return v56;
}

- (unint64_t)pointCount
{
  begin = self->_drawing.strokes.__begin_;
  end = self->_drawing.strokes.__end_;
  if (end == begin) {
    return 0;
  }
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  BOOL v5 = *((void *)end - 2) == *((void *)end - 3);
  uint64_t v6 = *((void *)end - 2) == *((void *)end - 3) ? -1 : 0;
  uint64_t v7 = v4 - v5;
  if (v7 < 1) {
    return 0;
  }
  if ((unint64_t)v7 >= 5)
  {
    uint64_t v10 = v7 & 3;
    if ((v7 & 3) == 0) {
      uint64_t v10 = 4;
    }
    uint64_t v8 = v7 - v10;
    int64x2_t v11 = 0uLL;
    uint64_t v12 = v8;
    uint64_t v13 = (const double *)self->_drawing.strokes.__begin_;
    int64x2_t v14 = 0uLL;
    do
    {
      double v15 = v13;
      v13 += 12;
      float64x2x3_t v18 = vld3q_f64(v15);
      v15 += 6;
      int64x2_t v11 = (int64x2_t)vsraq_n_u64((uint64x2_t)v11, (uint64x2_t)vshrq_n_s64(vsubq_s64((int64x2_t)v18.val[1], (int64x2_t)v18.val[0]), 3uLL), 1uLL);
      float64x2x3_t v19 = vld3q_f64(v15);
      int64x2_t v14 = (int64x2_t)vsraq_n_u64((uint64x2_t)v14, (uint64x2_t)vshrq_n_s64(vsubq_s64((int64x2_t)v19.val[1], (int64x2_t)v19.val[0]), 3uLL), 1uLL);
      v12 -= 4;
    }
    while (v12);
    unint64_t result = vaddvq_s64(vaddq_s64(v14, v11));
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t result = 0;
  }
  unint64_t v16 = v4 + v6 - v8;
  uint64_t v17 = &begin[24 * v8 + 8];
  do
  {
    result += (unint64_t)((uint64_t)(*v17 - *(v17 - 1)) >> 3) >> 1;
    v17 += 3;
    --v16;
  }
  while (v16);
  return result;
}

- (unint64_t)pointCountForStrokeIndex:(unint64_t)a3
{
  return (unint64_t)((uint64_t)(*((void *)self->_drawing.strokes.__begin_ + 3 * a3 + 1)
                                    - *((void *)self->_drawing.strokes.__begin_ + 3 * a3)) >> 3) >> 1;
}

- (CGPoint)pointForStrokeIndex:(unint64_t)a3 pointIndex:(unint64_t)a4
{
  unint64_t v4 = (double *)(*((void *)self->_drawing.strokes.__begin_ + 3 * a3) + 16 * a4);
  double v5 = *v4;
  double v6 = v4[1];
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (double)startTimeForStroke:(unint64_t)a3
{
  begin = self->_drawing.startTimes.__begin_;
  double result = -1.0;
  if (a3 < self->_drawing.startTimes.__end_ - begin) {
    return begin[a3];
  }
  return result;
}

- (double)endTimeForStroke:(unint64_t)a3
{
  begin = self->_drawing.endTimes.__begin_;
  double result = -1.0;
  if (a3 < self->_drawing.endTimes.__end_ - begin) {
    return begin[a3];
  }
  return result;
}

- (unint64_t)strokeCount
{
  end = self->_drawing.strokes.__end_;
  uint64_t v3 = end - (char *)self->_drawing.strokes.__begin_;
  if (v3) {
    return 0xAAAAAAAAAAAAAAABLL * (v3 >> 3) - (*((void *)end - 2) == *((void *)end - 3));
  }
  else {
    return 0;
  }
}

- (id)indexesOfStrokesSmallerThanSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v10 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], a2, v3, v4, v5, v6);
  end = self->_drawing.strokes.__end_;
  uint64_t v12 = end - (char *)self->_drawing.strokes.__begin_;
  if (v12)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    uint64_t v14 = *((void *)end - 2) == *((void *)end - 3);
    uint64_t v15 = v13 - v14;
    if (v13 != v14)
    {
      unint64_t v16 = 0;
      p_drawing = &self->_drawing;
      do
      {
        CHDrawingStrokes::getBoundingBoxForStroke(p_drawing, v16, __p);
        double v22 = __p[0];
        if (*((double *)__p[0] + 2) - *(double *)__p[0] >= width
          || *((double *)__p[0] + 3) - *((double *)__p[0] + 1) >= height
          || (objc_msgSend_addIndex_(v10, v18, v16, v19, v20, v21), (double v22 = __p[0]) != 0))
        {
          __p[1] = v22;
          operator delete(v22);
        }
        ++v16;
      }
      while (v15 != v16);
    }
  }
  return v10;
}

- (CHDrawing)drawingWithStrokesFromIndexSet:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C49C11C4;
  v22[3] = &unk_1E64E19F0;
  id v11 = v10;
  id v23 = v11;
  objc_msgSend_enumerateIndexesUsingBlock_(v4, v12, (uint64_t)v22, v13, v14, v15);
  uint64_t v20 = objc_msgSend_drawingWithStrokesFromIndexArray_(self, v16, (uint64_t)v11, v17, v18, v19);

  return (CHDrawing *)v20;
}

- (CHDrawing)drawingWithStrokesFromIndexArray:(id)a3
{
  STACK[0xC38] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v4 = objc_alloc_init(CHDrawing);
  sub_1C49C5610((uint64_t)&STACK[0x9A0]);
  unint64_t v40 = (char **)((unint64_t)&STACK[0x9A0] | 0x60);
  unint64_t v5 = STACK[0xA00];
  if (STACK[0xA00])
  {
    unint64_t v6 = STACK[0xA08];
    uint64_t v7 = (void *)STACK[0xA00];
    if (STACK[0xA08] != v5)
    {
      unint64_t v8 = STACK[0xA08];
      do
      {
        uint64_t v10 = *(void **)(v8 - 24);
        v8 -= 24;
        uint64_t v9 = v10;
        if (v10)
        {
          *(void *)(v6 - 16) = v9;
          operator delete(v9);
        }
        unint64_t v6 = v8;
      }
      while (v8 != v5);
      uint64_t v7 = (void *)STACK[0xA00];
    }
    STACK[0xA08] = v5;
    operator delete(v7);
  }
  *unint64_t v40 = 0;
  *(void *)(((unint64_t)&STACK[0x9A0] | 0x60) + 8) = 0;
  *(void *)(((unint64_t)&STACK[0x9A0] | 0x60) + 0x10) = 0;
  long long v41 = 0u;
  long long vars0 = 0u;
  id v11 = v39;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v41, (uint64_t)&STACK[0x920], 16, v13);
  if (v19)
  {
    uint64_t v20 = *(void *)vars0;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        while (1)
        {
          if (*(void *)vars0 != v20) {
            objc_enumerationMutation(v11);
          }
          uint64_t v22 = objc_msgSend_integerValue(*(void **)(*((void *)&v41 + 1) + 8 * i), v14, v15, v16, v17, v18);
          begin = self->_drawing.strokes.__begin_;
          uint64_t v14 = (const char *)&begin[3 * v22];
          unint64_t v24 = (void *)STACK[0xA08];
          if (STACK[0xA08] < STACK[0xA10]) {
            break;
          }
          STACK[0xA08] = (unint64_t)sub_1C49A1C84(v40, (uint64_t)v14);
          if (v19 == ++i) {
            goto LABEL_20;
          }
        }
        *unint64_t v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        uint64_t v25 = *(const void **)v14;
        uint64_t v26 = begin[3 * v22 + 1];
        int64_t v27 = v26 - *(void *)v14;
        if (v26 != *(void *)v14)
        {
          if (v27 < 0) {
            sub_1C494A220();
          }
          uint64_t v28 = (char *)operator new(v26 - *(void *)v14);
          *unint64_t v24 = v28;
          v24[1] = v28;
          double v29 = self;
          id v30 = v11;
          uint64_t v31 = v4;
          double v32 = &v28[8 * (v27 >> 3)];
          v24[2] = v32;
          memcpy(v28, v25, v27);
          v24[1] = v32;
          id v4 = v31;
          id v11 = v30;
          self = v29;
        }
        STACK[0xA08] = (unint64_t)(v24 + 3);
      }
LABEL_20:
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v41, (uint64_t)&STACK[0x920], 16, v18);
    }
    while (v19);
  }

  STACK[0xA18] = objc_msgSend_count(v11, v33, v34, v35, v36, v37);
  sub_1C49BFCE4(&STACK[0x9A0]);
  sub_1C49C6374((uint64_t)v43, (uint64_t)&STACK[0x9A0]);
}

- (CGPoint)centroidForStrokeIndexes:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v14 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_FAULT, "At least one stroke index must be passed", buf, 2u);
    }
  }
  *(void *)buf = 0;
  id v30 = buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1C49C1738;
  v20[3] = &unk_1E64E1A18;
  v20[4] = self;
  v20[5] = buf;
  v20[6] = &v25;
  v20[7] = &v21;
  objc_msgSend_enumerateIndexesUsingBlock_(v4, v10, (uint64_t)v20, v11, v12, v13);
  uint64_t v15 = v22[3];
  if (v15 < 1)
  {
    double v16 = 0.0;
    double v17 = 0.0;
  }
  else
  {
    double v16 = *((double *)v30 + 3) / (double)v15;
    double v17 = v26[3] / (double)v15;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(buf, 8);

  double v18 = v16;
  double v19 = v17;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (CGRect)boundsForStrokeIndexes:(id)a3
{
  uint64_t v16 = 0;
  double v17 = (double *)&v16;
  uint64_t v18 = 0x5012000000;
  double v19 = sub_1C49C18FC;
  uint64_t v20 = nullsub_11;
  uint64_t v21 = &unk_1C4CB5C62;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v22 = *MEMORY[0x1E4F1DB20];
  long long v23 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C49C190C;
  v15[3] = &unk_1E64E1978;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend_enumerateIndexesUsingBlock_(a3, a2, (uint64_t)v15, v3, v4, v5);
  double v7 = v17[6];
  double v8 = v17[7];
  double v9 = v17[8];
  double v10 = v17[9];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)boundsForStrokeIndex:(unint64_t)a3
{
  end = self->_drawing.strokes.__end_;
  uint64_t v4 = end - (char *)self->_drawing.strokes.__begin_;
  if (v4 && (uint64_t)(0xAAAAAAAAAAAAAAABLL * (v4 >> 3) - (*((void *)end - 2) == *((void *)end - 3))) > 0)
  {
    CHDrawingStrokes::getBoundingBoxForStroke(&self->_drawing, a3, __p);
    double v5 = *(double *)__p[0];
    double v6 = *((double *)__p[0] + 1);
    double v7 = *((double *)__p[0] + 2) - *(double *)__p[0];
    double v8 = *((double *)__p[0] + 3) - v6;
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)bounds
{
  CHDrawingStrokes::getBoundingBox(&self->_drawing, (double **)__p);
  double v2 = *(double *)__p[0];
  double v3 = *((double *)__p[0] + 1);
  double v4 = *((double *)__p[0] + 2) - *(double *)__p[0];
  double v5 = *((double *)__p[0] + 3) - v3;
  __p[1] = __p[0];
  operator delete(__p[0]);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (float)cumulativePointToPointDistance
{
  begin = self->_drawing.strokes.__begin_;
  end = self->_drawing.strokes.__end_;
  float result = 0.0;
  if (end != begin)
  {
    int64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3) - (*((void *)end - 2) == *((void *)end - 3));
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v7 = (float64x2_t **)&begin[24 * i];
        double v8 = *v7;
        uint64_t v9 = (char *)v7[1] - (char *)*v7;
        if ((unint64_t)v9 >= 0x19)
        {
          unint64_t v10 = (unint64_t)(v9 >> 3) >> 1;
          if (v10 <= 2) {
            unint64_t v10 = 2;
          }
          unint64_t v11 = v10 - 1;
          double v12 = v8 + 1;
          do
          {
            float32x2_t v13 = vsub_f32(vcvt_f32_f64(v12[-1]), vcvt_f32_f64(*v12));
            float result = result + sqrtf(vaddv_f32(vmul_f32(v13, v13)));
            ++v12;
            --v11;
          }
          while (v11);
        }
      }
    }
  }
  return result;
}

- (float)distanceBetweenFirstAndLastPoint
{
  begin = (float64x2_t **)self->_drawing.strokes.__begin_;
  end = (float64x2_t **)self->_drawing.strokes.__end_;
  if (end == begin) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = ~(unint64_t)(*(end - 2) == *(end - 3)) - 0x5555555555555555 * (end - begin);
  }
  float32x2_t v5 = vsub_f32(vcvt_f32_f64(**begin), vcvt_f32_f64(*(float64x2_t *)((char *)begin[3 * v4]+ (((char *)begin[3 * v4 + 1] - (char *)begin[3 * v4]) & 0xFFFFFFFFFFFFFFF0)- 16)));
  return sqrtf(vaddv_f32(vmul_f32(v5, v5)));
}

- (void)addPoint:(CGPoint)a3
{
}

- (void)addStartTime:(double)a3
{
}

- (void)addEndTime:(double)a3
{
}

- (void)endStroke
{
  if (*((void *)self->_drawing.strokes.__end_ - 2) != *((void *)self->_drawing.strokes.__end_ - 3))
  {
    ++self->_drawing.currentStrokeIndex;
    sub_1C49BFCE4(&self->_drawing.strokeBounds.__begin_);
  }
}

- (void)clear
{
}

- (BOOL)isPrefixForDrawing:(id)a3
{
  id v4 = a3;
  unint64_t v10 = objc_msgSend_pointCount(self, v5, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_pointCount(v4, v11, v12, v13, v14, v15)
    && (unint64_t v21 = objc_msgSend_strokeCount(self, v16, v17, v18, v19, v20),
        v21 <= objc_msgSend_strokeCount(v4, v22, v23, v24, v25, v26)))
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v35 = objc_msgSend_strokeCount(self, v27, v28, v29, v30, v31);
      BOOL v32 = i >= v35;
      if (i >= v35) {
        break;
      }
      unint64_t v40 = objc_msgSend_pointCountForStrokeIndex_(self, v36, i, v37, v38, v39);
      if (v40 > objc_msgSend_pointCountForStrokeIndex_(v4, v41, i, v42, v43, v44)) {
        break;
      }
      unint64_t v49 = 0;
      while (v49 < objc_msgSend_pointCountForStrokeIndex_(self, v45, i, v46, v47, v48))
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(self, v27, i, v49, v30, v31);
        double v51 = v50;
        double v53 = v52;
        objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v54, i, v49, v55, v56);
        BOOL v32 = 0;
        if (v51 == v58)
        {
          ++v49;
          if (v53 == v57) {
            continue;
          }
        }
        goto LABEL_4;
      }
    }
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_4:

  return v32;
}

- (_NSRange)matchingStrokePrefixRangeForDrawing:(id)a3
{
  id v9 = a3;
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v4, v5, v6, v7, v8); ++i)
  {
    if (i >= objc_msgSend_strokeCount(v9, v11, v12, v13, v14, v15)) {
      break;
    }
    uint64_t v20 = objc_msgSend_pointCountForStrokeIndex_(self, v16, i, v17, v18, v19);
    if (v20 != objc_msgSend_pointCountForStrokeIndex_(v9, v21, i, v22, v23, v24)) {
      break;
    }
    unint64_t v29 = 0;
    while (v29 < objc_msgSend_pointCountForStrokeIndex_(self, v25, i, v26, v27, v28))
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v4, i, v29, v7, v8);
      double v31 = v30;
      double v33 = v32;
      objc_msgSend_pointForStrokeIndex_pointIndex_(v9, v34, i, v29, v35, v36);
      if (v31 == v38)
      {
        ++v29;
        if (v33 == v37) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
LABEL_11:

  NSUInteger v39 = 0;
  NSUInteger v40 = i;
  result.length = v40;
  result.location = v39;
  return result;
}

- (BOOL)isEqualToDrawing:(id)a3
{
  STACK[0x598] = *MEMORY[0x1E4F143B8];
  id v4 = (CHDrawing *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    if (v4) {
      sub_1C49C6374((uint64_t)&v15, (uint64_t)&v4->_drawing);
    }
    bzero(&v15, 0x280uLL);
    uint64_t v7 = 0;
    begin = (double **)self->_drawing.strokes.__begin_;
    end = (double **)self->_drawing.strokes.__end_;
    if (end == begin)
    {
      while (1)
      {
        if (begin == end)
        {
          sub_1C49C6028(&v15);
          currentStrokeIndeCGFloat x = self->_drawing.currentStrokeIndex;
          bzero(&v15, 0x280uLL);
          BOOL v6 = currentStrokeIndex == 0;
          sub_1C49C6028(&v15);
          goto LABEL_16;
        }
        unint64_t v11 = *begin;
        unint64_t v10 = begin[1];
        uint64_t v12 = *(double **)v7;
        if ((char *)v10 - (char *)*begin != *(void *)(v7 + 8) - *(void *)v7) {
          goto LABEL_4;
        }
        if (v11 != v10) {
          break;
        }
LABEL_8:
        begin += 3;
        v7 += 24;
      }
      while (*v11 == *v12)
      {
        ++v11;
        ++v12;
        if (v11 == v10) {
          goto LABEL_8;
        }
      }
    }
LABEL_4:
    sub_1C49C6028(&v15);
    BOOL v6 = 0;
  }
LABEL_16:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToDrawing = objc_msgSend_isEqualToDrawing_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToDrawing;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v12 = 0;
  if (objc_msgSend_strokeCount(self, a2, v2, v3, v4, v5))
  {
    unint64_t v13 = 0;
    do
      v12 += objc_msgSend_pointCountForStrokeIndex_(self, v7, v13++, v9, v10, v11);
    while (v13 < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18));
  }
  return objc_msgSend_strokeCount(self, v7, v8, v9, v10, v11) + v12;
}

- (id)xyRepresentation
{
  uint64_t v12 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4, v5);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v7, v8, v9, v10, v11); ++i)
  {
    for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v14, i, v15, v16, v17); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v19, i, j, v21, v22);
      unint64_t v29 = objc_msgSend_stringWithFormat_(NSString, v25, @"%d %d\n", v26, v27, v28, (int)v23, (int)v24);
      objc_msgSend_appendString_(v12, v30, (uint64_t)v29, v31, v32, v33);
    }
    objc_msgSend_appendString_(v12, v19, @";\n", v20, v21, v22);
  }
  return v12;
}

- (id)jsonRepresentationWithContext:(id)a3
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v63 = (id)objc_msgSend_mutableCopy(v62, v4, v5, v6, v7, v8);
  uint64_t v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18); ++i)
  {
    double v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v21, v22, v23, v24, v25);
    for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v26, i, v27, v28, v29); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(self, v32, i, j, v34, v35);
      double v37 = v36;
      uint64_t v43 = objc_msgSend_numberWithDouble_(NSNumber, v38, v39, v40, v41, v42);
      v64[0] = v43;
      unint64_t v49 = objc_msgSend_numberWithDouble_(NSNumber, v44, v45, v46, v47, v48, v37);
      v64[1] = v49;
      double v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v50, (uint64_t)v64, 2, v51, v52);
      objc_msgSend_addObject_(v30, v54, (uint64_t)v53, v55, v56, v57);
    }
    objc_msgSend_addObject_(v19, v32, (uint64_t)v30, v33, v34, v35);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v63, v21, (uint64_t)v19, @"data", v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v63, v58, (uint64_t)&unk_1F203CF68, @"channels", v59, v60);

  return v63;
}

- (Matrix<float>)bitmapRepresentationForSize:(SEL)a3
{
  CHDrawingStrokes::generateBitmap(&self->_drawing, (int)a4.width, (uint64_t)retstr, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49);
}

- (Matrix<float>)orientationRepresentationForSampling:(SEL)a3 convolutionWidth:(unint64_t)a4
{
}

- (id)sortedDrawingUsingMinXCoordinate
{
  STACK[0xB78] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_copy(self, a2, v2, v3, v4, v5);
  if (v6) {
    sub_1C49C6374((uint64_t)&STACK[0x8C0], v6 + 128);
  }
  bzero(&STACK[0x8C0], 0x280uLL);
  uint64_t v16 = (uint64_t (*)(uint64_t *, uint64_t *))sub_1C49C6C3C;
  sub_1C49C6CD8(0, 0, &v16, 0, 1);
  if (STACK[0x928] == STACK[0x920])
  {
    unint64_t v10 = 0;
    unint64_t v9 = 0;
    unint64_t v12 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    unint64_t v18 = 0;
  }
  else
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(STACK[0x928] - STACK[0x920]) >> 3);
    uint64_t v8 = *(void *)(STACK[0x928] - 16) == *(void *)(STACK[0x928] - 24);
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    unint64_t v9 = v7 - v8;
    if (v7 == v8)
    {
      unint64_t v10 = 0;
      unint64_t v12 = 0;
      uint64_t v14 = (void *)STACK[0x8D8];
      if (!STACK[0x8D8])
      {
LABEL_17:
        STACK[0x8D8] = v12;
        STACK[0x8E0] = v9;
        STACK[0x8E8] = v10;
        sub_1C49C6374((uint64_t)v19, (uint64_t)&STACK[0x8C0]);
      }
LABEL_16:
      operator delete(v14);
      unint64_t v9 = v17;
      unint64_t v10 = v18;
      goto LABEL_17;
    }
    if ((v9 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    unint64_t v10 = ((v9 - 1) >> 6) + 1;
    uint64_t v11 = operator new(8 * v10);
    unint64_t v12 = (unint64_t)v11;
    unint64_t v17 = v9;
    unint64_t v18 = v10;
    if (v9 >= 0x41) {
      unint64_t v13 = (v9 - 1) >> 6;
    }
    else {
      unint64_t v13 = 0;
    }
    v11[v13] = 0;
    if (v9 >= 0x40) {
      bzero(v11, 8 * (v9 >> 6));
    }
    if ((v9 & 0x3F) != 0)
    {
      *(void *)(v12 + 8 * (v9 >> 6)) &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v9 & 0x3F));
      uint64_t v14 = (void *)STACK[0x8D8];
      if (!STACK[0x8D8]) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  uint64_t v14 = (void *)STACK[0x8D8];
  if (!STACK[0x8D8]) {
    goto LABEL_17;
  }
  goto LABEL_16;
}

- (id)sortedDrawingUsingStrokeMidPoint:(id *)a3
{
  unint64_t v7 = 0;
  __p = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  for (unint64_t i = objc_msgSend_strokeCount(self, a2, (uint64_t)a3, v3, v4, v5, a3);
        v7 < i;
        unint64_t i = objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18, v71))
  {
    objc_msgSend_boundsForStrokeIndex_(self, v9, v7, v10, v11, v12);
    double v21 = v19 + v20 * 0.5;
    uint64_t v22 = v73;
    if (v73 < v74)
    {
      *uint64_t v73 = v21;
      uint64_t v13 = (uint64_t)(v22 + 1);
      goto LABEL_3;
    }
    uint64_t v23 = (double *)__p;
    int64_t v24 = (char *)v73 - (unsigned char *)__p;
    uint64_t v25 = ((char *)v73 - (unsigned char *)__p) >> 3;
    unint64_t v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 61) {
      sub_1C494A220();
    }
    uint64_t v27 = (char *)v74 - (unsigned char *)__p;
    if (((char *)v74 - (unsigned char *)__p) >> 2 > v26) {
      unint64_t v26 = v27 >> 2;
    }
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v26;
    }
    if (v28)
    {
      if (v28 >> 61) {
        sub_1C4949AA8();
      }
      uint64_t v29 = (char *)operator new(8 * v28);
      uint64_t v30 = (double *)&v29[8 * v25];
      *uint64_t v30 = v21;
      uint64_t v13 = (uint64_t)(v30 + 1);
      int64_t v31 = (char *)v22 - (char *)v23;
      if (v22 == v23) {
        goto LABEL_23;
      }
LABEL_17:
      unint64_t v32 = v31 - 8;
      if (v32 < 0x58) {
        goto LABEL_56;
      }
      if ((unint64_t)((char *)v22 - &v29[v24]) < 0x20) {
        goto LABEL_56;
      }
      uint64_t v33 = (v32 >> 3) + 1;
      uint64_t v34 = 8 * (v33 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v35 = &v22[v34 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v30 = (double *)((char *)v30 - v34);
      uint64_t v36 = &v29[8 * v25 - 16];
      uint64_t v37 = v22 - 2;
      uint64_t v38 = v33 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v39 = *(_OWORD *)v37;
        *((_OWORD *)v36 - 1) = *((_OWORD *)v37 - 1);
        *(_OWORD *)uint64_t v36 = v39;
        v36 -= 32;
        v37 -= 4;
        v38 -= 4;
      }
      while (v38);
      uint64_t v22 = v35;
      if (v33 != (v33 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_56:
        do
        {
          uint64_t v40 = *((void *)v22-- - 1);
          *((void *)v30-- - 1) = v40;
        }
        while (v22 != v23);
      }
      goto LABEL_23;
    }
    uint64_t v29 = 0;
    uint64_t v30 = (double *)(8 * v25);
    *(double *)(8 * v25) = v21;
    uint64_t v13 = 8 * v25 + 8;
    int64_t v31 = (char *)v22 - (char *)v23;
    if (v22 != v23) {
      goto LABEL_17;
    }
LABEL_23:
    __p = v30;
    uint64_t v74 = (double *)&v29[8 * v28];
    if (v23) {
      operator delete(v23);
    }
LABEL_3:
    uint64_t v73 = (double *)v13;
    ++v7;
  }
  uint64_t v42 = (double *)__p;
  uint64_t v41 = v73;
  size_t v43 = (char *)v73 - (unsigned char *)__p;
  if (v73 == __p)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }
  else
  {
    if ((v43 & 0x8000000000000000) != 0) {
      sub_1C494A220();
    }
    uint64_t v44 = (int64x2_t *)operator new((char *)v73 - (unsigned char *)__p);
    bzero(v44, v43);
    uint64_t v45 = (uint64_t *)((char *)v44->i64 + v43);
    if (v43 - 8 < 0x18)
    {
      uint64_t v46 = 0;
      uint64_t v47 = (uint64_t *)v44;
      goto LABEL_33;
    }
    unint64_t v48 = ((v43 - 8) >> 3) + 1;
    uint64_t v46 = v48 & 0x3FFFFFFFFFFFFFFCLL;
    uint64_t v47 = &v44->i64[v48 & 0x3FFFFFFFFFFFFFFCLL];
    int64x2_t v49 = (int64x2_t)xmmword_1C4C39B30;
    double v50 = v44 + 1;
    int64x2_t v51 = vdupq_n_s64(2uLL);
    int64x2_t v52 = vdupq_n_s64(4uLL);
    uint64_t v53 = v48 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v50[-1] = v49;
      *double v50 = vaddq_s64(v49, v51);
      int64x2_t v49 = vaddq_s64(v49, v52);
      v50 += 2;
      v53 -= 4;
    }
    while (v53);
    if (v48 != v46)
    {
      do
LABEL_33:
        *v47++ = v46++;
      while (v47 != v45);
    }
  }
  p_p = &__p;
  unint64_t v54 = ((char *)v45 - (char *)v44) >> 3;
  unint64_t v55 = 126 - 2 * __clz(v54);
  if (v41 == v42) {
    uint64_t v56 = 0;
  }
  else {
    uint64_t v56 = v55;
  }
  sub_1C49CA808((uint64_t)v44, v45, (uint64_t **)&p_p, v56, 1);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v41 != v42)
  {
    if (v54 <= 1) {
      unint64_t v54 = 1;
    }
    id v62 = (uint64_t *)v44;
    do
    {
      uint64_t v63 = *v62++;
      uint64_t v64 = objc_msgSend_numberWithLong_(NSNumber, v57, v63, v58, v59, v60);
      objc_msgSend_addObject_(v61, v65, (uint64_t)v64, v66, v67, v68);

      --v54;
    }
    while (v54);
  }
  double v69 = objc_msgSend_drawingWithStrokesFromIndexArray_(self, v57, (uint64_t)v61, v58, v59, v60);
  if (v71) {
    *uint64_t v71 = v61;
  }

  if (v44) {
    operator delete(v44);
  }
  if (__p)
  {
    uint64_t v73 = (double *)__p;
    operator delete(__p);
  }
  return v69;
}

- (id)sortedDrawingUsingStrokeMidPointHorizontalOverlapAware:(id *)a3 shouldSortRTL:(BOOL)a4
{
  BOOL v6 = a4;
  unint64_t v9 = objc_msgSend_strokeCount(self, a2, (uint64_t)a3, a4, v4, v5);
  long long v99 = 0;
  uint64_t v100 = 0;
  uint64_t v98 = 0;
  BOOL v94 = v6;
  if (v9)
  {
    if (v9 >> 61) {
      sub_1C494A220();
    }
    size_t v15 = 8 * v9;
    uint64_t v16 = (int64x2_t *)operator new(8 * v9);
    uint64_t v98 = v16;
    bzero(v16, v15);
    uint64_t v17 = &v16->i64[v15 / 8];
    long long v99 = &v16->i8[v15];
    if (v15 - 8 >= 0x18)
    {
      unint64_t v20 = ((v15 - 8) >> 3) + 1;
      uint64_t v18 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      double v19 = &v16->i64[v20 & 0x3FFFFFFFFFFFFFFCLL];
      int64x2_t v21 = (int64x2_t)xmmword_1C4C39B30;
      uint64_t v22 = v16 + 1;
      int64x2_t v23 = vdupq_n_s64(2uLL);
      int64x2_t v24 = vdupq_n_s64(4uLL);
      uint64_t v25 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v22[-1] = v21;
        int64x2_t *v22 = vaddq_s64(v21, v23);
        int64x2_t v21 = vaddq_s64(v21, v24);
        v22 += 2;
        v25 -= 4;
      }
      while (v25);
      if (v20 == v18) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v18 = 0;
      double v19 = (uint64_t *)v16;
    }
    do
      *v19++ = v18++;
    while (v19 != v17);
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
LABEL_10:
  __p = 0;
  unint64_t v96 = 0;
  uint64_t v97 = 0;
  unint64_t v26 = objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14, a3);
  unint64_t v32 = v26;
  if (v26)
  {
    if (v26 >> 59) {
      sub_1C494A220();
    }
    uint64_t v33 = (char *)operator new(32 * v26);
    __p = &v33[v96 & 0xFFFFFFFFFFFFFFE0];
    unint64_t v96 = (unint64_t)__p;
    uint64_t v97 = &v33[32 * v32];
  }
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v27, v28, v29, v30, v31); ++i)
  {
    objc_msgSend_boundsForStrokeIndex_(self, v36, i, v37, v38, v39);
    uint64_t v44 = v40;
    uint64_t v45 = v41;
    uint64_t v46 = v42;
    uint64_t v47 = v43;
    unint64_t v48 = (void *)v96;
    if (v96 < (unint64_t)v97)
    {
      *(void *)unint64_t v96 = v40;
      v48[1] = v41;
      uint64_t v35 = v48 + 4;
      v48[2] = v42;
      v48[3] = v43;
      goto LABEL_15;
    }
    int64x2_t v49 = __p;
    uint64_t v50 = (uint64_t)(v96 - (void)__p) >> 5;
    unint64_t v51 = v50 + 1;
    if ((unint64_t)(v50 + 1) >> 59) {
      sub_1C494A220();
    }
    uint64_t v52 = v97 - (unsigned char *)__p;
    if ((v97 - (unsigned char *)__p) >> 4 > v51) {
      unint64_t v51 = v52 >> 4;
    }
    if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v53 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v53 = v51;
    }
    if (v53)
    {
      if (v53 >> 59) {
        sub_1C4949AA8();
      }
      unint64_t v54 = (char *)operator new(32 * v53);
      unint64_t v55 = &v54[32 * v50];
      *(void *)unint64_t v55 = v44;
      *((void *)v55 + 1) = v45;
      *((void *)v55 + 2) = v46;
      *((void *)v55 + 3) = v47;
      uint64_t v56 = v55;
      if (v48 == v49)
      {
LABEL_27:
        uint64_t v57 = &v54[32 * v53];
        uint64_t v35 = v55 + 32;
        __p = v56;
        uint64_t v97 = v57;
        if (v48) {
          goto LABEL_32;
        }
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v54 = 0;
      unint64_t v55 = (char *)(32 * v50);
      *(void *)unint64_t v55 = v40;
      *((void *)v55 + 1) = v41;
      *((void *)v55 + 2) = v42;
      *((void *)v55 + 3) = v43;
      uint64_t v56 = (char *)(32 * v50);
      if (v48 == v49) {
        goto LABEL_27;
      }
    }
    do
    {
      long long v58 = *((_OWORD *)v48 - 1);
      *((_OWORD *)v56 - 2) = *((_OWORD *)v48 - 2);
      *((_OWORD *)v56 - 1) = v58;
      v56 -= 32;
      v48 -= 4;
    }
    while (v48 != v49);
    unint64_t v48 = v49;
    uint64_t v59 = &v54[32 * v53];
    uint64_t v35 = v55 + 32;
    __p = v56;
    uint64_t v97 = v59;
    if (v49) {
LABEL_32:
    }
      operator delete(v48);
LABEL_15:
    unint64_t v96 = (unint64_t)v35;
  }
  *(void *)&long long v101 = &__p;
  *((void *)&v101 + 1) = v94;
  if ((char *)v17 - (char *)v16 < 1025)
  {
LABEL_37:
    uint64_t v64 = 0;
    unint64_t v61 = 0;
  }
  else
  {
    uint64_t v60 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    unint64_t v61 = ((char *)v17 - (char *)v16) >> 3;
    while (1)
    {
      id v62 = (uint64_t *)operator new(8 * v61, v60);
      if (v62) {
        break;
      }
      BOOL v63 = v61 > 1;
      v61 >>= 1;
      if (!v63) {
        goto LABEL_37;
      }
    }
    uint64_t v64 = v62;
  }
  *(void *)&double v70 = sub_1C49CB850(v16->i64, v17, &v101, ((char *)v17 - (char *)v16) >> 3, v64, v61).n128_u64[0];
  if (v64) {
    operator delete(v64);
  }
  uint64_t v71 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v72 = objc_msgSend_strokeCount(self, v65, v66, v67, v68, v69, v70);
  float v81 = objc_msgSend_arrayWithCapacity_(v71, v73, v72, v74, v75, v76);
  double v82 = v98;
  if (v99 != (__int8 *)v98)
  {
    if ((unint64_t)((v99 - (__int8 *)v98) >> 3) <= 1) {
      uint64_t v83 = 1;
    }
    else {
      uint64_t v83 = (v99 - (__int8 *)v98) >> 3;
    }
    uint64_t v84 = (uint64_t *)v98;
    do
    {
      uint64_t v85 = *v84++;
      uint64_t v86 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v77, v85, v78, v79, v80);
      objc_msgSend_addObject_(v81, v87, (uint64_t)v86, v88, v89, v90);

      --v83;
    }
    while (v83);
  }
  CGRect v91 = objc_msgSend_drawingWithStrokesFromIndexArray_(self, v77, (uint64_t)v81, v78, v79, v80);
  if (v93) {
    *CGRect v93 = v81;
  }

  if (__p)
  {
    unint64_t v96 = (unint64_t)__p;
    operator delete(__p);
  }
  if (v82) {
    operator delete(v82);
  }
  return v91;
}

- (id)drawingScaledByFactor:(double)a3
{
  return (id)objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(self, a2, v3, v4, v5, v6, 0.0, 0.0, a3);
}

- (id)drawingTransformedWithTranslation:(CGVector)a3 scaleFactor:(double)a4
{
  dCGFloat y = a3.dy;
  dCGFloat x = a3.dx;
  if (a4 == 1.0 && a3.dx == 0.0 && a3.dy == 0.0)
  {
    uint64_t v12 = (CHDrawing *)objc_msgSend_copy(self, a2, v4, v5, v6, v7);
  }
  else
  {
    uint64_t v12 = objc_alloc_init(CHDrawing);
    for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v14, v15, v16, v17, v18); ++i)
    {
      for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v20, i, v21, v22, v23); ++j)
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(self, v25, i, j, v28, v29);
        objc_msgSend_addPoint_(v12, v32, v33, v34, v35, v36, (dx + v30) * a4, (dy + v31) * a4);
      }
      objc_msgSend_endStroke(v12, v25, v26, v27, v28, v29);
    }
  }
  return v12;
}

- (id)drawingSpatiallyResampled:(double)a3 outputPointMap:(void *)a4
{
  STACK[0xF78] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend_copy(self, a2, (uint64_t)a4, v4, v5, v6);
  if (v9) {
    sub_1C49C6374((uint64_t)&STACK[0xCC0], v9 + 128);
  }
  bzero(&STACK[0xCC0], 0x280uLL);
  sub_1C49C5610((uint64_t)&STACK[0xA40]);
  float v10 = a3;
  sub_1C49BCCF4((uint64_t)&STACK[0xCC0], (uint64_t *)&STACK[0xA40], a4, 0x7FFFFFFFFFFFFFFFLL, v10);
  sub_1C49C6374((uint64_t)&v12, (uint64_t)&STACK[0xA40]);
}

- (id)drawingSpatiallyResampled:(double)a3 maxPointsPerStroke:(int64_t)a4
{
  STACK[0xF78] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend_copy(self, a2, a4, v4, v5, v6);
  if (v9) {
    sub_1C49C6374((uint64_t)&STACK[0xCC0], v9 + 128);
  }
  bzero(&STACK[0xCC0], 0x280uLL);
  sub_1C49C5610((uint64_t)&STACK[0xA40]);
  float v10 = a3;
  sub_1C49BCCF4((uint64_t)&STACK[0xCC0], (uint64_t *)&STACK[0xA40], 0, a4, v10);
  sub_1C49C6374((uint64_t)&v12, (uint64_t)&STACK[0xA40]);
}

- (id)drawingSpatiallyResampled:(double)a3
{
  return (id)((uint64_t (*)(CHDrawing *, char *, uint64_t))MEMORY[0x1F4181798])(self, sel_drawingSpatiallyResampled_maxPointsPerStroke_, 0x7FFFFFFFLL);
}

- (id)drawingResampledWithCatmullRomSplineInterpolation:(double)a3
{
  STACK[0xF78] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_copy(self, a2, v3, v4, v5, v6);
  if (v8) {
    sub_1C49C6374((uint64_t)&STACK[0xCC0], v8 + 128);
  }
  bzero(&STACK[0xCC0], 0x280uLL);
  sub_1C49C5610((uint64_t)&STACK[0xA40]);
  float v9 = a3;
  CHDrawingStrokes::resampleStrokesWithCatmullRomSplineInterpolation((CHDrawingStrokes *)&STACK[0xCC0], (CHDrawingStrokes *)&STACK[0xA40], v9);
  sub_1C49C6374((uint64_t)&v11, (uint64_t)&STACK[0xA40]);
}

- (CHDrawing)drawingWithLastStrokes:(int64_t)a3
{
  uint64_t v8 = objc_msgSend_strokeCount(self, a2, a3, v3, v4, v5);
  uint64_t v9 = v8 - a3;
  if (v8 <= a3)
  {
    uint64_t v15 = self;
  }
  else
  {
    uint64_t v10 = v8;
    uint64_t v15 = objc_alloc_init(CHDrawing);
    uint64_t v16 = v9 & ~(v9 >> 63);
    if (v16 < v10)
    {
      do
      {
        for (unint64_t i = 0; i < objc_msgSend_pointCountForStrokeIndex_(self, v11, v16, v12, v13, v14); ++i)
        {
          objc_msgSend_pointForStrokeIndex_pointIndex_(self, v18, v16, i, v21, v22);
          objc_msgSend_addPoint_(v15, v23, v24, v25, v26, v27);
        }
        objc_msgSend_endStroke(v15, v18, v19, v20, v21, v22);
        ++v16;
      }
      while (v16 != v10);
    }
  }
  return v15;
}

- (id)singleStrokeDrawing
{
  if ((unint64_t)objc_msgSend_strokeCount(self, a2, v2, v3, v4, v5) > 1)
  {
    uint64_t v14 = objc_alloc_init(CHDrawing);
    for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v9, v10, v11, v12, v13); ++i)
    {
      for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(self, v16, i, v18, v19, v20); ++j)
      {
        objc_msgSend_pointForStrokeIndex_pointIndex_(self, v9, i, j, v12, v13);
        objc_msgSend_addPoint_(v14, v22, v23, v24, v25, v26);
      }
    }
    objc_msgSend_endStroke(v14, v16, v17, v18, v19, v20);
    uint64_t v7 = v14;
  }
  else
  {
    uint64_t v7 = self;
  }
  return v7;
}

- (vector<long,)strokeIndicesSortedByMinXCoordinate
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  begin = self->_drawing.strokes.__begin_;
  p_strokes = (uint64_t *)&self->_drawing.strokes;
  end = self->_drawing.strokes.__end_;
  uint64_t v6 = end - begin;
  if (end != begin)
  {
    int64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3) - (*((void *)end - 2) == *((void *)end - 3));
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      int64_t v11 = 0;
      while (1)
      {
        while (v10 < v9)
        {
          *v10++ = v11;
          uint64_t v12 = v10;
          retstr->var1 = v10;
          if (++v11 == v7) {
            goto LABEL_35;
          }
        }
        uint64_t v13 = v10 - v8;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61) {
          sub_1C494A220();
        }
        if (((char *)v9 - (char *)v8) >> 2 > v14) {
          unint64_t v14 = ((char *)v9 - (char *)v8) >> 2;
        }
        if ((unint64_t)((char *)v9 - (char *)v8) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v14;
        }
        if (v15)
        {
          if (v15 >> 61) {
            sub_1C4949AA8();
          }
          uint64_t v16 = operator new(8 * v15);
          uint64_t v17 = (int64_t *)&v16[8 * v13];
          int64_t *v17 = v11;
          uint64_t v12 = v17 + 1;
          int64_t v18 = (char *)v10 - (char *)v8;
          if (v10 == v8) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v16 = 0;
          uint64_t v17 = (int64_t *)(8 * v13);
          *(void *)(8 * v13) = v11;
          uint64_t v12 = (int64_t *)(8 * v13 + 8);
          int64_t v18 = (char *)v10 - (char *)v8;
          if (v10 == v8) {
            goto LABEL_20;
          }
        }
        unint64_t v19 = v18 - 8;
        if (v19 >= 0x168)
        {
          unint64_t v22 = ((char *)(v10 - 1) - (char *)v8) & 0xFFFFFFFFFFFFFFF8;
          if (&v16[(char *)v10 - (char *)v8 - 8 - v22] > &v16[(char *)v10 - (char *)v8 - 8])
          {
            uint64_t v20 = v10;
          }
          else if ((int64_t *)((char *)v10 - v22 - 8) > v10 - 1)
          {
            uint64_t v20 = v10;
          }
          else if ((unint64_t)((char *)v8 - v16) >= 0x20)
          {
            uint64_t v23 = (v19 >> 3) + 1;
            uint64_t v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
            uint64_t v20 = &v10[v24 / 0xFFFFFFFFFFFFFFF8];
            uint64_t v17 = (int64_t *)((char *)v17 - v24);
            uint64_t v25 = &v16[8 * v13 - 16];
            uint64_t v26 = v10 - 2;
            uint64_t v27 = v23 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v28 = *(_OWORD *)v26;
              *(v25 - 1) = *((_OWORD *)v26 - 1);
              *uint64_t v25 = v28;
              v25 -= 2;
              v26 -= 4;
              v27 -= 4;
            }
            while (v27);
            if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v20 = v10;
          }
        }
        else
        {
          uint64_t v20 = v10;
        }
        do
        {
          int64_t v21 = *--v20;
          *--uint64_t v17 = v21;
        }
        while (v20 != v8);
LABEL_20:
        uint64_t v9 = (int64_t *)&v16[8 * v15];
        retstr->var0 = v17;
        retstr->var1 = v12;
        retstr->var2.var0 = v9;
        if (v8) {
          operator delete(v8);
        }
        uint64_t v8 = v17;
        retstr->var1 = v12;
        ++v11;
        uint64_t v10 = v12;
        if (v11 == v7) {
          goto LABEL_35;
        }
      }
    }
  }
  uint64_t v12 = 0;
  uint64_t v8 = 0;
LABEL_35:
  unint64_t v29 = 126 - 2 * __clz(v12 - v8);
  uint64_t v33 = p_strokes;
  if (v12 == v8) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v29;
  }
  return (vector<long, std::allocator<long>> *)sub_1C49C7F5C((unint64_t)v8, v12, &v33, v30, 1);
}

- (void)setLineHeight:(double)a3
{
  *(double *)&self[2].super.isa = a3;
}

- (void)appendSegment:(id)a3 fromDrawing:(id)a4
{
  id v70 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_startCutPoint(v70, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_strokeIndex(v12, v13, v14, v15, v16, v17);

  uint64_t v24 = objc_msgSend_endCutPoint(v70, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_strokeIndex(v24, v25, v26, v27, v28, v29);

  uint64_t v36 = objc_msgSend_startCutPoint(v70, v31, v32, v33, v34, v35);
  uint64_t v42 = objc_msgSend_pointIndex(v36, v37, v38, v39, v40, v41);

  if (v18 <= v30)
  {
    uint64_t v48 = v18;
    do
    {
      if (v48 != v18) {
        uint64_t v42 = 0;
      }
      uint64_t v50 = objc_msgSend_endCutPoint(v70, v43, v44, v45, v46, v47);
      uint64_t v56 = objc_msgSend_pointIndex(v50, v51, v52, v53, v54, v55);

      uint64_t v61 = objc_msgSend_pointCountForStrokeIndex_(v6, v57, v48, v58, v59, v60);
      uint64_t v62 = v61 - 1;
      if (v61 >= 1)
      {
        if (v48 == v30) {
          uint64_t v62 = v56;
        }
        if (v42 <= v62)
        {
          uint64_t v63 = v62 + 1;
          uint64_t v64 = v42;
          do
          {
            objc_msgSend_pointForStrokeIndex_pointIndex_(v6, v43, v48, v64, v46, v47);
            objc_msgSend_addPoint_(self, v65, v66, v67, v68, v69);
            ++v64;
          }
          while (v63 != v64);
        }
        objc_msgSend_endStroke(self, v43, v44, v45, v46, v47);
      }
    }
    while (v48++ != v30);
  }
}

- (void)appendDrawing:(id)a3
{
  id v25 = a3;
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(v25, v4, v5, v6, v7, v8); ++i)
  {
    for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v25, v10, i, v11, v12, v13); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(v25, v15, i, j, v18, v19);
      objc_msgSend_addPoint_(self, v20, v21, v22, v23, v24);
    }
    objc_msgSend_endStroke(self, v15, v16, v17, v18, v19);
  }
}

- (double)averageCharacterHeightEstimation:(double)a3 minChunkHeight:(double)a4
{
  __p = 0;
  float v81 = 0;
  double v82 = 0;
  unint64_t v9 = objc_msgSend_strokeCount(self, a2, v4, v5, v6, v7);
  unint64_t v15 = v9;
  if (v9)
  {
    if (v9 >> 59) {
      sub_1C494A220();
    }
    __p = (char *)operator new(32 * v9);
    float v81 = __p;
    double v82 = &__p[32 * v15];
  }
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(self, v10, v11, v12, v13, v14); ++i)
  {
    objc_msgSend_boundsForStrokeIndex_(self, v18, i, v19, v20, v21);
    uint64_t v26 = v22;
    uint64_t v27 = v23;
    uint64_t v28 = v24;
    uint64_t v29 = v25;
    uint64_t v30 = v81;
    if (v81 < v82)
    {
      *(void *)float v81 = v22;
      *((void *)v81 + 1) = v23;
      uint64_t v17 = v81 + 32;
      *((void *)v81 + 2) = v24;
      *((void *)v81 + 3) = v25;
      goto LABEL_6;
    }
    uint64_t v31 = (v81 - __p) >> 5;
    unint64_t v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 59) {
      sub_1C494A220();
    }
    uint64_t v33 = v82 - __p;
    if ((v82 - __p) >> 4 > v32) {
      unint64_t v32 = v33 >> 4;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v34 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v34)
    {
      if (v34 >> 59) {
        sub_1C4949AA8();
      }
      uint64_t v35 = (char *)operator new(32 * v34);
      uint64_t v36 = &v35[32 * v31];
      *(void *)uint64_t v36 = v26;
      *((void *)v36 + 1) = v27;
      *((void *)v36 + 2) = v28;
      *((void *)v36 + 3) = v29;
      uint64_t v37 = (uint64_t)v36;
      if (v81 == __p)
      {
LABEL_18:
        uint64_t v17 = v36 + 32;
        __p = (char *)v37;
        double v82 = &v35[32 * v34];
        if (v81) {
          goto LABEL_23;
        }
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v36 = (char *)(32 * v31);
      *(void *)uint64_t v36 = v22;
      *((void *)v36 + 1) = v23;
      *((void *)v36 + 2) = v24;
      *((void *)v36 + 3) = v25;
      uint64_t v37 = 32 * v31;
      if (v81 == __p) {
        goto LABEL_18;
      }
    }
    do
    {
      long long v38 = *((_OWORD *)v30 - 1);
      *(_OWORD *)(v37 - 32) = *((_OWORD *)v30 - 2);
      *(_OWORD *)(v37 - 16) = v38;
      v37 -= 32;
      v30 -= 32;
    }
    while (v30 != __p);
    uint64_t v30 = __p;
    uint64_t v17 = v36 + 32;
    __p = (char *)v37;
    double v82 = &v35[32 * v34];
    if (v30) {
LABEL_23:
    }
      operator delete(v30);
LABEL_6:
    float v81 = v17;
  }
  unint64_t v39 = 126 - 2 * __clz((v81 - __p) >> 5);
  if (v81 == __p) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = v39;
  }
  sub_1C49CC6A8((unint64_t)__p, (CGRect *)v81, v40, 1);
  uint64_t v46 = 0;
  unint64_t v47 = 0;
  uint64_t v48 = 0;
  CGFloat v49 = *MEMORY[0x1E4F1DB20];
  double v50 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double MaxX = -1.79769313e308;
  double v77 = 0.0;
  CGFloat v78 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v72 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v73 = *MEMORY[0x1E4F1DB20];
  CGFloat v79 = v72;
  CGFloat r2 = v78;
  double v74 = v50;
  while (v47 < objc_msgSend_strokeCount(self, v41, v42, v43, v44, v45, *(void *)&r2, *(void *)&v72, *(void *)&v73, *(void *)&v74))
  {
    CGFloat x = *(double *)&__p[v46];
    CGFloat y = *(double *)&__p[v46 + 8];
    CGFloat width = *(double *)&__p[v46 + 16];
    CGFloat height = *(double *)&__p[v46 + 24];
    v83.origin.CGFloat x = x;
    v83.origin.CGFloat y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v83);
    v84.origin.CGFloat x = v49;
    v84.size.CGFloat width = v78;
    v84.origin.CGFloat y = v79;
    v84.size.CGFloat height = v50;
    BOOL IsNull = CGRectIsNull(v84);
    char v58 = MinX - MaxX < a3 || IsNull;
    if ((v58 & 1) != 0 || v50 < a4)
    {
      v85.origin.CGFloat x = v49;
      v85.size.CGFloat width = v78;
      v85.origin.CGFloat y = v79;
      v85.size.CGFloat height = v50;
      v89.origin.CGFloat x = x;
      v89.origin.CGFloat y = y;
      v89.size.CGFloat width = width;
      v89.size.CGFloat height = height;
      CGRect v86 = CGRectUnion(v85, v89);
      CGFloat x = v86.origin.x;
      CGFloat y = v86.origin.y;
      CGFloat width = v86.size.width;
      CGFloat height = v86.size.height;
    }
    else
    {
      ++v48;
      double v77 = v50 + v77;
      double v72 = v79;
      CGFloat v73 = v49;
      CGFloat r2 = v78;
      double v74 = v50;
    }
    CGFloat v49 = x;
    CGFloat v78 = width;
    CGFloat v79 = y;
    double v50 = height;
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v87);
    ++v47;
    v46 += 32;
  }
  if (v50 >= a4 || v48 <= 0)
  {
    double v60 = v50 + v77;
    ++v48;
    uint64_t v61 = __p;
    if (!__p) {
      return v60 / (double)v48;
    }
LABEL_43:
    operator delete(v61);
    return v60 / (double)v48;
  }
  CGFloat v63 = v49;
  CGFloat v65 = v78;
  CGFloat v64 = v79;
  double v66 = v50;
  double v68 = v72;
  CGFloat v67 = v73;
  CGFloat v69 = r2;
  double v70 = v74;
  CGRect v88 = CGRectUnion(*(CGRect *)&v63, *(CGRect *)&v67);
  double v60 = v77 - v74 + v88.size.height;
  uint64_t v61 = __p;
  if (__p) {
    goto LABEL_43;
  }
  return v60 / (double)v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  STACK[0x598] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  if (objc_msgSend_init(v10, v11, v12, v13, v14, v15)) {
    sub_1C49C6374((uint64_t)&v17, (uint64_t)&self->_drawing);
  }
  return 0;
}

- (void)writeToFile
{
  uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, v2, v3, v4, v5);
  objc_msgSend_UUIDString(v7, v8, v9, v10, v11, v12);
  id v65 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v14 = NSTemporaryDirectory();
  uint64_t v19 = objc_msgSend_fileURLWithPath_(v13, v15, (uint64_t)v14, v16, v17, v18);
  uint64_t v24 = objc_msgSend_URLByAppendingPathComponent_(v19, v20, (uint64_t)v65, v21, v22, v23);

  id v25 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v25, v26, @"dd-MM-yyyy-HH-mm-ss-SSS", v27, v28, v29);
  uint64_t v35 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v30, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_stringFromDate_(v25, v36, (uint64_t)v35, v37, v38, v39);

  uint64_t v46 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v41, v42, v43, v44, v45);
  uint64_t v52 = objc_msgSend_UUIDString(v46, v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_substringToIndex_(v52, v53, 4, v54, v55, v56);

  uint64_t v62 = objc_msgSend_stringWithFormat_(NSString, v58, @"/drawing_%@-%@.json", v59, v60, v61, v40, v57);
  objc_msgSend_writeToFileWithContext_folder_basename_(self, v63, (uint64_t)&unk_1F203CF90, (uint64_t)v24, (uint64_t)v62, v64);
}

- (void)writeToFileWithContext:(id)a3 folder:(id)a4 basename:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v16 = objc_msgSend_absoluteString(v8, v11, v12, v13, v14, v15);
  char v21 = objc_msgSend_fileExistsAtPath_(v10, v17, (uint64_t)v16, v18, v19, v20);

  if (v21)
  {
    id v26 = 0;
LABEL_4:
    uint64_t v28 = objc_msgSend_jsonRepresentationWithContext_(self, v22, (uint64_t)v47, v23, v24, v25);
    uint64_t v31 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v29, (uint64_t)v28, 1, 0, v30);
    uint64_t v36 = objc_msgSend_URLByAppendingPathComponent_(v8, v32, (uint64_t)v9, v33, v34, v35);
    id v48 = 0;
    objc_msgSend_writeToURL_options_error_(v31, v37, (uint64_t)v36, 1, (uint64_t)&v48, v38);
    id v39 = v48;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v40 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = objc_msgSend_absoluteString(v36, v41, v42, v43, v44, v45);
      *(_DWORD *)buf = 138412546;
      id v51 = v46;
      __int16 v52 = 2112;
      id v53 = v39;
      _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_DEFAULT, "Drawing writeToFile saving drawing at URL %@, error = %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  id v49 = 0;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v10, v22, (uint64_t)v8, 1, 0, (uint64_t)&v49);
  id v26 = v49;
  if (DirectoryAtURL_withIntermediateDirectories_attributes_error) {
    goto LABEL_4;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v28 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v51 = v8;
    __int16 v52 = 2112;
    id v53 = v26;
    _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_ERROR, "Drawing unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
LABEL_9:
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end