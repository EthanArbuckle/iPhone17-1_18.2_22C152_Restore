@interface CHFastStrokeGroupingStrategy
- (CHFastStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locales:(id)a4 clutterFilter:(id)a5;
- (id)fastGroupingResultWithFastGroupingClusters:(void *)a3 clusteredStrokes:(id)a4;
- (id)groupingResultForContextStrokes:(id)a3 clusteredStrokes:(id)a4 fastGroupingResult:(id)a5 point:(CGPoint)a6 tokenizationLevel:(int64_t)a7;
- (id)groupingResultUsingStrokes:(id)a3 distanceMetric:(int)a4 mergingDistanceThreshold:(double)a5 clusteringLinkage:(int)a6 anchorPoints:(unint64_t)a7 shouldCancel:(id)a8;
- (id)lineGroupingResultUsingStrokes:(id)a3 shouldCancel:(id)a4;
- (id)strategyIdentifier;
- (vector<CHFastGroupingCluster,)clustersForStrokes:(CHFastStrokeGroupingStrategy *)self shouldMakeSingleCluster:(SEL)a3 anchorPoints:(id)a4;
@end

@implementation CHFastStrokeGroupingStrategy

- (CHFastStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locales:(id)a4 clutterFilter:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CHFastStrokeGroupingStrategy;
  v11 = [(CHStrokeGroupingStrategy *)&v14 initWithStrokeProvider:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locales, a4);
    objc_storeStrong((id *)&v12->_clutterFilter, a5);
  }

  return v12;
}

- (id)strategyIdentifier
{
  return @"com.apple.corehandwriting.fast_stroke_grouping";
}

- (id)lineGroupingResultUsingStrokes:(id)a3 shouldCancel:(id)a4
{
  v4 = objc_msgSend_groupingResultUsingStrokes_distanceMetric_mergingDistanceThreshold_clusteringLinkage_anchorPoints_shouldCancel_(self, a2, (uint64_t)a3, 3, 1, 1, a4, 30.0);
  return v4;
}

- (id)fastGroupingResultWithFastGroupingClusters:(void *)a3 clusteredStrokes:(id)a4
{
  id v6 = a4;
  v7 = [CHStrokeFastGroupingResult alloc];
  v13 = objc_msgSend_strokeProvider(self, v8, v9, v10, v11, v12);
  v19 = objc_msgSend_strategyIdentifier(self, v14, v15, v16, v17, v18);
  v21 = objc_msgSend_initWithFastGroupingClusters_clusteredStrokes_strokeProvider_strategyIdentifier_clutterFilter_(v7, v20, (uint64_t)a3, (uint64_t)v6, (uint64_t)v13, (uint64_t)v19, self->_clutterFilter);

  return v21;
}

