@interface GKAgent
+ (BOOL)supportsSecureCoding;
- (GKAgent)init;
- (GKAgent)initWithCoder:(id)a3;
- (GKBehavior)behavior;
- (__n128)steerForAlignment:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5;
- (__n128)steerForCohesion:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5;
- (__n128)steerForIntercept:(uint64_t)a3 maxPredictionTime:(void *)a4;
- (__n128)steerForSeparation:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5;
- (__n128)steerToAvoidAgents:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4;
- (__n128)steerToAvoidObstacles:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4;
- (__n128)steerToFollowPath:(uint64_t)a3 maxPredictionTime:(void *)a4 forward:(int)a5;
- (__n128)steerToStayOnPath:(void *)a3 maxPredictionTime:;
- (__n64)steerForFlee:(void *)a1;
- (__n64)steerForWander:(float)a3 speed:;
- (double)position3;
- (double)velocity3;
- (float)mass;
- (float)maxAcceleration;
- (float)maxSpeed;
- (float)radius;
- (float)speed;
- (float32x2_t)steerForSeek:(void *)a1;
- (float32x2_t)steerForTargetSpeed:(void *)a1;
- (id).cxx_construct;
- (id)delegate;
- (void)encodeWithCoder:(id)a3;
- (void)setBehavior:(GKBehavior *)behavior;
- (void)setDelegate:(id)delegate;
- (void)setMass:(float)mass;
- (void)setMaxAcceleration:(float)maxAcceleration;
- (void)setMaxSpeed:(float)maxSpeed;
- (void)setRadius:(float)radius;
- (void)setSpeed:(float)speed;
- (void)vehicle;
@end

@implementation GKAgent

