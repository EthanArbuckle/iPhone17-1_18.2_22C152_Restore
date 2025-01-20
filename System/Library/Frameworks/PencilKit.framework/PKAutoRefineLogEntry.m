@interface PKAutoRefineLogEntry
- (BOOL)isAutoRefined;
- (NSArray)originalStrokes;
- (NSArray)refinedStrokes;
- (NSArray)unchangedStrokes;
- (NSDictionary)debugInfo;
- (NSLocale)locale;
- (PKAutoRefineLogEntry)initWithRefinedStrokes:(id)a3 originalStrokes:(id)a4 unchangedStrokes:(id)a5 locale:(id)a6 refinedWordCount:(int64_t)a7 duration:(double)a8 isAutoRefined:(BOOL)a9 debugInfo:(id)a10;
- (double)duration;
- (double)tokenDeviation;
- (double)tokenTranslation;
- (int64_t)refinedWordCount;
- (void)estimateMetricsWithTokenDeviation:(double)a3 tokenHeight:(double)a4;
@end

@implementation PKAutoRefineLogEntry

- (PKAutoRefineLogEntry)initWithRefinedStrokes:(id)a3 originalStrokes:(id)a4 unchangedStrokes:(id)a5 locale:(id)a6 refinedWordCount:(int64_t)a7 duration:(double)a8 isAutoRefined:(BOOL)a9 debugInfo:(id)a10
{
  id v25 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  v26.receiver = self;
  v26.super_class = (Class)PKAutoRefineLogEntry;
  v20 = [(PKAutoRefineLogEntry *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_refinedStrokes, a3);
    objc_storeStrong((id *)&v21->_originalStrokes, a4);
    objc_storeStrong((id *)&v21->_unchangedStrokes, a5);
    objc_storeStrong((id *)&v21->_locale, a6);
    v21->_refinedWordCount = a7;
    *(_OWORD *)&v21->_tokenDeviation = xmmword_1C482A010;
    v21->_duration = a8;
    objc_storeStrong((id *)&v21->_debugInfo, a10);
    v21->_isAutoRefined = a9;
  }

  return v21;
}

- (void)estimateMetricsWithTokenDeviation:(double)a3 tokenHeight:(double)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  self->_tokenDeviation = a3;
  if (a4 > 0.0)
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v9 = self->_originalStrokes;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    double height = v7;
    double width = v8;
    double y = v6;
    double x = v5;
    if (v10)
    {
      uint64_t v15 = v10;
      uint64_t v16 = *(void *)v38;
      double height = v7;
      double width = v8;
      double y = v6;
      double x = v5;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * v17) _bounds];
          v48.origin.double x = v18;
          v48.origin.double y = v19;
          v48.size.double width = v20;
          v48.size.double height = v21;
          v44.origin.double x = x;
          v44.origin.double y = y;
          v44.size.double width = width;
          v44.size.double height = height;
          CGRect v45 = CGRectUnion(v44, v48);
          double x = v45.origin.x;
          double y = v45.origin.y;
          double width = v45.size.width;
          double height = v45.size.height;
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v15);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = self->_refinedStrokes;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v26) _bounds];
          v49.origin.double x = v27;
          v49.origin.double y = v28;
          v49.size.double width = v29;
          v49.size.double height = v30;
          v46.origin.double x = v5;
          v46.origin.double y = v6;
          v46.size.double width = v8;
          v46.size.double height = v7;
          CGRect v47 = CGRectUnion(v46, v49);
          double v5 = v47.origin.x;
          double v6 = v47.origin.y;
          double v8 = v47.size.width;
          double v7 = v47.size.height;
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    double v31 = v8 * 0.5 + v5 - (width * 0.5 + x);
    self->_tokenTranslation = sqrt((v7 * 0.5 + v6 - (height * 0.5 + y)) * (v7 * 0.5 + v6 - (height * 0.5 + y)) + v31 * v31)
                            / a4;
  }
}

- (NSArray)refinedStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)originalStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)unchangedStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 40, 1);
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)refinedWordCount
{
  return self->_refinedWordCount;
}

- (double)tokenDeviation
{
  return self->_tokenDeviation;
}

- (double)tokenTranslation
{
  return self->_tokenTranslation;
}

- (BOOL)isAutoRefined
{
  return self->_isAutoRefined;
}

- (NSDictionary)debugInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unchangedStrokes, 0);
  objc_storeStrong((id *)&self->_originalStrokes, 0);

  objc_storeStrong((id *)&self->_refinedStrokes, 0);
}

@end