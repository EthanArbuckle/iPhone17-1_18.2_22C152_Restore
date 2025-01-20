uint64_t one-time initialization function for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t result;
  uint64_t v4;
  _OWORD v5[2];
  long long v6;
  long long v7;

  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_11:
    result = outlined destroy of Date?((uint64_t)&v6, &demangling cache variable for type metadata for Any?);
    goto LABEL_12;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_11;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_12:
    v4 = 0x4062C00000000000;
    goto LABEL_13;
  }
  v4 = *(void *)&v5[0];
LABEL_13:
  static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD = v4;
  return result;
}

uint64_t *MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD.unsafeMutableAddressor()
{
  if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1) {
    swift_once();
  }
  return &static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
}

double static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD.getter()
{
  if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1) {
    swift_once();
  }
  return *(double *)&static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
}

void *MOMapLocation.METERS_TO_DEGREES.unsafeMutableAddressor()
{
  return &static MOMapLocation.METERS_TO_DEGREES;
}

double static MOMapLocation.METERS_TO_DEGREES.getter()
{
  return 111000.0;
}

void *MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD.unsafeMutableAddressor()
{
  return &static MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD;
}

double static MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD.getter()
{
  return 0.9;
}

uint64_t key path getter for MOMapLocation.startDate : MOMapLocation(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 192))();
}

uint64_t key path setter for MOMapLocation.startDate : MOMapLocation(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 200))(v5);
}

uint64_t MOMapLocation.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  return MOMapLocation.startDate.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t MOMapLocation.startDate.setter(uint64_t a1)
{
  return MOMapLocation.startDate.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MOMapLocation.startDate.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.startDate@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t key path getter for MOMapLocation.endDate : MOMapLocation(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 216))();
}

uint64_t key path setter for MOMapLocation.endDate : MOMapLocation(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 224))(v5);
}

uint64_t MOMapLocation.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  return MOMapLocation.startDate.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, a1);
}

uint64_t MOMapLocation.startDate.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return outlined init with copy of Date?(v4, a2);
}

uint64_t MOMapLocation.endDate.setter(uint64_t a1)
{
  return MOMapLocation.startDate.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate);
}

uint64_t MOMapLocation.startDate.setter(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  outlined assign with take of Date?(a1, v4);
  return swift_endAccess();
}

uint64_t (*MOMapLocation.endDate.modify())()
{
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.latitude : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 240))();
}

uint64_t key path setter for MOMapLocation.latitude : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 248))(*a1);
}

double MOMapLocation.latitude.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t MOMapLocation.latitude.setter(double a1)
{
  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.latitude.modify())()
{
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.longitude : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 264))();
}

uint64_t key path setter for MOMapLocation.longitude : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 272))(*a1);
}

double MOMapLocation.longitude.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t MOMapLocation.longitude.setter(double a1)
{
  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.longitude.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOPOIAnnotationViewConfiguration.geoMapItem()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.mapItem : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 288))();
  *a2 = result;
  return result;
}

uint64_t key path setter for MOMapLocation.mapItem : MOMapLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 296);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t MOMapLocation.mapItem.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MOMapLocation.mapItem.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MOMapLocation.mapItem.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.clusterCount()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.clusterCount : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.clusterCount : MOMapLocation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)a2 + 320))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t MOMapLocation.clusterCount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t MOMapLocation.clusterCount.setter(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*MOMapLocation.clusterCount.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t key path getter for MOMapLocation.title : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 336))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.title : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 344);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t MOMapLocation.title.getter()
{
  return MOMapLocation.title.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
}

uint64_t MOMapLocation.title.setter(uint64_t a1, uint64_t a2)
{
  return MOMapLocation.title.setter(a1, a2, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
}

uint64_t (*MOMapLocation.title.modify())()
{
  return MOMapLocation.startDate.modify;
}

double variable initialization expression of MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty()
{
  return 0.0;
}

void key path getter for MOMapLocation.confidenceLevel : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 360))();
}

uint64_t key path setter for MOMapLocation.confidenceLevel : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 368))(*a1);
}

double MOMapLocation.confidenceLevel.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t MOMapLocation.confidenceLevel.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.confidenceLevel.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOPOIAnnotationViewConfiguration.isMediumToHighConfidence()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.isWork : MOMapLocation@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 384))();
  *a2 = result & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.isWork : MOMapLocation(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 392))(*a1);
}

uint64_t MOMapLocation.isWork.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  swift_beginAccess();
  return *v1;
}

uint64_t MOMapLocation.isWork.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.isWork.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.userPlaceType()
{
  return -1;
}

uint64_t key path getter for MOMapLocation.userPlaceType : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 408))();
  *a2 = result;
  return result;
}

uint64_t key path setter for MOMapLocation.userPlaceType : MOMapLocation(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 416))(*a1);
}

uint64_t MOMapLocation.userPlaceType.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t MOMapLocation.userPlaceType.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.userPlaceType.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.enclosingArea()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.enclosingArea : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 432))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.enclosingArea : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 440);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t MOMapLocation.enclosingArea.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t MOMapLocation.enclosingArea.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*MOMapLocation.enclosingArea.modify())()
{
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.horizontalUncertainty : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(void **)a1 + 456))();
}

uint64_t key path setter for MOMapLocation.horizontalUncertainty : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(void **)a2 + 464))(*a1);
}

double MOMapLocation.horizontalUncertainty.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t MOMapLocation.horizontalUncertainty.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty);
  uint64_t result = swift_beginAccess();
  double *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.horizontalUncertainty.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t key path getter for MOMapLocation.isScaledDownPOI : MOMapLocation@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 480))();
  *a2 = result & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.isScaledDownPOI : MOMapLocation(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 488))(*a1);
}

uint64_t MOMapLocation.isScaledDownPOI.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  swift_beginAccess();
  return *v1;
}

uint64_t MOMapLocation.isScaledDownPOI.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.isScaledDownPOI.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOSuggestionAssetMapsClusterer.Cluster.title()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.poiCategory : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 504))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.poiCategory : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 512);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t MOMapLocation.poiCategory.getter()
{
  return MOMapLocation.title.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
}

uint64_t MOMapLocation.title.getter(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t MOMapLocation.poiCategory.setter(uint64_t a1, uint64_t a2)
{
  return MOMapLocation.title.setter(a1, a2, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
}

uint64_t MOMapLocation.title.setter(uint64_t a1, uint64_t a2, void *a3)
{
  v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  void *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*MOMapLocation.poiCategory.modify())()
{
  return MOMapLocation.poiCategory.modify;
}

uint64_t MOMapLocation.__allocating_init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  char v24 = a4 & 1;
  uint64_t v25 = swift_allocObject();
  MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(a1, a2, a3, v24, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  return v25;
}

uint64_t MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v21 = v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate;
  uint64_t v22 = type metadata accessor for Date();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v21, 1, 1, v22);
  v23(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, 1, 1, v22);
  char v24 = (void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem);
  *(void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem) = 0;
  uint64_t v25 = v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  *(void *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 8) = 1;
  v26 = (double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel);
  *(void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel) = 0;
  v27 = (unsigned char *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  *(unsigned char *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork) = 0;
  *(void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType) = -1;
  v28 = (void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  void *v28 = 0;
  v28[1] = 0;
  v29 = (double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty);
  *(void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty) = 0;
  v30 = (unsigned char *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  *(unsigned char *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI) = 0;
  v31 = (void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
  void *v31 = 0;
  v31[1] = 0xE000000000000000;
  *(double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude) = a9;
  *(double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude) = a10;
  v32 = (void *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
  void *v32 = a1;
  v32[1] = a2;
  swift_beginAccess();
  *(void *)uint64_t v25 = a3;
  *(unsigned char *)(v25 + 8) = a4 & 1;
  swift_beginAccess();
  *char v24 = a5;
  swift_unknownObjectRelease();
  swift_beginAccess();
  double *v26 = a11;
  swift_beginAccess();
  unsigned char *v27 = a6;
  swift_beginAccess();
  void *v28 = a7;
  v28[1] = a8;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  double *v29 = a12;
  swift_beginAccess();
  unsigned char *v30 = a13;
  swift_beginAccess();
  void *v31 = a14;
  v31[1] = a15;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t MOMapLocation.shiftedIfNecessary.getter()
{
  uint64_t v1 = v0;
  double v2 = (*(double (**)(void))(*(void *)v0 + 240))();
  id v3 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v2 longitude:(*(double (**)(void))(*(void *)v0 + 264))()];
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)v0 + 288);
  uint64_t v5 = v4();
  swift_unknownObjectRelease();
  if (v5) {
    goto LABEL_6;
  }
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v6 = static MOLocationShifter.shared;
  if (((*(uint64_t (**)(id))(*(void *)static MOLocationShifter.shared + 96))(v3) & 1) == 0)
  {
LABEL_6:

    swift_retain();
  }
  else
  {
    uint64_t v7 = (void *)(*(uint64_t (**)(id))(*(void *)v6 + 104))(v3);
    [v7 coordinate];
    double v9 = v8;
    id v10 = [v7 coordinate];
    double v12 = v11;
    uint64_t v13 = (*(uint64_t (**)(id))(*(void *)v1 + 336))(v10);
    uint64_t v26 = v14;
    uint64_t v27 = v13;
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v1 + 312))();
    char v17 = v16 & 1;
    uint64_t v18 = v4();
    double v19 = (*(double (**)(void))(*(void *)v1 + 360))();
    char v20 = (*(uint64_t (**)(void))(*(void *)v1 + 384))();
    uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v1 + 432))();
    uint64_t v23 = v22;
    double v24 = (*(double (**)(void))(*(void *)v1 + 456))();
    type metadata accessor for MOMapLocation();
    uint64_t v1 = swift_allocObject();
    MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(v27, v26, v15, v17, v18, v20 & 1, v21, v23, v9, v12, v19, v24, 0, 0, 0xE000000000000000);
  }
  return v1;
}

uint64_t MOMapLocation.deinit()
{
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, &demangling cache variable for type metadata for Date?);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MOMapLocation.__deallocating_deinit()
{
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, &demangling cache variable for type metadata for Date?);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for MOMapLocation()
{
  uint64_t result = type metadata singleton initialization cache for MOMapLocation;
  if (!type metadata singleton initialization cache for MOMapLocation) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id variable initialization expression of MOLocationShifter.shifter()
{
  id v0 = objc_allocWithZone((Class)GEOLocationShifter);

  return [v0 init];
}

uint64_t variable initialization expression of MOLocationShifter.processingQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v5[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

double variable initialization expression of MOPOIAnnotationViewConfiguration.pinTopOffset()
{
  return 2.0;
}

id variable initialization expression of MOPOIAnnotationView.basePOICircleView()
{
  id v0 = objc_allocWithZone((Class)UIImageView);

  return [v0 init];
}

id variable initialization expression of MOPOIAnnotationView.clusterCountLabel()
{
  id v0 = objc_allocWithZone((Class)UILabel);

  return [v0 init];
}

id variable initialization expression of MOPOIAnnotationView.borderBackgroundView()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

void *variable initialization expression of MOSuggestionAssetMapsClusterer.skipRows()
{
  return &_swiftEmptySetSingleton;
}

void *variable initialization expression of MOSuggestionAssetMapsClusterer.inputClusters()
{
  return &_swiftEmptyArrayStorage;
}

double default argument 1 of MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)()
{
  return 0.5;
}

uint64_t default argument 1 of MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)()
{
  return 1;
}

uint64_t default argument 2 of static MOSuggestionAssetMapsClusterer.clusteredPins(locations:targetRegion:numBuckets:)()
{
  return 5;
}

uint64_t ObjC metadata update function for MOMapLocation()
{
  return type metadata accessor for MOMapLocation();
}

void type metadata completion function for MOMapLocation()
{
  type metadata accessor for Date?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void type metadata accessor for Date?()
{
  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for GEOLocationCoordinate2D(uint64_t a1)
{
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance GEOPOICategory(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance GEOPOICategory(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance GEOPOICategory@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GEOPOICategory()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GEOPOICategory@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GEOPOICategory@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance GEOPOICategory(uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, type metadata accessor for GEOPOICategory);
  uint64_t v3 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, type metadata accessor for GEOPOICategory);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GEOPOICategory(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GEOPOICategory()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GEOPOICategory()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for GEOPOICategory(uint64_t a1)
{
}

void type metadata accessor for GEOLocationCoordinate2D(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t base witness table accessor for RawRepresentable in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, type metadata accessor for GEOPOICategory);
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, type metadata accessor for GEOPOICategory);
}

uint64_t base witness table accessor for Equatable in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, type metadata accessor for GEOPOICategory);
}

void MOSuggestionAssetMapsClusterer.results.setter()
{
}

uint64_t Array.subscript.getter@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  type metadata accessor for Array();
  swift_getWitnessTable();
  RandomAccessCollection<>.indices.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
  if (Range.contains(_:)())
  {
    Array.subscript.getter();
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, v4, 1, a1);
}

uint64_t *MOLocationShifter.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static MOLocationShifter.shared;
}

uint64_t CLLocation.shiftedIfNecessary.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)static MOLocationShifter.shared + 104))(v0);
}

uint64_t one-time initialization function for shared()
{
  type metadata accessor for MOLocationShifter();
  uint64_t v0 = swift_allocObject();
  uint64_t result = MOLocationShifter.init()();
  static MOLocationShifter.shared = v0;
  return result;
}

uint64_t MOLocationShifter.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  MOLocationShifter.init()();
  return v0;
}

uint64_t static MOLocationShifter.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }

  return swift_retain();
}

Swift::Bool __swiftcall MOLocationShifter.shiftNeeded(_:)(CLLocation a1)
{
  Class isa = a1.super.isa;
  [(objc_class *)a1.super.isa coordinate];
  double v3 = v2;
  [(objc_class *)isa coordinate];
  return [self isLocationShiftRequiredForCoordinate:v3 v4];
}

CLLocation __swiftcall MOLocationShifter.shiftedIfNecessary(_:)(CLLocation a1)
{
  Class isa = a1.super.isa;
  uint64_t v1 = type metadata accessor for DispatchTime();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v74 - v6;
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  [(objc_class *)isa coordinate];
  double v13 = v12;
  [(objc_class *)isa coordinate];
  double v15 = v14;
  if (objc_msgSend(self, "isLocationShiftRequiredForCoordinate:", v13, v14))
  {
    v79 = v7;
    uint64_t v80 = v2;
    uint64_t v81 = v1;
    uint64_t v16 = swift_allocObject();
    *(double *)(v16 + 16) = v13;
    *(double *)(v16 + 24) = v15;
    uint64_t v17 = swift_allocObject();
    [(objc_class *)isa horizontalAccuracy];
    *(void *)(v17 + 16) = v18;
    double v19 = *(void **)(v84 + 16);
    [(objc_class *)isa horizontalAccuracy];
    uint64_t v82 = v17 + 16;
    uint64_t v83 = v16 + 16;
    if (objc_msgSend(v19, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", v16 + 16, v17 + 16, v13, v15, v20))
    {
      double v21 = *(double *)(v16 + 16);
      double v22 = *(double *)(v16 + 24);
      [(objc_class *)isa altitude];
      double v24 = v23;
      double v25 = *(double *)(v17 + 16);
      [(objc_class *)isa verticalAccuracy];
      double v27 = v26;
      id v28 = [(objc_class *)isa timestamp];
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      id v29 = objc_allocWithZone((Class)CLLocation);
      Class v30 = Date._bridgeToObjectiveC()().super.isa;
      v31 = [v29 initWithCoordinate:v30 altitude:v21 horizontalAccuracy:v22 verticalAccuracy:v24 timestamp:v25];

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      swift_release();
      swift_release();
    }
    else
    {
      v76 = v11;
      uint64_t v77 = v9;
      uint64_t v78 = v8;
      v35 = dispatch_group_create();
      dispatch_group_enter(v35);
      [(objc_class *)isa horizontalAccuracy];
      double v37 = v36;
      v38 = (void *)swift_allocObject();
      v38[2] = v16;
      v38[3] = v17;
      v38[4] = v35;
      v90 = partial apply for closure #1 in MOLocationShifter.shiftedIfNecessary(_:);
      v91 = v38;
      aBlock = _NSConcreteStackBlock;
      uint64_t v87 = 1107296256;
      uint64_t v39 = v17;
      v88 = thunk for @escaping @callee_guaranteed (@unowned GEOLocationCoordinate2D, @unowned Double) -> ();
      v89 = &block_descriptor;
      v40 = _Block_copy(&aBlock);
      uint64_t v75 = v16;
      swift_retain();
      uint64_t v74 = v39;
      swift_retain();
      v41 = v35;
      swift_release();
      v90 = closure #2 in MOLocationShifter.shiftedIfNecessary(_:);
      v91 = 0;
      aBlock = _NSConcreteStackBlock;
      uint64_t v87 = 1107296256;
      v88 = thunk for @escaping @callee_guaranteed () -> ();
      v89 = &block_descriptor_9;
      v42 = _Block_copy(&aBlock);
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = v41;
      v90 = partial apply for closure #3 in MOLocationShifter.shiftedIfNecessary(_:);
      v91 = (void *)v43;
      aBlock = _NSConcreteStackBlock;
      uint64_t v87 = 1107296256;
      v88 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
      v89 = &block_descriptor_15;
      v44 = _Block_copy(&aBlock);
      v45 = v41;
      swift_release();
      [v19 shiftCoordinate:v40 accuracy:v42 withCompletionHandler:v44 mustGoToNetworkCallback:v13 errorHandler:v15 callbackQueue:v37];
      _Block_release(v44);
      _Block_release(v42);
      _Block_release(v40);
      static DispatchTime.now()();
      v46 = v79;
      + infix(_:_:)();
      uint64_t v47 = v81;
      v48 = *(void (**)(char *, uint64_t))(v80 + 8);
      v48(v5, v81);
      OS_dispatch_group.wait(timeout:)();
      v48(v46, v47);
      if ((static DispatchTimeoutResult.== infix(_:_:)() & 1) == 0)
      {
        if (one-time initialization token for assets != -1) {
          swift_once();
        }
        uint64_t v49 = type metadata accessor for Logger();
        __swift_project_value_buffer(v49, (uint64_t)static MOAngelLogger.assets);
        v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_0, v50, v51, "[LocationShifter] Timed out", v52, 2u);
          swift_slowDealloc();
        }
      }
      if (one-time initialization token for assets != -1) {
        swift_once();
      }
      uint64_t v53 = type metadata accessor for Logger();
      __swift_project_value_buffer(v53, (uint64_t)static MOAngelLogger.assets);
      v54 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.default.getter();
      BOOL v56 = os_log_type_enabled(v54, v55);
      uint64_t v57 = v78;
      uint64_t v58 = v77;
      v59 = v76;
      uint64_t v60 = v75;
      uint64_t v61 = v74;
      if (v56)
      {
        v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_0, v54, v55, "[LocationShifter] Returning shifted location", v62, 2u);
        swift_slowDealloc();
      }

      swift_beginAccess();
      double v63 = *(double *)(v60 + 16);
      double v64 = *(double *)(v60 + 24);
      [(objc_class *)isa altitude];
      double v66 = v65;
      swift_beginAccess();
      double v67 = *(double *)(v61 + 16);
      [(objc_class *)isa verticalAccuracy];
      double v69 = v68;
      id v70 = [(objc_class *)isa timestamp];
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      id v71 = objc_allocWithZone((Class)CLLocation);
      Class v72 = Date._bridgeToObjectiveC()().super.isa;
      v31 = [v71 initWithCoordinate:v72 altitude:v63 horizontalAccuracy:v64 verticalAccuracy:v66 timestamp:v67];

      (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v57);
      swift_release();
      swift_release();
    }
    v34 = v31;
  }
  else
  {
    Class v33 = isa;
    v34 = v33;
  }
  result._internal = v32;
  result.super.Class isa = v34;
  return result;
}

void closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1, uint64_t a2, NSObject *a3, double a4, double a5, double a6)
{
  if (one-time initialization token for assets != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static MOAngelLogger.assets);
  double v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    double v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "[LocationShifter] Shifted location async", v15, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
  swift_beginAccess();
  *(double *)(a2 + 16) = a6;
  dispatch_group_leave(a3);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned GEOLocationCoordinate2D, @unowned Double) -> ()(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v7 = *(void (**)(uint64_t, double, double, double))(a1 + 32);
  uint64_t v8 = swift_retain();
  v7(v8, a2, a3, a4);

  return swift_release();
}

void closure #2 in MOLocationShifter.shiftedIfNecessary(_:)()
{
  if (one-time initialization token for assets != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static MOAngelLogger.assets);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "[LocationShifter] Needs to download shifting function", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1, dispatch_group_t group)
{
  if (a1)
  {
    swift_errorRetain();
    if (one-time initialization token for assets != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static MOAngelLogger.assets);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_getErrorValue();
      uint64_t v7 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v9);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v4, v5, "[LocationShifter] error: %s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  dispatch_group_leave(group);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

__C::CLLocationCoordinate2D __swiftcall MOLocationShifter.shiftedIfNecessary(_:)(__C::CLLocationCoordinate2D a1)
{
  id v2 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:a1.latitude longitude:a1.longitude];
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(*(void *)v1 + 104))();
  [v3 coordinate];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

uint64_t MOLocationShifter.deinit()
{
  return v0;
}

uint64_t MOLocationShifter.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t MOLocationShifter.init()()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  double v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)GEOLocationShifter) init];
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v6[1] = &_swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  return v0;
}

uint64_t sub_8790()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_87A0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_87B0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void partial apply for closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(double a1, double a2, double a3)
{
  closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(*(void *)(v3 + 16), *(void *)(v3 + 24), *(NSObject **)(v3 + 32), a1, a2, a3);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_881C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1)
{
  closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(a1, *(dispatch_group_t *)(v1 + 16));
}

