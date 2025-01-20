@interface MAEdgeFilter
+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4;
+ (id)edgeFilterWithVisualString:(id)a3;
- (BOOL)matchesEdge:(id)a3;
- (KGEdgeFilter)kgEdgeFilter;
- (MARelation)anyDirectionRelation;
- (MARelation)inRelation;
- (MARelation)outRelation;
- (id)relationWithType:(unint64_t)a3;
- (void)appendVisualStringToString:(id)a3;
@end

@implementation MAEdgeFilter

- (id)relationWithType:(unint64_t)a3
{
  v3 = [[MANeighborRelation alloc] initWithEdgeType:a3 edgeFilter:self];
  return v3;
}

- (MARelation)anyDirectionRelation
{
  v2 = [[MANeighborRelation alloc] initWithEdgeType:3 edgeFilter:self];
  return (MARelation *)v2;
}

- (MARelation)inRelation
{
  v2 = [[MANeighborRelation alloc] initWithEdgeType:1 edgeFilter:self];
  return (MARelation *)v2;
}

- (MARelation)outRelation
{
  v2 = [[MANeighborRelation alloc] initWithEdgeType:2 edgeFilter:self];
  return (MARelation *)v2;
}

- (void)appendVisualStringToString:(id)a3
{
  id v4 = a3;
  [v4 appendString:@"["];
  v5.receiver = self;
  v5.super_class = (Class)MAEdgeFilter;
  [(MAElementFilter *)&v5 appendVisualStringToString:v4];
  [v4 appendString:@"]"];
}

- (KGEdgeFilter)kgEdgeFilter
{
  v3 = [KGEdgeFilter alloc];
  id v4 = [(MAElementFilter *)self kgRequiredLabels];
  objc_super v5 = [(MAElementFilter *)self kgOptionalLabels];
  v6 = [(MAElementFilter *)self properties];
  v7 = [(KGElementFilter *)v3 initWithRequiredLabels:v4 optionalLabels:v5 properties:v6];

  return v7;
}

- (BOOL)matchesEdge:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MAEdgeFilter;
  return [(MAElementFilter *)&v4 matchesElement:a3];
}

+ (id)edgeFilterWithVisualString:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  v7 = [a1 scanFilterWithScanner:v6];

  return v7;
}

+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4
{
  id v6 = a4;
  if ([v6 scanString:@"[" intoString:0]
    && (v9.receiver = a1,
        v9.super_class = (Class)&OBJC_METACLASS___MAEdgeFilter,
        objc_msgSendSuper2(&v9, sel_scanInstance_withScanner_, a3, v6)))
  {
    char v7 = [v6 scanString:@"]" intoString:0];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end