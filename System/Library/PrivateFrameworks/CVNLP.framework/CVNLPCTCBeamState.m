@interface CVNLPCTCBeamState
- (CVNLPCTCBeamState)init;
- (NSMutableDictionary)mutablePaths;
- (id)debugDescription;
- (id)pathForString:(id)a3;
- (id)paths;
- (id)sortedKeys;
- (void)addPath:(id)a3;
- (void)applyWordLanguageModelProbabilityToPaths;
- (void)enumeratePathsWithBlock:(id)a3;
- (void)kBest:(id *)a3 discarded:(id *)a4 k:(unint64_t)a5 shouldUpdateLMState:(BOOL)a6;
- (void)mergePathsWithTrailingWhitespaces;
- (void)setMutablePaths:(id)a3;
@end

@implementation CVNLPCTCBeamState

- (CVNLPCTCBeamState)init
{
  v6.receiver = self;
  v6.super_class = (Class)CVNLPCTCBeamState;
  v2 = [(CVNLPCTCBeamState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutablePaths = v2->_mutablePaths;
    v2->_mutablePaths = v3;
  }
  return v2;
}

- (void)addPath:(id)a3
{
  id v4 = a3;
  mutablePaths = self->_mutablePaths;
  id v19 = v4;
  v9 = objc_msgSend_string(v4, v6, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(mutablePaths, v10, (uint64_t)v9, v11);

  if (v12)
  {
    objc_msgSend_merge_logProbCumulator_(v12, v13, (uint64_t)v19, (uint64_t)&unk_1F0D56060);
  }
  else
  {
    v16 = self->_mutablePaths;
    v17 = objc_msgSend_string(v19, v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v18, (uint64_t)v19, (uint64_t)v17);
  }
}

- (id)debugDescription
{
  v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B4C6328C;
  v10[3] = &unk_1E60A3C38;
  id v6 = v5;
  id v11 = v6;
  objc_msgSend_enumeratePathsWithBlock_(self, v7, (uint64_t)v10, v8);

  return v6;
}

- (id)pathForString:(id)a3
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, a2, (uint64_t)a3, v3);
  return v4;
}

- (id)paths
{
  return (id)((uint64_t (*)(void, char *, NSMutableDictionary *))MEMORY[0x1F4181798])(MEMORY[0x1E4F1C9E8], sel_dictionaryWithDictionary_, self->_mutablePaths);
}

- (void)enumeratePathsWithBlock:(id)a3
{
  id v4 = a3;
  mutablePaths = self->_mutablePaths;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4C63454;
  v9[3] = &unk_1E60A3C60;
  id v10 = v4;
  id v6 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(mutablePaths, v7, (uint64_t)v9, v8);
}

- (id)sortedKeys
{
  return (id)((uint64_t (*)(NSMutableDictionary *, char *, char *))MEMORY[0x1F4181798])(self->_mutablePaths, sel_keysSortedByValueUsingSelector_, sel_compare_);
}

