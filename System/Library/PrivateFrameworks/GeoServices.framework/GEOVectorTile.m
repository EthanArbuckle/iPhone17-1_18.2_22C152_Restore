@interface GEOVectorTile
- ($5E5F304956FB491AF6F034FDF0808287)geoConnectivityPointOnRoad;
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)geoSortedConnectivityPointOnRoad;
- (BOOL)buildingsHaveTerrainElevation;
- (BOOL)containsDaVinciData;
- (BOOL)containsProjectedLegacyData;
- (BOOL)hasComputedJunctions;
- (BOOL)isEqual:(id)a3;
- (GEOVectorTile)initWithVectorTile:(const void *)a3;
- (GeoCodecsCharacteristicPoint)lineCharacteristicPoints;
- (GeoCodecsCharacteristicPoint)polygonCharacteristicPoints;
- (GeoCodecsConnectivityJunction)junctions;
- (GeoCodecsConnectivityJunction)transitJunctions;
- (GeoCodecsConnectivityOverpass)overpasses;
- (GeoCodecsConnectivityPointOnRoad)pointsOnRoad;
- (GeoCodecsConnectivityPointOnRoad)sortedPointsOnRoad;
- (GeoCodecsConnectivityPointOnRoad)transitPointsOnRoad;
- (GeoCodecsCurveVertexPool)curveLineVertices;
- (GeoCodecsDaVinciBuildingSection)daVinciBuildingSections;
- (GeoCodecsDaVinciDirectionalXYTextureMappingData)directionalXYTextureData;
- (GeoCodecsDaVinciExplicitTextureMappingData)explicitTextureData;
- (GeoCodecsDaVinciLineLoop)daVinciLineLoops;
- (GeoCodecsDaVinciMaterialSheet)daVinciMaterialSheets;
- (GeoCodecsDaVinciMesh)daVinciMeshes;
- (GeoCodecsDaVinciMetaData)daVinciMetaData;
- (GeoCodecsDaVinciRenderable)daVinciRenderables;
- (GeoCodecsDaVinciScene)daVinciScenes;
- (GeoCodecsDaVinciStyleAttributeRaster)daVinciStyleAttributeRasters;
- (GeoCodecsLabelLineAttribute)labelLineAttributes;
- (GeoCodecsLabelLineFeatureSection)labelLineFeatureSections;
- (GeoCodecsLabelSummaryIcon)labelSummaryIcons;
- (GeoCodecsLabelTextPlacement)labelTextPlacements;
- (GeoCodecsLineCrossing)lineCrossings;
- (GeoCodecsSslpmTileInfo)sslpmTileInfo;
- (GeoCodecsStrokeSpecification)lineStrokeSpecifications;
- (GeoCodecsStrokeSpecification)polygonStrokeSpecifications;
- (GeoCodecsTileKey)tileKey;
- (GeoCodecsTileKey)tileReferences;
- (GeoCodecsTileLabelLine)tileLabelLines;
- (GeoCodecsVectorTilePoint3D)daVinciBuildingVertices;
- (GeoCodecsVectorTilePoint3D)daVinciVertices;
- (GeoCodecsVenueComponent)venueComponents;
- (GeoCodecsVenueLevel)venueLevels;
- (GeoCodecsVertexPool)lineVertices;
- (GeoCodecsVertexPool)physicalFeaturesVertices;
- (GeoCodecsVertexPool)transitStationTransferVertices;
- (GeoCodecsVertexPool)transitVertices;
- (NSMutableArray)junctionsWithoutFeature;
- (NSMutableArray)overlapBuildingFootprints;
- (char)elevationRasterPng;
- (char)initWithVMP4:(void *)a3 localizationData:(void *)a4 tileKey:(unsigned __int8 *)a5;
- (char)transitCoverage;
- (const)transitLinkSections;
- (double)metersToTileSize;
- (float)geoTileKey;
- (float)tileSizeInMeters;
- (float)transitLinkLineMinZoomOverrides;
- (id).cxx_construct;
- (id)buildingFootprints;
- (id)coastlines;
- (id)lines;
- (id)transitLines;
- (id)transitLinks;
- (shared_ptr<geo::codec::VectorTile>)vectorTilePtr;
- (signed)maxElevationInMeters;
- (signed)minElevationInMeters;
- (uint64_t)initWithVMP4:localizationData:tileKey:;
- (unint64_t)buildingFootprintsCount;
- (unint64_t)coastlinesCount;
- (unint64_t)daVinciExternalAssetIDs;
- (unint64_t)daVinciExternalMaterialIDs;
- (unint64_t)junctionsCount;
- (unint64_t)lineCharacteristicPointCount;
- (unint64_t)lineCrossingsCount;
- (unint64_t)lineStrokeSpecificationCount;
- (unint64_t)linesCount;
- (unint64_t)nonOverlappingBuildingFootprintsCount;
- (unint64_t)nonOverlappingThreeDBuildingsCount;
- (unint64_t)overlapBuildingFootprintsCount;
- (unint64_t)physicalFeaturesCount;
- (unint64_t)poiStorefrontBundleIDs;
- (unint64_t)pointsOnRoadCount;
- (unint64_t)poisCount;
- (unint64_t)polygonCharacteristicPointCount;
- (unint64_t)polygonStrokeSpecificationCount;
- (unint64_t)polygonsCount;
- (unint64_t)polygonsVertexCount;
- (unint64_t)tileReferenceCount;
- (unint64_t)totalBuildingFootprintsCount;
- (unint64_t)totalThreeDBuildingsCount;
- (unint64_t)transitAccessPointCount;
- (unint64_t)transitJunctionCount;
- (unint64_t)transitLineCount;
- (unint64_t)transitLinkCount;
- (unint64_t)transitLinkLineIndices;
- (unint64_t)transitLinkLineIndicesCount;
- (unint64_t)transitNodeCollapseIDCount;
- (unint64_t)transitNodeCollapseIDs;
- (unint64_t)transitNodeCollapseIndexCount;
- (unint64_t)transitNodeCollapseIndices;
- (unint64_t)transitNodeCount;
- (unint64_t)transitNodeIndexCount;
- (unint64_t)transitNodeLineIndices;
- (unint64_t)transitNodeSubtitleLineIndices;
- (unint64_t)transitNodeSystemIndices;
- (unint64_t)transitPointsOnRoadCount;
- (unint64_t)transitShieldIndices;
- (unint64_t)transitStationTransferCount;
- (unint64_t)transitSystemCount;
- (unint64_t)venueBuildingsCount;
- (unint64_t)venueComponentsCount;
- (unint64_t)venueLevelsCount;
- (unint64_t)venuesCount;
- (unsigned)daVinciAssetCount;
- (unsigned)daVinciBuildingCount;
- (unsigned)daVinciBuildingSectionCount;
- (unsigned)daVinciBuildingVertexCount;
- (unsigned)daVinciBuildingVertexOffset;
- (unsigned)daVinciDecalCount;
- (unsigned)daVinciExternalAssetCount;
- (unsigned)daVinciExternalMaterialCount;
- (unsigned)daVinciIndexCount;
- (unsigned)daVinciIndices;
- (unsigned)daVinciLineLoopCount;
- (unsigned)daVinciMaterialSheetCount;
- (unsigned)daVinciMeshCount;
- (unsigned)daVinciRenderableCount;
- (unsigned)daVinciSceneCount;
- (unsigned)daVinciStyleAttributeRasterCount;
- (unsigned)daVinciTileVersion;
- (unsigned)daVinciVertexCount;
- (unsigned)directionalXYTextureDataCount;
- (unsigned)elevationRasterByteCount;
- (unsigned)explicitTextureDataCount;
- (unsigned)labelLineAttributesCount;
- (unsigned)labelLineFeatureSectionsCount;
- (unsigned)labelSummaryIconsCount;
- (unsigned)labelTextPlacementsCount;
- (unsigned)poiStorefrontBundleIDsCount;
- (unsigned)runningTrackFlags;
- (unsigned)tileLabelLinesCount;
- (unsigned)transitLineDirections;
- (unsigned)transitTravelTimes;
- (unsigned)zResolutionBits;
- (void)daVinciAssets;
- (void)daVinciBuildings;
- (void)daVinciDecals;
- (void)forEachEdgeInRoad:(id)a3 visitTwice:(BOOL)a4 visitor:(id)a5;
- (void)forEachEdgeOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4;
- (void)forEachJunction:(id)a3;
- (void)forEachJunctionInRoad:(void *)a3 visitor:(id)a4;
- (void)forEachPoint:(id)a3;
- (void)forEachPolygon:(id)a3;
- (void)forEachRoad:(id)a3;
- (void)forEachRunningTrack:(id)a3;
- (void)forEachTransitLinkOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4;
- (void)initWithVMP4:localizationData:tileKey:;
- (void)physicalFeatures;
- (void)pois;
- (void)polygons;
- (void)transitAccessPointForFeatureID:(unint64_t)a3;
- (void)transitAccessPoints;
- (void)transitLineForFeatureID:(unint64_t)a3;
- (void)transitNodeForFeatureID:(unint64_t)a3;
- (void)transitNodes;
- (void)transitStationTransfers;
- (void)transitSystemInfoForFeatureID:(unint64_t)a3;
- (void)transitSystems;
- (void)venueBuildings;
- (void)venues;
@end

