@interface GEOFeatureStyleAttributes
+ (BOOL)supportsSecureCoding;
+ (id)RAPLocationStyleAttributes;
+ (id)addressMarkerStyleAttributes;
+ (id)airportStyleAttributes;
+ (id)calendarEventStyleAttributes;
+ (id)carRentalStyleAttributes;
+ (id)curatedRouteStyleAttributes;
+ (id)customRouteCreationCurrentLocationStyleAttributes;
+ (id)customRouteGenericAnchorPointStyleAttributes;
+ (id)customSavedRouteDashedStyleAttributes;
+ (id)customSavedRouteStyleAttributes;
+ (id)evChargerStyleAttributes;
+ (id)frequentLocationStyleAttributes;
+ (id)gasStationStyleAttributes;
+ (id)homeStyleAttributes;
+ (id)homeWithHalo;
+ (id)hotelStyleAttributes;
+ (id)inviteStyleAttributes;
+ (id)markerWithHalo;
+ (id)nearbyTransitStyleAttributes;
+ (id)parkedCarStyleAttributes;
+ (id)restaurantStyleAttributes;
+ (id)schoolStyleAttributes;
+ (id)schoolWithHalo;
+ (id)searchResultStyleAttributes;
+ (id)sharedLocationStyleAttributes;
+ (id)sharedLocationWithHalo;
+ (id)styleAttributesForPlace:(id)a3;
+ (id)ticketedEventStyleAttributes;
+ (id)transitStationStyleAttributes;
+ (id)workStyleAttributes;
+ (id)workWithHalo;
- (BOOL)hasAttributes;
- (BOOL)hasDrivingSide;
- (BOOL)isBorder;
- (BOOL)isBridge;
- (BOOL)isCustomPOI;
- (BOOL)isDrivable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeway;
- (BOOL)isLabelPOI;
- (BOOL)isLandmarkPOI;
- (BOOL)isRailway;
- (BOOL)isRamp;
- (BOOL)isRoadPedestrianNavigable;
- (BOOL)isSearchResult;
- (BOOL)isSystemTransit;
- (BOOL)isTransit;
- (BOOL)isTunnel;
- (BOOL)isWalkable;
- (BOOL)shouldSuppress3DBuildingStrokes;
- (GEOFeatureStyleAttributes)init;
- (GEOFeatureStyleAttributes)initWithAttributes:(unsigned int)a3;
- (GEOFeatureStyleAttributes)initWithCoder:(id)a3;
- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesConstPtr:(const void *)a3;
- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesPtr:(const void *)a3;
- (GEOFeatureStyleAttributes)initWithGEOStyleAttributes:(id)a3;
- (GEOFeatureStyleAttributes)initWithPlaceStyleAttributes:(id)a3;
- (GEOFeatureStyleAttributes)initWithStyleAttributes:(const void *)a3;
- (GeoCodecsFeatureStylePair)v;
- (GeoCodecsFeatureStylePairExt)extAttrs;
- (NSString)poiCategory;
- (char)featureType;
- (id).cxx_construct;
- (id)_initWithSharedStyleAttributes:(const void *)a3 extAttributes:(const GeoCodecsFeatureStylePairExt *)a4 extAttributeCount:(unsigned __int8)a5;
- (id)copyWithAirportStyleAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bikeLaneSide;
- (int)bikeableSide;
- (int)drivingSide;
- (int)poiType;
- (int)rampType;
- (int)sidewalkSide;
- (int)walkableSide;
- (shared_ptr<FeatureStyleAttributes>)featureStyleAttributesPtr;
- (shared_ptr<const)_sharedAttributes;
- (unsigned)countAttrs;
- (unsigned)countExtAttrs;
- (unsigned)lineType;
- (unsigned)rampDirection;
- (void)encodeWithCoder:(id)a3;
- (void)featureStyleAttributes;
- (void)replaceAttributes:(const GeoCodecsFeatureStylePair *)a3 count:(unsigned int)a4;
- (void)setExtAttributes:(const GeoCodecsFeatureStylePairExt *)a3 count:(unsigned int)a4;
- (void)sort;
@end

@implementation GEOFeatureStyleAttributes

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_attributes.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (GEOFeatureStyleAttributes)initWithStyleAttributes:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOFeatureStyleAttributes;
  v4 = [(GEOFeatureStyleAttributes *)&v8 init];
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<FeatureStyleAttributes,std::allocator<FeatureStyleAttributes>,FeatureStyleAttributes const&,void>((FeatureStyleAttributes **)&v7, (uint64_t)a3);
    v5 = (std::__shared_weak_count *)*((void *)v4 + 2);
    *(_OWORD *)(v4 + 8) = v7;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return (GEOFeatureStyleAttributes *)v4;
}