uint64_t CLLocationCoordinate2D.shiftedIfNecessary.getter(double a1, double a2)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(double, double))(*(void *)static MOLocationShifter.shared + 112))(a1, a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

uint64_t type metadata accessor for MOLocationShifter()
{
  return self;
}

BOOL static MOSuggestionAssetTransferDelivery.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void MOSuggestionAssetTransferDelivery.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int MOSuggestionAssetTransferDelivery.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetTransferDelivery(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetTransferDelivery()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetTransferDelivery()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetTransferDelivery()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t MOSuggestionAssetTileSize.description.getter(unsigned __int8 a1)
{
  int v1 = a1 - 2;
  unint64_t result = 0xD000000000000011;
  switch(v1)
  {
    case 0:
      unint64_t result = 0x4C4C414D53;
      break;
    case 1:
      unint64_t result = 1414744396;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x454752414CLL;
      break;
    case 4:
      unint64_t result = 0x414C5F4152545845;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0x455243534C4C5546;
      break;
    case 7:
    case 8:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x524546534E415254;
      break;
  }
  return result;
}

Swift::Bool __swiftcall MOSuggestionAssetTileSize.isHighestQualityForTransfer()()
{
  return v0 - 11 < 0xFFFFFFF7;
}

Swift::Bool __swiftcall MOSuggestionAssetTileSize.isHighestQualityForTransfer3P()()
{
  return (v0 - 11 < 0xFFFFFFF7) & v0;
}

void MOSuggestionAssetTileSize.hash(into:)(uint64_t a1, char a2)
{
  if ((a2 - 2) >= 9u)
  {
    Hasher._combine(_:)(7uLL);
    Swift::UInt v2 = a2 & 1;
  }
  else
  {
    Swift::UInt v2 = qword_1D238[(char)(a2 - 2)];
  }
  Hasher._combine(_:)(v2);
}

Swift::Int MOSuggestionAssetTileSize.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetTileSize()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetTileSize(uint64_t a1)
{
  MOSuggestionAssetTileSize.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetTileSize()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v3, v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetTileSize(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized static MOSuggestionAssetTileSize.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t one-time initialization function for tileSizesByCount()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D090;
  *(void *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  *(void *)(inited + 40) = static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid;
  *(void *)(inited + 48) = 2;
  uint64_t v1 = one-time initialization token for twoAssetsGrid;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(inited + 56) = static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid;
  *(void *)(inited + 64) = 3;
  uint64_t v2 = one-time initialization token for threeAssetsGrid;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(inited + 72) = static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid;
  *(void *)(inited + 80) = 4;
  uint64_t v3 = one-time initialization token for fourAssetsGrid;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(inited + 88) = static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid;
  *(void *)(inited + 96) = 5;
  uint64_t v4 = one-time initialization token for fiveAssetsGrid;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  *(void *)(inited + 104) = static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid;
  *(void *)(inited + 112) = 6;
  uint64_t v5 = one-time initialization token for sixAssetsGrid;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  *(void *)(inited + 120) = static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid;
  *(void *)(inited + 128) = 7;
  uint64_t v6 = one-time initialization token for sevenAssetsGrid;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  *(void *)(inited + 136) = static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid;
  *(void *)(inited + 144) = 8;
  uint64_t v7 = one-time initialization token for eightAssetsGrid;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)(inited + 152) = static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid;
  *(void *)(inited + 160) = 9;
  uint64_t v8 = one-time initialization token for nineAssetsGrid;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  *(void *)(inited + 168) = static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid;
  *(void *)(inited + 176) = 10;
  uint64_t v9 = one-time initialization token for tenAssetsGrid;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  *(void *)(inited + 184) = static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid;
  *(void *)(inited + 192) = 11;
  uint64_t v10 = one-time initialization token for elevenAssetsGrid;
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  *(void *)(inited + 200) = static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid;
  *(void *)(inited + 208) = 12;
  uint64_t v11 = one-time initialization token for twelveAssetsGrid;
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  *(void *)(inited + 216) = static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid;
  *(void *)(inited + 224) = 13;
  uint64_t v12 = one-time initialization token for thirteenAssetsGrid;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  *(void *)(inited + 232) = static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid;
  unint64_t v13 = specialized Dictionary.init(dictionaryLiteral:)((void *)inited);
  swift_setDeallocating();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  uint64_t result = swift_arrayDestroy();
  static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount = v13;
  return result;
}

{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D0A0;
  *(void *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  *(void *)(inited + 40) = static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid;
  *(void *)(inited + 48) = 2;
  uint64_t v1 = one-time initialization token for twoAssetsGrid;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(inited + 56) = static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid;
  *(void *)(inited + 64) = 3;
  uint64_t v2 = one-time initialization token for threeAssetsGrid;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(inited + 72) = static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid;
  *(void *)(inited + 80) = 4;
  uint64_t v3 = one-time initialization token for fourAssetsGrid;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(inited + 88) = static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid;
  uint64_t v4 = specialized Dictionary.init(dictionaryLiteral:)((void *)inited);
  swift_setDeallocating();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  uint64_t result = swift_arrayDestroy();
  static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount = v4;
  return result;
}

{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D0B0;
  *(void *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  *(void *)(inited + 40) = static MOSuggestionLayoutEngine.oneAssetsGrid;
  uint64_t v1 = specialized Dictionary.init(dictionaryLiteral:)((void *)inited);
  swift_setDeallocating();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  uint64_t result = swift_arrayDestroy();
  static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount = v1;
  return result;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twoAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for threeAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fourAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fiveAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for sixAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for sevenAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for eightAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for nineAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for tenAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for elevenAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twelveAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for thirteenAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount);
}

void one-time initialization function for oneAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for oneAssetsGrid);
}

void one-time initialization function for twoAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twoAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twoAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twoAssetsGrid);
}

void one-time initialization function for threeAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for threeAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for threeAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for threeAssetsGrid);
}

void one-time initialization function for fourAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fourAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fourAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fourAssetsGrid);
}

void one-time initialization function for fiveAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fiveAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fiveAssetsGrid);
}

void one-time initialization function for sixAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for sixAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for sixAssetsGrid);
}

void one-time initialization function for sevenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for sevenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for sevenAssetsGrid);
}

void one-time initialization function for eightAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for eightAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for eightAssetsGrid);
}

void one-time initialization function for nineAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for nineAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for nineAssetsGrid);
}

void one-time initialization function for tenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for tenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tenAssetsGrid);
}

void one-time initialization function for elevenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for elevenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for elevenAssetsGrid);
}

void one-time initialization function for twelveAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twelveAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twelveAssetsGrid);
}

void one-time initialization function for thirteenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for thirteenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for thirteenAssetsGrid);
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twoAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for threeAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fourAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for oneAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twoAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for threeAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fourAssetsGrid);
}

uint64_t MOSuggestionLayoutEngine.deinit()
{
  return v0;
}

uint64_t MOSuggestionLayoutEngine.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t MOSuggestionLayoutEngine.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t *MOSuggestionLayoutEngine.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1) {
    swift_once();
  }
  return &static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount);
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t static MOSuggestionLayoutEngine.oneAssetsGrid.getter()
{
  if (one-time initialization token for oneAssetsGrid != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

double static MOSuggestionLayoutEngine.viewportFromTileSize(_:)(char a1)
{
  if ((a1 - 2) > 8u) {
    return 300.0;
  }
  else {
    return dbl_1D280[(char)(a1 - 2)];
  }
}

double static MOSuggestionLayoutEngine.heightToWidthRatio(_:)(char a1)
{
  double result = 1.0;
  if ((a1 - 2) <= 8u) {
    return dbl_1D2C8[(char)(a1 - 2)] / dbl_1D280[(char)(a1 - 2)];
  }
  return result;
}

double static MOSuggestionLayoutEngine.widthToHeightRatio(_:)(char a1)
{
  double v1 = 1.0;
  if ((a1 - 2) <= 8u) {
    double v1 = dbl_1D2C8[(char)(a1 - 2)] / dbl_1D280[(char)(a1 - 2)];
  }
  return 1.0 / v1;
}

BOOL specialized static MOSuggestionAssetTileSize.__derived_enum_equals(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  switch(a1)
  {
    case 2u:
      if (a2 != 2) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 3u:
      if (a2 != 3) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 4u:
      if (a2 != 4) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 5u:
      if (a2 != 5) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 6u:
      if (a2 != 6) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 7u:
      if (a2 != 7) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 8u:
      if (a2 != 8) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 9u:
      if (a2 != 9) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    case 0xAu:
      if (a2 != 10) {
        goto LABEL_21;
      }
      BOOL result = 1;
      break;
    default:
      if (a2 - 2 >= 9) {
        BOOL result = ((a2 ^ a1) & 1) == 0;
      }
      else {
LABEL_21:
      }
        BOOL result = 0;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery()
{
  unint64_t result = lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize()
{
  unint64_t result = lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetTransferDelivery(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MOSuggestionAssetTransferDelivery(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0xA360);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for MOSuggestionAssetTransferDelivery(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for MOSuggestionAssetTransferDelivery(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MOSuggestionAssetTransferDelivery()
{
  return &type metadata for MOSuggestionAssetTransferDelivery;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetTileSize(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF6)
  {
    unsigned int v2 = a2 + 10;
    if (a2 + 10 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 10;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 10;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0xA45CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 10;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 2) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 0xA) {
    return v8 - 9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for MOSuggestionAssetTileSize(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 10;
  if (a3 + 10 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xF6) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v7 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0xA544);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for MOSuggestionAssetTileSize(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *destructiveInjectEnumTag for MOSuggestionAssetTileSize(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for MOSuggestionAssetTileSize()
{
  return &type metadata for MOSuggestionAssetTileSize;
}

uint64_t type metadata accessor for MOSuggestionLayoutEngine()
{
  return self;
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.FullWidth()
{
  return &type metadata for MOSuggestionLayoutEngine.FullWidth;
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.HalfWidth()
{
  return &type metadata for MOSuggestionLayoutEngine.HalfWidth;
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.FullWidthCondensed()
{
  return &type metadata for MOSuggestionLayoutEngine.FullWidthCondensed;
}

double MOAngelDefaultsManager.momentsUILowConfidenceHighCertaintyThreshold.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 150.0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(double *)v4;
  }
  return 150.0;
}

void one-time initialization function for defaults(uint64_t a1)
{
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void one-time initialization function for siri(uint64_t a1)
{
}

void one-time initialization function for defaults(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithSuiteName:v6];

  *a4 = v7;
}

uint64_t MOAngelDefaultsManager.momentsUIShouldUpLevelPOI.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v4[0]);
  }
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUIShouldSkipDendrogram.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v4[0]);
  }
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUIForceEmbeddedPOI.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v4[0]);
  }
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUITripDropUninterestingPOI.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v4[0]);
  }
  return 0;
}

double MOAngelDefaultsManager.momentsUIDendrogramPOIPenalty.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0.5;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(double *)v4;
  }
  return 0.5;
}

uint64_t MOAngelDefaultsManager.momentsUIGridBuckets.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_14:
    outlined destroy of Any?((uint64_t)&v6);
    return 5;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_14;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return 5;
  }
  double v4 = round(*(double *)v5);
  if ((~*(void *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18) {
        return (uint64_t)v4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t MOAngelDefaultsManager.momentsUIClusterMaxCount.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_14:
    outlined destroy of Any?((uint64_t)&v6);
    return 30;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_14;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return 30;
  }
  double v4 = round(*(double *)v5);
  if ((~*(void *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18) {
        return (uint64_t)v4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

double MOAngelDefaultsManager.momentsUITightPOIScale.getter()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0.5;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(double *)v4;
  }
  return 0.5;
}

void *MOAngelDefaultsManager.siriCanLearnFromAppDenySet.getter()
{
  if (one-time initialization token for siri != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.siri;
  if (!static MOAngelDefaultsManager.siri)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_12:
    outlined destroy of Any?((uint64_t)&v7);
    return &_swiftEmptySetSingleton;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  outlined init with take of Any?((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Swift.AnyObject]);
  if ((swift_dynamicCast() & 1) == 0) {
    return &_swiftEmptySetSingleton;
  }
  unsigned int v3 = specialized _arrayConditionalCast<A, B>(_:)(*(unint64_t *)&v6[0]);
  swift_bridgeObjectRelease();
  if (!v3) {
    return &_swiftEmptySetSingleton;
  }
  uint64_t v4 = specialized Set.init<A>(_:)((uint64_t)v3);
  swift_bridgeObjectRelease();
  return (void *)v4;
}

void *specialized _arrayConditionalCast<A, B>(_:)(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  uint64_t v4 = _swiftEmptyArrayStorage;
  if (!v2)
  {
    unint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v2) {
      return v4;
    }
LABEL_7:
    for (uint64_t i = 4; ; ++i)
    {
      uint64_t v6 = i - 4;
      if ((a1 & 0xC000000000000001) != 0)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v7 = i - 3;
        if (__OFADD__(v6, 1)) {
          goto LABEL_22;
        }
      }
      else
      {
        swift_unknownObjectRetain();
        uint64_t v7 = i - 3;
        if (__OFADD__(v6, 1))
        {
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
      }
      if (!swift_dynamicCast())
      {
        swift_release();
        swift_bridgeObjectRelease();
        return 0;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, _swiftEmptyArrayStorage[2] + 1, 1);
        uint64_t v4 = _swiftEmptyArrayStorage;
      }
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
        uint64_t v4 = _swiftEmptyArrayStorage;
      }
      _swiftEmptyArrayStorage[2] = v9 + 1;
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage[2 * v9];
      *((void *)v10 + 4) = v12;
      *((void *)v10 + 5) = v13;
      if (v7 == v2) {
        return v4;
      }
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v2) {
    goto LABEL_7;
  }
  return v4;
}

uint64_t specialized static MOAngelDefaultsManager.doubleValueFor(_:)()
{
  if (one-time initialization token for defaults != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_12:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_12;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v4[0];
  }
  else {
    return 0;
  }
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MOAngelDefaultsManager()
{
  return &type metadata for MOAngelDefaultsManager;
}

uint64_t MOAngelLogger.assets.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.assets);
}

uint64_t one-time initialization function for shared(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.shared);
}

uint64_t MOAngelLogger.shared.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for shared, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.shared);
}

uint64_t static MOAngelLogger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for shared, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.shared, a1);
}

uint64_t one-time initialization function for assets(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.assets);
}

uint64_t static MOAngelLogger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for assets, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.assets, a1);
}

uint64_t one-time initialization function for ranking(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.ranking);
}

uint64_t MOAngelLogger.ranking.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for ranking, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.ranking);
}

uint64_t static MOAngelLogger.ranking.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for ranking, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.ranking, a1);
}

uint64_t one-time initialization function for memory(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.memory);
}

uint64_t MOAngelLogger.memory.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for memory, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.memory);
}

uint64_t static MOAngelLogger.memory.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for memory, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.memory, a1);
}

uint64_t one-time initialization function for sheetController(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.sheetController);
}

uint64_t MOAngelLogger.sheetController.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for sheetController, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.sheetController);
}

uint64_t static MOAngelLogger.sheetController.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for sheetController, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.sheetController, a1);
}

uint64_t one-time initialization function for filtering(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.filtering);
}

uint64_t one-time initialization function for shared(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t MOAngelLogger.filtering.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for filtering, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.filtering);
}

uint64_t static MOAngelLogger.filtering.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for filtering, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.filtering, a1);
}

uint64_t one-time initialization function for assets()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v4, static MOAngelSignposter.assets);
  __swift_project_value_buffer(v4, (uint64_t)static MOAngelSignposter.assets);
  if (one-time initialization token for assets != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)static MOAngelLogger.assets);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)();
}

uint64_t MOAngelSignposter.assets.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static MOAngelSignposter.assets);
}

uint64_t MOAngelLogger.assets.unsafeMutableAddressor(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return __swift_project_value_buffer(v5, a3);
}

uint64_t static MOAngelSignposter.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for assets, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static MOAngelSignposter.assets, a1);
}

uint64_t static MOAngelLogger.shared.getter@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t type metadata accessor for MOAngelLogger()
{
  return self;
}

uint64_t type metadata accessor for MOAngelSignposter()
{
  return self;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t MOPOIAnnotationViewConfiguration.geoMapItem.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MOPOIAnnotationViewConfiguration.geoMapItem.setter(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.geoMapItem.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.tileSize.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t MOPOIAnnotationViewConfiguration.tileSize.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.tileSize.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isWork.getter()
{
  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t MOPOIAnnotationViewConfiguration.isWork.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 9) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isWork.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.numLocations.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t MOPOIAnnotationViewConfiguration.numLocations.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.numLocations.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.forceCircle.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t MOPOIAnnotationViewConfiguration.forceCircle.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.forceCircle.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isScaledDownPOI.getter()
{
  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t MOPOIAnnotationViewConfiguration.isScaledDownPOI.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 26) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isScaledDownPOI.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.shouldUseCityIcon.getter()
{
  return *(unsigned __int8 *)(v0 + 27);
}

uint64_t MOPOIAnnotationViewConfiguration.shouldUseCityIcon.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 27) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.shouldUseCityIcon.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

int *one-time initialization function for singlePinCanvasSize()
{
  uint64_t result = (int *)specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for singlePinCanvasSize);
  static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0] = result;
  return result;
}

int *one-time initialization function for multiPinCanvasSize()
{
  uint64_t result = (int *)specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for multiPinCanvasSize);
  static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0] = result;
  return result;
}

BOOL MOPOIAnnotationViewConfiguration.shouldAddWhiteCircularBorder.getter()
{
  return *(void *)(v0 + 16) > 1;
}

uint64_t MOPOIAnnotationViewConfiguration.pinSize.getter()
{
  uint64_t v1 = v0;
  if (*(uint64_t *)(v0 + 16) > 1 || (*(unsigned char *)(v0 + 24) & 1) != 0)
  {
    if (one-time initialization token for multiPinCanvasSize != -1) {
      swift_once();
    }
    uint64_t v2 = static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0];
    if (!*(void *)((char *)static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0] + (unint64_t)&dword_10)) {
      goto LABEL_13;
    }
  }
  else
  {
    if (one-time initialization token for singlePinCanvasSize != -1) {
      swift_once();
    }
    uint64_t v2 = static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0];
    if (!*(void *)((char *)static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0]
                    + (unint64_t)&dword_10))
      goto LABEL_13;
  }
  unint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)(*(unsigned char *)(v1 + 8));
  if ((v4 & 1) == 0)
  {
LABEL_13:
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  uint64_t result = *(uint64_t *)(*(void *)&stru_20.segname[(void)v2 + 16] + 8 * v3);
  if (*(unsigned char *)(v1 + 26))
  {
    double v6 = *(double *)&result;
    double v7 = COERCE_DOUBLE(specialized static MOAngelDefaultsManager.doubleValueFor(_:)());
    if (v8) {
      double v7 = 0.5;
    }
    *(double *)&uint64_t result = v7 * v6;
  }
  return result;
}

uint64_t MOPOIAnnotationViewConfiguration.shouldAddPointedArrow.getter()
{
  if (*(uint64_t *)(v0 + 16) > 1 || (*(unsigned char *)(v0 + 24) & 1) != 0) {
    return 0;
  }
  if (*(unsigned char *)(v0 + 27)) {
    return *(unsigned __int8 *)(v0 + 9);
  }
  return 1;
}

void MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter()
{
  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v1 & 1) == 0)
  {
    outlined init with take of MOSuggestionAssetTileSize((unsigned char *)(v0 + 8), &v2);
    outlined init with take of MOSuggestionAssetTileSize(&v2, &v3);
    MOSuggestionLayoutEngine.HalfWidth.init()();
  }
}

void MOPOIAnnotationViewConfiguration.downArrowFrame.getter()
{
  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0) {
    MOSuggestionLayoutEngine.HalfWidth.init()();
  }
}

void MOPOIAnnotationViewConfiguration.downArrowListTileFrame.getter()
{
  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0) {
    MOSuggestionLayoutEngine.HalfWidth.init()();
  }
}

void MOPOIAnnotationViewConfiguration.whiteCircularBorderFrame.getter()
{
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();

  MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.whiteCircularBorderCLusterFrame.getter()
{
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();

  MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.containerViewFrame.getter()
{
  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0) {
    MOSuggestionLayoutEngine.HalfWidth.init()();
  }
}

unsigned char *MOPOIAnnotationViewConfiguration.clusterFontSize.getter()
{
  uint64_t result = (unsigned char *)MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v2 & 1) == 0)
  {
    outlined init with take of MOSuggestionAssetTileSize((unsigned char *)(v0 + 8), &v3);
    return outlined init with take of MOSuggestionAssetTileSize(&v3, &v4);
  }
  return result;
}

uint64_t static MOPOIAnnotationViewConfiguration.filterGenericRed(category:)(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  if (v1 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v3 == v4)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

uint64_t static MOPOIAnnotationViewConfiguration.hasPOIIconImage(_:)(void *a1)
{
  id v2 = [a1 _poiCategory];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
    if (v4 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v6 == v7)
    {

      swift_bridgeObjectRelease_n();
      return 0;
    }
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if (v9) {
      return result;
    }
  }
  uint64_t v11 = self;
  id v12 = [a1 _styleAttributes];
  uint64_t v13 = self;
  id v14 = [v13 mainScreen];
  [v14 scale];
  double v16 = v15;

  id v17 = [v11 newFillColorForStyleAttributes:v12 forScale:v16];
  id v18 = v11;
  if (v17)
  {
    double v19 = v18;
    id v20 = [a1 _styleAttributes];
    id v21 = [v13 mainScreen];
    [v21 scale];
    double v23 = v22;

    id v24 = [v19 imageForStyle:v20 size:3 forScale:0 format:v23];
    if (v24)
    {

      return 1;
    }
  }
  return 0;
}

uint64_t MOPOIAnnotationViewConfiguration.init(geoMapItem:tileSize:isWork:numLocations:forceCircle:isMediumToHighConfidence:isScaledDownPOI:shouldUseCityIcon:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(unsigned char *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 9) = a3;
  *(void *)(a9 + 16) = a4;
  *(unsigned char *)(a9 + 24) = a5;
  *(unsigned char *)(a9 + 25) = a6;
  *(unsigned char *)(a9 + 26) = a7;
  *(unsigned char *)(a9 + 27) = a8;
  *(void *)(a9 + 32) = 0x4000000000000000;
  return result;
}

void one-time initialization function for cityStyleAttributes()
{
  id v0 = [objc_allocWithZone((Class)GEOPlace) initWithLatitude:4 longitude:0.0 placeType:0.0];
  id v1 = [self styleAttributesForPlace:v0];

  static MOPOIAnnotationView.cityStyleAttributes = (uint64_t)v1;
}

uint64_t *MOPOIAnnotationView.cityStyleAttributes.unsafeMutableAddressor()
{
  if (one-time initialization token for cityStyleAttributes != -1) {
    swift_once();
  }
  return &static MOPOIAnnotationView.cityStyleAttributes;
}

uint64_t static MOPOIAnnotationView.cityStyleAttributes.getter()
{
  if (one-time initialization token for cityStyleAttributes != -1) {
    swift_once();
  }
  uint64_t v0 = static MOPOIAnnotationView.cityStyleAttributes;
  id v1 = (id)static MOPOIAnnotationView.cityStyleAttributes;
  return v0;
}

id MOPOIAnnotationView.__allocating_init(annotation:configuration:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = specialized MOPOIAnnotationView.init(annotation:configuration:)(a1, a2);
  outlined release of MOPOIAnnotationViewConfiguration(a2);
  swift_unknownObjectRelease();
  return v6;
}

id MOPOIAnnotationView.init(annotation:configuration:)(uint64_t a1, uint64_t a2)
{
  id v3 = specialized MOPOIAnnotationView.init(annotation:configuration:)(a1, a2);
  outlined release of MOPOIAnnotationViewConfiguration(a2);
  swift_unknownObjectRelease();
  return v3;
}

