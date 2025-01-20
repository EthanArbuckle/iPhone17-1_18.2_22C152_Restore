@interface MDLPackedJointAnimation
- (MDLAnimatedQuaternionArray)rotations;
- (MDLAnimatedVector3Array)scales;
- (MDLAnimatedVector3Array)translations;
- (MDLPackedJointAnimation)initWithName:(NSString *)name jointPaths:(NSArray *)jointPaths;
- (NSArray)jointPaths;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MDLPackedJointAnimation

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend_allocWithZone_(MDLPackedJointAnimation, a2, (uint64_t)a3);
  v7 = objc_msgSend_name(self, v5, v6);
  v9 = objc_msgSend_initWithName_jointPaths_(v4, v8, (uint64_t)v7, self->_jointPaths);

  uint64_t v12 = objc_msgSend_copy(self->_translations, v10, v11);
  v13 = (void *)v9[8];
  v9[8] = v12;

  uint64_t v16 = objc_msgSend_copy(self->_rotations, v14, v15);
  v17 = (void *)v9[9];
  v9[9] = v16;

  uint64_t v20 = objc_msgSend_copy(self->_scales, v18, v19);
  v21 = (void *)v9[10];
  v9[10] = v20;

  return v9;
}

- (MDLPackedJointAnimation)initWithName:(NSString *)name jointPaths:(NSArray *)jointPaths
{
  uint64_t v6 = name;
  v7 = jointPaths;
  v40.receiver = self;
  v40.super_class = (Class)MDLPackedJointAnimation;
  v10 = [(MDLObject *)&v40 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    objc_msgSend_setName_(v10, v12, (uint64_t)v11);

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    uint64_t v16 = v10->_jointPaths;
    v10->_jointPaths = (NSArray *)v15;

    v17 = [MDLAnimatedVector3Array alloc];
    uint64_t v20 = objc_msgSend_count(v10->_jointPaths, v18, v19);
    uint64_t v22 = objc_msgSend_initWithElementCount_(v17, v21, v20);
    translations = v10->_translations;
    v10->_translations = (MDLAnimatedVector3Array *)v22;

    v24 = [MDLAnimatedQuaternionArray alloc];
    uint64_t v27 = objc_msgSend_count(v10->_jointPaths, v25, v26);
    uint64_t v29 = objc_msgSend_initWithElementCount_(v24, v28, v27);
    rotations = v10->_rotations;
    v10->_rotations = (MDLAnimatedQuaternionArray *)v29;

    v31 = [MDLAnimatedVector3Array alloc];
    uint64_t v34 = objc_msgSend_count(v10->_jointPaths, v32, v33);
    uint64_t v36 = objc_msgSend_initWithElementCount_(v31, v35, v34);
    scales = v10->_scales;
    v10->_scales = (MDLAnimatedVector3Array *)v36;

    v38 = v10;
  }

  return v10;
}

- (NSArray)jointPaths
{
  return self->_jointPaths;
}

- (MDLAnimatedVector3Array)translations
{
  return self->_translations;
}

- (MDLAnimatedQuaternionArray)rotations
{
  return self->_rotations;
}

- (MDLAnimatedVector3Array)scales
{
  return self->_scales;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_rotations, 0);
  objc_storeStrong((id *)&self->_translations, 0);

  objc_storeStrong((id *)&self->_jointPaths, 0);
}

@end