@interface StewieBBTimeFreqTransferAssertion
- (StewieBBTimeFreqTransferAssertion)initWithQueue:(id)a3 callback:(void *)a4;
- (id).cxx_construct;
- (void)handleGPSData:(id)a3 heatMapDict:(id)a4 error:(id)a5;
@end

@implementation StewieBBTimeFreqTransferAssertion

- (StewieBBTimeFreqTransferAssertion)initWithQueue:(id)a3 callback:(void *)a4
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)StewieBBTimeFreqTransferAssertion;
  if ([(StewieBBTimeFreqTransferAssertion *)&v8 init])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)location, kCtLoggingSystemName, "stw.gps");
    operator new();
  }

  return 0;
}

- (void)handleGPSData:(id)a3 heatMapDict:(id)a4 error:(id)a5
{
  id v78 = a3;
  id v77 = a4;
  id v76 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (v76)
  {
    objc_super v8 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v76;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Encountered error: %@", buf, 0xCu);
    }

    goto LABEL_147;
  }
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v83 = 0u;
  id v9 = v78;
  v10 = v9;
  if (v9)
  {
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    *(_OWORD *)buf = 0u;
    if (sub_1002154C0(v9, @"kCLBBTFT_messageVersion", buf))
    {
      if (sub_10021551C(v10, @"kCLBBTFT_timestamp", &buf[8]))
      {
        if (sub_100215464(v10, @"kCLBBTFT_systemRTCMsec", &v115))
        {
          if (sub_1002154C0(v10, @"kCLBBTFT_systemRTCSubMsec", (_DWORD *)&v115 + 2))
          {
            if (sub_1002154C0(v10, @"kCLBBTFT_systemRTCUncertaintyMsec", (_DWORD *)&v115 + 3))
            {
              if (sub_100215464(v10, @"kCLBBTFT_GPSTimeNsec", &v116))
              {
                if (sub_1002154C0(v10, @"kCLBBTFT_GPSTimeUncertaintyNsec", (_DWORD *)&v116 + 2))
                {
                  if (sub_10021551C(v10, @"kCLBBTFT_clockOffsetPPB", &v117))
                  {
                    if (sub_1002154C0(v10, @"kCLBBTFT_clockOffsetUncertaintyPPB", (_DWORD *)&v117 + 2))
                    {
                      if (sub_10021551C(v10, @"kCLBBTFT_clockOffsetThermalCorrectionPPB", &v118))
                      {
                        v11 = [v10 valueForKey:@"kCLBBTFT_gpsUtcLeapSecondDictionary"];
                        v12 = v11;
                        if (v11)
                        {
                          if (sub_1002153AC(v11, @"kCLBBTFT_currentGpsUtcLeapSecond", (_DWORD *)&v118 + 2))
                          {
                            if (!sub_1002153AC(v12, @"kCLBBTFT_upcomingGpsUtcLeapSecond", &v119)
                              || (BYTE12(v118) = 1,
                                  sub_100215464(v12, @"kCLBBTFT_upcomingGpsUtcLeapSeconUpdateDeltaTimeGPSNsec", (void *)&v119 + 1)))
                            {
                              if (sub_100215464(v12, @"kCLBBTFT_possibleGpsUtcLeapSeconUpdateDeltaTimeGPSNsec", (void *)&v120 + 1))
                              {
                                LOBYTE(v120) = 1;
                              }
                              long long v87 = v118;
                              long long v88 = v119;
                              long long v89 = v120;
                              long long v83 = *(_OWORD *)buf;
                              long long v84 = v115;
                              int v13 = 1;
                              long long v85 = v116;
                              long long v86 = v117;
                              goto LABEL_172;
                            }
                            v65 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v112 = 138412290;
                              id v113 = v10;
                              _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_upcomingGpsUtcLeapSeconUpdateDeltaTimeGPSNsec in %@", v112, 0xCu);
                            }
                          }
                          else
                          {
                            v65 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v112 = 138412290;
                              id v113 = v10;
                              _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_currentGpsUtcLeapSecond in %@", v112, 0xCu);
                            }
                          }
                        }
                        else
                        {
                          v65 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v112 = 138412290;
                            id v113 = v10;
                            _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_gpsUtcLeapSecondDictionary in %@", v112, 0xCu);
                          }
                        }

                        int v13 = 0;
                        LOBYTE(v83) = 0;
LABEL_172:
                        LOBYTE(v90) = v13;

                        goto LABEL_54;
                      }
                      v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v112 = 138412290;
                        id v113 = v10;
                        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_clockOffsetThermalCorrectionPPB in %@", v112, 0xCu);
                      }
                    }
                    else
                    {
                      v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v112 = 138412290;
                        id v113 = v10;
                        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_clockOffsetUncertaintyPPB in %@", v112, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v112 = 138412290;
                      id v113 = v10;
                      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_clockOffsetPPB in %@", v112, 0xCu);
                    }
                  }
                }
                else
                {
                  v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v112 = 138412290;
                    id v113 = v10;
                    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_GPSTimeUncertaintyNsec in %@", v112, 0xCu);
                  }
                }
              }
              else
              {
                v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v112 = 138412290;
                  id v113 = v10;
                  _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_GPSTimeNsec in %@", v112, 0xCu);
                }
              }
            }
            else
            {
              v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v112 = 138412290;
                id v113 = v10;
                _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_systemRTCSubMsec in %@", v112, 0xCu);
              }
            }
          }
          else
          {
            v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v112 = 138412290;
              id v113 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_systemRTCSubMsec in %@", v112, 0xCu);
            }
          }
        }
        else
        {
          v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v112 = 138412290;
            id v113 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_systemRTCMsec in %@", v112, 0xCu);
          }
        }
      }
      else
      {
        v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v112 = 138412290;
          id v113 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_timestamp in %@", v112, 0xCu);
        }
      }
    }
    else
    {
      v14 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v112 = 138412290;
        id v113 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to parse kCLBBTFT_messageVersion in %@", v112, 0xCu);
      }
    }
  }
  int v13 = 0;
  LOBYTE(v83) = 0;
  LOBYTE(v90) = 0;
