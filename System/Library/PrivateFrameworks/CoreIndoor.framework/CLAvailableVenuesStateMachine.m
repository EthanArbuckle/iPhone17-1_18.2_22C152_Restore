@interface CLAvailableVenuesStateMachine
+ (double)deg2rad:(double)a3;
+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4;
+ (double)metersFromGreatCircleDistance:(double)a3;
+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3;
- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4;
- (BOOL)shouldRecompute:(id)a3;
- (CLAvailableVenuesStateMachine)init;
- (CLIndoorAvailabilityTileParams)availabilityTileParams;
- (GeographicCoordinate)lastFix;
- (NSSet)disabledVenues;
- (double)maxLoadRadius;
- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4;
- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5;
- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4;
- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5;
- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4;
- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5;
- (id)openTileParserAtPath:(id)a3;
- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5;
- (void)clearLastFix;
- (void)setDisabledVenues:(id)a3;
- (void)setMaxLoadRadius:(double)a3;
@end

@implementation CLAvailableVenuesStateMachine

- (CLAvailableVenuesStateMachine)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLAvailableVenuesStateMachine;
  v2 = [(CLAvailableVenuesStateMachine *)&v8 init];
  v3 = v2;
  if (v2)
  {
    lastFix = v2->_lastFix;
    v2->_lastFix = 0;

    disabledVenues = v3->_disabledVenues;
    v3->_maxLoadRadius = 100000.0;
    v3->_disabledVenues = 0;

    availabilityTileParams = v3->_availabilityTileParams;
    v3->_availabilityTileParams = 0;
  }
  return v3;
}

+ (double)deg2rad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

+ (double)metersFromGreatCircleDistance:(double)a3
{
  return a3 * 180.0 / 3.14159265 * 60.0 * 1852.0;
}

