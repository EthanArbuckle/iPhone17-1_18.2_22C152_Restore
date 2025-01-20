@interface EQKitMathMLMOver
- (BOOL)isEmbellishedOperator;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)operatorCore;
- (id)schemataBase;
- (id)schemataOver;
- (id)schemataUnder;
@end

@implementation EQKitMathMLMOver

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMOver;
  return [(EQKitMathMLBinaryNode *)&v5 initFromXMLNode:a3 parser:a4];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesData, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMOver mathMLAttributes]::sAttributesSet;
}

- (id)schemataBase
{
  return self->super.mFirst;
}

- (id)schemataUnder
{
  return 0;
}

- (id)schemataOver
{
  return self->super.mSecond;
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