- (id)groupingResultUsingStrokes:(id)a3 distanceMetric:(int)a4 mergingDistanceThreshold:(double)a5 clusteringLinkage:(int)a6 anchorPoints:(unint64_t)a7 shouldCancel:(id)a8
{
  v178[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = (unsigned int (**)(void))a8;
  v160 = self;
  size_t __sz = (size_t)v12;
  objc_msgSend_clustersForStrokes_shouldMakeSingleCluster_anchorPoints_(self, v14, (uint64_t)v12, 0, a7, v15);
  uint64_t v16 = v12;
  int v17 = a6;
  if (v13 && v13[2](v13))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v18 = (id)qword_1EA3C9FA8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_DEBUG, "Canceling line cluster results computation", buf, 2u);
    }

    v19 = 0;
    goto LABEL_134;
  }
  v156 = v13;
  if (a6 == 1)
  {
    unint64_t v20 = 0x8E38E38E38E38E39 * ((v171 - (unsigned char *)v170) >> 3);
    if (v20 >= 0x2711)
    {
      long long v177 = 0uLL;
      v178[0] = 0;
      double v21 = (double)v20 / 10000.0;
      unint64_t v158 = vcvtpd_u64_f64(v21);
      if (v158)
      {
        size_t v22 = 0;
        size_t v23 = 0;
        uint64_t v24 = 0;
        unint64_t v25 = vcvtpd_u64_f64((double)v20 / (double)(unint64_t)ceil(v21));
        size_t v27 = 72 * v25;
        v148 = v178;
        v28 = (_OWORD *)MEMORY[0x1E4F1DAD8];
        unint64_t v164 = v25;
        unint64_t v157 = v25;
        while (1)
        {
          __p = 0;
          v168 = 0;
          v169 = 0;
          if (v25)
          {
            if (v25 > 0x38E38E38E38E38ELL) {
              sub_1C494A220();
            }
            v29 = (char *)operator new(v27);
            v30 = v29;
            uint64_t v31 = 0;
            __p = v29;
            v169 = &v29[72 * v25];
            do
            {
              v32 = &v29[v31];
              *(void *)&v29[v31 + 48] = 0;
              *((void *)v32 + 5) = &v29[v31 + 48];
              *((void *)v32 + 2) = 0;
              *(void *)&v29[v31 + 8] = 0;
              *(void *)v32 = &v29[v31 + 8];
              *(_OWORD *)(v32 + 24) = *v28;
              *((void *)v32 + 7) = 0;
              *((void *)v32 + 8) = 0;
              v31 += 72;
            }
            while (v27 != v31);
            v168 = &v29[72 * v25];
          }
          else
          {
            v30 = 0;
          }
          unint64_t v33 = (v171 - (unsigned char *)v170) / 72;
          uint64_t v163 = v24 + 1;
          unint64_t v34 = (v24 + 1) * v25;
          if (v34 >= v33) {
            unint64_t v34 = (v171 - (unsigned char *)v170) / 72;
          }
          if (v24 * v25 != v34)
          {
            uint64_t v45 = 0;
            v46 = (char *)v170 + v23;
            uint64_t v47 = v164;
            if (v33 < v164) {
              uint64_t v47 = (v171 - (unsigned char *)v170) / 72;
            }
            size_t v48 = v22 + 72 * v47;
            do
            {
              v49 = &v46[v45];
              if (v46 != v30)
              {
                sub_1C4BEBE3C((uint64_t **)&v30[v45], *(uint64_t **)v49, (uint64_t *)v49 + 1);
                *(_OWORD *)&v30[v45 + 24] = *(_OWORD *)&v46[v45 + 24];
                sub_1C499AD9C((uint64_t)&v30[v45 + 40], *(void **)&v46[v45 + 40], &v46[v45 + 48]);
              }
              *(void *)&v30[v45 + 64] = *((void *)v49 + 8);
              v45 += 72;
            }
            while (v48 != v45);
          }
          size_t v161 = v23;
          size_t v162 = v22;
          float v26 = a5;
          sub_1C4BE6CD8((uint64_t **)&v165, (uint64_t)v160, (uint64_t *)&__p, a4, 1, v13, v26);
          v35 = (char *)v165;
          if (v166 - (unsigned char *)v165 < 1) {
            goto LABEL_97;
          }
          uint64_t v36 = (v166 - (unsigned char *)v165) / 72;
          unint64_t v38 = *((void *)&v177 + 1);
          uint64_t v37 = v177;
          uint64_t v39 = (*((void *)&v177 + 1) - (void)v177) / 72;
          uint64_t v40 = v177 + 72 * v39;
          if ((uint64_t)(0x8E38E38E38E38E39 * ((uint64_t)(v178[0] - *((void *)&v177 + 1)) >> 3)) < v36) {
            break;
          }
          uint64_t v50 = *((void *)&v177 + 1) - v40;
          if ((uint64_t)(0x8E38E38E38E38E39 * ((*((void *)&v177 + 1) - v40) >> 3)) >= v36)
          {
            v150 = (char *)v165 + 72 * v36;
            uint64_t v52 = *((void *)&v177 + 1);
            goto LABEL_44;
          }
          uint64_t v154 = (v166 - (unsigned char *)v165) / 72;
          v51 = (char *)v165 + 8 * ((*((void *)&v177 + 1) - v40) >> 3);
          uint64_t v52 = sub_1C4BEC1C0((uint64_t)v178, (uint64_t)v51, (uint64_t)v166, *((uint64_t *)&v177 + 1));
          *((void *)&v177 + 1) = v52;
          if (v50 >= 1)
          {
            v150 = v51;
            uint64_t v36 = v154;
LABEL_44:
            uint64_t v53 = v40 + 72 * v36;
            unint64_t v54 = v52 - 72 * v36;
            uint64_t v55 = v52;
            if (v54 < v38)
            {
              uint64_t v56 = 0;
              uint64_t v57 = v37 + 8 * ((v52 - v53) >> 3) + 72 * v39;
              do
              {
                v58 = (void *)(v52 + v56);
                void *v58 = *(void *)(v57 + v56);
                v59 = (uint64_t *)(v57 + v56 + 8);
                uint64_t v60 = *v59;
                v58[1] = *v59;
                uint64_t v61 = v52 + v56 + 8;
                uint64_t v62 = *(void *)(v57 + v56 + 16);
                *(void *)(v52 + v56 + 16) = v62;
                if (v62)
                {
                  *(void *)(v60 + 16) = v61;
                  *(void *)(v57 + v56) = v59;
                  uint64_t *v59 = 0;
                  *(void *)(v57 + v56 + 16) = 0;
                }
                else
                {
                  *(void *)(v52 + v56) = v61;
                }
                uint64_t v63 = v52 + v56;
                *(_OWORD *)(v63 + 24) = *(_OWORD *)(v57 + v56 + 24);
                *(void *)(v63 + 40) = *(void *)(v57 + v56 + 40);
                v64 = (uint64_t *)(v57 + v56 + 48);
                uint64_t v65 = *v64;
                *(void *)(v52 + v56 + 48) = *v64;
                uint64_t v66 = v52 + v56 + 48;
                uint64_t v67 = *(void *)(v57 + v56 + 56);
                *(void *)(v63 + 56) = v67;
                if (v67)
                {
                  *(void *)(v65 + 16) = v66;
                  *(void *)(v57 + v56 + 40) = v64;
                  uint64_t *v64 = 0;
                  *(void *)(v57 + v56 + 56) = 0;
                }
                else
                {
                  *(void *)(v63 + 40) = v66;
                }
                *(void *)(v52 + v56 + 64) = *(void *)(v57 + v56 + 64);
                v56 += 72;
              }
              while (v57 + v56 < v38);
              uint64_t v55 = v52 + v56;
            }
            *((void *)&v177 + 1) = v55;
            if (v52 != v53)
            {
              uint64_t v68 = 0;
              uint64_t v69 = -8 * ((v52 - v53) >> 3);
              do
              {
                uint64_t v70 = v54 + v68;
                v71 = (void **)(v52 + v68 - 64);
                sub_1C494AC4C(v52 + v68 - 72, *v71);
                *(void *)(v52 + v68 - 72) = *(void *)(v54 + v68 - 72);
                v72 = (void *)(v54 + v68 - 64);
                v73 = (void *)*v72;
                *v71 = (void *)*v72;
                uint64_t v74 = *(void *)(v54 + v68 - 56);
                *(void *)(v52 + v68 - 56) = v74;
                if (v74)
                {
                  v73[2] = v71;
                  *(void *)(v70 - 72) = v72;
                  void *v72 = 0;
                  *(void *)(v70 - 56) = 0;
                }
                else
                {
                  *(void *)(v52 + v68 - 72) = v71;
                }
                uint64_t v75 = v54 + v68;
                v77 = (void **)(v52 + v68 - 24);
                v76 = *v77;
                *(_OWORD *)(v52 + v68 - 48) = *(_OWORD *)(v54 + v68 - 48);
                sub_1C4999C7C(v52 + v68 - 32, v76);
                *(void *)(v52 + v68 - 32) = *(void *)(v54 + v68 - 32);
                v78 = (void *)(v54 + v68 - 24);
                v79 = (void *)*v78;
                *v77 = (void *)*v78;
                uint64_t v80 = *(void *)(v54 + v68 - 16);
                *(void *)(v52 + v68 - 16) = v80;
                if (v80)
                {
                  v79[2] = v77;
                  *(void *)(v75 - 32) = v78;
                  void *v78 = 0;
                  *(void *)(v75 - 16) = 0;
                }
                else
                {
                  *(void *)(v52 + v68 - 32) = v77;
                }
                *(void *)(v52 + v68 - 8) = *(void *)(v54 + v68 - 8);
                v68 -= 72;
              }
              while (v69 != v68);
            }
            v13 = v156;
            if (v150 != v35)
            {
              uint64_t v81 = 0;
              do
              {
                if (v35 != (char *)v40)
                {
                  sub_1C4BEBE3C((uint64_t **)(v40 + v81), *(uint64_t **)&v35[v81], (uint64_t *)&v35[v81 + 8]);
                  *(_OWORD *)(v40 + v81 + 24) = *(_OWORD *)&v35[v81 + 24];
                  sub_1C499AD9C(v40 + v81 + 40, *(void **)&v35[v81 + 40], &v35[v81 + 48]);
                }
                *(void *)(v40 + v81 + 64) = *(void *)&v35[v81 + 64];
                v81 += 72;
              }
              while (&v35[v81] != v150);
            }
          }
LABEL_97:
          v119 = v165;
          unint64_t v25 = v157;
          v28 = (_OWORD *)MEMORY[0x1E4F1DAD8];
          if (v165)
          {
            v120 = v165;
            if (v166 != v165)
            {
              uint64_t v121 = (uint64_t)(v166 - 32);
              do
              {
                v122 = (unsigned char *)(v121 - 40);
                sub_1C4999C7C(v121, *(void **)(v121 + 8));
                sub_1C494AC4C(v121 - 40, *(void **)(v121 - 32));
                v121 -= 72;
              }
              while (v122 != v119);
              v120 = v165;
            }
            v166 = v119;
            operator delete(v120);
          }
          v123 = (char *)__p;
          if (__p)
          {
            v124 = __p;
            if (v168 != __p)
            {
              uint64_t v125 = (uint64_t)(v168 - 32);
              do
              {
                v126 = (char *)(v125 - 40);
                sub_1C4999C7C(v125, *(void **)(v125 + 8));
                sub_1C494AC4C(v125 - 40, *(void **)(v125 - 32));
                v125 -= 72;
              }
              while (v126 != v123);
              v124 = __p;
            }
            v168 = v123;
            operator delete(v124);
          }
          size_t v23 = v161 + v27;
          size_t v22 = v162 - v27;
          v164 += v157;
          uint64_t v24 = v163;
          if (v163 == v158)
          {
            uint64_t v128 = *((void *)&v177 + 1);
            uint64_t v127 = v177;
            uint64_t v16 = (void *)__sz;
            goto LABEL_110;
          }
        }
        unint64_t v41 = v39 + v36;
        if ((unint64_t)(v39 + v36) > 0x38E38E38E38E38ELL) {
          sub_1C494A220();
        }
        if (0x1C71C71C71C71C72 * ((uint64_t)(v178[0] - v177) >> 3) > v41) {
          unint64_t v41 = 0x1C71C71C71C71C72 * ((uint64_t)(v178[0] - v177) >> 3);
        }
        if (0x8E38E38E38E38E39 * ((uint64_t)(v178[0] - v177) >> 3) >= 0x1C71C71C71C71C7) {
          unint64_t v42 = 0x38E38E38E38E38ELL;
        }
        else {
          unint64_t v42 = v41;
        }
        v176 = v178;
        if (v42)
        {
          if (v42 > 0x38E38E38E38E38ELL) {
            sub_1C4949AA8();
          }
          uint64_t v43 = (v166 - (unsigned char *)v165) / 72;
          v44 = (char *)operator new(72 * v42);
          uint64_t v36 = v43;
        }
        else
        {
          v44 = 0;
        }
        uint64_t v82 = 0;
        v149 = v44;
        uint64_t v151 = v39;
        v83 = &v44[72 * v39];
        *(void *)buf = v44;
        v173 = v83;
        v174 = v83;
        v175 = &v44[72 * v42];
        uint64_t v155 = v36;
        uint64_t v84 = 72 * v36;
        v85 = &v83[72 * v36];
        do
        {
          v86 = &v83[v82];
          *((void *)v86 + 2) = 0;
          *(void *)&v83[v82 + 8] = 0;
          *(void *)v86 = &v83[v82 + 8];
          sub_1C49AB0DC(&v83[v82], *(void **)&v35[v82], &v35[v82 + 8]);
          long long v87 = *(_OWORD *)&v35[v82 + 24];
          *((void *)v86 + 6) = 0;
          *((void *)v86 + 5) = v86 + 48;
          v88 = &v83[v82 + 40];
          *((_OWORD *)v88 - 1) = v87;
          *((void *)v88 + 2) = 0;
          sub_1C499A568(v88, *(void **)&v35[v82 + 40], &v35[v82 + 48]);
          *(void *)&v83[v82 + 64] = *(void *)&v35[v82 + 64];
          v82 += 72;
        }
        while (v84 != v82);
        v89 = v173;
        uint64_t v90 = v177;
        if ((void)v177 == v40)
        {
          v13 = v156;
          uint64_t v92 = v151;
          uint64_t v103 = *((void *)&v177 + 1);
          if (*((void *)&v177 + 1) == v40)
          {
LABEL_92:
            v116 = (void *)v177;
            *(void *)&long long v177 = v89;
            *((void *)&v177 + 1) = v85;
            v178[0] = v175;
            if ((void *)v40 != v116)
            {
              uint64_t v117 = v40 - 32;
              do
              {
                v118 = (void *)(v117 - 40);
                sub_1C4999C7C(v117, *(void **)(v117 + 8));
                sub_1C494AC4C(v117 - 40, *(void **)(v117 - 32));
                v117 -= 72;
              }
              while (v118 != v116);
            }
            if (v116) {
              operator delete(v116);
            }
            goto LABEL_97;
          }
        }
        else
        {
          uint64_t v91 = 0;
          v13 = v156;
          uint64_t v92 = v151;
          do
          {
            v93 = &v89[v91];
            *((void *)v93 - 9) = *(void *)(v40 + v91 - 72);
            v94 = (uint64_t *)(v40 + v91 - 64);
            uint64_t v95 = *v94;
            *(void *)&v89[v91 - 64] = *v94;
            uint64_t v96 = (uint64_t)&v89[v91 - 64];
            uint64_t v97 = *(void *)(v40 + v91 - 56);
            *((void *)v93 - 7) = v97;
            if (v97)
            {
              *(void *)(v95 + 16) = v96;
              *(void *)(v40 + v91 - 72) = v94;
              uint64_t *v94 = 0;
              *(void *)(v40 + v91 - 56) = 0;
            }
            else
            {
              *((void *)v93 - 9) = v96;
            }
            v98 = &v89[v91];
            *((_OWORD *)v98 - 3) = *(_OWORD *)(v40 + v91 - 48);
            *((void *)v98 - 4) = *(void *)(v40 + v91 - 32);
            v99 = (uint64_t *)(v40 + v91 - 24);
            uint64_t v100 = *v99;
            *(void *)&v89[v91 - 24] = *v99;
            uint64_t v101 = (uint64_t)&v89[v91 - 24];
            uint64_t v102 = *(void *)(v40 + v91 - 16);
            *((void *)v98 - 2) = v102;
            if (v102)
            {
              *(void *)(v100 + 16) = v101;
              *(void *)(v40 + v91 - 32) = v99;
              uint64_t *v99 = 0;
              *(void *)(v40 + v91 - 16) = 0;
            }
            else
            {
              *((void *)v98 - 4) = v101;
            }
            *(void *)&v89[v91 - 8] = *(void *)(v40 + v91 - 8);
            v91 -= 72;
          }
          while (v40 + v91 != v90);
          v89 += v91;
          v173 = v89;
          uint64_t v103 = *((void *)&v177 + 1);
          if (*((void *)&v177 + 1) == v40) {
            goto LABEL_92;
          }
        }
        uint64_t v104 = 72 * v92;
        v105 = &v149[72 * v155];
        do
        {
          v106 = &v105[v104];
          *(void *)v106 = *(void *)(v37 + 72 * v92);
          v107 = (uint64_t *)(v37 + v104 + 8);
          uint64_t v108 = *v107;
          *((void *)v106 + 1) = *v107;
          uint64_t v109 = (uint64_t)&v105[v104 + 8];
          uint64_t v110 = *(void *)(v37 + v104 + 16);
          *(void *)&v105[v104 + 16] = v110;
          if (v110)
          {
            *(void *)(v108 + 16) = v109;
            *(void *)(v37 + 72 * v92) = v107;
            uint64_t *v107 = 0;
            *(void *)(v37 + v104 + 16) = 0;
          }
          else
          {
            *(void *)&v105[72 * v92] = v109;
          }
          v111 = &v105[v104];
          *(_OWORD *)(v111 + 24) = *(_OWORD *)(v37 + v104 + 24);
          *((void *)v111 + 5) = *(void *)(v37 + v104 + 40);
          v112 = (uint64_t *)(v37 + v104 + 48);
          uint64_t v113 = *v112;
          *(void *)&v105[v104 + 48] = *v112;
          uint64_t v114 = (uint64_t)&v105[v104 + 48];
          uint64_t v115 = *(void *)(v37 + v104 + 56);
          *((void *)v111 + 7) = v115;
          if (v115)
          {
            *(void *)(v113 + 16) = v114;
            *(void *)(v37 + v104 + 40) = v112;
            uint64_t *v112 = 0;
            *(void *)(v37 + v104 + 56) = 0;
          }
          else
          {
            *((void *)v111 + 5) = v114;
          }
          *(void *)&v105[v104 + 64] = *(void *)(v37 + v104 + 64);
          v37 += 72;
          v105 += 72;
        }
        while (v37 + v104 != v103);
        v89 = v173;
        uint64_t v40 = *((void *)&v177 + 1);
        v85 = &v105[72 * v92];
        goto LABEL_92;
      }
      uint64_t v128 = 0;
      uint64_t v127 = 0;
LABEL_110:
      sub_1C4BEC340((uint64_t *)&v170, v127, v128, 0x8E38E38E38E38E39 * ((v128 - v127) >> 3));
      uint64_t v129 = v177;
      if ((void)v177)
      {
        v130 = (void *)v177;
        if (*((void *)&v177 + 1) != (void)v177)
        {
          uint64_t v131 = *((void *)&v177 + 1) - 32;
          do
          {
            uint64_t v132 = v131 - 40;
            sub_1C4999C7C(v131, *(void **)(v131 + 8));
            sub_1C494AC4C(v131 - 40, *(void **)(v131 - 32));
            v131 -= 72;
          }
          while (v132 != v129);
          v130 = (void *)v177;
          uint64_t v16 = (void *)__sz;
          v13 = v156;
        }
        *((void *)&v177 + 1) = v129;
        operator delete(v130);
      }
      int v17 = a6;
    }
  }
  float v133 = a5;
  sub_1C4BE6CD8((uint64_t **)buf, (uint64_t)v160, (uint64_t *)&v170, a4, v17, v13, v133);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v134 = (id)qword_1EA3C9FA8;
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v177) = 134217984;
    *(void *)((char *)&v177 + 4) = 0x8E38E38E38E38E39 * ((uint64_t)&v173[-*(void *)buf] >> 3);
    _os_log_impl(&dword_1C492D000, v134, OS_LOG_TYPE_DEBUG, "%lu clusters found by the fast grouping algorithm", (uint8_t *)&v177, 0xCu);
  }

  if (v13 && v13[2](v13))
  {
    if (qword_1EA3CA000 == -1)
    {
      v138 = (id)qword_1EA3C9FA8;
      if (!os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_126;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v138 = (id)qword_1EA3C9FA8;
      if (!os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
      {
LABEL_126:

        v19 = 0;
        v139 = *(char **)buf;
        if (!*(void *)buf) {
          goto LABEL_134;
        }
        goto LABEL_129;
      }
    }
    LOWORD(v177) = 0;
    _os_log_impl(&dword_1C492D000, v138, OS_LOG_TYPE_DEBUG, "Canceling line cluster results computation", (uint8_t *)&v177, 2u);
    goto LABEL_126;
  }
  v19 = objc_msgSend_fastGroupingResultWithFastGroupingClusters_clusteredStrokes_(v160, v135, (uint64_t)buf, (uint64_t)v16, v136, v137, v148);
  v139 = *(char **)buf;
  if (!*(void *)buf) {
    goto LABEL_134;
  }
LABEL_129:
  v140 = v139;
  if (v173 != v139)
  {
    uint64_t v141 = (uint64_t)(v173 - 32);
    do
    {
      uint64_t v142 = v141 - 40;
      sub_1C4999C7C(v141, *(void **)(v141 + 8));
      sub_1C494AC4C(v141 - 40, *(void **)(v141 - 32));
      v141 -= 72;
    }
    while ((char *)v142 != v139);
    v140 = *(char **)buf;
  }
  v173 = v139;
  operator delete(v140);
LABEL_134:
  v143 = v170;
  if (v170)
  {
    v144 = v170;
    if (v171 != v170)
    {
      uint64_t v145 = (uint64_t)(v171 - 32);
      do
      {
        v146 = (unsigned char *)(v145 - 40);
        sub_1C4999C7C(v145, *(void **)(v145 + 8));
        sub_1C494AC4C(v145 - 40, *(void **)(v145 - 32));
        v145 -= 72;
      }
      while (v146 != v143);
      v144 = v170;
    }
    v171 = v143;
    operator delete(v144);
  }

  return v19;
}

- (vector<CHFastGroupingCluster,)clustersForStrokes:(CHFastStrokeGroupingStrategy *)self shouldMakeSingleCluster:(SEL)a3 anchorPoints:(id)a4
{
  char v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  uint64_t v10 = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v167 = 0;
  uint64_t v168 = 0;
  v166 = &v167;
  id v142 = v9;
  v143 = retstr;
  BOOL v141 = v7;
  char v140 = v6;
  for (unint64_t i = objc_msgSend_count(v9, v11, v12, v13, v14, v15);
        (unint64_t)v10 < i;
        unint64_t i = objc_msgSend_count(v9, v21, v22, v23, v24, v25))
  {
    float v26 = objc_msgSend_objectAtIndexedSubscript_(v9, v17, (uint64_t)v10, v18, v19, v20);
    v32 = v26;
    clutterFilter = self->_clutterFilter;
    if (!clutterFilter
      || (objc_msgSend_encodedStrokeIdentifier(v26, v27, v28, v29, v30, v31),
          unint64_t v34 = objc_claimAutoreleasedReturnValue(),
          char isHighDensityStroke = objc_msgSend_isHighDensityStroke_(clutterFilter, v35, (uint64_t)v34, v36, v37, v38),
          v34,
          (isHighDensityStroke & 1) == 0))
    {
      objc_msgSend_bounds(v32, v27, v28, v29, v30, v31);
      CGFloat MidX = CGRectGetMidX(v169);
      objc_msgSend_bounds(v32, v41, v42, v43, v44, v45);
      CGFloat MidY = CGRectGetMidY(v170);
      v159 = 0;
      v160[0] = &v159;
      v160[1] = (void *)0x4812000000;
      *(void *)&long long v161 = sub_1C4BE9570;
      *((void *)&v161 + 1) = sub_1C4BE9594;
      size_t v162 = &unk_1C4CB5C62;
      unint64_t v164 = 0;
      v165 = 0;
      uint64_t v163 = 0;
      if (v7)
      {
        v51 = (CGFloat *)operator new(0x10uLL);
        uint64_t v52 = v51;
        CGFloat *v51 = MidX;
        v51[1] = MidY;
        uint64_t v53 = &v167;
        unint64_t v54 = &v167;
        uint64_t v55 = v167;
        if (v167)
        {
          while (1)
          {
            while (1)
            {
              uint64_t v53 = (uint64_t **)v55;
              unint64_t v56 = v55[4];
              if ((unint64_t)v10 >= v56) {
                break;
              }
              uint64_t v55 = *v53;
              unint64_t v54 = v53;
              if (!*v53) {
                goto LABEL_14;
              }
            }
            if (v56 >= (unint64_t)v10) {
              break;
            }
            uint64_t v55 = v53[1];
            if (!v55)
            {
              unint64_t v54 = v53 + 1;
              goto LABEL_14;
            }
          }
          operator delete(v51);
        }
        else
        {
LABEL_14:
          uint64_t v57 = (uint64_t *)operator new(0x40uLL);
          v57[4] = (uint64_t)v10;
          v57[5] = (uint64_t)v52;
          v57[6] = (uint64_t)(v52 + 2);
          v57[7] = (uint64_t)(v52 + 2);
          *uint64_t v57 = 0;
          v57[1] = 0;
          v57[2] = (uint64_t)v53;
          *unint64_t v54 = v57;
          if (*v166)
          {
            v166 = (uint64_t **)*v166;
            uint64_t v57 = *v54;
          }
          sub_1C4949FD4(v167, v57);
          ++v168;
        }
      }
      else
      {
        if (v6)
        {
          v58 = operator new(0x10uLL);
          *(CGFloat *)v58 = MidX;
          *((CGFloat *)v58 + 1) = MidY;
          unint64_t v164 = v58 + 2;
          v165 = v58 + 2;
          uint64_t v163 = v58;
        }
        if ((v6 & 2) != 0)
        {
          v158[0] = MEMORY[0x1E4F143A8];
          v158[1] = 3221225472;
          v158[2] = sub_1C4BE95AC;
          v158[3] = &unk_1E64E18B8;
          v158[4] = &v159;
          objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v32, v46, (uint64_t)v158, v47, v48, v49, 1.79769313e308);
        }
        if ((v6 & 4) != 0)
        {
          v150 = 0;
          uint64_t v151 = &v150;
          uint64_t v152 = 0x4812000000;
          *(void *)&long long v153 = sub_1C4BE9570;
          *((void *)&v153 + 1) = sub_1C4BE9594;
          uint64_t v154 = &unk_1C4CB5C62;
          v156 = 0;
          uint64_t v157 = 0;
          uint64_t v155 = 0;
          v149[0] = MEMORY[0x1E4F143A8];
          v149[1] = 3221225472;
          v149[2] = sub_1C4BE96D4;
          v149[3] = &unk_1E64E18B8;
          v149[4] = &v150;
          objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v32, v46, (uint64_t)v149, v47, v48, v49, 1.0);
          v59 = objc_opt_class();
          if (v59)
          {
            objc_msgSend_convexHullForPoints_(v59, v60, (uint64_t)(v151 + 6), v61, v62, v63);
          }
          else
          {
            __p = 0;
            v147 = 0;
            uint64_t v148 = 0;
          }
          v144 = v32;
          uint64_t v69 = objc_alloc_init(CHDrawing);
          uint64_t v70 = (double *)__p;
          v71 = v147;
          if (__p != v147)
          {
            do
            {
              objc_msgSend_addPoint_(v69, v64, v65, v66, v67, v68, *v70, v70[1]);
              v70 += 2;
            }
            while (v70 != v71);
          }
          objc_msgSend_endStroke(v69, v64, v65, v66, v67, v68);
          objc_msgSend_bounds(v32, v72, v73, v74, v75, v76);
          double v78 = v77;
          objc_msgSend_bounds(v32, v79, v80, v81, v82, v83);
          if (v78 <= v89)
          {
            objc_msgSend_bounds(v32, v84, v85, v86, v87, v88);
            double v95 = v96;
          }
          else
          {
            objc_msgSend_bounds(v32, v84, v85, v86, v87, v88);
          }
          uint64_t v97 = objc_msgSend_drawingSpatiallyResampled_(v69, v90, v91, v92, v93, v94, v95 / 10.0);
          unint64_t v98 = 0;
          unint64_t v103 = objc_msgSend_pointCountForStrokeIndex_(v97, v99, 0, v100, v101, v102);
          while (2)
          {
            if (v98 >= v103)
            {

              if (__p)
              {
                v147 = (double *)__p;
                operator delete(__p);
              }
              _Block_object_dispose(&v150, 8);
              id v9 = v142;
              retstr = v143;
              v32 = v144;
              BOOL v7 = v141;
              char v6 = v140;
              if (v155)
              {
                v156 = v155;
                operator delete(v155);
              }
              break;
            }
            uint64_t v108 = v160[0];
            objc_msgSend_pointForStrokeIndex_pointIndex_(v97, v104, 0, v98, v105, v106);
            uint64_t v115 = v113;
            uint64_t v116 = v114;
            v118 = (char *)v108[7];
            unint64_t v117 = v108[8];
            if ((unint64_t)v118 < v117)
            {
              *(void *)v118 = v113;
              *((void *)v118 + 1) = v114;
              v107 = v118 + 16;
              goto LABEL_33;
            }
            v119 = (char *)v108[6];
            uint64_t v120 = (v118 - v119) >> 4;
            unint64_t v121 = v120 + 1;
            if ((unint64_t)(v120 + 1) >> 60) {
              sub_1C494A220();
            }
            uint64_t v122 = v117 - (void)v119;
            if (v122 >> 3 > v121) {
              unint64_t v121 = v122 >> 3;
            }
            if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v123 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v123 = v121;
            }
            if (v123)
            {
              if (v123 >> 60) {
                sub_1C4949AA8();
              }
              v124 = (char *)operator new(16 * v123);
              uint64_t v125 = &v124[16 * v120];
              *(void *)uint64_t v125 = v115;
              *((void *)v125 + 1) = v116;
              uint64_t v126 = (uint64_t)v125;
              if (v118 == v119)
              {
LABEL_50:
                v107 = v125 + 16;
                v108[6] = v126;
                v108[7] = v125 + 16;
                v108[8] = &v124[16 * v123];
                if (v118) {
                  goto LABEL_51;
                }
                goto LABEL_33;
              }
            }
            else
            {
              v124 = 0;
              uint64_t v125 = (char *)(16 * v120);
              *(void *)uint64_t v125 = v113;
              *((void *)v125 + 1) = v114;
              uint64_t v126 = 16 * v120;
              if (v118 == v119) {
                goto LABEL_50;
              }
            }
            do
            {
              *(_OWORD *)(v126 - 16) = *((_OWORD *)v118 - 1);
              v126 -= 16;
              v118 -= 16;
            }
            while (v118 != v119);
            v118 = (char *)v108[6];
            v107 = v125 + 16;
            v108[6] = v126;
            v108[7] = v125 + 16;
            v108[8] = &v124[16 * v123];
            if (v118) {
LABEL_51:
            }
              operator delete(v118);
LABEL_33:
            v108[7] = v107;
            ++v98;
            unint64_t v103 = objc_msgSend_pointCountForStrokeIndex_(v97, v109, 0, v110, v111, v112);
            continue;
          }
        }
        v147 = 0;
        uint64_t v148 = 0;
        __p = &v147;
        v150 = v10;
        uint64_t v152 = 0;
        *(void *)&long long v153 = 0;
        uint64_t v151 = 0;
        uint64_t v128 = (unsigned char *)v160[0][6];
        uint64_t v127 = (unsigned char *)v160[0][7];
        int64_t v129 = v127 - v128;
        if (v127 == v128)
        {
          uint64_t v131 = 0;
          v130 = 0;
        }
        else
        {
          if (v129 < 0) {
            sub_1C494A220();
          }
          v130 = (char *)operator new(v127 - v128);
          uint64_t v131 = &v130[16 * (v129 >> 4)];
          memcpy(v130, v128, v129);
        }
        uint64_t v132 = operator new(0x40uLL);
        v132[4] = v10;
        v132[5] = v130;
        v132[6] = v131;
        v132[7] = v131;
        *uint64_t v132 = 0;
        v132[1] = 0;
        v132[2] = &v147;
        __p = v132;
        v147 = (double *)v132;
        *((unsigned char *)v132 + 24) = 1;
        uint64_t v148 = 1;
        sub_1C49A8024((uint64_t)&v150, &__p);
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v135 = sub_1C49AB30C((void **)&retstr->__begin_, (uint64_t)&v150);
        }
        else
        {
          *((void *)end + 2) = 0;
          *((void *)end + 1) = 0;
          *(void *)end = (char *)end + 8;
          sub_1C49AB0DC(end, v150, &v151);
          long long v134 = v153;
          *((void *)end + 6) = 0;
          *((void *)end + 5) = (char *)end + 48;
          *(_OWORD *)((char *)end + 24) = v134;
          *((void *)end + 7) = 0;
          sub_1C499A568((void *)end + 5, v154, &v155);
          *((void *)end + 8) = v157;
          v135 = (char *)end + 72;
          retstr->__end_ = (CHFastGroupingCluster *)((char *)end + 72);
        }
        retstr->__end_ = (CHFastGroupingCluster *)v135;
        sub_1C4999C7C((uint64_t)&v154, v155);
        sub_1C494AC4C((uint64_t)&v150, v151);
        sub_1C494AC4C((uint64_t)&__p, v147);
      }
      _Block_object_dispose(&v159, 8);
      if (v163)
      {
        unint64_t v164 = v163;
        operator delete(v163);
      }
    }

    uint64_t v10 = (void *)((char *)v10 + 1);
  }
  if (v7)
  {
    sub_1C49A8024((uint64_t)&v159, &v166);
    uint64_t v136 = retstr->__end_;
    if (v136 >= retstr->__end_cap_.__value_)
    {
      v138 = sub_1C49AB30C((void **)&retstr->__begin_, (uint64_t)&v159);
    }
    else
    {
      *((void *)v136 + 2) = 0;
      *((void *)v136 + 1) = 0;
      *(void *)uint64_t v136 = (char *)v136 + 8;
      sub_1C49AB0DC(v136, v159, v160);
      long long v137 = v161;
      *((void *)v136 + 6) = 0;
      *((void *)v136 + 5) = (char *)v136 + 48;
      *(_OWORD *)((char *)v136 + 24) = v137;
      *((void *)v136 + 7) = 0;
      sub_1C499A568((void *)v136 + 5, v162, &v163);
      *((void *)v136 + 8) = v165;
      v138 = (char *)v136 + 72;
      retstr->__end_ = (CHFastGroupingCluster *)((char *)v136 + 72);
    }
    retstr->__end_ = (CHFastGroupingCluster *)v138;
    sub_1C4999C7C((uint64_t)&v162, v163);
    sub_1C494AC4C((uint64_t)&v159, v160[0]);
  }
  sub_1C494AC4C((uint64_t)&v166, v167);

  return result;
}

