@interface CHGroupingModel
+ (CHGroupingModel)modelWithModelName:(id)a3 contentType:(int64_t)a4;
+ (void)setup;
- (CHGroupingModel)initWithModelName:(id)a3 model:(void *)a4 contentType:(int64_t)a5;
- (NSArray)supportedConfigurationsNumStrokes;
- (NSString)modelName;
- (float)coordinateNormalizationFactor;
- (float)interpolationDistance;
- (id)extractBBoxFeaturesForDrawing:(id)a3 padTo:(int64_t)a4;
- (id)extractSignalFeaturesFromDrawing:(id)a3 padTo:(int64_t)a4;
- (id)extractSignalMaskFromDrawing:(id)a3 padTo:(int64_t)a4;
- (id)groupStrokes:(id)a3 previousAdjacencies:(const void *)a4 updatedAdjacencies:(void *)a5;
- (id)normalizedDrawing:(id)a3;
- (id)strokesSortedByMidY:(id)a3;
- (int64_t)_closestConfigurationForInputStrokes:(int64_t)a3;
- (int64_t)_tileIndexForYPosition:(double)a3 tileHeight:(int64_t)a4;
- (int64_t)contentType;
- (int64_t)usageCount;
- (unint64_t)maxNumPointsPerStroke;
- (unint64_t)maxNumStrokes;
- (unint64_t)numBBoxFeaturesPerStroke;
- (unint64_t)numOverlapStrokes;
- (unint64_t)numSignalFeaturesPerPoint;
- (unint64_t)recognitionTileHeight;
- (unint64_t)tileOverlapHeight;
- (void)createTilesForInputStrokes:(id)a3 subtileStartIndexes:(id *)a4 strokesForSubtile:(id *)a5;
- (void)dealloc;
- (void)decrementUsageCount;
- (void)incrementUsageCount;
@end

@implementation CHGroupingModel

+ (void)setup
{
  if (qword_1EA3C8F60 != -1) {
    dispatch_once(&qword_1EA3C8F60, &unk_1F2012E70);
  }
}

+ (CHGroupingModel)modelWithModelName:(id)a3 contentType:(int64_t)a4
{
  id v5 = a3;
  objc_msgSend_setup(CHGroupingModel, v6, v7, v8, v9, v10);
  v11 = qword_1EA3C9330;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = sub_1C4B0CFB8;
  v23 = &unk_1E64E1258;
  id v12 = v5;
  id v24 = v12;
  int64_t v25 = a4;
  dispatch_sync(v11, &v20);
  objc_msgSend_incrementUsageCount((void *)qword_1EA3C9338, v13, v14, v15, v16, v17, v20, v21, v22, v23);
  v18 = (CHGroupingModel *)(id)qword_1EA3C9338;

  return v18;
}

- (CHGroupingModel)initWithModelName:(id)a3 model:(void *)a4 contentType:(int64_t)a5
{
  v20[4] = *MEMORY[0x1E4F143B8];
  objc_msgSend_setup(CHGroupingModel, a2, (uint64_t)a3, (uint64_t)a4, a5, v5);
  self->_contentType = a5;
  self->_modelUseCount = 0;
  self->_inferenceCount = 0;
  self->_model = a4;
  *(_OWORD *)&self->_maxNumStrokes = xmmword_1C4C43E50;
  *(_OWORD *)&self->_numOverlapStrokes = xmmword_1C4C43E60;
  *(void *)&self->_interpolationDistance = 0x448000003F800000;
  *(_OWORD *)&self->_numSignalFeaturesPerPoint = xmmword_1C4C43E70;
  self->_tileOverlapHeight = 100;
  v20[0] = &unk_1F203EF88;
  v20[1] = &unk_1F203EFA0;
  v20[2] = &unk_1F203EFB8;
  v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, 250, v10, v11, v12);
  v20[3] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v20, 4, v15, v16);
  uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedConfigurationsNumStrokes = self->_supportedConfigurationsNumStrokes;
  self->_supportedConfigurationsNumStrokes = v17;

  return self;
}

- (void)incrementUsageCount
{
}

- (void)decrementUsageCount
{
}

- (int64_t)usageCount
{
  return self->_modelUseCount;
}

- (void)dealloc
{
  if (qword_1EA3C9338)
  {
    objc_msgSend_decrementUsageCount((void *)qword_1EA3C9338, a2, v2, v3, v4, v5);
    if (!objc_msgSend_usageCount((void *)qword_1EA3C9338, v7, v8, v9, v10, v11))
    {
      model = (void **)self->_model;
      if (model)
      {
        CoreHandwriting::EspressoModelWrapper::~EspressoModelWrapper(model);
        MEMORY[0x1C8786460]();
      }
      self->_model = 0;
      v13 = (void *)qword_1EA3C9338;
      qword_1EA3C9338 = 0;

      objc_msgSend_logModelUnloaded_((void *)qword_1EA3C9340, v14, 1, v15, v16, v17);
      v18 = (void *)qword_1EA3C9340;
      qword_1EA3C9340 = 0;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CHGroupingModel;
  [(CHGroupingModel *)&v19 dealloc];
}

- (id)extractBBoxFeaturesForDrawing:(id)a3 padTo:(int64_t)a4
{
  v97[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v97[0] = &unk_1F203EFD0;
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a4, v9, v10, v11);
  v97[1] = v12;
  v97[2] = &unk_1F203EFD0;
  v13 = NSNumber;
  uint64_t v19 = objc_msgSend_numBBoxFeaturesPerStroke(self, v14, v15, v16, v17, v18);
  id v24 = objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v97[3] = v24;
  v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v97, 4, v26, v27);
  v31 = objc_msgSend_initWithShape_dataType_error_(v7, v29, (uint64_t)v28, 65568, 0, v30);

  objc_msgSend_fillWithNumber_(v31, v32, (uint64_t)&unk_1F203F490, v33, v34, v35);
  id v36 = v31;
  uint64_t v47 = objc_msgSend_dataPointer(v36, v37, v38, v39, v40, v41);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(v6, v42, v43, v44, v45, v46); ++i)
  {
    uint64_t v54 = objc_msgSend_numBBoxFeaturesPerStroke(self, v49, v50, v51, v52, v53);
    objc_msgSend_boundsForStrokeIndex_(v6, v55, i, v56, v57, v58);
    CGFloat x = v99.origin.x;
    CGFloat y = v99.origin.y;
    CGFloat width = v99.size.width;
    CGFloat height = v99.size.height;
    double MinX = CGRectGetMinX(v99);
    objc_msgSend_coordinateNormalizationFactor(self, v64, v65, v66, v67, v68);
    unint64_t v69 = v54 * i;
    float v71 = MinX / v70;
    *(float *)(v47 + 4 * v69) = v71;
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.CGFloat width = width;
    v100.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v100);
    objc_msgSend_coordinateNormalizationFactor(self, v73, v74, v75, v76, v77);
    float v79 = MinY / v78;
    *(float *)(v47 + 4 * v69 + 4) = v79;
    v101.origin.CGFloat x = x;
    v101.origin.CGFloat y = y;
    v101.size.CGFloat width = width;
    v101.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v101);
    objc_msgSend_coordinateNormalizationFactor(self, v81, v82, v83, v84, v85);
    float v87 = MaxX / v86;
    *(float *)(v47 + 4 * v69 + 8) = v87;
    v102.origin.CGFloat x = x;
    v102.origin.CGFloat y = y;
    v102.size.CGFloat width = width;
    v102.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v102);
    objc_msgSend_coordinateNormalizationFactor(self, v89, v90, v91, v92, v93);
    float v95 = MaxY / v94;
    *(float *)(v47 + 4 * v69 + 12) = v95;
  }

  return v36;
}

- (id)extractSignalFeaturesFromDrawing:(id)a3 padTo:(int64_t)a4
{
  v98[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v98[0] = &unk_1F203EFD0;
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a4, v9, v10, v11);
  v98[1] = v12;
  v13 = NSNumber;
  uint64_t v19 = objc_msgSend_maxNumPointsPerStroke(self, v14, v15, v16, v17, v18);
  id v24 = objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v98[2] = v24;
  int64_t v25 = NSNumber;
  uint64_t v31 = objc_msgSend_numSignalFeaturesPerPoint(self, v26, v27, v28, v29, v30);
  id v36 = objc_msgSend_numberWithUnsignedInteger_(v25, v32, v31, v33, v34, v35);
  v98[3] = v36;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v98, 4, v38, v39);
  uint64_t v43 = objc_msgSend_initWithShape_dataType_error_(v7, v41, (uint64_t)v40, 65568, 0, v42);

  objc_msgSend_fillWithNumber_(v43, v44, (uint64_t)&unk_1F203F490, v45, v46, v47);
  id v48 = v43;
  uint64_t v59 = objc_msgSend_dataPointer(v48, v49, v50, v51, v52, v53);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(v6, v54, v55, v56, v57, v58); ++i)
  {
    for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v6, v61, i, v62, v63, v64); ++j)
    {
      objc_msgSend_pointForStrokeIndex_pointIndex_(v6, v54, i, j, v57, v58);
      double v67 = v66;
      double v69 = v68;
      uint64_t v75 = objc_msgSend_maxNumPointsPerStroke(self, v70, v71, v72, v73, v74);
      uint64_t v81 = objc_msgSend_numSignalFeaturesPerPoint(self, v76, v77, v78, v79, v80);
      objc_msgSend_coordinateNormalizationFactor(self, v82, v83, v84, v85, v86);
      unint64_t v87 = v81 * (j + i * v75);
      float v89 = v67 / v88;
      *(float *)(v59 + 4 * v87) = v89;
      objc_msgSend_coordinateNormalizationFactor(self, v90, v91, v92, v93, v94);
      float v96 = v69 / v95;
      *(float *)(v59 + 4 * v87 + 4) = v96;
    }
  }

  return v48;
}

