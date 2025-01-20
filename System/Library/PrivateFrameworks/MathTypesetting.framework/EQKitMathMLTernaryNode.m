@interface EQKitMathMLTernaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLTernaryNode)init;
- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5;
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (id)children;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLTernaryNode

- (EQKitMathMLTernaryNode)init
{
  return [(EQKitMathMLTernaryNode *)self initWithFirst:0 second:0 third:0];
}

- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLTernaryNode;
  v8 = [(EQKitMathMLTernaryNode *)&v10 init];
  if (v8)
  {
    v8->mFirst = (EQKitMathMLNode *)a3;
    v8->mSecond = (EQKitMathMLNode *)a4;
    v8->mThird = (EQKitMathMLNode *)a5;
    [(EQKitMathMLNode *)v8->mFirst setParent:v8];
    [(EQKitMathMLNode *)v8->mSecond setParent:v8];
    [(EQKitMathMLNode *)v8->mThird setParent:v8];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLTernaryNode;
  [(EQKitMathMLTernaryNode *)&v3 dealloc];
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v7 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if ([v7 count] == 3)
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = [v7 objectAtIndex:1];
    uint64_t v10 = [v7 objectAtIndex:2];
    return [(EQKitMathMLTernaryNode *)self initWithFirst:v8 second:v9 third:v10];
  }
  else
  {
    [a4 reportError:5 withNode:a3];

    return 0;
  }
}

- (id)children
{
  v4[3] = *MEMORY[0x263EF8340];
  mSecond = self->mSecond;
  v4[0] = self->mFirst;
  v4[1] = mSecond;
  v4[2] = self->mThird;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  if ([(EQKitMathMLNode *)self->mFirst isBaseFontNameUsed]
    || [(EQKitMathMLNode *)self->mSecond isBaseFontNameUsed])
  {
    return 1;
  }
  mThird = self->mThird;

  return [(EQKitMathMLNode *)mThird isBaseFontNameUsed];
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end