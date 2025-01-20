@interface OrgApacheLuceneIndexMappingMultiPostingsEnum
- (OrgApacheLuceneIndexMappingMultiPostingsEnum)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4;
- (id)getPayload;
- (id)getSubs;
- (id)resetWithOrgApacheLuceneIndexMultiPostingsEnum:(id)a3;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)getNumSubs;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMappingMultiPostingsEnum

- (OrgApacheLuceneIndexMappingMultiPostingsEnum)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4
{
  return self;
}

- (id)resetWithOrgApacheLuceneIndexMultiPostingsEnum:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->numSubs_ = [a3 getNumSubs];
  JreStrongAssign((id *)&self->subs_, [a3 getSubs]);
  self->upto_ = -1;
  self->doc_ = -1;
  JreStrongAssign((id *)&self->current_, 0);
  JreStrongAssign((id *)&self->multiDocsAndPositionsEnum_, a3);
  return self;
}

- (int)getNumSubs
{
  return self->numSubs_;
}

- (id)getSubs
{
  return self->subs_;
}

- (int)freq
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current freq];
}

- (int)docID
{
  return self->doc_;
}

- (int)advanceWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int)nextDoc
{
  p_current = (id *)&self->current_;
  while (1)
  {
    id v4 = *p_current;
    if (!*p_current) {
      break;
    }
LABEL_20:
    id v21 = [v4 nextDoc];
    if (v21 == 0x7FFFFFFF)
    {
      JreStrongAssign(p_current, 0);
    }
    else
    {
      id v22 = v21;
      currentMap = self->currentMap_;
      if (!currentMap) {
        goto LABEL_31;
      }
      unsigned int v24 = [(OrgApacheLuceneIndexMergeState_DocMap *)currentMap getWithInt:v22];
      if (v24 != -1)
      {
        int result = self->currentBase_ + v24;
        goto LABEL_30;
      }
    }
  }
  int upto = self->upto_;
  if (upto != self->numSubs_ - 1)
  {
    uint64_t v6 = (upto + 1);
    self->upto_ = v6;
    subs = self->subs_;
    if (!subs) {
      goto LABEL_31;
    }
    uint64_t size = subs->super.size_;
    if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v6);
    }
    v9 = (&subs->elementType_)[(int)v6];
    if (!v9) {
      goto LABEL_31;
    }
    Class isa = v9[2].super.isa;
    if (!isa) {
      goto LABEL_31;
    }
    uint64_t v11 = *((int *)isa + 4);
    v12 = self->subs_;
    int v13 = self->upto_;
    uint64_t v14 = v12->super.size_;
    if (v13 < 0 || v13 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v13);
    }
    v15 = (&v12->elementType_)[v13];
    if (!v15) {
      goto LABEL_31;
    }
    JreStrongAssign(p_current, v15[1].super.isa);
    mergeState = self->mergeState_;
    if (!mergeState) {
      goto LABEL_31;
    }
    docBase = mergeState->docBase_;
    if (!docBase) {
      goto LABEL_31;
    }
    uint64_t v18 = docBase->super.size_;
    if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v18) {
      IOSArray_throwOutOfBoundsWithMsg(v18, v11);
    }
    self->currentBase_ = *(&docBase->super.size_ + v11 + 1);
    docMaps = self->mergeState_->docMaps_;
    if (!docMaps) {
      goto LABEL_31;
    }
    uint64_t v20 = docMaps->super.size_;
    if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v20) {
      IOSArray_throwOutOfBoundsWithMsg(v20, v11);
    }
    JreStrongAssign((id *)&self->currentMap_, (&docMaps->elementType_)[v11]);
    id v4 = *p_current;
    if (!*p_current) {
LABEL_31:
    }
      JreThrowNullPointerException();
    goto LABEL_20;
  }
  int result = 0x7FFFFFFF;
LABEL_30:
  self->doc_ = result;
  return result;
}

- (int)nextPosition
{
  current = self->current_;
  if (!current) {
    goto LABEL_13;
  }
  int result = [(OrgApacheLuceneIndexPostingsEnum *)current nextPosition];
  if (result < 0)
  {
    CFStringRef v12 = JreStrcat("$I$$$I", v5, v6, v7, v8, v9, v10, v11, @"position=");
LABEL_7:
    mergeState = self->mergeState_;
    if (mergeState)
    {
      fieldsProducers = mergeState->fieldsProducers_;
      if (fieldsProducers)
      {
        v15 = (__CFString *)v12;
        int upto = self->upto_;
        uint64_t size = fieldsProducers->super.size_;
        if (upto < 0 || upto >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, upto);
        }
        uint64_t v18 = (&fieldsProducers->elementType_)[upto];
        if (v18)
        {
          v19 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_(v15, [(IOSClass *)v18 description]);
          objc_exception_throw(v19);
        }
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (result > 0x7FFFFF7F)
  {
    CFStringRef v12 = JreStrcat("$I$I$$$I", v5, v6, v7, v8, v9, v10, v11, @"position=");
    goto LABEL_7;
  }
  return result;
}

- (int)startOffset
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current startOffset];
}

- (int)endOffset
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current endOffset];
}

- (id)getPayload
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)current getPayload];
}

- (int64_t)cost
{
  subs = self->subs_;
  if (!subs) {
    goto LABEL_10;
  }
  p_elementType = &subs->elementType_;
  unint64_t v4 = (unint64_t)&(&subs->elementType_)[subs->super.size_];
  if ((unint64_t)&subs->elementType_ < v4)
  {
    int64_t v5 = 0;
    while (1)
    {
      uint64_t v7 = (uint64_t)*p_elementType++;
      uint64_t v6 = v7;
      if (!v7) {
        break;
      }
      uint64_t v8 = *(void **)(v6 + 8);
      if (!v8) {
        break;
      }
      v5 += (int64_t)[v8 cost];
      if ((unint64_t)p_elementType >= v4) {
        return v5;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMappingMultiPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end