- (id)extractSignalMaskFromDrawing:(id)a3 padTo:(int64_t)a4
{
  v55[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v55[0] = &unk_1F203EFD0;
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v8, a4, v9, v10, v11);
  v55[1] = v12;
  v13 = NSNumber;
  uint64_t v19 = objc_msgSend_maxNumPointsPerStroke(self, v14, v15, v16, v17, v18);
  id v24 = objc_msgSend_numberWithUnsignedInteger_(v13, v20, v19, v21, v22, v23);
  v55[2] = v24;
  v55[3] = &unk_1F203EFD0;
  uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v55, 4, v26, v27);
  uint64_t v31 = objc_msgSend_initWithShape_dataType_error_(v7, v29, (uint64_t)v28, 65568, 0, v30);

  objc_msgSend_fillWithNumber_(v31, v32, (uint64_t)&unk_1F203F490, v33, v34, v35);
  id v36 = v31;
  uint64_t v47 = objc_msgSend_dataPointer(v36, v37, v38, v39, v40, v41);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(v6, v42, v43, v44, v45, v46); ++i)
  {
    for (unint64_t j = 0; j < objc_msgSend_pointCountForStrokeIndex_(v6, v49, i, v50, v51, v52); ++j)
      *(_DWORD *)(v47 + 4 * (j + i * objc_msgSend_maxNumPointsPerStroke(self, v42, v43, v44, v45, v46))) = 1065353216;
  }

  return v36;
}

- (id)strokesSortedByMidY:(id)a3
{
  id v6 = objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1F20113D0, v3, v4, v5);
  return v6;
}

- (id)normalizedDrawing:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_pointCount(v4, v5, v6, v7, v8, v9))
  {
    objc_msgSend_bounds(v4, v10, v11, v12, v13, v14);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  objc_msgSend_bounds(v4, v10, v11, v12, v13, v14);
  double v20 = v19;
  objc_msgSend_coordinateNormalizationFactor(self, v21, v22, v23, v24, v25);
  double v32 = 1.0;
  if (v20 > v31)
  {
    objc_msgSend_coordinateNormalizationFactor(self, v26, v27, v28, v29, v30);
    float v34 = v33;
    objc_msgSend_bounds(v4, v35, v36, v37, v38, v39);
    double v41 = v40;
    double v42 = v34;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    double v32 = v42 / v41;
    uint64_t v43 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_bounds(v4, v44, v45, v46, v47, v48);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v32;
      _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_DEBUG, "Input too wide (%f): adjust with scale factor %f", buf, 0x16u);
    }
  }
  objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v4, v26, v27, v28, v29, v30, -v16, -v18, v32);
  uint64_t v50 = (CoreHandwriting *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interpolationDistance(self, v51, v52, v53, v54, v55);
  v80[0] = &unk_1F2011E50;
  *(double *)&v80[1] = v61;
  int v81 = 1;
  int v82 = objc_msgSend_maxNumPointsPerStroke(self, v56, v57, v58, v59, v60);
  CoreHandwriting::drawingToInk(v50, MEMORY[0x1E4F1DAD8], (uint64_t *)&v77);
  sub_1C4A378E0((uint64_t)v80, (uint64_t)&v77, 0, (uint64_t)buf);
  if (__p) {
    operator delete(__p);
  }
  uint64_t v63 = (char *)v77;
  if (v77)
  {
    uint64_t v64 = v78;
    uint64_t v65 = v77;
    if (v78 != v77)
    {
      double v66 = v78;
      do
      {
        double v68 = (void *)*((void *)v66 - 3);
        v66 -= 24;
        double v67 = v68;
        if (v68)
        {
          *((void *)v64 - 2) = v67;
          operator delete(v67);
        }
        uint64_t v64 = v66;
      }
      while (v66 != v63);
      uint64_t v65 = v77;
    }
    uint64_t v78 = v63;
    operator delete(v65);
  }
  double v69 = CoreHandwriting::inkToDrawing((uint64_t **)buf, v62);
  if (v84) {
    operator delete(v84);
  }
  uint64_t v70 = *(void *)buf;
  if (*(void *)buf)
  {
    uint64_t v71 = *(void *)&buf[8];
    uint64_t v72 = *(void **)buf;
    if (*(void *)&buf[8] != *(void *)buf)
    {
      uint64_t v73 = *(void *)&buf[8];
      do
      {
        uint64_t v75 = *(void **)(v73 - 24);
        v73 -= 24;
        uint64_t v74 = v75;
        if (v75)
        {
          *(void *)(v71 - 16) = v74;
          operator delete(v74);
        }
        uint64_t v71 = v73;
      }
      while (v73 != v70);
      uint64_t v72 = *(void **)buf;
    }
    *(void *)&buf[8] = v70;
    operator delete(v72);
  }

  return v69;
}

- (int64_t)_tileIndexForYPosition:(double)a3 tileHeight:(int64_t)a4
{
  uint64_t v4 = vcvtmd_s64_f64(a3 / (double)a4);
  return v4 & ~(v4 >> 63);
}

- (int64_t)_closestConfigurationForInputStrokes:(int64_t)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_maxNumStrokes(self, a2, a3, v3, v4, v5) < (unint64_t)a3)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v13 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v50 = a3;
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_FAULT, "Invalid number of input strokes %li", buf, 0xCu);
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v14 = objc_msgSend_supportedConfigurationsNumStrokes(self, v8, v9, v10, v11, v12, 0);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v44, (uint64_t)v48, 16, v16);
  if (v22)
  {
    uint64_t v23 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v14);
        }
        uint64_t v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend_integerValue(v25, v17, v18, v19, v20, v21) >= a3)
        {
          int64_t v42 = objc_msgSend_integerValue(v25, v17, v18, v19, v20, v21);
          goto LABEL_17;
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v44, (uint64_t)v48, 16, v21);
      if (v22) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = objc_msgSend_supportedConfigurationsNumStrokes(self, v26, v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_lastObject(v14, v31, v32, v33, v34, v35);
  int64_t v42 = objc_msgSend_integerValue(v36, v37, v38, v39, v40, v41);

LABEL_17:
  return v42;
}

