@interface HKXMLExtractor
@end

@implementation HKXMLExtractor

void __80___HKXMLExtractor_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;

    v8 = [NSString stringWithFormat:@"@%@", v15];
    v9 = [[_HKXMLExtractorElement alloc] initWithElementName:v8 attributes:0];
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v9];
    uint64_t v10 = [*(id *)(a1 + 32) _matchSpecificationWithAttributes:0];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    [*(id *)(a1 + 32) parser:*(void *)(a1 + 40) foundCharacters:v5];
    [*(id *)(*(void *)(a1 + 32) + 16) removeLastObject];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = 0;
  }
}

@end