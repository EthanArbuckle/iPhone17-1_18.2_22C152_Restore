@interface GEOAlmanac
- (BOOL)isDayLight;
- (BOOL)isDayLightForDate:(id)a3;
- (BOOL)isDayLightForTime:(double)a3;
- (NSDate)nextSunrise;
- (NSDate)nextSunset;
- (NSDate)nextTransit;
- (NSDate)previousSunrise;
- (NSDate)previousSunset;
- (NSDate)previousTransit;
- (NSDate)sunrise;
- (NSDate)sunset;
- (NSDate)transit;
- (id)description;
- (void)calculateAstronomicalTimeForLocation:(id)a3;
- (void)calculateAstronomicalTimeForLocation:(id)a3 altitudeInDegrees:(double)a4;
- (void)calculateAstronomicalTimeForLocation:(id)a3 date:(id)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6;
- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4;
- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5;
- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6;
- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5;
- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5 date:(id)a6;
@end

@implementation GEOAlmanac

- (NSDate)transit
{
  return [(GEOAlmanacRiseTransitSet *)self->_currentRiseTransitSet transit];
}

- (NSDate)previousTransit
{
  return [(GEOAlmanacRiseTransitSet *)self->_previousRiseTransitSet transit];
}

- (NSDate)nextTransit
{
  return [(GEOAlmanacRiseTransitSet *)self->_nextRiseTransitSet transit];
}

- (NSDate)sunset
{
  return [(GEOAlmanacRiseTransitSet *)self->_currentRiseTransitSet set];
}

