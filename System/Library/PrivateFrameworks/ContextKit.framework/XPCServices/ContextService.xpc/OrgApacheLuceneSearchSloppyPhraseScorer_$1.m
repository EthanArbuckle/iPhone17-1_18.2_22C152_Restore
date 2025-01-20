@interface OrgApacheLuceneSearchSloppyPhraseScorer_$1
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneSearchSloppyPhraseScorer_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  return *((_DWORD *)a3 + 4) - *((_DWORD *)a4 + 4);
}

@end