- (void)createTilesForInputStrokes:(id)a3 subtileStartIndexes:(id *)a4 strokesForSubtile:(id *)a5
{
  v254 = a5;
  uint64_t v273 = *MEMORY[0x1E4F143B8];
  id v263 = a3;
  v260 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7, v8, v9, v10);
  v261 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12, v13, v14, v15);
  for (unint64_t i = 0; i < objc_msgSend_count(v263, v16, v17, v18, v19, v20, v254); ++i)
  {
    uint64_t v27 = objc_msgSend_objectAtIndex_(v263, v22, i, v24, v25, v26);
    objc_msgSend_bounds(v27, v28, v29, v30, v31, v32);
    double MidY = CGRectGetMidY(v274);
    uint64_t v39 = objc_msgSend_tileOverlapHeight(self, v34, v35, v36, v37, v38);
    uint64_t v45 = objc_msgSend_recognitionTileHeight(self, v40, v41, v42, v43, v44);
    uint64_t v50 = objc_msgSend__tileIndexForYPosition_tileHeight_(self, v46, v45, v47, v48, v49, MidY - (double)(unint64_t)v39);
    objc_msgSend_bounds(v27, v51, v52, v53, v54, v55);
    double v56 = CGRectGetMidY(v275);
    uint64_t v62 = objc_msgSend_tileOverlapHeight(self, v57, v58, v59, v60, v61);
    uint64_t v68 = objc_msgSend_recognitionTileHeight(self, v63, v64, v65, v66, v67);
    uint64_t v73 = objc_msgSend__tileIndexForYPosition_tileHeight_(self, v69, v68, v70, v71, v72, v56 + (double)(unint64_t)v62);
    if (v50 <= v73)
    {
      uint64_t v78 = v73 + 1;
      do
      {
        uint64_t v79 = objc_msgSend_numberWithInteger_(NSNumber, v74, v50, v75, v76, v77);
        float v89 = objc_msgSend_objectForKeyedSubscript_(v261, v80, (uint64_t)v79, v81, v82, v83);
        if (!v89)
        {
          uint64_t v90 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v84, v85, v86, v87, v88);
          objc_msgSend_setObject_forKeyedSubscript_(v261, v91, v90, (uint64_t)v79, v92, v93);
          v98 = objc_msgSend_numberWithInteger_(NSNumber, v94, i, v95, v96, v97);
          objc_msgSend_setObject_forKey_(v260, v99, (uint64_t)v98, (uint64_t)v79, v100, v101);

          float v89 = (void *)v90;
        }
        objc_msgSend_addObject_(v89, v84, (uint64_t)v27, v86, v87, v88);

        ++v50;
      }
      while (v78 != v50);
    }
  }
  CGRect v102 = objc_msgSend_allKeys(v261, v22, v23, v24, v25, v26);
  v256 = objc_msgSend_sortedArrayUsingSelector_(v102, v103, (uint64_t)sel_compare_, v104, v105, v106);

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v107, v108, v109, v110, v111);
  id v267 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v112, v113, v114, v115, v116);
  id v264 = (id)objc_claimAutoreleasedReturnValue();
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  obuint64_t j = v256;
  uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v268, (uint64_t)v272, 16, v118);
  if (v259)
  {
    uint64_t v266 = 0;
    uint64_t v258 = *(void *)v269;
    do
    {
      for (uint64_t j = 0; j != v259; ++j)
      {
        if (*(void *)v269 != v258) {
          objc_enumerationMutation(obj);
        }
        uint64_t v123 = *(void *)(*((void *)&v268 + 1) + 8 * j);
        v265 = objc_msgSend_objectForKeyedSubscript_(v260, v119, v123, v120, v121, v122);
        v128 = objc_msgSend_objectForKeyedSubscript_(v261, v124, v123, v125, v126, v127);
        uint64_t v134 = objc_msgSend_count(v128, v129, v130, v131, v132, v133);

        if (v134 >= (unint64_t)objc_msgSend_maxNumStrokes(self, v135, v136, v137, v138, v139))
        {
          uint64_t v163 = objc_msgSend_maxNumStrokes(self, v140, v141, v142, v143, v144);
          uint64_t v174 = vcvtps_s32_f32((float)v134/ (float)(unint64_t)(v163 - objc_msgSend_numOverlapStrokes(self, v164, v165, v166, v167, v168)));
          if (v174 < 1)
          {
            uint64_t v174 = 0;
          }
          else
          {
            for (uint64_t k = 0; k != v174; ++k)
            {
              uint64_t v176 = objc_msgSend_maxNumStrokes(self, v169, v170, v171, v172, v173);
              uint64_t v182 = objc_msgSend_numOverlapStrokes(self, v177, v178, v179, v180, v181);
              v183 = NSNumber;
              uint64_t v189 = objc_msgSend_integerValue(v265, v184, v185, v186, v187, v188);
              uint64_t v190 = (v176 - v182) * k;
              v195 = objc_msgSend_numberWithInteger_(v183, v191, v189 + v190, v192, v193, v194);
              uint64_t v196 = v266 + k;
              v201 = objc_msgSend_numberWithInteger_(NSNumber, v197, v266 + k, v198, v199, v200);
              objc_msgSend_setObject_forKeyedSubscript_(v267, v202, (uint64_t)v195, (uint64_t)v201, v203, v204);

              uint64_t v215 = v134 - v190;
              if (objc_msgSend_maxNumStrokes(self, v205, v206, v207, v208, v209) < (unint64_t)(v134 - v190)) {
                uint64_t v215 = objc_msgSend_maxNumStrokes(self, v210, v211, v212, v213, v214);
              }
              v216 = (void *)MEMORY[0x1E4F1CA70];
              v217 = (void *)MEMORY[0x1E4F28D60];
              v218 = objc_msgSend_numberWithInteger_(NSNumber, v210, v196, v212, v213, v214);
              v223 = objc_msgSend_objectForKeyedSubscript_(v267, v219, (uint64_t)v218, v220, v221, v222);
              uint64_t v229 = objc_msgSend_integerValue(v223, v224, v225, v226, v227, v228);
              v233 = objc_msgSend_indexSetWithIndexesInRange_(v217, v230, v229, v215, v231, v232);
              v238 = objc_msgSend_objectsAtIndexes_(v263, v234, (uint64_t)v233, v235, v236, v237);
              v243 = objc_msgSend_orderedSetWithArray_(v216, v239, (uint64_t)v238, v240, v241, v242);
              v248 = objc_msgSend_numberWithInteger_(NSNumber, v244, v196, v245, v246, v247);
              objc_msgSend_setObject_forKeyedSubscript_(v264, v249, (uint64_t)v243, (uint64_t)v248, v250, v251);
            }
          }
          uint64_t v162 = v174 + v266;
        }
        else
        {
          v145 = objc_msgSend_numberWithInteger_(NSNumber, v140, v266, v142, v143, v144);
          objc_msgSend_setObject_forKeyedSubscript_(v267, v146, (uint64_t)v265, (uint64_t)v145, v147, v148);

          v153 = objc_msgSend_objectForKeyedSubscript_(v261, v149, v123, v150, v151, v152);
          v158 = objc_msgSend_numberWithInteger_(NSNumber, v154, v266, v155, v156, v157);
          objc_msgSend_setObject_forKeyedSubscript_(v264, v159, (uint64_t)v153, (uint64_t)v158, v160, v161);

          uint64_t v162 = v266 + 1;
        }
        uint64_t v266 = v162;
      }
      uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v119, (uint64_t)&v268, (uint64_t)v272, 16, v122);
    }
    while (v259);
  }

  id v252 = v267;
  *a4 = v252;
  id v253 = v264;
  id *v254 = v253;
}