- (GKAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKAgent;
  v2 = [(GKComponent *)&v6 init];
  v3 = v2 + 40;
  (*(void (**)(char *))(*((void *)v2 + 5) + 72))(v2 + 40);
  *((void *)v2 + 12) = 0;
  v2[128] = 0;
  (*(void (**)(char *, float))(*(void *)v3 + 168))(v3, 1.0);
  (*(void (**)(char *, double))(*(void *)v3 + 208))(v3, 0.0);
  (*(void (**)(char *, float))(*(void *)v3 + 184))(v3, 0.5);
  (*(void (**)(char *, float))(*(void *)v3 + 232))(v3, 1.0);
  (*(void (**)(char *, float))(*(void *)v3 + 248))(v3, 1.0);
  *((void *)v2 + 23) = _static_vec3_zero;
  *((_DWORD *)v2 + 48) = dword_26884D848;
  *((void *)v2 + 20) = _static_vec3_zero;
  *((_DWORD *)v2 + 42) = dword_26884D848;
  *(void *)(v2 + 172) = _static_vec3_zero;
  *((_DWORD *)v2 + 45) = dword_26884D848;
  *((_DWORD *)v2 + 39) = 0;
  *((_DWORD *)v2 + 49) = 0;
  uint64_t v4 = _static_vec3_zero;
  *((_DWORD *)v2 + 52) = dword_26884D848;
  *((void *)v2 + 25) = v4;
  v2[212] = 1;
  return (GKAgent *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GKAgent;
  v5 = [(GKComponent *)&v17 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    p_vehicle = &v5->_vehicle;
    (*((void (**)(GKSimpleVehicle *))v5->_vehicle._vptr$AbstractLocalSpace + 9))(&v5->_vehicle);
    *(void *)&v6->_vehicle.WanderSide = 0;
    v6->_vehicle.gaudyPursuitAnnotation = 0;
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 21))(&v6->_vehicle, 1.0);
    (*((void (**)(GKSimpleVehicle *, double))p_vehicle->_vptr$AbstractLocalSpace + 26))(&v6->_vehicle, 0.0);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 23))(&v6->_vehicle, 0.5);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 29))(&v6->_vehicle, 1.0);
    (*((void (**)(GKSimpleVehicle *, float))p_vehicle->_vptr$AbstractLocalSpace + 31))(&v6->_vehicle, 1.0);
    *(void *)&v6->_vehicle._smoothedPosition.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._smoothedPosition.z) = dword_26884D848;
    *(void *)&v6->_vehicle._lastForward.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._lastForward.z) = dword_26884D848;
    *(void *)&v6->_vehicle._lastPosition.x = _static_vec3_zero;
    LODWORD(v6->_vehicle._lastPosition.z) = dword_26884D848;
    v6->_vehicle._curvature = 0.0;
    v6->_vehicle._smoothedCurvature = 0.0;
    uint64_t v8 = _static_vec3_zero;
    LODWORD(v6->_vehicle._smoothedAcceleration.z) = dword_26884D848;
    *(void *)&v6->_vehicle._smoothedAcceleration.x = v8;
    [(GKAgent *)v6 setDelegate:0];
    [v4 decodeFloatForKey:@"mass"];
    -[GKAgent setMass:](v6, "setMass:");
    [v4 decodeFloatForKey:@"radius"];
    -[GKAgent setRadius:](v6, "setRadius:");
    [v4 decodeFloatForKey:@"speed"];
    -[GKAgent setSpeed:](v6, "setSpeed:");
    [v4 decodeFloatForKey:@"maxAcceleration"];
    -[GKAgent setMaxAcceleration:](v6, "setMaxAcceleration:");
    [v4 decodeFloatForKey:@"maxSpeed"];
    -[GKAgent setMaxSpeed:](v6, "setMaxSpeed:");
    [v4 decodeFloatForKey:@"positionX"];
    int v10 = v9;
    [v4 decodeFloatForKey:@"positionY"];
    int v12 = v11;
    [v4 decodeFloatForKey:@"positionZ"];
    int v14 = v13;
    v15 = [(GKAgent *)v6 vehicle];
    v15[11] = v10;
    v15[12] = v12;
    v15[13] = v14;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [(GKAgent *)self mass];
  objc_msgSend(v7, "encodeFloat:forKey:", @"mass");
  [(GKAgent *)self radius];
  objc_msgSend(v7, "encodeFloat:forKey:", @"radius");
  [(GKAgent *)self speed];
  objc_msgSend(v7, "encodeFloat:forKey:", @"speed");
  [(GKAgent *)self maxAcceleration];
  objc_msgSend(v7, "encodeFloat:forKey:", @"maxAcceleration");
  [(GKAgent *)self maxSpeed];
  objc_msgSend(v7, "encodeFloat:forKey:", @"maxSpeed");
  [(GKAgent *)self position3];
  objc_msgSend(v7, "encodeFloat:forKey:", @"positionX");
  [(GKAgent *)self position3];
  LODWORD(v4) = HIDWORD(v4);
  [v7 encodeFloat:@"positionY" forKey:v4];
  [(GKAgent *)self position3];
  LODWORD(v6) = v5;
  [v7 encodeFloat:@"positionZ" forKey:v6];
}

- (void)vehicle
{
  return &self->_vehicle;
}

- (float)mass
{
  (*((void (**)(void))self->_vehicle._vptr$AbstractLocalSpace + 20))();
  return result;
}

- (void)setMass:(float)mass
{
}

- (float)radius
{
  (*((void (**)(void))self->_vehicle._vptr$AbstractLocalSpace + 22))();
  return result;
}

- (void)setRadius:(float)radius
{
}

- (float)speed
{
  (*((void (**)(void))self->_vehicle._vptr$AbstractLocalSpace + 25))();
  return result;
}

- (void)setSpeed:(float)speed
{
}

- (float)maxAcceleration
{
  float v3 = (*((float (**)(GKSimpleVehicle *, SEL))self->_vehicle._vptr$AbstractLocalSpace + 28))(&self->_vehicle, a2);
  [(GKAgent *)self mass];
  return v3 / v4;
}

- (void)setMaxAcceleration:(float)maxAcceleration
{
  p_vehicle = &self->_vehicle;
  [(GKAgent *)self mass];
  v5.n128_f32[0] = v5.n128_f32[0] * maxAcceleration;
  double v6 = (void (*)(GKSimpleVehicle *, __n128))*((void *)p_vehicle->_vptr$AbstractLocalSpace + 29);

  v6(p_vehicle, v5);
}

- (float)maxSpeed
{
  (*((void (**)(void))self->_vehicle._vptr$AbstractLocalSpace + 30))();
  return result;
}