- (NSDate)sunrise
{
  return [(GEOAlmanacRiseTransitSet *)self->_currentRiseTransitSet rise];
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a5);
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4 altitudeInDegrees:(double)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a5);
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 date:(id)a4 altitudeInDegrees:(double)a5 options:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v166 = a3;
  id v149 = a4;
  objc_msgSend(v149, "geo_julianDay");
  double v10 = v9;
  self->_location = ($AB5116BA7E623E054F959CECB034F4E7)v166;
  self->_altitude = a5;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x4812000000;
  v161 = __Block_byref_object_copy__90;
  v162 = __Block_byref_object_dispose__90;
  v163 = "";
  v165[0] = 0;
  v165[1] = 0;
  v164 = v165;
  previousRiseTransitSet = self->_previousRiseTransitSet;
  self->_previousRiseTransitSet = 0;

  currentRiseTransitSet = self->_currentRiseTransitSet;
  self->_currentRiseTransitSet = 0;

  nextRiseTransitSet = self->_nextRiseTransitSet;
  self->_nextRiseTransitSet = 0;

  v14 = GEOGetAlmanacLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68158211;
    *(_DWORD *)&buf[4] = 16;
    *(_WORD *)&buf[8] = 2097;
    *(void *)&buf[10] = &v166;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = a5;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "location: [%{private,geo:coordinate}.*P] altitude: %f", buf, 0x1Cu);
  }

  v15 = GEOGetAlmanacLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v18 = v17;
    if (fabs(v166.var0) < 0.001) {
      [v17 addObject:@"latitude"];
    }
    if (fabs(v166.var1) < 0.001) {
      [v18 addObject:@"longitude"];
    }
    if ([v18 count])
    {
      v19 = GEOGetAlmanacLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v18 componentsJoinedByString:@" & "];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v20;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_INFO, "location %{public}@ is effectively zero", buf, 0xCu);
      }
    }
  }
  v21 = GEOGetAlmanacLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v22)
  {
    double v23 = CAADynamicalTime::UTC2TT((CAADynamicalTime *)v22, v10);
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v23;
    _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "today's julian date: %f ephemeris date: %f", buf, 0x16u);
  }

  uint64_t v154 = 0;
  v155 = &v154;
  uint64_t v156 = 0x2020000000;
  int v157 = 0;
  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = __82__GEOAlmanac_calculateAstronomicalTimeForLocation_date_altitudeInDegrees_options___block_invoke;
  v151[3] = &unk_1E53ED550;
  $F24F406B2B787EFB06265DBA3D28CBD5 v152 = v166;
  double v153 = a5;
  v151[4] = &v158;
  v151[5] = &v154;
  v24 = (void (**)(void, void, double))MEMORY[0x18C120660](v151);
  v150 = v24;
  v24[2](v24, 0, v10);
  v24[2](v24, 1, v10 + -0.000694444444);
  if (!v159[8])
  {
    v133 = GEOGetAlmanacLog();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v133, OS_LOG_TYPE_FAULT, "failed to find any rts events", buf, 2u);
    }

    if (!v159[8]) {
      goto LABEL_219;
    }
  }
  double v25 = v10;
  double v26 = v10;
  double v148 = a5;
  do
  {
    v27 = self->_currentRiseTransitSet;
    if (v27)
    {
      uint64_t v28 = [(GEOAlmanacRiseTransitSet *)v27 firstItem];
      v30 = v159;
      v31 = (uint64_t *)v159[6];
      v32 = v159 + 7;
      uint64_t v33 = (uint64_t)v31;
      if (v31 != v159 + 7)
      {
        int v34 = v29;
        unint64_t v35 = 0;
        double v36 = *(double *)&v28;
        v37 = (void *)v159[6];
        do
        {
          v38 = (void *)v37[1];
          if (v38)
          {
            do
            {
              v39 = v38;
              v38 = (void *)*v38;
            }
            while (v38);
          }
          else
          {
            do
            {
              v39 = (void *)v37[2];
              BOOL v55 = *v39 == (void)v37;
              v37 = v39;
            }
            while (!v55);
          }
          ++v35;
          v37 = v39;
        }
        while (v39 != v32);
        uint64_t v33 = v159[6];
        do
        {
          unint64_t v40 = v35 >> 1;
          v41 = (void *)v33;
          if (v35 >= 2)
          {
            uint64_t v42 = v35 >> 1;
            uint64_t v43 = v33;
            do
            {
              v44 = *(void **)(v43 + 8);
              if (v44)
              {
                do
                {
                  v41 = v44;
                  v44 = (void *)*v44;
                }
                while (v44);
              }
              else
              {
                do
                {
                  v41 = *(void **)(v43 + 16);
                  BOOL v55 = *v41 == v43;
                  uint64_t v43 = (uint64_t)v41;
                }
                while (!v55);
              }
              uint64_t v43 = (uint64_t)v41;
              BOOL v45 = v42-- <= 1;
            }
            while (!v45);
          }
          if (_GEORiseTransitSetEventIsLessThan::operator()(*((_DWORD *)v41 + 10), v34, *((double *)v41 + 4), v36))
          {
            v46 = (void *)v41[1];
            if (v46)
            {
              do
              {
                uint64_t v33 = (uint64_t)v46;
                v46 = (void *)*v46;
              }
              while (v46);
            }
            else
            {
              do
              {
                uint64_t v33 = v41[2];
                BOOL v55 = *(void *)v33 == (void)v41;
                v41 = (void *)v33;
              }
              while (!v55);
            }
            unint64_t v40 = v35 + ~v40;
          }
          unint64_t v35 = v40;
        }
        while (v40);
      }
      v27 = self->_currentRiseTransitSet;
      if (v27)
      {
        v24 = v150;
        if (v32 != (void *)v33) {
          goto LABEL_89;
        }
      }
      else
      {
        v24 = v150;
      }
    }
    else
    {
      v30 = v159;
      v31 = (uint64_t *)v159[6];
    }
    v47 = v30 + 7;
    uint64_t v33 = (uint64_t)v31;
    if (v31 != v30 + 7)
    {
      uint64_t v33 = (uint64_t)v31;
      while (1)
      {
        double v48 = *(double *)(v33 + 32);
        if (v48 >= v10 || vabdd_f64(v48, v10) < 0.0007) {
          break;
        }
        v49 = *(void **)(v33 + 8);
        if (v49)
        {
          do
          {
            v50 = v49;
            v49 = (void *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            v50 = *(void **)(v33 + 16);
            BOOL v55 = *v50 == v33;
            uint64_t v33 = (uint64_t)v50;
          }
          while (!v55);
        }
        uint64_t v33 = (uint64_t)v50;
        if (v50 == v47) {
          goto LABEL_218;
        }
      }
    }
    if ((void *)v33 == v47)
    {
LABEL_218:
      if (v30[8]) {
        goto LABEL_219;
      }
      v126 = GEOGetAlmanacLog();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v126, OS_LOG_TYPE_FAULT, "failed to find requested JD", buf, 2u);
      }
      goto LABEL_226;
    }
    int v51 = *(_DWORD *)(v33 + 40);
    if ((uint64_t *)v33 != v31 && v51 != 8)
    {
      v52 = (void *)v33;
      while (*(double *)(v33 + 32) - *((double *)v52 + 4) <= 1.1)
      {
        if (*((_DWORD *)v52 + 10) == 8)
        {
          uint64_t v33 = (uint64_t)v52;
          break;
        }
        v53 = (uint64_t *)*v52;
        if (*v52)
        {
          do
          {
            v54 = v53;
            v53 = (uint64_t *)v53[1];
          }
          while (v53);
        }
        else
        {
          do
          {
            v54 = (uint64_t *)v52[2];
            BOOL v55 = *v54 == (void)v52;
            v52 = v54;
          }
          while (v55);
        }
        v52 = v54;
        if (v54 == v31) {
          break;
        }
      }
      int v51 = *(_DWORD *)(v33 + 40);
    }
    BOOL v55 = v51 == 8 || v33 == (void)v47;
    if (!v55)
    {
      v56 = (void *)v33;
      while (*((double *)v56 + 4) - *(double *)(v33 + 32) <= 0.9)
      {
        if (*((_DWORD *)v56 + 10) == 8)
        {
          uint64_t v33 = (uint64_t)v56;
          break;
        }
        v57 = (void *)v56[1];
        if (v57)
        {
          do
          {
            v58 = v57;
            v57 = (void *)*v57;
          }
          while (v57);
        }
        else
        {
          do
          {
            v58 = (void *)v56[2];
            BOOL v55 = *v58 == (void)v56;
            v56 = v58;
          }
          while (!v55);
        }
        v56 = v58;
        if (v58 == v47) {
          break;
        }
      }
    }