- (void)replaceAttributes:(const GeoCodecsFeatureStylePair *)a3 count:(unsigned int)a4
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    FeatureStyleAttributes::replaceAttributes(ptr, a3, a4);
  }
}

- (GEOFeatureStyleAttributes)initWithPlaceStyleAttributes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(GEOFeatureStyleAttributes *)self init];
  v6 = v5;
  long long v7 = 0;
  if (v4 && v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v22);
    shared_ptr<FeatureStyleAttributes> v8 = v22;
    shared_ptr<FeatureStyleAttributes> v22 = (shared_ptr<FeatureStyleAttributes>)0;
    cntrl = (std::__shared_weak_count *)v6->_attributes.__cntrl_;
    v6->_attributes = v8;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      if (v22.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v22.__cntrl_);
      }
    }
    **(void **)v6->_attributes.__ptr_ = 0x300000005;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = objc_msgSend(v4, "attributes", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      size_t v13 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          if (v13 > 0x1F)
          {

            long long v7 = 0;
            goto LABEL_21;
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v15 hasKey] && objc_msgSend(v15, "hasValue"))
          {
            *(_DWORD *)(*(void *)v6->_attributes.__ptr_ + 8 * v13) = [v15 key];
            *(_DWORD *)(*(void *)v6->_attributes.__ptr_ + 8 * v13++ + 4) = [v15 value];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      size_t v13 = 1;
    }

    ptr = v6->_attributes.__ptr_;
    *((unsigned char *)ptr + 33) = v13;
    qsort(*(void **)ptr, v13, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    long long v7 = v6;
  }
LABEL_21:

  return v7;
}

- (GEOFeatureStyleAttributes)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOFeatureStyleAttributes;
  v2 = [(GEOFeatureStyleAttributes *)&v7 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v6);
    long long v3 = v6;
    long long v6 = 0uLL;
    id v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v6 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
      }
    }
  }
  return (GEOFeatureStyleAttributes *)v2;
}

- (BOOL)hasAttributes
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  if (*((unsigned char *)ptr + 33)) {
    return 1;
  }
  return *((unsigned char *)ptr + 32) != 0;
}

- (BOOL)isTransit
{
  return [(GEOFeatureStyleAttributes *)self poiType] == 225;
}

- (int)poiType
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    return FeatureStyleAttributes::poiType(ptr);
  }
  else {
    return -1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = *((void *)self->_attributes.__ptr_ + 1);
  v5 = +[GEOFeatureStyleAttributes allocWithZone:a3];
  ptr = self->_attributes.__ptr_;
  if (v4)
  {
    uint64_t v7 = *((void *)ptr + 3);
    uint64_t v8 = *((unsigned __int8 *)ptr + 32);
    v9 = (char *)ptr + 8;
    return [(GEOFeatureStyleAttributes *)v5 _initWithSharedStyleAttributes:v9 extAttributes:v7 extAttributeCount:v8];
  }
  else
  {
    return [(GEOFeatureStyleAttributes *)v5 initWithStyleAttributes:ptr];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ptr = self->_attributes.__ptr_;
    cntrl = self->_attributes.__cntrl_;
    v14[0] = (uint64_t)ptr;
    v14[1] = (uint64_t)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    if (v4)
    {
      [v4 featureStyleAttributesPtr];
      uint64_t v7 = v11;
      uint64_t v8 = v12;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
    }
    v13[0] = v7;
    v13[1] = (uint64_t)v8;
    BOOL v9 = geo::codec::featureStyleAttributesCompare(v14, v13) == 0;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isCustomPOI
{
  int v5 = 0;
  FeatureStyleAttributesFind(self, 5, &v5);
  BOOL result = 0;
  if (v5 == 3)
  {
    int v4 = 0;
    FeatureStyleAttributesFind(self, 65572, &v4);
    return v4 == 1;
  }
  return result;
}

- (shared_ptr<FeatureStyleAttributes>)featureStyleAttributesPtr
{
  cntrl = self->_attributes.__cntrl_;
  char *v2 = self->_attributes.__ptr_;
  v2[1] = (FeatureStyleAttributes *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (FeatureStyleAttributes *)self;
  return result;
}

- (BOOL)isLabelPOI
{
  if (qword_1EB29F6E8 != -1) {
    dispatch_once(&qword_1EB29F6E8, &__block_literal_global_32);
  }
  if (![(GEOFeatureStyleAttributes *)self countAttrs]) {
    return 0;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  while (1)
  {
    int v5 = [(GEOFeatureStyleAttributes *)self v];
    if (v5)
    {
      if (v5[v3].var0 == 6) {
        break;
      }
    }
    ++v4;
    ++v3;
    if (v4 >= [(GEOFeatureStyleAttributes *)self countAttrs]) {
      return 0;
    }
  }
  uint64_t var1 = v5[v3].var1;
  uint64_t v8 = (void *)_MergedGlobals_199;
  BOOL v9 = [NSNumber numberWithInt:var1];
  char v6 = [v8 containsObject:v9];

  return v6;
}

- (unsigned)countAttrs
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    return *((unsigned char *)ptr + 33);
  }
  else {
    return 0;
  }
}

- (GeoCodecsFeatureStylePair)v
{
  ptr = (GeoCodecsFeatureStylePair **)self->_attributes.__ptr_;
  if (ptr) {
    return *ptr;
  }
  else {
    return 0;
  }
}

+ (id)searchResultStyleAttributes
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65570, 1, 65572, 1, 5, 3, 0);

  return v2;
}