- (void)kBest:(id *)a3 discarded:(id *)a4 k:(unint64_t)a5 shouldUpdateLMState:(BOOL)a6
{
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x4812000000;
  v104 = sub_1B4C63B90;
  v105 = sub_1B4C63BB4;
  v106 = &unk_1B4C9FEA6;
  v108 = 0;
  uint64_t v109 = 0;
  __p = 0;
  if (!objc_msgSend_count(self->_mutablePaths, a2, (uint64_t)a3, (uint64_t)a4))
  {
    double v24 = 0.0;
    goto LABEL_107;
  }
  uint64_t v14 = v102;
  unint64_t v17 = objc_msgSend_count(self->_mutablePaths, v11, v12, v13);
  v18 = (unsigned char *)v14[6];
  if (v17 > (v14[8] - (uint64_t)v18) >> 3)
  {
    if (v17 >> 61) {
      sub_1B4BB3244();
    }
    id v19 = (unsigned char *)v14[7];
    v20 = (char *)operator new(8 * v17);
    uint64_t v21 = v19 - v18;
    v22 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
    v23 = v22;
    if (v19 == v18) {
      goto LABEL_13;
    }
    if ((unint64_t)(v21 - 8) >= 0x58)
    {
      v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
      if (v19 - v20 - (v21 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        uint64_t v25 = v21 >> 3;
        unint64_t v26 = ((unint64_t)(v21 - 8) >> 3) + 1;
        uint64_t v27 = 8 * (v26 & 0x3FFFFFFFFFFFFFFCLL);
        v28 = &v19[-v27];
        v23 = &v22[-v27];
        v29 = &v20[8 * v25 - 16];
        v30 = (long long *)(v19 - 16);
        uint64_t v31 = v26 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v32 = *v30;
          *((_OWORD *)v29 - 1) = *(v30 - 1);
          *(_OWORD *)v29 = v32;
          v29 -= 32;
          v30 -= 2;
          v31 -= 4;
        }
        while (v31);
        id v19 = v28;
        if (v26 == (v26 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_13:
          v14[6] = (uint64_t)v23;
          v14[7] = (uint64_t)v22;
          v14[8] = (uint64_t)&v20[8 * v17];
          if (v18) {
            operator delete(v18);
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
      v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      uint64_t v33 = *((void *)v19 - 1);
      v19 -= 8;
      *((void *)v23 - 1) = v33;
      v23 -= 8;
    }
    while (v19 != v18);
    goto LABEL_13;
  }
LABEL_15:
  mutablePaths = self->_mutablePaths;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = sub_1B4C63BCC;
  v100[3] = &unk_1E60A3C88;
  v100[4] = &v101;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(mutablePaths, v15, (uint64_t)v100, v16);
  v35 = (double *)v102[6];
  v36 = (double *)v102[7];
  unint64_t v37 = v36 - v35 - 1;
  if (v37 >= a5) {
    unint64_t v37 = a5;
  }
  v38 = &v35[v37];
  if (v38 != v36)
  {
    while (1)
    {
      unint64_t v39 = v36 - v35;
      if (v39 < 2)
      {
LABEL_105:
        v35 = (double *)v102[6];
        break;
      }
      if (v39 == 3)
      {
        double v72 = *v35;
        double v73 = v35[1];
        double v74 = *(v36 - 1);
        if (v73 <= *v35)
        {
          if (v74 > v73)
          {
            v35[1] = v74;
            *(v36 - 1) = v73;
            double v86 = *v35;
            double v85 = v35[1];
            if (v85 > *v35)
            {
              double *v35 = v85;
              v35[1] = v86;
            }
          }
        }
        else
        {
          if (v74 <= v73)
          {
            double *v35 = v73;
            v35[1] = v72;
            double v87 = *(v36 - 1);
            if (v87 <= v72) {
              goto LABEL_105;
            }
            v35[1] = v87;
          }
          else
          {
            double *v35 = v74;
          }
          *(v36 - 1) = v72;
        }
        goto LABEL_105;
      }
      if (v39 == 2)
      {
        double v75 = *(v36 - 1);
        double v76 = *v35;
        if (v75 > *v35)
        {
          double *v35 = v75;
          *(v36 - 1) = v76;
        }
        goto LABEL_105;
      }
      if ((char *)v36 - (char *)v35 <= 63)
      {
        while (v35 != v36 - 1)
        {
          v77 = v35++;
          if (v77 != v36 && v35 != v36)
          {
            double v78 = *v77;
            double v79 = *v77;
            v80 = v35;
            v81 = v77;
            v82 = v35;
            do
            {
              double v83 = *v82++;
              BOOL v84 = v83 <= v79;
              double v79 = fmax(v83, v79);
              if (!v84) {
                v81 = v80;
              }
              v80 = v82;
            }
            while (v82 != v36);
            if (v81 != v77)
            {
              double *v77 = *v81;
              double *v81 = v78;
            }
          }
        }
        goto LABEL_105;
      }
      v40 = &v35[v39 >> 1];
      v41 = v36 - 1;
      double v42 = *(v36 - 1);
      double v43 = *v40;
      double v44 = *v35;
      if (*v40 <= *v35)
      {
        if (v42 <= v43)
        {
          int v45 = 0;
          double v46 = *v35;
          double v47 = *v40;
          if (*v35 <= *v40) {
            goto LABEL_43;
          }
          goto LABEL_25;
        }
        double *v40 = v42;
        double *v41 = v43;
        double v57 = *v35;
        if (*v40 > *v35)
        {
          double *v35 = *v40;
          double *v40 = v57;
          int v45 = 2;
          double v46 = *v35;
          double v47 = *v40;
          if (*v35 <= *v40) {
            goto LABEL_43;
          }
          goto LABEL_25;
        }
      }
      else
      {
        if (v42 > v43)
        {
          double *v35 = v42;
          double *v41 = v44;
          int v45 = 1;
          double v46 = *v35;
          double v47 = *v40;
          if (*v35 <= *v40) {
            goto LABEL_43;
          }
          goto LABEL_25;
        }
        double *v35 = v43;
        double *v40 = v44;
        if (*v41 > v44)
        {
          double *v40 = *v41;
          double *v41 = v44;
          int v45 = 2;
          double v46 = *v35;
          double v47 = *v40;
          if (*v35 <= *v40) {
            goto LABEL_43;
          }
          goto LABEL_25;
        }
      }
      int v45 = 1;
      double v46 = *v35;
      double v47 = *v40;
      if (*v35 <= *v40)
      {
LABEL_43:
        v48 = v36 - 1;
        while (--v48 != v35)
        {
          if (*v48 > v47)
          {
            double *v35 = *v48;
            double *v48 = v46;
            ++v45;
            v49 = v35 + 1;
            if (v35 + 1 < v48) {
              goto LABEL_26;
            }
            goto LABEL_47;
          }
        }
        v61 = v35 + 1;
        if (v46 <= *v41)
        {
          if (v61 == v41) {
            goto LABEL_105;
          }
          while (1)
          {
            double v62 = *v61;
            if (v46 > *v61) {
              break;
            }
            if (++v61 == v41) {
              goto LABEL_105;
            }
          }
          *v61++ = *v41;
          double *v41 = v62;
        }
        if (v61 == v41) {
          goto LABEL_105;
        }
        while (1)
        {
          double v66 = *v35;
          do
          {
            double v67 = *v61++;
            double v68 = v67;
          }
          while (v66 <= v67);
          v69 = v61 - 1;
          do
          {
            double v70 = *--v41;
            double v71 = v70;
          }
          while (v66 > v70);
          if (v69 >= v41) {
            break;
          }
          double *v69 = v71;
          double *v41 = v68;
        }
        v35 = v61 - 1;
        if (v69 > v38) {
          goto LABEL_105;
        }
        goto LABEL_81;
      }
LABEL_25:
      v48 = v36 - 1;
      v49 = v35 + 1;
      if (v35 + 1 >= v36 - 1)
      {
LABEL_47:
        v54 = v49;
      }
      else
      {
LABEL_26:
        v50 = v49;
        while (1)
        {
          double v51 = *v40;
          do
          {
            double v52 = *v50++;
            double v53 = v52;
          }
          while (v52 > v51);
          v54 = v50 - 1;
          do
          {
            double v55 = *--v48;
            double v56 = v55;
          }
          while (v55 <= v51);
          if (v54 >= v48) {
            break;
          }
          double *v54 = v56;
          double *v48 = v53;
          ++v45;
          if (v54 == v40) {
            v40 = v48;
          }
        }
      }
      if (v54 != v40)
      {
        double v58 = *v54;
        if (*v40 > *v54)
        {
          double *v54 = *v40;
          double *v40 = v58;
          ++v45;
        }
      }
      if (v54 == v38) {
        goto LABEL_105;
      }
      if (!v45)
      {
        if (v54 <= v38)
        {
          v63 = v54 + 1;
          while (v63 != v36)
          {
            double v65 = *(v63 - 1);
            double v64 = *v63++;
            if (v64 > v65) {
              goto LABEL_53;
            }
          }
        }
        else
        {
          while (v49 != v54)
          {
            double v60 = *(v49 - 1);
            double v59 = *v49++;
            if (v59 > v60) {
              goto LABEL_53;
            }
          }
        }
        goto LABEL_105;
      }
LABEL_53:
      if (v54 <= v38) {
        v35 = v54 + 1;
      }
      else {
        v36 = v54;
      }
LABEL_81:
      if (v36 == v38) {
        goto LABEL_105;
      }
    }
  }
  double v24 = v35[v37];
LABEL_107:
  v88 = objc_alloc_init(CVNLPCTCBeamState);
  v89 = objc_alloc_init(CVNLPCTCBeamState);
  v90 = self->_mutablePaths;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = sub_1B4C63DA8;
  v95[3] = &unk_1E60A3CB0;
  double v98 = v24;
  v91 = v88;
  v96 = v91;
  BOOL v99 = a6;
  v92 = v89;
  v97 = v92;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v90, v93, (uint64_t)v95, v94);
  if (a3) {
    *a3 = v91;
  }
  if (a4) {
    *a4 = v92;
  }

  _Block_object_dispose(&v101, 8);
  if (__p)
  {
    v108 = __p;
    operator delete(__p);
  }
}

- (void)mergePathsWithTrailingWhitespaces
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v5 = self->_mutablePaths;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_stringByAppendingString_(v12, v7, @" ", v8);
        v18 = objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v14, (uint64_t)v13, v15);
        if (v18)
        {
          id v19 = objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v16, (uint64_t)v12, v17);
          objc_msgSend_merge_logProbCumulator_(v19, v20, (uint64_t)v18, (uint64_t)&unk_1F0D560E0);

          objc_msgSend_addObject_(v30, v21, (uint64_t)v13, v22);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v9);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v30;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v31, (uint64_t)v39, 16);
  if (v27)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend_removeObjectForKey_(self->_mutablePaths, v25, *(void *)(*((void *)&v31 + 1) + 8 * j), v26);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v31, (uint64_t)v39, 16);
    }
    while (v27);
  }
}

- (void)applyWordLanguageModelProbabilityToPaths
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = self->_mutablePaths;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v4, *(void *)(*((void *)&v33 + 1) + 8 * i), v5);
        uint64_t v13 = objc_msgSend_languageResourceBundle(v9, v10, v11, v12);
        v20 = objc_msgSend_wordLanguageModel(v13, v14, v15, v16);
        if (v20)
        {
          uint64_t v21 = objc_msgSend_languageResourceBundle(v9, v17, v18, v19);
          uint64_t v25 = objc_msgSend_wordLanguageModel(v21, v22, v23, v24);
          BOOL v29 = objc_msgSend_lmSPIType(v25, v26, v27, v28) == 1;

          if (v29)
          {
            v30 = objc_opt_class();
            objc_msgSend_applyWordLanguageModelProbabilityToPath_stemmedFromPath_isCommittingToken_(v30, v31, (uint64_t)v9, (uint64_t)v9, 1);
          }
        }
        else
        {
        }
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v6);
  }
}

- (NSMutableDictionary)mutablePaths
{
  return self->_mutablePaths;
}

- (void)setMutablePaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end