LABEL_54:

  id v15 = [v10 count];
  if (!v13 && v15)
  {
    v16 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to parse timeFreqData: %@", buf, 0xCu);
    }

    goto LABEL_147;
  }
  uint64_t v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  memset(v79, 0, sizeof(v79));
  id v17 = v77;
  if (v17)
  {
    uint64_t v104 = 0;
    long long v106 = 0u;
    memset(__p, 0, sizeof(__p));
    v105 = &v106;
    id v75 = v17;
    if (!sub_10021551C(v17, @"kCLGnssHeatMap_timestamp", __p))
    {
      v55 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v75;
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to parse kCLGnssHeatMap_timestamp in %@", buf, 0xCu);
      }

      LOBYTE(v79[0]) = 0;
      LOBYTE(v82) = 0;
      goto LABEL_136;
    }
    v18 = [v75 objectForKey:@"kCLGnssHeatMap_elevationBuckets"];
    v73 = v18;
    if (v18)
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v99 objects:buf count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v100;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v100 != v21) {
              objc_enumerationMutation(v19);
            }
            unsigned int v23 = [*(id *)(*((void *)&v99 + 1) + 8 * i) unsignedIntValue];
            unsigned int v24 = v23;
            v25 = (char *)__p[2];
            if (__p[2] >= __p[3])
            {
              v27 = (char *)__p[1];
              int64_t v28 = ((char *)__p[2] - (char *)__p[1]) >> 2;
              unint64_t v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62) {
                sub_10006A748();
              }
              int64_t v30 = (char *)__p[3] - (char *)__p[1];
              if (((char *)__p[3] - (char *)__p[1]) >> 1 > v29) {
                unint64_t v29 = v30 >> 1;
              }
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31)
              {
                v32 = (char *)sub_10005ECD8((uint64_t)&__p[3], v31);
                v25 = (char *)__p[2];
                v27 = (char *)__p[1];
              }
              else
              {
                v32 = 0;
              }
              v33 = (unsigned int *)&v32[4 * v28];
              unsigned int *v33 = v24;
              v26 = v33 + 1;
              while (v25 != v27)
              {
                unsigned int v34 = *((_DWORD *)v25 - 1);
                v25 -= 4;
                *--v33 = v34;
              }
              __p[1] = v33;
              __p[2] = v26;
              __p[3] = &v32[4 * v31];
              if (v27) {
                operator delete(v27);
              }
            }
            else
            {
              *(_DWORD *)__p[2] = v23;
              v26 = v25 + 4;
            }
            __p[2] = v26;
          }
          id v20 = [v19 countByEnumeratingWithState:&v99 objects:buf count:16];
        }
        while (v20);
      }

      v35 = __p[2];
      v36 = __p[1];
      if ([v19 count] == (id)((v35 - v36) >> 2))
      {
        if (sub_100215408(v75, @"kCLGnssHeatMap_numAzimuthBuckets", &v104))
        {
          v37 = [v75 objectForKey:@"kCLGnssHeatMap_data"];
          v71 = v37;
          if (v37)
          {
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id obj = v37;
            id v68 = [obj countByEnumeratingWithState:&v95 objects:v112 count:16];
            if (v68)
            {
              uint64_t v69 = *(void *)v96;
              while (2)
              {
                for (j = 0; j != v68; j = (char *)j + 1)
                {
                  if (*(void *)v96 != v69) {
                    objc_enumerationMutation(obj);
                  }
                  v67 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
                  v38 = objc_msgSend(obj, "objectForKey:");
                  if (!v38)
                  {
                    v64 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v110) = 138412290;
                      *(void *)((char *)&v110 + 4) = v67;
                      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to parse xDict at %@", (uint8_t *)&v110, 0xCu);
                    }

                    LOBYTE(v79[0]) = 0;
                    LOBYTE(v82) = 0;
LABEL_155:

                    goto LABEL_160;
                  }
                  *((void *)&v110 + 1) = 0;
                  v111 = 0;
                  *(void *)&long long v110 = (char *)&v110 + 8;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v94 = 0u;
                  id v74 = v38;
                  id v39 = [v74 countByEnumeratingWithState:&v91 objects:v109 count:16];
                  if (v39)
                  {
                    uint64_t v40 = *(void *)v92;
                    while (2)
                    {
                      for (k = 0; k != v39; k = (char *)k + 1)
                      {
                        if (*(void *)v92 != v40) {
                          objc_enumerationMutation(v74);
                        }
                        v42 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
                        v43 = [v74 objectForKey:v42];
                        if (!v43)
                        {
                          v62 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v107 = 138412290;
                            id v108 = v42;
                            _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to parse visibility at %@", v107, 0xCu);
                          }

                          LOBYTE(v79[0]) = 0;
                          LOBYTE(v82) = 0;

                          goto LABEL_154;
                        }
                        unsigned int v44 = [v42 unsignedIntValue];
                        unsigned int v45 = [v43 unsignedIntValue];
                        if (v45 < 4) {
                          char v46 = v45 + 1;
                        }
                        else {
                          char v46 = 0;
                        }
                        uint64_t v47 = *((void *)&v110 + 1);
                        v48 = (void *)&v110 + 1;
                        v49 = (void *)&v110 + 1;
                        if (*((void *)&v110 + 1))
                        {
                          while (1)
                          {
                            while (1)
                            {
                              v49 = (void *)v47;
                              unsigned int v50 = *(_DWORD *)(v47 + 28);
                              if (v50 <= v44) {
                                break;
                              }
                              uint64_t v47 = *v49;
                              v48 = v49;
                              if (!*v49) {
                                goto LABEL_110;
                              }
                            }
                            if (v50 >= v44) {
                              break;
                            }
                            uint64_t v47 = v49[1];
                            if (!v47)
                            {
                              v48 = v49 + 1;
                              goto LABEL_110;
                            }
                          }
                        }
                        else
                        {
LABEL_110:
                          v51 = operator new(0x28uLL);
                          v51[7] = v44;
                          *((unsigned char *)v51 + 32) = v46;
                          *(void *)v51 = 0;
                          *((void *)v51 + 1) = 0;
                          *((void *)v51 + 2) = v49;
                          void *v48 = v51;
                          if (*(void *)v110)
                          {
                            *(void *)&long long v110 = *(void *)v110;
                            v51 = (_DWORD *)*v48;
                          }
                          sub_100046C90(*((uint64_t **)&v110 + 1), (uint64_t *)v51);
                          ++v111;
                        }
                      }
                      id v39 = [v74 countByEnumeratingWithState:&v91 objects:v109 count:16];
                      if (v39) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v52 = v111;
                  if (v52 != [v74 count])
                  {
                    v66 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v107 = 138412290;
                      id v108 = v74;
                      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to parse xMap size mismatch: %@", v107, 0xCu);
                    }

                    LOBYTE(v79[0]) = 0;
                    LOBYTE(v82) = 0;
LABEL_154:
                    sub_1000346F8((uint64_t)&v110, *((void **)&v110 + 1));

                    goto LABEL_155;
                  }
                  unsigned int v53 = [v67 unsignedIntValue];
                  sub_1004F3298((uint64_t *)&v105, v53, v53, (uint64_t *)&v110);
                  sub_1000346F8((uint64_t)&v110, *((void **)&v110 + 1));
                }
                id v68 = [obj countByEnumeratingWithState:&v95 objects:v112 count:16];
                if (v68) {
                  continue;
                }
                break;
              }
            }

            id v54 = (id)*((void *)&v106 + 1);
            if (v54 == [obj count])
            {
              *(void **)&v79[0] = __p[0];
              *(_OWORD *)((char *)v79 + 8) = *(_OWORD *)&__p[1];
              *((void **)&v79[1] + 1) = __p[3];
              memset(&__p[1], 0, 24);
              LODWORD(v80) = v104;
              *((void *)&v80 + 1) = v105;
              long long v81 = v106;
              if (*((void *)&v106 + 1))
              {
                *(void *)(v106 + 16) = &v81;
                v105 = &v106;
                long long v106 = 0uLL;
              }
              else
              {
                *((void *)&v80 + 1) = &v81;
              }
              LOBYTE(v82) = 1;
              goto LABEL_160;
            }
            v63 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v110) = 138412290;
              *(void *)((char *)&v110 + 4) = obj;
              _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to parse visibility data size mismatch: %@", (uint8_t *)&v110, 0xCu);
            }
          }
          else
          {
            v61 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v112 = 138412290;
              id v113 = v75;
              _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Failed to parse CLGnssHeatMap_data in %@", v112, 0xCu);
            }
          }
          LOBYTE(v79[0]) = 0;
          LOBYTE(v82) = 0;
