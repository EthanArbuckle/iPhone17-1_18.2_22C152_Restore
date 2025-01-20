@interface ARCoachingSessionCache
- (ARCoachingSessionCache)init;
- (BOOL)hasAnyPlane:(id)a3;
- (BOOL)hasHorizontalPlane:(id)a3;
- (BOOL)hasVerticalPlane:(id)a3;
- (void)anchorsAdded:(id)a3;
- (void)anchorsRemoved:(id)a3;
- (void)clear;
- (void)initializePlaneCache:(id)a3;
- (void)removeFromPlaneCache:(id)a3;
- (void)sessionChanged;
- (void)updatePlaneCache:(id)a3;
@end

@implementation ARCoachingSessionCache

- (ARCoachingSessionCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARCoachingSessionCache;
  v2 = [(ARCoachingSessionCache *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ARCoachingSessionCache *)v2 clear];
  }
  return v3;
}

- (void)clear
{
  self->_planeCount = 0;
  self->_horizontalPlaneCount = 0;
  self->_planeCacheInitialized = 0;
  self->_verticalPlaneCount = 0;
}

- (void)anchorsAdded:(id)a3
{
  if (self->_planeCacheInitialized) {
    [(ARCoachingSessionCache *)self updatePlaneCache:a3];
  }
}

- (void)anchorsRemoved:(id)a3
{
  if (self->_planeCacheInitialized) {
    [(ARCoachingSessionCache *)self removeFromPlaneCache:a3];
  }
}

- (void)sessionChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _ARLogCoaching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    v7 = v5;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Clearing cached anchors info after session change", (uint8_t *)&v6, 0x16u);
  }
  [(ARCoachingSessionCache *)self clear];
}

- (BOOL)hasAnyPlane:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      objc_super v5 = _ARLogCoaching();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v10 = 138543618;
        v11 = v7;
        __int16 v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for any planes", (uint8_t *)&v10, 0x16u);
      }
      [(ARCoachingSessionCache *)self initializePlaneCache:v4];
    }
    BOOL v8 = self->_planeCount > 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasHorizontalPlane:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      objc_super v5 = _ARLogCoaching();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v10 = 138543618;
        v11 = v7;
        __int16 v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for horizontal planes", (uint8_t *)&v10, 0x16u);
      }
      [(ARCoachingSessionCache *)self initializePlaneCache:v4];
    }
    BOOL v8 = self->_horizontalPlaneCount > 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasVerticalPlane:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (!self->_planeCacheInitialized)
    {
      objc_super v5 = _ARLogCoaching();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v10 = 138543618;
        v11 = v7;
        __int16 v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Searching frame for vertical planes", (uint8_t *)&v10, 0x16u);
      }
      [(ARCoachingSessionCache *)self initializePlaneCache:v4];
    }
    BOOL v8 = self->_verticalPlaneCount > 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)initializePlaneCache:(id)a3
{
  id v4 = [a3 anchors];
  [(ARCoachingSessionCache *)self updatePlaneCache:v4];

  self->_planeCacheInitialized = 1;
}

- (void)updatePlaneCache:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__ARCoachingSessionCache_updatePlaneCache___block_invoke;
  v3[3] = &unk_264000A08;
  v3[4] = self;
  ARCoachingEnumeratePlaneAnchors(a3, v3);
}

uint64_t __43__ARCoachingSessionCache_updatePlaneCache___block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = [a2 alignment];
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v4 = 24;
  }
  else
  {
    uint64_t v4 = 16;
  }
  ++*(void *)(*(void *)(a1 + 32) + v4);
  return result;
}

- (void)removeFromPlaneCache:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__ARCoachingSessionCache_removeFromPlaneCache___block_invoke;
  v3[3] = &unk_264000A08;
  v3[4] = self;
  ARCoachingEnumeratePlaneAnchors(a3, v3);
}

uint64_t __47__ARCoachingSessionCache_removeFromPlaneCache___block_invoke(uint64_t a1, void *a2)
{
  --*(void *)(*(void *)(a1 + 32) + 8);
  uint64_t result = [a2 alignment];
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v4 = 24;
  }
  else
  {
    uint64_t v4 = 16;
  }
  --*(void *)(*(void *)(a1 + 32) + v4);
  return result;
}

@end