- (void)setMaxSpeed:(float)maxSpeed
{
}

- (double)position3
{
  uint64_t v1 = a1 + 40;
  unsigned int v5 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t))(*(void *)(a1 + 40) + 48))(a1 + 40));
  (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
  unsigned int v4 = v2;
  (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
  return COERCE_DOUBLE(__PAIR64__(v4, v5));
}

- (double)velocity3
{
  uint64_t v1 = a1 + 40;
  unsigned int v5 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t))(*(void *)(a1 + 40) + 192))(a1 + 40));
  (*(void (**)(uint64_t))(*(void *)v1 + 192))(v1);
  unsigned int v4 = v2;
  (*(void (**)(uint64_t))(*(void *)v1 + 192))(v1);
  return COERCE_DOUBLE(__PAIR64__(v4, v5));
}

- (float32x2_t)steerForSeek:(void *)a1
{
  uint64_t v2 = [a1 vehicle];
  float v3 = (*(float (**)(uint64_t))(*(void *)v2 + 48))(v2);
  float v5 = v4;
  float v6 = *(float *)&a2 - v3;
  if (v6 == 0.0) {
    float v6 = 0.00000011921;
  }
  float v10 = v6;
  v7.f32[0] = (*(float (**)(uint64_t))(*(void *)v2 + 192))(v2);
  v7.f32[1] = v5 + v8;
  return vsub_f32((float32x2_t)__PAIR64__(HIDWORD(a2), LODWORD(v10)), v7);
}

- (__n64)steerForFlee:(void *)a1
{
  uint64_t v2 = [a1 vehicle];
  float v3 = (*(float (**)(uint64_t))(*(void *)v2 + 48))(v2);
  float v5 = v4;
  float v6 = v3 - *(float *)&a2;
  if (v6 == 0.0) {
    float v7 = 0.00000011921;
  }
  else {
    float v7 = v6;
  }
  result.n64_f32[0] = v7 - (*(float (**)(uint64_t))(*(void *)v2 + 192))(v2);
  result.n64_f32[1] = v5 - (float)(*((float *)&a2 + 1) + v8);
  return result;
}

- (__n128)steerToAvoidObstacles:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __p = 0;
  v49 = 0;
  v50 = 0;
  unint64_t v7 = [v6 count];
  unint64_t v8 = v7;
  if (v7)
  {
    if (v7 >> 61) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    __p = operator new(8 * v7);
    v49 = (char *)__p;
    v50 = (char *)__p + 8 * v8;
  }
  v41 = a1;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) obstacle];
        uint64_t v14 = v13;
        v15 = v49;
        if (v49 < v50)
        {
          *(void *)v49 = v13;
          uint64_t v12 = (uint64_t)(v15 + 8);
          goto LABEL_8;
        }
        v16 = __p;
        int64_t v17 = v49 - (unsigned char *)__p;
        uint64_t v18 = (v49 - (unsigned char *)__p) >> 3;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v20 = v50 - (unsigned char *)__p;
        if ((v50 - (unsigned char *)__p) >> 2 > v19) {
          unint64_t v19 = v20 >> 2;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21)
        {
          if (v21 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v22 = operator new(8 * v21);
          v23 = (uint64_t *)&v22[8 * v18];
          uint64_t *v23 = v14;
          uint64_t v12 = (uint64_t)(v23 + 1);
          if (v15 == v16)
          {
LABEL_21:
            __p = v23;
            v49 = (char *)v12;
            v50 = &v22[8 * v21];
            if (v15) {
              goto LABEL_31;
            }
            goto LABEL_8;
          }
        }
        else
        {
          v22 = 0;
          v23 = (uint64_t *)(8 * v18);
          *(void *)(8 * v18) = v14;
          uint64_t v12 = 8 * v18 + 8;
          if (v15 == v16) {
            goto LABEL_21;
          }
        }
        unint64_t v24 = v15 - 8 - v16;
        if (v24 < 0x58) {
          goto LABEL_41;
        }
        if ((unint64_t)(v15 - &v22[v17]) < 0x20) {
          goto LABEL_41;
        }
        uint64_t v25 = (v24 >> 3) + 1;
        uint64_t v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
        v27 = &v15[-v26];
        v23 = (uint64_t *)((char *)v23 - v26);
        v28 = &v22[8 * v18 - 16];
        v29 = (long long *)(v15 - 16);
        uint64_t v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v31 = *v29;
          *(v28 - 1) = *(v29 - 1);
          _OWORD *v28 = v31;
          v28 -= 2;
          v29 -= 2;
          v30 -= 4;
        }
        while (v30);
        v15 = v27;
        if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            uint64_t v32 = *((void *)v15 - 1);
            v15 -= 8;
            *--v23 = v32;
          }
          while (v15 != v16);
        }
        v15 = __p;
        __p = v23;
        v49 = (char *)v12;
        v50 = &v22[8 * v21];
        if (v15) {
LABEL_31:
        }
          operator delete(v15);