@implementation GEOVectorTile

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 16) = 0;
  return self;
}

- (shared_ptr<geo::codec::VectorTile>)vectorTilePtr
{
  cntrl = self->_vectorTile.__cntrl_;
  *v2 = self->_vectorTile.__ptr_;
  v2[1] = (VectorTile *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VectorTile *)self;
  return result;
}

- (char)initWithVMP4:(void *)a3 localizationData:(void *)a4 tileKey:(unsigned __int8 *)a5
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v37.receiver = a1;
  v37.super_class = (Class)GEOVectorTile;
  v10 = [(GEOVectorTile *)&v37 init];
  if (!v10)
  {
    v16 = 0;
    goto LABEL_28;
  }
  id v11 = v9;
  geo::codec::PBDataReaderObjC::PBDataReaderObjC((geo::codec::PBDataReaderObjC *)v36, (const unsigned __int8 *)[v11 bytes], objc_msgSend(v11, "length"));
  memset(&__p, 0, sizeof(__p));
  uint64_t v42 = 0x400000;
  v45 = 0;
  char v43 = 1;
  uint64_t v12 = *a5;
  int v13 = v12 & 0x7F;
  if (v13 == 19)
  {
    unint64_t v17 = *(void *)(a5 + 1);
    char v40 = 0;
    unint64_t v18 = (v17 << 9) & 0xFFFFFF0000000000 | ((v17 & 0x3F) << 8) & 0x3FFF | (((v17 >> 6) & 0x1FFFFFF) << 14) | v12;
    __int16 v39 = (v17 >> 55) & 1;
LABEL_10:
    unint64_t v38 = v18;
    goto LABEL_11;
  }
  if (v13 != 16)
  {
    unint64_t v19 = *(void *)(a5 + 1);
    if (v13 == 20)
    {
      __int16 v39 = HIBYTE(v19) & 3;
      unint64_t v18 = (v19 << 8) & 0xFFFFFF0000003FFFLL | ((unint64_t)(v19 >> 6) << 14) | v12;
      char v40 = ((v19 >> 42) >> 16) & 0xF;
    }
    else
    {
      unint64_t v20 = *(unsigned int *)(a5 + 9) | ((unint64_t)(*(unsigned __int16 *)(a5 + 13) | (a5[15] << 16)) << 32);
      *((void *)&v21 + 1) = v20;
      *(void *)&long long v21 = *(void *)(a5 + 1);
      char v40 = BYTE6(v20);
      unint64_t v18 = (v21 >> 32) & 0xFFFFFFFFFFFFFF00 | v12;
      __int16 v39 = WORD2(v20);
    }
    goto LABEL_10;
  }
  unsigned int v14 = *(_DWORD *)(a5 + 9);
  unint64_t v15 = *(void *)(a5 + 1);
  char v40 = v14 >> 11;
  unint64_t v38 = (v15 << 8) & 0xFFFFFF0000003FFFLL | ((unint64_t)(v15 >> 6) << 14) | v12;
  __int16 v39 = HIBYTE(v15) & 3 | (v15 >> 59) & 0xFC | (32 * v14);