LABEL_89:
    if ((v6 & 6) != 0 && ![(GEOAlmanacRiseTransitSet *)v27 isIdeal])
    {
      if (self->_currentRiseTransitSet)
      {
        v59 = self->_previousRiseTransitSet;
        self->_previousRiseTransitSet = 0;

        v60 = self->_nextRiseTransitSet;
        self->_nextRiseTransitSet = 0;
      }
      _getRTS<std::__tree_const_iterator<_GEORiseTransitSetEvent,std::__tree_node<_GEORiseTransitSetEvent,void *> *,long>,BOOL (*)(unsigned int,unsigned int)>(v33, v159 + 7);
      v61 = (GEOAlmanacRiseTransitSet *)objc_claimAutoreleasedReturnValue();
      v62 = self->_currentRiseTransitSet;
      self->_currentRiseTransitSet = v61;
    }
    if ((v6 & 1) != 0 && ![(GEOAlmanacRiseTransitSet *)self->_previousRiseTransitSet isIdeal])
    {
      v63 = (uint64_t *)v159[6];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x4012000000;
      *(void *)&buf[24] = __Block_byref_object_copy__135;
      *(void *)v193 = __Block_byref_object_dispose__136;
      *(void *)&v193[8] = "";
      *(void *)&v193[16] = v63;
      *(void *)&v193[24] = v63;
      uint64_t v184 = 0;
      v185 = &v184;
      uint64_t v186 = 0x4012000000;
      v187 = __Block_byref_object_copy__135;
      v188 = __Block_byref_object_dispose__136;
      v189 = "";
      v190 = v63;
      v191 = v63;
      uint64_t v176 = 0;
      v177 = &v176;
      uint64_t v178 = 0x4012000000;
      v179 = __Block_byref_object_copy__135;
      v180 = __Block_byref_object_dispose__136;
      v181 = "";
      v182 = v63;
      v183 = v63;
      v174[0] = 0;
      v174[1] = v174;
      v174[2] = 0x2020000000;
      char v175 = 0;
      v173[0] = MEMORY[0x1E4F143A8];
      v173[1] = 3221225472;
      v173[2] = ___ZL7_getRTSINSt3__116reverse_iteratorINS0_21__tree_const_iteratorI23_GEORiseTransitSetEventPNS0_11__tree_nodeIS3_PvEElEEEEPFbjjEEP24GEOAlmanacRiseTransitSetT_SE_T0__block_invoke;
      v173[3] = &unk_1E53ED5A0;
      v173[4] = buf;
      v173[5] = &v176;
      v173[6] = &v184;
      v173[7] = v174;
      uint64_t v64 = MEMORY[0x18C120660](v173);
      v65 = (void (**)(void, void, void))v64;
      if ((uint64_t *)v33 != v63)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v64, v33, v33);
        v66 = *(uint64_t **)v33;
        v67 = *(uint64_t **)v33;
        v68 = (void *)v33;
        if (*(void *)v33)
        {
          do
          {
            v69 = v67;
            v67 = (uint64_t *)v67[1];
          }
          while (v67);
        }
        else
        {
          do
          {
            v69 = (uint64_t *)v68[2];
            BOOL v55 = *v69 == (void)v68;
            v68 = v69;
          }
          while (v55);
        }
        if (v69 != v63)
        {
          uint64_t v70 = v33;
          if (v66)
          {
            do
            {
              uint64_t v71 = (uint64_t)v66;
              v66 = (uint64_t *)v66[1];
            }
            while (v66);
          }
          else
          {
            do
            {
              uint64_t v71 = *(void *)(v70 + 16);
              BOOL v55 = *(void *)v71 == v70;
              uint64_t v70 = v71;
            }
            while (v55);
          }
          uint64_t v72 = *v69;
          v73 = v69;
          if (*v69)
          {
            do
            {
              uint64_t v74 = v72;
              uint64_t v72 = *(void *)(v72 + 8);
            }
            while (v72);
          }
          else
          {
            do
            {
              uint64_t v74 = v73[2];
              BOOL v55 = *(void *)v74 == (void)v73;
              v73 = (uint64_t *)v74;
            }
            while (v55);
          }
          int v75 = *(_DWORD *)(v71 + 40);
          int v76 = *(_DWORD *)(v74 + 40);
          if (v75 == 8)
          {
            if (v76 != 32) {
              goto LABEL_140;
            }
          }
          else if (v75 == 32)
          {
            if (v76 != 16) {
              goto LABEL_140;
            }
          }
          else if (v75 != 16 || v76 != 8)
          {
            goto LABEL_140;
          }
          ((void (**)(void, uint64_t, uint64_t *))v65)[2](v65, v33, v69);
          uint64_t v77 = *v69;
          v78 = (uint64_t *)*v69;
          v79 = v69;
          if (*v69)
          {
            do
            {
              v80 = v78;
              v78 = (uint64_t *)v78[1];
            }
            while (v78);
          }
          else
          {
            do
            {
              v80 = (uint64_t *)v79[2];
              BOOL v55 = *v80 == (void)v79;
              v79 = v80;
            }
            while (v55);
          }
          if (v80 != v63)
          {
            if (v77)
            {
              do
              {
                uint64_t v81 = v77;
                uint64_t v77 = *(void *)(v77 + 8);
              }
              while (v77);
            }
            else
            {
              do
              {
                uint64_t v81 = v69[2];
                BOOL v55 = *(void *)v81 == (void)v69;
                v69 = (uint64_t *)v81;
              }
              while (v55);
            }
            uint64_t v82 = *v80;
            v83 = v80;
            if (*v80)
            {
              do
              {
                uint64_t v84 = v82;
                uint64_t v82 = *(void *)(v82 + 8);
              }
              while (v82);
            }
            else
            {
              do
              {
                uint64_t v84 = v83[2];
                BOOL v55 = *(void *)v84 == (void)v83;
                v83 = (uint64_t *)v84;
              }
              while (v55);
            }
            int v85 = *(_DWORD *)(v81 + 40);
            int v86 = *(_DWORD *)(v84 + 40);
            if (v85 != 8)
            {
              if (v85 == 32)
              {
                if (v86 != 16) {
                  goto LABEL_140;
                }
              }
              else if (v85 != 16 || v86 != 8)
              {
                goto LABEL_140;
              }
              goto LABEL_139;
            }
            if (v86 == 32) {
LABEL_139:
            }
              ((void (*)(void (**)(void, void, void), uint64_t))v65[2])(v65, v33);
          }
        }
      }
