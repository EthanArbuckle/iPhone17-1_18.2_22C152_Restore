@interface NLDataInstance
- (NLDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (NLDataInstance)initWithString:(id)a3 label:(id)a4;
- (NSArray)labels;
- (NSArray)tokens;
- (NSString)label;
- (NSString)string;
- (__CFDictionary)instanceDictionary;
- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4;
- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6;
- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
@end

@implementation NLDataInstance

- (NLDataInstance)initWithString:(id)a3 label:(id)a4
{
  return 0;
}

- (NLDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  return 0;
}

- (NSString)string
{
  return 0;
}

- (NSArray)tokens
{
  return 0;
}

- (NSString)label
{
  return 0;
}

- (NSArray)labels
{
  return 0;
}

- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4
{
  return 0;
}

- (__CFDictionary)instanceDictionary
{
  return 0;
}

- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  return 0;
}

@end