@interface SCNPhysicsShape
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsShape)shapeWithGeometry:(SCNGeometry *)geometry options:(NSDictionary *)options;
+ (SCNPhysicsShape)shapeWithNode:(SCNNode *)node options:(NSDictionary *)options;
+ (SCNPhysicsShape)shapeWithShapes:(NSArray *)shapes transforms:(NSArray *)transforms;
+ (id)defaultShapeForGeometry:(id)a3;
- (NSArray)transforms;
- (NSDictionary)options;
- (SCNPhysicsShape)initWithCachedObject:(void *)a3 options:(id)a4;
- (SCNPhysicsShape)initWithCoder:(id)a3;
- (SCNPhysicsShape)initWithContent:(id)a3 options:(id)a4;
- (btCollisionShape)_handle;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)referenceObject;
- (id)sourceObject;
- (void)_customDecodingOfSCNPhysicsShape:(id)a3;
- (void)_customEncodingOfSCNPhysicsShape:(id)a3;
- (void)_setTransforms:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceObject:(id)a3;
@end

@implementation SCNPhysicsShape

- (SCNPhysicsShape)initWithContent:(id)a3 options:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsShape;
  v6 = [(SCNPhysicsShape *)&v8 init];
  if (v6)
  {
    v6->_referenceObject = a3;
    v6->_options = (NSDictionary *)a4;
  }
  return v6;
}

- (SCNPhysicsShape)initWithCachedObject:(void *)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCNPhysicsShape;
  v6 = [(SCNPhysicsShape *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_cachedObject = a3;
    v6->_options = (NSDictionary *)a4;
  }
  return v7;
}

- (void)dealloc
{
  SCNPhysicsShapeDestroyShape((uint64_t)self->_collisionShape);

  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsShape;
  [(SCNPhysicsShape *)&v3 dealloc];
}

- (id)referenceObject
{
  return self->_referenceObject;
}

- (void)setReferenceObject:(id)a3
{
  id referenceObject = self->_referenceObject;
  if (referenceObject != a3)
  {
    if (a3 && referenceObject)
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_20B249000, v6, OS_LOG_TYPE_DEFAULT, "Warning: changing the content of a physics shape is not expected", v7, 2u);
      }
    }

    self->_id referenceObject = a3;
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)_setTransforms:(id)a3
{
  self->_transforms = (NSArray *)a3;
}

- (btCollisionShape)_handle
{
  if (self->_collisionShape) {
    return self->_collisionShape;
  }
  cachedObject = self->_cachedObject;
  if (cachedObject)
  {
    CFTypeID v5 = CFGetTypeID(cachedObject);
    if (CFTypeIsC3DGeometry(v5))
    {
      v6 = (__C3DGeometry *)self->_cachedObject;
LABEL_8:
      ShapeForGeometry = (btCollisionShape *)_createShapeForGeometry(v6, self->_options);
      goto LABEL_14;
    }
    if (v5 == C3DNodeGetTypeID())
    {
      objc_super v8 = (__C3DMesh *)self->_cachedObject;
LABEL_13:
      ShapeForGeometry = (btCollisionShape *)_createShapeForNode(v8, self->_options);
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (__C3DGeometry *)[self->_referenceObject geometryRef];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (__C3DMesh *)[self->_referenceObject nodeRef];
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:
    if (!self->_collisionShape) {
      return self->_collisionShape;
    }
    goto LABEL_19;
  }
  ShapeForGeometry = (btCollisionShape *)_createShapeForArrayOfShapes((NSArray *)self->_referenceObject, self->_transforms);
LABEL_14:
  self->_collisionShape = ShapeForGeometry;
  if (!ShapeForGeometry) {
    return self->_collisionShape;
  }
LABEL_19:
  id v9 = [(NSDictionary *)self->_options valueForKey:@"SCNPhysicsShapeScaleKey"];
  if (v9)
  {
    v10 = v9;
    [v9 SCNVector3Value];
    float v12 = v11;
    float v14 = v13;
    float v16 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      float v16 = v17;
      float v14 = v17;
      float v12 = v17;
    }
    if (v12 != 0.0 && v14 != 0.0 && v16 != 0.0)
    {
      v31.x = 1.0;
      v31.y = 1.0;
      v31.z = 1.0;
      v30.x = v12;
      v30.y = v14;
      v30.z = v16;
      if (!SCNVector3EqualToVector3(v30, v31))
      {
        collisionShape = self->_collisionShape;
        unint64_t v28 = __PAIR64__(LODWORD(v14), LODWORD(v12));
        uint64_t v29 = LODWORD(v16);
        (*((void (**)(btCollisionShape *, unint64_t *))collisionShape->var0 + 6))(collisionShape, &v28);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id referenceObject = self->_referenceObject;
      v20 = self->_collisionShape;
      [referenceObject scale];
      unsigned int v22 = v21;
      [referenceObject scale];
      unsigned int v24 = v23;
      [referenceObject scale];
      unint64_t v28 = __PAIR64__(v24, v22);
      uint64_t v29 = v25;
      (*((void (**)(btCollisionShape *, unint64_t *))v20->var0 + 6))(v20, &v28);
    }
  }
  id v26 = [(NSDictionary *)self->_options valueForKey:@"SCNPhysicsShapeCollisionMarginKey", v28, v29];
  if (v26)
  {
    [v26 floatValue];
    if (v27.n128_f32[0] < 0.0) {
      v27.n128_f32[0] = 0.0;
    }
    (*((void (**)(btCollisionShape *, __n128))self->_collisionShape->var0 + 11))(self->_collisionShape, v27);
  }
  return self->_collisionShape;
}

+ (SCNPhysicsShape)shapeWithGeometry:(SCNGeometry *)geometry options:(NSDictionary *)options
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContent:geometry options:options];

  return (SCNPhysicsShape *)v4;
}