void closure #1 in MOPOIAnnotationView.init(annotation:configuration:)()
{
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (uint64_t *)&Strong[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
    id v2 = Strong;
    MOPOIAnnotationViewConfiguration.pinSize.getter();
    double v3 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    if ((v7 & 1) == 0) {
      MOSuggestionLayoutEngine.HalfWidth.init()();
    }
    [v2 setFrame:v3, v4, v5, v6];

    char v8 = &v2[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
    id v9 = *(id *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
    MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
    [v9 setFrame:];

    MOPOIAnnotationView.setupPOIAndColors()();
    if (v1[2] < 2)
    {
      if (v1[3])
      {
        specialized MOPOIAnnotationView.setupBorderBackground(cluster:)();
        uint64_t v10 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
      }
      else
      {
        if (*((unsigned char *)v1 + 27) == 1 && !*((unsigned char *)v1 + 9)) {
          goto LABEL_12;
        }
        MOPOIAnnotationView.setupDownArrow()();
        uint64_t v10 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
      }
      [v2 addSubview:*(void *)&v2[v10]];
    }
    else
    {
      specialized MOPOIAnnotationView.setupBorderBackground(cluster:)();
      MOPOIAnnotationView.setupClusterlabel()();
      [v2 addSubview:*(void *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView]];
      char v8 = &v2[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel];
    }
LABEL_12:
    [v2 addSubview:*(void *)v8];
    uint64_t v11 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
    id v12 = [*(id *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView] layer];
    id v13 = [self secondarySystemBackgroundColor];
    id v14 = [v13 CGColor];

    [v12 setShadowColor:v14];
    id v15 = [*(id *)&v2[v11] layer];
    LODWORD(v16) = 0.5;
    [v15 setShadowOpacity:v16];

    id v17 = [*(id *)&v2[v11] layer];
    [v17 setShadowRadius:5.0];

    id v18 = [*(id *)&v2[v11] layer];
    [v18 setShadowPathIsBounds:1];
  }
}

void MOPOIAnnotationView.setupDownArrow()()
{
  if (*(uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16) > 1
    || *(unsigned char *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 24) != 0
    || (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 27) ^ 1 | *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 9)) == 0)
  {
    return;
  }
  double v3 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 8) == 3)
  {
    MOPOIAnnotationViewConfiguration.pinSize.getter();
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if ((v8 & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    MOPOIAnnotationViewConfiguration.pinSize.getter();
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if ((v9 & 1) == 0) {
LABEL_14:
    }
      MOSuggestionLayoutEngine.HalfWidth.init()();
  }
  [v3 setFrame:v4, v5, v6, v7];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [self systemImageNamed:v10];

  [v3 setImage:v11];

  [v3 setContentMode:2];
}

void MOPOIAnnotationView.setupClusterlabel()()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16);
  if (v2 >= 2)
  {
    double v3 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel);
    int v4 = *((unsigned __int8 *)v1 + 8);
    uint64_t v13 = *v1;
    LOWORD(v14) = *((_WORD *)v1 + 4);
    uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16);
    LOWORD(v16) = *((_WORD *)v1 + 12);
    BYTE2(v16) = *((unsigned char *)v1 + 26);
    BYTE3(v16) = *((unsigned char *)v1 + 27);
    uint64_t v17 = v1[4];
    MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
    [v3 setFrame:];
    uint64_t v12 = v2;
    dispatch thunk of CustomStringConvertible.description.getter();
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v3 setText:v5, v12, v13, v14, v15, v16, v17];

    [v3 setTextAlignment:1];
    id v6 = [self whiteColor];
    [v3 setTextColor:v6];

    double v7 = COERCE_DOUBLE(MOPOIAnnotationViewConfiguration.pinSize.getter());
    double v8 = 15.0;
    if ((v9 & 1) == 0)
    {
      if (v4 == 3) {
        double v8 = v7 * 0.5;
      }
      else {
        double v8 = v7 / 6.0;
      }
    }
    id v10 = [self boldSystemFontOfSize:v8];
    [v3 setFont:v10];

    [v3 setAdjustsFontSizeToFitWidth:1];
    [v3 setClipsToBounds:1];
    id v11 = [v3 layer];
    [v3 frame];
    [v11 setCornerRadius:CGRectGetWidth(v18) * 0.5];
  }
}

void MOPOIAnnotationView.setupPOIAndColors()()
{
  id v1 = v0;
  uint64_t v2 = (char *)type metadata accessor for Logger();
  uint64_t v117 = *((void *)v2 - 1);
  v118 = v2;
  __chkstk_darwin(v2);
  v116 = (char *)&v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v4 = &v0[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  NSString v5 = *(void **)&v0[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  if (v5)
  {
    id v6 = [(id)swift_unknownObjectRetain() _poiCategory];
    if (v6)
    {
      double v7 = v6;
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;
      if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0) {
          goto LABEL_8;
        }
      }
LABEL_16:
      swift_unknownObjectRelease();
      goto LABEL_17;
    }
LABEL_8:
    uint64_t v14 = self;
    id v15 = [v5 _styleAttributes];
    uint64_t v16 = self;
    id v17 = [v16 mainScreen];
    [v17 scale];
    double v19 = v18;

    id v20 = [v14 newFillColorForStyleAttributes:v15 forScale:v19];
    id v21 = v14;
    if (v20)
    {
      double v22 = v21;
      id v23 = [v5 _styleAttributes];
      id v24 = [v16 mainScreen];
      [v24 scale];
      double v26 = v25;

      id v27 = [v22 imageForStyle:v23 size:3 forScale:0 format:v26];
      if (v27)
      {
        if (one-time initialization token for assets != -1) {
          swift_once();
        }
        __swift_project_value_buffer((uint64_t)v118, (uint64_t)static MOAngelLogger.assets);
        swift_unknownObjectRetain_n();
        id v28 = Logger.logObject.getter();
        int v29 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v28, (os_log_type_t)v29))
        {
          v118 = v1;
          uint64_t v30 = swift_slowAlloc();
          v116 = (char *)swift_slowAlloc();
          v121 = v116;
          *(_DWORD *)uint64_t v30 = 134218242;
          id v31 = [v5 name:v116];
          LODWORD(v117) = v29;
          if (v31)
          {
            v32 = v31;
            uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v35 = v34;
          }
          else
          {
            uint64_t v33 = 0;
            uint64_t v35 = 0;
          }
          uint64_t v119 = v33;
          uint64_t v120 = v35;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
          uint64_t v110 = Optional<A>.hashValue.getter();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v119 = v110;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_unknownObjectRelease();
          *(_WORD *)(v30 + 12) = 2080;
          id v111 = [v5 _poiCategory];
          uint64_t v119 = (uint64_t)v111;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOPOICategory?);
          uint64_t v112 = Optional.debugDescription.getter();
          unint64_t v114 = v113;

          uint64_t v119 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v112, v114, (uint64_t *)&v121);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v28, (os_log_type_t)v117, "[POIClustering] [RENDERING] POI mapItemName=%ld, mapItemPOICategory=%s", (uint8_t *)v30, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          id v1 = v118;
        }
        else
        {

          swift_unknownObjectRelease_n();
        }
        [v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView] setImage:v27, v116];
        id v115 = [objc_allocWithZone((Class)UIColor) initWithCGColor:v20];

        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView] setTintColor:v115];
        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel] setBackgroundColor:v115];
        swift_unknownObjectRelease();

        return;
      }
    }
    goto LABEL_16;
  }
LABEL_17:
  if (v4[9] == 1)
  {
    double v36 = self;
    double v37 = self;
    v38 = v5;
    uint64_t v39 = v1;
    id v40 = [v37 workStyleAttributes];
    v41 = self;
    id v42 = [v41 mainScreen];
    [v42 scale];
    double v44 = v43;

    id v45 = [v36 imageForStyle:v40 size:3 forScale:0 format:v44];
    id v1 = v39;
    NSString v5 = v38;
    if (v45)
    {
      v46 = v45;
      id v47 = [v37 workStyleAttributes];
      id v48 = [v41 mainScreen];
      [v48 scale];
      double v50 = v49;

      id v51 = [v36 newFillColorForStyleAttributes:v47 forScale:v50];
      id v52 = v36;
      if (v51)
      {
        uint64_t v53 = (uint64_t)v118;
        if (one-time initialization token for assets != -1) {
          swift_once();
        }
        __swift_project_value_buffer(v53, (uint64_t)static MOAngelLogger.assets);
        v54 = Logger.logObject.getter();
        os_log_type_t v55 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v54, v55))
        {
          BOOL v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)BOOL v56 = 0;
          _os_log_impl(&dword_0, v54, v55, "[POIClustering] [RENDERING] Work", v56, 2u);
          swift_slowDealloc();
        }

        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView] setImage:v46];
        v118 = (char *)[objc_allocWithZone((Class)UIColor) initWithCGColor:v51];

        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView] setTintColor:v118];
        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel] setBackgroundColor:v118];

LABEL_37:
        uint64_t v75 = v118;

        return;
      }
    }
  }
  if ((v4[25] & 1) == 0 && v4[27] == 1)
  {
    uint64_t v57 = self;
    if (one-time initialization token for cityStyleAttributes != -1) {
      swift_once();
    }
    uint64_t v58 = static MOPOIAnnotationView.cityStyleAttributes;
    v59 = self;
    id v60 = [v59 mainScreen];
    [v60 scale];
    double v62 = v61;

    id v63 = [v57 newFillColorForStyleAttributes:v58 forScale:v62];
    id v64 = v57;
    if (v63)
    {
      double v65 = v64;
      uint64_t v66 = static MOPOIAnnotationView.cityStyleAttributes;
      id v67 = [v59 mainScreen];
      [v67 scale];
      double v69 = v68;

      id v70 = [v65 imageForStyle:v66 size:3 forScale:0 format:v69];
      if (v70)
      {
        id v71 = v70;
        if (one-time initialization token for assets != -1) {
          swift_once();
        }
        __swift_project_value_buffer((uint64_t)v118, (uint64_t)static MOAngelLogger.assets);
        Class v72 = Logger.logObject.getter();
        os_log_type_t v73 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v72, v73))
        {
          uint64_t v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v74 = 0;
          _os_log_impl(&dword_0, v72, v73, "[POIClustering] [RENDERING] City", v74, 2u);
          swift_slowDealloc();
        }

        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView] setImage:v71];
        v118 = (char *)[objc_allocWithZone((Class)UIColor) initWithCGColor:v63];

        [*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel] setBackgroundColor:v118];
        goto LABEL_37;
      }
    }
  }
  if (one-time initialization token for assets != -1) {
    swift_once();
  }
  v76 = v118;
  uint64_t v77 = __swift_project_value_buffer((uint64_t)v118, (uint64_t)static MOAngelLogger.assets);
  uint64_t v78 = v116;
  uint64_t v79 = v117;
  (*(void (**)(char *, uint64_t, char *))(v117 + 16))(v116, v77, v76);
  uint64_t v80 = v1;
  uint64_t v81 = Logger.logObject.getter();
  os_log_type_t v82 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = swift_slowAlloc();
    v121 = (char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v83 = 134218242;
    if (v5)
    {
      id v84 = [v5 name];
      if (v84)
      {
        v85 = v84;
        uint64_t v86 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v88 = v87;
      }
      else
      {
        uint64_t v86 = 0;
        uint64_t v88 = 0;
      }
      uint64_t v119 = v86;
      uint64_t v120 = v88;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
      uint64_t v89 = Optional<A>.hashValue.getter();

      swift_bridgeObjectRelease();
    }
    else
    {

      uint64_t v89 = 0;
    }
    uint64_t v119 = v89;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v83 + 12) = 2080;
    if (v5)
    {
      id v90 = [v5 _poiCategory];
      uint64_t v119 = (uint64_t)v90;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOPOICategory?);
      uint64_t v91 = Optional.debugDescription.getter();
      unint64_t v93 = v92;
    }
    else
    {
      unint64_t v93 = 0xE300000000000000;
      uint64_t v91 = 7104878;
    }
    uint64_t v119 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v91, v93, (uint64_t *)&v121);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v81, v82, "[POIClustering] [RENDERING] Fallback, geoMapItem.name=%ld, geoMapItem.poiCategory=%s", (uint8_t *)v83, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, char *))(v117 + 8))(v116, v76);
  }
  else
  {

    (*(void (**)(char *, char *))(v79 + 8))(v78, v76);
  }
  v94 = *(void **)&v80[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
  [v94 frame:v116];
  CGRectGetWidth(v123);
  [v94 frame];
  CGRectGetHeight(v124);
  [v94 frame];
  CGRectGetWidth(v125);
  [v94 frame];
  CGRectGetHeight(v126);
  MOSuggestionLayoutEngine.HalfWidth.init()();
  id v99 = [objc_allocWithZone((Class)UIImageView) initWithFrame:v95, v96, v97, v98];
  NSString v100 = String._bridgeToObjectiveC()();
  id v101 = [self _systemImageNamed:v100];

  [v99 setImage:v101];
  v102 = self;
  id v103 = [v102 systemWhiteColor];
  [v99 setTintColor:v103];

  id v104 = [v102 systemIndigoColor];
  [v94 setBackgroundColor:v104];

  v105 = *(void **)&v80[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView];
  id v106 = [v102 systemIndigoColor];
  [v105 setTintColor:v106];

  v107 = *(void **)&v80[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel];
  id v108 = [v102 systemIndigoColor];
  [v107 setBackgroundColor:v108];

  id v109 = [v94 layer];
  [v94 frame];
  [v109 setCornerRadius:CGRectGetHeight(v127) * 0.5];

  [v94 addSubview:v99];
}

id MOPOIAnnotationView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id MOPOIAnnotationView.__allocating_init(annotation:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = v3;
  if (a3)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithAnnotation:a1 reuseIdentifier:v6];

  swift_unknownObjectRelease();
  return v7;
}

void MOPOIAnnotationView.init(annotation:reuseIdentifier:)()
{
}

id MOPOIAnnotationView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOPOIAnnotationView();
  return [super dealloc];
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(char a1)
{
  Hasher.init(_seed:)();
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v4, a1);
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    while (2)
    {
      switch(*(unsigned char *)(*(void *)(v2 + 48) + result))
      {
        case 2:
          if (a1 != 2) {
            goto LABEL_4;
          }
          break;
        case 3:
          if (a1 != 3) {
            goto LABEL_4;
          }
          break;
        case 4:
          if (a1 != 4) {
            goto LABEL_4;
          }
          break;
        case 5:
          if (a1 != 5) {
            goto LABEL_4;
          }
          break;
        case 6:
          if (a1 != 6) {
            goto LABEL_4;
          }
          break;
        case 7:
          if (a1 != 7) {
            goto LABEL_4;
          }
          break;
        case 8:
          if (a1 != 8) {
            goto LABEL_4;
          }
          break;
        case 9:
          if (a1 != 9) {
            goto LABEL_4;
          }
          break;
        case 0xA:
          if (a1 != 10) {
            goto LABEL_4;
          }
          break;
        default:
          if a1 - 2 < 9 || ((*(unsigned __int8 *)(*(void *)(v2 + 48) + result) ^ a1))
          {
LABEL_4:
            unint64_t result = (result + 1) & v6;
            if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result)) {
              continue;
            }
          }
          break;
      }
      break;
    }
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOSuggestionAssetTileSize]>);
  id v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    char v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<MOSuggestionAssetTileSize, CGFloat>);
    id v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (uint64_t i = (void *)(a1 + 40); ; i += 2)
    {
      char v5 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unsigned char *outlined init with take of MOSuggestionAssetTileSize(unsigned char *a1, unsigned char *a2)
{
  return a2;
}

id specialized MOPOIAnnotationView.init(annotation:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v29 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView;
  id v11 = objc_allocWithZone((Class)UIImageView);
  uint64_t v12 = v2;
  *(void *)&v2[v10] = [v11 init];
  uint64_t v13 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
  *(void *)&v12[v13] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v14 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel;
  *(void *)&v12[v14] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v15 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
  *(void *)&v12[v15] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v16 = &v12[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  long long v17 = *(_OWORD *)a2;
  long long v18 = *(_OWORD *)(a2 + 16);
  *((void *)v16 + 4) = *(void *)(a2 + 32);
  *(_OWORD *)uint64_t v16 = v17;
  *((_OWORD *)v16 + 1) = v18;
  outlined retain of MOPOIAnnotationViewConfiguration(a2);

  double v19 = (objc_class *)type metadata accessor for MOPOIAnnotationView();
  v31.receiver = v12;
  v31.super_class = v19;
  id v20 = [super initWithAnnotation:v26 reuseIdentifier:0];
  type metadata accessor for OS_dispatch_queue();
  id v21 = v20;
  double v22 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in MOPOIAnnotationView.init(annotation:configuration:);
  aBlock[5] = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_0;
  id v24 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();

  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
  return v21;
}

uint64_t outlined release of MOPOIAnnotationViewConfiguration(uint64_t a1)
{
  return a1;
}

void specialized MOPOIAnnotationView.setupBorderBackground(cluster:)()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView);
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOSuggestionLayoutEngine.HalfWidth.init()();
  [v1 setFrame:];
  id v2 = [v1 layer];
  id v3 = [self whiteColor];
  id v4 = [v3 CGColor];

  [v2 setBackgroundColor:v4];
  [v1 setClipsToBounds:1];
  id v5 = [v1 layer];
  [v1 frame];
  [v5 setCornerRadius:CGRectGetWidth(v7) * 0.5];
}

void specialized MOPOIAnnotationView.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v2 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UIImageView) init];
  uint64_t v3 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v4 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)UIView) init];

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t type metadata accessor for MOPOIAnnotationView()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for MOPOIAnnotationViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MOPOIAnnotationViewConfiguration()
{
  return swift_unknownObjectRelease();
}

uint64_t initializeWithCopy for MOPOIAnnotationViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MOPOIAnnotationViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MOPOIAnnotationViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(unsigned char *)(a1 + 27) = *(unsigned char *)(a2 + 27);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MOPOIAnnotationViewConfiguration(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MOPOIAnnotationViewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MOPOIAnnotationViewConfiguration()
{
  return &type metadata for MOPOIAnnotationViewConfiguration;
}

uint64_t outlined retain of MOPOIAnnotationViewConfiguration(uint64_t a1)
{
  return a1;
}

uint64_t sub_EF8C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in MOPOIAnnotationView.init(annotation:configuration:)()
{
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.getter()
{
  return MOSuggestionAssetMapsClusterer.skipRows.getter();
}

{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.setter(uint64_t a1)
{
  return MOSuggestionAssetMapsClusterer.skipRows.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows);
}

uint64_t (*MOSuggestionAssetMapsClusterer.skipRows.modify())()
{
  return MOMapLocation.startDate.modify;
}

uint64_t MOSuggestionAssetMapsClusterer.skipColumns.getter()
{
  return MOSuggestionAssetMapsClusterer.skipRows.getter();
}

uint64_t MOSuggestionAssetMapsClusterer.skipColumns.setter(uint64_t a1)
{
  return MOSuggestionAssetMapsClusterer.skipRows.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns);
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.setter(uint64_t a1, void *a2)
{
  int v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *int v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MOSuggestionAssetMapsClusterer.skipColumns.modify())()
{
  return MOMapLocation.poiCategory.modify;
}

void *MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES.unsafeMutableAddressor()
{
  return &static MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES;
}

double static MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES.getter()
{
  return 180.0;
}

double MOSuggestionAssetMapsClusterer.Cluster.coordinates.getter()
{
  return *(double *)v0;
}

void MOSuggestionAssetMapsClusterer.Cluster.coordinates.setter(double a1, double a2)
{
  *uint64_t v2 = a1;
  v2[1] = a2;
}

double MOSuggestionAssetMapsClusterer.Cluster.distance.getter()
{
  return *(double *)(v0 + 16);
}

void MOSuggestionAssetMapsClusterer.Cluster.distance.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.count.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.count.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.chain.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.chain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.chain.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 32);
  uint64_t v4 = type metadata accessor for UUID();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster()
{
  uint64_t result = type metadata singleton initialization cache for MOSuggestionAssetMapsClusterer.Cluster;
  if (!type metadata singleton initialization cache for MOSuggestionAssetMapsClusterer.Cluster) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.id.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 32);
  uint64_t v4 = type metadata accessor for UUID();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.id.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.getter()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();

  return swift_unknownObjectRetain();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 36);
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

double MOSuggestionAssetMapsClusterer.Cluster.confidence.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 40));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.confidence.setter(double a1)
{
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  *(double *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.confidence.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.title.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 44));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.title.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isWork.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 48));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isWork.setter(char a1)
{
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  *(unsigned char *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.isWork.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 52));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.setter(char a1)
{
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  *(unsigned char *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

double MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() + 56));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.setter(double a1)
{
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  *(double *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t static MOSuggestionAssetMapsClusterer.Cluster.== infix(_:_:)()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();

  return static UUID.== infix(_:_:)();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int MOSuggestionAssetMapsClusterer.Cluster.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.init(coordinates:distance:count:chain:id:geoMapItem:confidence:title:isWork:isScaledDownPOI:horizontalUncertainty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, double a14@<D4>, char a15)
{
  *(double *)a9 = a10;
  *(double *)(a9 + 8) = a11;
  *(double *)(a9 + 16) = a12;
  *(void *)(a9 + 24) = a1;
  *(void *)(a9 + 32) = a2;
  *(void *)(a9 + 40) = a3;
  uint64_t v23 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v24 = a9 + v23[8];
  uint64_t v25 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(v24, a4, v25);
  *(void *)(a9 + v23[9]) = a5;
  *(double *)(a9 + v23[10]) = a13;
  uint64_t v27 = (void *)(a9 + v23[11]);
  void *v27 = a6;
  v27[1] = a7;
  *(unsigned char *)(a9 + v23[12]) = a8;
  *(unsigned char *)(a9 + v23[13]) = a15;
  *(double *)(a9 + v23[14]) = a14;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetMapsClusterer.Cluster()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetMapsClusterer.Cluster()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetMapsClusterer.Cluster()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetMapsClusterer.Cluster()
{
  return static UUID.== infix(_:_:)();
}

uint64_t MOSuggestionAssetMapsClusterer.__allocating_init(mapLocations:separationThreshold:)(void **a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  return MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(a1, a2);
}

uint64_t MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(void **a1, double a2)
{
  uint64_t v5 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v8 = (double *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows] = &_swiftEmptySetSingleton;
  *(void *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns] = &_swiftEmptySetSingleton;
  p_ivar_lyt = &MOAngelLogger.ivar_lyt;
  uint64_t v10 = _swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters] = _swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results] = &_swiftEmptySetSingleton;
  *(double *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold] = a2;
  id v11 = (objc_class *)type metadata accessor for MOSuggestionAssetMapsClusterer();
  v27.receiver = v2;
  v27.super_class = v11;
  id v12 = [super init];
  id v13 = v12;
  uint64_t v26 = 0;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)((char *)&dword_10 + ((unint64_t)a1 & 0xFFFFFFFFFFFFFF8));
  id v15 = v12;
  if (v14)
  {
    while (1)
    {
      uint64_t v25 = v10;
      uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14 & ~(v14 >> 63), 0);
      if (v14 < 0) {
        break;
      }
      id v22 = v13;
      id v13 = 0;
      uint64_t v10 = 0;
      long long v17 = v25;
      unint64_t v23 = (unint64_t)a1 & 0xC000000000000001;
      p_ivar_lyt = a1;
      while ((id)v14 != v13)
      {
        if (v23)
        {
          uint64_t v18 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v18 = (uint64_t)a1[(void)v13 + 4];
          swift_retain();
        }
        uint64_t v24 = v18;
        closure #1 in MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(&v24, &v26, v8);
        swift_release();
        uint64_t v25 = v17;
        unint64_t v20 = v17[2];
        unint64_t v19 = v17[3];
        if (v20 >= v19 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
          long long v17 = v25;
        }
        id v13 = (char *)v13 + 1;
        v17[2] = v20 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8, (uint64_t)v17+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v20);
        a1 = p_ivar_lyt;
        if ((id)v14 == v13)
        {
          swift_bridgeObjectRelease();
          id v13 = v22;

          p_ivar_lyt = (void **)(&MOAngelLogger + 16);
          goto LABEL_16;
        }
      }
      __break(1u);
LABEL_14:
      id v21 = v13;
      swift_bridgeObjectRetain();
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v14) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();

    long long v17 = _swiftEmptyArrayStorage;