+ (id)workStyleAttributes
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 347, 65572, 1, 0);

  return v2;
}

+ (id)homeStyleAttributes
{
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 346, 65572, 1, 0);

  return v2;
}

- (GEOFeatureStyleAttributes)initWithAttributes:(unsigned int)a3
{
  unint64_t v4 = [(GEOFeatureStyleAttributes *)self init];
  if (v4)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v14);
    shared_ptr<FeatureStyleAttributes> v5 = v14;
    shared_ptr<FeatureStyleAttributes> v14 = (shared_ptr<FeatureStyleAttributes>)0;
    cntrl = (std::__shared_weak_count *)v4->_attributes.__cntrl_;
    v4->_attributes = v5;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      if (v14.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__cntrl_);
      }
    }
    uint64_t v7 = 0;
    char v8 = 0;
    v14.__ptr_ = (FeatureStyleAttributes *)&v15;
    if (!a3) {
      goto LABEL_7;
    }
    ptr = v4->_attributes.__ptr_;
    do
    {
      uint64_t v11 = v14.__ptr_;
      v14.__ptr_ = (FeatureStyleAttributes *)((char *)v14.__ptr_ + 8);
      LODWORD(v11) = *(_DWORD *)v11;
      uint64_t v12 = (unsigned int *)(*(void *)ptr + v7);
      *uint64_t v12 = a3;
      v12[1] = v11;
      ++v8;
      v7 += 8;
LABEL_7:
      v10 = (unsigned int *)v14.__ptr_;
      v14.__ptr_ = (FeatureStyleAttributes *)((char *)v14.__ptr_ + 8);
      a3 = *v10;
      ptr = v4->_attributes.__ptr_;
    }
    while (a3);
    *((unsigned char *)ptr + 33) = v8;
    qsort(*(void **)v4->_attributes.__ptr_, *((unsigned __int8 *)v4->_attributes.__ptr_ + 33), 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
  }
  return v4;
}

- (void)featureStyleAttributes
{
  return self->_attributes.__ptr_;
}

- (id)description
{
  if (self->_attributes.__ptr_)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
    unint64_t v4 = (objc_class *)objc_opt_class();
    shared_ptr<FeatureStyleAttributes> v5 = NSStringFromClass(v4);
    char v6 = [v3 stringWithFormat:@"<%@: %p attrs:[", v5, self];

    ptr = self->_attributes.__ptr_;
    if (*((unsigned char *)ptr + 33))
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        [(__CFString *)v6 appendFormat:@"(%d,%d)", *(unsigned int *)(*(void *)ptr + v8), *(unsigned int *)(*(void *)ptr + v8 + 4)];
        ++v9;
        ptr = self->_attributes.__ptr_;
        unint64_t v10 = *((unsigned __int8 *)ptr + 33);
        if (v9 < v10)
        {
          [(__CFString *)v6 appendString:@", "];
          ptr = self->_attributes.__ptr_;
          unint64_t v10 = *((unsigned __int8 *)ptr + 33);
        }
        v8 += 8;
      }
      while (v9 < v10);
    }
    if (*((unsigned char *)ptr + 32))
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      do
      {
        [(__CFString *)v6 appendFormat:@"(%d,%llu)", *(unsigned int *)(*((void *)ptr + 3) + v11), *(void *)(*((void *)ptr + 3) + v11 + 4)];
        ++v12;
        ptr = self->_attributes.__ptr_;
        unint64_t v13 = *((unsigned __int8 *)ptr + 32);
        if (v12 < v13)
        {
          [(__CFString *)v6 appendString:@", "];
          ptr = self->_attributes.__ptr_;
          unint64_t v13 = *((unsigned __int8 *)ptr + 32);
        }
        v11 += 12;
      }
      while (v12 < v13);
    }
    [(__CFString *)v6 appendString:@"]>"];
  }
  else
  {
    char v6 = &stru_1ED51F370;
  }

  return v6;
}