- (id)groupStrokes:(id)a3 previousAdjacencies:(const void *)a4 updatedAdjacencies:(void *)a5
{
  uint64_t v505 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!objc_msgSend_count(v6, v7, v8, v9, v10, v11))
  {
    objc_msgSend_set(MEMORY[0x1E4F1CA80], v12, v13, v14, v15, v16);
    id v472 = (id)objc_claimAutoreleasedReturnValue();
    v299 = v6;
    goto LABEL_463;
  }
  uint64_t v17 = objc_msgSend_strokesSortedByMidY_(self, v12, (uint64_t)v6, v14, v15, v16);

  unint64_t v23 = 0;
  v492 = 0;
  v493 = 0;
  unint64_t v494 = 0;
  v465 = v17;
  while (v23 < objc_msgSend_count(v17, v18, v19, v20, v21, v22))
  {
    memset(buf, 0, sizeof(buf));
    LODWORD(v499) = 1065353216;
    uint64_t v24 = v493;
    if ((unint64_t)v493 >= v494)
    {
      uint64_t v25 = sub_1C4B11B70(&v492, (uint64_t *)buf);
      uint64_t v26 = *(void **)&buf[16];
      v493 = v25;
      if (*(void *)&buf[16])
      {
        do
        {
          uint64_t v27 = (void *)*v26;
          operator delete(v26);
          uint64_t v26 = v27;
        }
        while (v27);
      }
    }
    else
    {
      *(void *)v493 = 0;
      *((void *)v24 + 1) = 0;
      *((void *)v24 + 2) = 0;
      *((void *)v24 + 3) = 0;
      *((_DWORD *)v24 + 8) = 1065353216;
      v493 = v24 + 40;
    }
    if (*(void *)buf) {
      operator delete(*(void **)buf);
    }
    ++v23;
  }
  uint64_t v28 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v18, v19, v20, v21, v22);
  uint64_t v34 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v29, v30, v31, v32, v33);
  id v490 = v34;
  id v491 = v28;
  objc_msgSend_createTilesForInputStrokes_subtileStartIndexes_strokesForSubtile_(self, v35, (uint64_t)v17, (uint64_t)&v491, (uint64_t)&v490, v36);
  id v462 = v491;

  id v466 = v490;
  uint64_t v42 = objc_msgSend_allKeys(v466, v37, v38, v39, v40, v41);
  uint64_t v47 = objc_msgSend_sortedArrayUsingSelector_(v42, v43, (uint64_t)sel_compare_, v44, v45, v46);

  long long v488 = 0u;
  long long v489 = 0u;
  long long v486 = 0u;
  long long v487 = 0u;
  obuint64_t j = v47;
  uint64_t v463 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v486, (uint64_t)v504, 16, v49);
  if (v463)
  {
    uint64_t v461 = *(void *)v487;
    v467 = (char *)a4 + 8;
    v468 = (void ***)((char *)a5 + 8);
    do
    {
      os_signpost_id_t spid = 0;
      do
      {
        if (*(void *)v487 != v461) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void *)(*((void *)&v486 + 1) + 8 * spid);
        uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v462, v50, v54, v51, v52, v53);
        uint64_t v61 = objc_msgSend_integerValue(v55, v56, v57, v58, v59, v60);

        uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v466, v62, v54, v63, v64, v65);
        uint64_t v72 = objc_msgSend_count(v66, v67, v68, v69, v70, v71);

        uint64_t v77 = objc_msgSend_objectForKeyedSubscript_(v466, v73, v54, v74, v75, v76);
        v473 = objc_msgSend_array(v77, v78, v79, v80, v81, v82);

        unint64_t v88 = 0;
        *(void *)v496 = 0;
        uint64_t v497 = 0;
        v495 = (char *)v496;
        while (v88 < objc_msgSend_count(v473, v83, v84, v85, v86, v87))
        {
          uint64_t v94 = objc_msgSend_objectAtIndexedSubscript_(v473, v89, v88, v91, v92, v93);
          uint64_t v100 = objc_msgSend_encodedStrokeIdentifier(v94, v95, v96, v97, v98, v99);
          unint64_t v106 = objc_msgSend_hash(v100, v101, v102, v103, v104, v105);
          unint64_t v107 = v106;
          uint64_t v108 = *(unsigned char **)v496;
          uint64_t v109 = v496;
          uint64_t v110 = v496;
          if (*(void *)v496)
          {
            while (1)
            {
              while (1)
              {
                uint64_t v110 = (int *)v108;
                unint64_t v111 = *((void *)v108 + 4);
                if (v106 >= v111) {
                  break;
                }
                uint64_t v108 = *(unsigned char **)v110;
                uint64_t v109 = v110;
                if (!*(void *)v110) {
                  goto LABEL_25;
                }
              }
              if (v111 >= v106) {
                break;
              }
              uint64_t v108 = (unsigned char *)*((void *)v110 + 1);
              if (!v108)
              {
                uint64_t v109 = v110 + 2;
                goto LABEL_25;
              }
            }
          }
          else
          {
LABEL_25:
            v112 = operator new(0x28uLL);
            v112[4] = v107;
            void *v112 = 0;
            v112[1] = 0;
            v112[2] = v110;
            *(void *)uint64_t v109 = v112;
            if (*(void *)v495)
            {
              v495 = *(char **)v495;
              v112 = *(void **)v109;
            }
            uint64_t v113 = *(unsigned char **)v496;
            BOOL m = v112 == *(void **)v496;
            *((unsigned char *)v112 + 24) = v112 == *(void **)v496;
            if (!m)
            {
              do
              {
                uint64_t v114 = v112[2];
                if (*(unsigned char *)(v114 + 24)) {
                  break;
                }
                uint64_t v115 = *(unsigned char **)(v114 + 16);
                uint64_t v116 = *(void *)v115;
                if (*(void *)v115 == v114)
                {
                  uint64_t v119 = *((void *)v115 + 1);
                  if (!v119 || (int v120 = *(unsigned __int8 *)(v119 + 24), v117 = (unsigned char *)(v119 + 24), v120))
                  {
                    if (*(void **)v114 == v112)
                    {
                      *(unsigned char *)(v114 + 24) = 1;
                      v115[24] = 0;
                      uint64_t v123 = *(void *)(v114 + 8);
                      *(void *)uint64_t v115 = v123;
                      if (v123) {
                        goto LABEL_42;
                      }
                    }
                    else
                    {
                      uint64_t v121 = *(uint64_t **)(v114 + 8);
                      uint64_t v122 = *v121;
                      *(void *)(v114 + 8) = *v121;
                      if (v122)
                      {
                        *(void *)(v122 + 16) = v114;
                        uint64_t v115 = *(unsigned char **)(v114 + 16);
                      }
                      v121[2] = (uint64_t)v115;
                      *(void *)(*(void *)(v114 + 16) + 8 * (**(void **)(v114 + 16) != v114)) = v121;
                      *uint64_t v121 = v114;
                      *(void *)(v114 + 16) = v121;
                      uint64_t v115 = (unsigned char *)v121[2];
                      uint64_t v114 = *(void *)v115;
                      *((unsigned char *)v121 + 24) = 1;
                      v115[24] = 0;
                      uint64_t v123 = *(void *)(v114 + 8);
                      *(void *)uint64_t v115 = v123;
                      if (v123) {
LABEL_42:
                      }
                        *(void *)(v123 + 16) = v115;
                    }
                    *(void *)(v114 + 16) = *((void *)v115 + 2);
                    *(void *)(*((void *)v115 + 2) + 8 * (**((void **)v115 + 2) != (void)v115)) = v114;
                    *(void *)(v114 + 8) = v115;
LABEL_48:
                    *((void *)v115 + 2) = v114;
                    break;
                  }
                }
                else if (!v116 || (int v118 = *(unsigned __int8 *)(v116 + 24), v117 = (unsigned char *)(v116 + 24), v118))
                {
                  if (*(void **)v114 == v112)
                  {
                    uint64_t v125 = v112[1];
                    *(void *)uint64_t v114 = v125;
                    if (v125)
                    {
                      *(void *)(v125 + 16) = v114;
                      uint64_t v115 = *(unsigned char **)(v114 + 16);
                    }
                    v112[2] = v115;
                    *(void *)(*(void *)(v114 + 16) + 8 * (**(void **)(v114 + 16) != v114)) = v112;
                    v112[1] = v114;
                    *(void *)(v114 + 16) = v112;
                    uint64_t v115 = (unsigned char *)v112[2];
                    *((unsigned char *)v112 + 24) = 1;
                    v115[24] = 0;
                    uint64_t v114 = *((void *)v115 + 1);
                    v124 = *(void **)v114;
                    *((void *)v115 + 1) = *(void *)v114;
                    if (v124) {
LABEL_46:
                    }
                      v124[2] = v115;
                  }
                  else
                  {
                    *(unsigned char *)(v114 + 24) = 1;
                    v115[24] = 0;
                    uint64_t v114 = *((void *)v115 + 1);
                    v124 = *(void **)v114;
                    *((void *)v115 + 1) = *(void *)v114;
                    if (v124) {
                      goto LABEL_46;
                    }
                  }
                  *(void *)(v114 + 16) = *((void *)v115 + 2);
                  *(void *)(*((void *)v115 + 2) + 8 * (**((void **)v115 + 2) != (void)v115)) = v114;
                  *(void *)uint64_t v114 = v115;
                  goto LABEL_48;
                }
                *(unsigned char *)(v114 + 24) = 1;
                v112 = v115;
                v115[24] = v115 == v113;
                unsigned char *v117 = 1;
              }
              while (v115 != v113);
            }
            ++v497;
          }

          ++v88;
        }
        uint64_t v126 = v497;
        uint64_t v132 = objc_msgSend_count(v473, v89, v90, v91, v92, v93);
        if (v126 != v132)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v133 = (id)qword_1EA3C9FA8;
          if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
          {
            uint64_t v139 = objc_msgSend_count(v473, v134, v135, v136, v137, v138);
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v139;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v497;
            _os_log_impl(&dword_1C492D000, v133, OS_LOG_TYPE_ERROR, "Hash collision encountered for subtile. %li strokes ≠ %li hashes", buf, 0x16u);
          }
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x4812000000;
        *(void *)&buf[24] = sub_1C4B10CAC;
        v499 = sub_1C4B10CD0;
        v500 = &unk_1C4CB5C62;
        v502 = 0;
        uint64_t v503 = 0;
        v501 = 0;
        v140 = (void *)*v467;
        if (*v467)
        {
          uint64_t v141 = v495;
          if (v495 == (char *)v496)
          {
            do
            {
              uint64_t v142 = v140;
              v140 = (void *)*v140;
            }
            while (v140);
          }
          else
          {
            uint64_t v142 = v467;
            do
            {
LABEL_69:
              uint64_t v143 = (void *)v140[4];
              uint64_t v144 = v495;
              do
              {
                if (v143 != v140 + 5)
                {
                  unint64_t v145 = v143[4];
                  unint64_t v146 = *((void *)v144 + 4);
                  if (v145 >= v146) {
                    goto LABEL_73;
                  }
                }
                v140 = (void *)v140[1];
                if (!v140) {
                  goto LABEL_86;
                }
                goto LABEL_69;
LABEL_73:
                if (v146 < v145) {
                  break;
                }
                uint64_t v147 = (void *)v143[1];
                uint64_t v148 = v143;
                if (v147)
                {
                  do
                  {
                    uint64_t v143 = v147;
                    uint64_t v147 = (void *)*v147;
                  }
                  while (v147);
                }
                else
                {
                  do
                  {
                    uint64_t v143 = (void *)v148[2];
                    BOOL m = *v143 == (void)v148;
                    uint64_t v148 = v143;
                  }
                  while (!m);
                }
                v149 = (int *)*((void *)v144 + 1);
                if (v149)
                {
                  do
                  {
                    uint64_t v150 = v149;
                    v149 = *(int **)v149;
                  }
                  while (v149);
                }
                else
                {
                  do
                  {
                    uint64_t v150 = (int *)*((void *)v144 + 2);
                    BOOL m = *(void *)v150 == (void)v144;
                    uint64_t v144 = (char *)v150;
                  }
                  while (!m);
                }
                uint64_t v144 = (char *)v150;
              }
              while (v150 != v496);
              uint64_t v142 = v140;
              v140 = (void *)*v140;
            }
            while (v140);
          }
LABEL_86:
          if (v142 != v467)
          {
            uint64_t v151 = (void *)v142[4];
            if (v151 == v142 + 5)
            {
LABEL_88:
              if (v126 == v132 && v467 != v142)
              {
                if (&v501 == v142 + 7)
                {
                  uint64_t v152 = buf;
                  v153 = (void **)((char *)a5 + 8);
                  v154 = *v468;
                  uint64_t v155 = (uint64_t **)((char *)a5 + 8);
                  if (!*v468) {
                    goto LABEL_324;
                  }
                }
                else
                {
                  sub_1C4A02C90(&v501, v142[7], v142[8], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v142[8] - v142[7]) >> 3));
                  uint64_t v152 = *(uint8_t **)&buf[8];
                  v153 = (void **)((char *)a5 + 8);
                  v154 = *v468;
                  uint64_t v155 = (uint64_t **)((char *)a5 + 8);
                  if (!*v468) {
                    goto LABEL_324;
                  }
                }
                if (v495 == (char *)v496)
                {
                  uint64_t v240 = (char *)v154[4];
                  uint64_t v241 = (char *)(v154 + 5);
                  if (v240 == (char *)(v154 + 5))
                  {
                    v249 = (char *)v154;
                  }
                  else
                  {
                    uint64_t v155 = (uint64_t **)((char *)a5 + 8);
                    while (2)
                    {
                      uint64_t v242 = v495;
                      while (v242 != (char *)v496)
                      {
                        unint64_t v243 = *((void *)v242 + 4);
                        unint64_t v244 = *((void *)v240 + 4);
                        if (v243 < v244) {
                          break;
                        }
                        if (v244 < v243)
                        {
                          v153 = v154;
                          goto LABEL_323;
                        }
                        uint64_t v245 = (char *)*((void *)v242 + 1);
                        uint64_t v246 = v242;
                        if (v245)
                        {
                          do
                          {
                            uint64_t v242 = v245;
                            uint64_t v245 = *(char **)v245;
                          }
                          while (v245);
                        }
                        else
                        {
                          do
                          {
                            uint64_t v242 = (char *)*((void *)v246 + 2);
                            BOOL m = *(void *)v242 == (void)v246;
                            uint64_t v246 = v242;
                          }
                          while (!m);
                        }
                        uint64_t v247 = (char *)*((void *)v240 + 1);
                        if (v247)
                        {
                          do
                          {
                            v248 = v247;
                            uint64_t v247 = *(char **)v247;
                          }
                          while (v247);
                        }
                        else
                        {
                          do
                          {
                            v248 = (char *)*((void *)v240 + 2);
                            BOOL m = *(void *)v248 == (void)v240;
                            uint64_t v240 = v248;
                          }
                          while (!m);
                        }
                        uint64_t v240 = v248;
                        if (v248 == v241)
                        {
                          v153 = v154;
                          v249 = (char *)v154;
                          if (v154) {
                            goto LABEL_327;
                          }
                          goto LABEL_324;
                        }
                      }
                      v249 = (char *)*v154;
                      if (!*v154)
                      {
                        uint64_t v155 = (uint64_t **)v154;
                        v153 = v154;
                        goto LABEL_324;
                      }
                      uint64_t v240 = (char *)*((void *)v249 + 4);
                      uint64_t v241 = v249 + 40;
                      uint64_t v155 = (uint64_t **)v154;
                      v154 = (void **)*v154;
                      if (v240 != v249 + 40) {
                        continue;
                      }
                      break;
                    }
                  }
                }
                else
                {
                  uint64_t v155 = (uint64_t **)((char *)a5 + 8);
LABEL_283:
                  while (1)
                  {
                    v153 = v154;
                    uint64_t v251 = v154[4];
                    id v252 = v154 + 5;
                    id v253 = v495;
                    v254 = v251;
                    if (v251 == v252) {
                      break;
                    }
                    while (v253 != (char *)v496)
                    {
                      unint64_t v262 = *((void *)v253 + 4);
                      unint64_t v263 = v254[4];
                      if (v262 < v263) {
                        break;
                      }
                      if (v263 >= v262)
                      {
                        id v264 = (char *)*((void *)v253 + 1);
                        v265 = v253;
                        if (v264)
                        {
                          do
                          {
                            id v253 = v264;
                            id v264 = *(char **)v264;
                          }
                          while (v264);
                        }
                        else
                        {
                          do
                          {
                            id v253 = (char *)*((void *)v265 + 2);
                            BOOL m = *(void *)v253 == (void)v265;
                            v265 = v253;
                          }
                          while (!m);
                        }
                        uint64_t v266 = (void *)v254[1];
                        if (v266)
                        {
                          do
                          {
                            id v267 = v266;
                            uint64_t v266 = (void *)*v266;
                          }
                          while (v266);
                        }
                        else
                        {
                          do
                          {
                            id v267 = (void *)v254[2];
                            BOOL m = *v267 == (void)v254;
                            v254 = v267;
                          }
                          while (!m);
                        }
                        v254 = v267;
                        if (v267 != v252) {
                          continue;
                        }
                      }
                      goto LABEL_284;
                    }
                    v154 = (void **)*v153;
                    uint64_t v155 = (uint64_t **)v153;
                    if (!*v153) {
                      goto LABEL_324;
                    }
                  }
LABEL_284:
                  v255 = v495;
                  do
                  {
                    if (v251 != v252)
                    {
                      unint64_t v256 = v251[4];
                      unint64_t v257 = *((void *)v255 + 4);
                      if (v256 >= v257) {
                        goto LABEL_288;
                      }
                    }
                    uint64_t v155 = (uint64_t **)(v153 + 1);
                    v154 = (void **)v153[1];
                    if (v154) {
                      goto LABEL_283;
                    }
                    goto LABEL_324;
LABEL_288:
                    if (v257 < v256) {
                      break;
                    }
                    uint64_t v258 = (void *)v251[1];
                    uint64_t v259 = v251;
                    if (v258)
                    {
                      do
                      {
                        uint64_t v251 = v258;
                        uint64_t v258 = (void *)*v258;
                      }
                      while (v258);
                    }
                    else
                    {
                      do
                      {
                        uint64_t v251 = (void *)v259[2];
                        BOOL m = *v251 == (void)v259;
                        uint64_t v259 = v251;
                      }
                      while (!m);
                    }
                    v260 = (int *)*((void *)v255 + 1);
                    if (v260)
                    {
                      do
                      {
                        v261 = v260;
                        v260 = *(int **)v260;
                      }
                      while (v260);
                    }
                    else
                    {
                      do
                      {
                        v261 = (int *)*((void *)v255 + 2);
                        BOOL m = *(void *)v261 == (void)v255;
                        v255 = (char *)v261;
                      }
                      while (!m);
                    }
                    v255 = (char *)v261;
                  }
                  while (v261 != v496);
LABEL_323:
                  v249 = (char *)v153;
                  if (v153) {
                    goto LABEL_327;
                  }
LABEL_324:
                  v249 = (char *)operator new(0x50uLL);
                  *(void *)&v483[8] = (char *)a5 + 8;
                  *((void *)v249 + 5) = 0;
                  LOBYTE(v484[0]) = 0;
                  *((void *)v249 + 4) = v249 + 40;
                  *((void *)v249 + 6) = 0;
                  sub_1C499A568((void *)v249 + 4, v495, v496);
                  *((void *)v249 + 7) = 0;
                  *((void *)v249 + 8) = 0;
                  *((void *)v249 + 9) = 0;
                  *(void *)v249 = 0;
                  *((void *)v249 + 1) = 0;
                  *((void *)v249 + 2) = v153;
                  *uint64_t v155 = (uint64_t *)v249;
                  uint64_t v268 = **(void **)a5;
                  long long v269 = (uint64_t *)v249;
                  if (v268)
                  {
                    *(void *)a5 = v268;
                    long long v269 = *v155;
                  }
                  sub_1C4949FD4(*((uint64_t **)a5 + 1), v269);
                  ++*((void *)a5 + 2);
                }
LABEL_327:
                if (v249 + 56 != (char *)(v152 + 48)) {
                  sub_1C4A02C90((void **)v249 + 7, *((void *)v152 + 6), *((void *)v152 + 7), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v152 + 7) - *((void *)v152 + 6)) >> 3));
                }
                goto LABEL_121;
              }
            }
            else
            {
              while (v141 != (char *)v496)
              {
                unint64_t v156 = *((void *)v141 + 4);
                unint64_t v157 = v151[4];
                if (v156 < v157) {
                  break;
                }
                if (v157 >= v156)
                {
                  v158 = (char *)*((void *)v141 + 1);
                  v159 = v141;
                  if (v158)
                  {
                    do
                    {
                      uint64_t v141 = v158;
                      v158 = *(char **)v158;
                    }
                    while (v158);
                  }
                  else
                  {
                    do
                    {
                      uint64_t v141 = (char *)*((void *)v159 + 2);
                      BOOL m = *(void *)v141 == (void)v159;
                      v159 = v141;
                    }
                    while (!m);
                  }
                  uint64_t v160 = (void *)v151[1];
                  if (v160)
                  {
                    do
                    {
                      uint64_t v161 = v160;
                      uint64_t v160 = (void *)*v160;
                    }
                    while (v160);
                  }
                  else
                  {
                    do
                    {
                      uint64_t v161 = (void *)v151[2];
                      BOOL m = *v161 == (void)v151;
                      uint64_t v151 = v161;
                    }
                    while (!m);
                  }
                  uint64_t v151 = v161;
                  if (v161 != v142 + 5) {
                    continue;
                  }
                }
                goto LABEL_88;
              }
            }
          }
        }
        for (unint64_t i = 0; i < objc_msgSend_count(v473, v127, v128, v129, v130, v131); ++i)
        {
          uint64_t v163 = *(void *)&buf[8];
          *(_OWORD *)v483 = 0u;
          *(_OWORD *)v484 = 0u;
          int v485 = 1065353216;
          unint64_t v164 = *(void *)(*(void *)&buf[8] + 56);
          if (v164 >= *(void *)(*(void *)&buf[8] + 64))
          {
            uint64_t v166 = sub_1C4B11B70((void **)(*(void *)&buf[8] + 48), (uint64_t *)v483);
          }
          else
          {
            *(void *)unint64_t v164 = 0;
            *(void *)(v164 + 8) = *(void *)&v483[8];
            *(void *)&v483[8] = 0;
            *(void **)(v164 + 16) = v484[0];
            uint64_t v165 = v484[1];
            *(void **)(v164 + 24) = v484[1];
            *(_DWORD *)(v164 + 32) = v485;
            if (v165)
            {
              v484[0] = 0;
              v484[1] = 0;
            }
            uint64_t v166 = (char *)(v164 + 40);
          }
          *(void *)(v163 + 56) = v166;
          uint64_t v167 = v484[0];
          if (v484[0])
          {
            do
            {
              uint64_t v168 = (void *)*v167;
              operator delete(v167);
              uint64_t v167 = v168;
            }
            while (v168);
          }
          if (*(void *)v483) {
            operator delete(*(void **)v483);
          }
        }
        v169 = qword_1EA3C9330;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4B10D90;
        block[3] = &unk_1E64E2528;
        id v479 = v473;
        v480 = self;
        v481 = buf;
        uint64_t v482 = v72;
        dispatch_sync(v169, block);

