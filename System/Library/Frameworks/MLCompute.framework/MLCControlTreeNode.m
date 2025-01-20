@interface MLCControlTreeNode
+ (MLCControlTreeNode)controlTreeNodeWithPredicate:(id)a3 needToNegate:(BOOL)a4;
- (BOOL)needToNegate;
- (MLCControlTreeNode)initWithTensor:(id)a3 needToNegate:(BOOL)a4;
- (MLCTensor)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation MLCControlTreeNode

+ (MLCControlTreeNode)controlTreeNodeWithPredicate:(id)a3 needToNegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithTensor:v6 needToNegate:v4];

  return (MLCControlTreeNode *)v7;
}

- (MLCControlTreeNode)initWithTensor:(id)a3 needToNegate:(BOOL)a4
{
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MLCControlTreeNode;
  v9 = [(MLCControlTreeNode *)&v28 init];
  v10 = [v8 descriptor];
  v11 = [v10 shape];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    uint64_t v14 = 1;
    do
    {
      v15 = [v8 descriptor];
      v16 = [v15 shape];
      v17 = [v16 objectAtIndexedSubscript:v13];
      v14 *= [v17 unsignedIntegerValue];

      ++v13;
      v18 = [v8 descriptor];
      v19 = [v18 shape];
      unint64_t v20 = [v19 count];
    }
    while (v13 < v20);
    if (v14 != 1)
    {
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCControlTreeNode initWithTensor:needToNegate:](a2);
      }
      goto LABEL_13;
    }
  }
  v21 = [v8 descriptor];
  int v22 = [v21 dataType];

  if (v22 != 4)
  {
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCControlTreeNode initWithTensor:needToNegate:](a2);
    }
    goto LABEL_13;
  }
  v23 = [v8 parentLayers];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MLCControlTreeNode initWithTensor:needToNegate:](a2);
    }
LABEL_13:

    v26 = 0;
    goto LABEL_14;
  }
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    v9->_needToNegate = a4;
  }
  v26 = v9;
LABEL_14:

  return v26;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCControlTreeNode *)self predicate];
  v7 = [v6 label];
  id v8 = [v3 stringWithFormat:@"%@: { predicate=%@ : needToNegate=%d }", v5, v7, -[MLCControlTreeNode needToNegate](self, "needToNegate")];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MLCControlTreeNode *)self predicate];
  id v6 = objc_msgSend(v4, "initWithTensor:needToNegate:", v5, -[MLCControlTreeNode needToNegate](self, "needToNegate"));

  return v6;
}

- (MLCTensor)predicate
{
  return self->_predicate;
}

- (BOOL)needToNegate
{
  return self->_needToNegate;
}

- (void).cxx_destruct
{
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: A predicate must be graph-invariant", v4, v5, v6, v7, 2u);
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: A predicate tensor with BOOLean data type is expected", v4, v5, v6, v7, 2u);
}

- (void)initWithTensor:(const char *)a1 needToNegate:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: A predicate tensor with a single element is expected ", v4, v5, v6, v7, 2u);
}

@end