LABEL_140:
      v87 = [GEOAlmanacRiseTransitSet alloc];
      v88 = *(uint64_t **)(*(void *)&buf[8] + 56);
      if (v88 == v63)
      {
        unint64_t v171 = 0xBFF0000000000000;
        int v91 = -1;
      }
      else
      {
        uint64_t v89 = *v88;
        if (*v88)
        {
          do
          {
            uint64_t v90 = v89;
            uint64_t v89 = *(void *)(v89 + 8);
          }
          while (v89);
        }
        else
        {
          do
          {
            uint64_t v90 = v88[2];
            BOOL v55 = *(void *)v90 == (void)v88;
            v88 = (uint64_t *)v90;
          }
          while (v55);
        }
        unint64_t v171 = *(void *)(v90 + 32);
        int v91 = *(_DWORD *)(v90 + 40);
      }
      int v172 = v91;
      v92 = (uint64_t *)v185[7];
      if (v92 == v63)
      {
        unint64_t v169 = 0xBFF0000000000000;
        int v95 = -1;
      }
      else
      {
        uint64_t v93 = *v92;
        if (*v92)
        {
          do
          {
            uint64_t v94 = v93;
            uint64_t v93 = *(void *)(v93 + 8);
          }
          while (v93);
        }
        else
        {
          do
          {
            uint64_t v94 = v92[2];
            BOOL v55 = *(void *)v94 == (void)v92;
            v92 = (uint64_t *)v94;
          }
          while (v55);
        }
        unint64_t v169 = *(void *)(v94 + 32);
        int v95 = *(_DWORD *)(v94 + 40);
      }
      int v170 = v95;
      v96 = (uint64_t *)v177[7];
      if (v96 == v63)
      {
        unint64_t v167 = 0xBFF0000000000000;
        int v99 = -1;
      }
      else
      {
        uint64_t v97 = *v96;
        if (*v96)
        {
          do
          {
            uint64_t v98 = v97;
            uint64_t v97 = *(void *)(v97 + 8);
          }
          while (v97);
        }
        else
        {
          do
          {
            uint64_t v98 = v96[2];
            BOOL v55 = *(void *)v98 == (void)v96;
            v96 = (uint64_t *)v98;
          }
          while (v55);
        }
        unint64_t v167 = *(void *)(v98 + 32);
        int v99 = *(_DWORD *)(v98 + 40);
      }
      int v168 = v99;
      v100 = [(GEOAlmanacRiseTransitSet *)v87 initWithRise:&v171 transit:&v169 set:&v167];

      _Block_object_dispose(v174, 8);
      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(&v184, 8);
      _Block_object_dispose(buf, 8);
      v101 = self->_previousRiseTransitSet;
      self->_previousRiseTransitSet = v100;
    }
    if ((v6 & 4) != 0
      && self->_currentRiseTransitSet
      && ![(GEOAlmanacRiseTransitSet *)self->_nextRiseTransitSet isIdeal])
    {
      uint64_t v102 = [(GEOAlmanacRiseTransitSet *)self->_currentRiseTransitSet lastItem];
      v104 = v159 + 7;
      if ((uint64_t *)v33 != v159 + 7)
      {
        int v105 = v103;
        unint64_t v106 = 0;
        double v107 = *(double *)&v102;
        v108 = (void *)v33;
        do
        {
          v109 = (void *)v108[1];
          if (v109)
          {
            do
            {
              v110 = v109;
              v109 = (void *)*v109;
            }
            while (v109);
          }
          else
          {
            do
            {
              v110 = (void *)v108[2];
              BOOL v55 = *v110 == (void)v108;
              v108 = v110;
            }
            while (!v55);
          }
          ++v106;
          v108 = v110;
        }
        while (v110 != v104);
        do
        {
          unint64_t v111 = v106 >> 1;
          v112 = (void *)v33;
          if (v106 >= 2)
          {
            uint64_t v113 = v106 >> 1;
            uint64_t v114 = v33;
            do
            {
              v115 = *(void **)(v114 + 8);
              if (v115)
              {
                do
                {
                  v112 = v115;
                  v115 = (void *)*v115;
                }
                while (v115);
              }
              else
              {
                do
                {
                  v112 = *(void **)(v114 + 16);
                  BOOL v55 = *v112 == v114;
                  uint64_t v114 = (uint64_t)v112;
                }
                while (!v55);
              }
              uint64_t v114 = (uint64_t)v112;
              BOOL v45 = v113-- <= 1;
            }
            while (!v45);
          }
          if (!_GEORiseTransitSetEventIsLessThan::operator()(v105, *((_DWORD *)v112 + 10), v107, *((double *)v112 + 4)))
          {
            v116 = (void *)v112[1];
            if (v116)
            {
              do
              {
                uint64_t v33 = (uint64_t)v116;
                v116 = (void *)*v116;
              }
              while (v116);
            }
            else
            {
              do
              {
                uint64_t v33 = v112[2];
                BOOL v55 = *(void *)v33 == (void)v112;
                v112 = (void *)v33;
              }
              while (!v55);
            }
            unint64_t v111 = v106 + ~v111;
          }
          unint64_t v106 = v111;
        }
        while (v111);
      }
      if (v104 != (void *)v33)
      {
        _getRTS<std::__tree_const_iterator<_GEORiseTransitSetEvent,std::__tree_node<_GEORiseTransitSetEvent,void *> *,long>,BOOL (*)(unsigned int,unsigned int)>(v33, v104);
        v117 = (GEOAlmanacRiseTransitSet *)objc_claimAutoreleasedReturnValue();
        v118 = self->_nextRiseTransitSet;
        self->_nextRiseTransitSet = v117;
      }
    }
    if ((v6 & 1) != 0
      && ((BOOL v119 = [(GEOAlmanacRiseTransitSet *)self->_previousRiseTransitSet isIdeal], v26 <= v10 + -2.0)
        ? (char v120 = 1)
        : (char v120 = v119),
          (v120 & 1) == 0))
    {
      double v26 = v26 + -0.9;
      v24[2](v24, 0, v26);
      int v121 = 1;
      if ((v6 & 4) == 0) {
        continue;
      }
    }
    else
    {
      int v121 = 0;
      if ((v6 & 4) == 0) {
        continue;
      }
    }
    BOOL v122 = [(GEOAlmanacRiseTransitSet *)self->_nextRiseTransitSet isIdeal];
    char v123 = v25 >= v10 + 2.0 || v122;
    if ((v123 & 1) == 0)
    {
      double v25 = v25 + 0.9;
      int v121 = 1;
      v24[2](v24, 1, v25);
    }
  }
  while (v121);
  if (*((int *)v155 + 6) >= 3)
  {
    v124 = GEOGetAlmanacLog();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      int v125 = *((_DWORD *)v155 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v125;
      _os_log_impl(&dword_188D96000, v124, OS_LOG_TYPE_ERROR, "Created %d duplicate events, this would be a good thing to optimize.", buf, 8u);
    }
  }
  if ((v6 & 1) != 0 && !self->_previousRiseTransitSet)
  {
    v141 = GEOGetAlmanacLog();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT))
    {
      $F24F406B2B787EFB06265DBA3D28CBD5 v142 = v166;
      id v143 = v149;
      id v144 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v145 = [v144 stringFromDate:v143];

      v146 = v145;
      double v147 = CAADynamicalTime::UTC2TT(v146, v10);
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "failed to find any previous rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v142.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v142.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(void *)&v193[12] = v146;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      double v194 = v147;
      _os_log_impl(&dword_188D96000, v141, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);
    }
    v24 = v150;
  }
  if ((v6 & 6) != 0 && !self->_currentRiseTransitSet)
  {
    v134 = GEOGetAlmanacLog();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_FAULT))
    {
      $F24F406B2B787EFB06265DBA3D28CBD5 v135 = v166;
      id v136 = v149;
      id v137 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v138 = [v137 stringFromDate:v136];

      v139 = v138;
      double v140 = CAADynamicalTime::UTC2TT(v139, v10);
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "failed to find any current rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v135.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v135.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(void *)&v193[12] = v139;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      double v194 = v140;
      _os_log_impl(&dword_188D96000, v134, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);
    }
    v24 = v150;
  }
  if ((v6 & 4) != 0 && !self->_nextRiseTransitSet)
  {
    v126 = GEOGetAlmanacLog();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
    {
      $F24F406B2B787EFB06265DBA3D28CBD5 v127 = v166;
      id v128 = v149;
      id v129 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      v130 = [v129 stringFromDate:v128];

      v131 = v130;
      double v132 = CAADynamicalTime::UTC2TT(v131, v10);
      *(_DWORD *)buf = 136316674;
      *(void *)&buf[4] = "failed to find any next rts events";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v127.var0;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v127.var1;
      *(_WORD *)v193 = 2048;
      *(double *)&v193[2] = v148;
      *(_WORD *)&v193[10] = 2112;
      *(void *)&v193[12] = v131;
      *(_WORD *)&v193[20] = 2048;
      *(double *)&v193[22] = v10;
      *(_WORD *)&v193[30] = 2048;
      double v194 = v132;
      _os_log_impl(&dword_188D96000, v126, OS_LOG_TYPE_FAULT, "%s for: [%f, %f] altitude: %f date: %@ julian date: %f ephemeris date: %f", buf, 0x48u);

      v24 = v150;
    }
    else
    {
      v24 = v150;
    }
LABEL_226:
  }