LABEL_8:
        v49 = (char *)v12;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  uint64_t v33 = [v41 vehicle];
  float v34 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToAvoidObstacles(v33, (const void ***)&__p, v34);
  unsigned __int32 v42 = v35;
  unsigned __int32 v39 = v36;
  unsigned __int32 v40 = v37;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

  result.n128_u32[0] = v42;
  result.n128_u32[1] = v39;
  result.n128_u32[2] = v40;
  return result;
}

- (__n128)steerToAvoidAgents:(uint64_t)a3 timeBeforeCollisionToAvoid:(void *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __p = 0;
  v49 = 0;
  v50 = 0;
  unint64_t v7 = [v6 count];
  unint64_t v8 = v7;
  if (v7)
  {
    if (v7 >> 61) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    __p = operator new(8 * v7);
    v49 = (char *)__p;
    v50 = (char *)__p + 8 * v8;
  }
  v41 = a1;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) vehicle];
        uint64_t v14 = v13;
        v15 = v49;
        if (v49 < v50)
        {
          *(void *)v49 = v13;
          uint64_t v12 = (uint64_t)(v15 + 8);
          goto LABEL_8;
        }
        v16 = __p;
        int64_t v17 = v49 - (unsigned char *)__p;
        uint64_t v18 = (v49 - (unsigned char *)__p) >> 3;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v20 = v50 - (unsigned char *)__p;
        if ((v50 - (unsigned char *)__p) >> 2 > v19) {
          unint64_t v19 = v20 >> 2;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21)
        {
          if (v21 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v22 = operator new(8 * v21);
          v23 = (uint64_t *)&v22[8 * v18];
          uint64_t *v23 = v14;
          uint64_t v12 = (uint64_t)(v23 + 1);
          if (v15 == v16)
          {
LABEL_21:
            __p = v23;
            v49 = (char *)v12;
            v50 = &v22[8 * v21];
            if (v15) {
              goto LABEL_31;
            }
            goto LABEL_8;
          }
        }
        else
        {
          v22 = 0;
          v23 = (uint64_t *)(8 * v18);
          *(void *)(8 * v18) = v14;
          uint64_t v12 = 8 * v18 + 8;
          if (v15 == v16) {
            goto LABEL_21;
          }
        }
        unint64_t v24 = v15 - 8 - v16;
        if (v24 < 0x58) {
          goto LABEL_41;
        }
        if ((unint64_t)(v15 - &v22[v17]) < 0x20) {
          goto LABEL_41;
        }
        uint64_t v25 = (v24 >> 3) + 1;
        uint64_t v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
        v27 = &v15[-v26];
        v23 = (uint64_t *)((char *)v23 - v26);
        v28 = &v22[8 * v18 - 16];
        v29 = (long long *)(v15 - 16);
        uint64_t v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v31 = *v29;
          *(v28 - 1) = *(v29 - 1);
          _OWORD *v28 = v31;
          v28 -= 2;
          v29 -= 2;
          v30 -= 4;
        }
        while (v30);
        v15 = v27;
        if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            uint64_t v32 = *((void *)v15 - 1);
            v15 -= 8;
            *--v23 = v32;
          }
          while (v15 != v16);
        }
        v15 = __p;
        __p = v23;
        v49 = (char *)v12;
        v50 = &v22[8 * v21];
        if (v15) {
LABEL_31:
        }
          operator delete(v15);
