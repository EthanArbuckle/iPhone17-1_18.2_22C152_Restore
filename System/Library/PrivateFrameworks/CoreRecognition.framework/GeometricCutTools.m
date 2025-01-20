@interface GeometricCutTools
+ (BOOL)derotateContentsOf:(id)a3 inImage:(vImage_Buffer *)a4 andOutputTo:(vImage_Buffer *)a5 withPadding:(CGPoint)a6 networkInputSize:(CGSize)a7;
+ (BOOL)isPointArrayARectangle:(uint64_t)a1;
+ (BOOL)lineThroughPoint:(double)a3 andPoint:(double)a4 andRectangle:(double)a5 intersectAtPoint:(double)a6 andPoint:(double)a7;
+ (id)boxInNormalizedSpace:(id)a3 toImageSpaceWithSize:(CGSize)a4 plusPadding:(CGPoint)a5 destSize:(CGSize *)a6 networkInputSize:(CGSize)a7;
+ (id)cleanTextDetectorOutput:(id)a3;
+ (id)findCorrectedBoundingBoxOfTextFeature:(id)a3 inImageWithSize:(CGSize)a4;
+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std:(unsigned __int16)a12 :vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:garbageSymbol:;
+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:;
+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :(unsigned __int16)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:garbageSymbol:;
+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:;
+ (id)stringByInjectingSpaces:(id)a3 textFeatures:(id)a4 improved:(BOOL)a5;
@end

@implementation GeometricCutTools

+ (id)cleanTextDetectorOutput:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v29 = a3;
  v33 = [MEMORY[0x263EFF980] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v29;
  uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v35 = [MEMORY[0x263EFF980] array];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v4 = [v3 subFeatures];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v5)
        {
          uint64_t v6 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v5; ++j)
            {
              if (*(void *)v41 != v6) {
                objc_enumerationMutation(v4);
              }
              v8 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              v9 = [v3 subFeatures];
              uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v10)
              {
                uint64_t v11 = *(void *)v37;
                while (2)
                {
                  for (uint64_t k = 0; k != v10; ++k)
                  {
                    if (*(void *)v37 != v11) {
                      objc_enumerationMutation(v9);
                    }
                    v13 = *(void **)(*((void *)&v36 + 1) + 8 * k);
                    if (v13 != v8)
                    {
                      [v13 bounds];
                      CGFloat v15 = v14;
                      CGFloat v17 = v16;
                      CGFloat v19 = v18;
                      CGFloat v21 = v20;
                      [v8 bounds];
                      v54.origin.x = v22;
                      v54.origin.y = v23;
                      v54.size.width = v24;
                      v54.size.height = v25;
                      v53.origin.x = v15;
                      v53.origin.y = v17;
                      v53.size.width = v19;
                      v53.size.height = v21;
                      if (CGRectContainsRect(v53, v54))
                      {

                        goto LABEL_22;
                      }
                    }
                  }
                  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v48 count:16];
                  if (v10) {
                    continue;
                  }
                  break;
                }
              }

              [v35 addObject:v8];
LABEL_22:
              ;
            }
            uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v5);
        }

        id v26 = objc_alloc_init(MEMORY[0x263F7ECC8]);
        [v3 bounds];
        objc_msgSend(v26, "setBounds:");
        [v3 topRight];
        objc_msgSend(v26, "setTopRight:");
        [v3 topLeft];
        objc_msgSend(v26, "setTopLeft:");
        [v3 bottomRight];
        objc_msgSend(v26, "setBottomRight:");
        [v3 bottomLeft];
        objc_msgSend(v26, "setBottomLeft:");
        [v26 setSubFeatures:v35];
        [v33 addObject:v26];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v32);
  }

  v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v33];

  return v27;
}