+ (SCNPhysicsShape)shapeWithNode:(SCNNode *)node options:(NSDictionary *)options
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContent:node options:options];

  return (SCNPhysicsShape *)v4;
}

+ (SCNPhysicsShape)shapeWithShapes:(NSArray *)shapes transforms:(NSArray *)transforms
{
  CFTypeID v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContent:shapes options:0];
  [v5 _setTransforms:transforms];

  return (SCNPhysicsShape *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (id)copy
{
  return [(SCNPhysicsShape *)self copyWithZone:0];
}

+ (id)defaultShapeForGeometry:(id)a3
{
  v4 = (SCNPhysicsShape *)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"SCNDefaultPhysicsShape"), "pointerValue");
  if (!v4)
  {
    v4 = +[SCNPhysicsShape shapeWithGeometry:a3 options:0];
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", v4), @"SCNDefaultPhysicsShape");
  }
  return v4;
}

- (void)_customEncodingOfSCNPhysicsShape:(id)a3
{
  transforms = self->_transforms;
  if (transforms)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    int v9 = 0;
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSArray count](transforms, "count"), @"transformsCount");
    v6 = self->_transforms;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__SCNPhysicsShape__customEncodingOfSCNPhysicsShape___block_invoke;
    v7[3] = &unk_2640062F0;
    v7[4] = a3;
    v7[5] = v8;
    [(NSArray *)v6 enumerateObjectsUsingBlock:v7];
    _Block_object_dispose(v8, 8);
  }
}

uint64_t __52__SCNPhysicsShape__customEncodingOfSCNPhysicsShape___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = NSString;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  v7 = (const char *)objc_msgSend(v3, "stringWithFormat:", @"transform%d", v6);
  if (a2) {
    [a2 SCNMatrix4Value];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  return SCNEncodeSCNMatrix4(v4, v7, (uint64_t)v9);
}

- (void)_customDecodingOfSCNPhysicsShape:(id)a3
{
  uint64_t v5 = [a3 decodeIntegerForKey:@"transformsCount"];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    self->_transforms = (NSArray *)(id)[MEMORY[0x263EFF980] arrayWithCapacity:v5];
    do
    {
      transforms = self->_transforms;
      int v9 = (void *)MEMORY[0x263F08D40];
      SCNDecodeSCNMatrix4(a3, objc_msgSend(NSString, "stringWithFormat:", @"transform%d", v7), v10);
      -[NSArray addObject:](transforms, "addObject:", [v9 valueWithSCNMatrix4:v10]);
      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNPhysicsShape _customEncodingOfSCNPhysicsShape:](self, "_customEncodingOfSCNPhysicsShape:");
  id referenceObject = self->_referenceObject;
  if (referenceObject) {
    [a3 encodeObject:referenceObject forKey:@"referenceObject"];
  }
  if (self->_options)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SCNPhysicsShape)initWithCoder:(id)a3
{
  _OWORD v9[4] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsShape;
  v4 = [(SCNPhysicsShape *)&v8 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNPhysicsShape *)v4 _customDecodingOfSCNPhysicsShape:a3];
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    v9[3] = objc_opt_class();
    -[SCNPhysicsShape setReferenceObject:](v4, "setReferenceObject:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 4)), @"referenceObject"));
    v4->_options = (NSDictionary *)(id)[a3 decodeObjectOfClasses:SCNPlistClasses() forKey:@"options"];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sourceObject
{
  return self->_referenceObject;
}

@end