LABEL_16:
    *(void *)((char *)p_ivar_lyt[505] + (void)v13) = v17;
    swift_bridgeObjectRelease();
    return (uint64_t)v13;
  }
  return result;
}

uint64_t type metadata accessor for MOSuggestionAssetMapsClusterer()
{
  return self;
}

uint64_t closure #1 in MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, double *a3@<X8>)
{
  uint64_t v5 = *a1;
  double v6 = (*(double (**)(void))(*(void *)*a1 + 240))();
  double v7 = (*(double (**)(void))(*(void *)v5 + 264))();
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)v5 + 312);
  uint64_t v9 = v8();
  if (v10)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t result = ((uint64_t (*)(uint64_t))v8)(v9);
    if (v12) {
      goto LABEL_8;
    }
    uint64_t v25 = result;
  }
  uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v27 = v13;
  v14._countAndFlagsBits = 95;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  id v15 = a2;
  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v5 + 288))();
  double v17 = (*(double (**)(void))(*(void *)v5 + 360))();
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)v5 + 336))();
  uint64_t v20 = v19;
  char v21 = (*(uint64_t (**)(void))(*(void *)v5 + 384))();
  double v22 = (*(double (**)(void))(*(void *)v5 + 456))();
  unint64_t v23 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t result = UUID.init()();
  *a3 = v6;
  a3[1] = v7;
  a3[2] = 0.0;
  *((void *)a3 + 3) = v25;
  *((void *)a3 + 4) = v26;
  *((void *)a3 + 5) = v27;
  *(void *)((char *)a3 + v23[9]) = v16;
  *(double *)((char *)a3 + v23[10]) = v17;
  uint64_t v24 = (uint64_t *)((char *)a3 + v23[11]);
  *uint64_t v24 = v18;
  v24[1] = v20;
  *((unsigned char *)a3 + v23[12]) = v21 & 1;
  *((unsigned char *)a3 + v23[13]) = 0;
  *(double *)((char *)a3 + v23[14]) = v22;
  if (!__OFADD__(*v15, 1))
  {
    ++*v15;
    return result;
  }
  __break(1u);
LABEL_8:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MOSuggestionAssetMapsClusterer.buildDendogram()()
{
  uint64_t v1 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v129 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v121 = (uint64_t)v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v120 = (uint64_t)v109 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v113 = (char *)v109 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v117 = (uint64_t)v109 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v116 = (uint64_t)v109 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v115 = (uint64_t)v109 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v114 = (uint64_t)v109 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v112 = (char *)v109 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  double v22 = (char *)v109 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  __chkstk_darwin(v23);
  uint64_t v122 = (uint64_t)v109 - v27;
  unint64_t v28 = *(void *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters);
  unint64_t v137 = v28;
  uint64_t v29 = *(void *)(v28 + 16);
  if (!v29) {
    goto LABEL_90;
  }
  uint64_t v30 = v29 - 1;
  if (v29 == 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_76;
  }
  uint64_t v127 = v26;
  uint64_t v124 = v25;
  uint64_t v125 = v24;
  uint64_t v110 = OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold;
  v109[1] = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results;
  swift_bridgeObjectRetain();
  uint64_t v31 = 0;
  v32 = _swiftEmptyArrayStorage;
  uint64_t v119 = v0;
  uint64_t v126 = v1;
  id v111 = v22;
  uint64_t v118 = v30;
  while (1)
  {
    if (v31 == v30)
    {
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
      return;
    }
    uint64_t v33 = *(void *)(v28 + 16);
    if (v33
      && (uint64_t v34 = static Array._allocateBufferUninitialized(minimumCapacity:)(),
          *(void *)(v34 + 16) = v33,
          memset_pattern16((void *)(v34 + 32), &unk_1D470, 8 * v33),
          (uint64_t v35 = *(void *)(v28 + 16)) != 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      double v36 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      v36[2] = v35;
      v36[4] = v34;
      if (v35 == 1) {
        goto LABEL_14;
      }
      v32 = v36;
      v36[5] = v34;
      uint64_t v37 = v35 - 2;
      if (v35 != 2)
      {
        v38 = v36 + 6;
        do
        {
          *v38++ = v34;
          swift_bridgeObjectRetain();
          --v37;
        }
        while (v37);
      }
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    double v36 = v32;
LABEL_14:
    uint64_t v39 = *(void *)(v28 + 16);
    if (!v39) {
      goto LABEL_89;
    }
    uint64_t v123 = v31;
    uint64_t v40 = v39 - 1;
    unint64_t v133 = v28;
    v41 = v36;
    if (v39 != 1) {
      break;
    }
LABEL_35:
    distanceMatrix._rawValue = v36;
    uint64_t v62 = v119;
    Swift::tuple_tuple_Int_Int_Double_optional v138 = MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)(&distanceMatrix, 1);
    if (v63)
    {
      swift_bridgeObjectRelease();
      uint64_t v30 = v118;
      uint64_t v82 = v123;
      v32 = _swiftEmptyArrayStorage;
    }
    else
    {
      uint64_t v64 = (uint64_t)v111;
      if (v138.value._0._0 < 0) {
        goto LABEL_92;
      }
      unint64_t v65 = v28;
      unint64_t v66 = *(void *)(v28 + 16);
      if (v138.value._0._0 >= v66) {
        goto LABEL_93;
      }
      unint64_t v67 = v138.value._0._1;
      double v68 = *(double *)&v138.is_nil;
      unint64_t v132 = (*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80);
      uint64_t v69 = v65 + v132;
      uint64_t v70 = *(void *)(v129 + 72);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v65 + v132 + v70 * v138.value._0._0, v122);
      if (v67 >= v66) {
        goto LABEL_94;
      }
      double v71 = v68;
      uint64_t v72 = v127;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v69 + v70 * v67, v127);
      if (*(double *)(v62 + v110) * *(double *)(v62 + v110) <= v71)
      {
        swift_bridgeObjectRelease();
        uint64_t v83 = v122;
        uint64_t v84 = v117;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v122, v117);
        swift_beginAccess();
        uint64_t v85 = v116;
        specialized Set._Variant.insert(_:)(v116, v84);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v85);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v72, v84);
        specialized Set._Variant.insert(_:)(v85, v84);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v85);
        swift_endAccess();
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v72);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v83);
        uint64_t v30 = v118;
        uint64_t v82 = v123;
        v32 = _swiftEmptyArrayStorage;
        unint64_t v28 = v133;
      }
      else
      {
        unint64_t v134 = v122 + *(int *)(v126 + 32);
        swift_bridgeObjectRetain();
        unint64_t v73 = 0;
        uint64_t v135 = v70;
        uint64_t v74 = v70 + v132;
        unint64_t v75 = 1;
        uint64_t v76 = (uint64_t)v113;
        uint64_t v77 = (uint64_t)v112;
        while (1)
        {
          char v78 = static UUID.== infix(_:_:)();
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v69, v64);
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v127, v77);
          if (v78) {
            break;
          }
          char v79 = static UUID.== infix(_:_:)();
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v77);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v64);
          if (v79) {
            goto LABEL_48;
          }
          ++v73;
          v69 += v135;
          ++v75;
          v74 += v135;
          if (v66 == v73)
          {
            unint64_t v80 = v133;
            swift_bridgeObjectRelease();
            unint64_t v73 = *(void *)(v80 + 16);
            unint64_t v81 = v137;
            goto LABEL_50;
          }
        }
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v77);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v64);
LABEL_48:
        unint64_t v86 = v133;
        swift_bridgeObjectRelease();
        if (__OFADD__(v73, 1)) {
          goto LABEL_101;
        }
        uint64_t v87 = *(void *)(v86 + 16);
        unint64_t v81 = v137;
        if (v73 + 1 != v87)
        {
          while (v75 < *(void *)(v81 + 16))
          {
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v81 + v74, v76);
            char v99 = static UUID.== infix(_:_:)();
            uint64_t v100 = v76;
            uint64_t v101 = v76;
            uint64_t v102 = v124;
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v100, v124);
            uint64_t v103 = v125;
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v127, v125);
            if (v99)
            {
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v102);
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v103);
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v101);
              uint64_t v76 = v101;
            }
            else
            {
              char v104 = static UUID.== infix(_:_:)();
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v102);
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v103);
              outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v101);
              uint64_t v76 = v101;
              if ((v104 & 1) == 0)
              {
                if (v75 != v73)
                {
                  if ((v73 & 0x8000000000000000) != 0) {
                    goto LABEL_95;
                  }
                  unint64_t v105 = *(void *)(v81 + 16);
                  if (v73 >= v105) {
                    goto LABEL_96;
                  }
                  unint64_t v106 = v73 * v135;
                  outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v81 + v132 + v73 * v135, v120);
                  if (v75 >= v105) {
                    goto LABEL_97;
                  }
                  outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v81 + v74, v121);
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  {
                    unint64_t v81 = specialized _ArrayBuffer._consumeAndCreateNew()(v81);
                    unint64_t v137 = v81;
                  }
                  if (v73 >= *(void *)(v81 + 16)) {
                    goto LABEL_98;
                  }
                  outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(v121, v81 + v132 + v106);
                  if (v75 >= *(void *)(v137 + 16)) {
                    goto LABEL_99;
                  }
                  outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(v120, v137 + v74);
                }
                if (__OFADD__(v73++, 1)) {
                  goto LABEL_91;
                }
              }
            }
            unint64_t v108 = v75 + 1;
            if (__OFADD__(v75, 1)) {
              goto LABEL_87;
            }
            unint64_t v81 = v137;
            ++v75;
            v74 += v135;
            if (v108 == *(void *)(v137 + 16)) {
              goto LABEL_50;
            }
          }
          goto LABEL_86;
        }
LABEL_50:
        int64_t v88 = *(void *)(v81 + 16);
        if (v88 < (uint64_t)v73) {
          goto LABEL_100;
        }
        specialized Array.replaceSubrange<A>(_:with:)(v73, v88);
        swift_bridgeObjectRelease();
        uint64_t v89 = v114;
        MOSuggestionAssetMapsClusterer.combinedCluster(_:_:distance:)(v122, v127, v114, v71);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v89, v115);
        unint64_t v90 = v137;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v30 = v118;
        uint64_t v82 = v123;
        v32 = _swiftEmptyArrayStorage;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          unint64_t v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v90 + 16) + 1, 1, v90);
        }
        unint64_t v93 = *(void *)(v90 + 16);
        unint64_t v92 = *(void *)(v90 + 24);
        if (v93 >= v92 >> 1) {
          unint64_t v90 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v92 > 1, v93 + 1, 1, v90);
        }
        *(void *)(v90 + 16) = v93 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v115, v90 + v132 + v93 * v135);
        unint64_t v137 = v90;
        unint64_t v94 = v90;
        uint64_t v95 = v114;
        uint64_t v96 = v117;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v114, v117);
        swift_beginAccess();
        uint64_t v97 = v116;
        specialized Set._Variant.insert(_:)(v116, v96);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v97);
        swift_endAccess();
        uint64_t v98 = v95;
        unint64_t v28 = v94;
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v98);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v127);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v122);
      }
    }
    uint64_t v31 = v82 + 1;
    if (v31 == v30) {
      goto LABEL_76;
    }
  }
  unint64_t v42 = 0;
  double v43 = v36 + 4;
  double v44 = v36 + 5;
  unint64_t v128 = v28 + 8;
  unint64_t v132 = 1;
  uint64_t v130 = v39 - 1;
  while (1)
  {
    if (v42 == v40)
    {
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
    unint64_t v45 = *(void *)(v28 + 16);
    if (v45 <= v42) {
      goto LABEL_84;
    }
    unint64_t v131 = v42 + 1;
    if (v42 + 1 != v45) {
      break;
    }
LABEL_17:
    ++v132;
    uint64_t v40 = v130;
    unint64_t v42 = v131;
    if (v131 == v130) {
      goto LABEL_35;
    }
  }
  if (v42 + 1 >= v45) {
    goto LABEL_85;
  }
  unint64_t v46 = (*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80);
  uint64_t v47 = *(void *)(v129 + 72);
  id v48 = (double *)(v28 + v46 + v47 * v42);
  unint64_t v134 = v45 - 1;
  uint64_t v135 = v47;
  double v49 = (double *)(v128 + v46 + v47 * v132);
  unint64_t v50 = v42;
  while (1)
  {
    unint64_t v51 = *(void *)(v28 + 16);
    if (v42 >= v51) {
      break;
    }
    unint64_t v52 = v50 + 1;
    if (v50 + 1 >= v51) {
      goto LABEL_78;
    }
    if (v42 >= v36[2]) {
      goto LABEL_79;
    }
    double v53 = *(v49 - 1);
    double v54 = *v49;
    double v56 = *v48;
    double v55 = v48[1];
    uint64_t v57 = (void *)v43[v42];
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    v43[v42] = v57;
    if ((v58 & 1) == 0)
    {
      uint64_t v57 = specialized _ArrayBuffer._consumeAndCreateNew()(v57);
      v43[v42] = v57;
    }
    if (v52 >= v57[2]) {
      goto LABEL_80;
    }
    double v59 = (v56 - v53) * (v56 - v53) + (v55 - v54) * (v55 - v54);
    *(double *)&v57[v50 + 5] = v59;
    if (v52 >= v41[2]) {
      goto LABEL_81;
    }
    id v60 = (void *)v44[v50];
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    v44[v50] = v60;
    if ((v61 & 1) == 0)
    {
      id v60 = specialized _ArrayBuffer._consumeAndCreateNew()(v60);
      v44[v50] = v60;
    }
    unint64_t v28 = v133;
    if (v42 >= v60[2]) {
      goto LABEL_82;
    }
    double v36 = v41;
    *(double *)&v60[v42 + 4] = v59;
    ++v50;
    double v49 = (double *)((char *)v49 + v135);
    if (v134 == v50) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_76:
  swift_bridgeObjectRelease();
}

uint64_t MOSuggestionAssetMapsClusterer.distanceMatrix(clusters:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = specialized Array.init(repeating:count:)(*(void *)(*a1 + 16), 1.79769313e308);
  uint64_t result = (uint64_t)specialized Array.init(repeating:count:)((uint64_t)v2, *(void *)(v1 + 16));
  uint64_t v31 = v1;
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = v4 - 1;
    if (v4 == 1) {
      return (uint64_t)v5;
    }
    unint64_t v7 = 0;
    uint64_t v26 = v1 + 8;
    uint64_t v27 = v4 - 1;
    uint64_t v8 = 5;
    uint64_t v9 = 1;
    while (v7 != v6)
    {
      unint64_t v10 = *(void *)(v31 + 16);
      if (v10 <= v7) {
        goto LABEL_32;
      }
      uint64_t v29 = v8;
      unint64_t v28 = v7 + 1;
      if (v7 + 1 != v10)
      {
        if (v7 + 1 >= v10) {
          goto LABEL_33;
        }
        uint64_t v11 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
        uint64_t v12 = *(void *)(v11 - 8);
        uint64_t result = v11 - 8;
        unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
        uint64_t v14 = *(void *)(v12 + 72);
        uint64_t v15 = (double *)(v31 + v13 + v14 * v7);
        unint64_t v30 = 1 - v10;
        uint64_t v16 = (double *)(v26 + v13 + v14 * v9);
        while (1)
        {
          unint64_t v17 = *(void *)(v31 + 16);
          if (v7 >= v17) {
            break;
          }
          unint64_t v18 = v8 - 4;
          if (v8 - 4 >= v17) {
            goto LABEL_26;
          }
          double v19 = *(v16 - 1);
          double v20 = *v16;
          double v22 = *v15;
          double v21 = v15[1];
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
            uint64_t v5 = (void *)result;
          }
          if (v7 >= v5[2]) {
            goto LABEL_27;
          }
          uint64_t v23 = (void *)v5[v7 + 4];
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          v5[v7 + 4] = v23;
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v23);
            uint64_t v23 = (void *)result;
            v5[v7 + 4] = result;
          }
          if (v18 >= v23[2]) {
            goto LABEL_28;
          }
          double v24 = (v22 - v19) * (v22 - v19) + (v21 - v20) * (v21 - v20);
          *(double *)&v23[v8] = v24;
          if (v18 >= v5[2]) {
            goto LABEL_29;
          }
          uint64_t v25 = (void *)v5[v8];
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          v5[v8] = v25;
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v25);
            uint64_t v25 = (void *)result;
            v5[v8] = result;
          }
          if (v7 >= v25[2]) {
            goto LABEL_30;
          }
          *(double *)&v25[v7 + 4] = v24;
          ++v8;
          uint64_t v16 = (double *)((char *)v16 + v14);
          if (v30 + v8 == 5) {
            goto LABEL_4;
          }
        }
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        break;
      }