- (id)groupingResultForContextStrokes:(id)a3 clusteredStrokes:(id)a4 fastGroupingResult:(id)a5 point:(CGPoint)a6 tokenizationLevel:(int64_t)a7
{
  float64_t obj = a6.x;
  float64_t y = a6.y;
  uint64_t v370 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v337 = a4;
  id v11 = a5;
  int64_t v335 = a7;
  v336 = v11;
  v338 = v10;
  if (!a7)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v12, (uint64_t)v10, v14, v15, v16);
    id v65 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_299;
  }
  if (v11)
  {
    objc_msgSend_fastGroupingClusters(v11, v12, v13, v14, v15, v16);
    int64_t v22 = a7;
    if (a7 == 1)
    {
LABEL_4:
      if (objc_msgSend_count(v10, v17, v18, v19, v20, v21))
      {
        id v354 = v10;
        id v23 = v337;
        if (self)
        {
          uint64_t v24 = v360[0];
          if (v360[1] != v360[0])
          {
            while (1)
            {
              while (1)
              {
                long long v366 = 0u;
                long long v367 = 0u;
                *(_OWORD *)__p = 0u;
                long long v365 = 0u;
                id v25 = v354;
                uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)__p, (uint64_t)&buf, 16, v27);
                if (!v33) {
                  break;
                }
                uint64_t v34 = *(void *)v365;
                while (1)
                {
                  uint64_t v35 = 0;
LABEL_12:
                  if (*(void *)v365 != v34) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v36 = *((void *)__p[1] + v35);
                  uint64_t v37 = objc_msgSend_strokeProvider(self, v28, v29, v30, v31, v32);
                  unint64_t v41 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v38, v36, (uint64_t)v37, v39, v40);

                  unint64_t v46 = objc_msgSend_indexOfObject_(v23, v42, (uint64_t)v41, v43, v44, v45);
                  uint64_t v47 = (void *)v24[6];
                  if (v47) {
                    break;
                  }
LABEL_15:

                  if (++v35 != v33) {
                    goto LABEL_12;
                  }
                  uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)__p, (uint64_t)&buf, 16, v32);
                  uint64_t v33 = v49;
                  if (!v49) {
                    goto LABEL_22;
                  }
                }
                while (1)
                {
                  unint64_t v48 = v47[4];
                  if (v46 >= v48) {
                    break;
                  }
LABEL_17:
                  uint64_t v47 = (void *)*v47;
                  if (!v47) {
                    goto LABEL_15;
                  }
                }
                if (v48 < v46)
                {
                  ++v47;
                  goto LABEL_17;
                }

                v24 += 9;
                if (v360[1] == v24) {
                  goto LABEL_50;
                }
              }
LABEL_22:

              uint64_t v50 = v24 + 9;
              v51 = v360[1];
              if (v24 + 9 != v360[1]) {
                break;
              }
              uint64_t v53 = v24;
              if (v50 != v24) {
                goto LABEL_36;
              }
LABEL_8:
              v360[1] = v53;
              if (v53 == v24) {
                goto LABEL_50;
              }
            }
            uint64_t v52 = (uint64_t)v24;
            do
            {
              uint64_t v55 = v52 + 8;
              sub_1C494AC4C(v52, *(void **)(v52 + 8));
              *(void *)uint64_t v52 = *(void *)(v52 + 72);
              unint64_t v56 = (void *)(v52 + 80);
              uint64_t v57 = *(void *)(v52 + 80);
              *(void *)(v52 + 8) = v57;
              uint64_t v58 = *(void *)(v52 + 88);
              *(void *)(v52 + 16) = v58;
              if (v58)
              {
                *(void *)(v57 + 16) = v55;
                *(void *)(v52 + 72) = v56;
                *unint64_t v56 = 0;
                *(void *)(v52 + 88) = 0;
              }
              else
              {
                *(void *)uint64_t v52 = v55;
              }
              *(_OWORD *)(v52 + 24) = *(_OWORD *)(v52 + 96);
              uint64_t v59 = v52 + 48;
              sub_1C4999C7C(v52 + 40, *(void **)(v52 + 48));
              uint64_t v60 = (void *)(v52 + 120);
              uint64_t v61 = *(void *)(v52 + 120);
              *(void *)(v52 + 40) = *(void *)(v52 + 112);
              *(void *)(v52 + 48) = v61;
              uint64_t v62 = *(void *)(v52 + 128);
              *(void *)(v52 + 56) = v62;
              if (v62)
              {
                *(void *)(v61 + 16) = v59;
                *(void *)(v52 + 112) = v60;
                *uint64_t v60 = 0;
                *(void *)(v52 + 128) = 0;
              }
              else
              {
                *(void *)(v52 + 40) = v59;
              }
              *(void *)(v52 + 64) = *(void *)(v52 + 136);
              uint64_t v53 = (void *)(v52 + 72);
              unint64_t v54 = (void *)(v52 + 144);
              v52 += 72;
            }
            while (v54 != v51);
            uint64_t v50 = v360[1];
            if (v360[1] == v53) {
              goto LABEL_8;
            }
