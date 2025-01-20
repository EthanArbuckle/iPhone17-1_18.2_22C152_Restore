@interface LuceneContextResult
+ (BOOL)supportsSecureCoding;
- (BOOL)forceBottomRank;
- (BOOL)skip;
- (BOOL)titlePrimary;
- (CKContextUIElement)sourceUIElement;
- (Class)classForCoder;
- (LuceneContextResult)initWithCoder:(id)a3;
- (LuceneContextResult)initWithDocId:(int64_t)a3 title:(id)a4 query:(id)a5 url:(id)a6 category:(id)a7;
- (LuceneContextResult)initWithText:(id)a3;
- (NSMutableArray)foldedResults;
- (NSNumber)blendedScore;
- (NSNumber)docId;
- (NSNumber)fingerprintPrimary;
- (NSString)relatedField;
- (NSString)term;
- (NSString)titleTokenString;
- (float)luceneScore;
- (float)relativeScore;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)foldCurrentRank;
- (int64_t)foldScore;
- (unint64_t)docIdRank;
- (unint64_t)titleMatch;
- (void)addToFoldedResults:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeFoldedResult;
- (void)mergeWithResult:(id)a3;
- (void)setBlendedScore:(id)a3;
- (void)setDocId:(id)a3;
- (void)setDocIdRank:(unint64_t)a3;
- (void)setFingerprintPrimary:(id)a3;
- (void)setFoldCurrentRank:(int64_t)a3;
- (void)setFoldScore:(int64_t)a3;
- (void)setFoldedResults:(id)a3;
- (void)setForceBottomRank:(BOOL)a3;
- (void)setLuceneScore:(float)a3;
- (void)setRelatedField:(id)a3;
- (void)setRelativeScore:(float)a3;
- (void)setSkip:(BOOL)a3;
- (void)setSourceUIElement:(id)a3;
- (void)setTerm:(id)a3;
- (void)setTitleMatch:(unint64_t)a3;
- (void)setTitlePrimary:(BOOL)a3;
- (void)setTitleTokenString:(id)a3;
@end

@implementation LuceneContextResult

- (LuceneContextResult)initWithDocId:(int64_t)a3 title:(id)a4 query:(id)a5 url:(id)a6 category:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)LuceneContextResult;
  v8 = [(LuceneContextResult *)&v13 initWithTitle:a4 query:a5 url:a6 category:a7];
  v9 = v8;
  if (v8)
  {
    v8->_foldCurrentRank = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = +[NSNumber numberWithInteger:a3];
    docId = v9->_docId;
    v9->_docId = (NSNumber *)v10;
  }
  return v9;
}

- (LuceneContextResult)initWithText:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LuceneContextResult;
  v3 = [(LuceneContextResult *)&v7 initWithTitle:a3 query:a3 url:0 category:0];
  v4 = v3;
  if (v3)
  {
    v3->_foldCurrentRank = 0x7FFFFFFFFFFFFFFFLL;
    docId = v3->_docId;
    v3->_docId = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LuceneContextResult)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LuceneContextResult;
  return [(LuceneContextResult *)&v4 initWithCoder:a3];
}

- (void)addToFoldedResults:(id)a3
{
  foldedResults = self->_foldedResults;
  if (foldedResults)
  {
    id v4 = a3;
    v5 = foldedResults;
  }
  else
  {
    id v7 = a3;
    v8 = +[NSMutableArray array];
    v9 = self->_foldedResults;
    self->_foldedResults = v8;

    uint64_t v10 = self->_foldedResults;
    id v11 = [(LuceneContextResult *)self copy];
    [(NSMutableArray *)v10 addObject:v11];

    v5 = self->_foldedResults;
    id v4 = v7;
  }
  [(NSMutableArray *)v5 addObject:v4];
}

- (void)mergeWithResult:(id)a3
{
  id v22 = a3;
  id v4 = [(LuceneContextResult *)self topicId];

  if (!v4)
  {
    v5 = [v22 topicId];
    [(LuceneContextResult *)self setTopicId:v5];
  }
  v6 = [(LuceneContextResult *)self debug];
  id v7 = v22;
  if (v6)
  {
    v8 = [v22 debug];

    id v7 = v22;
    if (v8)
    {
      v9 = [(LuceneContextResult *)self debug];
      uint64_t v10 = [v22 category];
      id v11 = (void *)v10;
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      else {
        CFStringRef v12 = &stru_10048C1F8;
      }
      objc_super v13 = [v22 debug];
      v14 = [v9 stringByAppendingFormat:@"\n  mergedWith: %@ %@", v12, v13];
      [(LuceneContextResult *)self setDebug:v14];

      id v7 = v22;
    }
  }
  v15 = [v7 tags];
  id v16 = [v15 count];

  if (v16)
  {
    v17 = [(LuceneContextResult *)self tags];
    id v18 = [v17 count];

    if (v18)
    {
      v19 = [(LuceneContextResult *)self tags];
      id v20 = [v22 tags];
      v21 = [v19 setByAddingObjectsFromSet:v20];
      [(LuceneContextResult *)self setTags:v21];
    }
    else
    {
      v19 = [v22 tags];
      id v20 = [v19 copy];
      [(LuceneContextResult *)self setTags:v20];
    }
  }
  [(LuceneContextResult *)self addToFoldedResults:v22];
}