LABEL_4:
      uint64_t v8 = v29 + 1;
      ++v9;
      uint64_t v6 = v27;
      ++v7;
      if (v28 == v27) {
        return (uint64_t)v5;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::tuple_tuple_Int_Int_Double_optional __swiftcall MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)(Swift::OpaquePointer *distanceMatrix, Swift::Bool lowerHalfOnly)
{
  rawValue = distanceMatrix->_rawValue;
  uint64_t v33 = rawValue[2];
  if (!v33)
  {
LABEL_39:
    Swift::Int v4 = 0;
    Swift::Int v5 = 0;
    Swift::Bool v6 = 0;
    goto LABEL_43;
  }
  v32 = (char *)(rawValue + 4);
  Swift::Int v4 = swift_bridgeObjectRetain();
  unint64_t v8 = 0;
  double v9 = 1.79769313e308;
  uint64_t v37 = -1;
  uint64_t v10 = -1;
  Swift::Int v35 = v4;
  while (1)
  {
    if (v8 >= *(void *)(v4 + 16)) {
      goto LABEL_42;
    }
    uint64_t v11 = *(void *)&v32[8 * v8];
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12) {
      break;
    }
LABEL_4:
    if (++v8 == v33)
    {
      swift_bridgeObjectRelease();
      Swift::Int v4 = v10;
      Swift::Int v5 = v37;
      if (v10 != -1 || v37 != -1)
      {
        Swift::Bool v6 = LOBYTE(v9);
        goto LABEL_43;
      }
      goto LABEL_39;
    }
  }
  unint64_t v13 = *(uint64_t (**)(Swift::Int))&stru_68.segname[swift_isaMask & *v2];
  if (v8 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v8;
  }
  unint64_t v34 = v14;
  Swift::Int v4 = swift_bridgeObjectRetain();
  unint64_t v15 = 0;
  while (v15 < *(void *)(v11 + 16))
  {
    double v16 = *(double *)(v11 + 32 + 8 * v15);
    uint64_t v17 = v13(v4);
    if (*(void *)(v17 + 16))
    {
      uint64_t v18 = static Hasher._hash(seed:_:)();
      uint64_t v19 = -1 << *(unsigned char *)(v17 + 32);
      unint64_t v20 = v18 & ~v19;
      if ((*(void *)(v17 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
      {
        uint64_t v21 = *(void *)(v17 + 48);
        if (*(void *)(v21 + 8 * v20) == v8) {
          goto LABEL_11;
        }
        uint64_t v22 = ~v19;
        while (1)
        {
          unint64_t v20 = (v20 + 1) & v22;
          if (((*(void *)(v17 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
            break;
          }
          if (*(void *)(v21 + 8 * v20) == v8) {
            goto LABEL_11;
          }
        }
      }
    }
    uint64_t v23 = swift_bridgeObjectRelease();
    uint64_t v24 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.size + (swift_isaMask & *v2)))(v23);
    if (!*(void *)(v24 + 16)) {
      goto LABEL_28;
    }
    uint64_t v25 = static Hasher._hash(seed:_:)();
    uint64_t v26 = -1 << *(unsigned char *)(v24 + 32);
    unint64_t v27 = v25 & ~v26;
    if (((*(void *)(v24 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
      goto LABEL_28;
    }
    uint64_t v28 = *(void *)(v24 + 48);
    if (*(void *)(v28 + 8 * v27) != v15)
    {
      uint64_t v29 = ~v26;
      while (1)
      {
        unint64_t v27 = (v27 + 1) & v29;
        if (((*(void *)(v24 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
          break;
        }
        if (*(void *)(v28 + 8 * v27) == v15) {
          goto LABEL_11;
        }
      }
LABEL_28:
      Swift::Int v4 = swift_bridgeObjectRelease();
      if (!lowerHalfOnly || v15 < v8 && (unint64_t v30 = *(void *)(v35 + 16), v15 < v30) && v30 > v34)
      {
        uint64_t v31 = v37;
        if (v16 < v9) {
          uint64_t v31 = v15;
        }
        uint64_t v37 = v31;
        if (v16 < v9)
        {
          uint64_t v10 = v8;
          double v9 = v16;
        }
      }
      goto LABEL_12;
    }
LABEL_11:
    Swift::Int v4 = swift_bridgeObjectRelease();
LABEL_12:
    if (++v15 == v12)
    {
      swift_bridgeObjectRelease();
      Swift::Int v4 = v35;
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  result.value._1 = v7;
  result.value._0._1 = v5;
  result.value._0._0 = v4;
  result.is_nil = v6;
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.combinedCluster(_:_:distance:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  double v9 = (int *)result;
  uint64_t v10 = *(int *)(result + 36);
  uint64_t v11 = *(void *)(a1 + v10);
  if (!v11)
  {
    uint64_t v11 = *(void *)(a2 + v10);
    uint64_t result = swift_unknownObjectRetain();
  }
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    double v15 = (*(double *)(a1 + 8) + *(double *)(a2 + 8)) * 0.5;
    double v16 = (*(double *)a1 + *(double *)a2) * 0.5;
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a2 + 32);
    unint64_t v20 = *(void **)(a2 + 40);
    uint64_t v23 = v18;
    uint64_t v24 = v17;
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = v19;
    v21._object = v20;
    String.append(_:)(v21);
    swift_unknownObjectRetain();
    uint64_t result = UUID.init()();
    *(double *)a3 = v16;
    *(double *)(a3 + 8) = v15;
    *(double *)(a3 + 16) = a4;
    *(void *)(a3 + 24) = v14;
    *(void *)(a3 + 32) = v23;
    *(void *)(a3 + 40) = v24;
    *(void *)(a3 + v9[9]) = v11;
    *(void *)(a3 + v9[10]) = 0;
    uint64_t v22 = (void *)(a3 + v9[11]);
    *uint64_t v22 = 0;
    v22[1] = 0xE000000000000000;
    *(unsigned char *)(a3 + v9[12]) = 0;
    *(unsigned char *)(a3 + v9[13]) = 0;
    *(void *)(a3 + v9[14]) = 0;
  }
  return result;
}

double static MOSuggestionAssetMapsClusterer.makeRegion(containing:applyBottomPaddingForPlatter:applyBottomPaddingForGradient:horizontalAspectRatio:markerStyle:applyRenderMargin:shouldAdjustMarker:)(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v9 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter()) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_3:
      char v47 = a6;
      if ((a1 & 0xC000000000000001) != 0)
      {
        char v11 = a2;
        uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_6:
        uint64_t v13 = swift_bridgeObjectRelease();
        double latitude = (*(double (**)(uint64_t))(*(void *)v12 + 240))(v13);
        (*(void (**)(void))(*(void *)v12 + 264))();
        double v15 = (*(double (**)(void))(*(void *)v12 + 456))();
        uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v12 + 312))();
        char v18 = v17;
        if (v9)
        {
          swift_bridgeObjectRetain();
          int64_t v19 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v19 < 2) {
            goto LABEL_8;
          }
        }
        else
        {
          int64_t v19 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
          if (v19 < 2)
          {
LABEL_8:
            if ((v18 & 1) != 0 || v16 < 2)
            {
              if (v15 <= 0.0)
              {
                swift_release();
                double v20 = 0.04;
              }
              else
              {
                if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1) {
                  swift_once();
                }
                double v39 = *(double *)&static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
                swift_release();
                double v40 = v15 / 111000.0;
                if (v15 >= v39)
                {
                  double v41 = v40 * 3.0 + 0.003;
                  if (v41 <= 0.1) {
                    double v20 = v41;
                  }
                  else {
                    double v20 = 0.1;
                  }
                }
                else
                {
                  double v20 = v40 + v40 + 0.003;
                }
              }
            }
            else
            {
              swift_release();
              double v20 = 0.01;
            }
            double latitudeDelta = v20;
            if (v47)
            {
LABEL_31:
              double v38 = 1.4;
LABEL_32:
              if (v11) {
                return latitude + latitudeDelta * v38 * 1.4 / -12.0;
              }
              return latitude;
            }
LABEL_20:
            double v38 = 1.1;
            goto LABEL_32;
          }
        }
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19, 0);
        uint64_t v21 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0)
          {
            uint64_t v22 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v22 = *(void *)(a1 + 8 * v21 + 32);
            swift_retain();
          }
          double v23 = (*(double (**)(void))(*(void *)v22 + 240))();
          double v24 = (*(double (**)(void))(*(void *)v22 + 264))();
          swift_release();
          unint64_t v26 = _swiftEmptyArrayStorage[2];
          unint64_t v25 = _swiftEmptyArrayStorage[3];
          if (v26 >= v25 >> 1) {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
          }
          ++v21;
          _swiftEmptyArrayStorage[2] = v26 + 1;
          unint64_t v27 = (double *)&_swiftEmptyArrayStorage[2 * v26 + 4];
          double *v27 = v23;
          v27[1] = v24;
        }
        while (v19 != v21);
        id v28 = [self polygonWithCoordinates:&_swiftEmptyArrayStorage[4] count:v19];
        swift_bridgeObjectRelease();
        [v28 boundingMapRect];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;

        v48.origin.x = v30;
        v48.origin.y = v32;
        v48.size.width = v34;
        v48.size.height = v36;
        MKCoordinateRegion v49 = MKCoordinateRegionForMapRect(v48);
        double latitude = v49.center.latitude;
        double latitudeDelta = v49.span.latitudeDelta;
        swift_release();
        if (v47) {
          goto LABEL_31;
        }
        goto LABEL_20;
      }
      if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
      {
        char v11 = a2;
        uint64_t v12 = *(void *)(a1 + 32);
        swift_retain();
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for assets != -1) {
LABEL_43:
  }
    swift_once();
  uint64_t v42 = type metadata accessor for Logger();
  __swift_project_value_buffer(v42, (uint64_t)static MOAngelLogger.assets);
  double v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v43, v44))
  {
    unint64_t v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v45 = 0;
    _os_log_impl(&dword_0, v43, v44, "[MapSnapshot] makeRegion failed with 0 locations", v45, 2u);
    swift_slowDealloc();
  }

  v50.origin.x = MKMapRectNull.origin.x;
  v50.origin.y = MKMapRectNull.origin.y;
  v50.size.width = MKMapRectNull.size.width;
  v50.size.height = MKMapRectNull.size.height;
  *(void *)&double latitude = (unint64_t)MKCoordinateRegionForMapRect(v50);
  return latitude;
}

char *MOSuggestionAssetMapsClusterer.groupedByAverageHeight()()
{
  uint64_t v148 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v149 = *(void *)(v148 - 8);
  uint64_t v0 = __chkstk_darwin(v148);
  uint64_t v147 = (uint64_t)&v124 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __chkstk_darwin(v0);
  Swift::Int v4 = (char *)&v124 - v3;
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v135 = (uint64_t)&v124 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v124 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  v143 = (double *)((char *)&v124 - v11);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v124 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  char v17 = (char *)&v124 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  double v20 = (double *)((char *)&v124 - v19);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v124 - v21;
  *(void *)&long long v153 = 0;
  *((void *)&v153 + 1) = 0xE000000000000000;
  double v23 = COERCE_DOUBLE(specialized static MOAngelDefaultsManager.doubleValueFor(_:)());
  if (v24) {
    double v25 = 0.5;
  }
  else {
    double v25 = v23;
  }
  if (one-time initialization token for assets != -1) {
    goto LABEL_124;
  }
  while (1)
  {
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static MOAngelLogger.assets);
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    BOOL v29 = os_log_type_enabled(v27, v28);
    unint64_t v137 = v14;
    if (v29)
    {
      double v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v30 = 134217984;
      *(double *)&long long v151 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_0, v27, v28, "[MOSuggestionAssetMapsClusterer] using POI penalty: %f", v30, 0xCu);
      swift_slowDealloc();
    }

    double v31 = (uint64_t *)(v144 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results);
    swift_beginAccess();
    uint64_t v32 = *v31;
    p_ivar_lyt = (void **)(&MOAngelLogger + 16);
    if (!*(void *)(*v31 + 16))
    {
      uint64_t v22 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_107;
    }
    uint64_t v130 = v9;
    uint64_t v14 = (char *)(v32 + 56);
    uint64_t v34 = 1 << *(unsigned char *)(v32 + 32);
    uint64_t v35 = -1;
    if (v34 < 64) {
      uint64_t v35 = ~(-1 << v34);
    }
    unint64_t v36 = v35 & *(void *)(v32 + 56);
    unint64_t v9 = (char *)((unint64_t)(v34 + 63) >> 6);
    swift_bridgeObjectRetain();
    uint64_t v37 = 0;
    for (double i = 0.0; ; double i = i + v42 * (1.0 - v41))
    {
      if (v36)
      {
        unint64_t v39 = __clz(__rbit64(v36));
        v36 &= v36 - 1;
        unint64_t v40 = v39 | (v37 << 6);
        goto LABEL_12;
      }
      uint64_t v43 = v37 + 1;
      if (__OFADD__(v37, 1))
      {
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
        goto LABEL_121;
      }
      if (v43 >= (uint64_t)v9) {
        goto LABEL_31;
      }
      unint64_t v44 = *(void *)&v14[8 * v43];
      ++v37;
      if (!v44)
      {
        uint64_t v37 = v43 + 1;
        if (v43 + 1 >= (uint64_t)v9) {
          goto LABEL_31;
        }
        unint64_t v44 = *(void *)&v14[8 * v37];
        if (!v44)
        {
          uint64_t v37 = v43 + 2;
          if (v43 + 2 >= (uint64_t)v9) {
            goto LABEL_31;
          }
          unint64_t v44 = *(void *)&v14[8 * v37];
          if (!v44) {
            break;
          }
        }
      }
LABEL_30:
      unint64_t v36 = (v44 - 1) & v44;
      unint64_t v40 = __clz(__rbit64(v44)) + (v37 << 6);
LABEL_12:
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v32 + 48) + *(void *)(v149 + 72) * v40, (uint64_t)v22);
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v22, (uint64_t)v20);
      if (*(void *)((char *)v20 + *(int *)(v148 + 36))) {
        double v41 = v25;
      }
      else {
        double v41 = -v25;
      }
      double v42 = v20[2];
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v20);
    }
    uint64_t v45 = v43 + 3;
    if (v45 >= (uint64_t)v9) {
      break;
    }
    unint64_t v44 = *(void *)&v14[8 * v45];
    if (v44)
    {
      uint64_t v37 = v45;
      goto LABEL_30;
    }
    while (1)
    {
      uint64_t v37 = v45 + 1;
      if (__OFADD__(v45, 1)) {
        break;
      }
      if (v37 >= (uint64_t)v9) {
        goto LABEL_31;
      }
      unint64_t v44 = *(void *)&v14[8 * v37];
      ++v45;
      if (v44) {
        goto LABEL_30;
      }
    }
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    swift_once();
  }
LABEL_31:
  swift_release();
  uint64_t v46 = *v31;
  double v25 = *(double *)(*v31 + 16);
  swift_bridgeObjectRetain_n();
  char v47 = specialized _copyCollectionToContiguousArray<A>(_:)(v46);
  swift_bridgeObjectRelease();
  *(void *)&long long v151 = v47;
  specialized MutableCollection<>.sort(by:)((void **)&v151, specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease();
  unint64_t v9 = (char *)v151;
  double v20 = *(double **)(v151 + 16);
  uint64_t v14 = v137;
  if (v20)
  {
    MKMapRect v48 = 0;
    uint64_t v140 = OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters;
    unint64_t v139 = (*(unsigned __int8 *)(v149 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v149 + 80);
    uint64_t v49 = v151 + v139;
    uint64_t v129 = GEOPOICategoryReligiousSite;
    uint64_t v22 = (char *)_swiftEmptyArrayStorage;
    unint64_t v132 = 0x80000000000215E0;
    unint64_t v131 = (char *)&type metadata for Any + 8;
    double v50 = i / (double)*(uint64_t *)&v25;
    v136 = (char *)v151;
    v142 = v20;
    uint64_t v141 = v151 + v139;
    while (1)
    {
      if ((unint64_t)v48 >= *((void *)v9 + 2))
      {
        __break(1u);
        goto LABEL_119;
      }
      uint64_t v146 = *(void *)(v149 + 72);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v49 + v146 * (void)v48, (uint64_t)v17);
      double v25 = *((double *)v17 + 2);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v17, (uint64_t)v14);
      if (v25 >= v50)
      {
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v14);
        goto LABEL_34;
      }
      long long v151 = v153;
      uint64_t v51 = *((void *)v14 + 5);
      *(void *)&v150[0] = *((void *)v14 + 4);
      *((void *)&v150[0] + 1) = v51;
      double v20 = (double *)lazy protocol witness table accessor for type String and conformance String();
      char v52 = StringProtocol.contains<A>(_:)();
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v14);
      if (v52) {
        goto LABEL_100;
      }
      uint64_t v53 = *((void *)v17 + 5);
      *(void *)&long long v151 = *((void *)v17 + 4);
      *((void *)&v151 + 1) = v53;
      *(void *)&v150[0] = 95;
      *((void *)&v150[0] + 1) = 0xE100000000000000;
      uint64_t v54 = StringProtocol.components<A>(separatedBy:)();
      if (!*(void *)(v54 + 16)) {
        goto LABEL_122;
      }
      double v55 = (void *)v54;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        uint64_t v56 = v55[2];
        if (!v56) {
          goto LABEL_123;
        }
      }
      else
      {
        double v55 = specialized _ArrayBuffer._consumeAndCreateNew()(v55);
        uint64_t v56 = v55[2];
        if (!v56) {
          goto LABEL_123;
        }
      }
      v55[2] = v56 - 1;
      swift_bridgeObjectRelease();
      unint64_t v9 = (char *)v55[2];
      if (!v9)
      {
        swift_bridgeObjectRelease();
        unint64_t v9 = v136;
        goto LABEL_99;
      }
      swift_bridgeObjectRetain();
      uint64_t v138 = 0;
      uint64_t v145 = 0;
      uint64_t v14 = 0;
      double v20 = (double *)(v55 + 5);
      double v57 = 0.0;
      double v58 = 0.0;
      do
      {
        uint64_t v61 = *((void *)v20 - 1);
        unint64_t v62 = *(void *)v20;
        if (v61) {
          BOOL v63 = 0;
        }
        else {
          BOOL v63 = v62 == 0xE000000000000000;
        }
        if (v63) {
          goto LABEL_51;
        }
        if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
          goto LABEL_51;
        }
        swift_bridgeObjectRetain();
        uint64_t v64 = specialized FixedWidthInteger.init(_:)(v61, v62);
        if (v65) {
          goto LABEL_51;
        }
        if (v64 < 0) {
          goto LABEL_51;
        }
        uint64_t v66 = *(void *)(v144 + v140);
        if (v64 >= *(void *)(v66 + 16)) {
          goto LABEL_51;
        }
        unint64_t v67 = v143;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v66 + v139 + v64 * v146, (uint64_t)v143);
        double v69 = *v67;
        double v68 = v67[1];
        uint64_t v70 = *(int *)(v148 + 36);
        double v71 = *(void **)((char *)v67 + v70);
        if (!v71 || v138 >= 1)
        {
          swift_unknownObjectRelease();
          goto LABEL_44;
        }
        uint64_t v133 = *(int *)(v148 + 36);
        uint64_t v72 = one-time initialization token for defaults;
        id v134 = v71;
        swift_unknownObjectRetain();
        if (v72 != -1) {
          swift_once();
        }
        unint64_t v73 = (void *)static MOAngelDefaultsManager.defaults;
        if (!static MOAngelDefaultsManager.defaults)
        {
          long long v151 = 0u;
          long long v152 = 0u;
LABEL_76:
          outlined destroy of Any?((uint64_t)&v151);
          goto LABEL_77;
        }
        NSString v74 = String._bridgeToObjectiveC()();
        id v75 = [v73 objectForKey:v74];

        if (v75)
        {
          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v150, 0, sizeof(v150));
        }
        id v76 = v134;
        outlined init with take of Any?((uint64_t)v150, (uint64_t)&v151);
        if (!*((void *)&v152 + 1)) {
          goto LABEL_76;
        }
        if (swift_dynamicCast() & 1) != 0 && (v150[0])
        {
          id v77 = [v76 _poiCategory];
          if (!v77) {
            goto LABEL_79;
          }
          char v78 = v77;
          uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v128 = v80;
          if (v79 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v128 == v81)
          {

            swift_bridgeObjectRelease_n();
          }
          else
          {
            uint64_t v127 = v81;
            char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t v83 = v78;
            char v84 = v82;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v76 = v134;
            if ((v84 & 1) == 0)
            {
LABEL_79:
              unint64_t v128 = (char *)self;
              uint64_t v127 = (char *)[v76 _styleAttributes];
              id v125 = self;
              id v85 = [v125 mainScreen];
              [v85 scale];
              double v25 = v86;

              uint64_t v87 = v128;
              int64_t v88 = v127;
              id v126 = [v128 newFillColorForStyleAttributes:v127 forScale:v25];

              uint64_t v89 = v87;
              if (v126)
              {
                unint64_t v128 = v89;
                id v90 = [v134 _styleAttributes];
                id v91 = [v125 mainScreen];
                [v91 scale];
                double v25 = v92;

                id v93 = [v128 imageForStyle:v90 size:3 forScale:0 format:v25];
                if (v93)
                {

                  double v94 = *v143;
                  uint64_t v95 = *((void *)v143 + 1);
                  unint64_t v128 = (char *)*((void *)v17 + 2);
                  uint64_t v133 = *((void *)v17 + 4);
                  uint64_t v138 = *((void *)v17 + 5);
                  uint64_t v96 = (int *)v148;
                  uint64_t v97 = v130;
                  uint64_t v127 = (char *)v130 + *(int *)(v148 + 32);
                  swift_unknownObjectRetain();
                  swift_bridgeObjectRetain();
                  UUID.init()();
                  *(double *)uint64_t v97 = v94;
                  v97[1] = v95;
                  v97[2] = v128;
                  uint64_t v98 = v133;
                  v97[3] = 1;
                  v97[4] = v98;
                  v97[5] = v138;
                  *(void *)((char *)v97 + v96[9]) = v134;
                  *(void *)((char *)v97 + v96[10]) = 0;
                  char v99 = (void *)((char *)v97 + v96[11]);
                  *char v99 = 0;
                  v99[1] = 0xE000000000000000;
                  *((unsigned char *)v97 + v96[12]) = 0;
                  *((unsigned char *)v97 + v96[13]) = 1;
                  *(void *)((char *)v97 + v96[14]) = 0;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                    uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v22 + 2) + 1, 1, (unint64_t)v22);
                  }
                  double v25 = 7.0;
                  unint64_t v101 = *((void *)v22 + 2);
                  unint64_t v100 = *((void *)v22 + 3);
                  if (v101 >= v100 >> 1) {
                    uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v100 > 1, v101 + 1, 1, (unint64_t)v22);
                  }
                  *((void *)v22 + 2) = v101 + 1;
                  outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v130, (uint64_t)&v22[v139 + v101 * v146]);
                  swift_unknownObjectRelease();
                  outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v143);
                  if (v58 != 0.0) {
                    double v58 = v58 + (v58 - v69) / 7.0;
                  }
                  if (v57 != 0.0) {
                    double v57 = v57 + (v57 - v68) / 7.0;
                  }
                  uint64_t v138 = 1;
                  goto LABEL_51;
                }
              }
            }
          }
        }
LABEL_77:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        uint64_t v70 = v133;
LABEL_44:
        if (v58 == 0.0) {
          double v58 = v69;
        }
        else {
          double v58 = (v58 + v69) * 0.5;
        }
        if (v57 == 0.0) {
          double v57 = v68;
        }
        else {
          double v57 = (v57 + v68) * 0.5;
        }
        double v59 = v143;
        uint64_t v145 = *(void *)((char *)v143 + v70);
        swift_unknownObjectRetain();
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v59);
        if (__OFADD__(v14++, 1)) {
          goto LABEL_120;
        }
LABEL_51:
        v20 += 2;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      if ((uint64_t)v14 <= 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = v137;
        unint64_t v9 = v136;
      }
      else
      {
        double v25 = *((double *)v17 + 2);
        uint64_t v102 = *((void *)v17 + 5);
        uint64_t v138 = *((void *)v17 + 4);
        uint64_t v103 = (char *)v55[2];
        uint64_t v104 = v145;
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        BOOL v105 = v14 != v103;
        unint64_t v106 = (int *)v148;
        uint64_t v107 = v135;
        UUID.init()();
        *(double *)uint64_t v107 = v58;
        *(double *)(v107 + 8) = v57;
        *(double *)(v107 + 16) = v25;
        uint64_t v108 = v138;
        *(void *)(v107 + 24) = v14;
        *(void *)(v107 + 32) = v108;
        *(void *)(v107 + 40) = v102;
        *(void *)(v107 + v106[9]) = v104;
        *(void *)(v107 + v106[10]) = 0;
        id v109 = (void *)(v107 + v106[11]);
        *id v109 = 0;
        v109[1] = 0xE000000000000000;
        *(unsigned char *)(v107 + v106[12]) = 0;
        *(unsigned char *)(v107 + v106[13]) = v105;
        *(void *)(v107 + v106[14]) = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v22 + 2) + 1, 1, (unint64_t)v22);
        }
        unint64_t v111 = *((void *)v22 + 2);
        unint64_t v110 = *((void *)v22 + 3);
        uint64_t v14 = v137;
        unint64_t v9 = v136;
        if (v111 >= v110 >> 1) {
          uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v110 > 1, v111 + 1, 1, (unint64_t)v22);
        }
        *((void *)v22 + 2) = v111 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v135, (uint64_t)&v22[v139 + v111 * v146]);
      }
LABEL_99:
      uint64_t v112 = *((void *)v17 + 4);
      unint64_t v113 = (void *)*((void *)v17 + 5);
      swift_bridgeObjectRetain();
      v114._countAndFlagsBits = v112;
      v114._object = v113;
      String.append(_:)(v114);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_100:
      double v20 = v142;
      uint64_t v49 = v141;
LABEL_34:
      MKMapRect v48 = (double *)((char *)v48 + 1);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v17);
      if (v48 == v20)
      {
        swift_release();
        goto LABEL_106;
      }
    }
  }
  swift_release();
  uint64_t v22 = (char *)_swiftEmptyArrayStorage;
LABEL_106:
  p_ivar_lyt = &MOAngelLogger.ivar_lyt;
LABEL_107:
  uint64_t v115 = *(void *)((char *)p_ivar_lyt[505] + v144);
  uint64_t v116 = *(void *)(v115 + 16);
  if (v116)
  {
    unint64_t v117 = (*(unsigned __int8 *)(v149 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v149 + 80);
    uint64_t v118 = v115 + v117;
    uint64_t v119 = *(void *)(v149 + 72);
    swift_bridgeObjectRetain();
    do
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v118, (uint64_t)v4);
      long long v151 = v153;
      uint64_t v120 = *((void *)v4 + 5);
      *(void *)&v150[0] = *((void *)v4 + 4);
      *((void *)&v150[0] + 1) = v120;
      lazy protocol witness table accessor for type String and conformance String();
      if ((StringProtocol.contains<A>(_:)() & 1) == 0)
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v4, v147);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v22 + 2) + 1, 1, (unint64_t)v22);
        }
        unint64_t v122 = *((void *)v22 + 2);
        unint64_t v121 = *((void *)v22 + 3);
        if (v122 >= v121 >> 1) {
          uint64_t v22 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v121 > 1, v122 + 1, 1, (unint64_t)v22);
        }
        *((void *)v22 + 2) = v122 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v147, (uint64_t)&v22[v117 + v122 * v119]);
      }
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v4);
      v118 += v119;
      --v116;
    }
    while (v116);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t specialized FixedWidthInteger.init(_:)(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v7 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

id MOSuggestionAssetMapsClusterer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void MOSuggestionAssetMapsClusterer.init()()
{
}

id MOSuggestionAssetMapsClusterer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOSuggestionAssetMapsClusterer();
  return [super dealloc];
}