LABEL_219:

  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);
  std::__tree<std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>,std::less<std::pair<google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<google::protobuf::Descriptor const*,int>,google::protobuf::FieldDescriptor const*>>>::destroy(v165[0]);
}

void *__82__GEOAlmanac_calculateAstronomicalTimeForLocation_date_altitudeInDegrees_options___block_invoke(void *a1, char a2, double a3)
{
  v11[19] = *MEMORY[0x1E4F143B8];
  double v9 = a3;
  char v8 = a2;
  GEORiseTransitSet::GEORiseTransitSet((uint64_t)v10, (uint64_t)(a1 + 6), &v9, a1 + 8, &-[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:]::AccuracySeconds, &v8);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v7, (GEORiseTransitSet *)v10, 8u);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v6, (GEORiseTransitSet *)v10, 0x10u);
  _GEORiseTransitSetEvent::_GEORiseTransitSetEvent(&v5, (GEORiseTransitSet *)v10, 0x20u);
  if (v7.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(void *)(a1[4] + 8) + 48), v7.type, &v7, v7.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  }
  if (v6.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(void *)(a1[4] + 8) + 48), v6.type, &v6, v6.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  }
  if (v5.JD > 0.0
    && (std::__tree<_GEORiseTransitSetEvent,_GEORiseTransitSetEventIsLessThan,std::allocator<_GEORiseTransitSetEvent>>::__emplace_unique_key_args<_GEORiseTransitSetEvent,_GEORiseTransitSetEvent const&>((uint64_t **)(*(void *)(a1[4] + 8) + 48), v5.type, &v5, v5.JD) & 1) == 0)
  {
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  }
  return std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](v11);
}

