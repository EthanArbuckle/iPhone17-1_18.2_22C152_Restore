@interface GKGoal
+ (GKGoal)goalToAlignWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle;
+ (GKGoal)goalToAvoidAgents:(NSArray *)agents maxPredictionTime:(NSTimeInterval)maxPredictionTime;
+ (GKGoal)goalToAvoidObstacles:(NSArray *)obstacles maxPredictionTime:(NSTimeInterval)maxPredictionTime;
+ (GKGoal)goalToCohereWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle;
+ (GKGoal)goalToFleeAgent:(GKAgent *)agent;
+ (GKGoal)goalToFollowPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime forward:(BOOL)forward;
+ (GKGoal)goalToInterceptAgent:(GKAgent *)target maxPredictionTime:(NSTimeInterval)maxPredictionTime;
+ (GKGoal)goalToReachTargetSpeed:(float)targetSpeed;
+ (GKGoal)goalToSeekAgent:(GKAgent *)agent;
+ (GKGoal)goalToSeparateFromAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle;
+ (GKGoal)goalToStayOnPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime;
+ (GKGoal)goalToWander:(float)speed;
- (BOOL)isTargetSpeedGoal;
- (GKGoal)init;
- (__n128)getForce:(uint64_t)a3 agent:(void *)a4;
- (float)speed;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initToAlignWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5;
- (id)initToAvoidAgents:(id)a3 maxPredictionTime:(double)a4;
- (id)initToAvoidObstacles:(id)a3 maxPredictionTime:(double)a4;
- (id)initToCohereWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5;
- (id)initToFleeAgent:(id)a3;
- (id)initToFollowPath:(id)a3 maxPredictionTime:(double)a4 forward:(BOOL)a5;
- (id)initToInterceptAgent:(id)a3 maxPredictionTime:(double)a4;
- (id)initToReachTargetSpeed:(float)a3;
- (id)initToSeekAgent:(id)a3;
- (id)initToSeparateFromAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5;
- (id)initToStayOnPath:(id)a3 maxPredictionTime:(double)a4;
- (id)initToWander:(float)a3;
@end

@implementation GKGoal

- (GKGoal)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKGoal;
  v2 = [(GKGoal *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    path = v2->_path;
    v2->_path = 0;

    obstacles = v3->_obstacles;
    v3->_obstacles = 0;

    agents = v3->_agents;
    v3->_agents = 0;
  }
  return v3;
}

+ (GKGoal)goalToSeekAgent:(GKAgent *)agent
{
  v3 = agent;
  id v4 = [[GKGoal alloc] initToSeekAgent:v3];

  return (GKGoal *)v4;
}

- (id)initToSeekAgent:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGoal;
  v5 = [(GKGoal *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    agents = v6->_agents;
    v6->_agents = (NSArray *)v7;
  }
  return v6;
}

+ (GKGoal)goalToFleeAgent:(GKAgent *)agent
{
  v3 = agent;
  id v4 = [[GKGoal alloc] initToFleeAgent:v3];

  return (GKGoal *)v4;
}

- (id)initToFleeAgent:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGoal;
  v5 = [(GKGoal *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    v11[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    agents = v6->_agents;
    v6->_agents = (NSArray *)v7;
  }
  return v6;
}

+ (GKGoal)goalToAvoidObstacles:(NSArray *)obstacles maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  v5 = obstacles;
  id v6 = [[GKGoal alloc] initToAvoidObstacles:v5 maxPredictionTime:maxPredictionTime];

  return (GKGoal *)v6;
}

- (id)initToAvoidObstacles:(id)a3 maxPredictionTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  objc_super v8 = [(GKGoal *)&v11 init];
  v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 3;
    objc_storeStrong((id *)&v8->_obstacles, a3);
    v9[5] = a4;
  }

  return v9;
}

+ (GKGoal)goalToAvoidAgents:(NSArray *)agents maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  v5 = agents;
  id v6 = [[GKGoal alloc] initToAvoidAgents:v5 maxPredictionTime:maxPredictionTime];

  return (GKGoal *)v6;
}

- (id)initToAvoidAgents:(id)a3 maxPredictionTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  objc_super v8 = [(GKGoal *)&v11 init];
  v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 4;
    objc_storeStrong((id *)&v8->_agents, a3);
    v9[5] = a4;
  }

  return v9;
}

