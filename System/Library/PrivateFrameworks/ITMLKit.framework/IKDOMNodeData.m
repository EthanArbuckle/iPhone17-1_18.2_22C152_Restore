@interface IKDOMNodeData
+ (id)jsNodeDataForNode:(id)a3;
- (BOOL)arePrototypesResolved;
- (BOOL)areRulesParsed;
- (BOOL)containsUpdates;
- (BOOL)isAutoHighlightRead;
- (BOOL)isBindingParsed;
- (BOOL)isChildrenUpdated;
- (BOOL)isDataResolved;
- (BOOL)isSubtreeUpdated;
- (BOOL)isUpdated;
- (IKDOMNode)ownerJSNode;
- (NSMutableDictionary)featuresMap;
- (id)featureForName:(id)a3;
- (void)setAutoHighlightRead:(BOOL)a3;
- (void)setBindingParsed:(BOOL)a3;
- (void)setChildrenUpdated:(BOOL)a3;
- (void)setDataResolved:(BOOL)a3;
- (void)setFeature:(id)a3 forName:(id)a4;
- (void)setFeaturesMap:(id)a3;
- (void)setOwnerJSNode:(id)a3;
- (void)setPrototypesResolved:(BOOL)a3;
- (void)setRulesParsed:(BOOL)a3;
- (void)setSubtreeUpdated:(BOOL)a3;
- (void)setUpdated:(BOOL)a3;
@end

@implementation IKDOMNodeData

+ (id)jsNodeDataForNode:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IKDOMNodeData);
  [(IKDOMNodeData *)v4 setOwnerJSNode:v3];

  return v4;
}

- (BOOL)containsUpdates
{
  if ([(IKDOMNodeData *)self isUpdated] || [(IKDOMNodeData *)self isChildrenUpdated]) {
    return 1;
  }
  return [(IKDOMNodeData *)self isSubtreeUpdated];
}

- (void)setFeature:(id)a3 forName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(IKDOMNodeData *)self featuresMap];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(IKDOMNodeData *)self setFeaturesMap:v8];
  }
  v9 = [(IKDOMNodeData *)self featuresMap];
  v10 = v9;
  if (v11) {
    [v9 setObject:v11 forKey:v6];
  }
  else {
    [v9 removeObjectForKey:v6];
  }
}

- (id)featureForName:(id)a3
{
  id v4 = a3;
  v5 = [(IKDOMNodeData *)self featuresMap];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (IKDOMNode)ownerJSNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerJSNode);
  return (IKDOMNode *)WeakRetained;
}

- (void)setOwnerJSNode:(id)a3
{
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

- (BOOL)isChildrenUpdated
{
  return self->_childrenUpdated;
}

- (void)setChildrenUpdated:(BOOL)a3
{
  self->_childrenUpdated = a3;
}

- (BOOL)isSubtreeUpdated
{
  return self->_subtreeUpdated;
}

- (void)setSubtreeUpdated:(BOOL)a3
{
  self->_subtreeUpdated = a3;
}

- (BOOL)isAutoHighlightRead
{
  return self->_autoHighlightRead;
}

- (void)setAutoHighlightRead:(BOOL)a3
{
  self->_autoHighlightRead = a3;
}

- (BOOL)isBindingParsed
{
  return self->_bindingParsed;
}

- (void)setBindingParsed:(BOOL)a3
{
  self->_bindingParsed = a3;
}

- (BOOL)areRulesParsed
{
  return self->_rulesParsed;
}

- (void)setRulesParsed:(BOOL)a3
{
  self->_rulesParsed = a3;
}

- (BOOL)arePrototypesResolved
{
  return self->_prototypesResolved;
}

- (void)setPrototypesResolved:(BOOL)a3
{
  self->_prototypesResolved = a3;
}

- (BOOL)isDataResolved
{
  return self->_dataResolved;
}

- (void)setDataResolved:(BOOL)a3
{
  self->_dataResolved = a3;
}

- (NSMutableDictionary)featuresMap
{
  return self->_featuresMap;
}

- (void)setFeaturesMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresMap, 0);
  objc_destroyWeak((id *)&self->_ownerJSNode);
}

@end