@interface EQKitMathMLMPadded
- (BOOL)isEmbellishedOperator;
- (const)mathMLAttributes;
- (id)operatorCore;
- (id)schemataNode;
- (void)dealloc;
@end

@implementation EQKitMathMLMPadded

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMPadded mathMLAttributes]::sAttributesSet, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData, -[EQKitMathMLMSpace mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMPadded mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EQKitMathMLMPadded;
  [(EQKitMathMLUnaryNode *)&v2 dealloc];
}

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mChild isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mChild operatorCore];
}

- (id)schemataNode
{
  return self->super.mChild;
}

@end