@interface VNBoundingCircleAlgorithm
+ (VNCircle)_boundingCircleForPoints:(double *)a3 aspectRatioForCentroid:;
+ (id)boundingCircleForSIMDPoints:(float32x2_t *)a3 pointCount:(int64_t)a4 aspectRatioForCentroid:(void *)a5 error:;
@end

@implementation VNBoundingCircleAlgorithm

+ (id)boundingCircleForSIMDPoints:(float32x2_t *)a3 pointCount:(int64_t)a4 aspectRatioForCentroid:(void *)a5 error:
{
  self;
  if (!a3)
  {
    if (a5)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"null points array"];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  if (a4 <= 0)
  {
    if (a5)
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid points count %ld", a4);
      *a5 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v16];
    }
LABEL_13:
    v14 = 0;
    goto LABEL_18;
  }
  self;
  long long v20 = 0uLL;
  std::vector<CGPoint>::vector(&__p, a4, &v20);
  v9 = (float64x2_t *)__p;
  do
  {
    float32x2_t v10 = *a3++;
    *v9++ = vcvtq_f64_f32(v10);
    --a4;
  }
  while (a4);
  unsigned int rep = std::chrono::system_clock::now().__d_.__rep_;
  unsigned int v12 = rep + ((rep / 0x7FFFFFFF) | ((rep / 0x7FFFFFFF) << 31));
  if (v12 <= 1) {
    unsigned int v12 = 1;
  }
  LODWORD(v20) = v12;
  std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<CGPoint *>,std::__wrap_iter<CGPoint *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((unint64_t)__p, (uint64_t)v19, (uint64_t)&v20);
  v13 = +[VNBoundingCircleAlgorithm _boundingCircleForPoints:aspectRatioForCentroid:](a1, (uint64_t)VNBoundingCircleAlgorithm, (double **)&__p);
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else if (a5)
  {
    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot calculate minimum enclosing circle for the given set of points"];
  }

  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
LABEL_18:

  return v14;
}