+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v11 = v6;
  if (!v5)
  {
    v61 = sub_221E251B0();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_log_impl(&dword_221DDF000, v61, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v62 = sub_221E251B0();
    if (os_signpost_enabled(v62))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_signpost_emit_with_name_impl(&dword_221DDF000, v62, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: first coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v63 = sub_221E251B0();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon0 != nullptr";
      _os_log_impl(&dword_221DDF000, v63, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
    __break(1u);
  }
  if (!v6)
  {
    v64 = sub_221E251B0();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_log_impl(&dword_221DDF000, v64, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v65 = sub_221E251B0();
    if (os_signpost_enabled(v65))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_signpost_emit_with_name_impl(&dword_221DDF000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: second coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v63 = sub_221E251B0();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v67 = 0;
      __int16 v68 = 2082;
      v69 = "";
      __int16 v70 = 2082;
      v71 = "assert";
      __int16 v72 = 2081;
      v73 = "latlon1 != nullptr";
      _os_log_impl(&dword_221DDF000, v63, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  objc_msgSend_latitude(v5, v7, v8, v9, v10);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v12, v13, v14, v15);
  long double v17 = v16;
  objc_msgSend_longitude(v5, v18, v19, v20, v21);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v22, v23, v24, v25);
  double v27 = v26;
  objc_msgSend_latitude(v11, v28, v29, v30, v31);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v32, v33, v34, v35);
  long double v37 = v36;
  objc_msgSend_longitude(v11, v38, v39, v40, v41);
  objc_msgSend_deg2rad_(CLAvailableVenuesStateMachine, v42, v43, v44, v45);
  long double v47 = sin((v27 - v46) * 0.5);
  long double v48 = v47 * v47;
  long double v49 = sin((v17 - v37) * 0.5);
  long double v50 = v49 * v49;
  double v51 = cos(v17);
  long double v52 = cos(v37);
  long double v53 = asin(sqrt(v50 + v51 * v52 * v48));
  objc_msgSend_metersFromGreatCircleDistance_(CLAvailableVenuesStateMachine, v54, v55, v56, v57, (double)(v53 + v53));
  double v59 = v58;

  return v59;
}

- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  disabledVenues = self->_disabledVenues;
  if (disabledVenues)
  {
    uint64_t v15 = objc_msgSend_member_(disabledVenues, v7, (uint64_t)v6, v8, v9);
    if (v15)
    {
      BOOL v16 = 1;
    }
    else
    {
      long double v17 = objc_msgSend_member_(self->_disabledVenues, v12, (uint64_t)v10, v13, v14);
      BOOL v16 = v17 != 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v16 = 0;
  uint64_t v9 = objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v8, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);
  if (v16)
  {
    sub_221E25488();
    v11 = objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v10, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);

    if (v16)
    {
      sub_221E25488();
      uint64_t v9 = objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v12, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);

      if (v16)
      {
        sub_221E25488();
        uint64_t v14 = objc_msgSend_computeAvailableVenues_nearCoordinates_withError_(self, v13, (uint64_t)v6, (uint64_t)v7, (uint64_t)&v16);

        if (v16)
        {
          sub_221E4238C(&v17);

          id result = (id)abort_report_np();
          __break(1u);
          return result;
        }
        uint64_t v9 = (void *)v14;
      }
    }
    else
    {
      uint64_t v9 = v11;
    }
  }

  return v9;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5
{
  uint64_t v346 = *MEMORY[0x263EF8340];
  id v308 = a3;
  id v297 = a4;
  v298 = a5;
  *a5 = 0;
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  v11 = objc_msgSend_initWithCapacity_(v7, v8, 120, v9, v10);
  uint64_t v12 = 120;
  do
  {
    uint64_t v13 = objc_alloc_init(ECEFCoordinate);
    objc_msgSend_addObject_(v11, v14, (uint64_t)v13, v15, v16);

    --v12;
  }
  while (v12);
  id v17 = objc_alloc(MEMORY[0x263EFF980]);
  v310 = objc_msgSend_initWithCapacity_(v17, v18, 120, v19, v20);
  v316 = v11;
  v311 = objc_alloc_init(GeographicCoordinate);
  v317 = objc_alloc_init(ENUCoordinate);
  v300 = objc_alloc_init(ECEFCoordinate);
  v304 = objc_alloc_init(GeographicCoordinate);
  int v25 = objc_msgSend_numVenuesExpected(v308, v21, v22, v23, v24);
  v305 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v26, v25, v27, v28);
  int v33 = objc_msgSend_numTotalExpectedExteriorsInVenues(v308, v29, v30, v31, v32);
  int v303 = v25;
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
  }
  uint64_t v34 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v338 = v33;
    _os_log_impl(&dword_221DDF000, v34, OS_LOG_TYPE_INFO, "@IndoorAvl, load, Reserving %zu entries for AvailabilityTile entries in result", buf, 0xCu);
  }

  v295 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v35, v33, v36, v37);
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
  }
  v38 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v338) = v303;
    _os_log_impl(&dword_221DDF000, v38, OS_LOG_TYPE_INFO, "@IndoorAvl, load, iterating over %d venues in the availability tile", buf, 8u);
  }

  if (v303 >= 1)
  {
    uint64_t v296 = 0;
    uint64_t v294 = 0;
    int v309 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x223C92960]();
      sub_221E3830C((uint64_t)buf);
      if (objc_msgSend_tileIsOpenForIncrementalIO(v308, v43, v44, v45, v46))
      {
        if ((objc_msgSend_getNextVenueBoundsIncrementally_(v308, v47, (uint64_t)buf, v49, v50) & 1) == 0)
        {
          if (qword_26ABF4AF8 == -1)
          {
            double v51 = qword_26ABF4AF0;
            if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
            {
LABEL_19:
              int v52 = 1;
              BOOL *v298 = 1;
              goto LABEL_214;
            }
          }
          else
          {
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            double v51 = qword_26ABF4AF0;
            if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
          }
          *(_WORD *)v336 = 0;
          _os_log_impl(&dword_221DDF000, v51, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, failed to incrementally read venue bounds from tile", v336, 2u);
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t AvlTile = objc_msgSend_getAvlTile(v308, v47, v48, v49, v50);
        sub_221E33B4C(AvlTile, v309, (uint64_t)v336);
        sub_221E3BC20((uint64_t)buf, (uint64_t)v336);
        sub_221E3A614(v336);
      }
      sub_221E2744C(&v340[2], ", ", (uint64_t)__p);
      if (!v343)
      {
        if (qword_26ABF4AF8 == -1)
        {
          v82 = qword_26ABF4AF0;
          if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_227;
          }
        }
        else
        {
          dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
          v82 = qword_26ABF4AF0;
          if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
          {
LABEL_227:
            int v52 = 11;
            if ((v333 & 0x80000000) == 0) {
              goto LABEL_214;
            }
LABEL_213:
            operator delete(__p[0]);
            goto LABEL_214;
          }
        }
        v83 = __p;
        if (v333 < 0) {
          v83 = (void **)__p[0];
        }
        *(_DWORD *)v336 = 136446210;
        *(void *)&v336[4] = v83;
        _os_log_impl(&dword_221DDF000, v82, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, venue [%{public}s] is missing exterior", v336, 0xCu);
        int v52 = 11;
        if (v333 < 0) {
          goto LABEL_213;
        }
        goto LABEL_214;
      }
      v330 = 0;
      uint64_t v331 = 0;
      v329 = &v330;
      v327 = 0;
      uint64_t v328 = 0;
      v326 = &v327;
      if ((v345 & 4) != 0)
      {
        uint64_t v58 = v344;
        if (!v344) {
          uint64_t v58 = *(void *)(qword_26ABF5058 + 64);
        }
        sub_221E393E0(v336, v58);
        uint64_t v59 = *(unsigned int *)&v336[24];
        if (*(int *)&v336[24] >= 1)
        {
          uint64_t v60 = 0;
          uint64_t v61 = v328;
          do
          {
            int v62 = *(_DWORD *)(*(void *)&v336[16] + 4 * v60);
            v63 = v327;
            v64 = &v327;
LABEL_33:
            v65 = v64;
            if (v63)
            {
              do
              {
                v64 = (void **)v63;
                int v66 = *((_DWORD *)v63 + 7);
                if (v62 < v66)
                {
                  v63 = *v64;
                  goto LABEL_33;
                }
                if (v66 >= v62) {
                  goto LABEL_30;
                }
                v63 = v64[1];
              }
              while (v63);
              v65 = v64 + 1;
            }
            int v67 = operator new(0x20uLL);
            *((_DWORD *)v67 + 7) = v62;
            *int v67 = 0;
            v67[1] = 0;
            v67[2] = v64;
            void *v65 = v67;
            if (*v326)
            {
              v326 = (void *)*v326;
              int v67 = (void *)*v65;
            }
            __int16 v68 = v327;
            BOOL v69 = v67 == v327;
            *((unsigned char *)v67 + 24) = v67 == v327;
            if (!v69)
            {
              do
              {
                uint64_t v70 = v67[2];
                if (*(unsigned char *)(v70 + 24)) {
                  break;
                }
                v71 = *(void **)(v70 + 16);
                uint64_t v72 = *v71;
                if (*v71 == v70)
                {
                  uint64_t v75 = v71[1];
                  if (!v75 || (int v76 = *(unsigned __int8 *)(v75 + 24), v73 = (unsigned char *)(v75 + 24), v76))
                  {
                    if (*(void **)v70 == v67)
                    {
                      *(unsigned char *)(v70 + 24) = 1;
                      *((unsigned char *)v71 + 24) = 0;
                      uint64_t v79 = *(void *)(v70 + 8);
                      void *v71 = v79;
                      if (v79) {
                        goto LABEL_55;
                      }
                    }
                    else
                    {
                      v77 = *(uint64_t **)(v70 + 8);
                      uint64_t v78 = *v77;
                      *(void *)(v70 + 8) = *v77;
                      if (v78)
                      {
                        *(void *)(v78 + 16) = v70;
                        v71 = *(void **)(v70 + 16);
                      }
                      v77[2] = (uint64_t)v71;
                      *(void *)(*(void *)(v70 + 16) + 8 * (**(void **)(v70 + 16) != v70)) = v77;
                      uint64_t *v77 = v70;
                      *(void *)(v70 + 16) = v77;
                      v71 = (void *)v77[2];
                      uint64_t v70 = *v71;
                      *((unsigned char *)v77 + 24) = 1;
                      *((unsigned char *)v71 + 24) = 0;
                      uint64_t v79 = *(void *)(v70 + 8);
                      void *v71 = v79;
                      if (v79) {
LABEL_55:
                      }
                        *(void *)(v79 + 16) = v71;
                    }
                    *(void *)(v70 + 16) = v71[2];
                    *(void *)(v71[2] + 8 * (*(void *)v71[2] != (void)v71)) = v70;
                    *(void *)(v70 + 8) = v71;
LABEL_28:
                    v71[2] = v70;
                    break;
                  }
                }
                else if (!v72 || (int v74 = *(unsigned __int8 *)(v72 + 24), v73 = (unsigned char *)(v72 + 24), v74))
                {
                  if (*(void **)v70 == v67)
                  {
                    uint64_t v80 = v67[1];
                    *(void *)uint64_t v70 = v80;
                    if (v80)
                    {
                      *(void *)(v80 + 16) = v70;
                      v71 = *(void **)(v70 + 16);
                    }
                    v67[2] = v71;
                    *(void *)(*(void *)(v70 + 16) + 8 * (**(void **)(v70 + 16) != v70)) = v67;
                    v67[1] = v70;
                    *(void *)(v70 + 16) = v67;
                    v71 = (void *)v67[2];
                  }
                  else
                  {
                    int v67 = (void *)v67[2];
                  }
                  *((unsigned char *)v67 + 24) = 1;
                  *((unsigned char *)v71 + 24) = 0;
                  uint64_t v70 = v71[1];
                  v81 = *(void **)v70;
                  v71[1] = *(void *)v70;
                  if (v81) {
                    v81[2] = v71;
                  }
                  *(void *)(v70 + 16) = v71[2];
                  *(void *)(v71[2] + 8 * (*(void *)v71[2] != (void)v71)) = v70;
                  *(void *)uint64_t v70 = v71;
                  goto LABEL_28;
                }
                *(unsigned char *)(v70 + 24) = 1;
                int v67 = v71;
                *((unsigned char *)v71 + 24) = v71 == v68;
                unsigned char *v73 = 1;
              }
              while (v71 != v68);
            }
            uint64_t v328 = ++v61;
LABEL_30:
            ++v60;
          }
          while (v60 != v59);
        }
        sub_221E3949C(v336);
      }
      objc_msgSend_removeAllObjects(v305, v54, v55, v56, v57);
      if (v341 < 1) {
        goto LABEL_205;
      }
      uint64_t v87 = 0;
      id v88 = 0;
      do
      {
        uint64_t v89 = *(void *)(*(void *)&v340[2] + 8 * v87);
        if (*(char *)(v89 + 23) < 0) {
          uint64_t v89 = *(void *)v89;
        }
        v90 = objc_msgSend_stringWithUTF8String_(NSString, v84, v89, v85, v86);
        if (objc_msgSend_hasPrefix_(v90, v91, @"G", v92, v93))
        {
          if (v88)
          {

            if (qword_26ABF4AF8 == -1)
            {
              uint64_t v258 = qword_26ABF4AF0;
              if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_211;
              }
            }
            else
            {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
              uint64_t v258 = qword_26ABF4AF0;
              if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_211;
              }
            }
            v259 = __p;
            if (v333 < 0) {
              v259 = (void **)__p[0];
            }
            *(_DWORD *)v336 = 136446210;
            *(void *)&v336[4] = v259;
            v260 = v258;
            os_log_type_t v261 = OS_LOG_TYPE_ERROR;
            v262 = "Multiple groups associated with venue [%{public}s].  Ignoring from availability tile";
            goto LABEL_222;
          }
          if (objc_msgSend_isVenueDisabled_locationId_(self, v94, (uint64_t)v90, 0, v96))
          {
            if (qword_26ABF4AF8 != -1) {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            }
            v263 = (id)qword_26ABF4AF0;
            if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG))
            {
              id v264 = v90;
              uint64_t v269 = objc_msgSend_UTF8String(v264, v265, v266, v267, v268);
              *(_DWORD *)v336 = 136315138;
              *(void *)&v336[4] = v269;
              _os_log_impl(&dword_221DDF000, v263, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v336, 0xCu);
            }

LABEL_205:
            if (qword_26ABF4AF8 == -1)
            {
              v270 = qword_26ABF4AF0;
              if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_207;
              }
            }
            else
            {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
              v270 = qword_26ABF4AF0;
              if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_207:
                v271 = __p;
                if (v333 < 0) {
                  v271 = (void **)__p[0];
                }
                *(_DWORD *)v336 = 136315138;
                *(void *)&v336[4] = v271;
                _os_log_impl(&dword_221DDF000, v270, OS_LOG_TYPE_DEFAULT, "#Warning Cannot find location group in venue [%s]", v336, 0xCu);
              }
            }
            id v88 = 0;
            goto LABEL_211;
          }
          id v88 = v90;
        }
        else
        {
          if (!objc_msgSend_hasPrefix_(v90, v94, @"L", v95, v96))
          {
            if (qword_26ABF4AF8 != -1) {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            }
            v102 = (id)qword_26ABF4AF0;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              id v109 = v90;
              uint64_t v114 = objc_msgSend_UTF8String(v109, v110, v111, v112, v113);
              *(_DWORD *)v336 = 136315138;
              *(void *)&v336[4] = v114;
              _os_log_impl(&dword_221DDF000, v102, OS_LOG_TYPE_DEFAULT, "#Warning Encountered invalid venue id %s in availability tile. Skipping", v336, 0xCu);
            }
            goto LABEL_92;
          }
          if (objc_msgSend_isVenueDisabled_locationId_(self, v97, 0, (uint64_t)v90, v98))
          {
            if (qword_26ABF4AF8 != -1) {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            }
            v102 = (id)qword_26ABF4AF0;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
            {
              id v103 = v90;
              uint64_t v108 = objc_msgSend_UTF8String(v103, v104, v105, v106, v107);
              *(_DWORD *)v336 = 136315138;
              *(void *)&v336[4] = v108;
              _os_log_impl(&dword_221DDF000, v102, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v336, 0xCu);
            }
LABEL_92:

            goto LABEL_93;
          }
          objc_msgSend_addObject_(v305, v99, (uint64_t)v90, v100, v101);
          if (v87 >= v341)
          {
            sub_221E42628();
            abort_report_np();
            goto LABEL_277;
          }
          if ((v345 & 4) != 0)
          {
            v124 = v327;
            if (!v327) {
              goto LABEL_93;
            }
            v125 = &v327;
            do
            {
              v126 = v124;
              v127 = v125;
              uint64_t v128 = *((int *)v124 + 7);
              if (v87 <= v128) {
                v125 = (void **)v124;
              }
              else {
                ++v124;
              }
              v124 = (void *)*v124;
            }
            while (v124);
            if (v125 == &v327) {
              goto LABEL_93;
            }
            if (v87 > v128) {
              v126 = v127;
            }
            if (v87 < *((int *)v126 + 7)) {
              goto LABEL_93;
            }
          }
          else
          {
            uint64_t LocationContextFromVenueBounds = objc_msgSend_getLocationContextFromVenueBounds_(CLAvailableVenuesStateMachine, v116, (uint64_t)buf, v118, v119);
            if (!objc_msgSend_isRegional_(CLLocationContextUtil, v121, LocationContextFromVenueBounds, v122, v123))goto LABEL_93; {
          }
            }
          unint64_t v129 = objc_msgSend_count(v305, v116, v117, v118, v119) - 1;
          v130 = v330;
          v131 = &v330;
