@interface INFSentenceTokenWithContext
+ (id)sentenceResolvedTokenWithOriginalToken:(id)a3 placeholderName:(id)a4;
- (BOOL)isResolved;
- (INFSentenceContext)context;
- (INFSentenceToken)originalToken;
- (INFSentenceTokenWithContext)initWithToken:(id)a3 variableName:(id)a4;
- (NSString)placeholderName;
- (void)setContext:(id)a3;
- (void)setOriginalToken:(id)a3;
- (void)setPlaceholderName:(id)a3;
- (void)setResolved:(BOOL)a3;
@end

@implementation INFSentenceTokenWithContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalToken, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_placeholderName, 0);
}

- (void)setOriginalToken:(id)a3
{
}

- (INFSentenceToken)originalToken
{
  return self->_originalToken;
}

- (void)setContext:(id)a3
{
}

- (INFSentenceContext)context
{
  return self->_context;
}

- (void)setPlaceholderName:(id)a3
{
}

- (NSString)placeholderName
{
  return self->_placeholderName;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (INFSentenceTokenWithContext)initWithToken:(id)a3 variableName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INFSentenceTokenWithContext;
  v9 = [(INFSentenceTokenWithContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalToken, a3);
    objc_storeStrong((id *)&v10->_placeholderName, a4);
  }

  return v10;
}

+ (id)sentenceResolvedTokenWithOriginalToken:(id)a3 placeholderName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithToken:v7 variableName:v6];

  return v8;
}

@end