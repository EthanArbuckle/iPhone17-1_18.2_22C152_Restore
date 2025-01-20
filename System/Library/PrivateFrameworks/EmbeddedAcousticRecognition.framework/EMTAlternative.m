@interface EMTAlternative
- (BOOL)isEqual:(id)a3;
- (EMTAlternative)initWithDescription:(id)a3 translationPhraseIndex:(unint64_t)a4 selectionSpanIndex:(unint64_t)a5;
- (EMTAlternativeDescription)alternativeDescription;
- (unint64_t)hash;
- (unint64_t)selectionSpanIndex;
- (unint64_t)translationPhraseIndex;
@end

@implementation EMTAlternative

- (EMTAlternative)initWithDescription:(id)a3 translationPhraseIndex:(unint64_t)a4 selectionSpanIndex:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMTAlternative;
  v10 = [(EMTAlternative *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_alternativeDescription, a3);
    v11->_translationPhraseIndex = a4;
    v11->_selectionSpanIndex = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    alternativeDescription = self->_alternativeDescription;
    v7 = [v5 alternativeDescription];
    if ([(EMTAlternativeDescription *)alternativeDescription isEqual:v7]
      && (unint64_t translationPhraseIndex = self->_translationPhraseIndex,
          translationPhraseIndex == [v5 translationPhraseIndex]))
    {
      unint64_t selectionSpanIndex = self->_selectionSpanIndex;
      BOOL v10 = selectionSpanIndex == [v5 selectionSpanIndex];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(EMTAlternativeDescription *)self->_alternativeDescription hash];
  unint64_t v4 = self->_translationPhraseIndex - v3 + 32 * v3;
  return self->_selectionSpanIndex - v4 + 32 * v4 + 29791;
}

- (EMTAlternativeDescription)alternativeDescription
{
  return self->_alternativeDescription;
}

- (unint64_t)translationPhraseIndex
{
  return self->_translationPhraseIndex;
}

- (unint64_t)selectionSpanIndex
{
  return self->_selectionSpanIndex;
}

- (void).cxx_destruct
{
}

@end