LABEL_36:
            uint64_t v63 = (uint64_t)(v50 - 4);
            do
            {
              v64 = (void *)(v63 - 40);
              sub_1C4999C7C(v63, *(void **)(v63 + 8));
              sub_1C494AC4C(v63 - 40, *(void **)(v63 - 32));
              v63 -= 72;
            }
            while (v64 != v53);
            goto LABEL_8;
          }
        }
LABEL_50:
      }
      long long v358 = 0uLL;
      unint64_t v359 = 0;
      uint64_t v69 = (char *)v360[0];
      if (!self || v360[1] == v360[0]) {
        goto LABEL_199;
      }
      unint64_t v70 = 0;
      while (1)
      {
        CHFastGroupingCluster::explode((CHFastGroupingCluster *)&v69[72 * v70], (uint64_t)__p);
        sub_1C4BE6CD8((uint64_t **)&v362, (uint64_t)self, (uint64_t *)__p, 2u, 1, 0, 50.0);
        v72 = (char *)v362;
        v71 = v363;
        if (v363 != v362) {
          break;
        }
        v72 = v363;
        if (v363) {
          goto LABEL_189;
        }
LABEL_194:
        v147 = (char *)__p[0];
        if (__p[0])
        {
          uint64_t v148 = __p[0];
          if (__p[1] != __p[0])
          {
            v149 = (char *)__p[1] - 32;
            do
            {
              v150 = v149 - 40;
              sub_1C4999C7C((uint64_t)v149, *((void **)v149 + 1));
              sub_1C494AC4C((uint64_t)(v149 - 40), *((void **)v149 - 4));
              v149 -= 72;
            }
            while (v150 != v147);
            uint64_t v148 = __p[0];
          }
          __p[1] = v147;
          operator delete(v148);
        }
        ++v70;
        uint64_t v69 = (char *)v360[0];
        if (v70 >= 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3))
        {
LABEL_199:
          if (v69)
          {
            uint64_t v151 = v69;
            if (v360[1] != v69)
            {
              uint64_t v152 = (char *)v360[1] - 32;
              do
              {
                long long v153 = v152 - 40;
                sub_1C4999C7C((uint64_t)v152, *((void **)v152 + 1));
                sub_1C494AC4C((uint64_t)(v152 - 40), *((void **)v152 - 4));
                v152 -= 72;
              }
              while (v153 != v69);
              uint64_t v151 = (char *)v360[0];
            }
            v360[1] = v69;
            operator delete(v151);
          }
          *(_OWORD *)v360 = v358;
          unint64_t v361 = v359;
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v154 = (id)qword_1EA3C9FA8;
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3);
            _os_log_impl(&dword_1C492D000, v154, OS_LOG_TYPE_DEBUG, "groupingResultForContextStrokes: %lu words found", (uint8_t *)&buf, 0xCu);
          }

          goto LABEL_210;
        }
      }
      unint64_t v340 = v70;
      unint64_t v73 = 0;
      uint64_t v74 = (char *)*((void *)&v358 + 1);
      while (1)
      {
        uint64_t v75 = &v72[72 * v73];
        if ((unint64_t)v74 >= v359)
        {
          uint64_t v74 = sub_1C49AB30C((void **)&v358, (uint64_t)&v72[72 * v73]);
          goto LABEL_59;
        }
        unint64_t v344 = v73;
        v347 = v72;
        *((void *)v74 + 1) = 0;
        uint64_t v76 = v74 + 8;
        *((void *)v74 + 2) = 0;
        v355 = v74;
        *(void *)uint64_t v74 = v74 + 8;
        v79 = *(void **)v75;
        double v77 = v75 + 8;
        double v78 = v79;
        if (v79 != v77) {
          break;
        }
LABEL_62:
        uint64_t v80 = &v347[72 * v344];
        long long v81 = *(_OWORD *)(v80 + 24);
        *((void *)v355 + 6) = 0;
        uint64_t v82 = v355 + 48;
        *((void *)v355 + 5) = v355 + 48;
        uint64_t v83 = (void **)(v355 + 40);
        *(_OWORD *)(v355 + 24) = v81;
        *((void *)v355 + 7) = 0;
        uint64_t v84 = (char *)*((void *)v80 + 5);
        uint64_t v85 = v80 + 48;
        if (v84 != v80 + 48)
        {
          while (1)
          {
            v119 = (void *)*v82;
            uint64_t v120 = v355 + 48;
            if (*v83 != v82)
            {
              unint64_t v121 = (void *)*v82;
              uint64_t v122 = v355 + 48;
              if (v119)
              {
                do
                {
                  uint64_t v120 = v121;
                  unint64_t v121 = (void *)v121[1];
                }
                while (v121);
              }
              else
              {
                do
                {
                  uint64_t v120 = (void *)v122[2];
                  BOOL v90 = *v120 == (void)v122;
                  uint64_t v122 = v120;
                }
                while (v90);
              }
              unint64_t v123 = *((void *)v84 + 4);
              if (v120[4] >= v123) {
                break;
              }
            }
            if (v119) {
              v124 = v120;
            }
            else {
              v124 = v355 + 48;
            }
            if (v119) {
              uint64_t v125 = v120 + 1;
            }
            else {
              uint64_t v125 = v355 + 48;
            }
            if (!*v125) {
              goto LABEL_148;
            }
LABEL_173:
            BOOL v141 = (char *)*((void *)v84 + 1);
            if (v141)
            {
              do
              {
                id v142 = v141;
                BOOL v141 = *(char **)v141;
              }
              while (v141);
            }
            else
            {
              do
              {
                id v142 = (char *)*((void *)v84 + 2);
                BOOL v90 = *(void *)v142 == (void)v84;
                uint64_t v84 = v142;
              }
              while (!v90);
            }
            uint64_t v84 = v142;
            if (v142 == v85) {
              goto LABEL_58;
            }
          }
          uint64_t v125 = v355 + 48;
          v124 = v355 + 48;
          if (v119)
          {
            while (1)
            {
              while (1)
              {
                v124 = v119;
                unint64_t v126 = v119[4];
                if (v123 >= v126) {
                  break;
                }
                v119 = (void *)*v124;
                uint64_t v125 = v124;
                if (!*v124) {
                  goto LABEL_148;
                }
              }
              if (v126 >= v123) {
                goto LABEL_173;
              }
              v119 = (void *)v124[1];
              if (!v119)
              {
                uint64_t v125 = v124 + 1;
                break;
              }
            }
          }
LABEL_148:
          uint64_t v127 = operator new(0x28uLL);
          v127[4] = *((void *)v84 + 4);
          *uint64_t v127 = 0;
          v127[1] = 0;
          v127[2] = v124;
          *uint64_t v125 = v127;
          uint64_t v128 = (void *)**v83;
          if (v128)
          {
            char *v83 = v128;
            uint64_t v127 = (void *)*v125;
          }
          int64_t v129 = (void *)*v82;
          BOOL v90 = v127 == (void *)*v82;
          *((unsigned char *)v127 + 24) = v90;
          if (!v90)
          {
            do
            {
              uint64_t v130 = v127[2];
              if (*(unsigned char *)(v130 + 24)) {
                break;
              }
              uint64_t v131 = *(unsigned char **)(v130 + 16);
              uint64_t v132 = *(void *)v131;
              if (*(void *)v131 == v130)
              {
                uint64_t v135 = *((void *)v131 + 1);
                if (!v135 || (v136 = *(unsigned __int8 *)(v135 + 24), float v133 = (unsigned char *)(v135 + 24), v136))
                {
                  if (*(void **)v130 == v127)
                  {
                    *(unsigned char *)(v130 + 24) = 1;
                    v131[24] = 0;
                    uint64_t v139 = *(void *)(v130 + 8);
                    *(void *)uint64_t v131 = v139;
                    if (v139) {
                      goto LABEL_165;
                    }
                  }
                  else
                  {
                    long long v137 = *(uint64_t **)(v130 + 8);
                    uint64_t v138 = *v137;
                    *(void *)(v130 + 8) = *v137;
                    if (v138)
                    {
                      *(void *)(v138 + 16) = v130;
                      uint64_t v131 = *(unsigned char **)(v130 + 16);
                    }
                    v137[2] = (uint64_t)v131;
                    *(void *)(*(void *)(v130 + 16) + 8 * (**(void **)(v130 + 16) != v130)) = v137;
                    *long long v137 = v130;
                    *(void *)(v130 + 16) = v137;
                    uint64_t v131 = (unsigned char *)v137[2];
                    uint64_t v130 = *(void *)v131;
                    *((unsigned char *)v137 + 24) = 1;
                    v131[24] = 0;
                    uint64_t v139 = *(void *)(v130 + 8);
                    *(void *)uint64_t v131 = v139;
                    if (v139) {
LABEL_165:
                    }
                      *(void *)(v139 + 16) = v131;
                  }
                  *(void *)(v130 + 16) = *((void *)v131 + 2);
                  *(void *)(*((void *)v131 + 2) + 8 * (**((void **)v131 + 2) != (void)v131)) = v130;
                  *(void *)(v130 + 8) = v131;
LABEL_171:
                  *((void *)v131 + 2) = v130;
                  break;
                }
              }
              else if (!v132 || (v134 = *(unsigned __int8 *)(v132 + 24), float v133 = (unsigned char *)(v132 + 24), v134))
              {
                if (*(void **)v130 == v127)
                {
                  uint64_t v143 = v127[1];
                  *(void *)uint64_t v130 = v143;
                  if (v143)
                  {
                    *(void *)(v143 + 16) = v130;
                    uint64_t v131 = *(unsigned char **)(v130 + 16);
                  }
                  v127[2] = v131;
                  *(void *)(*(void *)(v130 + 16) + 8 * (**(void **)(v130 + 16) != v130)) = v127;
                  v127[1] = v130;
                  *(void *)(v130 + 16) = v127;
                  uint64_t v131 = (unsigned char *)v127[2];
                  *((unsigned char *)v127 + 24) = 1;
                  v131[24] = 0;
                  uint64_t v130 = *((void *)v131 + 1);
                  char v140 = *(void **)v130;
                  *((void *)v131 + 1) = *(void *)v130;
                  if (v140) {
LABEL_169:
                  }
                    v140[2] = v131;
                }
                else
                {
                  *(unsigned char *)(v130 + 24) = 1;
                  v131[24] = 0;
                  uint64_t v130 = *((void *)v131 + 1);
                  char v140 = *(void **)v130;
                  *((void *)v131 + 1) = *(void *)v130;
                  if (v140) {
                    goto LABEL_169;
                  }
                }
                *(void *)(v130 + 16) = *((void *)v131 + 2);
                *(void *)(*((void *)v131 + 2) + 8 * (**((void **)v131 + 2) != (void)v131)) = v130;
                *(void *)uint64_t v130 = v131;
                goto LABEL_171;
              }
              *(unsigned char *)(v130 + 24) = 1;
              uint64_t v127 = v131;
              v131[24] = v131 == (unsigned char *)v129;
              *float v133 = 1;
            }
            while (v131 != (unsigned char *)v129);
          }
          ++*((void *)v355 + 7);
          goto LABEL_173;
        }
LABEL_58:
        unint64_t v73 = v344;
        *((void *)v355 + 8) = *(void *)&v347[72 * v344 + 64];
        uint64_t v74 = v355 + 72;
LABEL_59:
        *((void *)&v358 + 1) = v74;
        ++v73;
        v72 = (char *)v362;
        v71 = v363;
        if (v73 >= 0x8E38E38E38E38E39 * ((v363 - (unsigned char *)v362) >> 3))
        {
          unint64_t v70 = v340;
          if (!v362) {
            goto LABEL_194;
          }
LABEL_189:
          if (v71 != v72)
          {
            uint64_t v144 = (uint64_t)(v71 - 32);
            do
            {
              uint64_t v145 = v144 - 40;
              v146 = v72;
              sub_1C4999C7C(v144, *(void **)(v144 + 8));
              sub_1C494AC4C(v144 - 40, *(void **)(v144 - 32));
              v72 = v146;
              v144 -= 72;
            }
            while ((char *)v145 != v146);
            v71 = (char *)v362;
          }
          v363 = v72;
          operator delete(v71);
          goto LABEL_194;
        }
      }
      while (1)
      {
        uint64_t v86 = (void *)*((void *)v355 + 1);
        uint64_t v87 = v76;
        if (*(void **)v355 != v76)
        {
          uint64_t v88 = (void *)*((void *)v355 + 1);
          double v89 = v76;
          if (v86)
          {
            do
            {
              uint64_t v87 = v88;
              uint64_t v88 = (void *)v88[1];
            }
            while (v88);
          }
          else
          {
            do
            {
              uint64_t v87 = (void *)v89[2];
              BOOL v90 = *v87 == (void)v89;
              double v89 = v87;
            }
            while (v90);
          }
          unint64_t v91 = v78[4];
          if (v87[4] >= v91) {
            break;
          }
        }
        if (v86) {
          uint64_t v92 = v87;
        }
        else {
          uint64_t v92 = v76;
        }
        if (v86) {
          uint64_t v93 = v87 + 1;
        }
        else {
          uint64_t v93 = v76;
        }
        if (!*v93) {
          goto LABEL_86;
        }
LABEL_114:
        uint64_t v116 = (void *)v78[1];
        if (v116)
        {
          do
          {
            unint64_t v117 = v116;
            uint64_t v116 = (void *)*v116;
          }
          while (v116);
        }
        else
        {
          do
          {
            unint64_t v117 = (void *)v78[2];
            BOOL v90 = *v117 == (void)v78;
            double v78 = v117;
          }
          while (!v90);
        }
        double v78 = v117;
        if (v117 == v77) {
          goto LABEL_62;
        }
      }
      uint64_t v93 = v76;
      uint64_t v92 = v76;
      if (v86)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v92 = v86;
            unint64_t v94 = v86[4];
            if (v91 >= v94) {
              break;
            }
            uint64_t v86 = (void *)*v92;
            uint64_t v93 = v92;
            if (!*v92) {
              goto LABEL_86;
            }
          }
          if (v94 >= v91) {
            goto LABEL_114;
          }
          uint64_t v86 = (void *)v92[1];
          if (!v86)
          {
            uint64_t v93 = v92 + 1;
            break;
          }
        }
      }