LABEL_121:
        uint64_t v170 = *(void *)&buf[8];
        uint64_t v171 = (void ***)((char *)a5 + 8);
        uint64_t v172 = *v468;
        uint64_t v173 = (void ***)((char *)a5 + 8);
        if (*v468)
        {
          if (v495 == (char *)v496)
          {
            uint64_t v174 = (void **)v172[4];
            v175 = v172 + 5;
            if (v174 == v172 + 5)
            {
              v201 = v172 + 7;
              if (v172 + 7 != (void **)(*(void *)&buf[8] + 48)) {
                goto LABEL_213;
              }
              goto LABEL_214;
            }
            uint64_t v173 = (void ***)((char *)a5 + 8);
            while (2)
            {
              uint64_t v176 = v495;
              while (v176 != (char *)v496)
              {
                unint64_t v177 = *((void *)v176 + 4);
                unint64_t v178 = (unint64_t)v174[4];
                if (v177 < v178) {
                  break;
                }
                if (v178 < v177)
                {
                  uint64_t v171 = (void ***)v172;
                  goto LABEL_184;
                }
                uint64_t v179 = (char *)*((void *)v176 + 1);
                uint64_t v180 = v176;
                if (v179)
                {
                  do
                  {
                    uint64_t v176 = v179;
                    uint64_t v179 = *(char **)v179;
                  }
                  while (v179);
                }
                else
                {
                  do
                  {
                    uint64_t v176 = (char *)*((void *)v180 + 2);
                    BOOL m = *(void *)v176 == (void)v180;
                    uint64_t v180 = v176;
                  }
                  while (!m);
                }
                uint64_t v181 = (void **)v174[1];
                if (v181)
                {
                  do
                  {
                    uint64_t v182 = v181;
                    uint64_t v181 = (void **)*v181;
                  }
                  while (v181);
                }
                else
                {
                  do
                  {
                    uint64_t v182 = (void **)v174[2];
                    BOOL m = *v182 == v174;
                    uint64_t v174 = v182;
                  }
                  while (!m);
                }
                uint64_t v174 = v182;
                if (v182 == v175)
                {
                  uint64_t v171 = (void ***)v172;
                  v183 = v172;
                  if (v172) {
                    goto LABEL_185;
                  }
                  goto LABEL_188;
                }
              }
              v183 = *v172;
              if (!*v172)
              {
                uint64_t v173 = (void ***)v172;
                uint64_t v171 = (void ***)v172;
                goto LABEL_188;
              }
              uint64_t v174 = (void **)v183[4];
              v175 = (void **)(v183 + 5);
              uint64_t v173 = (void ***)v172;
              uint64_t v172 = (void **)*v172;
              if (v174 != v183 + 5) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v173 = (void ***)((char *)a5 + 8);
LABEL_145:
            while (1)
            {
              uint64_t v171 = (void ***)v172;
              v184 = v172[4];
              uint64_t v185 = v172 + 5;
              uint64_t v186 = v495;
              uint64_t v187 = v184;
              if (v184 == v185) {
                break;
              }
              while (v186 != (char *)v496)
              {
                unint64_t v195 = *((void *)v186 + 4);
                unint64_t v196 = v187[4];
                if (v195 < v196) {
                  break;
                }
                if (v196 >= v195)
                {
                  v197 = (char *)*((void *)v186 + 1);
                  uint64_t v198 = v186;
                  if (v197)
                  {
                    do
                    {
                      uint64_t v186 = v197;
                      v197 = *(char **)v197;
                    }
                    while (v197);
                  }
                  else
                  {
                    do
                    {
                      uint64_t v186 = (char *)*((void *)v198 + 2);
                      BOOL m = *(void *)v186 == (void)v198;
                      uint64_t v198 = v186;
                    }
                    while (!m);
                  }
                  uint64_t v199 = (void *)v187[1];
                  if (v199)
                  {
                    do
                    {
                      uint64_t v200 = v199;
                      uint64_t v199 = (void *)*v199;
                    }
                    while (v199);
                  }
                  else
                  {
                    do
                    {
                      uint64_t v200 = (void *)v187[2];
                      BOOL m = *v200 == (void)v187;
                      uint64_t v187 = v200;
                    }
                    while (!m);
                  }
                  uint64_t v187 = v200;
                  if (v200 != v185) {
                    continue;
                  }
                }
                goto LABEL_146;
              }
              uint64_t v172 = *v171;
              uint64_t v173 = v171;
              if (!*v171) {
                goto LABEL_188;
              }
            }
LABEL_146:
            uint64_t v188 = v495;
            do
            {
              if (v184 != v185)
              {
                unint64_t v189 = v184[4];
                unint64_t v190 = *((void *)v188 + 4);
                if (v189 >= v190) {
                  goto LABEL_150;
                }
              }
              uint64_t v173 = v171 + 1;
              uint64_t v172 = v171[1];
              if (v172) {
                goto LABEL_145;
              }
              goto LABEL_188;
LABEL_150:
              if (v190 < v189) {
                break;
              }
              v191 = (void *)v184[1];
              uint64_t v192 = v184;
              if (v191)
              {
                do
                {
                  v184 = v191;
                  v191 = (void *)*v191;
                }
                while (v191);
              }
              else
              {
                do
                {
                  v184 = (void *)v192[2];
                  BOOL m = *v184 == (void)v192;
                  uint64_t v192 = v184;
                }
                while (!m);
              }
              uint64_t v193 = (int *)*((void *)v188 + 1);
              if (v193)
              {
                do
                {
                  uint64_t v194 = v193;
                  uint64_t v193 = *(int **)v193;
                }
                while (v193);
              }
              else
              {
                do
                {
                  uint64_t v194 = (int *)*((void *)v188 + 2);
                  BOOL m = *(void *)v194 == (void)v188;
                  uint64_t v188 = (char *)v194;
                }
                while (!m);
              }
              uint64_t v188 = (char *)v194;
            }
            while (v194 != v496);
LABEL_184:
            v183 = v171;
            if (!v171) {
              goto LABEL_188;
            }
          }
LABEL_185:
          v201 = (void **)(v183 + 7);
          if (v183 + 7 != (void *)(*(void *)&buf[8] + 48)) {
            goto LABEL_213;
          }
        }
        else
        {
LABEL_188:
          v202 = (void **)operator new(0x50uLL);
          *(void *)&v483[8] = (char *)a5 + 8;
          v202[5] = 0;
          LOBYTE(v484[0]) = 0;
          v202[4] = v202 + 5;
          v202[6] = 0;
          sub_1C499A568(v202 + 4, v495, v496);
          v202[7] = 0;
          v202[8] = 0;
          v202[9] = 0;
          const char *v202 = 0;
          v202[1] = 0;
          v202[2] = v171;
          *uint64_t v173 = v202;
          uint64_t v203 = **(void **)a5;
          uint64_t v204 = v202;
          if (v203)
          {
            *(void *)a5 = v203;
            uint64_t v204 = *v173;
          }
          v205 = *v468;
          BOOL m = v204 == *v468;
          *((unsigned char *)v204 + 24) = m;
          if (!m)
          {
            do
            {
              uint64_t v206 = v204[2];
              if (*((unsigned char *)v206 + 24)) {
                break;
              }
              uint64_t v207 = (void **)*((void *)v206 + 2);
              uint64_t v208 = (unsigned __int8 *)*v207;
              if (*v207 == v206)
              {
                uint64_t v211 = (unsigned __int8 *)v207[1];
                if (!v211 || (v212 = v211[24], uint64_t v209 = v211 + 24, v212))
                {
                  if (*(void ***)v206 == v204)
                  {
                    *((unsigned char *)v206 + 24) = 1;
                    *((unsigned char *)v207 + 24) = 0;
                    uint64_t v215 = (void *)*((void *)v206 + 1);
                    *uint64_t v207 = v215;
                    if (v215) {
                      goto LABEL_205;
                    }
                  }
                  else
                  {
                    uint64_t v213 = (uint64_t *)*((void *)v206 + 1);
                    uint64_t v214 = *v213;
                    *((void *)v206 + 1) = *v213;
                    if (v214)
                    {
                      *(void *)(v214 + 16) = v206;
                      uint64_t v207 = (void **)*((void *)v206 + 2);
                    }
                    v213[2] = (uint64_t)v207;
                    *(void *)(*((void *)v206 + 2) + 8 * (**((void **)v206 + 2) != (void)v206)) = v213;
                    *uint64_t v213 = (uint64_t)v206;
                    *((void *)v206 + 2) = v213;
                    uint64_t v207 = (void **)v213[2];
                    uint64_t v206 = *v207;
                    *((unsigned char *)v213 + 24) = 1;
                    *((unsigned char *)v207 + 24) = 0;
                    uint64_t v215 = (void *)*((void *)v206 + 1);
                    *uint64_t v207 = v215;
                    if (v215) {
LABEL_205:
                    }
                      v215[2] = v207;
                  }
                  *((void *)v206 + 2) = v207[2];
                  *((void *)v207[2] + (*(void *)v207[2] != (void)v207)) = v206;
                  *((void *)v206 + 1) = v207;
LABEL_211:
                  v207[2] = v206;
                  break;
                }
              }
              else if (!v208 || (v210 = v208[24], uint64_t v209 = v208 + 24, v210))
              {
                if (*(void ***)v206 == v204)
                {
                  uint64_t v250 = v204[1];
                  *(void *)uint64_t v206 = v250;
                  if (v250)
                  {
                    v250[2] = v206;
                    uint64_t v207 = (void **)*((void *)v206 + 2);
                  }
                  v204[2] = v207;
                  *(void *)(*((void *)v206 + 2) + 8 * (**((void **)v206 + 2) != (void)v206)) = v204;
                  v204[1] = v206;
                  *((void *)v206 + 2) = v204;
                  uint64_t v207 = (void **)v204[2];
                  *((unsigned char *)v204 + 24) = 1;
                  *((unsigned char *)v207 + 24) = 0;
                  uint64_t v206 = v207[1];
                  v216 = *(void ***)v206;
                  v207[1] = *(void **)v206;
                  if (v216) {
LABEL_209:
                  }
                    v216[2] = v207;
                }
                else
                {
                  *((unsigned char *)v206 + 24) = 1;
                  *((unsigned char *)v207 + 24) = 0;
                  uint64_t v206 = v207[1];
                  v216 = *(void ***)v206;
                  v207[1] = *(void **)v206;
                  if (v216) {
                    goto LABEL_209;
                  }
                }
                *((void *)v206 + 2) = v207[2];
                *((void *)v207[2] + (*(void *)v207[2] != (void)v207)) = v206;
                *(void *)uint64_t v206 = v207;
                goto LABEL_211;
              }
              *((unsigned char *)v206 + 24) = 1;
              uint64_t v204 = v207;
              *((unsigned char *)v207 + 24) = v207 == v205;
              *uint64_t v209 = 1;
            }
            while (v207 != v205);
          }
          ++*((void *)a5 + 2);
          v201 = v202 + 7;
          if (v202 + 7 != (void **)(v170 + 48)) {
LABEL_213:
          }
            sub_1C4A02C90(v201, *(void *)(v170 + 48), *(void *)(v170 + 56), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v170 + 56) - *(void *)(v170 + 48)) >> 3));
        }
