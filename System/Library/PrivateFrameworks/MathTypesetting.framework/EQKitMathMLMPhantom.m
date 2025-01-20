@interface EQKitMathMLMPhantom
- (BOOL)isEmbellishedOperator;
- (EQKitMathMLMPhantom)init;
- (id)operatorCore;
- (id)schemataChild;
@end

@implementation EQKitMathMLMPhantom

- (EQKitMathMLMPhantom)init
{
  return [(EQKitMathMLUnaryNode *)self initWithChild:0];
}

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mChild isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mChild operatorCore];
}

- (id)schemataChild
{
  return self->super.mChild;
}

@end