char *MOSuggestionAssetMapsClusterer.__allocating_init(coordinates:separationThreshold:)(uint64_t a1, double a2)
{
  uint64_t v5 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v6 = *((void *)v5 - 1);
  __chkstk_darwin(v5);
  char v8 = (void *)((char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v9 = (char *)(*(uint64_t (**)(void *, double))(v2 + 240))(_swiftEmptyArrayStorage, 0.5);
  uint64_t v10 = v9;
  *(double *)&v9[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold] = a2;
  int64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    double v30 = _swiftEmptyArrayStorage;
    v27[0] = v9;
    unsigned int v12 = v9;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11, 0);
    uint64_t v13 = 0;
    uint64_t v14 = v30;
    v27[1] = a1;
    uint64_t v15 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v16 = *(v15 - 1);
      uint64_t v17 = *v15;
      v27[2] = v13;
      uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v29 = v18;
      v19._countAndFlagsBits = 95;
      v19._object = (void *)0xE100000000000000;
      String.append(_:)(v19);
      uint64_t v20 = v28;
      uint64_t v21 = v29;
      UUID.init()();
      *char v8 = v16;
      v8[1] = v17;
      v8[2] = 0;
      v8[3] = 1;
      v8[4] = v20;
      v8[5] = v21;
      *(void *)((char *)v8 + v5[9]) = 0;
      *(void *)((char *)v8 + v5[10]) = 0;
      char v22 = (void *)((char *)v8 + v5[11]);
      *char v22 = 0;
      v22[1] = 0xE000000000000000;
      *((unsigned char *)v8 + v5[12]) = 0;
      *((unsigned char *)v8 + v5[13]) = 0;
      *(void *)((char *)v8 + v5[14]) = 0;
      double v30 = v14;
      unint64_t v24 = v14[2];
      unint64_t v23 = v14[3];
      if (v24 >= v23 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
        uint64_t v14 = v30;
      }
      ++v13;
      v14[2] = v24 + 1;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8, (uint64_t)v14+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v24);
      v15 += 2;
    }
    while (v11 != v13);
    swift_bridgeObjectRelease();
    uint64_t v10 = (char *)v27[0];
  }
  else
  {
    double v25 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = _swiftEmptyArrayStorage;
  }
  *(void *)&v10[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters] = v14;

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t static MOSuggestionAssetMapsClusterer.clusteredPins(locations:targetRegion:numBuckets:)(unint64_t a1, NSObject *a2, double a3, long double a4, double a5, double a6)
{
  uint64_t v11 = a1;
  unint64_t v12 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_147;
  }
  if (*(uint64_t *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) < 2)
  {
LABEL_148:
    swift_bridgeObjectRetain();
    return v11;
  }
LABEL_3:
  if ((~*(void *)&a4 & 0x7FF0000000000000) != 0 && a4 < 0.0) {
    a4 = remainder(a4, 360.0) + 360.0;
  }
  double v13 = a6 * 0.5;
  a6 = a4 - a6 * 0.5;
  double v14 = a5 * 0.5 + a3;
  a5 = a3 - a5 * 0.5;
  double v15 = vabdd_f64(a5, v14) / (double)(uint64_t)a2;
  if (v15 <= 0.0) {
    goto LABEL_148;
  }
  double v16 = vabdd_f64(a6, a4 + v13) / (double)(uint64_t)a2;
  if (v16 <= 0.0) {
    goto LABEL_148;
  }
  unint64_t v106 = &_swiftEmptyDictionarySingleton;
  if (!v12)
  {
    uint64_t v17 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_10;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    uint64_t v45 = &_swiftEmptyDictionarySingleton;
LABEL_53:
    uint64_t v105 = (uint64_t)_swiftEmptyArrayStorage;
    int64_t v88 = v45 + 8;
    uint64_t v46 = 1 << LOBYTE(v45[4].isa);
    uint64_t v47 = -1;
    if (v46 < 64) {
      uint64_t v47 = ~(-1 << v46);
    }
    unint64_t v48 = v47 & (uint64_t)v45[8].isa;
    int64_t v89 = (unint64_t)(v46 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v49 = 0;
    p_ivar_lyt = &MOAngelLogger.ivar_lyt;
    uint64_t v87 = v45;
    while (1)
    {
      if (v48)
      {
        unint64_t v51 = __clz(__rbit64(v48));
        v48 &= v48 - 1;
        unint64_t v52 = v51 | (v49 << 6);
      }
      else
      {
        int64_t v53 = v49 + 1;
        if (__OFADD__(v49, 1)) {
          goto LABEL_142;
        }
        if (v53 >= v89)
        {
LABEL_132:
          swift_release();
          uint64_t v11 = v105;
          swift_bridgeObjectRelease();
          return v11;
        }
        unint64_t isa = (unint64_t)v88[v53].isa;
        ++v49;
        if (!isa)
        {
          int64_t v49 = v53 + 1;
          if (v53 + 1 >= v89) {
            goto LABEL_132;
          }
          unint64_t isa = (unint64_t)v88[v49].isa;
          if (!isa)
          {
            int64_t v49 = v53 + 2;
            if (v53 + 2 >= v89) {
              goto LABEL_132;
            }
            unint64_t isa = (unint64_t)v88[v49].isa;
            if (!isa)
            {
              int64_t v55 = v53 + 3;
              if (v55 >= v89) {
                goto LABEL_132;
              }
              unint64_t isa = (unint64_t)v88[v55].isa;
              if (!isa)
              {
                while (1)
                {
                  int64_t v49 = v55 + 1;
                  if (__OFADD__(v55, 1)) {
                    break;
                  }
                  if (v49 >= v89) {
                    goto LABEL_132;
                  }
                  unint64_t isa = (unint64_t)v88[v49].isa;
                  ++v55;
                  if (isa) {
                    goto LABEL_72;
                  }
                }
                __break(1u);
LABEL_151:
                __break(1u);
                goto LABEL_152;
              }
              int64_t v49 = v55;
            }
          }
        }
LABEL_72:
        unint64_t v48 = (isa - 1) & isa;
        unint64_t v52 = __clz(__rbit64(isa)) + (v49 << 6);
      }
      uint64_t v56 = *((void *)v45[7].isa + v52);
      double v57 = p_ivar_lyt[266];
      swift_bridgeObjectRetain();
      if (v57 != (void *)-1) {
        swift_once();
      }
      uint64_t v58 = type metadata accessor for Logger();
      uint64_t v59 = __swift_project_value_buffer(v58, (uint64_t)static MOAngelLogger.assets);
      swift_bridgeObjectRetain_n();
      uint64_t v95 = v59;
      a2 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.debug.getter();
      unint64_t v61 = (unint64_t)v56 >> 62;
      if (os_log_type_enabled(a2, v60))
      {
        unint64_t v12 = swift_slowAlloc();
        *(_DWORD *)unint64_t v12 = 134217984;
        if (v61)
        {
          swift_bridgeObjectRetain();
          uint64_t v62 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v62 = *(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8));
        }
        swift_bridgeObjectRelease();
        *(void *)(v12 + 4) = v62;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, a2, v60, "[ClusterPins] Group Count %ld", (uint8_t *)v12, 0xCu);
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      if (v61)
      {
        if (v56 >= 0) {
          a2 = (v56 & 0xFFFFFFFFFFFFFF8);
        }
        else {
          a2 = v56;
        }
        swift_bridgeObjectRetain();
        uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v11 <= 1)
        {
          swift_bridgeObjectRetain();
          uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
LABEL_120:
          if (!v11)
          {
            swift_bridgeObjectRelease();
            continue;
          }
          if ((v56 & 0xC000000000000001) != 0)
          {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
            goto LABEL_124;
          }
          if (*(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8)))
          {
            swift_retain();
LABEL_124:
            swift_bridgeObjectRelease();
            uint64_t v83 = Logger.logObject.getter();
            os_log_type_t v84 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v83, v84))
            {
              uint64_t v11 = swift_slowAlloc();
              *(_WORD *)uint64_t v11 = 0;
              _os_log_impl(&dword_0, v83, v84, "[ClusterPins] Single location pass through", (uint8_t *)v11, 2u);
              swift_slowDealloc();
            }

            swift_retain();
            a2 = &v105;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            unint64_t v12 = *(void *)((char *)&dword_10 + (v105 & 0xFFFFFFFFFFFFFF8));
            if (v12 >= *(void *)((char *)&dword_18 + (v105 & 0xFFFFFFFFFFFFFF8)) >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            swift_release();
            continue;
          }
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          swift_bridgeObjectRetain();
          uint64_t v85 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v85 < 2) {
            goto LABEL_148;
          }
          goto LABEL_3;
        }
        uint64_t v103 = 0;
        uint64_t v104 = 0;
        swift_bridgeObjectRetain();
        uint64_t v82 = _CocoaArrayWrapper.endIndex.getter();
        if (!v82)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v12 = 0;
          p_ivar_lyt = (void **)(&MOAngelLogger + 16);
          goto LABEL_110;
        }
        uint64_t v63 = v82;
        if (v82 < 1) {
          goto LABEL_143;
        }
        uint64_t v90 = v56 & 0xFFFFFFFFFFFFFF8;
        uint64_t v91 = v11;
        unint64_t v92 = v48;
        int64_t v94 = v49;
      }
      else
      {
        uint64_t v11 = *(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8));
        if ((unint64_t)v11 <= 1) {
          goto LABEL_120;
        }
        uint64_t v90 = v56 & 0xFFFFFFFFFFFFFF8;
        unint64_t v92 = v48;
        int64_t v94 = v49;
        uint64_t v103 = 0;
        uint64_t v104 = 0;
        swift_bridgeObjectRetain();
        uint64_t v91 = v11;
        uint64_t v63 = v11;
      }
      unint64_t v64 = v56 & 0xC000000000000001;
      swift_beginAccess();
      swift_beginAccess();
      uint64_t v65 = 0;
      unint64_t v97 = 0;
      uint64_t v99 = v56;
      a5 = 0.0;
      a6 = 0.0;
      do
      {
        if (v64)
        {
          uint64_t v66 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v66 = *(void *)(v56 + 8 * v65 + 32);
          swift_retain();
        }
        a4 = (*(double (**)(void))(*(void *)v66 + 240))();
        a3 = (*(double (**)(void))(*(void *)v66 + 264))();
        unint64_t v12 = *(void *)v66 + 288;
        unint64_t v67 = *(uint64_t (**)(void))v12;
        uint64_t v68 = (*(uint64_t (**)(void))v12)();
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = (void *)v67();
          if (v70)
          {
            uint64_t v11 = (uint64_t)v70;
            id v71 = [v70 _poiCategory];
            swift_unknownObjectRelease();
            if (v71)
            {

              uint64_t v103 = v69;
              swift_unknownObjectRelease();
              unint64_t v97 = v69;
            }
            else
            {
              swift_unknownObjectRelease();
            }
            uint64_t v56 = v99;
          }
          else
          {
            swift_unknownObjectRelease();
          }
        }
        uint64_t v72 = v67();
        swift_release();
        swift_unknownObjectRelease();
        a2 = (v104 + 1);
        if (__OFADD__(v104, 1))
        {
          __break(1u);
          goto LABEL_134;
        }
        ++v65;
        a6 = a6 + a4;
        a5 = a5 + a3;
        ++v104;
      }
      while (v63 != v65);
      swift_bridgeObjectRelease();
      unint64_t v48 = v92;
      int64_t v49 = v94;
      if (v97)
      {
        p_ivar_lyt = (void **)(&MOAngelLogger + 16);
        if ((uint64_t)a2 > 0) {
          goto LABEL_100;
        }
LABEL_109:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        uint64_t v45 = v87;
        unint64_t v12 = v97;
        goto LABEL_110;
      }
      p_ivar_lyt = (void **)(&MOAngelLogger + 16);
      if (v72)
      {
        uint64_t v11 = v103;
        uint64_t v103 = v72;
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        unint64_t v97 = v72;
      }
      if ((uint64_t)a2 <= 0) {
        goto LABEL_109;
      }
LABEL_100:
      a2 = v95;
      unint64_t v73 = Logger.logObject.getter();
      os_log_type_t v74 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        *(_DWORD *)uint64_t v75 = 134218242;
        uint64_t v101 = v104;
        uint64_t v102 = v76;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v75 + 12) = 2080;
        uint64_t v101 = v103;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOMapItem?);
        uint64_t v77 = Optional.debugDescription.getter();
        a2 = v78;
        uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v78, &v102);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v73, v74, "[ClusterPins] Conslidating %ld locations into a single pin, mapItem:%s", (uint8_t *)v75, 0x16u);
        swift_arrayDestroy();
        p_ivar_lyt = (void **)(&MOAngelLogger + 16);
        swift_slowDealloc();
        swift_slowDealloc();
      }

      unint64_t v12 = v103;
      uint64_t v79 = v104;
      uint64_t v11 = v99;
      if (v64)
      {
        swift_unknownObjectRetain();
        uint64_t v80 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)(v90 + 16)) {
          goto LABEL_145;
        }
        uint64_t v80 = *(void *)(v99 + 32);
        swift_unknownObjectRetain();
        swift_retain();
      }
      uint64_t v81 = swift_bridgeObjectRelease();
      a4 = a6 / (double)v79;
      a3 = a5 / (double)v91;
      a5 = (*(double (**)(uint64_t))(*(void *)v80 + 360))(v81);
      swift_release();
      type metadata accessor for MOMapLocation();
      swift_allocObject();
      MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(0, 0xE000000000000000, v79, 0, v12, 0, 0, 0, a4, a3, a5, 0.0, 0, 0, 0xE000000000000000);
      a2 = &v105;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((char *)&dword_10 + (v105 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (v105 & 0xFFFFFFFFFFFFFF8)) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_unknownObjectRelease();
      uint64_t v45 = v87;
LABEL_110:
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
  if (!v17) {
    goto LABEL_52;
  }
LABEL_10:
  uint64_t v96 = (uint64_t)&a2->isa + 1;
  if (__OFADD__(a2, 1)) {
    goto LABEL_151;
  }
  if (v17 >= 1)
  {
    unint64_t v12 = 0;
    unint64_t v98 = v11 & 0xC000000000000001;
    uint64_t v93 = v17;
    do
    {
      if (v98)
      {
        uint64_t v19 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v19 = *(void *)(v11 + 8 * v12 + 32);
        swift_retain();
      }
      a2 = v19;
      a4 = (*(double (**)(void))(*(void *)v19 + 240))();
      long double v20 = (*(double (**)(void))(*(void *)v19 + 264))();
      if (v20 < 0.0 && (*(void *)&v20 & 0x7FF0000000000000) != 0x7FF0000000000000)
      {
        a3 = 360.0;
        long double v20 = remainder(v20, 360.0) + 360.0;
      }
      double v22 = (a4 - a5) / v15;
      if (v22 <= -9.22337204e18)
      {
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
        goto LABEL_144;
      }
      if (v22 >= 9.22337204e18) {
        goto LABEL_135;
      }
      double v23 = (v20 - a6) / v16;
      if ((*(void *)&v22 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(void *)&v23 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_136;
      }
      if (v23 <= -9.22337204e18) {
        goto LABEL_137;
      }
      if (v23 >= 9.22337204e18) {
        goto LABEL_138;
      }
      uint64_t v25 = (uint64_t)v23 * v96;
      if ((unsigned __int128)((uint64_t)v23 * (__int128)v96) >> 64 != v25 >> 63) {
        goto LABEL_139;
      }
      uint64_t v26 = (uint64_t)v22 + v25;
      if (__OFADD__((uint64_t)v22, v25)) {
        goto LABEL_140;
      }
      unint64_t v27 = v106;
      if (v106[2].isa && (specialized __RawDictionaryStorage.find<A>(_:)(v26), (v28 & 1) != 0))
      {
        a2 = &v106;
        double v30 = specialized Dictionary.subscript.modify(v100, v26);
        if (v29->isa)
        {
          a2 = v29;
          swift_retain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((char *)&dword_10 + ((uint64_t)a2->isa & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((uint64_t)a2->isa & 0xFFFFFFFFFFFFFF8)) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          ((void (*)(void *, void))v30)(v100, 0);
          swift_release();
        }
        else
        {
          ((void (*)(void *, void))v30)(v100, 0);
          swift_release();
        }
      }
      else
      {
        uint64_t v31 = v11;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_1D460;
        *(void *)(v32 + 32) = v19;
        v100[0] = v32;
        specialized Array._endMutation()();
        uint64_t v11 = v100[0];
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v100[0] = v27;
        a2 = v27;
        unint64_t v35 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
        Class v36 = v27[2].isa;
        BOOL v37 = (v34 & 1) == 0;
        uint64_t v38 = (uint64_t)v36 + v37;
        if (__OFADD__(v36, v37)) {
          goto LABEL_141;
        }
        char v39 = v34;
        if ((uint64_t)v27[3].isa >= v38)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            specialized _NativeDictionary.copy()();
          }
        }
        else
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v38, isUniquelyReferenced_nonNull_native);
          unint64_t v40 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
          if ((v39 & 1) != (v41 & 1)) {
            goto LABEL_153;
          }
          unint64_t v35 = v40;
        }
        a2 = v100[0];
        if (v39)
        {
          uint64_t v18 = *(void *)(v100[0] + 56);
          swift_bridgeObjectRelease();
          *(void *)(v18 + 8 * v35) = v11;
        }
        else
        {
          *(void *)(v100[0] + 8 * (v35 >> 6) + 64) |= 1 << v35;
          *((void *)a2[6].isa + v35) = v26;
          *((void *)a2[7].isa + v35) = v11;
          Class v42 = a2[2].isa;
          BOOL v43 = __OFADD__(v42, 1);
          unint64_t v44 = (Class)((char *)v42 + 1);
          if (v43) {
            goto LABEL_146;
          }
          a2[2].unint64_t isa = v44;
        }
        unint64_t v106 = a2;
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v11 = v31;
        uint64_t v17 = v93;
      }
      ++v12;
    }
    while (v17 != v12);
    swift_bridgeObjectRelease();
    uint64_t v45 = v106;
    goto LABEL_53;
  }
LABEL_152:
  __break(1u);
LABEL_153:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

__C::CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.comparable()()
{
  double v2 = v0;
  if (v1 < 0.0 && (*(void *)&v1 & 0x7FF0000000000000) != 0x7FF0000000000000) {
    Swift::Double v1 = remainder(v1, 360.0) + 360.0;
  }
  double v4 = v2;
  result.longitude = v1;
  result.double latitude = v4;
  return result;
}

void (*specialized Dictionary.subscript.modify(void *a1, uint64_t a2))(void *a1)
{
  double v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized Dictionary._Variant.subscript.modify(v4, a2);
  return Dictionary.subscript.modifyspecialized ;
}

void Dictionary.subscript.modifyspecialized (void *a1)
{
  Swift::Double v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

void *specialized Array.init(repeating:count:)(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __C::CLLocationCoordinate2D result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (!a1) {
    return _swiftEmptyArrayStorage;
  }
  __C::CLLocationCoordinate2D result = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
  result[2] = a1;
  double v4 = (double *)(result + 4);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  char v8 = (int64x2_t *)(result + 6);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *char v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

void *specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    __C::CLLocationCoordinate2D result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      double v4 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      unint64_t v5 = v4;
      _OWORD v4[2] = a2;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        uint64_t v6 = a2 - 2;
        if (v6)
        {
          int64x2_t v7 = v4 + 6;
          do
          {
            *v7++ = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
    return v5;
  }
  return result;
}

Swift::Bool __swiftcall MOSuggestionAssetMapsClusterer.isInLowerHalf(distanceMatrix:pair:)(Swift::OpaquePointer *distanceMatrix, Swift::tuple_Int_Int pair)
{
  Swift::Int v2 = *((void *)distanceMatrix->_rawValue + 2);
  BOOL v3 = (unint64_t)v2 > 1;
  if (pair._0 < 0) {
    BOOL v3 = 0;
  }
  if (pair._1 < 0) {
    BOOL v3 = 0;
  }
  if (v2 <= pair._0) {
    BOOL v3 = 0;
  }
  Swift::Bool v4 = v2 > pair._1 && v3;
  if (pair._0 <= 0) {
    Swift::Bool v4 = 0;
  }
  return pair._1 < pair._0 && v4;
}

Swift::Void __swiftcall MOSuggestionAssetMapsClusterer.printDendogram()()
{
  Swift::Double v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain_n();
  BOOL v3 = specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease();
  Swift::Bool v4 = v3;
  specialized MutableCollection<>.sort(by:)(&v4, specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease();
  specialized MOSuggestionAssetMapsClusterer.printClusters(_:)((uint64_t)v4);
  swift_release();
}

__C::CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.normalized()()
{
  v2.i64[0] = v1;
  double v3 = *(double *)v0.i64;
  v0.i64[0] = 0x4076800000000000;
  v4.f64[0] = NAN;
  v4.f64[1] = NAN;
  double v5 = remainder(*(long double *)v2.i64, *(long double *)vbslq_s8((int8x16_t)vnegq_f64(v4), v0, v2).i64);
  double v6 = v3;
  result.longitude = v5;
  result.double latitude = v6;
  return result;
}

uint64_t static FloatingPoint.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v6 = *(void *)(a3 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  dispatch thunk of static Numeric.* infix(_:_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a3);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double>);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      double v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[Double]>);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      double v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      double v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    double v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v10 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  double v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v3 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (void *)_swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      _OWORD v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      uint64_t v9 = specialized Sequence._copySequenceContents(initializing:)(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      outlined consume of Set<MOSuggestionAssetMapsClusterer.Cluster>.Iterator._Variant();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::Int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  Hasher.init(_seed:)();
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v10 = Hasher._finalize()();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    BOOL v19 = v2;
    uint64_t v20 = a2;
    uint64_t v21 = a1;
    uint64_t v13 = ~v11;
    uint64_t v14 = *(void *)(v22 + 72);
    while (1)
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v9 + 48) + v14 * v12, (uint64_t)v8);
      char v15 = static UUID.== infix(_:_:)();
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8);
      if (v15) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
      if (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a2 = v20;
        a1 = v21;
        uint64_t v3 = v19;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v20);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(*v19 + 48) + v14 * v12, v21);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v8);
    uint64_t v23 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v23;
    swift_bridgeObjectRelease();
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(a2, a1);
    return 1;
  }
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    double v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  double v33 = *(void *)(v2 - 8);
  char v34 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)();
  unint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    double v30 = v0;
    int64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v32 = (void *)(v5 + 56);
    if (v8 < 64) {
      Swift::Int v10 = ~(-1 << v8);
    }
    else {
      Swift::Int v10 = -1;
    }
    int64_t v11 = v10 & v9;
    uint64_t v31 = (unint64_t)(v8 + 63) >> 6;
    unint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    unint64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        int64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v31) {
          goto LABEL_33;
        }
        BOOL v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          unint64_t v14 = v18 + 1;
          if (v18 + 1 >= v31) {
            goto LABEL_33;
          }
          BOOL v19 = v32[v14];
          if (!v19)
          {
            unint64_t v14 = v18 + 2;
            if (v18 + 2 >= v31) {
              goto LABEL_33;
            }
            BOOL v19 = v32[v14];
            if (!v19)
            {
              uint64_t v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 > 63) {
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  char *v32 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              BOOL v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  unint64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v31) {
                    goto LABEL_33;
                  }
                  BOOL v19 = v32[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              unint64_t v14 = v20;
            }
          }
        }
