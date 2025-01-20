@interface GKSKNodeComponent
+ (BOOL)supportsSecureCoding;
+ (GKSKNodeComponent)componentWithNode:(SKNode *)node;
- (GKSKNodeComponent)initWithCoder:(id)a3;
- (GKSKNodeComponent)initWithNode:(SKNode *)node;
- (NSIndexPath)serializableNodeIndexPath;
- (SKNode)node;
- (id)copyWithZone:(_NSZone *)a3;
- (void)agentDidUpdate:(id)a3;
- (void)agentWillUpdate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEntity:(id)a3;
- (void)setNode:(SKNode *)node;
- (void)setSerializableNodeIndexPath:(id)a3;
@end

@implementation GKSKNodeComponent

+ (GKSKNodeComponent)componentWithNode:(SKNode *)node
{
  v3 = node;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNode:v3];

  return (GKSKNodeComponent *)v4;
}

- (GKSKNodeComponent)initWithNode:(SKNode *)node
{
  v4 = node;
  v8.receiver = self;
  v8.super_class = (Class)GKSKNodeComponent;
  v5 = [(GKComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKSKNodeComponent *)v5 setNode:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKSKNodeComponent)initWithCoder:(id)a3
{
  v14[12] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKSKNodeComponent;
  v5 = [(GKComponent *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = objc_opt_class();
    v14[4] = objc_opt_class();
    v14[5] = objc_opt_class();
    v14[6] = objc_opt_class();
    v14[7] = objc_opt_class();
    v14[8] = objc_opt_class();
    v14[9] = objc_opt_class();
    v14[10] = objc_opt_class();
    v14[11] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:12];
    [v6 addObjectsFromArray:v7];

    objc_super v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_serializableNodeIndexPath"];
    serializableNodeIndexPath = v5->_serializableNodeIndexPath;
    v5->_serializableNodeIndexPath = (NSIndexPath *)v9;

    if (!v5->_serializableNodeIndexPath)
    {
      v11 = [v4 decodeObjectOfClasses:v6 forKey:@"_node"];
      [(GKSKNodeComponent *)v5 setNode:v11];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKSKNodeComponent;
  id v4 = a3;
  [(GKComponent *)&v7 encodeWithCoder:v4];
  serializableNodeIndexPath = self->_serializableNodeIndexPath;
  if (serializableNodeIndexPath)
  {
    id v6 = @"_serializableNodeIndexPath";
  }
  else
  {
    serializableNodeIndexPath = self->_node;
    id v6 = @"_node";
  }
  objc_msgSend(v4, "encodeObject:forKey:", serializableNodeIndexPath, v6, v7.receiver, v7.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKSKNodeComponent;
  id v4 = [(GKComponent *)&v9 copyWithZone:a3];
  uint64_t v5 = [(NSIndexPath *)self->_serializableNodeIndexPath copy];
  id v6 = (void *)v4[5];
  v4[5] = v5;

  objc_super v7 = (void *)[(SKNode *)self->_node copy];
  [v4 setNode:v7];

  return v4;
}

- (void)setEntity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKSKNodeComponent;
  id v4 = a3;
  [(GKComponent *)&v5 setEntity:v4];
  -[SKNode setEntity:](self->_node, "setEntity:", v4, v5.receiver, v5.super_class);
}

- (void)setNode:(SKNode *)node
{
  id v4 = node;
  [(SKNode *)self->_node setEntity:0];
  objc_super v5 = self->_node;
  self->_node = v4;
  id v6 = v4;

  id v7 = [(GKComponent *)self entity];
  [(SKNode *)self->_node setEntity:v7];
}

- (void)agentWillUpdate:(id)a3
{
  node = self->_node;
  id v10 = a3;
  [(SKNode *)node position];
  float64_t v9 = v5;
  [(SKNode *)self->_node position];
  v6.f64[0] = v9;
  v6.f64[1] = v7;
  [v10 setPosition:COERCE_DOUBLE(vcvt_f32_f64(v6))];
  [(SKNode *)self->_node zRotation];
  *(float *)&double v8 = v8;
  [v10 setRotation:v8];
}

- (void)agentDidUpdate:(id)a3
{
  id v4 = a3;
  [v4 position];
  double v6 = v5;
  [v4 position];
  -[SKNode setPosition:](self->_node, "setPosition:", v6, v7);
  [v4 rotation];
  float v9 = v8;

  node = self->_node;

  [(SKNode *)node setZRotation:v9];
}

- (NSIndexPath)serializableNodeIndexPath
{
  return self->_serializableNodeIndexPath;
}

- (void)setSerializableNodeIndexPath:(id)a3
{
}

- (SKNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong((id *)&self->_serializableNodeIndexPath, 0);
}

@end