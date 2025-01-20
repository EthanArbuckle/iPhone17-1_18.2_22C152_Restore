@interface CBTwilightNightShiftAdaptationParams
- (BOOL)loadParametersFromService:(unsigned int)a3;
- (CBFloatArray)cctTable;
- (CBFloatArray)twilightStrengthTable;
- (CBFloatArray2D)cctDeltaTable;
- (CBTwilightNightShiftAdaptationParams)initWithService:(unsigned int)a3;
- (void)dealloc;
@end

@implementation CBTwilightNightShiftAdaptationParams

- (BOOL)loadParametersFromService:(unsigned int)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  v128 = self;
  SEL v127 = a2;
  io_registry_entry_t v126 = a3;
  v125 = 0;
  if (self->_log)
  {
    v72 = v128->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    v72 = inited;
  }
  v125 = v72;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    log = v125;
    os_log_type_t v70 = type;
    __os_log_helper_16_0_0(v123);
    _os_log_impl(&dword_1BA438000, log, v70, "Initialization | Start", v123, 2u);
  }
  if (v126)
  {
    int v119 = 0;
    char v118 = load_int_from_edt(v126, @"use-tw-ns-adaptation", &v119) & 1;
    if (v118 && v119)
    {
      float v114 = 6500.0;
      v128->_cctTableSizeOG = load_float_array_from_edt(v126, @"tw-ns-cct-table", &v128->_cctTableOG);
      if (v128->_cctTableOG)
      {
        if (v128->_cctTableSizeOG)
        {
          if (float_equal(v128->_cctTableOG[v128->_cctTableSizeOG - 1], v114))
          {
            for (unint64_t i = 0; i < v128->_cctTableSizeOG - 1; ++i)
            {
              if (v128->_cctTableOG[i] > v128->_cctTableOG[i + 1])
              {
                v104 = 0;
                if (v128->_log)
                {
                  v50 = v128->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v49 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v49 = init_default_corebrightness_log();
                  }
                  v50 = v49;
                }
                v104 = v50;
                os_log_type_t v103 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  v47 = v104;
                  os_log_type_t v48 = v103;
                  __os_log_helper_16_0_0(v102);
                  _os_log_error_impl(&dword_1BA438000, v47, v48, "CCT table is not strictly increasing", v102, 2u);
                }
                char v129 = 0;
                return v129 & 1;
              }
            }
            v128->_twilightStrengthTableSizeOG = load_float_array_from_edt(v126, @"tw-ns-strength-table", &v128->_twilightStrengthTableOG);
            if (v128->_twilightStrengthTableOG)
            {
              if (v128->_twilightStrengthTableSizeOG >= 2)
              {
                if (float_equal(*v128->_twilightStrengthTableOG, 0.0))
                {
                  if (float_equal(v128->_twilightStrengthTableOG[v128->_twilightStrengthTableSizeOG - 1], 1.0))
                  {
                    for (unint64_t j = 0; j < v128->_twilightStrengthTableSizeOG; ++j)
                    {
                      if (v128->_twilightStrengthTableOG[j] < 0.0 || v128->_twilightStrengthTableOG[j] > 1.0)
                      {
                        os_log_t v88 = 0;
                        if (v128->_log)
                        {
                          v30 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v29 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v29 = init_default_corebrightness_log();
                          }
                          v30 = v29;
                        }
                        os_log_t v88 = v30;
                        os_log_type_t v87 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v137, j, COERCE__INT64(v128->_twilightStrengthTableOG[j]));
                          _os_log_error_impl(&dword_1BA438000, v88, v87, "Twilight strength table element #%lu with value %f is out of the valid [0, 1] range", v137, 0x16u);
                        }
                        char v129 = 0;
                        return v129 & 1;
                      }
                    }
                    for (unint64_t k = 0; k < v128->_twilightStrengthTableSizeOG - 1; ++k)
                    {
                      if (v128->_twilightStrengthTableOG[k] > v128->_twilightStrengthTableOG[k + 1])
                      {
                        v85 = 0;
                        if (v128->_log)
                        {
                          v28 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v27 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v27 = init_default_corebrightness_log();
                          }
                          v28 = v27;
                        }
                        v85 = v28;
                        os_log_type_t v84 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                        {
                          v25 = v85;
                          os_log_type_t v26 = v84;
                          __os_log_helper_16_0_0(v83);
                          _os_log_error_impl(&dword_1BA438000, v25, v26, "Twilight strength table is not strictly increasing", v83, 2u);
                        }
                        char v129 = 0;
                        return v129 & 1;
                      }
                    }
                    v128->_cctDeltaTableSizeOG = load_float_array_from_edt(v126, @"tw-ns-cct-delta-table", &v128->_cctDeltaTableOG);
                    if (v128->_cctDeltaTableOG)
                    {
                      if (v128->_cctDeltaTableSizeOG == v128->_cctTableSizeOG * v128->_twilightStrengthTableSizeOG)
                      {
                        id v79 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                        for (unint64_t m = 0; m < v128->_cctTableSizeOG; ++m)
                        {
                          v3 = "";
                          if (m != v128->_cctTableSizeOG - 1) {
                            v3 = ",";
                          }
                          objc_msgSend(v79, "appendFormat:", @" %f%s", v128->_cctTableOG[m], v3);
                        }
                        [v79 appendString:@" "];
                        id v77 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                        for (unint64_t n = 0; n < v128->_twilightStrengthTableSizeOG; ++n)
                        {
                          v4 = "";
                          if (n != v128->_twilightStrengthTableSizeOG - 1) {
                            v4 = ",";
                          }
                          objc_msgSend(v77, "appendFormat:", @" %f%s", v128->_twilightStrengthTableOG[n], v4);
                        }
                        [v77 appendString:@" "];
                        if (v128->_log)
                        {
                          v18 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v17 = init_default_corebrightness_log();
                          }
                          v18 = v17;
                        }
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v135, v128->_cctTableSizeOG);
                          _os_log_impl(&dword_1BA438000, v18, OS_LOG_TYPE_DEFAULT, "CCTTableSize=%lu", v135, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v16 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v15 = init_default_corebrightness_log();
                          }
                          v16 = v15;
                        }
                        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_2_1_8_32((uint64_t)v134, [v79 UTF8String]);
                          _os_log_impl(&dword_1BA438000, v16, OS_LOG_TYPE_DEFAULT, "CCTTable={%s}", v134, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v14 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v13 = init_default_corebrightness_log();
                          }
                          v14 = v13;
                        }
                        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v133, v128->_twilightStrengthTableSizeOG);
                          _os_log_impl(&dword_1BA438000, v14, OS_LOG_TYPE_DEFAULT, "TwilightStrengthTableSize=%lu", v133, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v12 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v11 = init_default_corebrightness_log();
                          }
                          v12 = v11;
                        }
                        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_2_1_8_32((uint64_t)v132, [v77 UTF8String]);
                          _os_log_impl(&dword_1BA438000, v12, OS_LOG_TYPE_DEFAULT, "TwilightStrengthTable={%s}", v132, 0xCu);
                        }
                        if (v128->_log)
                        {
                          v10 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v9 = init_default_corebrightness_log();
                          }
                          v10 = v9;
                        }
                        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                        {
                          __os_log_helper_16_0_1_8_0((uint64_t)v131, v128->_cctDeltaTableSizeOG);
                          _os_log_impl(&dword_1BA438000, v10, OS_LOG_TYPE_DEFAULT, "CCTDeltaTableSize=%lu", v131, 0xCu);
                        }
                        for (unint64_t ii = 0; ii < v128->_twilightStrengthTableSizeOG; ++ii)
                        {
                          id v74 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                          for (unint64_t jj = 0; jj < v128->_cctTableSizeOG; ++jj)
                          {
                            v5 = "";
                            if (jj != v128->_cctTableSizeOG - 1) {
                              v5 = ",";
                            }
                            objc_msgSend(v74, "appendFormat:", @"%f%s ", v128->_cctDeltaTableOG[ii * v128->_cctTableSizeOG + jj], v5);
                          }
                          if (v128->_log)
                          {
                            v8 = v128->_log;
                          }
                          else
                          {
                            if (_COREBRIGHTNESS_LOG_DEFAULT) {
                              uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
                            }
                            else {
                              uint64_t v7 = init_default_corebrightness_log();
                            }
                            v8 = v7;
                          }
                          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                          {
                            __os_log_helper_16_2_2_8_0_8_32((uint64_t)v130, ii, [v74 UTF8String]);
                            _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEFAULT, "CCTDeltaTable[%lu]={ %s}", v130, 0x16u);
                          }
                        }
                        char v129 = 1;
                      }
                      else
                      {
                        if (v128->_log)
                        {
                          v20 = v128->_log;
                        }
                        else
                        {
                          if (_COREBRIGHTNESS_LOG_DEFAULT) {
                            uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
                          }
                          else {
                            uint64_t v19 = init_default_corebrightness_log();
                          }
                          v20 = v19;
                        }
                        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                        {
                          __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v136, v128->_cctDeltaTableSizeOG, v128->_cctTableSizeOG, v128->_twilightStrengthTableSizeOG);
                          _os_log_error_impl(&dword_1BA438000, v20, OS_LOG_TYPE_ERROR, "CCT delta table has wrong size %lu for CCT table size %lu and Twilight strength table size %lu", v136, 0x20u);
                        }
                        char v129 = 0;
                      }
                    }
                    else
                    {
                      v82 = 0;
                      if (v128->_log)
                      {
                        v24 = v128->_log;
                      }
                      else
                      {
                        if (_COREBRIGHTNESS_LOG_DEFAULT) {
                          uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
                        }
                        else {
                          uint64_t v23 = init_default_corebrightness_log();
                        }
                        v24 = v23;
                      }
                      v82 = v24;
                      os_log_type_t v81 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                      {
                        v21 = v82;
                        os_log_type_t v22 = v81;
                        __os_log_helper_16_0_0(v80);
                        _os_log_error_impl(&dword_1BA438000, v21, v22, "Unable to load the CCT delta table", v80, 2u);
                      }
                      char v129 = 0;
                    }
                  }
                  else
                  {
                    v92 = 0;
                    if (v128->_log)
                    {
                      v34 = v128->_log;
                    }
                    else
                    {
                      if (_COREBRIGHTNESS_LOG_DEFAULT) {
                        uint64_t v33 = _COREBRIGHTNESS_LOG_DEFAULT;
                      }
                      else {
                        uint64_t v33 = init_default_corebrightness_log();
                      }
                      v34 = v33;
                    }
                    v92 = v34;
                    os_log_type_t v91 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      v31 = v92;
                      os_log_type_t v32 = v91;
                      __os_log_helper_16_0_0(v90);
                      _os_log_error_impl(&dword_1BA438000, v31, v32, "Last element in the Twilight strength table is not 1", v90, 2u);
                    }
                    char v129 = 0;
                  }
                }
                else
                {
                  v95 = 0;
                  if (v128->_log)
                  {
                    v38 = v128->_log;
                  }
                  else
                  {
                    if (_COREBRIGHTNESS_LOG_DEFAULT) {
                      uint64_t v37 = _COREBRIGHTNESS_LOG_DEFAULT;
                    }
                    else {
                      uint64_t v37 = init_default_corebrightness_log();
                    }
                    v38 = v37;
                  }
                  v95 = v38;
                  os_log_type_t v94 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v35 = v95;
                    os_log_type_t v36 = v94;
                    __os_log_helper_16_0_0(v93);
                    _os_log_error_impl(&dword_1BA438000, v35, v36, "First element in the Twilight strength table is not 0", v93, 2u);
                  }
                  char v129 = 0;
                }
              }
              else
              {
                v98 = 0;
                if (v128->_log)
                {
                  v42 = v128->_log;
                }
                else
                {
                  if (_COREBRIGHTNESS_LOG_DEFAULT) {
                    uint64_t v41 = _COREBRIGHTNESS_LOG_DEFAULT;
                  }
                  else {
                    uint64_t v41 = init_default_corebrightness_log();
                  }
                  v42 = v41;
                }
                v98 = v42;
                os_log_type_t v97 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  v39 = v98;
                  os_log_type_t v40 = v97;
                  __os_log_helper_16_0_0(v96);
                  _os_log_error_impl(&dword_1BA438000, v39, v40, "Twilight strength table has less than two elements", v96, 2u);
                }
                char v129 = 0;
              }
            }
            else
            {
              v101 = 0;
              if (v128->_log)
              {
                v46 = v128->_log;
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v45 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v45 = init_default_corebrightness_log();
                }
                v46 = v45;
              }
              v101 = v46;
              os_log_type_t v100 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v43 = v101;
                os_log_type_t v44 = v100;
                __os_log_helper_16_0_0(v99);
                _os_log_error_impl(&dword_1BA438000, v43, v44, "Unable to load the Twilight strength table", v99, 2u);
              }
              char v129 = 0;
            }
          }
          else
          {
            os_log_t v107 = 0;
            if (v128->_log)
            {
              v52 = v128->_log;
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t v51 = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t v51 = init_default_corebrightness_log();
              }
              v52 = v51;
            }
            os_log_t v107 = v52;
            os_log_type_t v106 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_1_8_0((uint64_t)v138, COERCE__INT64(v114));
              _os_log_error_impl(&dword_1BA438000, v107, v106, "Last element in the CCT table is not %f", v138, 0xCu);
            }
            char v129 = 0;
          }
        }
        else
        {
          v110 = 0;
          if (v128->_log)
          {
            v56 = v128->_log;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t v55 = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t v55 = init_default_corebrightness_log();
            }
            v56 = v55;
          }
          v110 = v56;
          os_log_type_t v109 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v53 = v110;
            os_log_type_t v54 = v109;
            __os_log_helper_16_0_0(v108);
            _os_log_error_impl(&dword_1BA438000, v53, v54, "CCT table has less than one element", v108, 2u);
          }
          char v129 = 0;
        }
      }
      else
      {
        v113 = 0;
        if (v128->_log)
        {
          v60 = v128->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v59 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v59 = init_default_corebrightness_log();
          }
          v60 = v59;
        }
        v113 = v60;
        os_log_type_t v112 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v57 = v113;
          os_log_type_t v58 = v112;
          __os_log_helper_16_0_0(v111);
          _os_log_error_impl(&dword_1BA438000, v57, v58, "Unable to load the CCT table", v111, 2u);
        }
        char v129 = 0;
      }
    }
    else
    {
      v117 = 0;
      if (v128->_log)
      {
        v64 = v128->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v63 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v63 = init_default_corebrightness_log();
        }
        v64 = v63;
      }
      v117 = v64;
      os_log_type_t v116 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v61 = v117;
        os_log_type_t v62 = v116;
        __os_log_helper_16_0_0(v115);
        _os_log_error_impl(&dword_1BA438000, v61, v62, "Twilight / Night Shift Adaptation is not supported", v115, 2u);
      }
      char v129 = 0;
    }
  }
  else
  {
    v122 = 0;
    if (v128->_log)
    {
      v68 = v128->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v67 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v67 = init_default_corebrightness_log();
      }
      v68 = v67;
    }
    v122 = v68;
    os_log_type_t v121 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v65 = v122;
      os_log_type_t v66 = v121;
      __os_log_helper_16_0_0(v120);
      _os_log_error_impl(&dword_1BA438000, v65, v66, "Service is null", v120, 2u);
    }
    char v129 = 0;
  }
  return v129 & 1;
}

