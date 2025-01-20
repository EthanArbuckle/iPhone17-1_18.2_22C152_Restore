@interface EQKitMathMLMUnder
- (BOOL)isEmbellishedOperator;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (id)schemataBase;
- (id)schemataOver;
- (id)schemataUnder;
@end

@implementation EQKitMathMLMUnder

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMUnder;
  return [(EQKitMathMLBinaryNode *)&v5 initFromXMLNode:a3 parser:a4];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMUnder mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMUnder mathMLAttributes]::sAttributesData, -[EQKitMathMLMUnderover mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMUnder mathMLAttributes]::sAttributesSet;
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
  return 0;
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