@interface _GCXRComponent
+ (id)componentWithPhysicalInputProfile:(id)a3;
- (NSMutableDictionary)handSkeletons;
- (NSObject)identifier;
- (_GCXRComponent)initWithIdentifier:(id)a3;
- (void)setController:(id)a3;
- (void)setHandSkeletons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)updateSkeletons;
@end

@implementation _GCXRComponent

- (_GCXRComponent)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCXRComponent;
  v5 = [(_GCXRComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (void)setController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_controller, obj);
    v5 = [obj physicalInputProfile];
    physicalInput = self->_physicalInput;
    self->_physicalInput = v5;

    [(_GCXRComponent *)self updateSkeletons];
  }
}

+ (id)componentWithPhysicalInputProfile:(id)a3
{
  id v4 = a3;
  v5 = [v4 buttons];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"XRPropertyButtonFingerRing"];

  if (v6)
  {
    v7 = [_GCXRComponent alloc];
    v8 = +[NSUUID UUID];
    uint64_t v9 = [(_GCXRComponent *)v7 initWithIdentifier:v8];

    if (v9)
    {
      objc_storeStrong((id *)(v9 + 24), a3);
      uint64_t v10 = +[NSMutableDictionary dictionary];
      v11 = *(void **)(v9 + 48);
      *(void *)(v9 + 48) = v10;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (id)v9;
}

- (void)updateSkeletons
{
  [(NSMutableDictionary *)self->_handSkeletons removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  id v4 = [WeakRetained _componentWithProtocol:&unk_26D2B45B8];

  if (v4)
  {
    uint64_t v5 = [v4 handedness];
  }
  else
  {
    uint64_t v6 = [(GCPhysicalInputProfile *)self->_physicalInput buttons];
    v7 = [v6 objectForKeyedSubscript:@"GCPropertyValueHandedness"];

    if (v7)
    {
      [v7 value];
      uint64_t v5 = (uint64_t)v8;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ((v5 | 2) == 3)
  {
    uint64_t v9 = [_GCHandSkeleton alloc];
    physicalInput = self->_physicalInput;
    memcpy(v18, &kGCBoneDataRestingLeft, sizeof(v18));
    v11 = [(_GCHandSkeleton *)v9 initWithBoneData:v18 profile:physicalInput handedness:1];
    p_leftHandSkeleton = &self->_leftHandSkeleton;
    leftHandSkeleton = self->_leftHandSkeleton;
    self->_leftHandSkeleton = v11;

    [(NSMutableDictionary *)self->_handSkeletons setValue:self->_leftHandSkeleton forKey:@"GCHandSkeletonLeft"];
    if (v5 == 1) {
      goto LABEL_11;
    }
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v14 = [_GCHandSkeleton alloc];
    v15 = self->_physicalInput;
    memcpy(v18, &kGCBoneDataRestingRight, sizeof(v18));
    v16 = [(_GCHandSkeleton *)v14 initWithBoneData:v18 profile:v15 handedness:2];
    p_leftHandSkeleton = &self->_rightHandSkeleton;
    rightHandSkeleton = self->_rightHandSkeleton;
    self->_rightHandSkeleton = v16;

    [(NSMutableDictionary *)self->_handSkeletons setValue:self->_rightHandSkeleton forKey:@"GCHandSkeletonRight"];
    if (v5 == 2) {
LABEL_11:
    }
      [(NSMutableDictionary *)self->_handSkeletons setValue:*p_leftHandSkeleton forKey:@"GCHandSkeletonAny"];
  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableDictionary)handSkeletons
{
  return self->_handSkeletons;
}

- (void)setHandSkeletons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handSkeletons, 0);
  objc_storeStrong((id *)&self->_rightHandSkeleton, 0);
  objc_storeStrong((id *)&self->_leftHandSkeleton, 0);
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end