void __57__GEOFeatureStyleAttributes_PersonalizedItem__isLabelPOI__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = (void *)_MergedGlobals_199;
  _MergedGlobals_199 = 0;

  uint64_t v11 = _getValue(GeoServicesConfig_FeatureStyleAttributePOITypesThatAreLabels, (uint64_t)off_1E9113BB8, 1, 0, 0, 0);
  if (v11)
  {
    v1 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = v11;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v13;
      shared_ptr<FeatureStyleAttributes> v5 = &selRef_initWithStorefrontPresentation_;
      do
      {
        uint64_t v6 = 0;
        uint64_t v7 = v5;
        do
        {
          if (*(void *)v13 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v1 addObject:v8];
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_14;
            }
            unint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
            [v1 addObject:v9];
          }
          ++v6;
        }
        while (v3 != v6);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        shared_ptr<FeatureStyleAttributes> v5 = v7;
      }
      while (v3);
    }

    uint64_t v10 = [v1 copy];
    id v2 = (id)_MergedGlobals_199;
    _MergedGlobals_199 = v10;
LABEL_14:
  }
  if (!_MergedGlobals_199) {
    _MergedGlobals_199 = (uint64_t)&unk_1ED73EC08;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[GEOFeatureStyleAttributes countAttrs](self, "countAttrs"));
  uint64_t v4 = 0;
  for (unint64_t i = 0; i < [(GEOFeatureStyleAttributes *)self countAttrs]; ++i)
  {
    uint64_t v6 = [(GEOFeatureStyleAttributes *)self v];
    if (v6)
    {
      uint64_t v7 = [NSNumber numberWithInt:v6[v4].var1];
      uint64_t v8 = [NSNumber numberWithUnsignedInt:v6[v4].var0];
      [v3 setObject:v7 forKey:v8];
    }
    ++v4;
  }
  unint64_t v9 = (void *)[v3 copy];

  return v9;
}

+ (id)addressMarkerStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 348, 10, 5, 0);

  return v2;
}

+ (id)airportStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 4, 226, 5, 3, 6, 6, 10, 2, 0);

  return v2;
}

- (id)copyWithAirportStyleAttributes
{
  uint64_t v3 = (void *)[(GEOFeatureStyleAttributes *)self copy];
  if (![(GEOFeatureStyleAttributes *)self isLabelPOI])
  {
    uint64_t v5 = 0x600000006;
    [v3 replaceAttributes:&v5 count:1];
  }
  return v3;
}

+ (id)markerWithHalo
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 65599, 2, 0);

  return v2;
}

+ (id)homeWithHalo
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 346, 65599, 2, 65572, 1, 0);

  return v2;
}

+ (id)workWithHalo
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 347, 65599, 2, 65572, 1, 0);

  return v2;
}

+ (id)schoolStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 169, 65572, 1, 0);

  return v2;
}

+ (id)schoolWithHalo
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 169, 65599, 2, 65572, 1, 0);

  return v2;
}

+ (id)sharedLocationStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 456, 65572, 1, 0);

  return v2;
}

+ (id)sharedLocationWithHalo
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 456, 65572, 1, 65599, 2, 0);

  return v2;
}

+ (id)transitStationStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 127, 65572, 1, 0);

  return v2;
}

+ (id)parkedCarStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 349, 65572, 1, 0);

  return v2;
}

+ (id)restaurantStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 20, 65572, 1, 0);

  return v2;
}

+ (id)calendarEventStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 353, 65572, 1, 0);

  return v2;
}

+ (id)frequentLocationStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 348, 65572, 1, 0);

  return v2;
}

+ (id)gasStationStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 112, 10, 2, 0);

  return v2;
}

