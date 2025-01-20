@interface _HKXMLExtractor
- (_HKXMLExtractor)init;
- (id)_matchSpecificationWithAttributes:(id)a3;
- (id)getDataForTagSpecification:(id)a3;
- (void)_parseWithXMLParser:(id)a3;
- (void)_resetScanningState;
- (void)addTagSpecificationForExtraction:(id)a3;
- (void)parseWithData:(id)a3;
- (void)parseWithStream:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation _HKXMLExtractor

- (_HKXMLExtractor)init
{
  v11.receiver = self;
  v11.super_class = (Class)_HKXMLExtractor;
  v2 = [(_HKXMLExtractor *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allTagSpecifications = v2->_allTagSpecifications;
    v2->_allTagSpecifications = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackOfElements = v2->_stackOfElements;
    v2->_stackOfElements = v5;

    matchedTagSpecification = v2->_matchedTagSpecification;
    v2->_matchedTagSpecification = 0;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultTagContent = v2->_resultTagContent;
    v2->_resultTagContent = v8;
  }
  return v2;
}

- (void)addTagSpecificationForExtraction:(id)a3
{
  id v4 = a3;
  v5 = [[_HKXMLExtractorSpecification alloc] initWithSpecificationString:v4];

  [(NSMutableArray *)self->_allTagSpecifications addObject:v5];
}

- (void)parseWithData:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29250];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithData:v5];

  [(_HKXMLExtractor *)self _parseWithXMLParser:v6];
}

- (void)parseWithStream:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29250];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithStream:v5];

  [(_HKXMLExtractor *)self _parseWithXMLParser:v6];
}

- (id)getDataForTagSpecification:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_resultTagContent objectForKeyedSubscript:a3];
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)_parseWithXMLParser:(id)a3
{
  id v4 = a3;
  [v4 setShouldProcessNamespaces:1];
  [v4 setDelegate:self];
  [(_HKXMLExtractor *)self _resetScanningState];
  [v4 parse];
}

- (void)_resetScanningState
{
  [(NSMutableArray *)self->_stackOfElements removeAllObjects];
  [(NSMutableDictionary *)self->_resultTagContent removeAllObjects];
  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;
}

- (id)_matchSpecificationWithAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_allTagSpecifications;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchesElementStack:", self->_stackOfElements, (void)v12))
        {
          v10 = [v9 specificationString];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10 = a3;
  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;
  id v12 = a7;
  id v13 = a4;

  long long v14 = [[_HKXMLExtractorElement alloc] initWithElementName:v13 attributes:v12];
  [(NSMutableArray *)self->_stackOfElements addObject:v14];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __80___HKXMLExtractor_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
  v21 = &unk_1E58C7EB8;
  v22 = self;
  id v23 = v10;
  id v15 = v10;
  [v12 enumerateKeysAndObjectsUsingBlock:&v18];
  -[_HKXMLExtractor _matchSpecificationWithAttributes:](self, "_matchSpecificationWithAttributes:", v12, v18, v19, v20, v21, v22);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = self->_matchedTagSpecification;
  self->_matchedTagSpecification = v16;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  matchedTagSpecification = self->_matchedTagSpecification;
  self->_matchedTagSpecification = 0;

  stackOfElements = self->_stackOfElements;

  [(NSMutableArray *)stackOfElements removeLastObject];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  if (v5 && self->_matchedTagSpecification)
  {
    id v7 = v5;
    uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_resultTagContent, "objectForKeyedSubscript:");
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      [(NSMutableDictionary *)self->_resultTagContent setObject:v6 forKey:self->_matchedTagSpecification];
    }
    [v6 addObject:v7];

    id v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagContent, 0);
  objc_storeStrong((id *)&self->_matchedTagSpecification, 0);
  objc_storeStrong((id *)&self->_stackOfElements, 0);

  objc_storeStrong((id *)&self->_allTagSpecifications, 0);
}

@end