+ (id)findCorrectedBoundingBoxOfTextFeature:(id)a3 inImageWithSize:(CGSize)a4
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v134 = a3;
  v4 = [v134 subFeatures];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    id v135 = objc_alloc_init(MEMORY[0x263F7ECC8]);
    v149 = [MEMORY[0x263EFF980] array];
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    v7 = [v134 subFeatures];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v173 objects:v180 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v174;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v174 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v173 + 1) + 8 * i);
          id v12 = objc_alloc_init(MEMORY[0x263F7ECC8]);
          [v11 bounds];
          double v14 = v13;
          [v11 bounds];
          double v16 = v15;
          [v11 bounds];
          double v18 = v17;
          [v11 bounds];
          objc_msgSend(v12, "setBounds:", a4.width * v14, a4.height * v16, a4.width * v18, a4.height * v19);
          [v149 addObject:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v173 objects:v180 count:16];
      }
      while (v8);
    }

    [v135 setSubFeatures:v149];
    double v20 = [v135 subFeatures];
    std::vector<double>::vector(&v171, [v20 count]);

    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    CGFloat v21 = [v135 subFeatures];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v167 objects:v179 count:16];
    if (v22)
    {
      int v23 = 0;
      uint64_t v24 = *(void *)v168;
      do
      {
        uint64_t v25 = 0;
        uint64_t v26 = v23;
        do
        {
          if (*(void *)v168 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v167 + 1) + 8 * v25) bounds];
          int v23 = v26 + 1;
          *((void *)v171 + v26) = v27;
          ++v25;
          ++v26;
        }
        while (v22 != v25);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v167 objects:v179 count:16];
      }
      while (v22);
    }

    std::__sort<std::__less<double,double> &,double *>();
    double v28 = *(double *)((char *)v171 + (((v172 - (unsigned char *)v171) >> 1) & 0xFFFFFFFFFFFFFFF8));
    __p = 0;
    v165 = 0;
    v166 = 0;
    v161 = 0;
    v162 = 0;
    v163 = 0;
    v159 = 0;
    uint64_t v160 = 0;
    v158 = &v159;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v29 = [v135 subFeatures];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v154 objects:v178 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v155;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v155 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v154 + 1) + 8 * j);
          [v33 bounds];
          if (vabdd_f64(v34, v28) < v28 * 0.1)
          {
            id v35 = v33;
            long long v36 = v35;
            long long v37 = v159;
            long long v38 = &v159;
            long long v39 = &v159;
            if (v159)
            {
              while (1)
              {
                while (1)
                {
                  long long v39 = (uint64_t **)v37;
                  unint64_t v40 = v37[4];
                  if (v40 <= (unint64_t)v35) {
                    break;
                  }
                  long long v37 = *v39;
                  long long v38 = v39;
                  if (!*v39) {
                    goto LABEL_30;
                  }
                }
                if (v40 >= (unint64_t)v35) {
                  break;
                }
                long long v37 = v39[1];
                if (!v37)
                {
                  long long v38 = v39 + 1;
                  goto LABEL_30;
                }
              }
              long long v42 = v35;
            }
            else
            {
LABEL_30:
              long long v41 = operator new(0x30uLL);
              v41[4] = v36;
              *((_DWORD *)v41 + 10) = 1;
              *long long v41 = 0;
              v41[1] = 0;
              v41[2] = v39;
              *long long v38 = v41;
              if (*v158)
              {
                v158 = (uint64_t **)*v158;
                long long v41 = *v38;
              }
              std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v159, v41);
              long long v42 = 0;
              ++v160;
            }

            [v36 bounds];
            uint64_t v44 = v43;
            long long v45 = v165;
            if (v165 >= v166)
            {
              long long v47 = (char *)__p;
              uint64_t v48 = (v165 - (unsigned char *)__p) >> 3;
              unint64_t v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 61) {
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v50 = v166 - (unsigned char *)__p;
              if ((v166 - (unsigned char *)__p) >> 2 > v49) {
                unint64_t v49 = v50 >> 2;
              }
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v51 = v49;
              }
              if (v51)
              {
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v166, v51);
                long long v47 = (char *)__p;
                long long v45 = v165;
              }
              else
              {
                v52 = 0;
              }
              CGRect v53 = &v52[8 * v48];
              *(void *)CGRect v53 = v44;
              long long v46 = v53 + 8;
              while (v45 != v47)
              {
                uint64_t v54 = *((void *)v45 - 1);
                v45 -= 8;
                *((void *)v53 - 1) = v54;
                v53 -= 8;
              }
              __p = v53;
              v165 = v46;
              v166 = &v52[8 * v51];
              if (v47) {
                operator delete(v47);
              }
            }
            else
            {
              *(void *)v165 = v43;
              long long v46 = v45 + 8;
            }
            v165 = v46;
            [v36 bounds];
            uint64_t v56 = v55;
            v57 = v162;
            if (v162 >= v163)
            {
              v59 = (char *)v161;
              uint64_t v60 = (v162 - (unsigned char *)v161) >> 3;
              unint64_t v61 = v60 + 1;
              if ((unint64_t)(v60 + 1) >> 61) {
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v62 = v163 - (unsigned char *)v161;
              if ((v163 - (unsigned char *)v161) >> 2 > v61) {
                unint64_t v61 = v62 >> 2;
              }
              if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v61;
              }
              if (v63)
              {
                v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v163, v63);
                v59 = (char *)v161;
                v57 = v162;
              }
              else
              {
                v64 = 0;
              }
              v65 = &v64[8 * v60];
              *(void *)v65 = v56;
              v58 = v65 + 8;
              while (v57 != v59)
              {
                uint64_t v66 = *((void *)v57 - 1);
                v57 -= 8;
                *((void *)v65 - 1) = v66;
                v65 -= 8;
              }
              v161 = v65;
              v162 = v58;
              v163 = &v64[8 * v63];
              if (v59) {
                operator delete(v59);
              }
            }
            else
            {
              *(void *)v162 = v55;
              v58 = v57 + 8;
            }
            v162 = v58;
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v154 objects:v178 count:16];
      }
      while (v30);
    }

    uint64_t v6 = 0;
    uint64_t v67 = v165 - (unsigned char *)__p;
    if (v165 != __p && (unint64_t)v67 >= 0x10)
    {
      if ((unint64_t)(v67 >> 3) <= 1) {
        uint64_t v68 = 1;
      }
      else {
        uint64_t v68 = v67 >> 3;
      }
      double v69 = 0.0;
      v70 = (double *)__p;
      v71 = (double *)v161;
      double v72 = 0.0;
      do
      {
        double v73 = *v70++;
        double v74 = v73 - *(double *)__p;
        double v75 = *v71++;
        double v69 = v69 + v74 * (v75 - *(double *)v161);
        double v72 = v72 + v74 * v74;
        --v68;
      }
      while (v68);
      double v76 = v69 / v72;
      double v140 = *(double *)((char *)v161 + (((v162 - (unsigned char *)v161) >> 1) & 0xFFFFFFFFFFFFFFF8));
      double v141 = *(double *)((char *)__p + ((4 * (v67 >> 3)) & 0xFFFFFFFFFFFFFFF8));
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      v77 = [v135 subFeatures];
      uint64_t v78 = [v77 countByEnumeratingWithState:&v150 objects:v177 count:16];
      double v79 = sqrt(v76 * v76 + 1.0);
      double v142 = v76 / v79;
      double v139 = 1.0 / v79;
      double v136 = -(1.0 / v79);
      if (v78)
      {
        uint64_t v80 = *(void *)v151;
        double v137 = -INFINITY;
        double v138 = INFINITY;
        double v146 = -INFINITY;
        double v147 = INFINITY;
        do
        {
          for (uint64_t k = 0; k != v78; ++k)
          {
            if (*(void *)v151 != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = *(void **)(*((void *)&v150 + 1) + 8 * k);
            [v82 bounds];
            double v145 = v83;
            [v82 bounds];
            double v144 = v84;
            [v82 bounds];
            double v143 = v85;
            [v82 bounds];
            double v87 = v86;
            [v82 bounds];
            double v89 = v88;
            [v82 bounds];
            double v91 = v90;
            [v82 bounds];
            double v93 = v92;
            [v82 bounds];
            double v95 = v94;
            [v82 bounds];
            double v97 = v96;
            [v82 bounds];
            double v99 = v98;
            [v82 bounds];
            double v101 = v100;
            [v82 bounds];
            double v103 = v143 + v87 - v141;
            double v104 = v91 + v93 - v141;
            double v105 = v95 + v97 - v140;
            double v106 = v101 + v102 - v140;
            double v107 = v142 * (v144 - v140) + (v145 - v141) * v139;
            double v108 = v142 * (v89 - v140) + v103 * v139;
            double v109 = v142 * v105 + v104 * v139;
            double v110 = v142 * v106 + (v99 - v141) * v139;
            double v111 = v147;
            if (v107 < v147) {
              double v111 = v142 * (v144 - v140) + (v145 - v141) * v139;
            }
            if (v108 < v111) {
              double v111 = v142 * (v89 - v140) + v103 * v139;
            }
            if (v109 < v111) {
              double v111 = v142 * v105 + v104 * v139;
            }
            if (v110 >= v111) {
              double v112 = v111;
            }
            else {
              double v112 = v142 * v106 + (v99 - v141) * v139;
            }
            if (v107 <= v146) {
              double v107 = v146;
            }
            if (v108 > v107) {
              double v107 = v142 * (v89 - v140) + v103 * v139;
            }
            if (v109 > v107) {
              double v107 = v142 * v105 + v104 * v139;
            }
            if (v110 > v107) {
              double v107 = v142 * v106 + (v99 - v141) * v139;
            }
            double v146 = v107;
            double v147 = v112;
            v113 = v159;
            if (v159)
            {
              v114 = &v159;
              do
              {
                v115 = v113;
                v116 = v114;
                unint64_t v117 = v113[4];
                if (v117 >= (unint64_t)v82) {
                  v114 = (uint64_t **)v113;
                }
                else {
                  ++v113;
                }
                v113 = (uint64_t *)*v113;
              }
              while (v113);
              if (v114 != &v159)
              {
                if (v117 < (unint64_t)v82) {
                  v115 = (uint64_t *)v116;
                }
                if ((unint64_t)v82 >= v115[4])
                {
                  double v118 = (v144 - v140) * v136 + (v145 - v141) * v142;
                  double v119 = (v89 - v140) * v136 + v103 * v142;
                  double v120 = v105 * v136 + v104 * v142;
                  double v121 = v106 * v136 + (v99 - v141) * v142;
                  double v122 = v138;
                  if (v118 < v138) {
                    double v122 = (v144 - v140) * v136 + (v145 - v141) * v142;
                  }
                  if (v119 < v122) {
                    double v122 = v119;
                  }
                  if (v120 < v122) {
                    double v122 = v120;
                  }
                  if (v121 >= v122) {
                    double v123 = v122;
                  }
                  else {
                    double v123 = v106 * v136 + (v99 - v141) * v142;
                  }
                  if (v118 <= v137) {
                    double v118 = v137;
                  }
                  if (v119 > v118) {
                    double v118 = v119;
                  }
                  if (v120 > v118) {
                    double v118 = v120;
                  }
                  if (v121 > v118) {
                    double v118 = v106 * v136 + (v99 - v141) * v142;
                  }
                  double v137 = v118;
                  double v138 = v123;
                }
              }
            }
          }
          uint64_t v78 = [v77 countByEnumeratingWithState:&v150 objects:v177 count:16];
        }
        while (v78);
      }
      else
      {
        double v137 = -INFINITY;
        double v138 = INFINITY;
        double v146 = -INFINITY;
        double v147 = INFINITY;
      }

      double v124 = v141 + v138 * v142;
      double v125 = v140 + v138 * v136;
      v183.x = (v124 + v147 * v139) / a4.width;
      v183.y = (v125 + v147 * v142) / a4.height;
      v126 = (void *)MEMORY[0x263EFF8C0];
      v127 = NSStringFromPoint(v183);
      v184.y = (v125 + v146 * v142) / a4.height;
      v184.x = (v124 + v146 * v139) / a4.width;
      v128 = NSStringFromPoint(v184);
      double v129 = v141 + v137 * v142;
      double v130 = v140 + v137 * v136;
      v185.x = (v129 + v146 * v139) / a4.width;
      v185.y = (v130 + v146 * v142) / a4.height;
      v131 = NSStringFromPoint(v185);
      v186.x = (v129 + v147 * v139) / a4.width;
      v186.y = (v130 + v147 * v142) / a4.height;
      v132 = NSStringFromPoint(v186);
      uint64_t v6 = objc_msgSend(v126, "arrayWithObjects:", v127, v128, v131, v132, 0);
    }
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(v159);
    if (v161)
    {
      v162 = (char *)v161;
      operator delete(v161);
    }
    if (__p)
    {
      v165 = (char *)__p;
      operator delete(__p);
    }
    if (v171)
    {
      v172 = v171;
      operator delete(v171);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)isPointArrayARectangle:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 count] != 4) {
    goto LABEL_7;
  }
  v3 = [v2 objectAtIndexedSubscript:3];
  NSPoint v4 = NSPointFromString(v3);

  unint64_t v5 = [v2 objectAtIndexedSubscript:2];
  NSPoint v6 = NSPointFromString(v5);

  v7 = [v2 objectAtIndexedSubscript:1];
  NSPoint v8 = NSPointFromString(v7);

  uint64_t v9 = [v2 objectAtIndexedSubscript:0];
  NSPoint v10 = NSPointFromString(v9);

  if (vabdd_f64(sqrt((v4.y - v6.y) * (v4.y - v6.y) + (v4.x - v6.x) * (v4.x - v6.x)), sqrt((v8.y - v10.y) * (v8.y - v10.y) + (v8.x - v10.x) * (v8.x - v10.x))) > 0.001)goto LABEL_7; {
  double v11 = v4.x - v10.x;
  }
  double v12 = v4.y - v10.y;
  double v13 = sqrt(v12 * v12 + v11 * v11);
  if (vabdd_f64(v13, sqrt((v6.y - v8.y) * (v6.y - v8.y) + (v6.x - v8.x) * (v6.x - v8.x))) > 0.001) {
    goto LABEL_7;
  }
  double v14 = v8.x - v6.x;
  double v15 = v8.y - v6.y;
  double v16 = sqrt(v15 * v15 + v14 * v14);
  if (fabs((v6.y - v4.y) * (v8.y - v6.y) + (v6.x - v4.x) * (v8.x - v6.x)) < sqrt((v6.y - v4.y) * (v6.y - v4.y)+ (v6.x - v4.x) * (v6.x - v4.x))* v16* 0.0000174532925&& (double v17 = v10.x - v8.x, v18 = v10.y - v8.y, v19 = sqrt(v18 * v18 + v17 * v17), fabs(v15 * (v10.y - v8.y) + v14 * (v10.x - v8.x)) < v16 * v19 * 0.0000174532925))
  {
    BOOL v20 = fabs(v18 * v12 + v17 * v11) < v19 * v13 * 0.0000174532925;
  }
  else
  {
LABEL_7:
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)lineThroughPoint:(double)a3 andPoint:(double)a4 andRectangle:(double)a5 intersectAtPoint:(double)a6 andPoint:(double)a7
{
  v29[7] = *MEMORY[0x263EF8340];
  self;
  unint64_t v21 = 0;
  int v22 = 0;
  int v23 = (double *)v29;
  double v28 = a5;
  *(double *)id v29 = a6;
  *(double *)&v29[1] = a5 + a7;
  *(double *)&v29[2] = a6;
  *(double *)&v29[3] = a5 + a7;
  *(double *)&v29[4] = a6 + a8;
  *(double *)&v29[5] = a5;
  *(double *)&v29[6] = a6 + a8;
  BOOL v24 = 1;
  while (1)
  {
    unint64_t v25 = v21 + 1;
    if (objc_msgSend(MEMORY[0x263F7ECA8], "checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:", &v27, a1, a2, a3, a4, *(v23 - 1), *v23, *(double *)&v29[2 * ((v21 + 1) & 3) - 1], *(double *)&v29[2 * ((v21 + 1) & 3)]))break; {
LABEL_7:
    }
    BOOL v24 = v21 < 3;
    v23 += 2;
    ++v21;
    if (v25 == 4) {
      return 0;
    }
  }
  if (!v22)
  {
    if (a10) {
      *a10 = v27;
    }
    int v22 = 1;
    goto LABEL_7;
  }
  if (a11) {
    *a11 = v27;
  }
  return v24;
}

