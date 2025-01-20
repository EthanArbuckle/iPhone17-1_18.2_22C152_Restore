@interface EQKitMathMLMFraction
- (BOOL)isEmbellishedOperator;
- (BOOL)schemataAutomaticSourceAttribution;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (id)schemataDenominator;
- (id)schemataNumerator;
@end

@implementation EQKitMathMLMFraction

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMFraction;
  return [(EQKitMathMLBinaryNode *)&v5 initFromXMLNode:a3 parser:a4];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMFraction mathMLAttributes]::sAttributesSet, -[EQKitMathMLMFraction mathMLAttributes]::sAttributesData, &-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMFraction mathMLAttributes]::sAttributesSet;
}

- (BOOL)isEmbellishedOperator
{
  return [(EQKitMathMLNode *)self->super.mFirst isEmbellishedOperator];
}

- (id)operatorCore
{
  return [(EQKitMathMLNode *)self->super.mFirst operatorCore];
}

- (id)schemataNumerator
{
  return self->super.mFirst;
}

- (id)schemataDenominator
{
  return self->super.mSecond;
}

- (BOOL)schemataAutomaticSourceAttribution
{
  return 0;
}

@end