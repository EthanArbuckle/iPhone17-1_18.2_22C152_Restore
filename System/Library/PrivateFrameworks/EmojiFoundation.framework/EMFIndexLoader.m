@interface EMFIndexLoader
+ (id)_invertedIndexWithTermIndexURL:(id)a3 andDocumentIndexURL:(id)a4 fromBundle:(id)a5;
+ (id)_loadDictionaryResource:(id)a3;
+ (id)defaultIndexForBundle:(id)a3;
+ (id)stemmedIndexForBundle:(id)a3;
+ (void)_inferAndApplyStrategyToIndex:(id)a3;
@end

@implementation EMFIndexLoader

+ (id)defaultIndexForBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 URLForResource:@"term_index" withExtension:@"plist"];
  v6 = [v4 URLForResource:@"document_index" withExtension:@"plist"];
  v7 = [a1 _invertedIndexWithTermIndexURL:v5 andDocumentIndexURL:v6 fromBundle:v4];

  return v7;
}

+ (id)stemmedIndexForBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 URLForResource:@"term_index_stemmed" withExtension:@"plist"];
  v6 = [v4 URLForResource:@"document_index_stemmed" withExtension:@"plist"];
  v7 = [a1 _invertedIndexWithTermIndexURL:v5 andDocumentIndexURL:v6 fromBundle:v4];

  return v7;
}

+ (id)_invertedIndexWithTermIndexURL:(id)a3 andDocumentIndexURL:(id)a4 fromBundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:](v10);
    }
    goto LABEL_10;
  }
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:](v10);
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v11 = [a1 _loadDictionaryResource:v8];
  uint64_t v12 = [a1 _loadDictionaryResource:v9];
  if (!v11) {
    +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:]();
  }
  v13 = (void *)v12;
  if (!v12) {
    +[EMFIndexLoader _invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:].cold.4();
  }
  v14 = [[EMFInvertedIndex alloc] initWithTermIndex:v11 andDocumentIndex:v12];
  [(EMFInvertedIndex *)v14 setTermIndexURL:v8];
  [(EMFInvertedIndex *)v14 setDocumentIndexURL:v9];
  [(EMFInvertedIndex *)v14 setAssetBundle:v10];
  [a1 _inferAndApplyStrategyToIndex:v14];

LABEL_11:
  return v14;
}

+ (id)_loadDictionaryResource:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v15 = 0;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v15];
    id v5 = v15;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[EMFIndexLoader _loadDictionaryResource:]((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
      }
      id v13 = 0;
    }
    else
    {
      if (!v4) {
        +[EMFIndexLoader _loadDictionaryResource:]();
      }
      id v13 = v4;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)_inferAndApplyStrategyToIndex:(id)a3
{
  id v3 = a3;
  id v4 = +[EMFIndexStrategyFactory inferStrategyForIndex:v3];
  [v3 setStrategy:v4];
}

+ (void)_invertedIndexWithTermIndexURL:(void *)a1 andDocumentIndexURL:fromBundle:.cold.1(void *a1)
{
  v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_1(&dword_1B8C45000, MEMORY[0x1E4F14500], v2, "Term index plist could not be found in bundle: '%@'.", v3, v4, v5, v6, 2u);
}

+ (void)_invertedIndexWithTermIndexURL:(void *)a1 andDocumentIndexURL:fromBundle:.cold.2(void *a1)
{
  v1 = [a1 bundlePath];
  OUTLINED_FUNCTION_0_1(&dword_1B8C45000, MEMORY[0x1E4F14500], v2, "Document index plist could not be found in bundle: '%@'", v3, v4, v5, v6, 2u);
}

+ (void)_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:.cold.3()
{
}

+ (void)_invertedIndexWithTermIndexURL:andDocumentIndexURL:fromBundle:.cold.4()
{
}

+ (void)_loadDictionaryResource:.cold.1()
{
}

+ (void)_loadDictionaryResource:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end