LABEL_111:
          v132 = v131;
          if (v130)
          {
            do
            {
              v131 = (uint64_t **)v130;
              unint64_t v133 = v130[4];
              if (v129 < v133)
              {
                v130 = *v131;
                goto LABEL_111;
              }
              if (v133 >= v129) {
                goto LABEL_93;
              }
              v130 = v131[1];
            }
            while (v130);
            v132 = v131 + 1;
          }
          v134 = (uint64_t *)operator new(0x28uLL);
          v134[4] = v129;
          uint64_t *v134 = 0;
          v134[1] = 0;
          v134[2] = (uint64_t)v131;
          *v132 = v134;
          if (*v329)
          {
            v329 = (uint64_t **)*v329;
            v134 = *v132;
          }
          sub_221E28C34(v330, v134);
          ++v331;
        }
LABEL_93:

        ++v87;
      }
      while (v87 < v341);
      if (!v88) {
        goto LABEL_205;
      }
      if (!objc_msgSend_count(v305, v84, v115, v85, v86) || !v305)
      {
        if (qword_26ABF4AF8 == -1)
        {
          uint64_t v272 = qword_26ABF4AF0;
          if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_219;
          }
LABEL_211:
          int v52 = 11;
          goto LABEL_212;
        }
        dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
        uint64_t v272 = qword_26ABF4AF0;
        if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_211;
        }
