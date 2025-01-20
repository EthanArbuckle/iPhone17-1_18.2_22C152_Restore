@interface _FEDebugLogNodeTreeStyle
+ (id)defaultStyle;
+ (id)styleWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6;
- (NSString)intermediate;
- (NSString)lastNode;
- (NSString)node;
- (NSString)trailing;
- (_FEDebugLogNodeTreeStyle)initWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6;
@end

@implementation _FEDebugLogNodeTreeStyle

+ (id)defaultStyle
{
  if (qword_269A11C00 != -1) {
    dispatch_once(&qword_269A11C00, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

- (_FEDebugLogNodeTreeStyle)initWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_FEDebugLogNodeTreeStyle;
  v14 = [(_FEDebugLogNodeTreeStyle *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    node = v14->_node;
    v14->_node = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    lastNode = v14->_lastNode;
    v14->_lastNode = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    intermediate = v14->_intermediate;
    v14->_intermediate = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    trailing = v14->_trailing;
    v14->_trailing = (NSString *)v21;
  }
  return v14;
}

+ (id)styleWithNode:(id)a3 lastNode:(id)a4 intermediate:(id)a5 trailing:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithNode:v13 lastNode:v12 intermediate:v11 trailing:v10];

  return v14;
}

- (NSString)node
{
  return self->_node;
}

- (NSString)lastNode
{
  return self->_lastNode;
}

- (NSString)intermediate
{
  return self->_intermediate;
}

- (NSString)trailing
{
  return self->_trailing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_intermediate, 0);
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end