@interface OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer
- (OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)getBuffer;
- (int)getLength;
- (int)getOffset;
- (void)dealloc;
- (void)reset;
@end

@implementation OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer

- (OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->offset_ = a4;
  self->length_ = a5;
  return self;
}

- (id)getBuffer
{
  return self->buffer_;
}

- (int)getOffset
{
  return self->offset_;
}

- (int)getLength
{
  return self->length_;
}

- (void)reset
{
  *(void *)&self->offset_ = 0;
  self->lastTrailingHighSurrogate_ = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer;
  [(OrgApacheLuceneAnalysisUtilCharacterUtils_CharacterBuffer *)&v3 dealloc];
}

@end