LABEL_23:
        int64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v33 + 72);
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4);
      Hasher.init(_seed:)();
      type metadata accessor for UUID();
      lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, (void (*)(uint64_t))&type metadata accessor for UUID);
      dispatch thunk of Hashable.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v7 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  BOOL v27 = v3;
  uint64_t v28 = a1;
  if (v12 > v11 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v13 = v8;
    goto LABEL_14;
  }
  if (a3)
  {
    specialized _NativeSet.resize(capacity:)();
    goto LABEL_8;
  }
  if (v12 <= v11)
  {
    specialized _NativeSet.copyAndResize(capacity:)();
LABEL_8:
    uint64_t v14 = *v3;
    Hasher.init(_seed:)();
    type metadata accessor for UUID();
    lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, (void (*)(uint64_t))&type metadata accessor for UUID);
    dispatch thunk of Hashable.hash(into:)();
    Swift::Int v15 = Hasher._finalize()();
    uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
    a2 = v15 & ~v16;
    if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v17 = ~v16;
      uint64_t v13 = v8;
      uint64_t v18 = *(void *)(v8 + 72);
      while (1)
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v14 + 48) + v18 * a2, (uint64_t)v10);
        char v19 = static UUID.== infix(_:_:)();
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
        if (v19) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v13 = v8;
  specialized _NativeSet.copy()();
LABEL_14:
  uint64_t v20 = v28;
  uint64_t v21 = *v27;
  *(void *)(*v27 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v20, *(void *)(v21 + 48) + *(void *)(v13 + 72) * a2);
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (!v24)
  {
    *(void *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    char v19 = (void *)(*(void *)(v4 + 48) + v16);
    *char v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v6 = *v0;
  unint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  uint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  unint64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  int64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  unint64_t v14 = -1;
  if (v13 < 64) {
    unint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  uint64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      uint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      unint64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        unint64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    uint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    char v19 = *(void *)(v3 + 72) * v18;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v6 + 48) + v19, (uint64_t)v5);
    uint64_t result = (void *)outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v5, *(void *)(v8 + 48) + v19);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16) {
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    unint64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    unint64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v32 = *(void *)(v2 - 8);
  double v33 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  unint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  int64_t v29 = v0;
  double v30 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  int64_t v11 = v10 & v9;
  uint64_t v31 = (unint64_t)(v8 + 63) >> 6;
  unint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  unint64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      int64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31) {
      goto LABEL_33;
    }
    char v19 = *(void *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      unint64_t v14 = v18 + 1;
      if (v18 + 1 >= v31) {
        goto LABEL_33;
      }
      char v19 = *(void *)(v30 + 8 * v14);
      if (!v19)
      {
        unint64_t v14 = v18 + 2;
        if (v18 + 2 >= v31) {
          goto LABEL_33;
        }
        char v19 = *(void *)(v30 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    int64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v32 + 72);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4);
    Hasher.init(_seed:)();
    type metadata accessor for UUID();
    lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type UUID and conformance UUID, (void (*)(uint64_t))&type metadata accessor for UUID);
    dispatch thunk of Hashable.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21);
    ++*(void *)(v7 + 16);
  }
  uint64_t v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v29;
    goto LABEL_35;
  }
  char v19 = *(void *)(v30 + 8 * v20);
  if (v19)
  {
    unint64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    unint64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_33;
    }
    char v19 = *(void *)(v30 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CLLocationCoordinate2D>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  uint64_t v10 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t specialized MutableCollection<>.sort(by:)(void **a1, uint64_t (*a2)(void *))
{
  uint64_t v4 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  uint64_t v5 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v5);
  }
  uint64_t v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  uint64_t result = a2(v8);
  *a1 = v5;
  return result;
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = static String._copying(_:)();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (double i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  int64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0),
          unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4), swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t specialized Collection.count.getter(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v129 = *(void *)(v4 - 8);
  uint64_t v130 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v126 = (uint64_t)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v135 = (uint64_t)&v120 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v133 = (uint64_t)&v120 - v10;
  __chkstk_darwin(v9);
  uint64_t v132 = (uint64_t)&v120 - v11;
  Swift::Int v12 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v12);
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_142;
    }
    if (v12) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_150;
  }
  Swift::Int v123 = result;
  if (v12 < 2)
  {
    unint64_t v18 = _swiftEmptyArrayStorage;
    unint64_t v128 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v129 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80));
    if (v12 != 1)
    {
      unint64_t v21 = _swiftEmptyArrayStorage[2];
      char v20 = (char *)_swiftEmptyArrayStorage;
LABEL_107:
      unint64_t v122 = v18;
      if (v21 >= 2)
      {
        uint64_t v114 = *a1;
        do
        {
          unint64_t v115 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_137;
          }
          if (!v114) {
            goto LABEL_149;
          }
          uint64_t v116 = *(void *)&v20[16 * v115 + 32];
          uint64_t v117 = *(void *)&v20[16 * v21 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v114 + *(void *)(v129 + 72) * v116, v114 + *(void *)(v129 + 72) * *(void *)&v20[16 * v21 + 16], v114 + *(void *)(v129 + 72) * v117, v128);
          if (v2) {
            break;
          }
          if (v117 < v116) {
            goto LABEL_138;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v20 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v20);
          }
          if (v115 >= *((void *)v20 + 2)) {
            goto LABEL_139;
          }
          uint64_t v118 = &v20[16 * v115 + 32];
          *(void *)uint64_t v118 = v116;
          *((void *)v118 + 1) = v117;
          unint64_t v119 = *((void *)v20 + 2);
          if (v21 > v119) {
            goto LABEL_140;
          }
          memmove(&v20[16 * v21 + 16], &v20[16 * v21 + 32], 16 * (v119 - v21));
          *((void *)v20 + 2) = v119 - 1;
          unint64_t v21 = v119 - 1;
        }
        while (v119 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      v122[2] = 0;
      return swift_bridgeObjectRelease();
    }
    unint64_t v122 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v15 = v14 >> 1;
    uint64_t v16 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(unsigned __int8 *)(v129 + 80);
    unint64_t v122 = (void *)v16;
    unint64_t v128 = v16 + ((v17 + 32) & ~v17);
  }
  uint64_t v19 = 0;
  char v20 = (char *)_swiftEmptyArrayStorage;
  id v134 = a1;
  while (1)
  {
    uint64_t v22 = v19;
    uint64_t v23 = v19 + 1;
    if (v19 + 1 >= v12)
    {
      Swift::Int v32 = v19 + 1;
    }
    else
    {
      uint64_t v24 = *a1;
      uint64_t v25 = v19;
      uint64_t v127 = v19;
      uint64_t v26 = *(void *)(v129 + 72);
      uint64_t v27 = v132;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v24 + v26 * v23, v132);
      uint64_t v28 = v24 + v26 * v25;
      uint64_t v29 = v133;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v28, v133);
      double v30 = *(double *)(v27 + 16);
      double v31 = *(double *)(v29 + 16);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v29);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v27);
      Swift::Int v32 = v127 + 2;
      uint64_t v124 = v24;
      uint64_t v136 = v26;
      if (v127 + 2 >= v12)
      {
        uint64_t v40 = v26;
        uint64_t v22 = v127;
        if (v31 >= v30) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v125 = v2;
        Swift::Int v131 = v26 * v23;
        uint64_t v33 = v24;
        Swift::Int v34 = v127 + 2;
        uint64_t v35 = v26 * (v127 + 2);
        while (1)
        {
          Swift::Int v36 = v12;
          uint64_t v37 = v132;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v35, v132);
          uint64_t v38 = v133;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v131, v133);
          BOOL v39 = *(double *)(v38 + 16) >= *(double *)(v37 + 16);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v38);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v37);
          if (v31 < v30 == v39) {
            break;
          }
          uint64_t v40 = v136;
          v33 += v136;
          ++v34;
          Swift::Int v12 = v36;
          if (v36 == v34)
          {
            Swift::Int v32 = v36;
            a1 = v134;
            uint64_t v2 = v125;
            uint64_t v22 = v127;
            if (v31 < v30) {
              goto LABEL_27;
            }
            goto LABEL_40;
          }
        }
        a1 = v134;
        Swift::Int v32 = v34;
        uint64_t v2 = v125;
        uint64_t v22 = v127;
        Swift::Int v12 = v36;
        uint64_t v40 = v136;
        if (v31 >= v30) {
          goto LABEL_40;
        }
      }
LABEL_27:
      if (v32 < v22) {
        goto LABEL_143;
      }
      if (v22 < v32)
      {
        Swift::Int v131 = v12;
        unint64_t v121 = v20;
        uint64_t v41 = 0;
        uint64_t v42 = v40 * (v32 - 1);
        Swift::Int v43 = v32 * v40;
        uint64_t v44 = v22 * v40;
        do
        {
          if (v22 != v32 + v41 - 1)
          {
            uint64_t v125 = v2;
            uint64_t v45 = v124;
            if (!v124) {
              goto LABEL_148;
            }
            unint64_t v46 = v124 + v44;
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v124 + v44, v126);
            if (v44 < v42 || v46 >= v45 + v43)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v44 != v42)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v126, v45 + v42);
            a1 = v134;
            uint64_t v2 = v125;
            uint64_t v40 = v136;
          }
          ++v22;
          --v41;
          v42 -= v40;
          v43 -= v40;
          v44 += v40;
        }
        while (v22 < v32 + v41);
        char v20 = v121;
        uint64_t v22 = v127;
        Swift::Int v12 = v131;
      }
    }
LABEL_40:
    if (v32 < v12)
    {
      if (__OFSUB__(v32, v22)) {
        goto LABEL_141;
      }
      if (v32 - v22 < v123) {
        break;
      }
    }
LABEL_58:
    if (v32 < v22) {
      goto LABEL_136;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v136 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      char v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v20 + 2) + 1, 1, v20);
    }
    unint64_t v63 = *((void *)v20 + 2);
    unint64_t v62 = *((void *)v20 + 3);
    unint64_t v21 = v63 + 1;
    if (v63 >= v62 >> 1) {
      char v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v62 > 1), v63 + 1, 1, v20);
    }
    *((void *)v20 + 2) = v21;
    unint64_t v64 = v20 + 32;
    uint64_t v65 = &v20[16 * v63 + 32];
    uint64_t v66 = v136;
    *(void *)uint64_t v65 = v22;
    *((void *)v65 + 1) = v66;
    if (v63)
    {
      while (1)
      {
        unint64_t v67 = v21 - 1;
        if (v21 >= 4)
        {
          uint64_t v72 = &v64[16 * v21];
          uint64_t v73 = *((void *)v72 - 8);
          uint64_t v74 = *((void *)v72 - 7);
          BOOL v78 = __OFSUB__(v74, v73);
          uint64_t v75 = v74 - v73;
          if (v78) {
            goto LABEL_125;
          }
          uint64_t v77 = *((void *)v72 - 6);
          uint64_t v76 = *((void *)v72 - 5);
          BOOL v78 = __OFSUB__(v76, v77);
          uint64_t v70 = v76 - v77;
          char v71 = v78;
          if (v78) {
            goto LABEL_126;
          }
          unint64_t v79 = v21 - 2;
          uint64_t v80 = &v64[16 * v21 - 32];
          uint64_t v82 = *(void *)v80;
          uint64_t v81 = *((void *)v80 + 1);
          BOOL v78 = __OFSUB__(v81, v82);
          uint64_t v83 = v81 - v82;
          if (v78) {
            goto LABEL_128;
          }
          BOOL v78 = __OFADD__(v70, v83);
          uint64_t v84 = v70 + v83;
          if (v78) {
            goto LABEL_131;
          }
          if (v84 >= v75)
          {
            uint64_t v102 = &v64[16 * v67];
            uint64_t v104 = *(void *)v102;
            uint64_t v103 = *((void *)v102 + 1);
            BOOL v78 = __OFSUB__(v103, v104);
            uint64_t v105 = v103 - v104;
            if (v78) {
              goto LABEL_135;
            }
            BOOL v95 = v70 < v105;
            goto LABEL_95;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v96 = *((void *)v20 + 4);
            uint64_t v97 = *((void *)v20 + 5);
            BOOL v78 = __OFSUB__(v97, v96);
            uint64_t v89 = v97 - v96;
            char v90 = v78;
            goto LABEL_89;
          }
          uint64_t v69 = *((void *)v20 + 4);
          uint64_t v68 = *((void *)v20 + 5);
          BOOL v78 = __OFSUB__(v68, v69);
          uint64_t v70 = v68 - v69;
          char v71 = v78;
        }
        if (v71) {
          goto LABEL_127;
        }
        unint64_t v79 = v21 - 2;
        uint64_t v85 = &v64[16 * v21 - 32];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v88 = __OFSUB__(v86, v87);
        uint64_t v89 = v86 - v87;
        char v90 = v88;
        if (v88) {
          goto LABEL_130;
        }
        uint64_t v91 = &v64[16 * v67];
        uint64_t v93 = *(void *)v91;
        uint64_t v92 = *((void *)v91 + 1);
        BOOL v78 = __OFSUB__(v92, v93);
        uint64_t v94 = v92 - v93;
        if (v78) {
          goto LABEL_133;
        }
        if (__OFADD__(v89, v94)) {
          goto LABEL_134;
        }
        if (v89 + v94 >= v70)
        {
          BOOL v95 = v70 < v94;
LABEL_95:
          if (v95) {
            unint64_t v67 = v79;
          }
          goto LABEL_97;
        }
LABEL_89:
        if (v90) {
          goto LABEL_129;
        }
        unint64_t v98 = &v64[16 * v67];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v78 = __OFSUB__(v99, v100);
        uint64_t v101 = v99 - v100;
        if (v78) {
          goto LABEL_132;
        }
        if (v101 < v89) {
          goto LABEL_15;
        }
LABEL_97:
        unint64_t v106 = v67 - 1;
        if (v67 - 1 >= v21)
        {
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
          goto LABEL_145;
        }
        uint64_t v107 = *a1;
        if (!*a1) {
          goto LABEL_147;
        }
        uint64_t v108 = v20;
        id v109 = &v64[16 * v106];
        uint64_t v110 = *(void *)v109;
        unint64_t v111 = &v64[16 * v67];
        uint64_t v112 = *((void *)v111 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v107 + *(void *)(v129 + 72) * *(void *)v109, v107 + *(void *)(v129 + 72) * *(void *)v111, v107 + *(void *)(v129 + 72) * v112, v128);
        if (v2) {
          goto LABEL_118;
        }
        if (v112 < v110) {
          goto LABEL_122;
        }
        if (v67 > *((void *)v108 + 2)) {
          goto LABEL_123;
        }
        *(void *)id v109 = v110;
        *(void *)&v64[16 * v106 + 8] = v112;
        unint64_t v113 = *((void *)v108 + 2);
        if (v67 >= v113) {
          goto LABEL_124;
        }
        char v20 = v108;
        unint64_t v21 = v113 - 1;
        memmove(&v64[16 * v67], v111 + 16, 16 * (v113 - 1 - v67));
        *((void *)v108 + 2) = v113 - 1;
        a1 = v134;
        if (v113 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v21 = 1;
LABEL_15:
    Swift::Int v12 = a1[1];
    uint64_t v19 = v136;
    if (v136 >= v12)
    {
      unint64_t v18 = v122;
      goto LABEL_107;
    }
  }
  if (__OFADD__(v22, v123)) {
    goto LABEL_144;
  }
  if (v22 + v123 >= v12) {
    Swift::Int v47 = v12;
  }
  else {
    Swift::Int v47 = v22 + v123;
  }
  if (v47 >= v22)
  {
    if (v32 != v47)
    {
      uint64_t v127 = v22;
      unint64_t v121 = v20;
      uint64_t v124 = v47;
      uint64_t v125 = v2;
      Swift::Int v48 = *(void *)(v129 + 72);
      uint64_t v136 = v48 * (v32 - 1);
      Swift::Int v131 = v48;
      Swift::Int v49 = v32 * v48;
      do
      {
        uint64_t v50 = 0;
        uint64_t v51 = v127;
        while (1)
        {
          Swift::Int v52 = v32;
          uint64_t v53 = *a1;
          uint64_t v54 = v132;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v49 + v50 + *a1, v132);
          uint64_t v55 = v136 + v50 + v53;
          uint64_t v56 = v133;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v55, v133);
          double v57 = *(double *)(v54 + 16);
          double v58 = *(double *)(v56 + 16);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v56);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v54);
          if (v58 >= v57) {
            break;
          }
          uint64_t v59 = *a1;
          if (!*a1) {
            goto LABEL_146;
          }
          uint64_t v60 = v59 + v136 + v50;
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v59 + v49 + v50, v135);
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v135, v60);
          v50 -= v131;
          ++v51;
          Swift::Int v32 = v52;
          a1 = v134;
          if (v52 == v51) {
            goto LABEL_51;
          }
        }
        Swift::Int v32 = v52;
LABEL_51:
        ++v32;
        v136 += v131;
        v49 += v131;
      }
      while (v32 != v124);
      Swift::Int v32 = v124;
      uint64_t v2 = v125;
      char v20 = v121;
      uint64_t v22 = v127;
    }
    goto LABEL_58;
  }
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v132 = *(void *)(v4 - 8);
  uint64_t v133 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v129 = (uint64_t)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v139 = (uint64_t)&v123 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v136 = (uint64_t)&v123 - v10;
  __chkstk_darwin(v9);
  uint64_t v135 = (uint64_t)&v123 - v11;
  Swift::Int v12 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v12);
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_142;
    }
    if (v12) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_150;
  }
  Swift::Int v125 = result;
  if (v12 < 2)
  {
    unint64_t v18 = (char *)_swiftEmptyArrayStorage;
    unint64_t v131 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v132 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v132 + 80));
    uint64_t v124 = _swiftEmptyArrayStorage;
    if (v12 != 1)
    {
      unint64_t v20 = _swiftEmptyArrayStorage[2];
LABEL_108:
      if (v20 >= 2)
      {
        uint64_t v117 = *a1;
        do
        {
          unint64_t v118 = v20 - 2;
          if (v20 < 2) {
            goto LABEL_137;
          }
          if (!v117) {
            goto LABEL_149;
          }
          uint64_t v119 = *(void *)&v18[16 * v118 + 32];
          uint64_t v120 = *(void *)&v18[16 * v20 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v117 + *(void *)(v132 + 72) * v119, v117 + *(void *)(v132 + 72) * *(void *)&v18[16 * v20 + 16], v117 + *(void *)(v132 + 72) * v120, v131);
          if (v2) {
            break;
          }
          if (v120 < v119) {
            goto LABEL_138;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v18);
          }
          if (v118 >= *((void *)v18 + 2)) {
            goto LABEL_139;
          }
          unint64_t v121 = &v18[16 * v118 + 32];
          *(void *)unint64_t v121 = v119;
          *((void *)v121 + 1) = v120;
          unint64_t v122 = *((void *)v18 + 2);
          if (v20 > v122) {
            goto LABEL_140;
          }
          memmove(&v18[16 * v20 + 16], &v18[16 * v20 + 32], 16 * (v122 - v20));
          *((void *)v18 + 2) = v122 - 1;
          unint64_t v20 = v122 - 1;
        }
        while (v122 > 2);
      }
LABEL_119:
      swift_bridgeObjectRelease();
      v124[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v15 = v14 >> 1;
    uint64_t v16 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(unsigned __int8 *)(v132 + 80);
    uint64_t v124 = (void *)v16;
    unint64_t v131 = v16 + ((v17 + 32) & ~v17);
  }
  Swift::Int v19 = 0;
  unint64_t v18 = (char *)_swiftEmptyArrayStorage;
  uint64_t v138 = a1;
  while (1)
  {
    Swift::Int v21 = v19;
    Swift::Int v22 = v19 + 1;
    if (v19 + 1 >= v12) {
      goto LABEL_39;
    }
    uint64_t v127 = v2;
    uint64_t v23 = *a1;
    uint64_t v24 = *(void *)(v132 + 72);
    uint64_t v25 = v135;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*a1 + v24 * v22, v135);
    uint64_t v26 = v23 + v24 * v21;
    Swift::Int v130 = v21;
    uint64_t v27 = v136;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v26, v136);
    Swift::Int v140 = *(void *)(v25 + 24);
    Swift::Int v137 = *(void *)(v27 + 24);
    uint64_t v28 = v27;
    Swift::Int v21 = v130;
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v28);
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v25);
    Swift::Int v29 = v21 + 2;
    uint64_t v134 = v23;
    uint64_t v141 = v24;
    if (v21 + 2 >= v12)
    {
      Swift::Int v32 = v21 + 2;
      uint64_t v39 = v24;
    }
    else
    {
      uint64_t v126 = v18;
      Swift::Int v30 = v24 * v22;
      uint64_t v31 = v23;
      Swift::Int v32 = v29;
      uint64_t v33 = v24 * v29;
      while (1)
      {
        Swift::Int v34 = v12;
        int v35 = v140 < v137;
        uint64_t v36 = v135;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v31 + v33, v135);
        uint64_t v37 = v136;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v31 + v30, v136);
        int v38 = *(void *)(v36 + 24) >= *(void *)(v37 + 24);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v37);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v36);
        if (v35 == v38) {
          break;
        }
        uint64_t v39 = v141;
        v31 += v141;
        ++v32;
        Swift::Int v12 = v34;
        if (v34 == v32)
        {
          Swift::Int v32 = v34;
          a1 = v138;
          unint64_t v18 = v126;
          Swift::Int v21 = v130;
          goto LABEL_23;
        }
      }
      a1 = v138;
      unint64_t v18 = v126;
      Swift::Int v21 = v130;
      Swift::Int v12 = v34;
      uint64_t v39 = v141;
    }
