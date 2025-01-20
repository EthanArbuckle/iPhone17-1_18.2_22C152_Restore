@interface ESVocabularyLabel
- (BOOL)isEqual:(id)a3;
- (ESVocabularyLabel)initWithSpeechCategoryName:(id)a3 tagName:(id)a4;
- (NSString)speechCategoryName;
- (NSString)tagName;
- (unint64_t)hash;
@end

@implementation ESVocabularyLabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagName, 0);

  objc_storeStrong((id *)&self->_speechCategoryName, 0);
}

- (NSString)tagName
{
  return self->_tagName;
}

- (NSString)speechCategoryName
{
  return self->_speechCategoryName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ESVocabularyLabel *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ESVocabularyLabel *)self speechCategoryName];
      v7 = [(ESVocabularyLabel *)v5 speechCategoryName];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(ESVocabularyLabel *)self tagName];
        v9 = [(ESVocabularyLabel *)v5 tagName];
        unsigned __int8 v10 = [v8 isEqualToString:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(ESVocabularyLabel *)self speechCategoryName];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(ESVocabularyLabel *)self tagName];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (ESVocabularyLabel)initWithSpeechCategoryName:(id)a3 tagName:(id)a4
{
  unint64_t v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)ESVocabularyLabel;
  v8 = [(ESVocabularyLabel *)&v13 init];
  speechCategoryName = v8->_speechCategoryName;
  v8->_speechCategoryName = v6;
  unsigned __int8 v10 = v6;

  tagName = v8->_tagName;
  v8->_tagName = v7;

  return v8;
}

@end