LABEL_86:
      double v95 = operator new(0x40uLL);
      double v96 = v77;
      *(void *)&long long buf = v95;
      *((void *)&buf + 1) = v76;
      char v369 = 0;
      uint64_t v97 = v78[4];
      v95[5] = 0;
      v95[4] = v97;
      v95[6] = 0;
      v95[7] = 0;
      v99 = (unsigned char *)v78[5];
      unint64_t v98 = (unsigned char *)v78[6];
      int64_t v100 = v98 - v99;
      if (v98 != v99)
      {
        if (v100 < 0) {
          sub_1C494A220();
        }
        uint64_t v101 = (char *)operator new(v98 - v99);
        v95[5] = v101;
        v95[6] = v101;
        uint64_t v102 = &v101[16 * (v100 >> 4)];
        v95[7] = v102;
        memcpy(v101, v99, v100);
        v95[6] = v102;
      }
      char v369 = 1;
      *double v95 = 0;
      v95[1] = 0;
      v95[2] = v92;
      void *v93 = v95;
      uint64_t v103 = **(void **)v355;
      double v77 = v96;
      if (v103)
      {
        *(void *)v355 = v103;
        double v95 = (void *)*v93;
      }
      uint64_t v104 = (unsigned char *)*v76;
      BOOL v90 = v95 == (void *)*v76;
      *((unsigned char *)v95 + 24) = v90;
      if (!v90)
      {
        do
        {
          uint64_t v105 = v95[2];
          if (*(unsigned char *)(v105 + 24)) {
            break;
          }
          uint64_t v106 = *(unsigned char **)(v105 + 16);
          uint64_t v107 = *(void *)v106;
          if (*(void *)v106 == v105)
          {
            uint64_t v110 = *((void *)v106 + 1);
            if (!v110 || (v111 = *(unsigned __int8 *)(v110 + 24), uint64_t v108 = (unsigned char *)(v110 + 24), v111))
            {
              if (*(void **)v105 == v95)
              {
                *(unsigned char *)(v105 + 24) = 1;
                v106[24] = 0;
                uint64_t v114 = *(void *)(v105 + 8);
                *(void *)uint64_t v106 = v114;
                if (v114) {
                  goto LABEL_106;
                }
              }
              else
              {
                uint64_t v112 = *(uint64_t **)(v105 + 8);
                uint64_t v113 = *v112;
                *(void *)(v105 + 8) = *v112;
                if (v113)
                {
                  *(void *)(v113 + 16) = v105;
                  uint64_t v106 = *(unsigned char **)(v105 + 16);
                }
                v112[2] = (uint64_t)v106;
                *(void *)(*(void *)(v105 + 16) + 8 * (**(void **)(v105 + 16) != v105)) = v112;
                uint64_t *v112 = v105;
                *(void *)(v105 + 16) = v112;
                uint64_t v106 = (unsigned char *)v112[2];
                uint64_t v105 = *(void *)v106;
                *((unsigned char *)v112 + 24) = 1;
                v106[24] = 0;
                uint64_t v114 = *(void *)(v105 + 8);
                *(void *)uint64_t v106 = v114;
                if (v114) {
LABEL_106:
                }
                  *(void *)(v114 + 16) = v106;
              }
              *(void *)(v105 + 16) = *((void *)v106 + 2);
              *(void *)(*((void *)v106 + 2) + 8 * (**((void **)v106 + 2) != (void)v106)) = v105;
              *(void *)(v105 + 8) = v106;
LABEL_112:
              *((void *)v106 + 2) = v105;
              break;
            }
          }
          else if (!v107 || (v109 = *(unsigned __int8 *)(v107 + 24), uint64_t v108 = (unsigned char *)(v107 + 24), v109))
          {
            if (*(void **)v105 == v95)
            {
              uint64_t v118 = v95[1];
              *(void *)uint64_t v105 = v118;
              if (v118)
              {
                *(void *)(v118 + 16) = v105;
                uint64_t v106 = *(unsigned char **)(v105 + 16);
              }
              v95[2] = v106;
              *(void *)(*(void *)(v105 + 16) + 8 * (**(void **)(v105 + 16) != v105)) = v95;
              v95[1] = v105;
              *(void *)(v105 + 16) = v95;
              uint64_t v106 = (unsigned char *)v95[2];
              *((unsigned char *)v95 + 24) = 1;
              v106[24] = 0;
              uint64_t v105 = *((void *)v106 + 1);
              uint64_t v115 = *(void **)v105;
              *((void *)v106 + 1) = *(void *)v105;
              if (v115) {
LABEL_110:
              }
                v115[2] = v106;
            }
            else
            {
              *(unsigned char *)(v105 + 24) = 1;
              v106[24] = 0;
              uint64_t v105 = *((void *)v106 + 1);
              uint64_t v115 = *(void **)v105;
              *((void *)v106 + 1) = *(void *)v105;
              if (v115) {
                goto LABEL_110;
              }
            }
            *(void *)(v105 + 16) = *((void *)v106 + 2);
            *(void *)(*((void *)v106 + 2) + 8 * (**((void **)v106 + 2) != (void)v106)) = v105;
            *(void *)uint64_t v105 = v106;
            goto LABEL_112;
          }
          *(unsigned char *)(v105 + 24) = 1;
          double v95 = v106;
          v106[24] = v106 == v104;
          *uint64_t v108 = 1;
        }
        while (v106 != v104);
      }
      ++*((void *)v355 + 2);
      goto LABEL_114;
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v66 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C492D000, v66, OS_LOG_TYPE_FAULT, "Fast grouping result must exist for the requested tokenization type", (uint8_t *)&buf, 2u);
    }

    v360[0] = 0;
    v360[1] = 0;
    unint64_t v361 = 0;
    int64_t v22 = a7;
    if (a7 == 1) {
      goto LABEL_4;
    }
  }
  if ((unint64_t)(v22 - 3) <= 1)
  {
    unint64_t v67 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3));
    if (v360[1] == v360[0]) {
      uint64_t v68 = 0;
    }
    else {
      uint64_t v68 = v67;
    }
    sub_1C4BEC614((uint64_t)v360[0], (double *)v360[1], v68, 1);
  }