LABEL_219:
        v273 = __p;
        if (v333 < 0) {
          v273 = (void **)__p[0];
        }
        *(_DWORD *)v336 = 136315138;
        *(void *)&v336[4] = v273;
        v260 = v272;
        os_log_type_t v261 = OS_LOG_TYPE_DEFAULT;
        v262 = "#Warning No venues associated with availability tile [%s]";
LABEL_222:
        _os_log_impl(&dword_221DDF000, v260, v261, v262, v336, 0xCu);
        goto LABEL_211;
      }
      uint64_t v139 = objc_msgSend_count(v305, v135, v136, v137, v138);
      uint64_t v293 = objc_msgSend_substringFromIndex_(v88, v140, 1, v141, v142);

      uint64_t v292 = objc_msgSend_getLocationContextFromVenueBounds_(CLAvailableVenuesStateMachine, v143, (uint64_t)buf, v144, v145);
      v296 += v139;
      if (v343)
      {
        BOOL v301 = 0;
        v302 = v342;
        v299 = &v342[v343];
        while (1)
        {
          if (v301)
          {
            BOOL v301 = 1;
            goto LABEL_125;
          }
          unint64_t v150 = *(unsigned int *)(*v302 + 24);
          uint64_t v307 = *v302;
          if (v150 == *(_DWORD *)(*v302 + 48)) {
            break;
          }
          if (qword_26ABF4AF8 == -1)
          {
            v202 = qword_26ABF4AF0;
            if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR)) {
              goto LABEL_153;
            }
          }
          else
          {
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            v202 = qword_26ABF4AF0;
            if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_ERROR))
            {
LABEL_153:
              v203 = __p;
              if (v333 < 0) {
                v203 = (void **)__p[0];
              }
              int v204 = *(_DWORD *)(v307 + 24);
              int v205 = *(_DWORD *)(v307 + 48);
              *(_DWORD *)v336 = 136446722;
              *(void *)&v336[4] = v203;
              *(_WORD *)&v336[12] = 1026;
              *(_DWORD *)&v336[14] = v204;
              *(_WORD *)&v336[18] = 1026;
              *(_DWORD *)&v336[20] = v205;
              _os_log_impl(&dword_221DDF000, v202, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, exterior polygon of venue [%{public}s] is corrupt.  %{public}d latitudes, %{public}d longitudes", v336, 0x18u);
              BOOL v301 = 0;
              goto LABEL_125;
            }
          }
          BOOL v301 = 0;
