@interface SKReach
+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5;
+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5 maxZRotationSpeed:(double)a6;
+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 velocity:(double)a5;
+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 zRotationSpeed:(double)a5 maxDuration:(double)a6;
- (SKReach)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)solveIKWithTarget:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SKReach

- (SKReach)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKReach;
  v2 = [(SKAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_ikRoot, 0);
    v3->_goalPosition = (CGPoint)*MEMORY[0x263F00148];
    ikChain = v3->_ikChain;
    v3->_ikChain = 0;

    v3->_velocity = 0.0;
    v3->_timeConstrained = 1;
  }
  return v3;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 zRotationSpeed:(double)a5 maxDuration:(double)a6
{
  return 0;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5 maxZRotationSpeed:(double)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a4;
  v11 = objc_alloc_init(SKReach);
  v11->_goalPosition.CGFloat x = x;
  v11->_goalPosition.CGFloat y = y;
  objc_storeWeak((id *)&v11->_ikRoot, v10);
  v11->_zRotationSpeed = a6;
  [(SKAction *)v11 setDuration:a5];

  return v11;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);

  if (WeakRetained == v6) {
    NSLog(&cfstr_WarningReachto.isa);
  }
  v8.receiver = self;
  v8.super_class = (Class)SKReach;
  [(SKAction *)&v8 willStartWithTarget:v6 atTime:a4];
  [(SKReach *)self solveIKWithTarget:v6];
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 duration:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = objc_alloc_init(SKReach);
  v9->_goalPosition.CGFloat x = x;
  v9->_goalPosition.CGFloat y = y;
  objc_storeWeak((id *)&v9->_ikRoot, v8);
  [(SKAction *)v9 setDuration:a5];

  return v9;
}

+ (id)reachTo:(CGPoint)a3 rootNode:(id)a4 velocity:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = objc_alloc_init(SKReach);
  v9->_goalPosition.CGFloat x = x;
  v9->_goalPosition.CGFloat y = y;
  objc_storeWeak((id *)&v9->_ikRoot, v8);
  v9->_velocitCGFloat y = a5;
  v9->_timeConstrained = 0;
  id v10 = v8;
  for (i = v10; ; i = (void *)v15)
  {
    v12 = [i children];
    uint64_t v13 = [v12 count];

    if (!v13) {
      break;
    }
    v14 = [i children];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
  }
  [(SKReach *)v9 solveIKWithTarget:i];

  return v9;
}