LABEL_11:
  v22 = +[GEOResourceManifestManager modernManager];
  id v23 = [v22 languageForTileKey:a5];
  uint64_t v24 = [v23 UTF8String];

  if (v24) {
    v25 = (char *)v24;
  }
  else {
    v25 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v46, v25);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v46;
  v46.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1ED5177B8;
  if (v45 == (std::string *)v44)
  {
    v48[0] = &unk_1ED5177B8;
    v47 = 0;
    (*(void (**)(void *, std::string *))(v44[0] + 24))(v44, &v46);
    (*(void (**)(std::string *))(v45->__r_.__value_.__r.__words[0] + 32))(v45);
    v45 = 0;
    v47 = &v46;
    (*(void (**)(void *, void *))(v48[0] + 24))(v48, v44);
    (*(void (**)(void *))(v48[0] + 32))(v48);
  }
  else
  {
    v47 = v45;
    v44[0] = &unk_1ED5177B8;
  }
  v45 = (std::string *)v44;
  std::__function::__value_func<std::unordered_set<unsigned long long> ()(void)>::~__value_func[abi:ne180100](&v46);
  id v26 = v8;
  v27 = (const char *)[v26 bytes];
  unint64_t v28 = [v26 length];
  id v29 = v11;
  geo::codec::initWithVMP4AndLocData(v27, v28, (unsigned char *)[v29 bytes], objc_msgSend(v29, "length"), (uint64_t)&v38, &__p, (geo::codec::VectorTile **)&v46);
  long long v30 = *(_OWORD *)&v46.__r_.__value_.__l.__data_;
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = 0uLL;
  v31 = (std::__shared_weak_count *)*((void *)v10 + 2);
  *(_OWORD *)(v10 + 8) = v30;
  if (v31)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
    if (v46.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v46.__r_.__value_.__l.__size_);
    }
  }
  if (*((void *)v10 + 1))
  {
    v32 = +[GEOResourceManifestManager modernManager];
    v33 = [v32 activeTileGroup];
    v34 = [v33 activeTileSetForKey:a5];
    **((_DWORD **)v10 + 1) = [v34 version];

    v16 = v10;
  }
  else
  {
    v16 = 0;
  }
  std::__function::__value_func<std::unordered_set<unsigned long long> ()(void)>::~__value_func[abi:ne180100](v44);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  geo::codec::PBDataReaderObjC::~PBDataReaderObjC((geo::codec::PBDataReaderObjC *)v36);
LABEL_28:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_connectivityJunctions, 0);
  objc_storeStrong((id *)&self->_cached_overlapBuildingFootprints, 0);
  objc_storeStrong((id *)&self->_cached_transitLinks, 0);
  objc_storeStrong((id *)&self->_cached_transitLines, 0);
  objc_storeStrong((id *)&self->_cached_buildingFootprints, 0);
  objc_storeStrong((id *)&self->_cached_coastlines, 0);
  objc_storeStrong((id *)&self->_cached_lines, 0);
  cntrl = self->_vectorTile.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)initWithVMP4:localizationData:tileKey:
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4)
    {
      [v4 vectorTilePtr];
      BOOL v5 = self->_vectorTile.__ptr_ == v7;
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
    }
    else
    {
      BOOL v5 = self->_vectorTile.__ptr_ == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)lines
{
  p_initLinesFlag = &self->_initLinesFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initLinesFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initLinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile lines]::$_1 &&>>);
  }

  cached_lines = v3->_cached_lines;

  return cached_lines;
}

- (id)coastlines
{
  p_initCoastlinesFlag = &self->_initCoastlinesFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initCoastlinesFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initCoastlinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile coastlines]::$_2 &&>>);
  }

  cached_coastlines = v3->_cached_coastlines;

  return cached_coastlines;
}

- (id)buildingFootprints
{
  p_initBuildingFootprintsFlag = &self->_initBuildingFootprintsFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initBuildingFootprintsFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initBuildingFootprintsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile buildingFootprints]::$_3 &&>>);
  }

  cached_buildingFootprints = v3->_cached_buildingFootprints;

  return cached_buildingFootprints;
}

- (NSMutableArray)junctionsWithoutFeature
{
  p_initConnectivityJunctionsFlag = &self->_initConnectivityJunctionsFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initConnectivityJunctionsFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initConnectivityJunctionsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile junctionsWithoutFeature]::$_4 &&>>);
  }

  cached_connectivityJunctions = v3->_cached_connectivityJunctions;

  return cached_connectivityJunctions;
}

- (id)transitLines
{
  p_initTransitLinesFlag = &self->_initTransitLinesFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initTransitLinesFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initTransitLinesFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile transitLines]::$_5 &&>>);
  }

  cached_transitLines = v3->_cached_transitLines;

  return cached_transitLines;
}

- (id)transitLinks
{
  p_initTransitLinksFlag = &self->_initTransitLinksFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initTransitLinksFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initTransitLinksFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile transitLinks]::$_6 &&>>);
  }

  cached_transitLinks = v3->_cached_transitLinks;

  return cached_transitLinks;
}

- (NSMutableArray)overlapBuildingFootprints
{
  p_initOverlapBuildingFootprintsFlag = &self->_initOverlapBuildingFootprintsFlag;
  v3 = self;
  v6 = v3;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initOverlapBuildingFootprintsFlag, memory_order_acquire) != -1)
  {
    id v8 = (id *)&v6;
    v7 = &v8;
    std::__call_once(&p_initOverlapBuildingFootprintsFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[GEOVectorTile overlapBuildingFootprints]::$_7 &&>>);
  }

  cached_overlapBuildingFootprints = v3->_cached_overlapBuildingFootprints;

  return cached_overlapBuildingFootprints;
}

