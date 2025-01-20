@interface PDFTextSearchAggregator
- (BOOL)cancelFind;
- (NSString)searchString;
- (PDFTextSearchAggregator)initWithSearchString:(id)a3 aggregator:(id)a4;
- (UITextSearchAggregator)aggregator;
- (void)foundResults:(id)a3 forDocument:(id)a4;
- (void)foundResults:(id)a3 forPage:(id)a4;
- (void)invalidate;
@end

@implementation PDFTextSearchAggregator

- (PDFTextSearchAggregator)initWithSearchString:(id)a3 aggregator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFTextSearchAggregator;
  v9 = [(PDFTextSearchAggregator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    objc_storeStrong((id *)&v10->_aggregator, a4);
    v10->_isActive = 1;
  }

  return v10;
}

- (void)invalidate
{
  self->_isActive = 0;
}

- (BOOL)cancelFind
{
  return !self->_isActive;
}

- (void)foundResults:(id)a3 forPage:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[PDFTextRange textRangeFromSelection:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (v10) {
          [(UITextSearchAggregator *)self->_aggregator foundRange:v10 forSearchString:self->_searchString inDocument:0];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)foundResults:(id)a3 forDocument:(id)a4
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (UITextSearchAggregator)aggregator
{
  return self->_aggregator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

@end