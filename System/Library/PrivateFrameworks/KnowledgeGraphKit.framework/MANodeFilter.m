@interface MANodeFilter
+ (BOOL)scanInstance:(id *)a3 withScanner:(id)a4;
+ (id)nodeFilterWithVisualString:(id)a3;
- (BOOL)matchesNode:(id)a3;
- (BOOL)whereNoInAndOutEdges;
- (BOOL)whereNoInEdges;
- (BOOL)whereNoOutEdges;
- (KGNodeFilter)kgNodeFilter;
- (MARelation)relation;
- (void)appendVisualStringToString:(id)a3;
- (void)setWhereNoInAndOutEdges:(BOOL)a3;
- (void)setWhereNoInEdges:(BOOL)a3;
- (void)setWhereNoOutEdges:(BOOL)a3;
@end

@implementation MANodeFilter

- (void)setWhereNoInEdges:(BOOL)a3
{
  self->_whereNoInEdges = a3;
}

- (BOOL)whereNoInEdges
{
  return self->_whereNoInEdges;
}

- (void)setWhereNoOutEdges:(BOOL)a3
{
  self->_whereNoOutEdges = a3;
}

- (BOOL)whereNoOutEdges
{
  return self->_whereNoOutEdges;
}

- (void)setWhereNoInAndOutEdges:(BOOL)a3
{
  self->_whereNoInAndOutEdges = a3;
}

- (BOOL)whereNoInAndOutEdges
{
  return self->_whereNoInAndOutEdges;
}

- (MARelation)relation
{
  v2 = [[MANodeFilterRelation alloc] initWithNodeFilter:self];
  return (MARelation *)v2;
}

- (void)appendVisualStringToString:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendString:", @"(");
  v5.receiver = self;
  v5.super_class = (Class)MANodeFilter;
  [(MAElementFilter *)&v5 appendVisualStringToString:v4];
  [v4 appendString:@""]);
}

- (KGNodeFilter)kgNodeFilter
{
  v3 = [KGNodeFilter alloc];
  id v4 = [(MAElementFilter *)self kgRequiredLabels];
  objc_super v5 = [(MAElementFilter *)self kgOptionalLabels];
  v6 = [(MAElementFilter *)self properties];
  v7 = [(KGElementFilter *)v3 initWithRequiredLabels:v4 optionalLabels:v5 properties:v6];

  [(KGNodeFilter *)v7 setWhereNoInAndOutEdges:[(MANodeFilter *)self whereNoInAndOutEdges]];
  [(KGNodeFilter *)v7 setWhereNoOutEdges:[(MANodeFilter *)self whereNoOutEdges]];
  [(KGNodeFilter *)v7 setWhereNoInEdges:[(MANodeFilter *)self whereNoInEdges]];
  return v7;
}

- (BOOL)matchesNode:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MANodeFilter;
  return [(MAElementFilter *)&v4 matchesElement:a3];
}

+ (id)nodeFilterWithVisualString:(id)a3
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
  if (objc_msgSend(v6, "scanString:intoString:", @"("), 0
    && (v9.receiver = a1,
        v9.super_class = (Class)&OBJC_METACLASS___MANodeFilter,
        objc_msgSendSuper2(&v9, sel_scanInstance_withScanner_, a3, v6)))
  {
    char v7 = objc_msgSend(v6, "scanString:intoString:", @""), 0);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end