LABEL_125:
          if (++v302 == v299) {
            goto LABEL_223;
          }
        }
        if ((v150 & 0x80000000) != 0)
        {
          v286 = sub_221E251B0();
          if (os_log_type_enabled(v286, OS_LOG_TYPE_FAULT))
          {
            int v287 = *(_DWORD *)(v307 + 48);
            *(_DWORD *)v336 = 68289795;
            *(_DWORD *)&v336[4] = 0;
            *(_WORD *)&v336[8] = 2082;
            *(void *)&v336[10] = "";
            *(_WORD *)&v336[18] = 1026;
            *(_DWORD *)&v336[20] = v287;
            *(_WORD *)&v336[24] = 2082;
            *(void *)&v336[26] = "assert";
            *(_WORD *)&v336[34] = 2081;
            *(void *)&v336[36] = "exterior.longitude_size() >= 0";
            _os_log_impl(&dword_221DDF000, v286, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x2Cu);
          }

          v288 = sub_221E251B0();
          if (os_signpost_enabled(v288))
          {
            int v289 = *(_DWORD *)(v307 + 48);
            *(_DWORD *)v336 = 68289795;
            *(_DWORD *)&v336[4] = 0;
            *(_WORD *)&v336[8] = 2082;
            *(void *)&v336[10] = "";
            *(_WORD *)&v336[18] = 1026;
            *(_DWORD *)&v336[20] = v289;
            *(_WORD *)&v336[24] = 2082;
            *(void *)&v336[26] = "assert";
            *(_WORD *)&v336[34] = 2081;
            *(void *)&v336[36] = "exterior.longitude_size() >= 0";
            _os_signpost_emit_with_name_impl(&dword_221DDF000, v288, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, load, exterior longitude_size() returned a negative value?!", "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x2Cu);
          }

          v290 = sub_221E251B0();
          if (os_log_type_enabled(v290, OS_LOG_TYPE_INFO))
          {
            int v291 = *(_DWORD *)(v307 + 48);
            *(_DWORD *)v336 = 68289795;
            *(_DWORD *)&v336[4] = 0;
            *(_WORD *)&v336[8] = 2082;
            *(void *)&v336[10] = "";
            *(_WORD *)&v336[18] = 1026;
            *(_DWORD *)&v336[20] = v291;
            *(_WORD *)&v336[24] = 2082;
            *(void *)&v336[26] = "assert";
            *(_WORD *)&v336[34] = 2081;
            *(void *)&v336[36] = "exterior.longitude_size() >= 0";
            _os_log_impl(&dword_221DDF000, v290, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x2Cu);
          }

          abort_report_np();
LABEL_277:
          while (2)
          {
            __break(1u);
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            v283 = (id)qword_26ABF4AF0;
            if (os_log_type_enabled(v283, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v336 = 68289539;
              *(_DWORD *)&v336[4] = 0;
              *(_WORD *)&v336[8] = 2082;
              *(void *)&v336[10] = "";
              *(_WORD *)&v336[18] = 2082;
              *(void *)&v336[20] = "assert";
              *(_WORD *)&v336[28] = 2081;
              *(void *)&v336[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl(&dword_221DDF000, v283, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x26u);
            }

            if (qword_26ABF4AF8 == -1)
            {
              v284 = (id)qword_26ABF4AF0;
              if (os_signpost_enabled(v284)) {
                goto LABEL_260;
              }
            }
            else
            {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
              v284 = (id)qword_26ABF4AF0;
              if (os_signpost_enabled(v284))
              {
LABEL_260:
                *(_DWORD *)v336 = 68289539;
                *(_DWORD *)&v336[4] = 0;
                *(_WORD *)&v336[8] = 2082;
                *(void *)&v336[10] = "";
                *(_WORD *)&v336[18] = 2082;
                *(void *)&v336[20] = "assert";
                *(_WORD *)&v336[28] = 2081;
                *(void *)&v336[30] = "!std::isnan(vertexENU.x())";
                _os_signpost_emit_with_name_impl(&dword_221DDF000, v284, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "vertexENU.x() must not be NaN", "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x26u);
              }
            }

            if (qword_26ABF4AF8 != -1) {
              dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            }
            v285 = (id)qword_26ABF4AF0;
            if (os_log_type_enabled(v285, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v336 = 68289539;
              *(_DWORD *)&v336[4] = 0;
              *(_WORD *)&v336[8] = 2082;
              *(void *)&v336[10] = "";
              *(_WORD *)&v336[18] = 2082;
              *(void *)&v336[20] = "assert";
              *(_WORD *)&v336[28] = 2081;
              *(void *)&v336[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl(&dword_221DDF000, v285, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v336, 0x26u);
            }

            abort_report_np();
            continue;
          }
        }
        if (objc_msgSend_count(v11, v146, v147, v148, v149) < v150)
        {
          uint64_t v155 = objc_msgSend_count(v11, v151, v152, v153, v154);
          if (v150 != v155)
          {
            if (v150 - v155 <= 1) {
              uint64_t v156 = 1;
            }
            else {
              uint64_t v156 = v150 - v155;
            }
            do
            {
              v157 = objc_alloc_init(ECEFCoordinate);
              objc_msgSend_addObject_(v11, v158, (uint64_t)v157, v159, v160);

              --v156;
            }
            while (v156);
          }
          if (qword_26ABF4AF8 == -1)
          {
            v161 = qword_26ABF4AF0;
            if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_FAULT)) {
              goto LABEL_137;
            }
          }
          else
          {
            dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
            v161 = qword_26ABF4AF0;
            if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_FAULT))
            {
LABEL_137:
              *(_DWORD *)v336 = 67109120;
              *(_DWORD *)&v336[4] = v150;
              _os_log_impl(&dword_221DDF000, v161, OS_LOG_TYPE_FAULT, "@IndoorAvl, load, Needed to allocate additional ECEFCoordinates for the pool: total required %d", v336, 8u);
            }
          }
        }
        if ((int)v150 >= 1)
        {
          uint64_t v162 = 0;
          uint64_t v163 = 8 * v150;
          do
          {
            objc_msgSend_setFromLatitude_longitude_andAltitude_(v311, v151, v152, v153, v154, *(double *)(*(void *)(v307 + 16) + v162), *(double *)(*(void *)(v307 + 40) + v162), 0.0);
            v168 = objc_msgSend_lastObject(v11, v164, v165, v166, v167);
            objc_msgSend_removeLastObject(v11, v169, v170, v171, v172);
            objc_msgSend_setFromLatLon_(v168, v173, (uint64_t)v311, v174, v175);
            objc_msgSend_addObject_(v310, v176, (uint64_t)v168, v177, v178);

            v162 += 8;
          }
          while (v163 != v162);
        }
        objc_msgSend_storeAverage_ofVertices_(CLLocationGroup, v151, (uint64_t)v300, (uint64_t)v310, v154);
        objc_msgSend_setFromECEFCoordinate_(v304, v179, (uint64_t)v300, v180, v181);
        if (objc_msgSend_count(v297, v182, v183, v184, v185))
        {
          long long v324 = 0u;
          long long v325 = 0u;
          long long v322 = 0u;
          long long v323 = 0u;
          id v190 = v297;
          uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v191, (uint64_t)&v322, (uint64_t)v335, 16);
          if (v192)
          {
            uint64_t v193 = *(void *)v323;
LABEL_144:
            uint64_t v194 = 0;
            while (1)
            {
              if (*(void *)v323 != v193) {
                objc_enumerationMutation(v190);
              }
              id v195 = *(id *)(*((void *)&v322 + 1) + 8 * v194);
              objc_msgSend_distBetweenLatLon_latlon1_(CLAvailableVenuesStateMachine, v196, (uint64_t)v304, (uint64_t)v195, v197);
              double v199 = v198;
              BOOL v200 = v198 >= self->_maxLoadRadius;

              if (!v200) {
                break;
              }
              if (v192 == ++v194)
              {
                uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v201, (uint64_t)&v322, (uint64_t)v335, 16);
                if (v192) {
                  goto LABEL_144;
                }
                break;
              }
            }
          }
          else
          {
            double v199 = 1.79769313e308;
          }
        }
        else
        {
          double v199 = 0.0;
        }
        double maxLoadRadius = self->_maxLoadRadius;
        BOOL v301 = v199 > maxLoadRadius;
        if (v199 > maxLoadRadius)
        {
          v296 -= objc_msgSend_count(v305, v186, v187, v188, v189);
        }
        else
        {
          v210 = [CLLocationGroup alloc];
          v212 = objc_msgSend_initWithGroupId_locationIds_center_wifiOnlyDownloadLocIdxs_locationContext_andTolerance_(v210, v211, v293, (uint64_t)v305, (uint64_t)v300, &v329, v292, *(double *)(v307 + 64));
          v315 = v212;
          Vertices = (double ***)objc_msgSend_getVertices(v212, v213, v214, v215, v216);
          long long v320 = 0u;
          long long v321 = 0u;
          long long v318 = 0u;
          long long v319 = 0u;
          id obj = v310;
          uint64_t v219 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v218, (uint64_t)&v318, (uint64_t)v334, 16);
          uint64_t v224 = v219;
          if (v219)
          {
            uint64_t v314 = *(void *)v319;
            do
            {
              uint64_t v225 = 0;
              do
              {
                if (*(void *)v319 != v314) {
                  objc_enumerationMutation(obj);
                }
                v226 = *(void **)(*((void *)&v318 + 1) + 8 * v225);
                v227 = *Vertices;
                v228 = objc_msgSend_centerLatLon(v212, v220, v221, v222, v223);
                v233 = objc_msgSend_centerECEF(v212, v229, v230, v231, v232);
                objc_msgSend_toBoostEnuWithLatLonOrigin_andEcefOrigin_usingENU_(v226, v234, (uint64_t)v228, (uint64_t)v233, (uint64_t)v317);
                uint64_t v237 = v235;
                uint64_t v238 = v236;
                v240 = (void *)v227[1];
                unint64_t v239 = v227[2];
                if ((unint64_t)v240 < v239)
                {
                  void *v240 = v235;
                  v240[1] = v236;
                  v241 = v240 + 2;
                  v11 = v316;
                  goto LABEL_182;
                }
                v242 = (void *)*v227;
                uint64_t v243 = ((uint64_t)v240 - *v227) >> 4;
                unint64_t v244 = v243 + 1;
                if ((unint64_t)(v243 + 1) >> 60) {
                  sub_221E28DE8();
                }
                uint64_t v245 = v239 - (void)v242;
                if (v245 >> 3 > v244) {
                  unint64_t v244 = v245 >> 3;
                }
                if ((unint64_t)v245 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v246 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v246 = v244;
                }
                if (v246)
                {
                  if (v246 >> 60) {
                    sub_221DE2674();
                  }
                  v247 = (char *)operator new(16 * v246);
                  v248 = &v247[16 * v243];
                  *(void *)v248 = v237;
                  *((void *)v248 + 1) = v238;
                  uint64_t v249 = (uint64_t)v248;
                  if (v240 == v242)
                  {
LABEL_185:
                    v11 = v316;
                    v241 = v248 + 16;
                    void *v227 = v249;
                    v227[1] = v248 + 16;
                    v227[2] = &v247[16 * v246];
                    if (v240) {
                      goto LABEL_181;
                    }
                    goto LABEL_182;
                  }
                }
                else
                {
                  v247 = 0;
                  v248 = (char *)(16 * v243);
                  *(void *)v248 = v235;
                  *((void *)v248 + 1) = v236;
                  uint64_t v249 = 16 * v243;
                  if (v240 == v242) {
                    goto LABEL_185;
                  }
                }
                v11 = v316;
                do
                {
                  *(_OWORD *)(v249 - 16) = *((_OWORD *)v240 - 1);
                  v249 -= 16;
                  v240 -= 2;
                }
                while (v240 != v242);
                v240 = (void *)*v227;
                v241 = v248 + 16;
                void *v227 = v249;
                v227[1] = v248 + 16;
                v227[2] = &v247[16 * v246];
                if (v240) {
LABEL_181:
                }
                  operator delete(v240);
LABEL_182:
                v227[1] = v241;

                v212 = v315;
                ++v225;
              }
              while (v225 != v224);
              uint64_t v250 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v220, (uint64_t)&v318, (uint64_t)v334, 16, *((*Vertices)[1] - 1));
              uint64_t v224 = v250;
            }
            while (v250);
          }

          if (*(_DWORD *)(v307 + 48) != ((char *)(*Vertices)[1] - (char *)**Vertices) >> 4)
          {
            sub_221E424BC((NSObject **)v336);

            abort_report_np();
            goto LABEL_277;
          }
          sub_221E28E00(*Vertices);
          objc_msgSend_addObject_(v295, v251, (uint64_t)v315, v252, v253);

          ++v294;
        }
        objc_msgSend_addObjectsFromArray_(v11, v207, (uint64_t)v310, v208, v209);
        objc_msgSend_removeAllObjects(v310, v254, v255, v256, v257);
        goto LABEL_125;
      }