- (BOOL)isDayLightForTime:(double)a3
{
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  LOBYTE(self) = [(GEOAlmanac *)self isDayLightForDate:v4];

  return (char)self;
}

- (BOOL)isDayLight
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [(GEOAlmanac *)self isDayLightForDate:v3];

  return (char)self;
}

- (BOOL)isDayLightForDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSinceReferenceDate];
  double longitude = self->_location.longitude;
  double altitude = self->_altitude;
  double latitude = self->_location.latitude;
  double v9 = (v8 + *MEMORY[0x1E4F1CF78]) / 86400.0;
  uint64_t v23 = 0;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  double v12 = v9 + 2440587.5;
  geo_getSunPosition((const GEODayCache *)&v12, latitude, -longitude);
  LOBYTE(self) = v10 - altitude >= 0.0;

  return (char)self;
}

- (void)calculateAstronomicalTimeForLocation:(id)a3
{
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 altitudeInDegrees:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  -[GEOAlmanac calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:](self, "calculateAstronomicalTimeForLocation:date:altitudeInDegrees:options:", var0, var1, a4);
}

- (void)calculateAstronomicalTimeForLocation:(id)a3 time:(double)a4
{
}

- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5
{
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  -[GEOAlmanac calculateGeocentricDirectionForSunX:Y:Z:date:](self, "calculateGeocentricDirectionForSunX:Y:Z:date:", a3, a4, a5);
}