LABEL_8:
        v49 = (char *)v12;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  uint64_t v33 = (float *)[v41 vehicle];
  float v34 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToAvoidNeighbors(v33, (uint64_t **)&__p, v34);
  unsigned __int32 v42 = v35;
  unsigned __int32 v39 = v36;
  unsigned __int32 v40 = v37;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }

  result.n128_u32[0] = v42;
  result.n128_u32[1] = v39;
  result.n128_u32[2] = v40;
  return result;
}

- (__n128)steerForSeparation:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  unint64_t v9 = [v8 count];
  unint64_t v10 = v9;
  if (v9)
  {
    if (v9 >> 61) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  unsigned __int32 v42 = a1;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v45 + 1) + 8 * i) vehicle];
        uint64_t v16 = v15;
        int64_t v17 = v50;
        if (v50 < v51)
        {
          *(void *)v50 = v15;
          uint64_t v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        uint64_t v18 = __p;
        int64_t v19 = v50 - (unsigned char *)__p;
        uint64_t v20 = (v50 - (unsigned char *)__p) >> 3;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v22 = v51 - (unsigned char *)__p;
        if ((v51 - (unsigned char *)__p) >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v24 = operator new(8 * v23);
          uint64_t v25 = (uint64_t *)&v24[8 * v20];
          *uint64_t v25 = v16;
          uint64_t v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17) {
              goto LABEL_31;
            }
            goto LABEL_8;
          }
        }
        else
        {
          unint64_t v24 = 0;
          uint64_t v25 = (uint64_t *)(8 * v20);
          *(void *)(8 * v20) = v16;
          uint64_t v14 = 8 * v20 + 8;
          if (v17 == v18) {
            goto LABEL_21;
          }
        }
        unint64_t v26 = v17 - 8 - v18;
        if (v26 < 0x58) {
          goto LABEL_41;
        }
        if ((unint64_t)(v17 - &v24[v19]) < 0x20) {
          goto LABEL_41;
        }
        uint64_t v27 = (v26 >> 3) + 1;
        uint64_t v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        uint64_t v25 = (uint64_t *)((char *)v25 - v28);
        uint64_t v30 = &v24[8 * v20 - 16];
        long long v31 = (long long *)(v17 - 16);
        uint64_t v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *uint64_t v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        int64_t v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            uint64_t v34 = *((void *)v17 - 1);
            v17 -= 8;
            *--uint64_t v25 = v34;
          }
          while (v17 != v18);
        }
        int64_t v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17) {
LABEL_31:
        }
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }

  uint64_t v35 = [v42 vehicle];
  float v36 = cosf(a3);
  float v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForSeparation(v35, (uint64_t **)&__p, a2, v36);
  unsigned __int32 v40 = v37;
  unsigned __int32 v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (__n128)steerForAlignment:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  unint64_t v9 = [v8 count];
  unint64_t v10 = v9;
  if (v9)
  {
    if (v9 >> 61) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  unsigned __int32 v42 = a1;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v45 + 1) + 8 * i) vehicle];
        uint64_t v16 = v15;
        int64_t v17 = v50;
        if (v50 < v51)
        {
          *(void *)v50 = v15;
          uint64_t v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        uint64_t v18 = __p;
        int64_t v19 = v50 - (unsigned char *)__p;
        uint64_t v20 = (v50 - (unsigned char *)__p) >> 3;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v22 = v51 - (unsigned char *)__p;
        if ((v51 - (unsigned char *)__p) >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v24 = operator new(8 * v23);
          uint64_t v25 = (uint64_t *)&v24[8 * v20];
          *uint64_t v25 = v16;
          uint64_t v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17) {
              goto LABEL_31;
            }
            goto LABEL_8;
          }
        }
        else
        {
          unint64_t v24 = 0;
          uint64_t v25 = (uint64_t *)(8 * v20);
          *(void *)(8 * v20) = v16;
          uint64_t v14 = 8 * v20 + 8;
          if (v17 == v18) {
            goto LABEL_21;
          }
        }
        unint64_t v26 = v17 - 8 - v18;
        if (v26 < 0x58) {
          goto LABEL_41;
        }
        if ((unint64_t)(v17 - &v24[v19]) < 0x20) {
          goto LABEL_41;
        }
        uint64_t v27 = (v26 >> 3) + 1;
        uint64_t v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        uint64_t v25 = (uint64_t *)((char *)v25 - v28);
        uint64_t v30 = &v24[8 * v20 - 16];
        long long v31 = (long long *)(v17 - 16);
        uint64_t v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *uint64_t v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        int64_t v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            uint64_t v34 = *((void *)v17 - 1);
            v17 -= 8;
            *--uint64_t v25 = v34;
          }
          while (v17 != v18);
        }
        int64_t v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17) {
LABEL_31:
        }
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }

  uint64_t v35 = [v42 vehicle];
  float v36 = cosf(a3);
  float v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForAlignment(v35, (uint64_t **)&__p, a2, v36);
  unsigned __int32 v40 = v37;
  unsigned __int32 v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (__n128)steerForCohesion:(float)a3 maxDistance:(uint64_t)a4 maxAngle:(void *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a5;
  __p = 0;
  v50 = 0;
  v51 = 0;
  unint64_t v9 = [v8 count];
  unint64_t v10 = v9;
  if (v9)
  {
    if (v9 >> 61) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    __p = operator new(8 * v9);
    v50 = (char *)__p;
    v51 = (char *)__p + 8 * v10;
  }
  unsigned __int32 v42 = a1;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v45 + 1) + 8 * i) vehicle];
        uint64_t v16 = v15;
        int64_t v17 = v50;
        if (v50 < v51)
        {
          *(void *)v50 = v15;
          uint64_t v14 = (uint64_t)(v17 + 8);
          goto LABEL_8;
        }
        uint64_t v18 = __p;
        int64_t v19 = v50 - (unsigned char *)__p;
        uint64_t v20 = (v50 - (unsigned char *)__p) >> 3;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        uint64_t v22 = v51 - (unsigned char *)__p;
        if ((v51 - (unsigned char *)__p) >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v24 = operator new(8 * v23);
          uint64_t v25 = (uint64_t *)&v24[8 * v20];
          *uint64_t v25 = v16;
          uint64_t v14 = (uint64_t)(v25 + 1);
          if (v17 == v18)
          {
LABEL_21:
            __p = v25;
            v50 = (char *)v14;
            v51 = &v24[8 * v23];
            if (v17) {
              goto LABEL_31;
            }
            goto LABEL_8;
          }
        }
        else
        {
          unint64_t v24 = 0;
          uint64_t v25 = (uint64_t *)(8 * v20);
          *(void *)(8 * v20) = v16;
          uint64_t v14 = 8 * v20 + 8;
          if (v17 == v18) {
            goto LABEL_21;
          }
        }
        unint64_t v26 = v17 - 8 - v18;
        if (v26 < 0x58) {
          goto LABEL_41;
        }
        if ((unint64_t)(v17 - &v24[v19]) < 0x20) {
          goto LABEL_41;
        }
        uint64_t v27 = (v26 >> 3) + 1;
        uint64_t v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v17[-v28];
        uint64_t v25 = (uint64_t *)((char *)v25 - v28);
        uint64_t v30 = &v24[8 * v20 - 16];
        long long v31 = (long long *)(v17 - 16);
        uint64_t v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v33 = *v31;
          *(v30 - 1) = *(v31 - 1);
          *uint64_t v30 = v33;
          v30 -= 2;
          v31 -= 2;
          v32 -= 4;
        }
        while (v32);
        int64_t v17 = v29;
        if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_41:
          do
          {
            uint64_t v34 = *((void *)v17 - 1);
            v17 -= 8;
            *--uint64_t v25 = v34;
          }
          while (v17 != v18);
        }
        int64_t v17 = __p;
        __p = v25;
        v50 = (char *)v14;
        v51 = &v24[8 * v23];
        if (v17) {
LABEL_31:
        }
          operator delete(v17);