+ (VNCircle)_boundingCircleForPoints:(double *)a3 aspectRatioForCentroid:
{
  self;
  self;
  v4 = a3[1];
  uint64_t v5 = (char *)v4 - (char *)*a3;
  unint64_t v6 = v5 >> 4;
  +[VNError VNAssert:v4 != *a3 log:@"Number of points in collection must be greater than zero"];
  v7 = &off_1E5B19000;
  if (v5 >> 4 == 2)
  {
    v11 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", (*a3)[2], (*a3)[3]);
    unsigned int v12 = [[VNVector alloc] initWithXComponent:**a3 - (*a3)[2] yComponent:(*a3)[1] - (*a3)[3]];
    v13 = +[VNVector vectorByMultiplyingVector:v12 byScalar:0.5];
    v14 = +[VNPoint pointByApplyingVector:v13 toPoint:v11];

    [v14 location];
    double v8 = v15;
    double v9 = v16;
    [(VNVector *)v12 length];
    double v18 = v17;
    self;
    double v10 = v18 * 0.5 + 0.00001;
  }
  else
  {
    if (v6 == 1)
    {
      double v8 = **a3;
      double v9 = (*a3)[1];
      self;
      double v10 = 0.00001;
      goto LABEL_41;
    }
    self;
    v11 = (VNPoint *)objc_msgSend([NSString alloc], "initWithFormat:", @"Number of points in collection must be greater or equal than %lu", v5 >> 4);
    +[VNError VNAssert:v6 <= ((char *)a3[1] - (char *)*a3) >> 4 log:v11];
    uint64_t v133 = v5 >> 4;
    v131 = -[VNPoint initWithLocation:]([VNPoint alloc], "initWithLocation:", (*a3)[2], (*a3)[3]);
    v19 = &off_1E5B19000;
    long long v20 = [[VNVector alloc] initWithXComponent:**a3 - (*a3)[2] yComponent:(*a3)[1] - (*a3)[3]];
    v21 = +[VNVector vectorByMultiplyingVector:v20 byScalar:0.5];
    v22 = +[VNPoint pointByApplyingVector:v21 toPoint:v131];

    v137 = v22;
    [v22 location];
    double v8 = v23;
    double v9 = v24;
    [(VNVector *)v20 length];
    double v26 = v25;
    self;
    double v10 = v26 * 0.5 + 0.00001;
    if ((unint64_t)v5 >= 0x21)
    {
      uint64_t v152 = 2;
      v147 = v11;
      v148 = v20;
      do
      {
        id v27 = objc_alloc((Class)v19[361]);
        [v137 x];
        double v29 = v28;
        double v30 = (*a3)[2 * v152];
        [v137 y];
        v136 = (void *)[v27 initWithXComponent:v29 - v30 yComponent:v31 - (*a3)[2 * v152 + 1]];
        [v136 length];
        if (v32 >= v10)
        {
          v135 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", **a3, (*a3)[1]);
          uint64_t v33 = [objc_alloc((Class)v19[361]) initWithXComponent:(*a3)[2 * v152] - **a3 yComponent:(*a3)[2 * v152 + 1] - (*a3)[1]];
          v34 = v7[306];
          v134 = (void *)v33;
          v35 = objc_msgSend(v19[361], "vectorByMultiplyingVector:byScalar:", 0.5);
          v36 = [v34 pointByApplyingVector:v35 toPoint:v135];

          v144 = v36;
          [v36 location];
          double v138 = v38;
          double v139 = v37;
          [v134 length];
          double v40 = v39;
          self;
          double v140 = v40 * 0.5 + 0.00001;
          uint64_t v153 = 1;
          double v150 = v9;
          double v151 = v8;
          double v149 = v10;
          do
          {
            id v41 = objc_alloc((Class)v19[361]);
            [v144 x];
            double v43 = v42;
            double v44 = (*a3)[2 * v153];
            [v144 y];
            v143 = (void *)[v41 initWithXComponent:v43 - v44 yComponent:v45 - (*a3)[2 * v153 + 1]];
            [v143 length];
            if (v46 >= v140)
            {
              v142 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", (*a3)[2 * v152], (*a3)[2 * v152 + 1]);
              uint64_t v47 = [objc_alloc((Class)v19[361]) initWithXComponent:(*a3)[2 * v153] - (*a3)[2 * v152] yComponent:(*a3)[2 * v153 + 1] - (*a3)[2 * v152 + 1]];
              v48 = v7[306];
              v141 = (void *)v47;
              v49 = objc_msgSend(v19[361], "vectorByMultiplyingVector:byScalar:", 0.5);
              v50 = [v48 pointByApplyingVector:v49 toPoint:v142];

              [v50 location];
              double v145 = v52;
              double v146 = v51;
              [v141 length];
              double v54 = v53;
              self;
              uint64_t v55 = 0;
              double v158 = v54 * 0.5 + 0.00001;
              uint64_t v56 = v153;
              do
              {
                v57 = [VNVector alloc];
                [v50 x];
                double v59 = v58;
                double v60 = (*a3)[v55];
                [v50 y];
                v159 = [(VNVector *)v57 initWithXComponent:v59 - v60 yComponent:v61 - (*a3)[v55 + 1]];
                [(VNVector *)v159 length];
                if (v62 >= v158)
                {
                  long long v163 = *(_OWORD *)&(*a3)[2 * v152];
                  long long v164 = *(_OWORD *)&(*a3)[2 * v153];
                  long long v165 = *(_OWORD *)&(*a3)[v55];
                  v63 = (double *)operator new(0x30uLL);
                  *(_OWORD *)v63 = v163;
                  *((_OWORD *)v63 + 1) = v164;
                  *((_OWORD *)v63 + 2) = v165;
                  self;
                  +[VNError VNAssert:1 log:@"A collection must contain 3 points"];
                  v162 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", *v63, v63[1]);
                  v157 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", v63[2], v63[3]);
                  v64 = [[VNVector alloc] initWithXComponent:v63[2] - *v63 yComponent:v63[3] - v63[1]];
                  v156 = v50;
                  v65 = [[VNVector alloc] initWithXComponent:v63[4] - *v63 yComponent:v63[5] - v63[1]];
                  v66 = v7[306];
                  v67 = +[VNVector vectorByMultiplyingVector:v64 byScalar:0.5];
                  v161 = [v66 pointByApplyingVector:v67 toPoint:v162];

                  v68 = [VNVector alloc];
                  [v161 x];
                  double v70 = v69;
                  [v161 y];
                  v155 = [(VNVector *)v68 initWithXComponent:v70 yComponent:v71];
                  +[VNVector dotProductOfVector:vector:](VNVector, "dotProductOfVector:vector:");
                  double v73 = v72;
                  v74 = v7[306];
                  v75 = +[VNVector vectorByMultiplyingVector:v65 byScalar:0.5];
                  v160 = [v74 pointByApplyingVector:v75 toPoint:v162];

                  v76 = [VNVector alloc];
                  [v160 x];
                  double v78 = v77;
                  [v160 y];
                  v154 = [(VNVector *)v76 initWithXComponent:v78 yComponent:v79];
                  +[VNVector dotProductOfVector:vector:](VNVector, "dotProductOfVector:vector:");
                  double v81 = v80;
                  [(VNVector *)v64 x];
                  double v83 = v82;
                  [(VNVector *)v65 y];
                  double v85 = v84;
                  [(VNVector *)v64 y];
                  double v87 = v86;
                  [(VNVector *)v65 x];
                  double v89 = v88;
                  self;
                  double v90 = v83 * v85 - v87 * v89;
                  if (fabs(v90) <= 0.00001)
                  {
                    v105 = [[VNVector alloc] initWithXComponent:v63[4] - v63[2] yComponent:v63[5] - v63[3]];
                    v108 = a3;
                    v109 = v7;
                    v110 = v7[306];
                    v111 = +[VNVector vectorByMultiplyingVector:v105 byScalar:0.5];
                    v112 = [v110 pointByApplyingVector:v111 toPoint:v157];

                    [(VNVector *)v64 length];
                    double v114 = v113;
                    [(VNVector *)v65 length];
                    double v116 = v115;
                    [(VNVector *)v105 length];
                    if (v116 >= v117) {
                      double v117 = v116;
                    }
                    if (v114 >= v117) {
                      double v118 = v114;
                    }
                    else {
                      double v118 = v117;
                    }
                    self;
                    if (v118 == v114)
                    {
                      [v161 location];
                      double v102 = v119;
                      double v103 = v120;
                      a3 = v108;
                    }
                    else
                    {
                      a3 = v108;
                      if (v118 == v116) {
                        [v160 location];
                      }
                      else {
                        [v112 location];
                      }
                      double v102 = v121;
                      double v103 = v122;
                    }
                    double v107 = v118 * 0.5;

                    v7 = v109;
                  }
                  else
                  {
                    [(VNVector *)v65 y];
                    double v92 = v91;
                    [(VNVector *)v64 y];
                    double v94 = v93;
                    [(VNVector *)v64 x];
                    double v96 = v95;
                    [(VNVector *)v65 x];
                    double v98 = v97;
                    v99 = [VNVector alloc];
                    [v162 x];
                    double v101 = v100;
                    [v162 y];
                    double v102 = (v73 * v92 - v81 * v94) / v90;
                    double v103 = (v96 * v81 - v98 * v73) / v90;
                    v105 = [(VNVector *)v99 initWithXComponent:v102 - v101 yComponent:v103 - v104];
                    [(VNVector *)v105 length];
                    double v107 = v106;
                    self;
                  }
                  double v123 = v107 + 0.00001;

                  v11 = v147;
                  if (v123 <= 0.0)
                  {
                    v50 = v156;
                  }
                  else
                  {
                    uint64_t v124 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", v102, v103);

                    v50 = (void *)v124;
                    double v158 = v123;
                    double v145 = v103;
                    double v146 = v102;
                  }
                  operator delete(v63);
                  long long v20 = v148;
                  double v9 = v150;
                  double v8 = v151;
                  double v10 = v149;
                }

                v55 += 2;
                --v56;
              }
              while (v56);
              v19 = &off_1E5B19000;
              if (v158 > 0.0)
              {
                uint64_t v125 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", v146, v145);

                v144 = (void *)v125;
                double v139 = v146;
                double v140 = v158;
                double v138 = v145;
              }
            }
            ++v153;
          }
          while (v153 != v152);
          if (v140 > 0.0)
          {
            uint64_t v126 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", v139, v138);

            v137 = (void *)v126;
            double v8 = v139;
            double v10 = v140;
            double v9 = v138;
          }
        }
        ++v152;
      }
      while (v152 != v133);
    }
  }
LABEL_41:
  v127 = [VNCircle alloc];
  v128 = objc_msgSend(objc_alloc((Class)v7[306]), "initWithLocation:", v8, v9 * a1);
  v129 = [(VNCircle *)v127 initWithCenter:v128 radius:v10];

  return v129;
}

@end