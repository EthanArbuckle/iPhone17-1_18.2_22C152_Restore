@interface EQKitMathMLMAlignMark
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLMAlignMark

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignMark;
  return [(EQKitMathMLMAlignMark *)&v5 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMAlignMark;
  [(EQKitMathMLMAlignMark *)&v3 dealloc];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end