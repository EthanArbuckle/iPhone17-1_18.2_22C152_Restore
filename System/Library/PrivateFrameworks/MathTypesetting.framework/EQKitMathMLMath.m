@interface EQKitMathMLMath
- (AttributeCollection)attributeCollection;
- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3;
- (BOOL)isBaseFontNameUsed;
- (BOOL)isEmbellishedOperator;
- (BOOL)isNumber;
- (BOOL)isSpaceLike;
- (EQKitLayoutNode)parent;
- (EQKitMathMLMath)init;
- (EQKitSourceAttribution)sourceAttribution;
- (NSArray)children;
- (NSString)description;
- (Schemata)layoutSchemata;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)layoutStyleNode;
- (id)newLayout;
- (id)operatorCore;
- (int)isOperatorPaddingRequired;
- (int64_t)scriptLevelWithBase:(int64_t)a3;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLMath

- (EQKitMathMLMath)init
{
  return 0;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)EQKitMathMLMath;
  v6 = [(EQKitMathMLMath *)&v11 init];
  if (v6)
  {
    v7 = operator new(0x230uLL, MEMORY[0x263F8C180]);
    if (v7)
    {
      v8 = v7;
      v6->mAttributeCollection = EQKit::AttributeCollection::AttributeCollection(v7);
      [a4 setAttributeCollection:v8];
      v9 = (EQKitMathMLNode *)(id)[a4 parseChildrenAsNodeFromXMLNode:a3];
      v6->mExpression = v9;
      [(EQKitMathMLNode *)v9 setParent:v6];
    }
    else
    {
      v6->mAttributeCollection = 0;
    }
    if (v6->mExpression)
    {
      v6->mEnvironment = (EQKitEnvironment *)(id)[a4 environment];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMath mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData, (int *)"N5EQKit19AttributeCollectionE");
  }
  return &-[EQKitMathMLMath mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  mAttributeCollection = self->mAttributeCollection;
  if (mAttributeCollection) {
    (*(void (**)(void *, SEL))(*(void *)mAttributeCollection + 8))(mAttributeCollection, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)EQKitMathMLMath;
  [(EQKitMathMLMath *)&v4 dealloc];
}

- (AttributeCollection)attributeCollection
{
  return (AttributeCollection *)self->mAttributeCollection;
}

- (id)newLayout
{
  v3 = [EQKitLayoutImplementation alloc];
  mEnvironment = self->mEnvironment;

  return [(EQKitLayoutImplementation *)v3 initWithRoot:self environment:mEnvironment];
}

- (EQKitLayoutNode)parent
{
  return 0;
}

- (NSArray)children
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = self->mExpression;
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (Schemata)layoutSchemata
{
  if (self->mExpression) {
    objc_super v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  }
  else {
    objc_super v4 = (EQKit::Layout::Schemata *)[MEMORY[0x263EFF8C0] array];
  }

  return (Schemata *)EQKit::Layout::Schemata::row(v4, (uint64_t)retstr);
}

- (id)layoutStyleNode
{
  return 0;
}

- (int64_t)scriptLevelWithBase:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isSpaceLike
{
  return 0;
}

- (BOOL)isEmbellishedOperator
{
  return 0;
}

- (id)operatorCore
{
  return 0;
}

- (int)isOperatorPaddingRequired
{
  return 1;
}

- (BOOL)isBaseFontNameUsed
{
  return [(EQKitMathMLNode *)self->mExpression isBaseFontNameUsed];
}

- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p expr=%@>", NSStringFromClass(v4), self, self->mExpression];
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end