- (void)polygons
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 12);
}

- (void)venues
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 23);
}

- (void)venueBuildings
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 27);
}

- (void)pois
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 63);
}

- (GeoCodecsConnectivityJunction)junctions
{
  return (GeoCodecsConnectivityJunction *)*((void *)self->_vectorTile.__ptr_ + 86);
}

- (void)transitSystems
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 164);
}

- (void)transitNodes
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 176);
}

- (void)transitStationTransfers
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 183);
}

- (GeoCodecsConnectivityJunction)transitJunctions
{
  return (GeoCodecsConnectivityJunction *)*((void *)self->_vectorTile.__ptr_ + 187);
}

- (void)transitAccessPoints
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 195);
}

- (void)daVinciAssets
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 259);
}

- (void)daVinciDecals
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 275);
}

- (void)daVinciBuildings
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 290);
}

- (void)physicalFeatures
{
  return (void *)*((void *)self->_vectorTile.__ptr_ + 19);
}

- (unint64_t)linesCount
{
  return 0xCF3CF3CF3CF3CF3DLL
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 5) - *((void *)self->_vectorTile.__ptr_ + 4)) >> 3);
}

- (unint64_t)coastlinesCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 9) - *((void *)self->_vectorTile.__ptr_ + 8)) >> 3);
}

- (unint64_t)polygonsCount
{
  return (uint64_t)(*((void *)self->_vectorTile.__ptr_ + 13) - *((void *)self->_vectorTile.__ptr_ + 12)) >> 7;
}

- (unint64_t)polygonsVertexCount
{
  return *((void *)self->_vectorTile.__ptr_ + 16);
}

- (unint64_t)venuesCount
{
  return 0x8E38E38E38E38E39
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 24) - *((void *)self->_vectorTile.__ptr_ + 23)) >> 4);
}

- (unint64_t)venueBuildingsCount
{
  return 0x86BCA1AF286BCA1BLL
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 28) - *((void *)self->_vectorTile.__ptr_ + 27)) >> 3);
}

- (GeoCodecsVenueLevel)venueLevels
{
  return (GeoCodecsVenueLevel *)*((void *)self->_vectorTile.__ptr_ + 32);
}

- (unint64_t)venueLevelsCount
{
  return *((void *)self->_vectorTile.__ptr_ + 31);
}

- (GeoCodecsVenueComponent)venueComponents
{
  return (GeoCodecsVenueComponent *)*((void *)self->_vectorTile.__ptr_ + 34);
}

- (unint64_t)venueComponentsCount
{
  return *((void *)self->_vectorTile.__ptr_ + 33);
}

- (unint64_t)buildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 36) - *((void *)self->_vectorTile.__ptr_ + 35)) >> 3);
}

- (unint64_t)poisCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 64) - *((void *)self->_vectorTile.__ptr_ + 63)) >> 5);
}

- (GeoCodecsLabelTextPlacement)labelTextPlacements
{
  return (GeoCodecsLabelTextPlacement *)*((void *)self->_vectorTile.__ptr_ + 83);
}

- (unsigned)labelTextPlacementsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 168);
}

- (GeoCodecsConnectivityOverpass)overpasses
{
  return (GeoCodecsConnectivityOverpass *)*((void *)self->_vectorTile.__ptr_ + 85);
}

- (unint64_t)junctionsCount
{
  return *((void *)self->_vectorTile.__ptr_ + 87);
}

- (BOOL)hasComputedJunctions
{
  return *((unsigned char *)self->_vectorTile.__ptr_ + 704);
}

- (GeoCodecsLineCrossing)lineCrossings
{
  return (GeoCodecsLineCrossing *)*((void *)self->_vectorTile.__ptr_ + 93);
}

- (unint64_t)lineCrossingsCount
{
  return *((void *)self->_vectorTile.__ptr_ + 92);
}

- (GeoCodecsConnectivityPointOnRoad)pointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad *)*((void *)self->_vectorTile.__ptr_ + 89);
}

- (unint64_t)pointsOnRoadCount
{
  return *((void *)self->_vectorTile.__ptr_ + 90);
}

- ($5E5F304956FB491AF6F034FDF0808287)geoConnectivityPointOnRoad
{
  return ($5E5F304956FB491AF6F034FDF0808287 *)*((void *)self->_vectorTile.__ptr_ + 89);
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)geoSortedConnectivityPointOnRoad
{
  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)*((void *)self->_vectorTile.__ptr_ + 91);
}

- (GeoCodecsConnectivityPointOnRoad)sortedPointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad **)*((void *)self->_vectorTile.__ptr_ + 91);
}

- (GeoCodecsCharacteristicPoint)lineCharacteristicPoints
{
  return (GeoCodecsCharacteristicPoint *)*((void *)self->_vectorTile.__ptr_ + 150);
}

- (unint64_t)lineCharacteristicPointCount
{
  return *((void *)self->_vectorTile.__ptr_ + 151);
}

- (GeoCodecsCharacteristicPoint)polygonCharacteristicPoints
{
  return (GeoCodecsCharacteristicPoint *)*((void *)self->_vectorTile.__ptr_ + 152);
}

- (unint64_t)polygonCharacteristicPointCount
{
  return *((void *)self->_vectorTile.__ptr_ + 153);
}

- (GeoCodecsStrokeSpecification)lineStrokeSpecifications
{
  return (GeoCodecsStrokeSpecification *)*((void *)self->_vectorTile.__ptr_ + 154);
}

- (unint64_t)lineStrokeSpecificationCount
{
  return *((void *)self->_vectorTile.__ptr_ + 155);
}

