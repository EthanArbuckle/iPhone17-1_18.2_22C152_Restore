@interface EQKitMathMLMUnderover
- (BOOL)isEmbellishedOperator;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (id)schemataBase;
- (id)schemataOver;
- (id)schemataUnder;
@end

@implementation EQKitMathMLMUnderover

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMUnderover;
  return [(EQKitMathMLTernaryNode *)&v5 initFromXMLNode:a3 parser:a4];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMUnderover mathMLAttributes]::sAttributesSet, -[EQKitMathMLMUnderover mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMUnderover mathMLAttributes]::sAttributesSet;
}

- (id)schemataBase
{
  return self->super.mFirst;
}

- (id)schemataUnder
{
  return self->super.mSecond;
}

- (id)schemataOver
{
  return self->super.mThird;
}

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mFirst isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mFirst operatorCore];
}

@end