+ (GKGoal)goalToSeparateFromAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  id v7 = agents;
  objc_super v8 = [GKGoal alloc];
  *(float *)&double v9 = maxDistance;
  *(float *)&double v10 = maxAngle;
  id v11 = [(GKGoal *)v8 initToSeparateFromAgents:v7 maxDistance:v9 maxAngle:v10];

  return (GKGoal *)v11;
}

- (id)initToSeparateFromAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  double v10 = [(GKGoal *)&v13 init];
  id v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 5;
    objc_storeStrong((id *)&v10->_agents, a3);
    v11[12] = a5;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToAlignWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  id v7 = agents;
  objc_super v8 = [GKGoal alloc];
  *(float *)&double v9 = maxDistance;
  *(float *)&double v10 = maxAngle;
  id v11 = [(GKGoal *)v8 initToAlignWithAgents:v7 maxDistance:v9 maxAngle:v10];

  return (GKGoal *)v11;
}

- (id)initToAlignWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKGoal;
  double v10 = [(GKGoal *)&v14 init];
  id v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 6;
    objc_storeStrong((id *)&v10->_agents, a3);
    float v12 = fabsf(a5);
    if (v12 > 3.14159265) {
      float v12 = 3.1416;
    }
    v11[12] = v12;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToCohereWithAgents:(NSArray *)agents maxDistance:(float)maxDistance maxAngle:(float)maxAngle
{
  id v7 = agents;
  objc_super v8 = [GKGoal alloc];
  *(float *)&double v9 = maxDistance;
  *(float *)&double v10 = maxAngle;
  id v11 = [(GKGoal *)v8 initToCohereWithAgents:v7 maxDistance:v9 maxAngle:v10];

  return (GKGoal *)v11;
}

- (id)initToCohereWithAgents:(id)a3 maxDistance:(float)a4 maxAngle:(float)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  double v10 = [(GKGoal *)&v13 init];
  id v11 = (float *)v10;
  if (v10)
  {
    v10->_type = 7;
    objc_storeStrong((id *)&v10->_agents, a3);
    v11[12] = a5;
    v11[13] = a4;
  }

  return v11;
}

+ (GKGoal)goalToReachTargetSpeed:(float)targetSpeed
{
  id v4 = [GKGoal alloc];
  *(float *)&double v5 = targetSpeed;
  id v6 = [(GKGoal *)v4 initToReachTargetSpeed:v5];

  return (GKGoal *)v6;
}

- (id)initToReachTargetSpeed:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKGoal;
  id result = [(GKGoal *)&v5 init];
  if (result)
  {
    *((_DWORD *)result + 2) = 8;
    *((float *)result + 14) = a3;
  }
  return result;
}

+ (GKGoal)goalToWander:(float)speed
{
  id v4 = [GKGoal alloc];
  *(float *)&double v5 = speed;
  id v6 = [(GKGoal *)v4 initToWander:v5];

  return (GKGoal *)v6;
}

- (id)initToWander:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKGoal;
  id result = [(GKGoal *)&v5 init];
  if (result)
  {
    *((_DWORD *)result + 2) = 9;
    *((float *)result + 14) = a3;
  }
  return result;
}

+ (GKGoal)goalToInterceptAgent:(GKAgent *)target maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  objc_super v5 = target;
  id v6 = [[GKGoal alloc] initToInterceptAgent:v5 maxPredictionTime:maxPredictionTime];

  return (GKGoal *)v6;
}

- (id)initToInterceptAgent:(id)a3 maxPredictionTime:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKGoal;
  id v7 = [(GKGoal *)&v12 init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_type = 10;
    v13[0] = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    agents = v8->_agents;
    v8->_agents = (NSArray *)v9;

    v8->_time = a4;
  }

  return v8;
}

+ (GKGoal)goalToFollowPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime forward:(BOOL)forward
{
  BOOL v5 = forward;
  id v7 = path;
  id v8 = [[GKGoal alloc] initToFollowPath:v7 maxPredictionTime:v5 forward:maxPredictionTime];

  return (GKGoal *)v8;
}