LABEL_210:
  if (objc_msgSend_count(v338, v17, v18, v19, v20, v21))
  {
    id v348 = v338;
    id v155 = v337;
    id v156 = v336;
    v345 = v156;
    if (self)
    {
      if ((unint64_t)(v335 - 3) <= 1)
      {
        size_t v162 = v156;
        objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v156, v157, 0, 0, v160, v161);
        id obja = (id)objc_claimAutoreleasedReturnValue();
        CGRect v169 = objc_msgSend_strokeGroupClusters(v162, v163, v164, v165, v166, v167);
        if (v335 == 4)
        {
          uint64_t v170 = objc_msgSend_strokeIdentifiersInFullContextForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v168, (uint64_t)v348, (uint64_t)obja, (uint64_t)v169, 0);
        }
        else
        {
          if (v335 != 3)
          {
            id v65 = 0;
            goto LABEL_284;
          }
          uint64_t v170 = objc_msgSend_strokeIdentifiersInProximalGroupsForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v168, (uint64_t)v348, (uint64_t)obja, (uint64_t)v169, 0);
        }
        id v65 = (id)v170;
LABEL_284:

        goto LABEL_285;
      }
      objc_msgSend_set(MEMORY[0x1E4F1CA80], v157, v158, v159, v160, v161);
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      long long v366 = 0u;
      long long v367 = 0u;
      *(_OWORD *)__p = 0u;
      long long v365 = 0u;
      id obja = v348;
      uint64_t v273 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v271, (uint64_t)__p, (uint64_t)&buf, 16, v272);
      if (!v273) {
        goto LABEL_285;
      }
      uint64_t v353 = *(void *)v365;