LABEL_214:
        if (v72 >= 1)
        {
          for (uint64_t j = 0; j != v72; ++j)
          {
            v218 = *(uint64_t **)(*(void *)(*(void *)&buf[8] + 48) + 40 * j + 16);
            if (!v218) {
              continue;
            }
            v219 = (char *)v492 + 40 * j + 40 * v61;
            do
            {
              while (1)
              {
                uint64_t v220 = v218[2];
                unint64_t v221 = v220 + v61;
                int8x8_t v222 = (int8x8_t)v219[1];
                if (v222)
                {
                  uint8x8_t v223 = (uint8x8_t)vcnt_s8(v222);
                  v223.i16[0] = vaddlv_u8(v223);
                  if (v223.u32[0] > 1uLL)
                  {
                    unint64_t v224 = v220 + v61;
                    if (v221 >= *(void *)&v222) {
                      unint64_t v224 = v221 % *(void *)&v222;
                    }
                  }
                  else
                  {
                    unint64_t v224 = (*(void *)&v222 - 1) & v221;
                  }
                  uint64_t v225 = *(void **)(*v219 + 8 * v224);
                  if (v225)
                  {
                    uint64_t v226 = (void *)*v225;
                    if (v226) {
                      break;
                    }
                  }
                }
LABEL_239:
                int v230 = *((_DWORD *)v218 + 6);
                *(void *)v483 = v221;
                *((_DWORD *)sub_1C4B11D84((uint64_t)v219, v221, v483) + 6) = v230;
                v218 = (uint64_t *)*v218;
                if (!v218) {
                  goto LABEL_216;
                }
              }
              if (v223.u32[0] < 2uLL)
              {
                uint64_t v227 = *(void *)&v222 - 1;
                while (1)
                {
                  uint64_t v228 = v226[1];
                  if (v228 == v221)
                  {
                    if (v226[2] == v221) {
                      goto LABEL_241;
                    }
                  }
                  else if ((v228 & v227) != v224)
                  {
                    goto LABEL_239;
                  }
                  uint64_t v226 = (void *)*v226;
                  if (!v226) {
                    goto LABEL_239;
                  }
                }
              }
              while (1)
              {
                unint64_t v229 = v226[1];
                if (v229 == v221) {
                  break;
                }
                if (v229 >= *(void *)&v222) {
                  v229 %= *(void *)&v222;
                }
                if (v229 != v224) {
                  goto LABEL_239;
                }
LABEL_234:
                uint64_t v226 = (void *)*v226;
                if (!v226) {
                  goto LABEL_239;
                }
              }
              if (v226[2] != v221) {
                goto LABEL_234;
              }
LABEL_241:
              float v231 = *((float *)v218 + 6);
              *(void *)v483 = v221;
              float v232 = *((float *)sub_1C4B11D84((uint64_t)v219, v221, v483) + 6);
              v475 = (void **)(v218[2] + v61);
              *((float *)sub_1C4B11D84((uint64_t)v219, (unint64_t)v475, &v475) + 6) = (float)(v231 + v232) * 0.5;
              v218 = (uint64_t *)*v218;
            }
            while (v218);
LABEL_216:
            ;
          }
        }
        _Block_object_dispose(buf, 8);
        v233 = v501;
        if (v501)
        {
          v234 = v502;
          uint64_t v235 = v501;
          if (v502 != v501)
          {
            do
            {
              uint64_t v236 = (void *)*(v234 - 3);
              if (v236)
              {
                do
                {
                  uint64_t v237 = (void *)*v236;
                  operator delete(v236);
                  uint64_t v236 = v237;
                }
                while (v237);
              }
              v239 = (void *)*(v234 - 5);
              v234 -= 5;
              v238 = v239;
              void *v234 = 0;
              if (v239) {
                operator delete(v238);
              }
            }
            while (v234 != v233);
            uint64_t v235 = v501;
          }
          v502 = v233;
          operator delete(v235);
        }
        sub_1C4999C7C((uint64_t)&v495, *(void **)v496);

        ++spid;
      }
      while (spid != v463);
      uint64_t v270 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v486, (uint64_t)v504, 16, v53);
      uint64_t v463 = v270;
    }
    while (v270);
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  long long v271 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v272 = os_signpost_id_generate(v271);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v273 = (id)qword_1EA3C9FC8;
    CGRect v274 = (void *)(v272 - 1);
    if (v272 - 1 <= 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_338;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v273 = (id)qword_1EA3C9FC8;
    CGRect v274 = (void *)(v272 - 1);
    if (v272 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_338:
      if (os_signpost_enabled(v273))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v273, OS_SIGNPOST_INTERVAL_BEGIN, v272, "CHStrokeGroupingModelPostProcessing", "", buf, 2u);
      }
    }
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  CGRect v275 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v275, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupingModelPostProcessing\"", buf, 2u);
  }

  v475 = &v492;
  int v476 = 1061158912;
  unint64_t v477 = 1;
  memset(v483, 0, sizeof(v483));
  v484[0] = 0;
  int64_t v281 = v493 - (unsigned char *)v492;
  os_signpost_id_t spida = v272;
  id v471 = v274;
  if (v493 != v492)
  {
    if (v281 < 0) {
      sub_1C494A220();
    }
    unint64_t v282 = v281 / 40;
    unint64_t v283 = (unint64_t)(v281 / 40 - 1) >> 6;
    v284 = operator new(8 * (v283 + 1));
    v285 = v284;
    *(void *)&v483[8] = v282;
    v484[0] = (void *)(v283 + 1);
    *(void *)v483 = v284;
    if (v282 >= 0x41) {
      unint64_t v286 = (v282 - 1) >> 6;
    }
    else {
      unint64_t v286 = 0;
    }
    v284[v286] = 0;
    if (v282 >= 0x40) {
      bzero(v284, 8 * (v282 >> 6));
    }
    if ((v282 & 0x3F) != 0) {
      v285[v282 >> 6] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v282 & 0x3F));
    }
    v287 = operator new(4 * v282);
    bzero(v287, 4 * v282);
    unint64_t v288 = 0;
    int v289 = 0;
    if (v282 <= 1) {
      uint64_t v290 = 1;
    }
    else {
      uint64_t v290 = v282;
    }
    v474 = v287;
    while (1)
    {
      if ((v285[v288 >> 6] & (1 << v288)) != 0) {
        goto LABEL_359;
      }
      sub_1C4B11934(&v495, (uint64_t)&v475, v288);
      v291 = v495;
      v292 = *(char **)v496;
      unint64_t v293 = v477;
      if (v477 <= (uint64_t)(*(void *)v496 - (void)v495) >> 3) {
        break;
      }
      v474[v288] = -1;
      if (v291) {
        goto LABEL_358;
      }
LABEL_359:
      if (++v288 == v290)
      {
        operator delete(v285);
        goto LABEL_378;
      }
    }
    v474[v288] = v289;
    v285[v288 >> 6] |= 1 << v288;
    if (v292 == v291)
    {
      v291 = v292;
    }
    else
    {
      unint64_t v294 = 0;
      do
      {
        unint64_t v295 = *(void *)&v291[8 * v294];
        uint64_t v296 = v285[v295 >> 6];
        if (((1 << v295) & v296) == 0)
        {
          v285[v295 >> 6] = (1 << v295) | v296;
          sub_1C4B11934((char **)buf, (uint64_t)&v475, v295);
          v297 = *(void **)buf;
          unint64_t v298 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
          if (v298 >= v293)
          {
            sub_1C49B79D0((unint64_t *)&v495, *(void **)v496, *(char **)buf, *(char **)&buf[8], v298);
            v297 = *(void **)buf;
          }
          if (v297)
          {
            *(void *)&buf[8] = v297;
            operator delete(v297);
          }
        }
        if (!v474[v295]) {
          v474[v295] = v289;
        }
        ++v294;
        v291 = v495;
      }
      while (v294 < (uint64_t)(*(void *)v496 - (void)v495) >> 3);
    }
    ++v289;
    if (!v291) {
      goto LABEL_359;
    }
