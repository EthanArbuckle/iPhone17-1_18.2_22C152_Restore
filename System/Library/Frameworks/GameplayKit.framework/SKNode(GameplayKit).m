@interface SKNode(GameplayKit)
+ (id)obstaclesFromNodeBounds:()GameplayKit;
+ (id)obstaclesFromNodePhysicsBodies:()GameplayKit;
+ (id)obstaclesFromSpriteTextures:()GameplayKit accuracy:;
@end

@implementation SKNode(GameplayKit)

+ (id)obstaclesFromSpriteTextures:()GameplayKit accuracy:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __p = 0;
  v29 = 0;
  unint64_t v30 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, [v5 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = 0;
          v23 = 0;
          *(float *)&double v12 = a1;
          if ([v11 _pathFromTextureToPoints:&v23 outSize:&v22 accuracy:v12])
          {
            if (v22)
            {
              v13 = +[GKPolygonObstacle obstacleWithPoints:count:](GKPolygonObstacle, "obstacleWithPoints:count:", v23);
              id v21 = v13;
              v14 = v29;
              if ((unint64_t)v29 < v30)
              {
                *(void *)v14 = v13;
                v10 = v14 + 8;
              }
              else
              {
                v10 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v21);
              }
              v29 = v10;
            }
            free(v23);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v7);
  }

  v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v29;
    v18 = __p;
    if (v29 != __p)
    {
      do
      {
        v19 = (void *)*((void *)v17 - 1);
        v17 -= 8;
      }
      while (v17 != v16);
      v18 = __p;
    }
    v29 = v16;
    operator delete(v18);
  }

  return v15;
}

+ (id)obstaclesFromNodeBounds:()GameplayKit
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __p = 0;
  long long v27 = 0;
  unint64_t v28 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, [v3 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) globalBoundingVerts];
        *((void *)&v9 + 1) = v8;
        *((void *)&v11 + 1) = v10;
        v29[0] = v9;
        v29[1] = v11;
        double v12 = +[GKPolygonObstacle obstacleWithPoints:v29 count:4];
        id v21 = v12;
        v13 = v27;
        if ((unint64_t)v27 >= v28)
        {
          v14 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v21);
        }
        else
        {
          *(void *)v13 = v12;
          v14 = v13 + 8;
        }
        long long v27 = v14;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v5);
  }

  v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v27;
    v18 = __p;
    if (v27 != __p)
    {
      do
      {
        v19 = (void *)*((void *)v17 - 1);
        v17 -= 8;
      }
      while (v17 != v16);
      v18 = __p;
    }
    long long v27 = v16;
    operator delete(v18);
  }

  return v15;
}

+ (id)obstaclesFromNodePhysicsBodies:()GameplayKit
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  __p = 0;
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, [v3 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v9 physicsBody];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          uint64_t v21 = 0;
          long long v22 = 0;
          if ([v9 _pathFromPhysicsBodyToPoints:&v22 outSize:&v21])
          {
            if (v21)
            {
              double v12 = +[GKPolygonObstacle obstacleWithPoints:count:](GKPolygonObstacle, "obstacleWithPoints:count:", v22);
              id v20 = v12;
              v13 = v28;
              if ((unint64_t)v28 < v29)
              {
                *(void *)v13 = v12;
                uint64_t v8 = v13 + 8;
              }
              else
              {
                uint64_t v8 = (char *)std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(&__p, &v20);
              }
              unint64_t v28 = v8;
            }
            free(v22);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v5);
  }

  v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v15 = (char *)__p;
  if (__p)
  {
    v16 = v28;
    v17 = __p;
    if (v28 != __p)
    {
      do
      {
        v18 = (void *)*((void *)v16 - 1);
        v16 -= 8;
      }
      while (v16 != v15);
      v17 = __p;
    }
    unint64_t v28 = v15;
    operator delete(v17);
  }

  return v14;
}

@end