LABEL_254:
      uint64_t v357 = v273;
      uint64_t v279 = 0;
      while (1)
      {
        if (*(void *)v365 != v353) {
          objc_enumerationMutation(obja);
        }
        uint64_t v280 = *((void *)__p[1] + v279);
        v281 = objc_msgSend_strokeProvider(self, v274, v275, v276, v277, v278);
        v285 = objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v282, v280, (uint64_t)v281, v283, v284);

        unint64_t v290 = objc_msgSend_indexOfObject_(v155, v286, (uint64_t)v285, v287, v288, v289);
        v296 = objc_msgSend_encodedStrokeIdentifier(v285, v291, v292, v293, v294, v295);
        char v301 = objc_msgSend_containsObject_(v65, v297, (uint64_t)v296, v298, v299, v300);

        if ((v301 & 1) == 0)
        {
          v307 = v360[0];
          v306 = v360[1];
          if (v360[1] != v360[0]) {
            break;
          }
        }
LABEL_277:

        if (++v279 == v357)
        {
          uint64_t v273 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v274, (uint64_t)__p, (uint64_t)&buf, 16, v278);
          if (!v273)
          {
LABEL_285:

            goto LABEL_286;
          }
          goto LABEL_254;
        }
      }
      uint64_t v308 = 0;
