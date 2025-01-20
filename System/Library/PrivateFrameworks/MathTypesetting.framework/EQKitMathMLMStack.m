@interface EQKitMathMLMStack
- (BOOL)isBaseFontNameUsed;
- (EQKitMathMLMStack)initWithChildren:(id)a3;
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
- (id)schemataChildren;
- (int)schemataAlign;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLMStack

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v5 = [a4 parseChildrenAsArrayFromXMLNode:a3];

  return [(EQKitMathMLMStack *)self initWithChildren:v5];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:ne180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStack mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMStack mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStackCarries mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStack mathMLAttributes]::sAttributesSet;
}

- (EQKitMathMLMStack)initWithChildren:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)EQKitMathMLMStack;
  v4 = [(EQKitMathMLMStack *)&v23 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->mAlign = 0;
    uint64_t v6 = [a3 count];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v10 = [a3 objectAtIndex:i];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v8)
          {
            v8 = (void *)[a3 mutableCopy];
            a3 = v8;
          }
          v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v10, 0);
          v12 = [[EQKitMathMLMStackGroup alloc] initWithChildren:v11];
          [v8 replaceObjectAtIndex:i withObject:v12];
        }
      }
    }
    else
    {
      v8 = 0;
    }
    v13 = (NSArray *)a3;
    v5->mChildren = v13;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v17++) setParent:v5];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMStack;
  [(EQKitMathMLMStack *)&v3 dealloc];
}

- (id)schemataChildren
{
  return self->mChildren;
}

- (int)schemataAlign
{
  return self->mAlign;
}

- (BOOL)isBaseFontNameUsed
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mChildren = self->mChildren;
  uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mChildren);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) isBaseFontNameUsed])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)mChildren countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end