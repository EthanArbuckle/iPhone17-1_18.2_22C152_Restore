@interface _LTDisambiguationLinkConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)adjacencyList;
- (NSArray)unvalidatedAdjacencyList;
- (NSNumber)defaultGender;
- (NSNumber)gender;
- (NSSet)edgeTypes;
- (_LTDisambiguationLinkConfiguration)initWithCoder:(id)a3;
- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 adjacencyList:(id)a5 gender:(id)a6 defaultGender:(id)a7;
- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 unvalidatedAdjacencyList:(id)a5;
- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 adjacencyList:(id)a7 gender:(id)a8 defaultGender:(id)a9;
- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 unvalidatedAdjacencyList:(id)a7;
- (_NSRange)sourceRange;
- (_NSRange)targetRange;
- (id)_unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_finishValidating;
- (void)_insertPrefix:(id)a3;
- (void)_validateWithAdjacencyList:(id)a3 gender:(id)a4 defaultGender:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTDisambiguationLinkConfiguration

- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 adjacencyList:(id)a5 gender:(id)a6 defaultGender:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v10 = a3.length;
  NSUInteger v11 = a3.location;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_LTDisambiguationLinkConfiguration;
  v16 = [(_LTDisambiguationLinkConfiguration *)&v22 init];
  v17 = v16;
  if (v16)
  {
    v16->_sourceRange.NSUInteger location = v11;
    v16->_sourceRange.NSUInteger length = v10;
    v16->_targetRange.NSUInteger location = location;
    v16->_targetRange.NSUInteger length = length;
    uint64_t v18 = [v13 copy];
    adjacencyList = v17->_adjacencyList;
    v17->_adjacencyList = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_gender, a6);
    objc_storeStrong((id *)&v17->_defaultGender, a7);
    v20 = v17;
  }

  return v17;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 adjacencyList:(id)a7 gender:(id)a8 defaultGender:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  uint64_t v20 = [a3 rangeOfString:a4];
  uint64_t v22 = v21;
  uint64_t v23 = [v19 rangeOfString:v18];
  uint64_t v25 = v24;

  v26 = 0;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL && v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:](self, "initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:", v20, v22, v23, v25, v15, v16, v17);
    v26 = self;
  }

  return v26;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceRange:(_NSRange)a3 targetRange:(_NSRange)a4 unvalidatedAdjacencyList:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDisambiguationLinkConfiguration;
  NSUInteger v11 = [(_LTDisambiguationLinkConfiguration *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_sourceRange.NSUInteger location = v8;
    v11->_sourceRange.NSUInteger length = v7;
    v11->_targetRange.NSUInteger location = location;
    v11->_targetRange.NSUInteger length = length;
    uint64_t v13 = [v10 copy];
    unvalidatedAdjacencyList = v12->_unvalidatedAdjacencyList;
    v12->_unvalidatedAdjacencyList = (NSArray *)v13;

    adjacencyList = v12->_adjacencyList;
    v12->_adjacencyList = (NSArray *)MEMORY[0x263EFFA68];

    gender = v12->_gender;
    v12->_gender = 0;

    defaultGender = v12->_defaultGender;
    v12->_defaultGender = 0;

    id v18 = v12;
  }

  return v12;
}

- (_LTDisambiguationLinkConfiguration)initWithSourceText:(id)a3 sourceSnippet:(id)a4 targetText:(id)a5 targetSnippet:(id)a6 unvalidatedAdjacencyList:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  uint64_t v15 = [a3 rangeOfString:a4];
  uint64_t v17 = v16;
  uint64_t v18 = [v14 rangeOfString:v13];
  uint64_t v20 = v19;

  uint64_t v21 = 0;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:unvalidatedAdjacencyList:](self, "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", v15, v17, v18, v20, v12);
    uint64_t v21 = self;
  }

  return v21;
}

- (NSSet)edgeTypes
{
  uint64_t v2 = [(NSArray *)self->_adjacencyList _ltCompactMap:&__block_literal_global_2];
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x263EFFA68];
  if (v2) {
    v4 = (void *)v2;
  }
  id v5 = v4;

  v6 = [MEMORY[0x263EFFA08] setWithArray:v5];

  return (NSSet *)v6;
}

