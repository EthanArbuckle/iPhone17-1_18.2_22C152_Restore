@interface EQKitMathMLMOperator
- (BOOL)isEmbellishedOperator;
- (EQKitMathMLMOperator)initWithString:(id)a3 environment:(id)a4;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (unsigned)operatorId;
@end

@implementation EQKitMathMLMOperator

- (EQKitMathMLMOperator)initWithString:(id)a3 environment:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)EQKitMathMLMOperator;
  v6 = -[EQKitMathMLMToken initWithString:environment:](&v11, sel_initWithString_environment_);
  if (v6)
  {
    uint64_t v7 = [a4 operatorDictionary];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[a3 UTF8String]);
    v6->mOperatorId = EQKit::Config::Operator::Dictionary::operatorId(v7, __p);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMOperator;
  return [(EQKitMathMLMToken *)&v5 initFromXMLNode:a3 parser:a4];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMOperator mathMLAttributes]::sAttributesSet, -[EQKitMathMLMOperator mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMOver mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMOperator mathMLAttributes]::sAttributesSet;
}

- (unsigned)operatorId
{
  return self->mOperatorId;
}

- (BOOL)isEmbellishedOperator
{
  return 1;
}

@end