LABEL_358:
    *(void *)v496 = v291;
    operator delete(v291);
    goto LABEL_359;
  }
  v474 = 0;
LABEL_378:
  v300 = v465;
  unint64_t v301 = 0;
  *(void *)&buf[8] = 0;
  *(void *)&buf[16] = 0;
  *(void *)buf = &buf[8];
  for (unint64_t k = objc_msgSend_count(v465, v276, v277, v278, v279, v280);
        k > v301;
        unint64_t k = objc_msgSend_count(v300, v303, v304, v305, v306, v307))
  {
    v310 = *(char **)&buf[8];
    if (!*(void *)&buf[8]) {
      goto LABEL_395;
    }
    int v311 = v474[v301];
    v312 = &buf[8];
    v313 = *(uint8_t **)&buf[8];
    do
    {
      v314 = v313;
      v315 = v312;
      int v316 = *((_DWORD *)v313 + 8);
      if (v316 >= v311) {
        v312 = v313;
      }
      else {
        v313 += 8;
      }
      v313 = *(uint8_t **)v313;
    }
    while (v313);
    if (v312 == &buf[8] || (v316 >= v311 ? (v317 = v314) : (v317 = v315), v311 < *((_DWORD *)v317 + 8)))
    {
LABEL_395:
      v318 = operator new(4uLL);
      _DWORD *v318 = v301;
      v319 = v318 + 1;
      int v320 = v474[v301];
      v321 = &buf[8];
      v322 = &buf[8];
      if (v310)
      {
        while (1)
        {
          while (1)
          {
            v322 = (uint8_t *)v310;
            int v323 = *((_DWORD *)v310 + 8);
            if (v320 >= v323) {
              break;
            }
            v310 = *(char **)v310;
            v321 = v322;
            if (!*(void *)v322) {
              goto LABEL_402;
            }
          }
          if (v323 >= v320) {
            break;
          }
          v310 = (char *)*((void *)v310 + 1);
          if (!v310)
          {
            v321 = v322 + 8;
            goto LABEL_402;
          }
        }
        v309 = v310 + 40;
        v308 = (void *)*((void *)v310 + 5);
        if (!v308) {
          goto LABEL_381;
        }
      }
      else
      {
LABEL_402:
        v310 = (char *)operator new(0x40uLL);
        *((_DWORD *)v310 + 8) = v320;
        *((void *)v310 + 6) = 0;
        *((void *)v310 + 7) = 0;
        *((void *)v310 + 5) = 0;
        *(void *)v310 = 0;
        *((void *)v310 + 1) = 0;
        *((void *)v310 + 2) = v322;
        *(void *)v321 = v310;
        v324 = (uint64_t *)v310;
        if (**(void **)buf)
        {
          *(void *)buf = **(void **)buf;
          v324 = *(uint64_t **)v321;
        }
        sub_1C4949FD4(*(uint64_t **)&buf[8], v324);
        ++*(void *)&buf[16];
        v309 = v310 + 40;
        v308 = (void *)*((void *)v310 + 5);
        if (!v308) {
          goto LABEL_381;
        }
      }
      *((void *)v310 + 6) = v308;
      operator delete(v308);
      void *v309 = 0;
      v309[1] = 0;
      v309[2] = 0;
LABEL_381:
      *((void *)v310 + 5) = v318;
      *((void *)v310 + 6) = v319;
      *((void *)v310 + 7) = v319;
      ++v301;
      continue;
    }
    if (v316 >= v311) {
      v325 = v314;
    }
    else {
      v325 = v315;
    }
    v327 = (char *)*((void *)v325 + 6);
    unint64_t v326 = *((void *)v325 + 7);
    if ((unint64_t)v327 < v326)
    {
      *(_DWORD *)v327 = v301;
      *((void *)v325 + 6) = v327 + 4;
      ++v301;
      continue;
    }
    v328 = (char *)*((void *)v325 + 5);
    uint64_t v329 = (v327 - v328) >> 2;
    unint64_t v330 = v329 + 1;
    if ((unint64_t)(v329 + 1) >> 62) {
      sub_1C494A220();
    }
    uint64_t v331 = v326 - (void)v328;
    if (v331 >> 1 > v330) {
      unint64_t v330 = v331 >> 1;
    }
    if ((unint64_t)v331 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v332 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v332 = v330;
    }
    if (v332)
    {
      if (v332 >> 62) {
        sub_1C4949AA8();
      }
      v333 = operator new(4 * v332);
      v334 = &v333[4 * v329];
      _DWORD *v334 = v301;
      uint64_t v335 = (uint64_t)(v334 + 1);
      int64_t v336 = v327 - v328;
      if (v327 == v328)
      {
LABEL_423:
        v300 = v465;
        goto LABEL_429;
      }
    }
    else
    {
      v333 = 0;
      v334 = (_DWORD *)(4 * v329);
      *(_DWORD *)(4 * v329) = v301;
      uint64_t v335 = 4 * v329 + 4;
      int64_t v336 = v327 - v328;
      if (v327 == v328) {
        goto LABEL_423;
      }
    }
    unint64_t v337 = v336 - 4;
    if (v337 >= 0x2C)
    {
      v300 = v465;
      if ((unint64_t)(v328 - v333) >= 0x20)
      {
        uint64_t v338 = (v337 >> 2) + 1;
        uint64_t v339 = 4 * (v338 & 0x7FFFFFFFFFFFFFF8);
        v340 = &v327[-v339];
        v334 = (_DWORD *)((char *)v334 - v339);
        v341 = &v333[4 * v329 - 16];
        v342 = v327 - 16;
        uint64_t v343 = v338 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v344 = *(_OWORD *)v342;
          *(v341 - 1) = *((_OWORD *)v342 - 1);
          _OWORD *v341 = v344;
          v341 -= 2;
          v342 -= 32;
          v343 -= 8;
        }
        while (v343);
        v327 = v340;
        if (v338 == (v338 & 0x7FFFFFFFFFFFFFF8)) {
          goto LABEL_429;
        }
      }
    }
    else
    {
      v300 = v465;
    }
    do
    {
      int v345 = *((_DWORD *)v327 - 1);
      v327 -= 4;
      *--v334 = v345;
    }
    while (v327 != v328);