- (GeoCodecsStrokeSpecification)polygonStrokeSpecifications
{
  return (GeoCodecsStrokeSpecification *)*((void *)self->_vectorTile.__ptr_ + 156);
}

- (unint64_t)polygonStrokeSpecificationCount
{
  return *((void *)self->_vectorTile.__ptr_ + 157);
}

- (GeoCodecsCurveVertexPool)curveLineVertices
{
  return (GeoCodecsCurveVertexPool *)*((void *)self->_vectorTile.__ptr_ + 96);
}

- (GeoCodecsVertexPool)lineVertices
{
  return (GeoCodecsVertexPool *)*((void *)self->_vectorTile.__ptr_ + 99);
}

- (GeoCodecsTileKey)tileKey
{
  return (GeoCodecsTileKey *)((char *)self->_vectorTile.__ptr_ + 4);
}

- (float)geoTileKey
{
  LODWORD(result) = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((*(unsigned __int16 *)(*(void *)(a1 + 8) + 12) | ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 8) + 14) << 16)) >> 2), (int32x2_t)*(unsigned __int8 *)(*(void *)(a1 + 8) + 14)), (int8x8_t)0xF00003FFFLL).u32[0];
  return result;
}

- (unint64_t)tileReferenceCount
{
  return *((void *)self->_vectorTile.__ptr_ + 158);
}

- (GeoCodecsTileKey)tileReferences
{
  return (GeoCodecsTileKey *)*((void *)self->_vectorTile.__ptr_ + 159);
}

- (unint64_t)transitLineCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 161) - *((void *)self->_vectorTile.__ptr_ + 160)) >> 3);
}

- (unint64_t)transitSystemCount
{
  return 0x8E38E38E38E38E39
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 165) - *((void *)self->_vectorTile.__ptr_ + 164)) >> 3);
}

- (unint64_t)transitLinkCount
{
  return 0xD37A6F4DE9BD37A7
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 169) - *((void *)self->_vectorTile.__ptr_ + 168)) >> 3);
}

- (unint64_t)transitLinkLineIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 173);
}

- (unint64_t)transitLinkLineIndicesCount
{
  return *((void *)self->_vectorTile.__ptr_ + 174);
}

- (GeoCodecsVertexPool)transitVertices
{
  return (GeoCodecsVertexPool *)*((void *)self->_vectorTile.__ptr_ + 175);
}

- (unint64_t)transitNodeCount
{
  return 0x82FA0BE82FA0BE83
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 177) - *((void *)self->_vectorTile.__ptr_ + 176)) >> 3);
}

- (unint64_t)transitNodeSystemIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 180);
}

- (unint64_t)transitNodeIndexCount
{
  return *((void *)self->_vectorTile.__ptr_ + 181);
}

- (GeoCodecsVertexPool)transitStationTransferVertices
{
  return (GeoCodecsVertexPool *)*((void *)self->_vectorTile.__ptr_ + 182);
}

- (unint64_t)transitStationTransferCount
{
  return 0x4EC4EC4EC4EC4EC5
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 184) - *((void *)self->_vectorTile.__ptr_ + 183)) >> 3);
}

- (unint64_t)transitJunctionCount
{
  return *((void *)self->_vectorTile.__ptr_ + 188);
}

- (GeoCodecsConnectivityPointOnRoad)transitPointsOnRoad
{
  return (GeoCodecsConnectivityPointOnRoad *)*((void *)self->_vectorTile.__ptr_ + 189);
}

- (unint64_t)transitPointsOnRoadCount
{
  return *((void *)self->_vectorTile.__ptr_ + 190);
}

- (unsigned)transitTravelTimes
{
  return (unsigned int *)*((void *)self->_vectorTile.__ptr_ + 191);
}

- (float)transitLinkLineMinZoomOverrides
{
  return (float *)*((void *)self->_vectorTile.__ptr_ + 192);
}

- (unint64_t)transitAccessPointCount
{
  return 0xEF7BDEF7BDEF7BDFLL
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 196) - *((void *)self->_vectorTile.__ptr_ + 195)) >> 3);
}

- (unint64_t)transitNodeLineIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 200);
}

- (unint64_t)transitNodeSubtitleLineIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 203);
}

- (unint64_t)transitShieldIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 205);
}

- (unsigned)transitLineDirections
{
  return (unsigned __int8 *)*((void *)self->_vectorTile.__ptr_ + 207);
}

- (const)transitLinkSections
{
  return (const GeoCodecsTransitLinkSection *)*((void *)self->_vectorTile.__ptr_ + 212);
}

- (char)transitCoverage
{
  return *((unsigned char *)self->_vectorTile.__ptr_ + 1712);
}

- (unint64_t)transitNodeCollapseIndices
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 222);
}

- (unint64_t)transitNodeCollapseIndexCount
{
  return *((void *)self->_vectorTile.__ptr_ + 223);
}

- (unint64_t)transitNodeCollapseIDs
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 224);
}

- (unint64_t)transitNodeCollapseIDCount
{
  return *((void *)self->_vectorTile.__ptr_ + 225);
}

- (GeoCodecsSslpmTileInfo)sslpmTileInfo
{
  return (GeoCodecsSslpmTileInfo *)*((void *)self->_vectorTile.__ptr_ + 226);
}

- (unsigned)tileLabelLinesCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 454);
}

- (GeoCodecsTileLabelLine)tileLabelLines
{
  return (GeoCodecsTileLabelLine *)*((void *)self->_vectorTile.__ptr_ + 228);
}

- (unsigned)labelLineFeatureSectionsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 458);
}

- (GeoCodecsLabelLineFeatureSection)labelLineFeatureSections
{
  return (GeoCodecsLabelLineFeatureSection *)*((void *)self->_vectorTile.__ptr_ + 230);
}

- (unsigned)labelLineAttributesCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 462);
}

- (GeoCodecsLabelLineAttribute)labelLineAttributes
{
  return (GeoCodecsLabelLineAttribute *)*((void *)self->_vectorTile.__ptr_ + 232);
}

- (unint64_t)poiStorefrontBundleIDs
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 234);
}

- (unsigned)poiStorefrontBundleIDsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 466);
}

- (GeoCodecsLabelSummaryIcon)labelSummaryIcons
{
  return (GeoCodecsLabelSummaryIcon *)*((void *)self->_vectorTile.__ptr_ + 236);
}

- (unsigned)labelSummaryIconsCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 470);
}

- (BOOL)containsDaVinciData
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 488) & 1;
}

- (BOOL)containsProjectedLegacyData
{
  return (*((unsigned __int8 *)self->_vectorTile.__ptr_ + 1952) >> 1) & 1;
}

- (unsigned)daVinciVertexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 490);
}

- (GeoCodecsVectorTilePoint3D)daVinciVertices
{
  return (GeoCodecsVectorTilePoint3D *)*((void *)self->_vectorTile.__ptr_ + 246);
}

- (unsigned)explicitTextureDataCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1000);
}

- (GeoCodecsDaVinciExplicitTextureMappingData)explicitTextureData
{
  return (GeoCodecsDaVinciExplicitTextureMappingData *)*((void *)self->_vectorTile.__ptr_ + 251);
}

- (unsigned)directionalXYTextureDataCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1008);
}

- (GeoCodecsDaVinciDirectionalXYTextureMappingData)directionalXYTextureData
{
  return (GeoCodecsDaVinciDirectionalXYTextureMappingData *)*((void *)self->_vectorTile.__ptr_ + 253);
}

- (unsigned)daVinciIndexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 508);
}

- (unsigned)daVinciIndices
{
  return (unsigned __int16 *)*((void *)self->_vectorTile.__ptr_ + 255);
}

- (unsigned)daVinciMeshCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1024);
}

- (GeoCodecsDaVinciMesh)daVinciMeshes
{
  return (GeoCodecsDaVinciMesh *)*((void *)self->_vectorTile.__ptr_ + 257);
}

- (unsigned)daVinciAssetCount
{
  return -13107
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 520) - *((_DWORD *)self->_vectorTile.__ptr_ + 518)) >> 3);
}

- (unsigned)daVinciMaterialSheetCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1068);
}

- (GeoCodecsDaVinciMaterialSheet)daVinciMaterialSheets
{
  return (GeoCodecsDaVinciMaterialSheet *)*((void *)self->_vectorTile.__ptr_ + 268);
}

- (unsigned)daVinciSceneCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1076);
}

- (GeoCodecsDaVinciScene)daVinciScenes
{
  return (GeoCodecsDaVinciScene *)*((void *)self->_vectorTile.__ptr_ + 270);
}

- (unsigned)daVinciRenderableCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1084);
}

- (GeoCodecsDaVinciRenderable)daVinciRenderables
{
  return (GeoCodecsDaVinciRenderable *)*((void *)self->_vectorTile.__ptr_ + 272);
}

- (unsigned)daVinciDecalCount
{
  return -29127
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 552) - *((_DWORD *)self->_vectorTile.__ptr_ + 550)) >> 3);
}

- (GeoCodecsDaVinciMetaData)daVinciMetaData
{
  return (GeoCodecsDaVinciMetaData *)*((void *)self->_vectorTile.__ptr_ + 279);
}

- (unsigned)daVinciBuildingVertexOffset
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 562);
}

- (unsigned)daVinciBuildingVertexCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 563);
}

- (unsigned)daVinciLineLoopCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1144);
}

- (GeoCodecsVectorTilePoint3D)daVinciBuildingVertices
{
  return (GeoCodecsVectorTilePoint3D *)*((void *)self->_vectorTile.__ptr_ + 282);
}

- (GeoCodecsDaVinciLineLoop)daVinciLineLoops
{
  return (GeoCodecsDaVinciLineLoop *)*((void *)self->_vectorTile.__ptr_ + 287);
}

- (unsigned)daVinciBuildingSectionCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1152);
}

- (GeoCodecsDaVinciBuildingSection)daVinciBuildingSections
{
  return (GeoCodecsDaVinciBuildingSection *)*((void *)self->_vectorTile.__ptr_ + 289);
}

- (unsigned)daVinciBuildingCount
{
  return -13107
       * ((*((_DWORD *)self->_vectorTile.__ptr_ + 582) - *((_DWORD *)self->_vectorTile.__ptr_ + 580)) >> 3);
}

- (signed)maxElevationInMeters
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1432);
}

- (signed)minElevationInMeters
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1433);
}

- (float)tileSizeInMeters
{
  return *((float *)self->_vectorTile.__ptr_ + 717);
}

- (unsigned)zResolutionBits
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1436);
}

- (unsigned)elevationRasterByteCount
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 719);
}

- (char)elevationRasterPng
{
  return (char *)*((void *)self->_vectorTile.__ptr_ + 360);
}

- (double)metersToTileSize
{
  return *((double *)self->_vectorTile.__ptr_ + 434);
}

- (BOOL)buildingsHaveTerrainElevation
{
  return *((unsigned char *)self->_vectorTile.__ptr_ + 3480);
}

- (unint64_t)physicalFeaturesCount
{
  return 0x2E8BA2E8BA2E8BA3
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 20) - *((void *)self->_vectorTile.__ptr_ + 19)) >> 4);
}

- (GeoCodecsVertexPool)physicalFeaturesVertices
{
  return (GeoCodecsVertexPool *)*((void *)self->_vectorTile.__ptr_ + 106);
}

- (unint64_t)totalBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 36) - *((void *)self->_vectorTile.__ptr_ + 35)) >> 3)
       - 0xF0F0F0F0F0F0F0FLL
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 48) - *((void *)self->_vectorTile.__ptr_ + 47)) >> 3);
}

- (unint64_t)totalThreeDBuildingsCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 56) - *((void *)self->_vectorTile.__ptr_ + 55)) >> 4)
       + 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 60) - *((void *)self->_vectorTile.__ptr_ + 59)) >> 4);
}