- (void)_validateWithAdjacencyList:(id)a3 gender:(id)a4 defaultGender:(id)a5
{
  NSUInteger v8 = (NSNumber *)a4;
  v9 = (NSNumber *)a5;
  id v10 = (NSArray *)[a3 copy];
  adjacencyList = self->_adjacencyList;
  self->_adjacencyList = v10;

  gender = self->_gender;
  self->_gender = v8;
  id v14 = v8;

  defaultGender = self->_defaultGender;
  self->_defaultGender = v9;
}

- (void)_finishValidating
{
  self->_unvalidatedAdjacencyList = 0;
  MEMORY[0x270F9A758]();
}

- (id)_unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:(unint64_t)a3
{
  unvalidatedAdjacencyList = self->_unvalidatedAdjacencyList;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95___LTDisambiguationLinkConfiguration__unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex___block_invoke;
  v6[3] = &__block_descriptor_40_e32_B16__0___LTUnvalidatedEdgeInfo_8l;
  v6[4] = a3;
  v4 = [(NSArray *)unvalidatedAdjacencyList lt_firstObjectPassingTest:v6];

  return v4;
}

- (void)_insertPrefix:(id)a3
{
  uint64_t v4 = [a3 length];
  if (v4)
  {
    self->_sourceRange.location += v4;
    self->_targetRange.location += v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08D40];
  NSUInteger location = self->_sourceRange.location;
  NSUInteger length = self->_sourceRange.length;
  id v9 = a3;
  NSUInteger v7 = objc_msgSend(v4, "valueWithRange:", location, length);
  [v9 encodeObject:v7 forKey:@"sourceRange"];

  NSUInteger v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  [v9 encodeObject:v8 forKey:@"targetRange"];

  [v9 encodeObject:self->_adjacencyList forKey:@"adjacencyList"];
  [v9 encodeObject:self->_gender forKey:@"gender"];
  [v9 encodeObject:self->_defaultGender forKey:@"defaultGender"];
}

- (_LTDisambiguationLinkConfiguration)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_LTDisambiguationLinkConfiguration;
  id v5 = [(_LTDisambiguationLinkConfiguration *)&v21 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceRange"];
    v5->_sourceRange.NSUInteger location = [v6 rangeValue];
    v5->_sourceRange.NSUInteger length = v7;

    NSUInteger v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetRange"];
    v5->_targetRange.NSUInteger location = [v8 rangeValue];
    v5->_targetRange.NSUInteger length = v9;

    id v10 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    NSUInteger v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    id v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"adjacencyList"];
    adjacencyList = v5->_adjacencyList;
    v5->_adjacencyList = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gender"];
    gender = v5->_gender;
    v5->_gender = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultGender"];
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSNumber *)v17;

    uint64_t v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unvalidatedAdjacencyList = self->_unvalidatedAdjacencyList;
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "allocWithZone:");
  if (unvalidatedAdjacencyList)
  {
    NSUInteger v7 = (void *)[v6 initWithArray:self->_unvalidatedAdjacencyList copyItems:1];
    NSUInteger v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", self->_sourceRange.location, self->_sourceRange.length, self->_targetRange.location, self->_targetRange.length, v7);
  }
  else
  {
    NSUInteger v7 = (void *)[v6 initWithArray:self->_adjacencyList copyItems:1];
    NSUInteger v9 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    id v10 = (void *)[(NSNumber *)self->_gender copy];
    NSUInteger v11 = (void *)[(NSNumber *)self->_defaultGender copy];
    NSUInteger v8 = objc_msgSend(v9, "initWithSourceRange:targetRange:adjacencyList:gender:defaultGender:", self->_sourceRange.location, self->_sourceRange.length, self->_targetRange.location, self->_targetRange.length, v7, v10, v11);
  }
  return v8;
}

- (_NSRange)sourceRange
{
  NSUInteger length = self->_sourceRange.length;
  NSUInteger location = self->_sourceRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)targetRange
{
  NSUInteger length = self->_targetRange.length;
  NSUInteger location = self->_targetRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)adjacencyList
{
  return self->_adjacencyList;
}

- (NSNumber)gender
{
  return self->_gender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSArray)unvalidatedAdjacencyList
{
  return self->_unvalidatedAdjacencyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGender, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_adjacencyList, 0);

  objc_storeStrong((id *)&self->_unvalidatedAdjacencyList, 0);
}

@end