+ (id)evChargerStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 335, 10, 2, 0);

  return v2;
}

+ (id)hotelStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 11, 10, 2, 0);

  return v2;
}

+ (id)carRentalStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 137, 10, 2, 0);

  return v2;
}

+ (id)ticketedEventStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 23, 10, 2, 0);

  return v2;
}

+ (id)inviteStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 353, 10, 2, 0);

  return v2;
}

+ (id)nearbyTransitStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 24, 65572, 1, 0);

  return v2;
}

+ (id)RAPLocationStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 414, 65572, 1, 0);

  return v2;
}

+ (id)customRouteGenericAnchorPointStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 348, 0);

  return v2;
}

+ (id)customRouteCreationCurrentLocationStyleAttributes
{
  id v2 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 6, 463, 0);

  return v2;
}

+ (id)customSavedRouteStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 461, 65572, 1, 0);

  return v2;
}

+ (id)customSavedRouteDashedStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 487, 65572, 1, 0);

  return v2;
}

+ (id)curatedRouteStyleAttributes
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 5, 3, 6, 465, 65572, 1, 0);

  return v2;
}

+ (id)styleAttributesForPlace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 type];
    int v6 = 348;
    if (v5 <= 42)
    {
      if (v5 > 3)
      {
        if (v5 == 4)
        {
          int v6 = 260;
        }
        else if (v5 == 16)
        {
          int v6 = 3;
        }
      }
      else
      {
        if (v5 == 2) {
          int v7 = 2;
        }
        else {
          int v7 = 348;
        }
        if (v5 == 1) {
          int v6 = 1;
        }
        else {
          int v6 = v7;
        }
      }
    }
    else
    {
      switch(v5)
      {
        case '+':
          int v6 = 4;
          break;
        case ',':
          int v6 = 5;
          break;
        case '-':
        case '/':
          break;
        case '.':
          int v6 = 221;
          break;
        case '0':
          int v6 = 180;
          break;
        default:
          if (v5 == 55)
          {
            int v6 = 223;
          }
          else if (v5 == 61)
          {
            int v6 = 0;
          }
          break;
      }
    }
  }
  else
  {
    int v6 = 348;
  }
  uint64_t v8 = -[GEOFeatureStyleAttributes initWithAttributes:]([GEOFeatureStyleAttributes alloc], "initWithAttributes:", 5, 3, 10, 5, 0);
  v10[0] = 6;
  v10[1] = v6;
  [(GEOFeatureStyleAttributes *)v8 replaceAttributes:v10 count:1];

  return v8;
}

- (BOOL)isLandmarkPOI
{
  int v3 = [(GEOFeatureStyleAttributes *)self countAttrs];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      int v6 = [(GEOFeatureStyleAttributes *)self v];
      if (v6)
      {
        if (v6[v4].var0 == 47) {
          break;
        }
      }
      ++v5;
      ++v4;
      if (v5 >= [(GEOFeatureStyleAttributes *)self countAttrs])
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isSearchResult
{
  LODWORD(v3) = [(GEOFeatureStyleAttributes *)self countAttrs];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      int v3 = [(GEOFeatureStyleAttributes *)self v];
      if (v3)
      {
        if (v3[v4].var0 == 65570) {
          break;
        }
      }
      ++v5;
      ++v4;
      if (v5 >= [(GEOFeatureStyleAttributes *)self countAttrs])
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    LOBYTE(v3) = v3[v4].var1 == 1;
  }
  return (char)v3;
}

- (BOOL)isSystemTransit
{
  int v3 = [(GEOFeatureStyleAttributes *)self countAttrs];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      int v6 = [(GEOFeatureStyleAttributes *)self v];
      if (v6)
      {
        if (v6[v4].var0 == 49) {
          break;
        }
      }
      ++v5;
      ++v4;
      if (v5 >= [(GEOFeatureStyleAttributes *)self countAttrs])
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithSharedStyleAttributes:(const void *)a3 extAttributes:(const GeoCodecsFeatureStylePairExt *)a4 extAttributeCount:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOFeatureStyleAttributes;
  uint64_t v8 = [(GEOFeatureStyleAttributes *)&v16 init];
  if (v8)
  {
    unint64_t v9 = (char *)operator new(0x40uLL);
    uint64_t v10 = (__shared_weak_count *)v9;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = 0;
    *(void *)unint64_t v9 = &unk_1ED5185C0;
    uint64_t v11 = *(void **)a3;
    uint64_t v12 = *((void *)a3 + 1);
    *((void *)v9 + 3) = **(void **)a3;
    long long v13 = (FeatureStyleAttributes *)(v9 + 24);
    *((void *)v9 + 4) = v11;
    *((void *)v9 + 5) = v12;
    if (v12)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
      uint64_t v11 = *(void **)a3;
    }
    *((void *)v9 + 6) = 0;
    v9[56] = 0;
    *(_WORD *)(v9 + 57) = *((unsigned __int8 *)v11 + 33);
    if (a4 && v5) {
      FeatureStyleAttributes::setExtAttributes((FeatureStyleAttributes *)(v9 + 24), a4, v5);
    }
    cntrl = (std::__shared_weak_count *)v8->_attributes.__cntrl_;
    v8->_attributes.__ptr_ = v13;
    v8->_attributes.__cntrl_ = v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v8;
}

