@interface GKSCNNodeComponent
+ (BOOL)supportsSecureCoding;
+ (GKSCNNodeComponent)componentWithNode:(SCNNode *)node;
- (GKSCNNodeComponent)initWithCoder:(id)a3;
- (GKSCNNodeComponent)initWithNode:(SCNNode *)node;
- (NSIndexPath)serializableNodeIndexPath;
- (SCNNode)node;
- (id)copyWithZone:(_NSZone *)a3;
- (void)agentDidUpdate:(id)a3;
- (void)agentWillUpdate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEntity:(id)a3;
- (void)setNode:(id)a3;
- (void)setSerializableNodeIndexPath:(id)a3;
@end

@implementation GKSCNNodeComponent

+ (GKSCNNodeComponent)componentWithNode:(SCNNode *)node
{
  v3 = node;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNode:v3];

  return (GKSCNNodeComponent *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKSCNNodeComponent)initWithNode:(SCNNode *)node
{
  v5 = node;
  v9.receiver = self;
  v9.super_class = (Class)GKSCNNodeComponent;
  v6 = [(GKComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_node, node);
  }

  return v7;
}

- (GKSCNNodeComponent)initWithCoder:(id)a3
{
  v13[12] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKSCNNodeComponent;
  v5 = [(GKComponent *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    v13[8] = objc_opt_class();
    v13[9] = objc_opt_class();
    v13[10] = objc_opt_class();
    v13[11] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:12];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_serializableNodeIndexPath"];
    serializableNodeIndexPath = v5->_serializableNodeIndexPath;
    v5->_serializableNodeIndexPath = (NSIndexPath *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKSCNNodeComponent;
  [(GKComponent *)&v6 encodeWithCoder:v4];
  v5 = [MEMORY[0x263F16AD0] _indexPathForNode:self->_node];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"_serializableNodeIndexPath"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKSCNNodeComponent;
  id v4 = [(GKComponent *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_node);
  return v4;
}

- (void)setEntity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKSCNNodeComponent;
  id v4 = a3;
  [(GKComponent *)&v5 setEntity:v4];
  -[SCNNode setEntity:](self->_node, "setEntity:", v4, v5.receiver, v5.super_class);
}

- (void)agentWillUpdate:(id)a3
{
  node = self->_node;
  id v22 = a3;
  [(SCNNode *)node position];
  HIDWORD(v6) = v5;
  [v22 setPosition:v6];
  [(SCNNode *)self->_node orientation];
  float v8 = v7 * v7;
  float v10 = v7 * v9;
  float v12 = v7 * v11;
  float v14 = v7 * v13;
  float v15 = v9 * v11;
  float v16 = v9 * v13;
  float v17 = v11 * v11;
  float v18 = v11 * v13;
  *(float *)&double v19 = 1.0
                 - (float)((float)((float)(v9 * v9) + (float)(v11 * v11))
                         + (float)((float)(v9 * v9) + (float)(v11 * v11)));
  *(float *)&double v20 = (float)(v10 - v18) + (float)(v10 - v18);
  *(float *)&double v21 = (float)(v12 + v16) + (float)(v12 + v16);
  *((float *)&v19 + 1) = (float)(v10 + v18) + (float)(v10 + v18);
  *((float *)&v20 + 1) = 1.0 - (float)((float)(v8 + v17) + (float)(v8 + v17));
  *((float *)&v21 + 1) = (float)(v15 - v14) + (float)(v15 - v14);
  objc_msgSend(v22, "setRotation:", v19, v20, v21);
}

- (void)agentDidUpdate:(id)a3
{
  id v4 = a3;
  [v4 rotation];
  float v6 = v5 + 1.0;
  float v9 = sqrtf((float)(v5 + 1.0) - (float)(v8 + *((float *)&v7 + 1))) * 0.5;
  float v10 = 1.0 - v5;
  *(float *)&double v7 = sqrtf((float)(*((float *)&v7 + 1) - v8) + v10) * 0.5;
  *(float *)&double v11 = sqrtf((float)(v8 - *((float *)&v7 + 1)) + v10) * 0.5;
  *(float *)&double v12 = sqrtf((float)(v8 + *((float *)&v7 + 1)) + v6) * 0.5;
  *(float *)&double v13 = v9;
  -[SCNNode setOrientation:](self->_node, "setOrientation:", v13, v7, v11, v12);
  [v4 position];
  long long v18 = v14;

  LODWORD(v16) = DWORD2(v18);
  LODWORD(v15) = DWORD1(v18);
  node = self->_node;

  -[SCNNode setPosition:](node, "setPosition:", *(double *)&v18, v15, v16);
}

- (NSIndexPath)serializableNodeIndexPath
{
  return self->_serializableNodeIndexPath;
}

- (void)setSerializableNodeIndexPath:(id)a3
{
}

- (SCNNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong((id *)&self->_serializableNodeIndexPath, 0);
}

- (void)setNode:(id)a3
{
}

@end