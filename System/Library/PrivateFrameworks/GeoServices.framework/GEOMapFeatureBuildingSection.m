@interface GEOMapFeatureBuildingSection
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- (GEOMapFeatureBuildingSection)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4 sectionIndex:(unint64_t)a5;
- (GEOMapFeatureBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4;
- (double)baseHeight;
- (double)height;
- (double)maxBaseHeight;
- (double)minBaseHeight;
- (double)terrainElevation;
- (double)topHeight;
- (unint64_t)coordinateCount;
- (void)dealloc;
@end

@implementation GEOMapFeatureBuildingSection

- (GEOMapFeatureBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapFeatureBuildingSection;
  v8 = [(GEOMapFeatureBuildingSection *)&v27 init];
  v9 = v8;
  if (v8)
  {
    v8->_coordinateCount = 0x7FFFFFFFFFFFFFFFLL;
    v8->_sectionIndex = a4;
    objc_storeStrong((id *)&v8->_feature, a3);
    v10 = [v7 feature];
    v11 = [v10 feature];
    v12 = [v11 containingTile];
    uint64_t v13 = [v12 tileKey];
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *(void *)v13 << 32;
    unint64_t v16 = BYTE4(*(void *)v13) | ((((*(void *)v13 >> 40) | (*(unsigned __int16 *)(v13 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v13 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v13 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v13 + 10) >> 4) << 52);
    *(void *)((char *)v29 + 1) = v15 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v13 >> 8) & 0x3F) << 40);
    LOBYTE(v29[0]) = v14;
    *((void *)&v17 + 1) = v16;
    *(void *)&long long v17 = v15;
    v28[0] = v29[0];
    v28[1] = v17 >> 56;

    double v18 = GEOMapRectForGEOTileKey((uint64_t)v28);
    double v21 = GEOMetersBetweenMapPoints(v18, v20, v18 + v19, v20);
    v9->_baseHeight = v21 * GEOBuildingFootprintBaseHeight(v7, a4);
    v9->_height = v21 * GEOBuildingFootprintExtrusionHeight(v7, a4);
    v22 = [v7 feature];
    v23 = [v22 feature];
    uint64_t v24 = [v23 containingTile];
    tile = v9->_tile;
    v9->_tile = (GEOVectorTile *)v24;
  }
  return v9;
}

- (GEOMapFeatureBuildingSection)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4 sectionIndex:(unint64_t)a5
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v62.receiver = self;
  v62.super_class = (Class)GEOMapFeatureBuildingSection;
  v10 = [(GEOMapFeatureBuildingSection *)&v62 init];
  v11 = v10;
  if (v10)
  {
    v10->_uint64_t coordinateCount = 0;
    v10->_sectionIndex = a5;
    objc_storeStrong((id *)&v10->_tile, a3);
    *(_OWORD *)&v11->_terrainElevation = xmmword_18A636260;
    *(_OWORD *)&v11->_minBaseHeight = xmmword_18A636250;
    if ([v9 daVinciBuildingSectionCount] > a5)
    {
      uint64_t v12 = [v9 daVinciBuildingSections];
      unsigned int v13 = *(unsigned __int16 *)([v9 daVinciBuildings] + 40 * a4 + 32);
      [(GEOVectorTile *)v11->_tile metersToTileSize];
      uint64_t v14 = v12 + 20 * v13;
      double v61 = 1.0 / v15;
      int8x16_t v16 = (int8x16_t)vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)(v14 + 20 * a5 + 4)), 1.0 / v15);
      *(int8x16_t *)&v11->_terrainElevation = vextq_s8(v16, v16, 8uLL);
      uint64_t v17 = [v9 daVinciLineLoops];
      uint64_t v18 = *(unsigned int *)(v14 + 20 * a5 + 12);
      uint64_t v19 = [v9 daVinciBuildingVertices];
      unsigned int v20 = *(_DWORD *)(v17 + 8 * v18);
      uint64_t v21 = [v9 tileKey];
      uint64_t v22 = *(void *)v21;
      uint64_t v23 = *(void *)v21 << 32;
      unint64_t v24 = BYTE4(*(void *)v21) | ((((*(void *)v21 >> 40) | (*(unsigned __int16 *)(v21 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v21 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v21 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v21 + 10) >> 4) << 52);
      *(void *)((char *)&__p + 1) = v23 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v21 >> 8) & 0x3F) << 40);
      LOBYTE(__p) = v22;
      *((void *)&v25 + 1) = v24;
      *(void *)&long long v25 = v23;
      v65[0] = __p;
      v65[1] = v25 >> 56;
      double v26 = GEOMapRectForGEOTileKey((uint64_t)v65);
      long long __p = 0uLL;
      v64 = 0;
      uint64_t v30 = v17 + 8 * v18;
      int v32 = *(unsigned __int16 *)(v30 + 4);
      v31 = (unsigned __int16 *)(v30 + 4);
      if (v32)
      {
        double v33 = v26;
        double v34 = v27;
        double v35 = v28;
        double v36 = v29;
        v37 = 0;
        unint64_t v38 = 0;
        uint64_t v39 = v19 + 12 * v20;
        do
        {
          double v40 = GEOCoordinate2DForMapPoint(v33 + *(float *)(v39 + 12 * v38) * v35, v34 + (float)(1.0 - *(float *)(v39 + 12 * v38 + 4)) * v36);
          double v42 = v40;
          uint64_t v43 = v41;
          if (v37 >= v64)
          {
            v44 = (double *)__p;
            uint64_t v45 = (uint64_t)((uint64_t)v37 - __p) >> 4;
            unint64_t v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 60) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v47 = (uint64_t)v64 - __p;
            if ((uint64_t)((uint64_t)v64 - __p) >> 3 > v46) {
              unint64_t v46 = v47 >> 3;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v64, v48);
              v37 = (double *)*((void *)&__p + 1);
              v44 = (double *)__p;
            }
            else
            {
              v49 = 0;
            }
            v50 = &v49[16 * v45];
            *(double *)v50 = v42;
            *((void *)v50 + 1) = v43;
            v51 = v50;
            if (v37 != v44)
            {
              do
              {
                *((_OWORD *)v51 - 1) = *((_OWORD *)v37 - 1);
                v51 -= 16;
                v37 -= 2;
              }
              while (v37 != v44);
              v44 = (double *)__p;
            }
            v37 = (double *)(v50 + 16);
            *(void *)&long long __p = v51;
            *((void *)&__p + 1) = v50 + 16;
            v64 = (double *)&v49[16 * v48];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            double *v37 = v40;
            *((void *)v37 + 1) = v41;
            v37 += 2;
          }
          *((void *)&__p + 1) = v37;
          uint64_t coordinateCount = v11->_coordinateCount + 1;
          v11->_uint64_t coordinateCount = coordinateCount;
          double v53 = v61 * *(float *)(v39 + 12 * v38 + 8);
          double v54 = fmin(v11->_minBaseHeight, v53);
          double v55 = fmax(v11->_maxBaseHeight, v53);
          v11->_minBaseHeight = v54;
          v11->_maxBaseHeight = v55;
          ++v38;
        }
        while (v38 < *v31);
      }
      else
      {
        uint64_t coordinateCount = v11->_coordinateCount;
      }
      v56 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * coordinateCount, 0x1000040451B5BE8uLL);
      v11->_coordinates = v56;
      unint64_t v57 = v11->_coordinateCount;
      if (v57)
      {
        v58 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)__p;
        do
        {
          $F24F406B2B787EFB06265DBA3D28CBD5 v59 = *v58++;
          *v56++ = v59;
          --v57;
        }
        while (v57);
      }
      if ((void)__p)
      {
        *((void *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
    }
  }

  return v11;
}

