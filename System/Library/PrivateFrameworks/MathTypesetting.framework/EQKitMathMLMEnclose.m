@interface EQKitMathMLMEnclose
- (const)mathMLAttributes;
- (id)schemataRow;
- (id)sourceAttribution;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLMEnclose

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMEnclose;
  [(EQKitMathMLUnaryNode *)&v3 dealloc];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet, (int *)"/", -[EQKitMathMLMFenced mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet;
}

- (id)schemataRow
{
  return self->super.mChild;
}

- (id)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end