LABEL_429:
    *((void *)v325 + 5) = v334;
    *((void *)v325 + 6) = v335;
    *((void *)v325 + 7) = &v333[4 * v332];
    if (v328) {
      operator delete(v328);
    }
    *((void *)v325 + 6) = v335;
    ++v301;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v346 = (id)qword_1EA3C9FC8;
  v347 = v346;
  if ((unint64_t)v471 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v346))
  {
    *(_WORD *)v483 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v347, OS_SIGNPOST_INTERVAL_END, spida, "CHStrokeGroupingModelPostProcessing", "", v483, 2u);
  }

  if (qword_1EA3CA000 == -1)
  {
    v348 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v348, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_439;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v348 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v348, OS_LOG_TYPE_DEFAULT))
    {
LABEL_439:
      *(_WORD *)v483 = 0;
      _os_log_impl(&dword_1C492D000, v348, OS_LOG_TYPE_DEFAULT, "END \"CHStrokeGroupingModelPostProcessing\"", v483, 2u);
    }
  }

  objc_msgSend_set(MEMORY[0x1E4F1CA80], v349, v350, v351, v352, v353);
  id v472 = (id)objc_claimAutoreleasedReturnValue();
  v358 = *(uint8_t **)buf;
  for (BOOL m = *(void *)buf == (void)&buf[8]; !m; BOOL m = v450 == &buf[8])
  {
    v360 = objc_msgSend_objectAtIndex_(v465, v354, **((int **)v358 + 5), v355, v356, v357);
    v366 = objc_msgSend_encodedStrokeIdentifier(v360, v361, v362, v363, v364, v365);

    v371 = objc_msgSend_objectAtIndex_(v465, v367, *(int *)(*((void *)v358 + 6) - 4), v368, v369, v370);
    v377 = objc_msgSend_encodedStrokeIdentifier(v371, v372, v373, v374, v375, v376);

    v382 = objc_msgSend_objectAtIndex_(v465, v378, **((int **)v358 + 5), v379, v380, v381);
    objc_msgSend_bounds(v382, v383, v384, v385, v386, v387);
    double v389 = v388;
    double v391 = v390;

    v401 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v392, v393, v394, v395, v396);
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v407 = (int *)*((void *)v358 + 5);
    for (n = (int *)*((void *)v358 + 6); v407 != n; ++v407)
    {
      uint64_t v408 = *v407;
      v409 = objc_msgSend_objectAtIndex_(v465, v397, v408, v398, v399, v400);
      v415 = objc_msgSend_encodedStrokeIdentifier(v409, v410, v411, v412, v413, v414);
      objc_msgSend_addObject_(v401, v416, (uint64_t)v415, v417, v418, v419);

      v424 = objc_msgSend_objectAtIndex_(v465, v420, v408, v421, v422, v423);
      objc_msgSend_bounds(v424, v425, v426, v427, v428, v429);
      v509.origin.double x = v430;
      v509.origin.double y = v431;
      v509.size.double width = v432;
      v509.size.double height = v433;
      v507.origin.double x = x;
      v507.origin.double y = y;
      v507.size.double width = width;
      v507.size.double height = height;
      CGRect v508 = CGRectUnion(v507, v509);
      double x = v508.origin.x;
      double y = v508.origin.y;
      double width = v508.size.width;
      double height = v508.size.height;
    }
    v434 = [CHStrokeGroup alloc];
    uint64_t v440 = objc_msgSend_contentType(self, v435, v436, v437, v438, v439);
    v441 = (objc_class *)objc_opt_class();
    v442 = NSStringFromClass(v441);
    StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v434, v443, (uint64_t)v401, (uint64_t)v366, (uint64_t)v377, v440, v442, x, y, width, height, 1.0, v389, v391);

    objc_msgSend_addObject_(v472, v445, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v446, v447, v448);
    v449 = (uint8_t *)*((void *)v358 + 1);
    if (v449)
    {
      do
      {
        v450 = v449;
        v449 = *(uint8_t **)v449;
      }
      while (v449);
    }
    else
    {
      do
      {
        v450 = (uint8_t *)*((void *)v358 + 2);
        BOOL m = *(void *)v450 == (void)v358;
        v358 = v450;
      }
      while (!m);
    }
    v358 = v450;
  }
  sub_1C494AC4C((uint64_t)buf, *(void **)&buf[8]);
  if (v474) {
    operator delete(v474);
  }

  v451 = (char *)v492;
  v299 = v465;
  if (v492)
  {
    v452 = v493;
    v453 = v492;
    if (v493 != v492)
    {
      do
      {
        v454 = (void *)*((void *)v452 - 3);
        if (v454)
        {
          do
          {
            v455 = (void *)*v454;
            operator delete(v454);
            v454 = v455;
          }
          while (v455);
        }
        v457 = (void *)*((void *)v452 - 5);
        v452 -= 40;
        v456 = v457;
        *(void *)v452 = 0;
        if (v457) {
          operator delete(v456);
        }
      }
      while (v452 != v451);
      v453 = v492;
    }
    v493 = v451;
    operator delete(v453);
  }
LABEL_463:

  return v472;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (unint64_t)maxNumStrokes
{
  return self->_maxNumStrokes;
}

- (unint64_t)maxNumPointsPerStroke
{
  return self->_maxNumPointsPerStroke;
}

- (unint64_t)numOverlapStrokes
{
  return self->_numOverlapStrokes;
}

- (unint64_t)numBBoxFeaturesPerStroke
{
  return self->_numBBoxFeaturesPerStroke;
}

- (unint64_t)numSignalFeaturesPerPoint
{
  return self->_numSignalFeaturesPerPoint;
}

- (unint64_t)recognitionTileHeight
{
  return self->_recognitionTileHeight;
}

- (unint64_t)tileOverlapHeight
{
  return self->_tileOverlapHeight;
}

- (NSArray)supportedConfigurationsNumStrokes
{
  return self->_supportedConfigurationsNumStrokes;
}

- (float)interpolationDistance
{
  return self->_interpolationDistance;
}

- (float)coordinateNormalizationFactor
{
  return self->_coordinateNormalizationFactor;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedConfigurationsNumStrokes, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end