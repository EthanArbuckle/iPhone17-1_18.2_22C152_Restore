@interface EMFInvertedIndex
- (EMFIndexStrategy)strategy;
- (EMFInvertedIndex)initWithTermIndex:(id)a3 andDocumentIndex:(id)a4;
- (NSBundle)assetBundle;
- (NSDictionary)documentIndex;
- (NSDictionary)termIndex;
- (NSURL)documentIndexURL;
- (NSURL)termIndexURL;
- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3;
- (id)commonDocumentsForTerms:(id)a3;
- (id)postingsForTerm:(id)a3;
- (id)termWeightForTerm:(id)a3 inDocument:(id)a4;
- (id)termsForDocument:(id)a3;
- (void)setAssetBundle:(id)a3;
- (void)setDocumentIndex:(id)a3;
- (void)setDocumentIndexURL:(id)a3;
- (void)setStrategy:(id)a3;
- (void)setTermIndex:(id)a3;
- (void)setTermIndexURL:(id)a3;
@end

@implementation EMFInvertedIndex

- (EMFInvertedIndex)initWithTermIndex:(id)a3 andDocumentIndex:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMFInvertedIndex;
  v9 = [(EMFInvertedIndex *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_termIndex, a3);
    objc_storeStrong((id *)&v10->_documentIndex, a4);
  }

  return v10;
}

- (id)postingsForTerm:(id)a3
{
  id v4 = a3;
  v5 = [(EMFInvertedIndex *)self strategy];
  v6 = [v5 postingsForTerm:v4];

  return v6;
}

- (id)termsForDocument:(id)a3
{
  id v4 = a3;
  v5 = [(EMFInvertedIndex *)self strategy];
  v6 = [v5 termsForDocument:v4];

  return v6;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EMFInvertedIndex *)self strategy];
  v9 = [v8 termWeightForTerm:v7 inDocument:v6];

  return v9;
}

- (id)commonDocumentsForTerms:(id)a3
{
  id v4 = a3;
  v5 = [(EMFInvertedIndex *)self strategy];
  id v6 = [v5 commonDocumentsForTerms:v4];

  return v6;
}

- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  id v4 = a3;
  v5 = [(EMFInvertedIndex *)self strategy];
  id v6 = [v5 calculateDocumentWeightsForQueryTokenCounts:v4];

  return v6;
}

- (EMFIndexStrategy)strategy
{
  strategy = self->_strategy;
  if (!strategy)
  {
    id v4 = [(EMFInvertedIndex *)self termIndex];
    v5 = [(EMFInvertedIndex *)self documentIndex];
    id v6 = +[EMFIndexStrategyFactory defaultStrategyWithTermIndex:v4 andDocumentIndex:v5];
    id v7 = self->_strategy;
    self->_strategy = v6;

    strategy = self->_strategy;
  }
  return strategy;
}

- (NSDictionary)termIndex
{
  return self->_termIndex;
}

- (void)setTermIndex:(id)a3
{
}

- (NSDictionary)documentIndex
{
  return self->_documentIndex;
}

- (void)setDocumentIndex:(id)a3
{
}

- (NSURL)termIndexURL
{
  return self->_termIndexURL;
}

- (void)setTermIndexURL:(id)a3
{
}

- (NSURL)documentIndexURL
{
  return self->_documentIndexURL;
}

- (void)setDocumentIndexURL:(id)a3
{
}

- (NSBundle)assetBundle
{
  return self->_assetBundle;
}

- (void)setAssetBundle:(id)a3
{
}

- (void)setStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_assetBundle, 0);
  objc_storeStrong((id *)&self->_documentIndexURL, 0);
  objc_storeStrong((id *)&self->_termIndexURL, 0);
  objc_storeStrong((id *)&self->_documentIndex, 0);
  objc_storeStrong((id *)&self->_termIndex, 0);
}

@end