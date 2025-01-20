@interface SKGInteractionEdges
+ (Class)edgeClass;
+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4;
+ (id)edgesInGraph:(id)a3 withRelationship:(id)a4;
@end

@implementation SKGInteractionEdges

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)edgesInGraph:(id)a3 withRelationship:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)MAEdgeFilter) initWithLabel:v6 domain:100];
  v8 = [v5 graph];
  v9 = +[SKGInteractionEdges edgesMatchingFilter:v7 inGraph:v8];

  return v9;
}

+ (id)edgesFromNodes:(id)a3 toNodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SKGInteractionEdge filter];
  v8 = +[SKGInteractionEdges edgesFromNodes:v5 toNodes:v6 matchingFilter:v7];

  return v8;
}

@end