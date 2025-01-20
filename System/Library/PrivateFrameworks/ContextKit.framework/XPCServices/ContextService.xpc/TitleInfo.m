@interface TitleInfo
- (BOOL)forceBottomRank;
- (NSArray)conditionals;
- (NSSet)importantTokens;
- (NSString)title;
- (NSString)tokenString;
- (NSString)topicIdOverride;
- (id)debugDescription;
- (int64_t)minPrefix;
- (unint64_t)index;
- (unint64_t)tokenCount;
- (unint64_t)tokenCountMatching;
- (unint64_t)tokenCountPrimary;
- (void)setConditionals:(id)a3;
- (void)setForceBottomRank:(BOOL)a3;
- (void)setImportantTokens:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setMinPrefix:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTokenCount:(unint64_t)a3;
- (void)setTokenCountMatching:(unint64_t)a3;
- (void)setTokenCountPrimary:(unint64_t)a3;
- (void)setTokenString:(id)a3;
- (void)setTopicIdOverride:(id)a3;
@end

@implementation TitleInfo

- (id)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)TitleInfo;
  v3 = [(TitleInfo *)&v6 debugDescription];
  v4 = +[NSString stringWithFormat:@"%@: %@ %@ %lu %lu %lu %lu C:%@ TS:%@", v3, self->_title, self->_importantTokens, self->_tokenCountMatching, self->_tokenCountPrimary, self->_tokenCount, self->_index, self->_conditionals, self->_tokenString];

  return v4;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)topicIdOverride
{
  return self->_topicIdOverride;
}

- (void)setTopicIdOverride:(id)a3
{
}

- (NSSet)importantTokens
{
  return self->_importantTokens;
}

- (void)setImportantTokens:(id)a3
{
}

- (unint64_t)tokenCountPrimary
{
  return self->_tokenCountPrimary;
}

- (void)setTokenCountPrimary:(unint64_t)a3
{
  self->_tokenCountPrimary = a3;
}

- (unint64_t)tokenCount
{
  return self->_tokenCount;
}

- (void)setTokenCount:(unint64_t)a3
{
  self->_tokenCount = a3;
}

- (unint64_t)tokenCountMatching
{
  return self->_tokenCountMatching;
}

- (void)setTokenCountMatching:(unint64_t)a3
{
  self->_tokenCountMatching = a3;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void)setTokenString:(id)a3
{
}

- (int64_t)minPrefix
{
  return self->_minPrefix;
}

- (void)setMinPrefix:(int64_t)a3
{
  self->_minPrefix = a3;
}

- (BOOL)forceBottomRank
{
  return self->_forceBottomRank;
}

- (void)setForceBottomRank:(BOOL)a3
{
  self->_forceBottomRank = a3;
}

- (NSArray)conditionals
{
  return self->_conditionals;
}

- (void)setConditionals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionals, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_importantTokens, 0);
  objc_storeStrong((id *)&self->_topicIdOverride, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end