- (void)solveIKWithTarget:(id)a3
{
  id v148 = a3;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  ikChain = self->_ikChain;
  self->_ikChain = v4;

  id v6 = v148;
  id v149 = v6;
  if (v6)
  {
    v7 = 0;
    id v8 = (double *)MEMORY[0x263F00148];
    id v9 = v6;
    while (1)
    {
      id v10 = objc_msgSend(v9, "reachConstraints", v148);

      if (v10)
      {
        v11 = [v9 reachConstraints];
        [v11 lowerAngleLimit];
        double v13 = v12;

        v14 = [v9 reachConstraints];
        [v14 upperAngleLimit];
        double v16 = v15;

        [v9 zRotation];
        float v18 = v13;
        if (v18 < 0.0 || v18 > 6.2832) {
          float v18 = v18 - (float)((float)(int)floorf(v18 / 6.2832) * 6.2832);
        }
        float v19 = v16;
        float v20 = v19 - v18;
        if (v20 < 0.0 || v20 > 6.2832) {
          float v20 = v20 - (float)((float)(int)floorf(v20 / 6.2832) * 6.2832);
        }
        float v21 = v17;
        float v22 = v21 - v18;
        if (v22 < 0.0 || v22 > 6.2832) {
          float v22 = v22 - (float)((float)(int)floorf(v22 / 6.2832) * 6.2832);
        }
        if (v22 > v20)
        {
          if (6.28318531 - v22 <= (float)(v22 - v20))
          {
            v23 = [v9 reachConstraints];
            [v23 lowerAngleLimit];
          }
          else
          {
            v23 = [v9 reachConstraints];
            [v23 upperAngleLimit];
          }
          objc_msgSend(v9, "setZRotation:");
        }
      }
      v24 = [[IKLink alloc] initWithNode:v9];
      double v25 = *v8;
      double v26 = v8[1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);
      v28 = [WeakRetained parent];
      objc_msgSend(v9, "convertPoint:toNode:", v28, v25, v26);
      double v30 = v29;
      double v32 = v31;

      *(float *)&double v33 = v30;
      *(float *)&double v34 = v32;
      -[IKLink setPosition:](v24, "setPosition:", v33, v34);
      if (v7)
      {
        [(IKLink *)v7 position];
        unsigned int v157 = v35;
        unsigned int v152 = v36;
        [(IKLink *)v24 position];
        v38.i32[1] = v37;
        float32x2_t v39 = vsub_f32(v38, (float32x2_t)__PAIR64__(v152, v157));
        float32x2_t v40 = vmul_f32(v39, v39);
        double v41 = COERCE_DOUBLE(vpadd_f32(v40, v40));
        *(float *)&double v41 = sqrtf(*(float *)&v41);
        [(IKLink *)v24 setLength:v41];
        v42 = [(IKLink *)v7 node];
        [v42 position];
        double v44 = v43;
        v45 = [(IKLink *)v7 node];
        [v45 position];
        *(float *)&double v46 = v44;
        *(float *)&double v47 = v47;
        -[IKLink setSize:](v24, "setSize:", v46, v47);
      }
      [(NSMutableArray *)self->_ikChain insertObject:v24 atIndex:0];
      id v48 = objc_loadWeakRetained((id *)&self->_ikRoot);

      if (v9 == v48) {
        break;
      }
      uint64_t v49 = [v9 parent];

      id v9 = (id)v49;
      v7 = v24;
      if (!v49) {
        goto LABEL_25;
      }
    }

    v24 = v7;
  }
  else
  {
    v24 = 0;
  }
LABEL_25:
  if ((unint64_t)[(NSMutableArray *)self->_ikChain count] < 2) {
    goto LABEL_54;
  }
  uint64_t v50 = [(NSMutableArray *)self->_ikChain count];
  v51 = [(NSMutableArray *)self->_ikChain objectAtIndexedSubscript:v50 - 1];
  [v51 setLength:0.0];
  v150 = v51;
  id v52 = objc_loadWeakRetained((id *)&self->_ikRoot);
  v53 = [v52 parent];
  double x = self->_goalPosition.x;
  double y = self->_goalPosition.y;
  id v56 = objc_loadWeakRetained((id *)&self->_ikRoot);
  v57 = [v56 scene];
  objc_msgSend(v53, "convertPoint:fromNode:", v57, x, y);
  float64_t v153 = v59;
  float64_t v158 = v58;

  uint64_t v60 = 0;
  v61.f64[0] = v158;
  v61.f64[1] = v153;
  float32x2_t v62 = vcvt_f32_f64(v61);
  uint64_t v63 = v50 - 2;
  uint64_t v64 = v50 - 2;
  do
  {
    id v65 = objc_loadWeakRetained((id *)&self->_ikRoot);
    [v65 position];
    float64_t v159 = v66;
    id v67 = objc_loadWeakRetained((id *)&self->_ikRoot);
    [v67 position];
    v68.f64[0] = v159;
    v68.f64[1] = v69;
    *(float32x2_t *)&v68.f64[0] = vcvt_f32_f64(v68);
    float64x2_t v160 = v68;

    unint64_t v70 = 0;
    double v71 = 0.0;
    while (1)
    {
      unint64_t v72 = [(NSMutableArray *)self->_ikChain count];
      v73 = self->_ikChain;
      if (v70 >= v72) {
        break;
      }
      v74 = [(NSMutableArray *)v73 objectAtIndexedSubscript:v70];
      LODWORD(v75) = HIDWORD(v160.f64[0]);
      objc_msgSend(v74, "setPosition:", v160.f64[0], v75);
      [v74 angle];
      float v77 = v76;
      [v74 size];
      float v79 = v78;
      double v71 = v71 + v77;
      float v80 = v71;
      float v81 = cosf(v80);
      [v74 size];
      float v83 = v82;
      float v84 = v71;
      float v85 = sinf(v84);
      [v74 size];
      float v87 = v86;
      [v74 size];
      v88.f32[0] = (float)(v79 * v81) - (float)(v83 * v85);
      v88.f32[1] = (float)(v85 * v89) + (float)(v87 * v81);
      v90.f64[1] = v160.f64[1];
      *(float32x2_t *)&v90.f64[0] = vadd_f32(*(float32x2_t *)&v160.f64[0], v88);
      float64x2_t v160 = v90;

      ++v70;
    }
    v91 = [(NSMutableArray *)v73 objectAtIndexedSubscript:v64];
    if (v64)
    {
      v92 = [(NSMutableArray *)self->_ikChain objectAtIndexedSubscript:v64 - 1];
      [v92 node];
    }
    else
    {
      v92 = objc_loadWeakRetained((id *)&self->_ikRoot);
      [v92 parent];
    v93 = };

    v94 = v150;
    if (!v93) {
      goto LABEL_41;
    }
    float32x2_t v95 = vsub_f32(v62, *(float32x2_t *)&v160.f64[0]);
    float32x2_t v96 = vmul_f32(v95, v95);
    if (sqrtf(vpadd_f32(v96, v96).f32[0]) <= 1.0) {
      goto LABEL_41;
    }
    [v91 position];
    unsigned int v154 = v97;
    [v91 position];
    float32x2_t v99 = vsub_f32(*(float32x2_t *)&v160.f64[0], (float32x2_t)__PAIR64__(v98, v154));
    float32x2_t v100 = vsub_f32(v62, (float32x2_t)__PAIR64__(v98, v154));
    float32x2_t v101 = vmul_f32(v100, v100);
    float32x2_t v102 = vmul_f32(v99, v99);
    float32x2_t v103 = vmul_f32(vmul_n_f32(v100, 1.0 / sqrtf(vpadd_f32(v101, v101).f32[0])), vmul_n_f32(v99, 1.0 / sqrtf(vpadd_f32(v102, v102).f32[0])));
    float v104 = vpadd_f32(v103, v103).f32[0];
    if (v104 >= 0.99999) {
      goto LABEL_41;
    }
    float v105 = vmlas_n_f32((float)-v100.f32[1] * v99.f32[0], v99.f32[1], v100.f32[0]);
    if (v105 > 0.0)
    {
      *(float *)&double v106 = -acosf(v104);
LABEL_40:
      [v91 rotateByAngle:v106];
      goto LABEL_41;
    }
    if (v105 < 0.0)
    {
      *(float *)&double v106 = acosf(v104);
      goto LABEL_40;
    }
LABEL_41:

    if (v60 == 250) {
      break;
    }
    ++v60;
    if (v64) {
      --v64;
    }
    else {
      uint64_t v64 = v63;
    }
    float32x2_t v107 = vsub_f32(v62, *(float32x2_t *)&v160.f64[0]);
    float32x2_t v108 = vmul_f32(v107, v107);
  }
  while (sqrtf(vpadd_f32(v108, v108).f32[0]) > 1.0);
  if (!self->_timeConstrained)
  {
    id v109 = objc_loadWeakRetained((id *)&self->_ikRoot);
    v110 = [v109 parent];
    v111 = [v150 node];
    [v111 position];
    double v113 = v112;
    double v115 = v114;
    v116 = [v150 node];
    v117 = [v116 parent];
    objc_msgSend(v110, "convertPoint:fromNode:", v117, v113, v115);
    float64_t v155 = v119;
    float64_t v161 = v118;

    unint64_t v120 = 0;
    v121.f64[0] = v161;
    v121.f64[1] = v155;
    float32x2_t v122 = vcvt_f32_f64(v121);
    double v123 = 0.0;
    v94 = v150;
    do
    {
      id v124 = objc_loadWeakRetained((id *)&self->_ikRoot);
      [v124 position];
      float64_t v162 = v125;
      float32x2_t v151 = v122;
      double v156 = v123;
      id v126 = objc_loadWeakRetained((id *)&self->_ikRoot);
      [v126 position];
      v127.f64[0] = v162;
      v127.f64[1] = v128;
      float32x2_t v122 = vcvt_f32_f64(v127);

      unint64_t v129 = 0;
      double v130 = 0.0;
      while (v129 < [(NSMutableArray *)self->_ikChain count])
      {
        v131 = [(NSMutableArray *)self->_ikChain objectAtIndexedSubscript:v129];
        [v131 angleInitial];
        float v133 = v132;
        [v131 angle];
        float v135 = v134;
        [v131 angleInitial];
        float v137 = v136;
        [v131 length];
        float v139 = v138;
        [v131 length];
        float v141 = v140;
        float v142 = v133 + (double)v120 * 0.125 * (float)(v135 - v137);
        double v130 = v130 + v142;
        float v143 = v130;
        __float2 v144 = __sincosf_stret(v143);
        v145.f32[0] = v144.__cosval * v139;
        v145.f32[1] = v144.__sinval * v141;
        float32x2_t v122 = vadd_f32(v122, v145);

        ++v129;
      }
      float32x2_t v146 = vsub_f32(v122, v151);
      float32x2_t v147 = vmul_f32(v146, v146);
      double v123 = v156 + sqrtf(vpadd_f32(v147, v147).f32[0]);
      ++v120;
    }
    while (v120 != 8);
    [(SKAction *)self setDuration:v123 / self->_velocity];
  }

LABEL_54:
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  v20.receiver = self;
  v20.super_class = (Class)SKReach;
  -[SKAction updateWithTarget:forTime:](&v20, sel_updateWithTarget_forTime_, a3);
  [(SKAction *)self ratioForTime:a4];
  double v7 = v6;
  uint64_t v8 = [(NSMutableArray *)self->_ikChain count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    float v11 = v7;
    do
    {
      double v12 = [(NSMutableArray *)self->_ikChain objectAtIndexedSubscript:v10];
      [v12 angleInitial];
      float v14 = v13;
      [v12 angle];
      float v16 = v15;
      [v12 angleInitial];
      float v18 = v17;
      float v19 = [v12 node];
      [v19 setZRotation:(float)(v14 + (float)(v11 * (float)(v16 - v18)))];

      ++v10;
    }
    while (v9 != v10);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKReach;
  v4 = [(SKAction *)&v9 copyWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ikRoot);
  objc_storeWeak((id *)v4 + 2, WeakRetained);

  *(CGPoint *)(v4 + 24) = self->_goalPosition;
  uint64_t v6 = [(NSMutableArray *)self->_ikChain copy];
  double v7 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v6;

  *((void *)v4 + 6) = *(void *)&self->_velocity;
  v4[56] = self->_timeConstrained;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ikChain, 0);

  objc_destroyWeak((id *)&self->_ikRoot);
}

@end