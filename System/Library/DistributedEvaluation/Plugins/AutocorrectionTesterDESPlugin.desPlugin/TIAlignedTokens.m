@interface TIAlignedTokens
- (NSString)source;
- (NSString)sourceTransliteration;
- (NSString)target;
- (void)setSource:(id)a3;
- (void)setSourceTransliteration:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation TIAlignedTokens

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (NSString)sourceTransliteration
{
  return self->_sourceTransliteration;
}

- (void)setSourceTransliteration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTransliteration, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end