LABEL_223:
      int v52 = 0;
      id v88 = (id)v293;
LABEL_212:
      sub_221E28BE0((uint64_t)&v326, v327);
      sub_221E28BE0((uint64_t)&v329, v330);

      if (v333 < 0) {
        goto LABEL_213;
      }
LABEL_214:
      sub_221E3A614(buf);
      if (v52 != 11 && v52)
      {
        id v281 = 0;
        v282 = v295;
        goto LABEL_253;
      }
      if (++v309 == v303) {
        goto LABEL_236;
      }
    }
  }
  uint64_t v294 = 0;
  uint64_t v296 = 0;
LABEL_236:
  if (objc_msgSend_tileIsOpenForIncrementalIO(v308, v39, v40, v41, v42))
  {
    sub_221E3830C((uint64_t)buf);
    if (qword_26ABF4AF8 != -1) {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
    }
    v274 = (id)qword_26ABF4AF0;
    if (os_log_type_enabled(v274, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v336 = 0;
      _os_log_impl(&dword_221DDF000, v274, OS_LOG_TYPE_INFO, "@IndoorAvl, load, make sure we have no more venue bounds to read", v336, 2u);
    }

    if (objc_msgSend_getNextVenueBoundsIncrementally_(v308, v275, (uint64_t)buf, v276, v277))
    {
      if (qword_26ABF4AF8 != -1) {
        dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
      }
      v278 = (id)qword_26ABF4AF0;
      if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v336 = 0;
        _os_log_impl(&dword_221DDF000, v278, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, had venues left over after iterating over all venues in tile. why?", v336, 2u);
      }
    }
    sub_221E3A614(buf);
  }
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
  }
  v279 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v279, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v338 = v296;
    __int16 v339 = 2048;
    *(void *)v340 = v294;
    _os_log_impl(&dword_221DDF000, v279, OS_LOG_TYPE_DEBUG, "Found %zu floors across %zu venues", buf, 0x16u);
  }

  v282 = v295;
  id v281 = v295;
