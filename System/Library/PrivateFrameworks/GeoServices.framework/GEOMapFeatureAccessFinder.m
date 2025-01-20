@interface GEOMapFeatureAccessFinder
- (BOOL)_boundingCircle:(const void *)a3 intersectsFeature:(id)a4;
- (BOOL)_boundingCircle:(const void *)a3 intersectsPoints:(GeoCodecsVectorTilePoint *)a4 pointCount:(unint64_t)a5;
- (BOOL)_boundingCircle:(const void *)a3 intersectsTransitLink:(id)a4;
- (BOOL)_boundingCircle:(const void *)a3 withBuildingTilePoints:()vector<GeoCodecsVectorTilePoint;
- (BOOL)_featureHasValidGeometry:(id)a3;
- (GEOMapFeatureAccessFinder)init;
- (GEOMapFeatureAccessFinder)initWithRequestParameters:(id)a3;
- (_GEOMapFeatureAccessRequestParameters)requestParameters;
- (float)_boundingCircleWithCenter:(uint64_t)a3 radius:(uint64_t)a4 inTile:(uint64_t)a5;
- (void)setExistingRequest:(id)a3;
- (void)setRequestParameters:(id)a3;
@end

@implementation GEOMapFeatureAccessFinder

- (GEOMapFeatureAccessFinder)init
{
  result = (GEOMapFeatureAccessFinder *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapFeatureAccessFinder)initWithRequestParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapFeatureAccessFinder;
  v6 = [(GEOMapFeatureAccessFinder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestParameters, a3);
  }

  return v7;
}

- (void)setExistingRequest:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_existingRequest, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: existingRequest != nullptr", v6, 2u);
  }
}

- (_GEOMapFeatureAccessRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void)setRequestParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);

  objc_storeStrong((id *)&self->_existingRequest, 0);
}

- (BOOL)_featureHasValidGeometry:(id)a3
{
  id v3 = a3;
  unint64_t v4 = -1;
  do
  {
    unint64_t v5 = [v3 sectionCount];
    if (++v4 >= v5) {
      break;
    }
    unint64_t v7 = 0;
    GEOMultiSectionFeaturePoints(v3, 0, &v7);
  }
  while (v7 < 2);

  return v4 < v5;
}

- (float)_boundingCircleWithCenter:(uint64_t)a3 radius:(uint64_t)a4 inTile:(uint64_t)a5
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = a4;
  v9[1] = a5;
  double v6 = GEOMapRectForGEOTileKey((uint64_t)v9);
  return (a1 - v6) / v7;
}

- (BOOL)_boundingCircle:(const void *)a3 intersectsFeature:(id)a4
{
  id v6 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v8 = [v6 sectionCount];
    if (i >= v8) {
      break;
    }
    uint64_t v11 = 0;
    objc_super v9 = GEOMultiSectionFeaturePoints(v6, 0, &v11);
    if (v11)
    {
      if (-[GEOMapFeatureAccessFinder _boundingCircle:intersectsPoints:pointCount:](self, "_boundingCircle:intersectsPoints:pointCount:", a3, v9))
      {
        break;
      }
    }
  }

  return i < v8;
}

- (BOOL)_boundingCircle:(const void *)a3 withBuildingTilePoints:()vector<GeoCodecsVectorTilePoint
{
  return [(GEOMapFeatureAccessFinder *)self _boundingCircle:a3 intersectsPoints:a4->__begin_ pointCount:a4->__end_ - a4->__begin_];
}

- (BOOL)_boundingCircle:(const void *)a3 intersectsTransitLink:(id)a4
{
  id v6 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    unsigned int v8 = [v6 sectionCount];
    if (i >= v8) {
      break;
    }
    uint64_t v11 = 0;
    uint64_t v9 = GEOTransitLinkPoints(v6, i, &v11);
    if (v11)
    {
      if (-[GEOMapFeatureAccessFinder _boundingCircle:intersectsPoints:pointCount:](self, "_boundingCircle:intersectsPoints:pointCount:", a3, v9))
      {
        break;
      }
    }
  }

  return i < v8;
}

- (BOOL)_boundingCircle:(const void *)a3 intersectsPoints:(GeoCodecsVectorTilePoint *)a4 pointCount:(unint64_t)a5
{
  if (!a5) {
    return 0;
  }
  p_float var1 = &a4->var1;
  float v7 = 3.4028e38;
  float v8 = -3.4028e38;
  unint64_t v9 = a5;
  float v10 = -3.4028e38;
  float v11 = 3.4028e38;
  do
  {
    float v12 = *(p_var1 - 1);
    float v13 = *p_var1;
    if (v7 >= v12) {
      float v7 = *(p_var1 - 1);
    }
    if (v11 >= v13) {
      float v11 = *p_var1;
    }
    if (v8 <= v12) {
      float v8 = *(p_var1 - 1);
    }
    if (v10 <= v13) {
      float v10 = *p_var1;
    }
    p_var1 += 2;
    --v9;
  }
  while (v9);
  uint64_t v14 = 0;
  *(float *)v35 = v7;
  *(float *)&v35[1] = v11;
  *(float *)v36 = v8;
  *(float *)&v36[1] = v10;
  char v15 = 1;
  do
  {
    float v16 = *(float *)&v36[v14];
    float v17 = *(float *)&v35[v14];
    if ((v15 & 1) == 0) {
      break;
    }
    char v15 = 0;
    uint64_t v14 = 1;
  }
  while (v16 >= v17);
  if (v16 < v17) {
    return 0;
  }
  float v18 = *((float *)a3 + 2);
  if (v18 == 0.0) {
    return 0;
  }
  float v19 = *((float *)a3 + 1);
  float v20 = *(float *)a3 - v8;
  float v21 = v7 - *(float *)a3;
  if (v20 >= v21) {
    float v21 = v20;
  }
  float v22 = v19 - v10;
  if ((float)(v19 - v10) < (float)(v11 - v19)) {
    float v22 = v11 - v19;
  }
  if (v21 >= v18 || v22 >= v18) {
    return 0;
  }
  if (v21 <= 0.0 || v22 <= 0.0)
  {
    float v24 = v18 * v18;
  }
  else
  {
    float v24 = v18 * v18;
    if ((float)((float)(v22 * v22) + (float)(v21 * v21)) >= (float)(v18 * v18)) {
      return 0;
    }
  }
  unint64_t v26 = a5 - 2;
  if (a5 < 2) {
    return 0;
  }
  v27 = a4 + 1;
  do
  {
    float v28 = gm::Matrix<float,2,1>::nearestPointOffsetAlongLineSegment<int,void>((float *)a3, (float *)&v27[-1], (float *)v27);
    float var0 = v27[-1].var0;
    float var1 = v27[-1].var1;
    float v31 = v27->var0;
    float v32 = v27->var1;
    ++v27;
    float v33 = (float)((float)((float)(*(float *)a3 - (float)(var0 + (float)((float)(v31 - var0) * v28)))
                        * (float)(*(float *)a3 - (float)(var0 + (float)((float)(v31 - var0) * v28))))
                + 0.0)
        + (float)((float)(*((float *)a3 + 1) - (float)(var1 + (float)((float)(v32 - var1) * v28)))
                * (float)(*((float *)a3 + 1) - (float)(var1 + (float)((float)(v32 - var1) * v28))));
    BOOL result = v33 < v24;
  }
  while (v33 >= v24 && v26-- != 0);
  return result;
}

@end