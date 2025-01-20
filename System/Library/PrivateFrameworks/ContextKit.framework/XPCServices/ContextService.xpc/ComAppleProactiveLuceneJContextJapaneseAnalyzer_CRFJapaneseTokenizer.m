@interface ComAppleProactiveLuceneJContextJapaneseAnalyzer_CRFJapaneseTokenizer
- (BOOL)filterOnPartOfSpeechWithInt:(int)a3;
- (ComAppleProactiveLuceneJContextJapaneseAnalyzer_CRFJapaneseTokenizer)initWithComAppleProactiveLuceneJContextJapaneseAnalyzer:(id)a3;
@end

@implementation ComAppleProactiveLuceneJContextJapaneseAnalyzer_CRFJapaneseTokenizer

- (ComAppleProactiveLuceneJContextJapaneseAnalyzer_CRFJapaneseTokenizer)initWithComAppleProactiveLuceneJContextJapaneseAnalyzer:(id)a3
{
  return self;
}

- (BOOL)filterOnPartOfSpeechWithInt:(int)a3
{
  return a3 != 4 && a3 != 10;
}

@end