- (GEOFeatureStyleAttributes)initWithGEOStyleAttributes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GEOFeatureStyleAttributes *)self init];
  if (v5)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22FeatureStyleAttributesNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v15);
    shared_ptr<FeatureStyleAttributes> v6 = v15;
    shared_ptr<FeatureStyleAttributes> v15 = (shared_ptr<FeatureStyleAttributes>)0;
    cntrl = (std::__shared_weak_count *)v5->_attributes.__cntrl_;
    v5->_attributes = v6;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      if (v15.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15.__cntrl_);
      }
    }
    if ((unint64_t)objc_msgSend(v4, "attributesCount", v15.__ptr_) >= 0x20)
    {
      *((unsigned char *)v5->_attributes.__ptr_ + 33) = 32;
    }
    else
    {
      char v8 = [v4 attributesCount];
      ptr = v5->_attributes.__ptr_;
      *((unsigned char *)ptr + 33) = v8;
      if (!v8)
      {
        size_t v10 = 0;
LABEL_11:
        qsort(*(void **)ptr, v10, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        goto LABEL_12;
      }
    }
    uint64_t v11 = 0;
    size_t v12 = 0;
    do
    {
      long long v13 = [v4 attributeAtIndex:v12];
      *(_DWORD *)(*(void *)v5->_attributes.__ptr_ + v11) = [v13 key];
      *(_DWORD *)(*(void *)v5->_attributes.__ptr_ + v11 + 4) = [v13 value];

      ++v12;
      ptr = v5->_attributes.__ptr_;
      size_t v10 = *((unsigned __int8 *)ptr + 33);
      v11 += 8;
    }
    while (v12 < v10);
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void)setExtAttributes:(const GeoCodecsFeatureStylePairExt *)a3 count:(unsigned int)a4
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    FeatureStyleAttributes::setExtAttributes(ptr, a3, a4);
  }
}

- (unsigned)lineType
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (*((unsigned char *)ptr + 33))
  {
    id v4 = (int *)(*(void *)ptr + 4);
    while (*(v4 - 1) != 1)
    {
      v4 += 2;
      if (!--v3) {
        goto LABEL_6;
      }
    }
    int v5 = *v4;
  }
  else
  {
LABEL_6:
    int v5 = -1;
  }
  return v5 & ~(v5 >> 31);
}

- (BOOL)isTunnel
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 14; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i == 1;
}

- (BOOL)isBridge
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 14; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i == 2;
}

- (BOOL)isRamp
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 21; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i > 0;
}

- (int)rampType
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 1;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 21; i += 2)
  {
    if (!--v3) {
      return 1;
    }
  }
  int v6 = *i;
  if (*i == 2) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  if (v6) {
    return v7;
  }
  else {
    return 0;
  }
}

- (unsigned)rampDirection
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 3;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 33; i += 2)
  {
    if (!--v3) {
      return 3;
    }
  }
  int v6 = *i;
  if (*i == 2) {
    unsigned __int8 v7 = 2;
  }
  else {
    unsigned __int8 v7 = 3;
  }
  if (v6 == 1) {
    return 1;
  }
  else {
    return v7;
  }
}