LABEL_253:

  return v281;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4
{
  v4 = objc_msgSend_getNearbyLocationGroupsForTile_withUpdatedPos_nearLocationsOfInterest_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  return v4;
}

- (id)openTileParserAtPath:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
  }
  v4 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_absoluteString(v3, v5, v6, v7, v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    int v47 = 136315138;
    uint64_t v48 = objc_msgSend_UTF8String(v9, v10, v11, v12, v13);
    _os_log_impl(&dword_221DDF000, v4, OS_LOG_TYPE_INFO, "Request to get nearby location groups from availability tile at %s", (uint8_t *)&v47, 0xCu);
  }
  v18 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_path(v3, v19, v20, v21, v22);
  char v27 = objc_msgSend_fileExistsAtPath_(v18, v24, (uint64_t)v23, v25, v26);

  if ((v27 & 1) == 0)
  {
    if (qword_26ABF4AF8 == -1)
    {
      int v33 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        uint64_t v34 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
      int v33 = (id)qword_26ABF4AF0;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    objc_msgSend_path(v3, v35, v36, v37, v38);
    id v39 = objc_claimAutoreleasedReturnValue();
    uint64_t v44 = objc_msgSend_UTF8String(v39, v40, v41, v42, v43);
    int v47 = 136315138;
    uint64_t v48 = v44;
    _os_log_impl(&dword_221DDF000, v33, OS_LOG_TYPE_INFO, "#warning, cannot find file %s on-disk", (uint8_t *)&v47, 0xCu);

    goto LABEL_11;
  }
  uint64_t v28 = [CLAvailabilityTileParser alloc];
  uint64_t v32 = objc_msgSend_initWithTilePathIncrementalIO_(v28, v29, (uint64_t)v3, v30, v31);
  int v33 = v32;
  if (v32)
  {
    int v33 = v32;
    uint64_t v34 = v33;
    goto LABEL_16;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
    uint64_t v45 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v45 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEFAULT))
  {
LABEL_14:
    LOWORD(v47) = 0;
    _os_log_impl(&dword_221DDF000, v45, OS_LOG_TYPE_DEFAULT, "#Warning Couldn't load availability tile - ignoring request for nearby locations", (uint8_t *)&v47, 2u);
  }
LABEL_15:
  uint64_t v34 = 0;
