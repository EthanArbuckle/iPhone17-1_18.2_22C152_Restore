@interface EQKitMathMLUnaryNode
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLUnaryNode)init;
- (EQKitMathMLUnaryNode)initWithChild:(id)a3;
- (EQKitMathMLUnaryNode)initWithChildren:(id)a3;
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (id)children;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLUnaryNode

- (EQKitMathMLUnaryNode)init
{
  return [(EQKitMathMLUnaryNode *)self initWithChild:0];
}

- (EQKitMathMLUnaryNode)initWithChild:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = [(EQKitMathMLUnaryNode *)&v7 init];
  if (v4)
  {
    v5 = (EQKitMathMLNode *)a3;
    v4->mChild = v5;
    [(EQKitMathMLNode *)v5 setParent:v4];
  }
  return v4;
}

- (EQKitMathMLUnaryNode)initWithChildren:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = [(EQKitMathMLUnaryNode *)&v6 init];
  if (v4) {
    v4->mChild = (EQKitMathMLNode *)[[EQKitMathMLMRow alloc] initWithChildren:a3];
  }
  return v4;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v7 = objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:");
  if (v7)
  {
    return [(EQKitMathMLUnaryNode *)self initWithChild:v7];
  }
  else
  {
    [a4 reportError:5 withNode:a3];

    return 0;
  }
}

- (id)children
{
  return [(EQKitMathMLNode *)self->mChild children];
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return [(EQKitMathMLNode *)self->mChild isBaseFontNameUsed];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLUnaryNode;
  [(EQKitMathMLUnaryNode *)&v3 dealloc];
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end