- (void)dealloc
{
  free(self->_coordinates);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureBuildingSection;
  [(GEOMapFeatureBuildingSection *)&v3 dealloc];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  v30[2] = *MEMORY[0x1E4F143B8];
  coordinates = self->_coordinates;
  if (!coordinates)
  {
    v4 = [(GEOBuildingFootprintFeature *)self->_feature feature];
    unint64_t v28 = 0;
    v5 = GEOMultiSectionFeaturePoints(v4, self->_sectionIndex, &v28);
    v6 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v28, 0x1000040451B5BE8uLL);
    unint64_t v7 = v28;
    self->_coordinates = v6;
    self->_uint64_t coordinateCount = v7;
    v8 = [v4 feature];
    id v9 = [v8 containingTile];
    uint64_t v10 = [v9 tileKey];
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)v10 << 32;
    unint64_t v13 = BYTE4(*(void *)v10) | ((((*(void *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) >> 4) << 52);
    *(void *)((char *)v30 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v10 >> 8) & 0x3F) << 40);
    LOBYTE(v30[0]) = v11;
    *((void *)&v14 + 1) = v13;
    *(void *)&long long v14 = v12;
    v29[0] = v30[0];
    v29[1] = v14 >> 56;

    double v15 = GEOMapRectForGEOTileKey((uint64_t)v29);
    unint64_t v19 = v28;
    coordinates = self->_coordinates;
    if (v28)
    {
      double v20 = v15;
      double v21 = v16;
      double v22 = v17;
      double v23 = v18;
      p_var1 = &coordinates->var1;
      long long v25 = (float *)v5 + 1;
      do
      {
        *(p_var1 - 1) = GEOCoordinate2DForMapPoint(v20 + *(v25 - 1) * v22, v21 + (float)(1.0 - *v25) * v23);
        *(void *)p_var1 = v26;
        p_var1 += 2;
        v25 += 2;
        --v19;
      }
      while (v19);
    }
  }
  return coordinates;
}

- (unint64_t)coordinateCount
{
  unint64_t result = self->_coordinateCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(GEOMapFeatureBuildingSection *)self coordinates];
    return self->_coordinateCount;
  }
  return result;
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (double)height
{
  return self->_height;
}

- (double)terrainElevation
{
  return self->_terrainElevation;
}

- (double)topHeight
{
  return self->_topHeight;
}

- (double)minBaseHeight
{
  return self->_minBaseHeight;
}

- (double)maxBaseHeight
{
  return self->_maxBaseHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);

  objc_storeStrong((id *)&self->_tile, 0);
}

@end