- (CBTwilightNightShiftAdaptationParams)initWithService:(unsigned int)a3
{
  uint64_t v17 = self;
  SEL v16 = a2;
  unsigned int v15 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBTwilightNightShiftAdaptationParams;
  uint64_t v17 = [(CBTwilightNightShiftAdaptationParams *)&v14 init];
  if (v17)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.BacklightNode", "TwilightNightShiftAdaptation");
    v17->_log = (OS_os_log *)v3;
    char v13 = 0;
    if ([(CBTwilightNightShiftAdaptationParams *)v17 loadParametersFromService:v15])
    {
      v4 = [CBFloatArray alloc];
      uint64_t v5 = [(CBFloatArray *)v4 initWithValues:v17->_cctTableOG andCount:v17->_cctTableSizeOG];
      v17->_cctTable = (CBFloatArray *)v5;
      v6 = [CBFloatArray alloc];
      uint64_t v7 = [(CBFloatArray *)v6 initWithValues:v17->_twilightStrengthTableOG andCount:v17->_twilightStrengthTableSizeOG];
      v17->_twilightStrengthTable = (CBFloatArray *)v7;
      v12 = [CBFloatArray2D alloc];
      cctDeltaTableOG = v17->_cctDeltaTableOG;
      uint64_t v11 = [(CBFloatArray *)v17->_cctTable count];
      uint64_t v8 = [(CBFloatArray2D *)v12 initWithValues:cctDeltaTableOG andCountCols:v11 andRows:[(CBFloatArray *)v17->_twilightStrengthTable count]];
      v17->_cctDeltaTable = (CBFloatArray2D *)v8;
      char v13 = 1;
    }
    if (v17->_cctTableOG) {
      free(v17->_cctTableOG);
    }
    if (v17->_twilightStrengthTableOG) {
      free(v17->_twilightStrengthTableOG);
    }
    if (v17->_cctDeltaTableOG) {
      free(v17->_cctDeltaTableOG);
    }
    if ((v13 & 1) == 0)
    {

      return 0;
    }
  }
  return v17;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  if (v4->_log)
  {

    v4->_log = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBTwilightNightShiftAdaptationParams;
  [(CBTwilightNightShiftAdaptationParams *)&v2 dealloc];
}

- (CBFloatArray)cctTable
{
  return self->_cctTable;
}

- (CBFloatArray)twilightStrengthTable
{
  return self->_twilightStrengthTable;
}

- (CBFloatArray2D)cctDeltaTable
{
  return self->_cctDeltaTable;
}

@end