LABEL_8:
        v50 = (char *)v14;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }

  uint64_t v35 = [v42 vehicle];
  float v36 = cosf(a3);
  float v43 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForCohesion(v35, (uint64_t **)&__p, a2, v36);
  unsigned __int32 v40 = v37;
  unsigned __int32 v41 = v38;
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }

  result.n128_f32[0] = v43;
  result.n128_u32[1] = v40;
  result.n128_u32[2] = v41;
  return result;
}

- (float32x2_t)steerForTargetSpeed:(void *)a1
{
  uint64_t v3 = [a1 vehicle];
  float v4 = (*(float (**)(uint64_t))(*(void *)v3 + 224))(v3);
  float v5 = a2 - (*(float (**)(uint64_t))(*(void *)v3 + 200))(v3);
  (*(void (**)(uint64_t))(*(void *)v3 + 32))(v3);
  float v6 = fminf(v5, v4);
  v8.i32[1] = v7;
  if (v5 >= (float)-v4) {
    float v9 = v6;
  }
  else {
    float v9 = -v4;
  }
  return vmul_n_f32(v8, v9);
}

- (__n64)steerForWander:(float)a3 speed:
{
  float v5 = (float *)[a1 vehicle];
  float v6 = a2;
  float v7 = v6 * a3;
  v5[14] = fmaxf(fminf(v5[14] - (float)(v7 - (float)((float)((float)rand() * 9.3132e-10) * v7)), 1.0), -1.0);
  v5[15] = fmaxf(fminf(v5[15] - (float)(v7 - (float)((float)((float)rand() * 9.3132e-10) * v7)), 1.0), -1.0);
  float v8 = (**(float (***)(float *))v5)(v5);
  float v9 = v5[14];
  float v10 = v8 * v9;
  *(float *)&a2 = v11 * v9;
  float v12 = (*(float (**)(float *))(*(void *)v5 + 16))(v5);
  float v13 = v5[15];
  result.n64_f32[0] = v10 + (float)(v12 * v13);
  result.n64_f32[1] = *(float *)&a2 + (float)(v14 * v13);
  return result;
}

