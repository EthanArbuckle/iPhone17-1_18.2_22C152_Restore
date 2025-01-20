@interface GEOMapAccessBuildingSection
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- (GEOMapAccessBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4;
- (double)baseHeight;
- (double)height;
- (double)radius;
- (unint64_t)coordinateCount;
- (void)dealloc;
@end

@implementation GEOMapAccessBuildingSection

- (GEOMapAccessBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEOMapAccessBuildingSection;
  v7 = [(GEOMapAccessBuildingSection *)&v45 init];
  if (v7)
  {
    v8 = [v6 feature];
    v9 = [v8 feature];
    v10 = [v9 containingTile];
    uint64_t v11 = [v10 tileKey];
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)v11 << 32;
    unint64_t v14 = BYTE4(*(void *)v11) | ((((*(void *)v11 >> 40) | (*(unsigned __int16 *)(v11 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v11 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v11 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v11 + 10) >> 4) << 52);
    *(void *)v47 = v13 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v11 >> 8) & 0x3F) << 40);
    char v46 = v12;
    *((void *)&v15 + 1) = v14;
    *(void *)&long long v15 = v13;
    *(void *)&v47[7] = v15 >> 56;

    double v16 = GEOMapRectForGEOTileKey((uint64_t)&v46);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = GEOMetersBetweenMapPoints(v16, v17, v16 + v19, v17);
    unint64_t v44 = 0;
    v24 = GEOMultiSectionFeaturePoints(v8, a4, &v44);
    v25 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v44, 0x1000040451B5BE8uLL);
    unint64_t v26 = v44;
    v7->_coordinates = v25;
    v7->_coordinateCount = v26;
    v7->_baseHeight = v23 * GEOBuildingFootprintBaseHeight(v6, a4);
    v7->_height = v23 * GEOBuildingFootprintExtrusionHeight(v6, a4);
    v7->_sectionIndex = a4;
    unint64_t v27 = v44;
    if (v44)
    {
      p_var1 = &v7->_coordinates->var1;
      v29 = (float *)v24 + 1;
      double v30 = 1.79769313e308;
      double v31 = -1.79769313e308;
      double v32 = -1.79769313e308;
      double v33 = 1.79769313e308;
      double v42 = v22;
      double v43 = v18;
      do
      {
        double v34 = v20;
        double v35 = v16 + *(v29 - 1) * v20;
        double v36 = v16;
        double v37 = v43 + (float)(1.0 - *v29) * v42;
        *(p_var1 - 1) = GEOCoordinate2DForMapPoint(v35, v37);
        *(void *)p_var1 = v38;
        if (v35 < v33) {
          double v33 = v35;
        }
        if (v37 < v30) {
          double v30 = v37;
        }
        if (v35 > v32) {
          double v32 = v35;
        }
        double v20 = v34;
        if (v37 > v31) {
          double v31 = v37;
        }
        double v16 = v36;
        p_var1 += 2;
        v29 += 2;
        --v27;
      }
      while (v27);
    }
    else
    {
      double v32 = -1.79769313e308;
      double v33 = 1.79769313e308;
      double v30 = 1.79769313e308;
      double v31 = -1.79769313e308;
    }
    v7->_centerCoordinate.latitude = GEOCoordinate2DForMapPoint((v33 + v32) * 0.5, (v30 + v31) * 0.5);
    v7->_centerCoordinate.longitude = v39;
    v7->_radius = GEOMetersBetweenMapPoints(v33, v30, (v33 + v32) * 0.5, (v30 + v31) * 0.5);
    v40 = v7;
  }
  return v7;
}

- (void)dealloc
{
  coordinates = self->_coordinates;
  if (coordinates)
  {
    free(coordinates);
    self->_coordinates = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessBuildingSection;
  [(GEOMapAccessBuildingSection *)&v4 dealloc];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  return self->_coordinates;
}

- (unint64_t)coordinateCount
{
  return self->_coordinateCount;
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (double)height
{
  return self->_height;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

@end