+ (id)boxInNormalizedSpace:(id)a3 toImageSpaceWithSize:(CGSize)a4 plusPadding:(CGPoint)a5 destSize:(CGSize *)a6 networkInputSize:(CGSize)a7
{
  double height = a7.height;
  id v10 = a3;
  double v11 = [v10 objectAtIndexedSubscript:3];
  NSPoint v12 = NSPointFromString(v11);

  double v13 = [v10 objectAtIndexedSubscript:2];
  NSPoint v14 = NSPointFromString(v13);

  double v15 = [v10 objectAtIndexedSubscript:1];
  NSPoint v16 = NSPointFromString(v15);

  double v17 = [v10 objectAtIndexedSubscript:0];
  NSPoint v18 = NSPointFromString(v17);

  id v19 = 0;
  double v20 = a4.width * v12.x;
  double v21 = a4.height * v12.y;
  double v22 = a4.width * v14.x;
  double v23 = a4.height * v14.y;
  double v24 = sqrt((v21 - v23) * (v21 - v23) + (v20 - v22) * (v20 - v22));
  if (v24 != 0.0)
  {
    double v25 = sqrt((v21 - a4.height * v18.y) * (v21 - a4.height * v18.y) + (v20 - a4.width * v18.x)
                                                                     * (v20 - a4.width * v18.x));
    if (v25 != 0.0)
    {
      a6->double height = height;
      if (height - a5.y <= 0.0) {
        goto LABEL_15;
      }
      double aPoint = a4.width * v18.x;
      double aPoint_8 = a4.height * v18.y;
      double v26 = v25 / (height - a5.y);
      double v27 = a5.y * v26;
      double v28 = INFINITY;
      if (a5.x < INFINITY)
      {
        double v28 = a5.x * v26;
        a6->width = a5.x + v24 / v26;
      }
      double v99 = v26;
      double v110 = a4.width * v16.x;
      double v113 = a4.height * v16.y;
      double v115 = v28;
      double v29 = atan2(v23 - v21, v22 - v20);
      double v30 = v27 * -0.5;
      __double2 v31 = __sincos_stret(v29);
      double v108 = v27 * -0.5 * v31.__sinval;
      double v32 = v27 * 0.5;
      double v101 = v32 * v31.__cosval;
      __double2 v33 = __sincos_stret(v29 + 3.14159265);
      double v34 = v30 * v33.__sinval;
      double v35 = v32 * v33.__cosval;
      if (v115 >= INFINITY)
      {
        v125.double x = v20 + v34;
        v125.double y = v21 + v35;
        long long v45 = (void *)MEMORY[0x263EFF8C0];
        long long v46 = NSStringFromPoint(v125);
        v126.double y = v23 + v32 * v33.__cosval;
        v126.double x = v22 + v34;
        long long v47 = NSStringFromPoint(v126);
        v127.double x = v110 + v108;
        v127.double y = v113 + v101;
        uint64_t v48 = NSStringFromPoint(v127);
        v128.double x = aPoint + v108;
        v128.double y = aPoint_8 + v101;
        unint64_t v49 = NSStringFromPoint(v128);
        uint64_t v50 = objc_msgSend(v45, "arrayWithObjects:", v46, v47, v48, v49, 0);

        id v51 = v50;
        self;
        v52 = [v51 objectAtIndex:0];
        NSPoint v53 = NSPointFromString(v52);

        uint64_t v54 = [v51 objectAtIndex:1];
        NSPoint v55 = NSPointFromString(v54);

        uint64_t v56 = [v51 objectAtIndex:2];
        NSPoint v57 = NSPointFromString(v56);

        v58 = [v51 objectAtIndex:3];
        NSPoint v59 = NSPointFromString(v58);

        uint64_t v60 = self;
        if (!+[GeometricCutTools lineThroughPoint:andPoint:andRectangle:intersectAtPoint:andPoint:](v53.x, v53.y, v55.x, v55.y, 1.0, 1.0, a4.width + -2.0, a4.height + -2.0, v60, &v123, &v122))goto LABEL_12; {
        uint64_t v61 = self;
        }
        if (+[GeometricCutTools lineThroughPoint:andPoint:andRectangle:intersectAtPoint:andPoint:](v57.x, v57.y, v59.x, v59.y, 1.0, 1.0, a4.width + -2.0, a4.height + -2.0, v61, &v121, &v120))
        {
          double v109 = *((double *)&v123 + 1);
          double v111 = *(double *)&v123;
          double aPointb = *((double *)&v122 + 1);
          double aPoint_8a = *(double *)&v122;
          double v100 = *((double *)&v121 + 1);
          double v102 = *(double *)&v121;
          double v97 = *((double *)&v120 + 1);
          double v98 = *(double *)&v120;
          std::vector<double>::vector(__p, 4uLL);
          double v62 = sqrt((v55.y - v53.y) * (v55.y - v53.y) + (v55.x - v53.x) * (v55.x - v53.x));
          CGFloat v63 = (v55.x - v53.x) / v62;
          CGFloat v64 = (v55.y - v53.y) / v62;
          double v65 = sqrt((v59.y - v53.y) * (v59.y - v53.y) + (v59.x - v53.x) * (v59.x - v53.x));
          double v66 = v65 * ((v59.x - v53.x) / v65) * 0.5;
          double v67 = v65 * ((v59.y - v53.y) / v65) * 0.5;
          uint64_t v68 = (double *)__p[0];
          *(CGFloat *)__p[0] = v64 * (v109 - (v53.y + v67)) + (v111 - (v53.x + v66)) * v63;
          v68[1] = v64 * (aPointb - (v53.y + v67)) + (aPoint_8a - (v53.x + v66)) * v63;
          v68[2] = v64 * (v100 - (v53.y + v67)) + (v102 - (v53.x + v66)) * v63;
          v68[3] = v64 * (v97 - (v53.y + v67)) + (v98 - (v53.x + v66)) * v63;
          std::__sort<std::__less<double,double> &,double *>();
          double v69 = *((double *)__p[0] + 1);
          double v70 = *((double *)__p[0] + 2);
          CGFloat v71 = v53.x + v66 + v69 * v63;
          CGFloat v72 = v53.y + v67 + v69 * v64;
          v129.double x = v71 - v66;
          double v117 = v72;
          v129.double y = v72 - v67;
          double v73 = (void *)MEMORY[0x263EFF8C0];
          double v74 = NSStringFromPoint(v129);
          CGFloat v75 = v53.x + v66 + v70 * v63;
          CGFloat v76 = v53.y + v67 + v70 * v64;
          v130.double y = v76 - v67;
          v130.double x = v75 - v66;
          v77 = NSStringFromPoint(v130);
          v131.double x = v66 + v75;
          v131.double y = v67 + v76;
          uint64_t v78 = NSStringFromPoint(v131);
          v132.double x = v66 + v71;
          v132.double y = v67 + v117;
          double v79 = NSStringFromPoint(v132);
          objc_msgSend(v73, "arrayWithObjects:", v74, v77, v78, v79, 0);
          id v80 = (id)objc_claimAutoreleasedReturnValue();

          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
LABEL_12:
          id v80 = v51;
        }

        v81 = [v80 objectAtIndexedSubscript:0];
        NSPoint v82 = NSPointFromString(v81);
        double x = v82.x;
        double y = v82.y;

        double v83 = [v80 objectAtIndexedSubscript:1];
        NSPoint v84 = NSPointFromString(v83);
        double v41 = v84.x;
        double v42 = v84.y;

        double v85 = [v80 objectAtIndexedSubscript:2];
        NSPoint v86 = NSPointFromString(v85);
        double v114 = v86.y;
        double v116 = v86.x;

        double v87 = [v80 objectAtIndexedSubscript:3];
        NSPoint v88 = NSPointFromString(v87);
        double aPointa = v88.x;
        double v40 = v88.y;

        a6->width = sqrt((v84.y - v82.y) * (v84.y - v82.y) + (v84.x - v82.x) * (v84.x - v82.x)) / v99;
      }
      else
      {
        double v36 = v115 * 0.5;
        double v37 = v115 * 0.5 * v31.__cosval;
        double v38 = v115 * 0.5 * v33.__cosval;
        double v39 = v115 * 0.5 * v33.__sinval;
        double aPointa = aPoint + v108 + v38;
        double v40 = aPoint_8 + v101 + v39;
        double v114 = v113 + v115 * 0.5 * v31.__sinval + v101;
        double v116 = v110 + v37 + v108;
        double v41 = v22 + v37 + v34;
        double v42 = v23 + v36 * v31.__sinval + v35;
        double x = v20 + v38 + v34;
        double y = v21 + v39 + v35;
      }
      if (x >= 0.0)
      {
        id v19 = 0;
        if (x < a4.width && y >= 0.0)
        {
          id v19 = 0;
          if (y < a4.height && v41 >= 0.0)
          {
            id v19 = 0;
            if (v41 < a4.width && v42 >= 0.0)
            {
              id v19 = 0;
              if (v42 < a4.height && v116 >= 0.0)
              {
                id v19 = 0;
                if (v116 < a4.width && v114 >= 0.0)
                {
                  id v19 = 0;
                  if (v114 < a4.height && aPointa >= 0.0)
                  {
                    id v19 = 0;
                    if (aPointa < a4.width && v40 >= 0.0 && v40 < a4.height)
                    {
                      double v91 = (void *)MEMORY[0x263EFF8C0];
                      v133.double x = x;
                      v133.double y = y;
                      double v92 = NSStringFromPoint(v133);
                      v134.double x = v41;
                      v134.double y = v42;
                      double v93 = NSStringFromPoint(v134);
                      v135.double y = v114;
                      v135.double x = v116;
                      double v94 = NSStringFromPoint(v135);
                      v136.double x = aPointa;
                      v136.double y = v40;
                      double v95 = NSStringFromPoint(v136);
                      double v96 = objc_msgSend(v91, "arrayWithObjects:", v92, v93, v94, v95, 0);

                      if (+[GeometricCutTools isPointArrayARectangle:]((uint64_t)a1, v96)) {
                        id v19 = v96;
                      }
                      else {
                        id v19 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
LABEL_15:
        id v19 = 0;
      }
    }
  }

  return v19;
}

+ (BOOL)derotateContentsOf:(id)a3 inImage:(vImage_Buffer *)a4 andOutputTo:(vImage_Buffer *)a5 withPadding:(CGPoint)a6 networkInputSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double y = a6.y;
  double x = a6.x;
  id v14 = a3;
  float64x2_t v42 = 0uLL;
  double v15 = objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v14, &v42, (double)a4->width, (double)a4->height, x, y, width, height);

  if (v15
    && (float v16 = v42.f64[0] * 0.125, v17 = (float)(ceilf(v16) * 8.0) + -5.0, v42.f64[0] = v17, width <= v17)
    && v17 <= (double)(4 * a4->width))
  {
    a5->data = malloc_type_malloc((int)v42.f64[1] * (int)v17, 0x100004077774924uLL);
    double v20 = v42.f64[0];
    int8x16_t v21 = (int8x16_t)vcvtq_u64_f64(v42);
    *(int8x16_t *)&a5->double height = vextq_s8(v21, v21, 8uLL);
    a5->rowBytes = (int)v20;
    double v22 = [v15 objectAtIndexedSubscript:0];
    NSPoint v23 = NSPointFromString(v22);

    double v24 = [v15 objectAtIndexedSubscript:1];
    NSPoint v25 = NSPointFromString(v24);

    double v26 = [v15 objectAtIndexedSubscript:3];
    NSPoint v27 = NSPointFromString(v26);

    vImagePixelCount v28 = a5->height;
    if (v28)
    {
      double v29 = sqrt((v23.y - v27.y) * (v23.y - v27.y) + (v23.x - v27.x) * (v23.x - v27.x));
      double v30 = sqrt((v23.y - v25.y) * (v23.y - v25.y) + (v23.x - v25.x) * (v23.x - v25.x));
      double v31 = atan2(v25.y - v23.y, v25.x - v23.x);
      __double2 v32 = __sincos_stret(v31 + 1.57079633);
      __double2 v33 = __sincos_stret(v31);
      vImagePixelCount v34 = 0;
      vImagePixelCount v35 = a5->width;
      do
      {
        if (v35)
        {
          vImagePixelCount v36 = 0;
          double v37 = v29 * (double)(int)v34 / (double)(v28 - 1);
          double v38 = v23.y + v37 * v32.__sinval;
          double v39 = v23.x + v37 * v32.__cosval;
          double v40 = (char *)a5->data + a5->rowBytes * v34;
          do
          {
            double v41 = v30 * (double)(int)v36 / (double)(v35 - 1);
            v40[v36++] = *((unsigned char *)a4->data
                         + a4->rowBytes * (int)(v38 + v41 * v33.__sinval)
                         + (int)(v39 + v41 * v33.__cosval));
            vImagePixelCount v35 = a5->width;
          }
          while (v35 > v36);
          vImagePixelCount v28 = a5->height;
        }
        ++v34;
      }
      while (v28 > v34);
    }
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)stringByInjectingSpaces:(id)a3 textFeatures:(id)a4 improved:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v137 = v7;
  id v138 = (id)[v7 mutableCopy];
  uint64_t v9 = [v8 subFeatures];
  unint64_t v10 = [v9 count];

  if (v10 < 3) {
    goto LABEL_148;
  }
  id v136 = v8;
  id v134 = [v8 subFeatures];
  [v134 count];
  NSPoint v133 = v131;
  MEMORY[0x270FA5388]();
  NSPoint v12 = (float *)&v131[-((v11 + 11) & 0xFFFFFFFFFFFFFFF0)];
  double v13 = [v8 subFeatures];
  bzero(v12, 4 * [v13 count] - 1);

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v14 = [v8 subFeatures];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v145 objects:v156 count:16];
  if (!v15)
  {

    int v139 = 0;
    uint64_t v16 = 0;
LABEL_17:
    float v27 = 0.0;
    goto LABEL_18;
  }
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v146;
  float v18 = 0.0;
  float v19 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v146 != v17) {
        objc_enumerationMutation(v14);
      }
      int8x16_t v21 = *(void **)(*((void *)&v145 + 1) + 8 * i);
      if (v19 != 0.0)
      {
        [*(id *)(*((void *)&v145 + 1) + 8 * i) bounds];
        *(float *)&double v22 = v22 - v19;
        *(float *)&double v22 = fabsf(*(float *)&v22);
        v12[(int)v16] = *(float *)&v22;
        uint64_t v16 = (v16 + 1);
        float v18 = v18 + *(float *)&v22;
      }
      [v21 bounds];
      double v24 = v23;
      [v21 bounds];
      float v19 = v24 + v25;
    }
    uint64_t v15 = [v14 countByEnumeratingWithState:&v145 objects:v156 count:16];
  }
  while (v15);

  if ((int)v16 < 1)
  {
    int v139 = 0;
    goto LABEL_17;
  }
  uint64_t v26 = v16;
  float v27 = 0.0;
  vImagePixelCount v28 = v12;
  do
  {
    float v29 = *v28++;
    float v27 = v27 + (float)((float)(v29 - (float)(v18 / (float)(int)v16)) * (float)(v29 - (float)(v18 / (float)(int)v16)));
    --v26;
  }
  while (v26);
  int v139 = 1;
LABEL_18:
  BOOL v132 = v5;
  for (uint64_t j = 0; j != 72; j += 24)
  {
    double v31 = &v153[j];
    v31[2] = 0;
    *(void *)&v153[j + 8] = 0;
    *double v31 = &v153[j + 8];
  }
  if ((int)v16 >= 0) {
    int v32 = v16;
  }
  else {
    int v32 = v16 + 1;
  }
  float v33 = v12[(int)v16 - 1];
  float v150 = *v12;
  float v151 = v33;
  float v152 = v12[v32 >> 1];
  uint64_t v135 = v16;
  if ((int)v16 <= 1) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = v16;
  }
  int v35 = 10;
  do
  {
    int v140 = v35;
    for (uint64_t k = 0; k != 72; k += 24)
    {
      double v37 = &v153[k];
      double v38 = (void **)&v153[k + 8];
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*v38);
      *double v37 = v38;
      v37[2] = 0;
      *double v38 = 0;
    }
    if (v139)
    {
      uint64_t v39 = 0;
      float v40 = v150;
      do
      {
        int v41 = 0;
        for (uint64_t m = 1; m != 3; ++m)
        {
          if ((float)((float)(v12[v39] - *(&v150 + m)) * (float)(v12[v39] - *(&v150 + m))) < (float)((float)(v12[v39] - v40) * (float)(v12[v39] - v40))) {
            int v41 = m;
          }
        }
        uint64_t v43 = &v153[24 * v41];
        long long v45 = v43 + 8;
        uint64_t v44 = *((void *)v43 + 1);
        if (v44)
        {
          while (1)
          {
            while (1)
            {
              long long v46 = (void *)v44;
              uint64_t v47 = *(int *)(v44 + 28);
              if (v39 >= v47) {
                break;
              }
              uint64_t v44 = *v46;
              long long v45 = v46;
              if (!*v46) {
                goto LABEL_43;
              }
            }
            if (v39 <= v47) {
              break;
            }
            uint64_t v44 = v46[1];
            if (!v44)
            {
              long long v45 = v46 + 1;
              goto LABEL_43;
            }
          }
        }
        else
        {
          long long v46 = v43 + 8;
LABEL_43:
          uint64_t v48 = operator new(0x20uLL);
          v48[7] = v39;
          *(void *)uint64_t v48 = 0;
          *((void *)v48 + 1) = 0;
          *((void *)v48 + 2) = v46;
          *long long v45 = v48;
          uint64_t v49 = **(void **)v43;
          if (v49)
          {
            *(void *)uint64_t v43 = v49;
            uint64_t v48 = (_DWORD *)*v45;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v43 + 1), (uint64_t *)v48);
          ++*((void *)v43 + 2);
        }
        ++v39;
      }
      while (v39 != v34);
    }
    uint64_t v50 = 0;
    int v51 = 0;
    int v52 = v140;
    do
    {
      NSPoint v53 = &v153[24 * v50];
      uint64_t v56 = (void *)*v53;
      uint64_t v54 = v53 + 1;
      NSPoint v55 = v56;
      float v57 = 0.0;
      if (v56 != v54)
      {
        do
        {
          v58 = (void *)v55[1];
          NSPoint v59 = v55;
          if (v58)
          {
            do
            {
              uint64_t v60 = v58;
              v58 = (void *)*v58;
            }
            while (v58);
          }
          else
          {
            do
            {
              uint64_t v60 = (void *)v59[2];
              BOOL v61 = *v60 == (void)v59;
              NSPoint v59 = v60;
            }
            while (!v61);
          }
          float v57 = v57 + v12[*((int *)v55 + 7)];
          NSPoint v55 = v60;
        }
        while (v60 != v54);
      }
      float v62 = v57 / (float)*(unint64_t *)&v153[24 * v50 + 16];
      if (vabds_f32(v62, *(&v150 + v50)) > 0.00000011921)
      {
        *(&v150 + v50) = v62;
        int v51 = 1;
      }
      ++v50;
    }
    while (v50 != 3);
    BOOL v84 = v52 != 0;
    int v35 = v52 - 1;
    int v63 = v35 != 0 && v84;
  }
  while ((v51 & v63 & 1) != 0);
  uint64_t v64 = 0;
  float v65 = 0.0;
  do
  {
    double v66 = &v153[24 * v64];
    double v69 = (void *)*v66;
    double v67 = v66 + 1;
    uint64_t v68 = v69;
    if (v69 != v67)
    {
      do
      {
        double v70 = (void *)v68[1];
        CGFloat v71 = v68;
        if (v70)
        {
          do
          {
            CGFloat v72 = v70;
            double v70 = (void *)*v70;
          }
          while (v70);
        }
        else
        {
          do
          {
            CGFloat v72 = (void *)v71[2];
            BOOL v61 = *v72 == (void)v71;
            CGFloat v71 = v72;
          }
          while (!v61);
        }
        float v73 = v12[*((int *)v68 + 7)] - *(&v150 + v64);
        float v65 = v65 + (float)(v73 * v73);
        uint64_t v68 = v72;
      }
      while (v72 != v67);
    }
    ++v64;
  }
  while (v64 != 3);
  unsigned int v74 = v154 && v151 > v150;
  if (v155 && v152 > *(&v150 + v74)) {
    unsigned int v74 = 2;
  }
  float v75 = v27 - v65;
  if (v132)
  {
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    CGFloat v76 = [v136 subFeatures];
    uint64_t v77 = [v76 countByEnumeratingWithState:&v141 objects:v149 count:16];
    if (v77)
    {
      uint64_t v78 = *(void *)v142;
      float v79 = 0.0;
      do
      {
        for (uint64_t n = 0; n != v77; ++n)
        {
          if (*(void *)v142 != v78) {
            objc_enumerationMutation(v76);
          }
          [*(id *)(*((void *)&v141 + 1) + 8 * n) bounds];
          float v79 = v81 + v79;
        }
        uint64_t v77 = [v76 countByEnumeratingWithState:&v141 objects:v149 count:16];
      }
      while (v77);
    }
    else
    {
      float v79 = 0.0;
    }

    int v95 = v135;
    double v96 = [v136 subFeatures];
    unint64_t v97 = [v96 count];

    uint64_t v98 = v74;
    double v99 = &v153[24 * v74];
    double v101 = v99 + 1;
    double v100 = (void *)*v99;
    float v102 = 0.0;
    float v103 = 0.0;
    if ((void *)*v99 != v99 + 1)
    {
      do
      {
        double v104 = (void *)v100[1];
        double v105 = v100;
        if (v104)
        {
          do
          {
            double v106 = v104;
            double v104 = (void *)*v104;
          }
          while (v104);
        }
        else
        {
          do
          {
            double v106 = (void *)v105[2];
            BOOL v61 = *v106 == (void)v105;
            double v105 = v106;
          }
          while (!v61);
        }
        float v103 = v103 + v12[*((int *)v100 + 7)];
        double v100 = v106;
      }
      while (v106 != v101);
    }
    uint64_t v107 = 0;
    int v108 = 0;
    unint64_t v109 = v99[2];
    do
    {
      if (v107 != v98)
      {
        double v110 = &v153[24 * v107];
        double v113 = (void *)*v110;
        double v111 = v110 + 1;
        double v112 = v113;
        if (v113 != v111)
        {
          do
          {
            double v114 = (void *)v112[1];
            double v115 = v112;
            if (v114)
            {
              do
              {
                double v116 = v114;
                double v114 = (void *)*v114;
              }
              while (v114);
            }
            else
            {
              do
              {
                double v116 = (void *)v115[2];
                BOOL v61 = *v116 == (void)v115;
                double v115 = v116;
              }
              while (!v61);
            }
            float v102 = v102 + v12[*((int *)v112 + 7)];
            ++v108;
            double v112 = v116;
          }
          while (v116 != v111);
        }
      }
      ++v107;
    }
    while (v107 != 3);
    float v117 = v103 / (float)v109;
    if (v117 >= (float)((float)(v102 / (float)v108) + (float)(v102 / (float)v108))
      && (float)(v79 / (float)v97) * 0.3 < v117)
    {
      uint64_t v118 = v95;
      BOOL v119 = (float)(v75 / v27) <= 0.5 || v109 >= v95;
      int v120 = v139;
      if (v119) {
        int v120 = 0;
      }
      if (v120 == 1)
      {
        do
        {
          uint64_t v121 = v118 - 1;
          long long v122 = (void *)*v101;
          if (*v101)
          {
            long long v123 = v101;
            do
            {
              double v124 = v122;
              NSPoint v125 = v123;
              uint64_t v126 = *((int *)v122 + 7);
              NSPoint v127 = v122 + 1;
              if (v121 <= v126)
              {
                NSPoint v127 = v124;
                long long v123 = v124;
              }
              long long v122 = (void *)*v127;
            }
            while (v122);
            if (v123 != v101)
            {
              if (v121 > v126) {
                double v124 = v125;
              }
              if (v118 > *((int *)v124 + 7)) {
                [v138 insertString:@" " atIndex:v118];
              }
            }
          }
          BOOL v94 = v118-- <= 1;
        }
        while (!v94);
      }
    }
  }
  else
  {
    NSPoint v82 = &v153[24 * v74];
    uint64_t v83 = (int)v135;
    BOOL v84 = v75 <= 0.0001 || *((void *)v82 + 2) >= (unint64_t)(int)v135;
    int v85 = v139;
    if (v84) {
      int v85 = 0;
    }
    if (v85 == 1)
    {
      NSPoint v86 = v82 + 8;
      do
      {
        uint64_t v87 = v83 - 1;
        NSPoint v88 = (void *)*v86;
        if (*v86)
        {
          double v89 = v86;
          do
          {
            double v90 = v88;
            double v91 = v89;
            uint64_t v92 = *((int *)v88 + 7);
            double v93 = v88 + 1;
            if (v87 <= v92)
            {
              double v93 = v90;
              double v89 = v90;
            }
            NSPoint v88 = (void *)*v93;
          }
          while (v88);
          if (v89 != v86)
          {
            if (v87 > v92) {
              double v90 = v91;
            }
            if (v83 > *((int *)v90 + 7)) {
              [v138 insertString:@" " atIndex:v83];
            }
          }
        }
        BOOL v94 = v83-- <= 1;
      }
      while (!v94);
    }
  }
  for (iuint64_t i = 56; ii != -16; ii -= 24)
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(void **)&v153[ii]);

  id v8 = v136;