- (unint64_t)nonOverlappingBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 36) - *((void *)self->_vectorTile.__ptr_ + 35)) >> 3);
}

- (unint64_t)nonOverlappingThreeDBuildingsCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 56) - *((void *)self->_vectorTile.__ptr_ + 55)) >> 4);
}

- (unint64_t)overlapBuildingFootprintsCount
{
  return 0xF0F0F0F0F0F0F0F1
       * ((uint64_t)(*((void *)self->_vectorTile.__ptr_ + 48) - *((void *)self->_vectorTile.__ptr_ + 47)) >> 3);
}

- (void)forEachRoad:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  if (v8)
  {
    id v4 = [(GEOVectorTile *)self lines];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [v4 objectAtIndex:i];
        if ([v7 type] == 1) {
          v8[2](v8, v7);
        }
      }
    }
  }
}

- (void)forEachPoint:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  if (v8)
  {
    ptr = self->_vectorTile.__ptr_;
    uint64_t v5 = *((void *)ptr + 63);
    uint64_t v6 = *((void *)ptr + 64) - v5;
    if (v6)
    {
      uint64_t v7 = v6 / 224;
      do
      {
        v8[2](v8, v5);
        v5 += 224;
        --v7;
      }
      while (v7);
    }
  }
}

- (void)forEachPolygon:(id)a3
{
  uint64_t v6 = (void (**)(id, void))a3;
  if (v6)
  {
    uint64_t v4 = *((void *)self->_vectorTile.__ptr_ + 12);
    for (unint64_t i = [(GEOVectorTile *)self polygonsCount]; i; --i)
    {
      v6[2](v6, v4);
      v4 += 128;
    }
  }
}

- (void)forEachEdgeOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 && v6)
  {
    uint64_t v8 = *((void *)self->_vectorTile.__ptr_ + 89);
    id v9 = [(GEOVectorTile *)self lines];
    if (a3->var0)
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v9 objectAtIndex:*(unsigned int *)(v8 + 16 * (v10 + a3->var1) + 4)];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __47__GEOVectorTile_forEachEdgeOnJunction_visitor___block_invoke;
        v12[3] = &unk_1E53E65F8;
        unsigned int v14 = a3;
        id v13 = v7;
        [(GEOVectorTile *)self forEachEdgeInRoad:v11 visitTwice:1 visitor:v12];

        ++v10;
      }
      while (v10 < a3->var0);
    }
  }
}

void __47__GEOVectorTile_forEachEdgeOnJunction_visitor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 junctionA] == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)forEachEdgeInRoad:(id)a3 visitTwice:(BOOL)a4 visitor:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = (void (**)(void, void))v9;
  if (v8 && v9)
  {
    ptr = self->_vectorTile.__ptr_;
    uint64_t v31 = *((void *)ptr + 86);
    uint64_t v12 = *((void *)ptr + 91);
    uint64_t v33 = 0;
    geo::codec::multiSectionFeaturePoints((void *)[v8 get], 0, &v33);
    uint64_t v13 = [v8 roadPointIndex];
    unint64_t v14 = [v8 roadPointCount];
    id v15 = [[GEORoadEdge alloc] init:v32 withMultiSectionFeatureInterface:v8];
    id v30 = v8;
    uint64_t v16 = [v8 getRoad];
    *(void *)[v15 get] = v16;
    *(void *)([v15 get] + 8) = 0;
    *(void *)([v15 get] + 16) = 0;
    *(void *)([v15 get] + 24) = 0;
    *(void *)([v15 get] + 32) = 0;
    *(void *)([v15 get] + 40) = 0;
    unint64_t v17 = 0;
    *(void *)([v15 get] + 48) = 0;
    uint64_t v18 = v33 - 1;
    uint64_t v19 = v12 + 8 * v13;
    do
    {
      if (v17 >= v14)
      {
        *(void *)([v15 get] + 16) = v18;
        *(void *)([v15 get] + 32) = 0;
        uint64_t v24 = [v15 get];
        uint64_t v25 = 0;
      }
      else
      {
        unint64_t v20 = *(unsigned int **)(v19 + 8 * v17);
        uint64_t v21 = v20[3];
        *(void *)([v15 get] + 16) = v21;
        uint64_t v22 = *v20;
        *(void *)([v15 get] + 32) = v22;
        uint64_t v23 = *v20;
        uint64_t v24 = [v15 get];
        uint64_t v25 = v31 + 32 * v23;
      }
      *(void *)(v24 + 48) = v25;
      unint64_t v26 = [v15 vertexIndexA];
      if (v26 < [v15 vertexIndexB])
      {
        ((void (**)(void, id))v10)[2](v10, v15);
        if (v6)
        {
          GEORoadEdgeFlip(v15);
          ((void (**)(void, id))v10)[2](v10, v15);
          GEORoadEdgeFlip(v15);
        }
      }
      uint64_t v27 = [v15 vertexIndexB];
      *(void *)([v15 get] + 8) = v27;
      uint64_t v28 = [v15 junctionIndexB];
      *(void *)([v15 get] + 24) = v28;
      uint64_t v29 = [v15 junctionB];
      *(void *)([v15 get] + 40) = v29;
      ++v17;
    }
    while (v17 <= v14);

    id v8 = v30;
  }
}

- (void)forEachTransitLinkOnJunction:(const GeoCodecsConnectivityJunction *)a3 visitor:(id)a4
{
  BOOL v6 = (void (**)(id, void *))a4;
  if (a3 && v6)
  {
    id v11 = v6;
    uint64_t v7 = *((void *)self->_vectorTile.__ptr_ + 189);
    id v8 = [(GEOVectorTile *)self transitLinks];
    if (a3->var0)
    {
      unint64_t v9 = 0;
      do
      {
        unint64_t v10 = [v8 objectAtIndex:*(unsigned int *)(v7 + 16 * (v9 + a3->var1) + 4)];
        v11[2](v11, v10);

        ++v9;
      }
      while (v9 < a3->var0);
    }

    BOOL v6 = v11;
  }
}