LABEL_160:

          goto LABEL_135;
        }
        v57 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v112 = 138412290;
          id v113 = v75;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to parse kCLGnssHeatMap_numAzimuthBuckets in %@", v112, 0xCu);
        }
      }
      else
      {
        v57 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v112 = 138412290;
          id v113 = v75;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to parse yBuckets in %@", v112, 0xCu);
        }
      }
    }
    else
    {
      v56 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v75;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to parse kCLGnssHeatMap_elevationBuckets in %@", buf, 0xCu);
      }
    }
    LOBYTE(v79[0]) = 0;
    LOBYTE(v82) = 0;
LABEL_135:

LABEL_136:
    sub_10024D10C((uint64_t)&v105, (void *)v106);
    if (__p[1])
    {
      __p[2] = __p[1];
      operator delete(__p[1]);
    }
    id v17 = v75;
    goto LABEL_139;
  }
  LOBYTE(v79[0]) = 0;
  LOBYTE(v82) = 0;
LABEL_139:
  v58 = v17;

  if (![v58 count] || (_BYTE)v82)
  {
    f = self->fCallback.__f_.__f_;
    if (!f) {
      sub_10007B600();
    }
    (*(void (**)(void *, long long *, _OWORD *))(*(void *)f + 48))(f, &v83, v79);
  }
  else
  {
    v59 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v58;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to parse heatMap: %@", buf, 0xCu);
    }
  }
  sub_1004F3390((uint64_t)v79);
LABEL_147:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fAssertion, 0);
  objc_storeStrong((id *)&self->fQueue, 0);
  sub_1004F33D8(self->fCallback.__f_.__buf_.__lx);

  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end