LABEL_148:

  id v129 = v138;
  return v129;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:
{
  BOOL v10 = a10;
  double height = a7.height;
  double width = a7.width;
  double y = a5.y;
  double x = a5.x;
  id v20 = a3;
  id v21 = a6;
  long long v22 = *(_OWORD *)&a4->width;
  v27[0] = *(_OWORD *)&a4->data;
  v27[1] = v22;
  uint64_t v23 = *((void *)a8 + 21);
  memset(v26, 0, sizeof(v26));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v26, (uint64_t *)a9->var0, (uint64_t *)a9->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3));
  double v24 = objc_msgSend(a1, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v20, v27, v21, v23, v26, v10, x, y, width, height, (double)*((int *)a8 + 25), (double)*((int *)a8 + 26));
  vImagePixelCount v28 = (void **)v26;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v28);

  return v24;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:
{
  BOOL v11 = a10;
  double height = a11.height;
  double width = a11.width;
  double v17 = a7.height;
  double v18 = a7.width;
  double y = a5.y;
  double x = a5.x;
  uint64_t v203 = *MEMORY[0x263EF8340];
  id v155 = a3;
  id v22 = a6;
  v201 = a8;
  if (width <= (double)a4->width)
  {
    double v160 = v18;
    double v162 = v17;
    long long v153 = objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v22, v200, v18, v17, x, y, width, height);

    if (v153)
    {
      double v24 = [v153 objectAtIndexedSubscript:0];
      NSPoint v25 = NSPointFromString(v24);

      uint64_t v26 = [v153 objectAtIndexedSubscript:1];
      NSPoint v27 = NSPointFromString(v26);

      v198 = 0;
      uint64_t v199 = 0;
      v197 = 0;
      unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3);
      float v29 = *(uint64_t **)a9->var0;
      int v30 = -1431655765 * ((uint64_t)(*((void *)a9->var0 + 1) - (void)v29) >> 3);
      if ((int)v28 < 2)
      {
        std::vector<std::vector<float>>::resize((uint64_t *)&v197, v30);
        if (v30 >= 1)
        {
          unint64_t v58 = 0;
          uint64_t v59 = 24 * v30;
          do
          {
            uint64_t v60 = *(uint64_t **)a9->var0;
            if (v197 != v60) {
              std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v197[v58 / 8], (char *)v60[v58 / 8], v60[v58 / 8 + 1], (v60[v58 / 8 + 1] - v60[v58 / 8]) >> 2);
            }
            v58 += 24;
          }
          while (v59 != v58);
        }
      }
      else
      {
        uint64_t v32 = *v29;
        uint64_t v31 = v29[1];
        std::vector<std::vector<float>>::resize((uint64_t *)&v197, v30);
        if (v30 >= 1)
        {
          uint64_t v33 = 0;
          float v34 = (float)(int)v28;
          uint64_t v172 = v30;
          unint64_t v174 = (unint64_t)(v31 - v32) >> 2;
          uint64_t v35 = v28;
          uint64_t v154 = a8;
          do
          {
            if ((int)v174 >= 1)
            {
              uint64_t v36 = 0;
              do
              {
                var0 = (uint64_t *)a9->var0;
                float v38 = 0.0;
                uint64_t v39 = v35;
                do
                {
                  uint64_t v40 = *var0;
                  var0 += 3;
                  float v38 = v38 + *(float *)(*(void *)(v40 + 24 * v33) + 4 * v36);
                  --v39;
                }
                while (v39);
                int v41 = &v197[3 * v33];
                float v42 = v38 / v34;
                uint64_t v44 = (float **)(v41 + 1);
                uint64_t v43 = (float *)v41[1];
                long long v46 = v41 + 2;
                unint64_t v45 = v41[2];
                if ((unint64_t)v43 >= v45)
                {
                  uint64_t v48 = (float *)*v41;
                  uint64_t v49 = ((uint64_t)v43 - *v41) >> 2;
                  unint64_t v50 = v49 + 1;
                  if ((unint64_t)(v49 + 1) >> 62) {
                    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                  }
                  BOOL v51 = v11;
                  uint64_t v52 = v35;
                  uint64_t v53 = v45 - (void)v48;
                  if (v53 >> 1 > v50) {
                    unint64_t v50 = v53 >> 1;
                  }
                  if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v54 = v50;
                  }
                  if (v54)
                  {
                    NSPoint v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v46, v54);
                    uint64_t v43 = *v44;
                    uint64_t v48 = (float *)*v41;
                  }
                  else
                  {
                    NSPoint v55 = 0;
                  }
                  uint64_t v56 = (float *)&v55[4 * v49];
                  *uint64_t v56 = v42;
                  uint64_t v47 = v56 + 1;
                  while (v43 != v48)
                  {
                    int v57 = *((_DWORD *)v43-- - 1);
                    *((_DWORD *)v56-- - 1) = v57;
                  }
                  *int v41 = (uint64_t)v56;
                  *uint64_t v44 = v47;
                  *long long v46 = &v55[4 * v54];
                  if (v48) {
                    operator delete(v48);
                  }
                  uint64_t v35 = v52;
                  BOOL v11 = v51;
                  a8 = v154;
                }
                else
                {
                  *uint64_t v43 = v42;
                  uint64_t v47 = v43 + 1;
                }
                *uint64_t v44 = v47;
                ++v36;
              }
              while (v36 != v174);
            }
            ++v33;
          }
          while (v33 != v172);
        }
      }
      if (v11) {
        std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(v197, v198);
      }
      long long v173 = [MEMORY[0x263F089D8] string];
      v171 = [MEMORY[0x263F089D8] string];
      long long v170 = [MEMORY[0x263F089D8] string];
      BOOL v61 = [MEMORY[0x263EFF980] array];
      long long v175 = [MEMORY[0x263EFF980] array];
      v178 = [MEMORY[0x263EFF980] array];
      long long v195 = 0u;
      long long v196 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      obuint64_t j = [v155 subFeatures];
      uint64_t v62 = [obj countByEnumeratingWithState:&v193 objects:v202 count:16];
      long long v168 = v61;
      if (v62)
      {
        double v63 = sqrt((v27.y - v25.y) * (v27.y - v25.y) + (v27.x - v25.x) * (v27.x - v25.x));
        double v157 = (v27.y - v25.y) / v63;
        double v158 = (v27.x - v25.x) / v63;
        uint64_t v64 = *(void *)v194;
        double v156 = width * 0.5;
        do
        {
          for (uint64_t i = 0; i != v62; ++i)
          {
            if (*(void *)v194 != v64) {
              objc_enumerationMutation(obj);
            }
            double v66 = *(void **)(*((void *)&v193 + 1) + 8 * i);
            [v66 bounds];
            double v68 = v67;
            [v66 bounds];
            double v70 = v69;
            [v66 bounds];
            double v72 = v71;
            [v66 bounds];
            double v74 = 0.0;
            if (v63 > width)
            {
              double v75 = (v157 * (v162 * (v72 + v73 * 0.5) - v25.y) + (v160 * (v68 + v70 * 0.5) - v25.x) * v158 - v156)
                  / (v63 - width);
              if (v75 >= 0.0)
              {
                double v74 = (v157 * (v162 * (v72 + v73 * 0.5) - v25.y) + (v160 * (v68 + v70 * 0.5) - v25.x) * v158 - v156)
                    / (v63 - width);
                if (v75 > 1.0) {
                  double v74 = 1.0;
                }
              }
            }
            uint64_t v77 = v197;
            CGFloat v76 = v198;
            [v66 bounds];
            double v79 = v78;
            double v80 = 1.0;
            if (x != INFINITY) {
              [v155 bounds];
            }
            unint64_t v81 = 0xAAAAAAAAAAAAAAABLL * (v76 - v77);
            int v82 = (int)(v74 * (double)(v81 - 1));
            int v83 = (int)(v79 * (double)v81 / v80);
            if (v83 <= 1) {
              unsigned int v84 = 1;
            }
            else {
              unsigned int v84 = v83;
            }
            unint64_t v85 = (v197[3 * v82 + 1] - v197[3 * v82]) >> 2;
            v190 = 0;
            std::vector<double>::vector(&v192, v85, &v190);
            unint64_t v86 = (v197[3 * v82 + 1] - v197[3 * v82]) >> 2;
            __p = 0;
            std::vector<double>::vector(&v190, v86, &__p);
            unint64_t v87 = (v197[3 * v82 + 1] - v197[3 * v82]) >> 2;
            uint64_t v187 = 0;
            std::vector<double>::vector(&__p, v87, &v187);
            BOOL v61 = v168;
            fieldDecoding((uint64_t *)&v197, v84, v82, &v201, 1, &v192, v168, v11);
            fieldDecoding((uint64_t *)&v197, v84, v82, &v201, 2, &v190, v175, v11);
            fieldDecoding((uint64_t *)&v197, v84, v82, &v201, 3, &__p, v178, v11);
            if (v192.__begin_ == v192.__end_)
            {
              begiuint64_t n = v192.__begin_;
            }
            else
            {
              std::vector<int>::pointer v89 = v192.__begin_ + 2;
              begiuint64_t n = v192.__begin_;
              if (v192.__begin_ + 2 != v192.__end_)
              {
                double v88 = *(double *)v192.__begin_;
                begiuint64_t n = v192.__begin_;
                std::vector<int>::pointer v91 = v192.__begin_ + 2;
                do
                {
                  double v92 = *(double *)v91;
                  v91 += 2;
                  double v93 = v92;
                  if (v88 < v92)
                  {
                    double v88 = v93;
                    begiuint64_t n = v89;
                  }
                  std::vector<int>::pointer v89 = v91;
                }
                while (v91 != v192.__end_);
              }
            }
            BOOL v94 = (double *)((char *)v190 + 8);
            BOOL v95 = v190 == v191 || v94 == (double *)v191;
            double v96 = v190;
            if (!v95)
            {
              double v88 = *(double *)v190;
              double v96 = v190;
              unint64_t v97 = (double *)((char *)v190 + 8);
              do
              {
                double v98 = *v97++;
                double v99 = v98;
                if (v88 < v98)
                {
                  double v88 = v99;
                  double v96 = v94;
                }
                BOOL v94 = v97;
              }
              while (v97 != (double *)v191);
            }
            double v100 = (double *)((char *)__p + 8);
            BOOL v101 = __p == v189 || v100 == (double *)v189;
            float v102 = __p;
            if (!v101)
            {
              double v88 = *(double *)__p;
              float v102 = __p;
              float v103 = (double *)((char *)__p + 8);
              do
              {
                double v104 = *v103++;
                double v105 = v104;
                if (v88 < v104)
                {
                  double v88 = v105;
                  float v102 = v100;
                }
                double v100 = v103;
              }
              while (v103 != (double *)v189);
            }
            LOWORD(v187) = *(const int *)((char *)a8 + (((char *)begin - (char *)v192.__begin_) << 29 >> 30));
            __int16 v186 = *(const int *)((char *)a8 + ((v96 - (unsigned char *)v190) << 29 >> 30));
            __int16 v185 = *(const int *)((char *)a8 + ((v102 - (unsigned char *)__p) << 29 >> 30));
            double v106 = objc_msgSend(NSString, "stringWithCharacters:length:", &v187, 1, v88);
            [v173 appendString:v106];

            uint64_t v107 = [NSString stringWithCharacters:&v186 length:1];
            [v171 appendString:v107];

            int v108 = [NSString stringWithCharacters:&v185 length:1];
            [v170 appendString:v108];

            if (__p)
            {
              v189 = (char *)__p;
              operator delete(__p);
            }
            if (v190)
            {
              v191 = (char *)v190;
              operator delete(v190);
            }
            if (v192.__begin_)
            {
              v192.__end_ = v192.__begin_;
              operator delete(v192.__begin_);
            }
          }
          uint64_t v62 = [obj countByEnumeratingWithState:&v193 objects:v202 count:16];
        }
        while (v62);
      }

      std::vector<int>::vector(&v192, 0xAAAAAAAAAAAAAAABLL * (v198 - v197));
      unint64_t v109 = v197;
      if (v198 != v197)
      {
        uint64_t v110 = 0;
        unint64_t v111 = ((char *)v198 - (char *)v197) / 24;
        std::vector<int>::pointer v112 = v192.__begin_;
        if (v111 <= 1) {
          unint64_t v111 = 1;
        }
        do
        {
          double v113 = &v109[3 * v110];
          double v114 = (float *)*v113;
          double v115 = (float *)v113[1];
          double v116 = v114 + 1;
          BOOL v117 = v114 == v115 || v116 == v115;
          uint64_t v118 = v114;
          if (!v117)
          {
            float v119 = *v114;
            uint64_t v118 = v114;
            int v120 = v114 + 1;
            do
            {
              float v121 = *v120++;
              float v122 = v121;
              if (v119 < v121)
              {
                float v119 = v122;
                uint64_t v118 = v116;
              }
              double v116 = v120;
            }
            while (v120 != v115);
          }
          v112[v110++] = *(const int *)((char *)a8 + (((char *)v118 - (char *)v114) << 30 >> 30));
        }
        while (v110 != v111);
      }
      id v123 = +[GeometricCutTools stringByInjectingSpaces:v173 textFeatures:v155 improved:0];
      double v124 = +[GeometricCutTools stringByInjectingSpaces:v171 textFeatures:v155 improved:0];
      uint64_t v125 = +[GeometricCutTools stringByInjectingSpaces:v170 textFeatures:v155 improved:0];
      uint64_t v126 = (void *)v125;
      if (v11)
      {
        v163 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v123, "length"));
        v161 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v124, "length"));
        v159 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v126, "length"));
        uint64_t v127 = [v123 length];
        v183[0] = MEMORY[0x263EF8330];
        v183[1] = 3221225472;
        v183[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke;
        v183[3] = &unk_26429E3D8;
        id v128 = v163;
        id v184 = v128;
        id v129 = v123;
        objc_msgSend(v123, "enumerateSubstringsInRange:options:usingBlock:", 0, v127, 258, v183);
        uint64_t v130 = [v124 length];
        v181[0] = MEMORY[0x263EF8330];
        v181[1] = 3221225472;
        v181[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_2;
        v181[3] = &unk_26429E3D8;
        id v131 = v161;
        id v182 = v131;
        objc_msgSend(v124, "enumerateSubstringsInRange:options:usingBlock:", 0, v130, 258, v181);
        uint64_t v132 = [v126 length];
        v179[0] = MEMORY[0x263EF8330];
        v179[1] = 3221225472;
        v179[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_3;
        v179[3] = &unk_26429E3D8;
        id v133 = v159;
        id v180 = v133;
        objc_msgSend(v126, "enumerateSubstringsInRange:options:usingBlock:", 0, v132, 258, v179);
        id v123 = v128;

        id v165 = v131;
        id v164 = v133;

        id v134 = [v61 reverseObjectEnumerator];
        uint64_t v135 = [v134 allObjects];
        id obja = (id)[v135 mutableCopy];

        id v136 = [v175 reverseObjectEnumerator];
        id v137 = [v136 allObjects];
        long long v169 = (void *)[v137 mutableCopy];

        id v138 = [v178 reverseObjectEnumerator];
        int v139 = [v138 allObjects];
        uint64_t v140 = [v139 mutableCopy];

        v178 = (void *)v140;
      }
      else
      {
        id obja = v61;
        long long v169 = v175;
        id v164 = (id)v125;
        id v165 = v124;
      }
      long long v141 = NSDictionary;
      long long v142 = (void *)MEMORY[0x263EFF8C0];
      long long v176 = (void *)[NSString _newZStringWithString:v123];
      long long v143 = [NSNumber numberWithInteger:0xAAAAAAAAAAAAAAABLL * (v198 - v197)];
      long long v144 = objc_msgSend(v142, "arrayWithObjects:", v176, obja, v143, 0);
      long long v145 = (void *)MEMORY[0x263EFF8C0];
      long long v146 = (void *)[NSString _newZStringWithString:v165];
      long long v147 = [NSNumber numberWithInteger:0xAAAAAAAAAAAAAAABLL * (v198 - v197)];
      long long v148 = objc_msgSend(v145, "arrayWithObjects:", v146, v169, v147, 0);
      v149 = (void *)MEMORY[0x263EFF8C0];
      float v150 = [NSNumber numberWithInteger:0xAAAAAAAAAAAAAAABLL * (v198 - v197)];
      float v151 = objc_msgSend(v149, "arrayWithObjects:", v164, v178, v150, 0);
      uint64_t v23 = objc_msgSend(v141, "dictionaryWithObjectsAndKeys:", v144, @"CardNumber", v148, @"Cardholder", v151, @"Expiration", 0);

      if (v192.__begin_)
      {
        v192.__end_ = v192.__begin_;
        operator delete(v192.__begin_);
      }

      v192.__begin_ = (std::vector<int>::pointer)&v197;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v192);
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v22 = v153;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :(unsigned __int16)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:garbageSymbol:
{
  BOOL v11 = a10;
  double height = a7.height;
  double width = a7.width;
  double y = a5.y;
  double x = a5.x;
  id v21 = a3;
  id v22 = a6;
  long long v23 = *(_OWORD *)&a4->width;
  v29[0] = *(_OWORD *)&a4->data;
  v29[1] = v23;
  uint64_t v24 = *((void *)a8 + 21);
  memset(v28, 0, sizeof(v28));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v28, (uint64_t *)a9->var0, (uint64_t *)a9->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3));
  LOWORD(v27) = a11;
  NSPoint v25 = objc_msgSend(a1, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:garbageSymbol:", v21, v29, v22, v24, v28, v11, x, y, width, height, (double)*((int *)a8 + 25), (double)*((int *)a8 + 26), v27);
  int v30 = (void **)v28;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v25;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std:(unsigned __int16)a12 :vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:garbageSymbol:
{
  BOOL v131 = a10;
  double height = a11.height;
  double width = a11.width;
  double v17 = a7.height;
  double v18 = a7.width;
  double y = a5.y;
  double x = a5.x;
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v133 = a3;
  id v22 = a6;
  if (width <= (double)a4->width)
  {
    double v137 = v18;
    double v138 = v17;
    uint64_t v132 = objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v22, v158, v18, v17, x, y, width, height);

    if (v132)
    {
      uint64_t v24 = [v132 objectAtIndexedSubscript:0];
      NSPoint v25 = NSPointFromString(v24);

      uint64_t v26 = [v132 objectAtIndexedSubscript:1];
      NSPoint v27 = NSPointFromString(v26);

      double v156 = 0;
      uint64_t v157 = 0;
      id v155 = 0;
      unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3);
      float v29 = *(uint64_t **)a9->var0;
      int v30 = -1431655765 * ((uint64_t)(*((void *)a9->var0 + 1) - (void)v29) >> 3);
      if ((int)v28 < 2)
      {
        std::vector<std::vector<float>>::resize((uint64_t *)&v155, v30);
        if (v30 >= 1)
        {
          unint64_t v56 = 0;
          uint64_t v57 = 24 * v30;
          do
          {
            unint64_t v58 = *(uint64_t **)a9->var0;
            if (v155 != v58) {
              std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v155[v56 / 8], (char *)v58[v56 / 8], v58[v56 / 8 + 1], (v58[v56 / 8 + 1] - v58[v56 / 8]) >> 2);
            }
            v56 += 24;
          }
          while (v57 != v56);
        }
      }
      else
      {
        uint64_t v32 = *v29;
        uint64_t v31 = v29[1];
        std::vector<std::vector<float>>::resize((uint64_t *)&v155, v30);
        if (v30 >= 1)
        {
          uint64_t v33 = 0;
          float v34 = (float)(int)v28;
          uint64_t v139 = v30;
          unint64_t v141 = (unint64_t)(v31 - v32) >> 2;
          uint64_t v35 = v28;
          uint64_t v143 = v28;
          do
          {
            if ((int)v141 >= 1)
            {
              uint64_t v36 = 0;
              do
              {
                var0 = (uint64_t *)a9->var0;
                float v38 = 0.0;
                uint64_t v39 = v35;
                do
                {
                  uint64_t v40 = *var0;
                  var0 += 3;
                  float v38 = v38 + *(float *)(*(void *)(v40 + 24 * v33) + 4 * v36);
                  --v39;
                }
                while (v39);
                int v41 = &v155[3 * v33];
                float v42 = v38 / v34;
                uint64_t v44 = (float **)(v41 + 1);
                uint64_t v43 = (float *)v41[1];
                long long v46 = v41 + 2;
                unint64_t v45 = v41[2];
                if ((unint64_t)v43 >= v45)
                {
                  uint64_t v48 = (float *)*v41;
                  uint64_t v49 = ((uint64_t)v43 - *v41) >> 2;
                  unint64_t v50 = v49 + 1;
                  if ((unint64_t)(v49 + 1) >> 62) {
                    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v51 = v45 - (void)v48;
                  if (v51 >> 1 > v50) {
                    unint64_t v50 = v51 >> 1;
                  }
                  if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v52 = v50;
                  }
                  if (v52)
                  {
                    uint64_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v46, v52);
                    uint64_t v43 = *v44;
                    uint64_t v48 = (float *)*v41;
                  }
                  else
                  {
                    uint64_t v53 = 0;
                  }
                  unint64_t v54 = (float *)&v53[4 * v49];
                  *unint64_t v54 = v42;
                  uint64_t v47 = v54 + 1;
                  while (v43 != v48)
                  {
                    int v55 = *((_DWORD *)v43-- - 1);
                    *((_DWORD *)v54-- - 1) = v55;
                  }
                  *int v41 = (uint64_t)v54;
                  *uint64_t v44 = v47;
                  *long long v46 = &v53[4 * v52];
                  if (v48) {
                    operator delete(v48);
                  }
                  uint64_t v35 = v143;
                }
                else
                {
                  *uint64_t v43 = v42;
                  uint64_t v47 = v43 + 1;
                }
                *uint64_t v44 = v47;
                ++v36;
              }
              while (v36 != v141);
            }
            ++v33;
          }
          while (v33 != v139);
        }
      }
      if (v131) {
        std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(v155, v156);
      }
      long long v142 = [MEMORY[0x263F089D8] string];
      long long v146 = [MEMORY[0x263EFF980] array];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      uint64_t v59 = [v133 subFeatures];
      uint64_t v60 = [v59 countByEnumeratingWithState:&v151 objects:v159 count:16];
      if (v60)
      {
        double v61 = sqrt((v27.y - v25.y) * (v27.y - v25.y) + (v27.x - v25.x) * (v27.x - v25.x));
        double v135 = (v27.y - v25.y) / v61;
        double v136 = (v27.x - v25.x) / v61;
        uint64_t v140 = *(void *)v152;
        double v134 = width * 0.5;
        uint64_t v62 = v59;
        do
        {
          uint64_t v144 = v60;
          for (uint64_t i = 0; i != v144; ++i)
          {
            if (*(void *)v152 != v140) {
              objc_enumerationMutation(v59);
            }
            uint64_t v64 = *(void **)(*((void *)&v151 + 1) + 8 * i);
            [v64 bounds];
            double v66 = v65;
            [v64 bounds];
            double v68 = v67;
            [v64 bounds];
            double v70 = v69;
            [v64 bounds];
            double v72 = 0.0;
            if (v61 > width)
            {
              double v73 = (v135 * (v138 * (v70 + v71 * 0.5) - v25.y) + (v137 * (v66 + v68 * 0.5) - v25.x) * v136 - v134)
                  / (v61 - width);
              if (v73 >= 0.0)
              {
                double v72 = (v135 * (v138 * (v70 + v71 * 0.5) - v25.y) + (v137 * (v66 + v68 * 0.5) - v25.x) * v136 - v134)
                    / (v61 - width);
                if (v73 > 1.0) {
                  double v72 = 1.0;
                }
              }
            }
            double v75 = v155;
            double v74 = v156;
            [v64 bounds];
            double v77 = v76;
            double v78 = 1.0;
            if (x != INFINITY) {
              [v133 bounds];
            }
            unint64_t v79 = 0xAAAAAAAAAAAAAAABLL * (v74 - v75);
            int v80 = (int)(v72 * (double)(v79 - 1));
            int v81 = (int)(v77 * (double)v79 / v78);
            if (v81 <= 1) {
              unsigned int v82 = 1;
            }
            else {
              unsigned int v82 = v81;
            }
            unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * (v156 - v155);
            unint64_t v84 = v83 - 1;
            int v85 = v83 - 1;
            if (v84 >= (int)(v80 + (v82 >> 1))) {
              int v86 = v80 + (v82 >> 1);
            }
            else {
              int v86 = v85;
            }
            unint64_t v87 = (v155[3 * v80 + 1] - v155[3 * v80]) >> 2;
            uint64_t v149 = 0;
            std::vector<double>::vector(&__p, v87, &v149);
            double v88 = [MEMORY[0x263F089D8] string];
            uint64_t v90 = (v80 - (v82 >> 1)) & ~((int)(v80 - (v82 >> 1)) >> 31);
            if ((int)v90 <= v86)
            {
              do
              {
                std::vector<int>::pointer v91 = &v155[3 * v90];
                uint64_t v92 = *v91;
                uint64_t v93 = v91[1] - *v91;
                if (v93)
                {
                  uint64_t v94 = 0;
                  unint64_t v95 = v93 >> 2;
                  if (v95 <= 1) {
                    uint64_t v96 = 1;
                  }
                  else {
                    uint64_t v96 = v95;
                  }
                  int v97 = -1;
                  LODWORD(v89) = -8388608;
                  do
                  {
                    if (a8[v94] != a12 && *(float *)(v92 + 4 * v94) > *(float *)&v89)
                    {
                      LODWORD(v89) = *(_DWORD *)(v92 + 4 * v94);
                      int v97 = v94;
                    }
                    ++v94;
                  }
                  while (v96 != v94);
                  if ((v97 & 0x80000000) == 0)
                  {
                    double v89 = *(double *)&__p.__begin_[2 * v97] + *(float *)&v89;
                    *(double *)&__p.__begin_[2 * v97] = v89;
                  }
                }
                else
                {
                  int v97 = -1;
                }
                LOWORD(v149) = a8[v97];
                double v98 = objc_msgSend(NSString, "stringWithCharacters:length:", &v149, 1, v89);
                [v88 appendString:v98];

                double v99 = [NSNumber numberWithInteger:v90];
                [v146 addObject:v99];

                ++v90;
              }
              while (v90 != v86 + 1);
            }
            if (__p.__begin_ == __p.__end_)
            {
              begiuint64_t n = __p.__begin_;
            }
            else
            {
              std::vector<int>::pointer v100 = __p.__begin_ + 2;
              begiuint64_t n = __p.__begin_;
              if (__p.__begin_ + 2 != __p.__end_)
              {
                double v89 = *(double *)__p.__begin_;
                begiuint64_t n = __p.__begin_;
                std::vector<int>::pointer v102 = __p.__begin_ + 2;
                do
                {
                  double v103 = *(double *)v102;
                  v102 += 2;
                  double v104 = v103;
                  if (v89 < v103)
                  {
                    double v89 = v104;
                    begiuint64_t n = v100;
                  }
                  std::vector<int>::pointer v100 = v102;
                }
                while (v102 != __p.__end_);
              }
            }
            LOWORD(v149) = *(const int *)((char *)a8 + (((char *)begin - (char *)__p.__begin_) << 29 >> 30));
            uint64_t v59 = v62;
            double v105 = objc_msgSend(NSString, "stringWithCharacters:length:", &v149, 1, v89);
            [v142 appendString:v105];

            if (__p.__begin_)
            {
              __p.__end_ = __p.__begin_;
              operator delete(__p.__begin_);
            }
          }
          uint64_t v60 = [v62 countByEnumeratingWithState:&v151 objects:v159 count:16];
        }
        while (v60);
      }

      std::vector<int>::vector(&__p, 0xAAAAAAAAAAAAAAABLL * (v156 - v155));
      double v106 = v155;
      if (v156 != v155)
      {
        uint64_t v107 = 0;
        unint64_t v108 = ((char *)v156 - (char *)v155) / 24;
        std::vector<int>::pointer v109 = __p.__begin_;
        if (v108 <= 1) {
          unint64_t v108 = 1;
        }
        do
        {
          uint64_t v110 = &v106[3 * v107];
          unint64_t v111 = (float *)*v110;
          std::vector<int>::pointer v112 = (float *)v110[1];
          double v113 = v111 + 1;
          BOOL v114 = v111 == v112 || v113 == v112;
          double v115 = v111;
          if (!v114)
          {
            float v116 = *v111;
            double v115 = v111;
            BOOL v117 = v111 + 1;
            do
            {
              float v118 = *v117++;
              float v119 = v118;
              if (v116 < v118)
              {
                float v116 = v119;
                double v115 = v113;
              }
              double v113 = v117;
            }
            while (v117 != v112);
          }
          v109[v107++] = *(const int *)((char *)a8 + (((char *)v115 - (char *)v111) << 30 >> 30));
        }
        while (v107 != v108);
      }
      int v120 = [MEMORY[0x263F089D8] string];
      std::vector<int>::pointer v121 = __p.__begin_;
      if (__p.__end_ != __p.__begin_)
      {
        unint64_t v122 = 0;
        do
        {
          LOWORD(v149) = v121[v122];
          id v123 = [NSString stringWithCharacters:&v149 length:1];
          [v120 appendString:v123];

          ++v122;
          std::vector<int>::pointer v121 = __p.__begin_;
        }
        while (v122 < __p.__end_ - __p.__begin_);
      }
      double v124 = +[GeometricCutTools stringByInjectingSpaces:v142 textFeatures:v133 improved:1];
      uint64_t v125 = v124;
      if (v131)
      {
        uint64_t v126 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v124, "length"));
        uint64_t v127 = [v125 length];
        v147[0] = MEMORY[0x263EF8330];
        v147[1] = 3221225472;
        v147[2] = __177__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize_garbageSymbol___block_invoke;
        v147[3] = &unk_26429E3D8;
        id v128 = v126;
        id v148 = v128;
        objc_msgSend(v125, "enumerateSubstringsInRange:options:usingBlock:", 0, v127, 258, v147);
        id v129 = v128;
      }
      else
      {
        id v129 = v124;
      }
      long long v23 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v129, v146, 0);

      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }

      __p.__begin_ = (std::vector<int>::pointer)&v155;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
    else
    {
      long long v23 = 0;
    }
    id v22 = v132;
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

uint64_t __177__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize_garbageSymbol___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

@end