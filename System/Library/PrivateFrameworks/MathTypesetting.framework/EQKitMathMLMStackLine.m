@interface EQKitMathMLMStackLine
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (unint64_t)schemataThickness;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLMStackLine

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStackLine;
  [(EQKitMathMLMStackLine *)&v3 dealloc];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStackRow mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesSet;
}

- (unint64_t)schemataThickness
{
  return 1;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end