- (void)calculateGeocentricDirectionForSunX:(double *)a3 Y:(double *)a4 Z:(double *)a5 date:(id)a6
{
  id v44 = a6;
  objc_msgSend(v44, "geo_hoursAndMinutes");
  double v10 = v9;
  v11 = (CAADynamicalTime *)objc_msgSend(v44, "geo_julianDay");
  double v13 = CAADynamicalTime::UTC2TT(v11, v12);
  double v14 = CAASun::EquatorialRectangularCoordinatesMeanEquinox(0, v13);
  double v16 = v15;
  double v18 = v17;
  CAAEarth::EclipticLongitude(0, v13);
  double v20 = fmod(v19 + 180.0, 360.0);
  uint64_t v21 = 0;
  if (v20 < 0.0) {
    double v20 = v20 + 360.0;
  }
  long long v49 = 0uLL;
  double v50 = 1.0;
  double v22 = v20 + 180.0 + v10 * 15.0;
  double v23 = 0.0;
  do
  {
    double v23 = v23 + *(double *)((char *)&v49 + v21) * *(double *)((char *)&v49 + v21);
    v21 += 8;
  }
  while (v21 != 24);
  uint64_t v24 = 0;
  double v25 = 1.0 / sqrt(v23);
  do
  {
    *(double *)((char *)&v53 + v24) = v25 * *(double *)((char *)&v49 + v24);
    v24 += 8;
  }
  while (v24 != 24);
  long long v51 = v53;
  double v52 = v54;
  double v26 = v22 * -0.0174532925 * 0.5;
  double v27 = sin(v26);
  for (uint64_t i = 0; i != 24; i += 8)
    *(double *)((char *)&v53 + i) = v27 * *(double *)((char *)&v51 + i);
  uint64_t v29 = 0;
  long long v30 = v53;
  double v31 = v54;
  *(double *)BOOL v45 = v14;
  *(double *)&v45[1] = v16;
  *(double *)&v45[2] = v18;
  double v43 = -v54;
  *(double *)&long long v49 = *((double *)&v53 + 1) * v18 - v54 * v16;
  *((double *)&v49 + 1) = v54 * v14 - *(double *)&v53 * v18;
  double v50 = *(double *)&v53 * v16 - *((double *)&v53 + 1) * v14;
  do
  {
    *(double *)((char *)&v53 + v29) = *(double *)((char *)&v49 + v29) + *(double *)((char *)&v49 + v29);
    v29 += 8;
  }
  while (v29 != 24);
  double v32 = cos(v26);
  uint64_t v33 = 0;
  long long v34 = v53;
  double v35 = v54;
  long long v51 = v53;
  double v52 = v54;
  do
  {
    *(double *)((char *)&v53 + v33) = v32 * *(double *)((char *)&v51 + v33);
    v33 += 8;
  }
  while (v33 != 24);
  uint64_t v36 = 0;
  long long v47 = v53;
  double v48 = v54;
  do
  {
    *(double *)((char *)&v53 + v36 * 8) = *(double *)&v45[v36] + *(double *)((char *)&v47 + v36 * 8);
    ++v36;
  }
  while (v36 != 3);
  uint64_t v37 = 0;
  long long v49 = v53;
  double v50 = v54;
  v46[0] = *((double *)&v34 + 1) * v43 + *((double *)&v30 + 1) * v35;
  v46[1] = v35 * -*(double *)&v30 + v31 * *(double *)&v34;
  v46[2] = *(double *)&v34 * -*((double *)&v30 + 1) + *(double *)&v30 * *((double *)&v34 + 1);
  do
  {
    *(double *)((char *)&v53 + v37 * 8) = *(double *)((char *)&v49 + v37 * 8) + v46[v37];
    ++v37;
  }
  while (v37 != 3);
  uint64_t v38 = 0;
  double v39 = 0.0;
  do
  {
    double v39 = v39 + *(double *)((char *)&v53 + v38) * *(double *)((char *)&v53 + v38);
    v38 += 8;
  }
  while (v38 != 24);
  uint64_t v40 = 0;
  double v41 = 1.0 / sqrt(v39);
  do
  {
    *(double *)((char *)&v53 + v40) = v41 * *(double *)((char *)&v53 + v40);
    v40 += 8;
  }
  while (v40 != 24);
  uint64_t v42 = *((void *)&v53 + 1);
  *(void *)a3 = v53;
  *(void *)a4 = v42;
  *a5 = v54;
}

