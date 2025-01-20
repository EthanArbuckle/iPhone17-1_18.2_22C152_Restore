@interface _FEDebugLogNode
+ (id)rootNode;
- (BOOL)_isNode;
- (BOOL)hasMessages;
- (_FEDebugLogNode)initWithString:(id)a3;
- (_FEDebugLogNodeTreeStyle)treeStyle;
- (id)description;
- (void)__genericAppendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5 recursionSelector:(SEL)a6 appendHandler:(id)a7;
- (void)_appendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5;
- (void)addMessage:(id)a3;
- (void)setTreeStyle:(id)a3;
@end

@implementation _FEDebugLogNode

- (_FEDebugLogNode)initWithString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_FEDebugLogNode;
  v3 = [(_FEDebugLogMessage *)&v7 initWithString:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    childMessages = v3->_childMessages;
    v3->_childMessages = (NSMutableArray *)v4;
  }
  return v3;
}

+ (id)rootNode
{
  v2 = [(_FEDebugLogNode *)[__FEDebugLogRootNode alloc] initWithString:@"@rootNode"];
  return v2;
}

- (BOOL)_isNode
{
  return 1;
}

- (BOOL)hasMessages
{
  return [(NSMutableArray *)self->_childMessages count] != 0;
}

- (void)addMessage:(id)a3
{
}

- (void)__genericAppendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5 recursionSelector:(SEL)a6 appendHandler:(id)a7
{
  id v32 = a3;
  id v31 = a4;
  id v11 = a5;
  v30 = (void (**)(id, void *, void *, id))a7;
  if ([(NSMutableArray *)self->_childMessages count])
  {
    unint64_t v12 = [(NSMutableArray *)self->_childMessages indexOfObjectWithOptions:2 passingTest:&__block_literal_global_100];
    v13 = [(_FEDebugLogNode *)self treeStyle];
    v14 = v13;
    id v28 = v11;
    if (v13 || (v14 = v11) != 0)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = +[_FEDebugLogNodeTreeStyle defaultStyle];
    }
    v16 = v15;

    if ([(NSMutableArray *)self->_childMessages count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [(NSMutableArray *)self->_childMessages objectAtIndexedSubscript:v17];
        int v19 = [v18 _isNode];
        BOOL v21 = v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v17;
        if (([v18 _isTransparent] & 1) == 0)
        {
          v22 = NSString;
          v23 = _prefixForItem(v19, v21, v16);
          v24 = [v22 stringWithFormat:@"\n%@%@", v31, v23];

          v30[2](v30, v18, v24, v32);
        }
        if (v19)
        {
          id v25 = v18;
          if ([v25 _isTransparent])
          {
            id v26 = v31;
          }
          else
          {
            v27 = _prefixForItem(0, v21, v16);
            id v26 = [v31 stringByAppendingString:v27];
          }
          objc_msgSend(v25, a6, v32, v26, v16);
        }
        ++v17;
      }
      while (v17 < [(NSMutableArray *)self->_childMessages count]);
    }

    id v11 = v28;
  }
}

- (void)_appendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5
{
}

- (id)description
{
  v3 = [(_FEDebugLogMessage *)self _stringRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [(_FEDebugLogNode *)self _appendChildDescription:v4 withPrefix:&stru_2700CBC00 inheritedTreeStyle:0];
  return v4;
}

- (_FEDebugLogNodeTreeStyle)treeStyle
{
  return self->_treeStyle;
}

- (void)setTreeStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeStyle, 0);
  objc_storeStrong((id *)&self->_childMessages, 0);
}

@end