LABEL_262:
      v309 = (void *)v307[9 * v308 + 1];
      if (!v309) {
        goto LABEL_261;
      }
      while (1)
      {
        unint64_t v310 = v309[4];
        if (v310 <= v290)
        {
          if (v310 >= v290)
          {
            v311 = (char *)&v307[9 * v308];
            v312 = (char *)*((void *)v311 + 5);
            v313 = v311 + 48;
            if (v312 != v311 + 48)
            {
              do
              {
                v314 = objc_msgSend_objectAtIndexedSubscript_(v155, v302, *((void *)v312 + 4), v303, v304, v305);
                v320 = objc_msgSend_encodedStrokeIdentifier(v314, v315, v316, v317, v318, v319);
                objc_msgSend_addObject_(v65, v321, (uint64_t)v320, v322, v323, v324);

                v325 = (char *)*((void *)v312 + 1);
                if (v325)
                {
                  do
                  {
                    v326 = v325;
                    v325 = *(char **)v325;
                  }
                  while (v325);
                }
                else
                {
                  do
                  {
                    v326 = (char *)*((void *)v312 + 2);
                    BOOL v90 = *(void *)v326 == (void)v312;
                    v312 = v326;
                  }
                  while (!v90);
                }
                v312 = v326;
              }
              while (v326 != v313);
              v307 = v360[0];
              v306 = v360[1];
            }
LABEL_261:
            if (++v308 >= 0x8E38E38E38E38E39 * ((v306 - (unsigned char *)v307) >> 3)) {
              goto LABEL_277;
            }
            goto LABEL_262;
          }
          ++v309;
        }
        v309 = (void *)*v309;
        if (!v309) {
          goto LABEL_261;
        }
      }
    }
    id v65 = 0;
LABEL_286:

    goto LABEL_293;
  }
  id v349 = v337;
  id v334 = v336;
  if (!self)
  {
    id v65 = 0;
    goto LABEL_292;
  }
  v339 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v171, v172, v173, v174, v175);
  if (v360[1] != v360[0])
  {
    BOOL v343 = 0;
    BOOL v341 = 0;
    unint64_t v346 = 0;
    v181.f64[0] = obj;
    v181.f64[1] = y;
    float32x2_t v182 = vcvt_f32_f64(v181);
    float v183 = 3.4028e38;
    do
    {
      v189 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v176, v177, v178, v179, v180, v334);
      v190 = (char *)v360[0] + 72 * v346;
      v191 = (char *)*((void *)v190 + 5);
      v192 = v190 + 48;
      if (v191 != v190 + 48)
      {
        do
        {
          v246 = objc_msgSend_objectAtIndexedSubscript_(v349, v184, *((void *)v191 + 4), v186, v187, v188);
          objc_msgSend_addObject_(v189, v247, (uint64_t)v246, v248, v249, v250);

          v251 = (char *)*((void *)v191 + 1);
          if (v251)
          {
            do
            {
              v252 = v251;
              v251 = *(char **)v251;
            }
            while (v251);
          }
          else
          {
            do
            {
              v252 = (char *)*((void *)v191 + 2);
              BOOL v90 = *(void *)v252 == (void)v191;
              v191 = v252;
            }
            while (!v90);
          }
          v191 = v252;
        }
        while (v252 != v192);
      }
      CGFloat x = *MEMORY[0x1E4F1DB20];
      CGFloat v194 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      v197 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v184, v185, v186, v187, v188);
      long long v366 = 0u;
      long long v367 = 0u;
      *(_OWORD *)__p = 0u;
      long long v365 = 0u;
      id v198 = v189;
      BOOL v201 = 0;
      uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v199, (uint64_t)__p, (uint64_t)&buf, 16, v200);
      if (v207)
      {
        uint64_t v208 = *(void *)v365;
        float v209 = 3.4028e38;
        do
        {
          for (uint64_t i = 0; i != v207; ++i)
          {
            if (*(void *)v365 != v208) {
              objc_enumerationMutation(v198);
            }
            v211 = (void *)*((void *)__p[1] + i);
            v212 = objc_msgSend_encodedStrokeIdentifier(v211, v202, v203, v204, v205, v206);
            objc_msgSend_addObject_(v197, v213, (uint64_t)v212, v214, v215, v216);

            objc_msgSend_bounds(v211, v217, v218, v219, v220, v221);
            v380.origin.CGFloat x = v222;
            v380.origin.float64_t y = v223;
            v380.size.CGFloat width = v224;
            v380.size.CGFloat height = v225;
            v374.origin.CGFloat x = x;
            v374.origin.float64_t y = v194;
            v374.size.CGFloat width = width;
            v374.size.CGFloat height = height;
            CGRect v375 = CGRectUnion(v374, v380);
            CGFloat x = v375.origin.x;
            CGFloat v194 = v375.origin.y;
            CGFloat width = v375.size.width;
            CGFloat height = v375.size.height;
            objc_msgSend_bounds(v211, v226, v227, v228, v229, v230);
            v372.CGFloat x = obj;
            v372.float64_t y = y;
            BOOL v231 = CGRectContainsPoint(v376, v372);
            objc_msgSend_bounds(v211, v232, v233, v234, v235, v236);
            CGFloat MidX = CGRectGetMidX(v377);
            objc_msgSend_bounds(v211, v237, v238, v239, v240, v241);
            CGFloat MidY = CGRectGetMidY(v378);
            v243.f64[0] = MidX;
            v243.f64[1] = MidY;
            float32x2_t v244 = vsub_f32(vcvt_f32_f64(v243), v182);
            float v245 = sqrtf(vaddv_f32(vmul_f32(v244, v244)));
            if (!v201 && v231 || ((v201 ^ v231) & 1) == 0 && v245 < v209)
            {
              BOOL v201 = v231;
              float v209 = v245;
            }
          }
          uint64_t v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v202, (uint64_t)__p, (uint64_t)&buf, 16, v206);
        }
        while (v207);
      }
      else
      {
        float v209 = 3.4028e38;
      }

      v379.origin.CGFloat x = x;
      v379.origin.float64_t y = v194;
      v379.size.CGFloat width = width;
      v379.size.CGFloat height = height;
      v373.CGFloat x = obj;
      v373.float64_t y = y;
      BOOL v253 = CGRectContainsPoint(v379, v373);
      BOOL v254 = v253;
      if (!v343 && v253 || !v341 && v201 || ((v209 < v183) & ~(v343 ^ v253 | v341 ^ v201)) != 0)
      {
        id v255 = v197;

        BOOL v341 = v201;
        BOOL v343 = v254;
        float v183 = v209;
        v339 = v255;
      }

      ++v346;
    }
    while (v346 < 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3));
  }
  if ((unint64_t)(v335 - 3) < 2)
  {
    v256 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v334, v176, 0, 0, v179, v180);
    v267 = objc_msgSend_strokeGroupClusters(v334, v257, v258, v259, v260, v261);
    if (v335 == 4)
    {
      v268 = objc_msgSend_allObjects(v339, v262, v263, v264, v265, v266);
      uint64_t v270 = objc_msgSend_strokeIdentifiersInFullContextForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v328, (uint64_t)v268, (uint64_t)v256, (uint64_t)v267, 0);
    }
    else
    {
      if (v335 != 3)
      {
        id v65 = 0;
        goto LABEL_290;
      }
      v268 = objc_msgSend_allObjects(v339, v262, v263, v264, v265, v266);
      uint64_t v270 = objc_msgSend_strokeIdentifiersInProximalGroupsForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v269, (uint64_t)v268, (uint64_t)v256, (uint64_t)v267, 0);
    }
    id v65 = (id)v270;

LABEL_290:
    v327 = v339;
    goto LABEL_291;
  }
  v327 = v339;
  id v65 = v339;
LABEL_291:

LABEL_292:
LABEL_293:
  v329 = (char *)v360[0];
  if (v360[0])
  {
    v330 = v360[0];
    if (v360[1] != v360[0])
    {
      v331 = (char *)v360[1] - 32;
      do
      {
        v332 = v331 - 40;
        sub_1C4999C7C((uint64_t)v331, *((void **)v331 + 1));
        sub_1C494AC4C((uint64_t)(v331 - 40), *((void **)v331 - 4));
        v331 -= 72;
      }
      while (v332 != v329);
      v330 = v360[0];
    }
    v360[1] = v329;
    operator delete(v330);
  }
LABEL_299:

  return v65;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clutterFilter, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end