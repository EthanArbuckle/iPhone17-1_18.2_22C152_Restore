@interface ARTrackedRaycast
- (ARRaycastQuery)trackedQuery;
- (ARTrackedRaycast)initWithIdentifier:(id)a3 ray:(id)a4 worldTrackingTechnique:(id)a5 updateHandler:(id)a6;
- (ARWorldTrackingTechnique)attachedWorldTrackingTechnique;
- (NSUUID)identifier;
- (id)description;
- (id)query;
- (id)updateHandler;
- (void)setAttachedWorldTrackingTechnique:(id)a3;
- (void)setTrackedQuery:(id)a3;
- (void)stopTracking;
@end

@implementation ARTrackedRaycast

- (ARTrackedRaycast)initWithIdentifier:(id)a3 ray:(id)a4 worldTrackingTechnique:(id)a5 updateHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ARTrackedRaycast;
  v15 = [(ARTrackedRaycast *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_trackedQuery, a4);
    uint64_t v17 = MEMORY[0x1BA9C63E0](v14);
    id updateHandler = v16->_updateHandler;
    v16->_id updateHandler = (id)v17;

    objc_storeWeak((id *)&v16->_attachedWorldTrackingTechnique, v13);
  }

  return v16;
}

- (id)query
{
  return self->_trackedQuery;
}

- (void)stopTracking
{
  v3 = [(ARTrackedRaycast *)self attachedWorldTrackingTechnique];

  if (v3)
  {
    v4 = [(ARTrackedRaycast *)self attachedWorldTrackingTechnique];
    [v4 stopRaycast:self];

    [(ARTrackedRaycast *)self setAttachedWorldTrackingTechnique:0];
  }
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ARTrackedRaycast *)self query];
  v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"<%@: %p ray=%@>", v5, self, v7];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (ARWorldTrackingTechnique)attachedWorldTrackingTechnique
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachedWorldTrackingTechnique);
  return (ARWorldTrackingTechnique *)WeakRetained;
}

- (void)setAttachedWorldTrackingTechnique:(id)a3
{
}

- (ARRaycastQuery)trackedQuery
{
  return (ARRaycastQuery *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTrackedQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedQuery, 0);
  objc_destroyWeak((id *)&self->_attachedWorldTrackingTechnique);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end