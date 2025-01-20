@interface SKGEdges
+ (Class)edgeClass;
+ (Class)nodeClass;
+ (MAEdgeFilter)filter;
+ (id)edgesInGraph:(id)a3;
+ (id)edgesWithEdge:(id)a3 inGraph:(id)a4;
+ (id)labels;
- (unint64_t)edgeIdentifier;
- (void)enumerateEdgesInGraph:(id)a3 usingBlock:(id)a4;
- (void)setEdgeIdentifier:(unint64_t)a3;
@end

@implementation SKGEdges

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)labels
{
  p_cache = &OBJC_METACLASS___SKGEmbedding.cache;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000F8918, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000F8918))
  {
    v6[0] = off_1000F8350[0];
    v6[1] = off_1000F8358[0];
    v6[2] = off_1000F8360[0];
    v6[3] = off_1000F8368[0];
    v6[4] = off_1000F8370[0];
    v6[5] = off_1000F8378[0];
    v6[6] = off_1000F8380[0];
    v6[7] = off_1000F8388[0];
    v6[8] = off_1000F8390[0];
    v6[9] = off_1000F8398[0];
    v6[10] = off_1000F83A0[0];
    v6[11] = off_1000F83A8[0];
    v6[12] = off_1000F83B0;
    v5 = +[NSArray arrayWithObjects:v6 count:13];
    qword_1000F8910 = +[NSSet setWithArray:v5];

    __cxa_guard_release(&qword_1000F8918);
    p_cache = (void **)(&OBJC_METACLASS___SKGEmbedding + 16);
  }
  v3 = p_cache[290];

  return v3;
}

+ (MAEdgeFilter)filter
{
  id v2 = [a1 edgeClass];

  return (MAEdgeFilter *)[v2 filter];
}

+ (id)edgesWithEdge:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 sourceNode];
  v8 = +[SKGNodes nodesWithNode:v7 inGraph:v6];

  v9 = [v5 targetNode];
  v10 = +[SKGNodes nodesWithNode:v9 inGraph:v6];

  id v11 = objc_alloc((Class)MAEdgeFilter);
  v12 = [v5 label];
  id v13 = [v5 domain];
  v14 = [v5 propertyDictionary];
  id v15 = [v11 initWithLabel:v12 domain:v13 properties:v14];

  v16 = +[SKGInteractionEdges edgesFromNodes:v8 toNodes:v10 matchingFilter:v15];

  return v16;
}

+ (id)edgesInGraph:(id)a3
{
  id v4 = a3;
  id v5 = [a1 filter];
  id v6 = [v4 graph];
  v7 = [a1 edgesMatchingFilter:v5 inGraph:v6];

  return v7;
}

- (void)enumerateEdgesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002FC1C;
  v8[3] = &unk_1000D9C00;
  id v7 = v5;
  id v9 = v7;
  [(SKGEdges *)self enumerateIdentifiersAsCollectionsWithBlock:v8];
}

- (unint64_t)edgeIdentifier
{
  return self->_edgeIdentifier;
}

- (void)setEdgeIdentifier:(unint64_t)a3
{
  self->_edgeIdentifier = a3;
}

@end