- (__n128)steerForIntercept:(uint64_t)a3 maxPredictionTime:(void *)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 vehicle];
  uint64_t v8 = [v6 vehicle];
  float v9 = a2;
  float v15 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerForPursuit(v7, v8, v9);
  unsigned __int32 v13 = v10;
  unsigned __int32 v14 = v11;

  result.n128_f32[0] = v15;
  result.n128_u32[1] = v13;
  result.n128_u32[2] = v14;
  return result;
}

- (__n128)steerToFollowPath:(uint64_t)a3 maxPredictionTime:(void *)a4 forward:(int)a5
{
  id v8 = a4;
  if (a5) {
    int v9 = 1;
  }
  else {
    int v9 = -1;
  }
  uint64_t v10 = [a1 vehicle];
  uint64_t v11 = [v8 pathway];
  float v12 = a2;
  OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToFollowPath(v10, v9, v11, v12);
  unsigned __int32 v19 = v13;
  unsigned __int32 v17 = v14;
  unsigned __int32 v18 = v15;

  result.n128_u32[0] = v19;
  result.n128_u32[1] = v17;
  result.n128_u32[2] = v18;
  return result;
}

- (__n128)steerToStayOnPath:(void *)a3 maxPredictionTime:
{
  id v4 = a3;
  float v10 = OpenSteer::SteerLibraryMixin<OpenSteer::LocalSpaceMixin<OpenSteer::AbstractVehicle>>::steerToStayOnPath([a1 vehicle], (float (***)(void, _DWORD *, uint64_t *, float *))objc_msgSend(v4, "pathway"));
  unsigned __int32 v8 = v5;
  unsigned __int32 v9 = v6;

  result.n128_f32[0] = v10;
  result.n128_u32[1] = v8;
  result.n128_u32[2] = v9;
  return result;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (GKBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(GKBehavior *)behavior
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_delegate);

  OpenSteer::SimpleVehicle::~SimpleVehicle((OpenSteer::SimpleVehicle *)&self->_vehicle);
}

- (id).cxx_construct
{
  *(void *)OpenSteer::SimpleVehicle::SimpleVehicle((OpenSteer::SimpleVehicle *)&self->_vehicle) = &unk_26E942F10;
  return self;
}

@end