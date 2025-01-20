@interface EQKitMathMLMStringLiteral
- (BOOL)schemataIsQuoted;
- (const)mathMLAttributes;
@end

@implementation EQKitMathMLMStringLiteral

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesData, (int *)qword_2558BE7C8);
  }
  return &-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesSet;
}

- (BOOL)schemataIsQuoted
{
  return 1;
}

@end