- (void)finalizeFoldedResult
{
  id v12 = [(NSMutableArray *)self->_foldedResults objectAtIndexedSubscript:0];
  v3 = [v12 docId];
  [(LuceneContextResult *)self setDocId:v3];

  id v4 = [v12 title];
  [(LuceneContextResult *)self setTitle:v4];

  v5 = [v12 query];
  [(LuceneContextResult *)self setQuery:v5];

  v6 = [v12 url];
  [(LuceneContextResult *)self setUrl:v6];

  id v7 = [v12 topicId];
  [(LuceneContextResult *)self setTopicId:v7];

  v8 = [v12 category];
  [(LuceneContextResult *)self setCategory:v8];

  v9 = [v12 debug];
  [(LuceneContextResult *)self setDebug:v9];

  -[LuceneContextResult setTitlePrimary:](self, "setTitlePrimary:", [v12 titlePrimary]);
  -[LuceneContextResult setTitleMatch:](self, "setTitleMatch:", [v12 titleMatch]);
  [v12 relativeScore];
  -[LuceneContextResult setRelativeScore:](self, "setRelativeScore:");
  [v12 luceneScore];
  -[LuceneContextResult setLuceneScore:](self, "setLuceneScore:");
  uint64_t v10 = [v12 titleTokenString];
  [(LuceneContextResult *)self setTitleTokenString:v10];

  -[LuceneContextResult setMinPrefix:](self, "setMinPrefix:", [v12 minPrefix]);
  -[LuceneContextResult setForceBottomRank:](self, "setForceBottomRank:", [v12 forceBottomRank]);
  id v11 = [v12 relatedField];
  [(LuceneContextResult *)self setRelatedField:v11];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LuceneContextResult;
  [(LuceneContextResult *)&v3 encodeWithCoder:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LuceneContextResult;
  id v4 = [(LuceneContextResult *)&v8 copyWithZone:a3];
  [v4 setDocId:self->_docId];
  [v4 setTitlePrimary:self->_titlePrimary];
  [v4 setTitleMatch:self->_titleMatch];
  *(float *)&double v5 = self->_relativeScore;
  [v4 setRelativeScore:v5];
  *(float *)&double v6 = self->_luceneScore;
  [v4 setLuceneScore:v6];
  [v4 setTerm:self->_term];
  [v4 setTitleTokenString:self->_titleTokenString];
  [v4 setForceBottomRank:self->_forceBottomRank];
  [v4 setRelatedField:self->_relatedField];
  return v4;
}

- (NSMutableArray)foldedResults
{
  return self->_foldedResults;
}

- (void)setFoldedResults:(id)a3
{
}

- (int64_t)foldCurrentRank
{
  return self->_foldCurrentRank;
}

- (void)setFoldCurrentRank:(int64_t)a3
{
  self->_foldCurrentRank = a3;
}

- (int64_t)foldScore
{
  return self->_foldScore;
}

- (void)setFoldScore:(int64_t)a3
{
  self->_foldScore = a3;
}

- (NSNumber)fingerprintPrimary
{
  return self->_fingerprintPrimary;
}

- (void)setFingerprintPrimary:(id)a3
{
}

- (BOOL)skip
{
  return self->_skip;
}

- (void)setSkip:(BOOL)a3
{
  self->_skip = a3;
}

- (BOOL)titlePrimary
{
  return self->_titlePrimary;
}

- (void)setTitlePrimary:(BOOL)a3
{
  self->_titlePrimary = a3;
}

- (unint64_t)titleMatch
{
  return self->_titleMatch;
}

- (void)setTitleMatch:(unint64_t)a3
{
  self->_titleMatch = a3;
}

- (NSNumber)docId
{
  return self->_docId;
}

- (void)setDocId:(id)a3
{
}

- (NSString)relatedField
{
  return self->_relatedField;
}

- (void)setRelatedField:(id)a3
{
}

- (unint64_t)docIdRank
{
  return self->_docIdRank;
}

- (void)setDocIdRank:(unint64_t)a3
{
  self->_docIdRank = a3;
}

- (float)relativeScore
{
  return self->_relativeScore;
}

- (void)setRelativeScore:(float)a3
{
  self->_relativeScore = a3;
}

- (NSNumber)blendedScore
{
  return self->_blendedScore;
}

- (void)setBlendedScore:(id)a3
{
}

- (NSString)titleTokenString
{
  return self->_titleTokenString;
}

- (void)setTitleTokenString:(id)a3
{
}

- (CKContextUIElement)sourceUIElement
{
  return self->_sourceUIElement;
}

- (void)setSourceUIElement:(id)a3
{
}

- (float)luceneScore
{
  return self->_luceneScore;
}

- (void)setLuceneScore:(float)a3
{
  self->_luceneScore = a3;
}

- (BOOL)forceBottomRank
{
  return self->_forceBottomRank;
}

- (void)setForceBottomRank:(BOOL)a3
{
  self->_forceBottomRank = a3;
}

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_sourceUIElement, 0);
  objc_storeStrong((id *)&self->_titleTokenString, 0);
  objc_storeStrong((id *)&self->_blendedScore, 0);
  objc_storeStrong((id *)&self->_relatedField, 0);
  objc_storeStrong((id *)&self->_docId, 0);
  objc_storeStrong((id *)&self->_fingerprintPrimary, 0);
  objc_storeStrong((id *)&self->_foldedResults, 0);
}

@end