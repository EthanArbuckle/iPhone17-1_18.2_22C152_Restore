@interface OrgApacheLuceneIndexBaseCompositeReader
- (OrgApacheLuceneIndexBaseCompositeReader)initWithOrgApacheLuceneIndexIndexReaderArray:(id)a3;
- (id)getSequentialSubReaders;
- (id)getTermVectorsWithInt:(int)a3;
- (int)docFreqWithOrgApacheLuceneIndexTerm:(id)a3;
- (int)getDocCountWithNSString:(id)a3;
- (int)maxDoc;
- (int)numDocs;
- (int)readerBaseWithInt:(int)a3;
- (int)readerIndexWithInt:(int)a3;
- (int64_t)getSumDocFreqWithNSString:(id)a3;
- (int64_t)getSumTotalTermFreqWithNSString:(id)a3;
- (int64_t)totalTermFreqWithOrgApacheLuceneIndexTerm:(id)a3;
- (void)dealloc;
- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4;
@end

@implementation OrgApacheLuceneIndexBaseCompositeReader

- (OrgApacheLuceneIndexBaseCompositeReader)initWithOrgApacheLuceneIndexIndexReaderArray:(id)a3
{
  return self;
}

- (id)getTermVectorsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  uint64_t v11 = sub_100148DE4((uint64_t)self, v3, v5, v6, v7, v8, v9, v10);
  subReaders = self->subReaders_;
  if (!subReaders) {
    goto LABEL_11;
  }
  uint64_t v13 = v11;
  uint64_t v14 = (int)v11;
  uint64_t size = subReaders->super.size_;
  if ((v13 & 0x80000000) != 0 || (int)v13 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v13);
  }
  v16 = (&subReaders->elementType_)[v14];
  if (!v16 || (starts = self->starts_) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v18 = starts->super.size_;
  if ((v13 & 0x80000000) != 0 || (int)v13 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v13);
  }
  uint64_t v19 = (v3 - *(&starts->super.size_ + v14 + 1));
  return [(IOSClass *)v16 getTermVectorsWithInt:v19];
}

- (int)numDocs
{
  return self->numDocs_;
}

- (int)maxDoc
{
  return self->maxDoc_;
}

- (void)documentWithInt:(int)a3 withOrgApacheLuceneIndexStoredFieldVisitor:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  uint64_t v13 = sub_100148DE4((uint64_t)self, v5, v7, v8, v9, v10, v11, v12);
  subReaders = self->subReaders_;
  if (!subReaders) {
    goto LABEL_11;
  }
  uint64_t v15 = v13;
  uint64_t v16 = (int)v13;
  uint64_t size = subReaders->super.size_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v15);
  }
  uint64_t v18 = (&subReaders->elementType_)[v16];
  if (!v18 || (starts = self->starts_) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v20 = starts->super.size_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v15);
  }
  uint64_t v21 = (v5 - *(&starts->super.size_ + v16 + 1));
  [(IOSClass *)v18 documentWithInt:v21 withOrgApacheLuceneIndexStoredFieldVisitor:a4];
}

- (int)docFreqWithOrgApacheLuceneIndexTerm:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_6:
  }
    JreThrowNullPointerException();
  uint64_t v6 = 0;
  int v7 = 0;
  while (v6 < subReaders->super.size_)
  {
    uint64_t v8 = (&subReaders->elementType_)[v6];
    if (v8)
    {
      v7 += [(IOSClass *)v8 docFreqWithOrgApacheLuceneIndexTerm:a3];
      ++v6;
      subReaders = self->subReaders_;
      if (subReaders) {
        continue;
      }
    }
    goto LABEL_6;
  }
  return v7;
}

- (int64_t)totalTermFreqWithOrgApacheLuceneIndexTerm:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v6 = 0;
  int64_t v7 = 0;
  while (v6 < subReaders->super.size_)
  {
    uint64_t v8 = (&subReaders->elementType_)[v6];
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = [(IOSClass *)v8 totalTermFreqWithOrgApacheLuceneIndexTerm:a3];
    if (v9 == (id)-1) {
      return -1;
    }
    v7 += (int64_t)v9;
    ++v6;
    subReaders = self->subReaders_;
    if (!subReaders) {
      goto LABEL_7;
    }
  }
  return v7;
}

- (int64_t)getSumDocFreqWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int64_t v6 = 0;
  p_elementType = (void **)&subReaders->elementType_;
  unint64_t v8 = (unint64_t)&(&subReaders->elementType_)[subReaders->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    id v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    id v10 = [v9 getSumDocFreqWithNSString:a3];
    v6 += (int64_t)v10;
    if (v10 == (id)-1) {
      return -1;
    }
  }
  return v6;
}

- (int)getDocCountWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int v6 = 0;
  p_elementType = (void **)&subReaders->elementType_;
  unint64_t v8 = (unint64_t)&(&subReaders->elementType_)[subReaders->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    id v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    unsigned int v10 = [v9 getDocCountWithNSString:a3];
    v6 += v10;
    if (v10 == -1) {
      return -1;
    }
  }
  return v6;
}

- (int64_t)getSumTotalTermFreqWithNSString:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  subReaders = self->subReaders_;
  if (!subReaders) {
LABEL_8:
  }
    JreThrowNullPointerException();
  int64_t v6 = 0;
  p_elementType = (void **)&subReaders->elementType_;
  unint64_t v8 = (unint64_t)&(&subReaders->elementType_)[subReaders->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    id v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_8;
    }
    ++p_elementType;
    id v10 = [v9 getSumTotalTermFreqWithNSString:a3];
    v6 += (int64_t)v10;
    if (v10 == (id)-1) {
      return -1;
    }
  }
  return v6;
}

- (int)readerIndexWithInt:(int)a3
{
  return sub_100148DE4((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (int)readerBaseWithInt:(int)a3
{
  if (a3 < 0) {
    goto LABEL_9;
  }
  subReaders = self->subReaders_;
  if (!subReaders) {
    goto LABEL_7;
  }
  if (subReaders->super.size_ <= a3)
  {
LABEL_9:
    uint64_t v7 = new_JavaLangIllegalArgumentException_initWithNSString_(@"readerIndex must be >= 0 and < getSequentialSubReaders().size()");
    objc_exception_throw(v7);
  }
  starts = self->starts_;
  if (!starts) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t size = starts->super.size_;
  if ((int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&starts->super.size_ + a3 + 1);
}

- (id)getSequentialSubReaders
{
  return self->subReadersList_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexBaseCompositeReader;
  [(OrgApacheLuceneIndexIndexReader *)&v3 dealloc];
}

@end