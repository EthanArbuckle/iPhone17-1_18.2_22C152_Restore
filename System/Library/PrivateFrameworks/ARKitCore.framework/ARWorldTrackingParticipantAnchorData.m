@interface ARWorldTrackingParticipantAnchorData
- (ARWorldTrackingParticipantAnchorData)initWithAnchors:(id)a3;
- (NSSet)anchors;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
@end

@implementation ARWorldTrackingParticipantAnchorData

- (ARWorldTrackingParticipantAnchorData)initWithAnchors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARWorldTrackingParticipantAnchorData;
  v5 = [(ARWorldTrackingParticipantAnchorData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    anchors = v5->_anchors;
    v5->_anchors = (NSSet *)v6;
  }
  return v5;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v10 = [a1 anchors];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v15 transform];
        uint64_t v16 = 0;
        v32[0] = v17;
        v32[1] = v18;
        v32[2] = v19;
        v32[3] = v20;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        *(_OWORD *)v36 = 0u;
        do
        {
          *(long long *)((char *)&v33 + v16 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(v32[v16])), a7, *(float32x2_t *)&v32[v16], 1), a8, (float32x4_t)v32[v16], 2), a9, (float32x4_t)v32[v16], 3);
          ++v16;
        }
        while (v16 != 4);
        objc_msgSend(v15, "setTransform:", *(double *)&v33, *(double *)&v34, *(double *)&v35, v36[0]);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }

  v21 = [a1 anchors];
  v22 = [v21 allObjects];

  return v22;
}

- (NSSet)anchors
{
  return self->_anchors;
}

- (void).cxx_destruct
{
}

@end