- (NSDate)previousSunrise
{
  return [(GEOAlmanacRiseTransitSet *)self->_previousRiseTransitSet rise];
}

- (NSDate)previousSunset
{
  return [(GEOAlmanacRiseTransitSet *)self->_previousRiseTransitSet set];
}

- (NSDate)nextSunrise
{
  return [(GEOAlmanacRiseTransitSet *)self->_nextRiseTransitSet rise];
}

- (NSDate)nextSunset
{
  return [(GEOAlmanacRiseTransitSet *)self->_nextRiseTransitSet set];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  _GEORiseTransitSetEvent v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p rise / transit / set> {\n", v5, self];

  [v3 appendFormat:@"\tlocation: %f, %f x %f\n", *(void *)&self->_location.latitude, *(void *)&self->_location.longitude, *(void *)&self->_altitude];
  _GEORiseTransitSetEvent v6 = [(GEOAlmanac *)self previousSunrise];
  _GEORiseTransitSetEvent v7 = [(GEOAlmanac *)self previousTransit];
  id v8 = [(GEOAlmanac *)self previousSunset];
  [v3 appendFormat:@"\tprevious: %@ / %@ / %@\n", v6, v7, v8];

  double v9 = [(GEOAlmanac *)self sunrise];
  double v10 = [(GEOAlmanac *)self transit];
  v11 = [(GEOAlmanac *)self sunset];
  [v3 appendFormat:@"\tcurrent:  %@ / %@ / %@\n", v9, v10, v11];

  double v12 = [(GEOAlmanac *)self nextSunrise];
  double v13 = [(GEOAlmanac *)self nextTransit];
  double v14 = [(GEOAlmanac *)self nextSunset];
  [v3 appendFormat:@"\tnext:     %@ / %@ / %@\n", v12, v13, v14];

  [v3 appendFormat:@"\tprevious: %@\n", self->_previousRiseTransitSet];
  [v3 appendFormat:@"\tcurrent:  %@\n", self->_currentRiseTransitSet];
  [v3 appendFormat:@"\tnext:     %@\n", self->_nextRiseTransitSet];
  [v3 appendString:@"}"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextRiseTransitSet, 0);
  objc_storeStrong((id *)&self->_currentRiseTransitSet, 0);

  objc_storeStrong((id *)&self->_previousRiseTransitSet, 0);
}

@end