@interface MessageBodyDOMElement
- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)jsNodes;
- (void)setJSNodes:(id)a3;
@end

@implementation MessageBodyDOMElement

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  id v4 = a3;
  v5 = [(MessageBodyDOMElement *)self parser];
  id v6 = [v5 _copyConsumableNodesFromBodyElement:self andAppendInnerTextToStringAccumulator:v4];

  return v6;
}

- (id)jsNodes
{
  v3 = +[WKWebProcessPlugInScriptWorld normalWorld];
  id v4 = [(MessageBodyDOMElement *)self nodes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9718;
  v8[3] = &unk_186D8;
  id v5 = v3;
  id v9 = v5;
  id v6 = objc_msgSend(v4, "ef_map:", v8);

  return v6;
}

- (void)setJSNodes:(id)a3
{
  id v12 = a3;
  id v4 = [v12 objectForKeyedSubscript:@"length"];
  unsigned int v5 = [v4 toUInt32];

  uint64_t v6 = v5;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
  v8 = +[JSContext currentContext];
  if (v5)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [v12 objectAtIndexedSubscript:v9];
      v11 = +[WKWebProcessPlugInNodeHandle nodeHandleWithJSValue:v10 inContext:v8];
      [v7 addObject:v11];

      ++v9;
    }
    while (v6 != v9);
  }
  [(MessageBodyDOMElement *)self setNodes:v7];
}

@end