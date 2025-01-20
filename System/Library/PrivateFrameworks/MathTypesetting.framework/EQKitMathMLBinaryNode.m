@interface EQKitMathMLBinaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLBinaryNode)init;
- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4;
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (id)children;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLBinaryNode

- (EQKitMathMLBinaryNode)init
{
  return [(EQKitMathMLBinaryNode *)self initWithFirst:0 second:0];
}

- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitMathMLBinaryNode;
  v6 = [(EQKitMathMLBinaryNode *)&v8 init];
  if (v6)
  {
    v6->mFirst = (EQKitMathMLNode *)a3;
    v6->mSecond = (EQKitMathMLNode *)a4;
    [(EQKitMathMLNode *)v6->mFirst setParent:v6];
    [(EQKitMathMLNode *)v6->mSecond setParent:v6];
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v7 = objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if ([v7 count] == 2)
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = [v7 objectAtIndex:1];
    return [(EQKitMathMLBinaryNode *)self initWithFirst:v8 second:v9];
  }
  else
  {
    [a4 reportError:5 withNode:a3];

    return 0;
  }
}

- (id)children
{
  v4[2] = *MEMORY[0x263EF8340];
  mSecond = self->mSecond;
  v4[0] = self->mFirst;
  v4[1] = mSecond;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  if ([(EQKitMathMLNode *)self->mFirst isBaseFontNameUsed]) {
    return 1;
  }
  mSecond = self->mSecond;

  return [(EQKitMathMLNode *)mSecond isBaseFontNameUsed];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLBinaryNode;
  [(EQKitMathMLBinaryNode *)&v3 dealloc];
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end