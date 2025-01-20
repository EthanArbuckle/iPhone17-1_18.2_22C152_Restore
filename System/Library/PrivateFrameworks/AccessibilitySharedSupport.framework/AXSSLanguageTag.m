@interface AXSSLanguageTag
- (AXSSDialectMap)dialect;
- (AXSSLanguageTag)initWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6;
- (BOOL)createdFromNewline;
- (NSMutableOrderedSet)predictedSecondaryDialects;
- (NSString)content;
- (NSString)taggedString;
- (_NSRange)taggedRange;
- (id)description;
- (int64_t)offsetToInitialLocation;
- (void)addPredictedSecondaryDialects:(id)a3;
- (void)setOffsetToInitialLocation:(int64_t)a3;
- (void)setPredictedSecondaryDialects:(id)a3;
@end

@implementation AXSSLanguageTag

- (AXSSLanguageTag)initWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AXSSLanguageTag;
  v14 = [(AXSSLanguageTag *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_taggedRange.NSUInteger location = location;
    v14->_taggedRange.NSUInteger length = length;
    v16 = objc_msgSend(v13, "substringWithRange:", location, length);
    uint64_t v17 = [v16 copy];
    taggedString = v15->_taggedString;
    v15->_taggedString = (NSString *)v17;

    objc_storeStrong((id *)&v15->_content, a5);
    objc_storeStrong((id *)&v15->_dialect, a3);
    v15->_createdFromNewline = a6;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXSSLanguageTag *)self dialect];
  v5 = [(AXSSLanguageTag *)self taggedString];
  v10.NSUInteger location = [(AXSSLanguageTag *)self taggedRange];
  v6 = NSStringFromRange(v10);
  v7 = [v3 stringWithFormat:@"AXSSLanguageTag <%p>. dialect:%@ content:%@ range:-%@- createdFromNewline:(%d)", self, v4, v5, v6, -[AXSSLanguageTag createdFromNewline](self, "createdFromNewline")];

  return v7;
}

- (void)addPredictedSecondaryDialects:(id)a3
{
  id v4 = a3;
  v5 = [(AXSSLanguageTag *)self predictedSecondaryDialects];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(AXSSLanguageTag *)self setPredictedSecondaryDialects:v6];
  }
  id v7 = [(AXSSLanguageTag *)self predictedSecondaryDialects];
  [v7 unionOrderedSet:v4];
}

- (_NSRange)taggedRange
{
  NSUInteger length = self->_taggedRange.length;
  NSUInteger location = self->_taggedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)taggedString
{
  return self->_taggedString;
}

- (int64_t)offsetToInitialLocation
{
  return self->_offsetToInitialLocation;
}

- (void)setOffsetToInitialLocation:(int64_t)a3
{
  self->_offsetToInitialLocation = a3;
}

- (NSString)content
{
  return self->_content;
}

- (AXSSDialectMap)dialect
{
  return self->_dialect;
}

- (BOOL)createdFromNewline
{
  return self->_createdFromNewline;
}

- (NSMutableOrderedSet)predictedSecondaryDialects
{
  return self->_predictedSecondaryDialects;
}

- (void)setPredictedSecondaryDialects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, 0);
  objc_storeStrong((id *)&self->_dialect, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_taggedString, 0);
}

@end