LABEL_16:

  return v34;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4
{
  v4 = objc_msgSend_getNearbyLocationGroups_withUpdatedPos_nearLocationsOfInterest_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  return v4;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_openTileParserAtPath_(self, v10, (uint64_t)a3, v11, v12);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_getNearbyLocationGroupsForTile_withUpdatedPos_nearLocationsOfInterest_(self, v13, (uint64_t)v14, (uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)clearLastFix
{
  lastFix = self->_lastFix;
  self->_lastFix = 0;
}

- (BOOL)shouldRecompute:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  lastFix = self->_lastFix;
  if (!lastFix)
  {
    BOOL v11 = 1;
    goto LABEL_7;
  }
  objc_msgSend_distBetweenLatLon_latlon1_(CLAvailableVenuesStateMachine, v4, (uint64_t)lastFix, (uint64_t)v6, v5);
  double v9 = v8;
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
    uint64_t v10 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    int v13 = 134217984;
    double v14 = v9;
    _os_log_impl(&dword_221DDF000, v10, OS_LOG_TYPE_DEBUG, "@IndoorAvl, load, CLAvailableVenuesStateMachine, shouldRecompute, moveDist, %lf", (uint8_t *)&v13, 0xCu);
  }
LABEL_5:
  BOOL v11 = v9 >= self->_maxLoadRadius * 0.5;
LABEL_7:

  return v11;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [CLIndoorAvailabilityTileParams alloc];
  uint64_t AvlTile = objc_msgSend_getAvlTile(v8, v12, v13, v14, v15);
  uint64_t v20 = (CLIndoorAvailabilityTileParams *)objc_msgSend_initWithAvailabilityTile_(v11, v17, AvlTile, v18, v19);
  availabilityTileParams = self->_availabilityTileParams;
  self->_availabilityTileParams = v20;

  if (!self->_lastFix)
  {
    if (qword_26ABF4AF8 == -1)
    {
      uint64_t v37 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
      uint64_t v37 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    LOWORD(v39) = 0;
    _os_log_impl(&dword_221DDF000, v37, OS_LOG_TYPE_DEBUG, "No previous location stored in state, we should definitely recompute", (uint8_t *)&v39, 2u);
    goto LABEL_11;
  }
  if (qword_26ABF4AF8 != -1) {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
  }
  uint64_t v22 = (id)qword_26ABF4AF0;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_latitude(self->_lastFix, v23, v24, v25, v26);
    uint64_t v28 = v27;
    objc_msgSend_longitude(self->_lastFix, v29, v30, v31, v32);
    int v39 = 134283777;
    uint64_t v40 = v28;
    __int16 v41 = 2049;
    uint64_t v42 = v33;
    _os_log_impl(&dword_221DDF000, v22, OS_LOG_TYPE_DEBUG, "Previous load occurred at %{private}.7lf, %{private}.7lf", (uint8_t *)&v39, 0x16u);
  }

LABEL_11:
  uint64_t v35 = objc_msgSend_recomputeIfNecessary_withGlobalAvailabilityTile_andAdditionalLOIs_(self, v34, (uint64_t)v9, (uint64_t)v8, (uint64_t)v10);

  return v35;
}

- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v15 = v11;
  if (v9)
  {
    if (v11)
    {
      if (qword_26ABF4AF8 != -1)
      {
        dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
        uint64_t v16 = qword_26ABF4AF0;
        if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
        goto LABEL_5;
      }
      uint64_t v16 = qword_26ABF4AF0;
      if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        LOWORD(v34) = 0;
        uint64_t v17 = "Have to recompute because we have locations of interest";
LABEL_14:
        _os_log_impl(&dword_221DDF000, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v34, 2u);
      }
LABEL_15:
      objc_storeStrong((id *)&self->_lastFix, a3);
      goto LABEL_16;
    }
    if (objc_msgSend_shouldRecompute_(self, v12, (uint64_t)v9, v13, v14))
    {
      if (qword_26ABF4AF8 == -1)
      {
        uint64_t v16 = qword_26ABF4AF0;
        if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
      }
      else
      {
        dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
        uint64_t v16 = qword_26ABF4AF0;
        if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
      }
      LOWORD(v34) = 0;
      uint64_t v17 = "Have to recompute nearby location groups because we moved far enough away";
      goto LABEL_14;
    }
    if (qword_26ABF4AF8 == -1)
    {
      uint64_t v32 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_26:
        uint64_t v28 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
      uint64_t v32 = qword_26ABF4AF0;
      if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_26;
      }
    }
    BOOL v30 = self->_lastFix == 0;
    LODWORD(v34) = 67109120;
    HIDWORD(v34) = v30;
    _os_log_impl(&dword_221DDF000, v32, OS_LOG_TYPE_DEBUG, "No need to recompute nearby location groups, (_lastFix==nil) = %d", (uint8_t *)&v34, 8u);
    goto LABEL_26;
  }
  if (qword_26ABF4AF8 != -1)
  {
    dispatch_once(&qword_26ABF4AF8, &unk_26D46B778);
    uint64_t v18 = qword_26ABF4AF0;
    if (!os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  uint64_t v18 = qword_26ABF4AF0;
  if (os_log_type_enabled((os_log_t)qword_26ABF4AF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    LOWORD(v34) = 0;
    _os_log_impl(&dword_221DDF000, v18, OS_LOG_TYPE_DEBUG, "Have to recompute nearby location groups because newCoordinate was not nil?", (uint8_t *)&v34, 2u);
  }
LABEL_16:
  id v19 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v23 = objc_msgSend_initWithArray_(v19, v20, (uint64_t)v15, v21, v22);
  uint64_t v27 = v23;
  if (v9) {
    objc_msgSend_addObject_(v23, v24, (uint64_t)v9, v25, v26);
  }
  uint64_t v28 = objc_msgSend_computeAvailableVenues_nearCoordinates_(self, v24, (uint64_t)v10, (uint64_t)v27, v26, v34, v35);

LABEL_19:
  return v28;
}

+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3
{
  if ((*((unsigned char *)a3 + 104) & 8) != 0) {
    return *((_DWORD *)a3 + 24) != 1;
  }
  uint64_t v5 = *((int *)a3 + 6);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *((void *)a3 + 2);
  uint64_t v7 = 8 * v5;
  while (1)
  {
    id v8 = *(void **)v6;
    if (*(char *)(*(void *)v6 + 23) < 0) {
      id v8 = (void *)*v8;
    }
    id v9 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)v8, v3, v4);
    if ((objc_msgSend_hasPrefix_(v9, v10, @"G", v11, v12) & 1) == 0) {
      break;
    }

    v6 += 8;
    v7 -= 8;
    if (!v7) {
      return 0;
    }
  }
  unsigned int hasPrefix = objc_msgSend_hasPrefix_(v9, v13, @"LR", v14, v15);

  return hasPrefix;
}

- (GeographicCoordinate)lastFix
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 8, 1);
}

- (double)maxLoadRadius
{
  return self->_maxLoadRadius;
}

- (void)setMaxLoadRadius:(double)a3
{
  self->_double maxLoadRadius = a3;
}

- (NSSet)disabledVenues
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisabledVenues:(id)a3
{
}

- (CLIndoorAvailabilityTileParams)availabilityTileParams
{
  return (CLIndoorAvailabilityTileParams *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityTileParams, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);
  objc_storeStrong((id *)&self->_lastFix, 0);
}

@end