@interface OrgApacheLuceneAnalysisTokenizer_$1
- (OrgApacheLuceneAnalysisTokenizer_$1)init;
- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneAnalysisTokenizer_$1

- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = new_JavaLangIllegalStateException_initWithNSString_(@"TokenStream contract violation: reset()/close() call missing, reset() called multiple times, or subclass does not call super.reset(). Please see Javadocs of TokenStream class for more information about the correct consuming workflow.");
  objc_exception_throw(v5);
}

- (OrgApacheLuceneAnalysisTokenizer_$1)init
{
  return self;
}

@end