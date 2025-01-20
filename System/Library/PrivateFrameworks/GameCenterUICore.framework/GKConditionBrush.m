@interface GKConditionBrush
- (CGSize)sizeForInput:(id)a3;
- (GKBrush)noBrush;
- (GKBrush)yesBrush;
- (NSPredicate)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setNoBrush:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setYesBrush:(id)a3;
@end

@implementation GKConditionBrush

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKConditionBrush;
  id v4 = [(GKBrush *)&v9 copyWithZone:a3];
  v5 = [(GKConditionBrush *)self predicate];
  [v4 setPredicate:v5];

  v6 = [(GKConditionBrush *)self yesBrush];
  [v4 setYesBrush:v6];

  v7 = [(GKConditionBrush *)self noBrush];
  [v4 setNoBrush:v7];

  return v4;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a5;
  v11 = [(GKConditionBrush *)self predicate];
  int v12 = [v11 evaluateWithObject:v14];

  v13 = &OBJC_IVAR___GKConditionBrush__noBrush;
  if (v12) {
    v13 = &OBJC_IVAR___GKConditionBrush__yesBrush;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v13), "drawInRect:withContext:input:", a4, v14, x, y, width, height);
}

- (CGSize)sizeForInput:(id)a3
{
  id v4 = a3;
  v5 = [(GKConditionBrush *)self predicate];
  int v6 = [v5 evaluateWithObject:v4];

  v7 = &OBJC_IVAR___GKConditionBrush__noBrush;
  if (v6) {
    v7 = &OBJC_IVAR___GKConditionBrush__yesBrush;
  }
  [*(id *)((char *)&self->super.super.isa + *v7) sizeForInput:v4];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (GKBrush)yesBrush
{
  return self->_yesBrush;
}

- (void)setYesBrush:(id)a3
{
}

- (GKBrush)noBrush
{
  return self->_noBrush;
}

- (void)setNoBrush:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBrush, 0);
  objc_storeStrong((id *)&self->_yesBrush, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end