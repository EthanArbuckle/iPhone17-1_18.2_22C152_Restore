@interface EQKitMathMLMSuperscript
- (BOOL)isEmbellishedOperator;
- (id)operatorCore;
- (id)schemataKernel;
- (id)schemataSubscript;
- (id)schemataSuperscript;
@end

@implementation EQKitMathMLMSuperscript

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mFirst isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mFirst operatorCore];
}

- (id)schemataKernel
{
  return self->super.mFirst;
}

- (id)schemataSubscript
{
  return 0;
}

- (id)schemataSuperscript
{
  return self->super.mSecond;
}

@end