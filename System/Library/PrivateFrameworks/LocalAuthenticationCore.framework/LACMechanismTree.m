@interface LACMechanismTree
+ (id)mechanismTreeFromSerializedTree:(id)a3;
- (BOOL)isAnd;
- (BOOL)isSatisfiableWithValue:(int64_t)a3;
- (LACMechanismTree)initWithChildren:(id)a3 isAndNode:(BOOL)a4;
- (LACMechanismTree)initWithValue:(int64_t)a3;
- (NSArray)children;
- (id)description;
- (int64_t)value;
@end

@implementation LACMechanismTree

- (LACMechanismTree)initWithChildren:(id)a3 isAndNode:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LACMechanismTree;
  v8 = [(LACMechanismTree *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = -1;
    v8->_isAnd = a4;
    objc_storeStrong((id *)&v8->_children, a3);
  }

  return v9;
}

- (LACMechanismTree)initWithValue:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACMechanismTree;
  v4 = [(LACMechanismTree *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_isAnd = 0;
    children = v4->_children;
    id v7 = (NSArray *)MEMORY[0x263EFFA68];
    v4->_value = a3;
    v4->_children = v7;
  }
  return v5;
}

- (id)description
{
  v16[3] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACMechanismTree value](self, "value"));
  id v7 = [v5 stringWithFormat:@"value: %@", v6];
  v16[0] = v7;
  v8 = NSString;
  objc_super v9 = [(LACMechanismTree *)self children];
  v10 = [v8 stringWithFormat:@"children: [%@]", v9];
  v16[1] = v10;
  objc_super v11 = objc_msgSend(NSString, "stringWithFormat:", @"isAnd: %d", -[LACMechanismTree isAnd](self, "isAnd"));
  v16[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v13 = [v12 componentsJoinedByString:@"; "];
  v14 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v13];

  return v14;
}

- (BOOL)isAnd
{
  return self->_isAnd;
}

- (int64_t)value
{
  return self->_value;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
}

- (BOOL)isSatisfiableWithValue:(int64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = LACMechanismTree.isSatisfiable(withValue:)(a3);

  return a3 & 1;
}

+ (id)mechanismTreeFromSerializedTree:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  uint64_t v8 = 0;
  v6 = (void *)static LACMechanismTree.parse(tree:index:)(v3, v5, &v8);
  swift_bridgeObjectRelease();
  return v6;
}

@end