- (BOOL)isFreeway
{
  ptr = self->_attributes.__ptr_;
  if (ptr)
  {
    uint64_t v3 = *((unsigned __int8 *)ptr + 33);
    if (*((unsigned char *)ptr + 33))
    {
      uint64_t v4 = *(void *)ptr;
      int v5 = (_DWORD *)(v4 + 4);
      uint64_t v6 = v3;
      while (*(v5 - 1) != 1)
      {
        v5 += 2;
        if (!--v6) {
          goto LABEL_8;
        }
      }
      if (*v5 == 9)
      {
LABEL_13:
        for (unint64_t i = (_DWORD *)(v4 + 4); *(i - 1) != 21; i += 2)
        {
          if (!--v3) {
            return 1;
          }
        }
        return *i < 1;
      }
LABEL_8:
      unsigned __int8 v7 = (_DWORD *)(v4 + 4);
      uint64_t v8 = v3;
      while (*(v7 - 1) != 1)
      {
        v7 += 2;
        if (!--v8) {
          return 0;
        }
      }
      if (*v7 == 10) {
        goto LABEL_13;
      }
    }
  }
  return 0;
}

- (BOOL)isRailway
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  unint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  uint64_t v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 12) {
    return 1;
  }
  unint64_t v6 = 0;
  unsigned __int8 v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    int v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 12) {
      return v6 < v3;
    }
  }
  unint64_t v6 = v3;
  return v6 < v3;
}

- (BOOL)isBorder
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  unint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  uint64_t v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 2) {
    return 1;
  }
  unint64_t v6 = 0;
  unsigned __int8 v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    int v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 2) {
      return v6 < v3;
    }
  }
  unint64_t v6 = v3;
  return v6 < v3;
}

- (BOOL)hasDrivingSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  unint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  uint64_t v4 = *(_DWORD **)ptr;
  if (**(_DWORD **)ptr == 24) {
    return 1;
  }
  unint64_t v6 = 0;
  unsigned __int8 v7 = v4 + 2;
  while (v3 - 1 != v6)
  {
    int v8 = *v7;
    v7 += 2;
    ++v6;
    if (v8 == 24) {
      return v6 < v3;
    }
  }
  unint64_t v6 = v3;
  return v6 < v3;
}

- (int)drivingSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 1;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 24; i += 2)
  {
    if (!--v3) {
      return 1;
    }
  }
  return *i != 0;
}

- (BOOL)isRoadPedestrianNavigable
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 75; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i == 1;
}

- (int)sidewalkSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 76; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  int v6 = *i;
  BOOL v7 = *i == 1;
  if (v6 == 2) {
    return 2;
  }
  else {
    return v7;
  }
}

- (int)walkableSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 77; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  if ((*i - 1) >= 3) {
    return 0;
  }
  else {
    return *i;
  }
}

- (int)bikeableSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 86; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  if ((*i - 1) >= 3) {
    return 0;
  }
  else {
    return *i;
  }
}

- (int)bikeLaneSide
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (int *)(*(void *)ptr + 4); *(i - 1) != 87; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  if ((*i - 1) >= 3) {
    return 0;
  }
  else {
    return *i;
  }
}

- (BOOL)isWalkable
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 25; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i > 0;
}

- (BOOL)isDrivable
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 26; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i > 0;
}

- (BOOL)shouldSuppress3DBuildingStrokes
{
  ptr = self->_attributes.__ptr_;
  if (!ptr) {
    return 0;
  }
  uint64_t v3 = *((unsigned __int8 *)ptr + 33);
  if (!*((unsigned char *)ptr + 33)) {
    return 0;
  }
  for (unint64_t i = (_DWORD *)(*(void *)ptr + 4); *(i - 1) != 35; i += 2)
  {
    if (!--v3) {
      return 0;
    }
  }
  return *i == 0;
}

- (GeoCodecsFeatureStylePairExt)extAttrs
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    return (GeoCodecsFeatureStylePairExt *)*((void *)ptr + 3);
  }
  else {
    return 0;
  }
}

- (unsigned)countExtAttrs
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    return *((unsigned char *)ptr + 32);
  }
  else {
    return 0;
  }
}