- (void)forEachJunction:(id)a3
{
  uint64_t v13 = (void (**)(id, void))a3;
  ptr = self->_vectorTile.__ptr_;
  if (*((void *)ptr + 87))
  {
    unint64_t v5 = 0;
    uint64_t v6 = *((void *)ptr + 99);
    uint64_t v7 = *(void **)(v6 + 32);
    uint64_t v8 = *(void *)(v6 + 8) + 8 * *v7;
    uint64_t v9 = *((void *)ptr + 89);
    uint64_t v10 = 4;
    do
    {
      uint64_t v11 = *((void *)ptr + 4);
      uint64_t v12 = (unsigned int *)(v9 + 16 * *(unsigned int *)(*((void *)ptr + 86) + v10));
      v13[2](v13, v8 + 8 * (v7[2 * v12[2] + 2 * *(_DWORD *)(v11 + 168 * v12[1] + 96)] + v12[3]));
      ++v5;
      ptr = self->_vectorTile.__ptr_;
      v10 += 32;
    }
    while (v5 < *((void *)ptr + 87));
  }
}

- (void)forEachJunctionInRoad:(void *)a3 visitor:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (v6)
    {
      ptr = self->_vectorTile.__ptr_;
      uint64_t v8 = *((void *)ptr + 91);
      uint64_t v9 = *((void *)ptr + 99);
      uint64_t v10 = *(uint64_t **)(v9 + 32);
      uint64_t v11 = *(void *)(v9 + 8);
      uint64_t v12 = *v10;
      id v16 = v6;
      geo::codec::multiSectionFeaturePoints(a3, 0, &v17);
      id v6 = v16;
      uint64_t v13 = *((unsigned __int16 *)a3 + 72);
      if (*((_WORD *)a3 + 72))
      {
        uint64_t v14 = v11 + 8 * v12;
        uint64_t v15 = v8 + 8 * *((unsigned int *)a3 + 33);
        do
        {
          (*((void (**)(id, uint64_t))v6 + 2))(v6, v14+ 8* (v10[2 * (*(_DWORD *)(*(void *)v15 + 8) + *((_DWORD *)a3 + 24))]+ *(unsigned int *)(*(void *)v15 + 12)));
          v15 += 8;
          --v13;
          id v6 = v16;
        }
        while (v13);
      }
    }
  }
}

- (unsigned)runningTrackFlags
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 934);
}

- (void)forEachRunningTrack:(id)a3
{
  uint64_t v7 = (void (**)(id, void))a3;
  ptr = self->_vectorTile.__ptr_;
  uint64_t v5 = *((void *)ptr + 468);
  for (uint64_t i = *((void *)ptr + 469); v5 != i; v5 += 128)
    v7[2](v7, v5);
}

- (void)transitSystemInfoForFeatureID:(unint64_t)a3
{
  return (void *)geo::codec::VectorTile::transitSystemInfoForFeatureID((geo::codec::VectorTile *)self->_vectorTile.__ptr_, a3);
}

- (void)transitLineForFeatureID:(unint64_t)a3
{
  ptr = self->_vectorTile.__ptr_;
  uint64_t v4 = (unsigned char *)*((void *)ptr + 161);
  float result = (void *)*((void *)ptr + 160);
  if (v4 == result) {
    return 0;
  }
  unint64_t v6 = (v4 - (unsigned char *)result) / 104;
  if (v6 <= 1) {
    unint64_t v6 = 1;
  }
  while (*((void *)result + 5) != a3)
  {
    float result = (char *)result + 104;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

- (void)transitNodeForFeatureID:(unint64_t)a3
{
  ptr = self->_vectorTile.__ptr_;
  uint64_t v4 = (unsigned char *)*((void *)ptr + 177);
  float result = (void *)*((void *)ptr + 176);
  if (v4 == result) {
    return 0;
  }
  unint64_t v6 = (v4 - (unsigned char *)result) / 344;
  if (v6 <= 1) {
    unint64_t v6 = 1;
  }
  while (*((void *)result + 5) != a3)
  {
    float result = (char *)result + 344;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

- (void)transitAccessPointForFeatureID:(unint64_t)a3
{
  ptr = self->_vectorTile.__ptr_;
  uint64_t v4 = (unsigned char *)*((void *)ptr + 196);
  float result = (void *)*((void *)ptr + 195);
  if (v4 == result) {
    return 0;
  }
  unint64_t v6 = (v4 - (unsigned char *)result) / 248;
  if (v6 <= 1) {
    unint64_t v6 = 1;
  }
  while (*((void *)result + 5) != a3)
  {
    float result = (char *)result + 248;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

- (unsigned)daVinciStyleAttributeRasterCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1420);
}

- (GeoCodecsDaVinciStyleAttributeRaster)daVinciStyleAttributeRasters
{
  return (GeoCodecsDaVinciStyleAttributeRaster *)*((void *)self->_vectorTile.__ptr_ + 354);
}

- (unsigned)daVinciTileVersion
{
  return *((_DWORD *)self->_vectorTile.__ptr_ + 698);
}

- (unsigned)daVinciExternalAssetCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1398);
}

- (unsigned)daVinciExternalMaterialCount
{
  return *((_WORD *)self->_vectorTile.__ptr_ + 1400);
}

- (unint64_t)daVinciExternalAssetIDs
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 351);
}

- (unint64_t)daVinciExternalMaterialIDs
{
  return (unint64_t *)*((void *)self->_vectorTile.__ptr_ + 353);
}

- (GEOVectorTile)initWithVectorTile:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GEOVectorTile;
  uint64_t v4 = [(GEOVectorTile *)&v11 init];
  uint64_t v5 = v4;
  if (v4 && (unint64_t v6 = *(VectorTile **)a3) != 0)
  {
    uint64_t v7 = *((void *)a3 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_vectorTile.__cntrl_;
    v5->_vectorTile.__ptr_ = v6;
    v5->_vectorTile.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)initWithVMP4:localizationData:tileKey:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end