- (id)initToFollowPath:(id)a3 maxPredictionTime:(double)a4 forward:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKGoal;
  double v10 = [(GKGoal *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    v10->_type = 11;
    objc_storeStrong((id *)&v10->_path, a3);
    v11->_time = a4;
    v11->_forward = a5;
  }

  return v11;
}

+ (GKGoal)goalToStayOnPath:(GKPath *)path maxPredictionTime:(NSTimeInterval)maxPredictionTime
{
  BOOL v5 = path;
  id v6 = [[GKGoal alloc] initToStayOnPath:v5 maxPredictionTime:maxPredictionTime];

  return (GKGoal *)v6;
}

- (id)initToStayOnPath:(id)a3 maxPredictionTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKGoal;
  id v8 = [(GKGoal *)&v11 init];
  id v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 12;
    objc_storeStrong((id *)&v8->_path, a3);
    v9[5] = a4;
  }

  return v9;
}

- (__n128)getForce:(uint64_t)a3 agent:(void *)a4
{
  id v6 = a4;
  id v9 = v6;
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      double v10 = [*(id *)(a1 + 32) firstObject];
      [v10 position3];
      objc_msgSend(v9, "steerForSeek:");
      goto LABEL_10;
    case 2:
      double v10 = [*(id *)(a1 + 32) firstObject];
      [v10 position3];
      objc_msgSend(v9, "steerForFlee:");
LABEL_10:
      long long v16 = v11;

      goto LABEL_18;
    case 3:
      [v6 steerToAvoidObstacles:*(void *)(a1 + 24) timeBeforeCollisionToAvoid:*(double *)(a1 + 40)];
      goto LABEL_17;
    case 4:
      [v6 steerToAvoidAgents:*(void *)(a1 + 32) timeBeforeCollisionToAvoid:*(double *)(a1 + 40)];
      goto LABEL_17;
    case 5:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      [v6 steerForSeparation:*(void *)(a1 + 32) maxDistance:v7 maxAngle:v8];
      goto LABEL_17;
    case 6:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      [v6 steerForAlignment:*(void *)(a1 + 32) maxDistance:v7 maxAngle:v8];
      goto LABEL_17;
    case 7:
      LODWORD(v8) = *(_DWORD *)(a1 + 48);
      LODWORD(v7) = *(_DWORD *)(a1 + 52);
      [v6 steerForCohesion:*(void *)(a1 + 32) maxDistance:v7 maxAngle:v8];
      goto LABEL_17;
    case 8:
      long long v16 = 0u;
      if (*(float *)(a1 + 56) <= 1.0) {
        goto LABEL_18;
      }
      objc_msgSend(v6, "steerForTargetSpeed:");
LABEL_17:
      long long v16 = v12;
LABEL_18:

      return (__n128)v16;
    case 9:
      LODWORD(v8) = *(_DWORD *)(a1 + 56);
      [v6 steerForWander:a2 speed:v8];
      goto LABEL_17;
    case 0xA:
      objc_super v13 = [*(id *)(a1 + 32) firstObject];
      [v9 steerForIntercept:v13 maxPredictionTime:*(double *)(a1 + 40)];
      long long v16 = v14;

      goto LABEL_18;
    case 0xB:
      [v6 steerToFollowPath:*(void *)(a1 + 16) maxPredictionTime:*(unsigned __int8 *)(a1 + 60) forward:*(double *)(a1 + 40)];
      goto LABEL_17;
    case 0xC:
      [v6 steerToStayOnPath:*(void *)(a1 + 16) maxPredictionTime:*(double *)(a1 + 40)];
      goto LABEL_17;
    default:
      long long v12 = 0uLL;
      goto LABEL_17;
  }
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKGoal *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GKGoal);
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_path, self->_path);
  objc_storeStrong((id *)&v4->_obstacles, self->_obstacles);
  objc_storeStrong((id *)&v4->_agents, self->_agents);
  v4->_time = self->_time;
  v4->_angle = self->_angle;
  v4->_distance = self->_distance;
  v4->_speed = self->_speed;
  v4->_forward = self->_forward;
  return v4;
}

- (float)speed
{
  return self->_speed;
}

- (BOOL)isTargetSpeedGoal
{
  return self->_type == 8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_obstacles, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end