- (NSString)poiCategory
{
  if (self->_attributes.__ptr_)
  {
    uint64_t v3 = +[GEOPOITypeMapping sharedMapping];
    uint64_t v4 = [v3 categoryForPOIType:FeatureStyleAttributes::poiType(self->_attributes.__ptr_)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (GEOFeatureStyleAttributes)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(GEOFeatureStyleAttributes *)self init];
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v6 = objc_opt_class();
  BOOL v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"v"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v7 count] <= 0x1F)
  {
    v26 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
    unsigned __int8 v10 = 0;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          shared_ptr<FeatureStyleAttributes> v15 = [v9 objectForKeyedSubscript:v14];
          *(_DWORD *)(*(void *)v5->_attributes.__ptr_ + 8 * v10) = [v14 unsignedIntValue];
          *(_DWORD *)(*(void *)v5->_attributes.__ptr_ + 8 * v10 + 4) = [v15 intValue];

          ++v10;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    *((unsigned char *)v5->_attributes.__ptr_ + 33) = v10;
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v26 decodeDictionaryWithKeysOfClass:v16 objectsOfClass:objc_opt_class() forKey:@"extAttrs"];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (unint64_t)[v17 count] > 0xFF)
    {

      int v8 = 0;
      id v4 = v26;
      goto LABEL_25;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v17;
    unsigned __int8 v19 = 0;
    uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v24 = [v18 objectForKeyedSubscript:v23];
          *(_DWORD *)(*((void *)v5->_attributes.__ptr_ + 3) + 12 * v19) = [v23 unsignedIntValue];
          *(void *)(*((void *)v5->_attributes.__ptr_ + 3) + 12 * v19 + 4) = [v24 unsignedLongLongValue];

          ++v19;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }

    *((unsigned char *)v5->_attributes.__ptr_ + 32) = v19;
    [(GEOFeatureStyleAttributes *)v5 sort];

    id v4 = v26;
LABEL_24:
    int v8 = v5;
    goto LABEL_25;
  }

  int v8 = 0;
LABEL_25:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*((unsigned __int8 *)self->_attributes.__ptr_ + 33)];
  ptr = self->_attributes.__ptr_;
  if (*((unsigned char *)ptr + 33))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      int v8 = (unsigned int *)(*(void *)ptr + v6);
      uint64_t v9 = *v8;
      unsigned __int8 v10 = [NSNumber numberWithInt:v8[1]];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
      [v4 setObject:v10 forKeyedSubscript:v11];

      ++v7;
      ptr = self->_attributes.__ptr_;
      v6 += 8;
    }
    while (v7 < *((unsigned __int8 *)ptr + 33));
  }
  [v20 encodeObject:v4 forKey:@"v"];
  if (*((unsigned char *)self->_attributes.__ptr_ + 32))
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*((unsigned __int8 *)self->_attributes.__ptr_ + 32)];
    long long v13 = self->_attributes.__ptr_;
    if (*((unsigned char *)v13 + 32))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = (unsigned int *)(*((void *)v13 + 3) + v14);
        uint64_t v17 = *v16;
        id v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(v16 + 1)];
        unsigned __int8 v19 = [NSNumber numberWithUnsignedInt:v17];
        [v12 setObject:v18 forKeyedSubscript:v19];

        ++v15;
        long long v13 = self->_attributes.__ptr_;
        v14 += 12;
      }
      while (v15 < *((unsigned __int8 *)v13 + 32));
    }
    [v20 encodeObject:v12 forKey:@"extAttrs"];
  }
}

- (char)featureType
{
  ptr = self->_attributes.__ptr_;
  if (ptr) {
    LOBYTE(ptr) = *((unsigned char *)ptr + 34);
  }
  return (char)ptr;
}

- (shared_ptr<const)_sharedAttributes
{
  ptr = self->_attributes.__ptr_;
  if (ptr)
  {
    uint64_t v5 = *((void *)ptr + 1);
    uint64_t v4 = *((void *)ptr + 2);
    void *v2 = v5;
    v2[1] = v4;
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    void *v2 = 0;
    v2[1] = 0;
  }
  result.uint64_t var1 = (__shared_weak_count *)a2;
  result.var0 = (FeatureStyleAttributes *)self;
  return result;
}

- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesPtr:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOFeatureStyleAttributes;
  uint64_t v4 = [(GEOFeatureStyleAttributes *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v7 = *(FeatureStyleAttributes **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_attributes.__cntrl_;
    v5->_attributes.__ptr_ = v7;
    v5->_attributes.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (GEOFeatureStyleAttributes)initWithFeatureStyleAttributesConstPtr:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOFeatureStyleAttributes;
  uint64_t v4 = [(GEOFeatureStyleAttributes *)&v8 init];
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<FeatureStyleAttributes,std::allocator<FeatureStyleAttributes>,FeatureStyleAttributes const&,void>((FeatureStyleAttributes **)&v7, *(void *)a3);
    uint64_t v5 = (std::__shared_weak_count *)*((void *)v4 + 2);
    *(_OWORD *)(v4 + 8) = v7;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return (GEOFeatureStyleAttributes *)v4;
}

- (void)sort
{
}

@end