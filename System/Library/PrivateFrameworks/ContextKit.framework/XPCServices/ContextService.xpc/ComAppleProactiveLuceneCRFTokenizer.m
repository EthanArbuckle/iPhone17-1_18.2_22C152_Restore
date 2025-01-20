@interface ComAppleProactiveLuceneCRFTokenizer
- (BOOL)addToChunksWithInt:(int)a3 withInt:(int)a4;
- (BOOL)filterOnPartOfSpeechWithInt:(int)a3;
- (BOOL)incrementToken;
- (ComAppleProactiveLuceneCRFTokenizer)init;
- (ComAppleProactiveLuceneCRFTokenizer)initWithNSString:(id)a3;
- (void)dealloc;
- (void)end;
- (void)reset;
- (void)tokenizeTextWithNSString:(id)a3;
@end

@implementation ComAppleProactiveLuceneCRFTokenizer

- (ComAppleProactiveLuceneCRFTokenizer)init
{
  return self;
}

- (ComAppleProactiveLuceneCRFTokenizer)initWithNSString:(id)a3
{
  return self;
}

- (BOOL)filterOnPartOfSpeechWithInt:(int)a3
{
  return 1;
}

- (void)tokenizeTextWithNSString:(id)a3
{
}

- (BOOL)addToChunksWithInt:(int)a3 withInt:(int)a4
{
  chunks = self->chunks_;
  if (!chunks) {
    JreThrowNullPointerException();
  }
  v6[0] = a3;
  v6[1] = a4;
  [(JavaUtilList *)chunks addWithId:+[IOSIntArray arrayWithInts:v6 count:2]];
  return 1;
}

- (void)reset
{
  v9.receiver = self;
  v9.super_class = (Class)ComAppleProactiveLuceneCRFTokenizer;
  [(OrgApacheLuceneAnalysisTokenizer *)&v9 reset];
  v3 = +[IOSCharArray arrayWithLength:4096];
  for (i = new_JavaLangStringBuilder_init();
        ;
        [(JavaLangStringBuilder *)i appendWithCharArray:v3 withInt:0 withInt:v6])
  {
    input = self->super.input_;
    if (!input) {
      goto LABEL_7;
    }
    id v6 = (id)[(JavaIoReader *)input readWithCharArray:v3];
    if ((v6 & 0x80000000) != 0) {
      break;
    }
  }
  v7 = [(JavaLangStringBuilder *)i description];
  if (!v7) {
LABEL_7:
  }
    JreThrowNullPointerException();
  JreStrongAssign((id *)&self->text_, [(NSString *)v7 toCharArray]);
  v8 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->chunks_, v8);
  sub_10012A9C8((uint64_t)self, (__CFString *)[(JavaLangStringBuilder *)i description]);
  JreStrongAssign((id *)&self->chunksIterator_, [(JavaUtilList *)self->chunks_ iterator]);
}

- (BOOL)incrementToken
{
  chunksIterator = self->chunksIterator_;
  if (!chunksIterator) {
    goto LABEL_22;
  }
  unsigned int v4 = [(JavaUtilIterator *)chunksIterator hasNext];
  if (v4)
  {
    v5 = (unsigned int *)[(JavaUtilIterator *)self->chunksIterator_ next];
    if (!v5) {
      goto LABEL_22;
    }
    id v6 = v5;
    uint64_t v7 = v5[2];
    if ((int)v7 < 1) {
      IOSArray_throwOutOfBoundsWithMsg(v7, 0);
    }
    uint64_t v8 = (int)v6[3];
    if ((int)v7 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v7, 1);
    }
    unsigned int v19 = v6[4];
    uint64_t v20 = v19 + v8;
    if ((int)v8 < (int)v20)
    {
      uint64_t v9 = (int)v6[3];
      while (1)
      {
        text = self->text_;
        if (!text) {
          break;
        }
        uint64_t size = text->super.size_;
        if (v9 < 0 || v9 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v9);
        }
        __int16 v12 = JavaLangCharacter_toLowerCaseWithChar_(*((unsigned __int16 *)&text->super.size_ + v9 + 2));
        v13 = self->text_;
        uint64_t v14 = v13->super.size_;
        if (v9 < 0 || v9 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v9);
        }
        *((_WORD *)&v13->super.size_ + v9++ + 2) = v12;
        if ((int)v20 == v9) {
          goto LABEL_17;
        }
      }
LABEL_22:
      JreThrowNullPointerException();
    }
LABEL_17:
    posAtt = self->posAtt_;
    if (!posAtt) {
      goto LABEL_22;
    }
    [(OrgApacheLuceneAnalysisTokenattributesPositionIncrementAttribute *)posAtt setPositionIncrementWithInt:self->posIncr_];
    self->posIncr_ = 1;
    offsetAtt = self->offsetAtt_;
    if (!offsetAtt) {
      goto LABEL_22;
    }
    [(OrgApacheLuceneAnalysisTokenattributesOffsetAttribute *)offsetAtt setOffsetWithInt:v8 withInt:v20];
    termAtt = self->termAtt_;
    if (!termAtt) {
      goto LABEL_22;
    }
    [(OrgApacheLuceneAnalysisTokenattributesCharTermAttribute *)termAtt copyBufferWithCharArray:self->text_ withInt:v8 withInt:v19];
  }
  return v4;
}

- (void)end
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneCRFTokenizer;
  [(OrgApacheLuceneAnalysisTokenStream *)&v3 end];
  JreStrongAssign((id *)&self->chunksIterator_, 0);
  JreStrongAssign((id *)&self->chunks_, 0);
  JreStrongAssign((id *)&self->text_, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneCRFTokenizer;
  [(OrgApacheLuceneAnalysisTokenizer *)&v3 dealloc];
}

@end