LABEL_23:
    if (v140 >= v137) {
      break;
    }
    if (v32 < v21) {
      goto LABEL_143;
    }
    Swift::Int v22 = v32;
    if (v21 >= v32)
    {
      uint64_t v2 = v127;
LABEL_39:
      if (v22 >= v12) {
        goto LABEL_59;
      }
      goto LABEL_40;
    }
    Swift::Int v140 = v12;
    uint64_t v126 = v18;
    uint64_t v40 = 0;
    uint64_t v41 = v39 * (v32 - 1);
    Swift::Int v42 = v32 * v39;
    uint64_t v43 = v21 * v39;
    do
    {
      if (v21 != v22 + v40 - 1)
      {
        uint64_t v44 = v134;
        if (!v134) {
          goto LABEL_148;
        }
        unint64_t v45 = v134 + v43;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v134 + v43, v129);
        if (v43 < v41 || v45 >= v44 + v42)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v43 != v41)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v129, v44 + v41);
        Swift::Int v22 = v32;
        uint64_t v39 = v141;
      }
      ++v21;
      --v40;
      v41 -= v39;
      v42 -= v39;
      v43 += v39;
    }
    while (v21 < v22 + v40);
    a1 = v138;
    unint64_t v18 = v126;
    uint64_t v2 = v127;
    Swift::Int v21 = v130;
    Swift::Int v12 = v140;
    if (v22 < v140) {
      goto LABEL_40;
    }
LABEL_59:
    if (v22 < v21) {
      goto LABEL_136;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v137 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v18 + 2) + 1, 1, v18);
    }
    unint64_t v66 = *((void *)v18 + 2);
    unint64_t v65 = *((void *)v18 + 3);
    unint64_t v20 = v66 + 1;
    if (v66 >= v65 >> 1) {
      unint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v65 > 1), v66 + 1, 1, v18);
    }
    *((void *)v18 + 2) = v20;
    unint64_t v67 = v18 + 32;
    uint64_t v68 = &v18[16 * v66 + 32];
    Swift::Int v69 = v137;
    *(void *)uint64_t v68 = v21;
    *((void *)v68 + 1) = v69;
    if (v66)
    {
      while (1)
      {
        unint64_t v70 = v20 - 1;
        if (v20 >= 4)
        {
          uint64_t v75 = &v67[16 * v20];
          uint64_t v76 = *((void *)v75 - 8);
          uint64_t v77 = *((void *)v75 - 7);
          BOOL v81 = __OFSUB__(v77, v76);
          uint64_t v78 = v77 - v76;
          if (v81) {
            goto LABEL_125;
          }
          uint64_t v80 = *((void *)v75 - 6);
          uint64_t v79 = *((void *)v75 - 5);
          BOOL v81 = __OFSUB__(v79, v80);
          uint64_t v73 = v79 - v80;
          char v74 = v81;
          if (v81) {
            goto LABEL_126;
          }
          unint64_t v82 = v20 - 2;
          uint64_t v83 = &v67[16 * v20 - 32];
          uint64_t v85 = *(void *)v83;
          uint64_t v84 = *((void *)v83 + 1);
          BOOL v81 = __OFSUB__(v84, v85);
          uint64_t v86 = v84 - v85;
          if (v81) {
            goto LABEL_128;
          }
          BOOL v81 = __OFADD__(v73, v86);
          uint64_t v87 = v73 + v86;
          if (v81) {
            goto LABEL_131;
          }
          if (v87 >= v78)
          {
            uint64_t v105 = &v67[16 * v70];
            uint64_t v107 = *(void *)v105;
            uint64_t v106 = *((void *)v105 + 1);
            BOOL v81 = __OFSUB__(v106, v107);
            uint64_t v108 = v106 - v107;
            if (v81) {
              goto LABEL_135;
            }
            BOOL v98 = v73 < v108;
            goto LABEL_96;
          }
        }
        else
        {
          if (v20 != 3)
          {
            uint64_t v99 = *((void *)v18 + 4);
            uint64_t v100 = *((void *)v18 + 5);
            BOOL v81 = __OFSUB__(v100, v99);
            uint64_t v92 = v100 - v99;
            char v93 = v81;
            goto LABEL_90;
          }
          uint64_t v72 = *((void *)v18 + 4);
          uint64_t v71 = *((void *)v18 + 5);
          BOOL v81 = __OFSUB__(v71, v72);
          uint64_t v73 = v71 - v72;
          char v74 = v81;
        }
        if (v74) {
          goto LABEL_127;
        }
        unint64_t v82 = v20 - 2;
        BOOL v88 = &v67[16 * v20 - 32];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v91 = __OFSUB__(v89, v90);
        uint64_t v92 = v89 - v90;
        char v93 = v91;
        if (v91) {
          goto LABEL_130;
        }
        uint64_t v94 = &v67[16 * v70];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v81 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v81) {
          goto LABEL_133;
        }
        if (__OFADD__(v92, v97)) {
          goto LABEL_134;
        }
        if (v92 + v97 >= v73)
        {
          BOOL v98 = v73 < v97;
LABEL_96:
          if (v98) {
            unint64_t v70 = v82;
          }
          goto LABEL_98;
        }
LABEL_90:
        if (v93) {
          goto LABEL_129;
        }
        uint64_t v101 = &v67[16 * v70];
        uint64_t v103 = *(void *)v101;
        uint64_t v102 = *((void *)v101 + 1);
        BOOL v81 = __OFSUB__(v102, v103);
        uint64_t v104 = v102 - v103;
        if (v81) {
          goto LABEL_132;
        }
        if (v104 < v92) {
          goto LABEL_14;
        }
LABEL_98:
        unint64_t v109 = v70 - 1;
        if (v70 - 1 >= v20)
        {
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
          goto LABEL_145;
        }
        uint64_t v110 = *a1;
        if (!*a1) {
          goto LABEL_147;
        }
        unint64_t v111 = v18;
        uint64_t v112 = &v67[16 * v109];
        uint64_t v113 = *(void *)v112;
        uint64_t v114 = &v67[16 * v70];
        uint64_t v115 = *((void *)v114 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v110 + *(void *)(v132 + 72) * *(void *)v112, v110 + *(void *)(v132 + 72) * *(void *)v114, v110 + *(void *)(v132 + 72) * v115, v131);
        if (v2) {
          goto LABEL_119;
        }
        if (v115 < v113) {
          goto LABEL_122;
        }
        if (v70 > *((void *)v111 + 2)) {
          goto LABEL_123;
        }
        *(void *)uint64_t v112 = v113;
        *(void *)&v67[16 * v109 + 8] = v115;
        unint64_t v116 = *((void *)v111 + 2);
        if (v70 >= v116) {
          goto LABEL_124;
        }
        unint64_t v18 = v111;
        unint64_t v20 = v116 - 1;
        memmove(&v67[16 * v70], v114 + 16, 16 * (v116 - 1 - v70));
        *((void *)v111 + 2) = v116 - 1;
        a1 = v138;
        if (v116 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v20 = 1;
LABEL_14:
    Swift::Int v12 = a1[1];
    Swift::Int v19 = v137;
    if (v137 >= v12) {
      goto LABEL_108;
    }
  }
  Swift::Int v22 = v32;
  uint64_t v2 = v127;
  if (v22 >= v12) {
    goto LABEL_59;
  }
LABEL_40:
  if (__OFSUB__(v22, v21)) {
    goto LABEL_141;
  }
  if (v22 - v21 >= v125) {
    goto LABEL_59;
  }
  if (__OFADD__(v21, v125)) {
    goto LABEL_144;
  }
  if (v21 + v125 >= v12) {
    Swift::Int v46 = v12;
  }
  else {
    Swift::Int v46 = v21 + v125;
  }
  if (v46 >= v21)
  {
    if (v22 != v46)
    {
      Swift::Int v130 = v21;
      uint64_t v126 = v18;
      uint64_t v127 = v2;
      uint64_t v47 = *(void *)(v132 + 72);
      uint64_t v48 = v47 * (v22 - 1);
      uint64_t v134 = v47;
      Swift::Int v49 = v22 * v47;
      Swift::Int v128 = v46;
      do
      {
        uint64_t v51 = 0;
        Swift::Int v52 = v130;
        Swift::Int v137 = v22;
        while (1)
        {
          Swift::Int v140 = v52;
          uint64_t v53 = v138;
          uint64_t v54 = *v138;
          Swift::Int v55 = v49;
          uint64_t v56 = v49 + v51 + *v138;
          uint64_t v57 = v135;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v56, v135);
          uint64_t v58 = v48;
          uint64_t v59 = v48 + v51 + v54;
          uint64_t v60 = v136;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v59, v136);
          uint64_t v141 = *(void *)(v57 + 24);
          uint64_t v61 = *(void *)(v60 + 24);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v60);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v57);
          if (v141 >= v61) {
            break;
          }
          uint64_t v62 = *v53;
          if (!*v53) {
            goto LABEL_146;
          }
          Swift::Int v49 = v55;
          uint64_t v48 = v58;
          uint64_t v63 = v62 + v58 + v51;
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v62 + v55 + v51, v139);
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v139, v63);
          v51 -= v134;
          Swift::Int v52 = v140 + 1;
          Swift::Int v50 = v137;
          if (v137 == v140 + 1) {
            goto LABEL_50;
          }
        }
        Swift::Int v50 = v137;
        uint64_t v48 = v58;
        Swift::Int v49 = v55;
LABEL_50:
        Swift::Int v22 = v50 + 1;
        v48 += v134;
        v49 += v134;
      }
      while (v22 != v128);
      Swift::Int v22 = v128;
      unint64_t v18 = v126;
      uint64_t v2 = v127;
      a1 = v138;
      Swift::Int v21 = v130;
    }
    goto LABEL_59;
  }
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = a1;
  uint64_t v27 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v7 = __chkstk_darwin(v27);
  uint64_t v30 = (uint64_t)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (double *)((char *)&v24 - v10);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (double *)((char *)&v24 - v14);
  uint64_t v29 = a3;
  uint64_t v25 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v32 = v16 * (v29 - 1);
    uint64_t v28 = v16;
    uint64_t v31 = v16 * v29;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v26;
    while (1)
    {
      uint64_t v19 = *a4;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v31 + v17 + *a4, (uint64_t)v15);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v32 + v17 + v19, (uint64_t)v11);
      double v20 = v15[2];
      double v21 = v11[2];
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
      uint64_t result = outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15);
      if (v21 >= v20)
      {
LABEL_4:
        v32 += v28;
        v31 += v28;
        if (++v29 == v25) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v22 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v23 = v22 + v32 + v17;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v22 + v31 + v17, v30);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v30, v23);
      v17 -= v28;
      if (v29 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = a1;
  uint64_t v29 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v7 = __chkstk_darwin(v29);
  uint64_t v32 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (char *)&v26 - v14;
  uint64_t v31 = a3;
  uint64_t v27 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v34 = v16 * (v31 - 1);
    uint64_t v30 = v16;
    uint64_t v33 = v16 * v31;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v28;
    while (1)
    {
      uint64_t v19 = a4;
      uint64_t v20 = *a4;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v17 + v20, (uint64_t)v15);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v34 + v17 + v20, (uint64_t)v11);
      uint64_t v21 = *((void *)v15 + 3);
      uint64_t v22 = *((void *)v11 + 3);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
      uint64_t result = outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15);
      BOOL v23 = v21 < v22;
      a4 = v19;
      if (!v23)
      {
LABEL_4:
        v34 += v30;
        v33 += v30;
        if (++v31 == v27) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v24 = *v19;
      if (!*v19) {
        break;
      }
      uint64_t v25 = v24 + v34 + v17;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v24 + v33 + v17, v32);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v32, v25);
      v17 -= v30;
      ++v18;
      a4 = v19;
      if (v31 == v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v40 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v8 = __chkstk_darwin(v40);
  uint64_t v10 = (double *)((char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  Swift::Int v12 = (double *)((char *)&v39 - v11);
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_70;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_71;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v43 = a1;
  unint64_t v42 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v29 = a4 + v19;
      unint64_t v41 = a4 + v19;
      unint64_t v43 = a2;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v31 = -v14;
        do
        {
          unint64_t v32 = a3 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v29 + v31, (uint64_t)v12);
          unint64_t v33 = a2 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2 + v31, (uint64_t)v10);
          double v34 = v12[2];
          double v35 = v10[2];
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12);
          if (v35 >= v34)
          {
            unint64_t v36 = v41;
            v41 += v31;
            if (a3 < v36 || v32 >= v36)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v36)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v33 = a2;
          }
          else
          {
            if (a3 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v43 += v31;
          }
          unint64_t v29 = v41;
          if (v41 <= a4) {
            break;
          }
          a2 = v33;
          a3 += v31;
        }
        while (v33 > a1);
      }
      goto LABEL_68;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v41 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v12);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a4, (uint64_t)v10);
        double v22 = v12[2];
        double v23 = v10[2];
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12);
        unint64_t v24 = v43;
        if (v23 >= v22)
        {
          unint64_t v27 = v42 + v14;
          if (v43 < v42 || v43 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v43 != v42)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v42 = v27;
          unint64_t v25 = a2;
        }
        else
        {
          unint64_t v25 = a2 + v14;
          if (v43 < a2 || v43 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v43 == a2)
          {
            unint64_t v24 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v43 = v24 + v14;
        a4 = v42;
        if (v42 >= v20) {
          break;
        }
        a2 = v25;
      }
      while (v25 < a3);
    }
LABEL_68:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v43, &v42, (uint64_t *)&v41);
    return 1;
  }
LABEL_72:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v27;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t result;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;

  Swift::Int v49 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v8 = __chkstk_darwin(v49);
  Swift::Int v50 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v46 - v10;
  uint64_t v13 = *(void *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_71;
  }
  uint64_t v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1) {
    goto LABEL_72;
  }
  int64_t v15 = (uint64_t)(a2 - a1) / v13;
  uint64_t v53 = a1;
  Swift::Int v52 = a4;
  uint64_t v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v29 = a4 + v18;
      uint64_t v51 = a4 + v18;
      uint64_t v53 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v31 = -v13;
        uint64_t v47 = a4;
        uint64_t v48 = a1;
        do
        {
          unint64_t v32 = a3 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v29 + v31, (uint64_t)v11);
          unint64_t v33 = a2 + v31;
          double v34 = a3;
          double v35 = (uint64_t)v11;
          unint64_t v36 = v50;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2 + v31, v50);
          uint64_t v37 = *(void *)(v35 + 24);
          int v38 = *(void *)(v36 + 24);
          uint64_t v39 = v36;
          uint64_t v11 = (char *)v35;
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v39);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v35);
          if (v37 >= v38)
          {
            unint64_t v43 = v51;
            v51 += v31;
            if (v34 < v43 || v32 >= v43)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v33 = a2;
              unint64_t v41 = v47;
              unint64_t v42 = v48;
            }
            else
            {
              unint64_t v42 = v48;
              if (v34 != v43) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v33 = a2;
              unint64_t v41 = v47;
            }
          }
          else
          {
            if (v34 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v41 = v47;
              unint64_t v42 = v48;
            }
            else
            {
              uint64_t v40 = v34 == a2;
              unint64_t v41 = v47;
              unint64_t v42 = v48;
              if (!v40) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v53 += v31;
          }
          unint64_t v29 = v51;
          if (v51 <= v41) {
            break;
          }
          a2 = v33;
          a3 = v32;
        }
        while (v33 > v42);
      }
      goto LABEL_69;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v19 = a4 + v17;
    uint64_t v51 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v21 = v50;
      do
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v11);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a4, v21);
        double v22 = *((void *)v11 + 3);
        double v23 = *(void *)(v21 + 24);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v21);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
        unint64_t v24 = v53;
        if (v22 >= v23)
        {
          unint64_t v27 = v52 + v13;
          if (v53 < v52 || v53 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v53 != v52)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          Swift::Int v52 = v27;
          unint64_t v25 = a2;
        }
        else
        {
          unint64_t v25 = a2 + v13;
          if (v53 < a2 || v53 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v53 == a2)
          {
            unint64_t v24 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        uint64_t v53 = v24 + v13;
        a4 = v52;
        if (v52 >= v19) {
          break;
        }
        a2 = v25;
      }
      while (v25 < a3);
    }
LABEL_69:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v53, &v52, (uint64_t *)&v51);
    return 1;
  }
LABEL_73:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*specialized Dictionary._Variant.subscript.modify(void *a1, uint64_t a2))(uint64_t a1)
{
  unint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = specialized Dictionary._Variant.asNative.modify(v4);
  v4[9] = specialized _NativeDictionary.subscript.modify(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return Dictionary._Variant.subscript.modifyspecialized ;
}

void Dictionary._Variant.subscript.modifyspecialized (uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  v2(v1, 0);

  free(v1);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOMapLocation]>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOMapLocation]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*specialized _NativeDictionary.subscript.modify(void *a1, uint64_t a2, char a3))(uint64_t **a1, char a2)
{
  uint64_t v4 = v3;
  unint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  void v8[2] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *unint64_t v8 = v17;
        return _NativeDictionary.subscript.modifyspecialized ;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14, a3 & 1);
    unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, char))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void _NativeDictionary.subscript.modifyspecialized (uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  LOBYTE(v4) = *((unsigned char *)*a1 + 32);
  if (a2)
  {
    if (!v3) {
      goto LABEL_10;
    }
    unint64_t v5 = v2[3];
    uint64_t v6 = *(void **)v2[2];
    if ((*a1)[4]) {
      goto LABEL_9;
    }
    uint64_t v7 = v2[1];
    v6[(v5 >> 6) + 8] |= 1 << v5;
    uint64_t v8 = 8 * v5;
    *(void *)(v6[6] + v8) = v7;
    *(void *)(v6[7] + v8) = v3;
    uint64_t v9 = v6[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v4 = v9 + 1;
    if (!v10)
    {
LABEL_13:
      _OWORD v6[2] = v4;
      goto LABEL_14;
    }
    __break(1u);
  }
  if (!v3)
  {
LABEL_10:
    if (v4) {
      specialized _NativeDictionary._delete(at:)(v2[3], *(void *)v2[2]);
    }
    goto LABEL_14;
  }
  unint64_t v5 = v2[3];
  uint64_t v6 = *(void **)v2[2];
  if ((v4 & 1) == 0)
  {
    uint64_t v11 = v2[1];
    v6[(v5 >> 6) + 8] |= 1 << v5;
    uint64_t v12 = 8 * v5;
    *(void *)(v6[6] + v12) = v11;
    *(void *)(v6[7] + v12) = v3;
    uint64_t v13 = v6[2];
    BOOL v10 = __OFADD__(v13, 1);
    uint64_t v4 = v13 + 1;
    if (v10)
    {
      __break(1u);
      return;
    }
    goto LABEL_13;
  }
LABEL_9:
  *(void *)(v6[7] + 8 * v5) = v3;
LABEL_14:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  free(v2);
}

uint64_t (*specialized Dictionary._Variant.asNative.modify(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return Dictionary._Variant.asNative.modifyspecialized ;
}

uint64_t Dictionary._Variant.asNative.modifyspecialized (uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v10);
  char v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 56);
  uint64_t v17 = a4 + 56;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 24);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 24);
  int64_t v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(void *)(v35 + 48) + v29 * v25, (uint64_t)v12);
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12, (uint64_t)v15);
    uint64_t result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    size_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    size_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized MOSuggestionAssetMapsClusterer.printClusters(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster() - 8;
  uint64_t result = __chkstk_darwin(v2);
  size_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v9 = *(void *)(v4 + 72);
    v21[1] = a1;
    swift_bridgeObjectRetain();
    long long v22 = xmmword_1D0B0;
    do
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v8, (uint64_t)v6);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = v22;
      uint64_t v24 = 0;
      unint64_t v25 = 0xE000000000000000;
      _StringGuts.grow(_:)(51);
      v11._countAndFlagsBits = 0x616E6964726F6F63;
      v11._object = (void *)0xED0000203A736574;
      String.append(_:)(v11);
      long long v23 = *(_OWORD *)v6;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Double, Double));
      _print_unlocked<A, B>(_:_:)();
      v12._countAndFlagsBits = 0x6E6174736964202CLL;
      v12._object = (void *)0xEC000000203A6563;
      String.append(_:)(v12);
      Double.write<A>(to:)();
      v13._countAndFlagsBits = 0x3A746E756F63202CLL;
      v13._object = (void *)0xE900000000000020;
      String.append(_:)(v13);
      *(void *)&long long v23 = *((void *)v6 + 3);
      v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v14);
      swift_bridgeObjectRelease();
      v15._countAndFlagsBits = 0x3A6E69616863202CLL;
      v15._object = (void *)0xE900000000000020;
      String.append(_:)(v15);
      uint64_t v16 = *((void *)v6 + 4);
      uint64_t v17 = (void *)*((void *)v6 + 5);
      swift_bridgeObjectRetain();
      v18._countAndFlagsBits = v16;
      v18._object = v17;
      String.append(_:)(v18);
      swift_bridgeObjectRelease();
      uint64_t v19 = v24;
      unint64_t v20 = v25;
      *(void *)(v10 + 56) = &type metadata for String;
      *(void *)(v10 + 32) = v19;
      *(void *)(v10 + 40) = v20;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6);
      v8 += v9;
      --v7;
    }
    while (v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMapsClusterer.Cluster()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type MOSuggestionAssetMapsClusterer.Cluster and conformance MOSuggestionAssetMapsClusterer.Cluster, (void (*)(uint64_t))type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster);
}

uint64_t lazy protocol witness table accessor for type UUID and conformance UUID(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B708@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & **a1])();
  *a2 = result;
  return result;
}

uint64_t sub_1B764(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))&stru_68.segname[(swift_isaMask & **a2) + 8];
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1B7C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & **a1)))();
  *a2 = result;
  return result;
}

uint64_t sub_1B824(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & **a2));
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void *initializeBufferWithCopyOfBuffer for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a3[8];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = type metadata accessor for UUID();
    Swift::String v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(void *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v15 = a3[11];
    uint64_t v16 = a3[12];
    uint64_t v17 = (void *)((char *)v4 + v15);
    Swift::String v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v20 = a3[14];
    *((unsigned char *)v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *(void *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = a3[8];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[11];
  uint64_t v15 = a3[12];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v19 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MOSuggestionAssetMapsClusterer.Cluster(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  uint64_t v10 = a3[11];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  return a1;
}

_OWORD *initializeWithTake for MOSuggestionAssetMapsClusterer.Cluster(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[8];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
  uint64_t v13 = a3[14];
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  return a1;
}

uint64_t assignWithTake for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_unknownObjectRelease();
  uint64_t v10 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1BE98);
}

uint64_t sub_1BE98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1BF5C);
}

uint64_t sub_1BF5C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for MOSuggestionAssetMapsClusterer.Cluster()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined consume of Set<MOSuggestionAssetMapsClusterer.Cluster>.Iterator._Variant()
{
  return swift_release();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return dispatch thunk of static Numeric.* infix(_:_:)();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return RandomAccessCollection<>.indices.getter();
}

uint64_t Range.contains(_:)()
{
  return Range.contains(_:)();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return OS_dispatch_group.wait(timeout:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Optional<A>.hashValue.getter()
{
  return Optional<A>.hashValue.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  return _MKCoordinateRegionForMapRect(rect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double remainder(long double __x, long double __y)
{
  return _remainder(__x, __y);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}