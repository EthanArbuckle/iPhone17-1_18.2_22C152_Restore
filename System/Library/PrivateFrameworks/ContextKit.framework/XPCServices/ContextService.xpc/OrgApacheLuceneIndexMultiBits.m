@interface OrgApacheLuceneIndexMultiBits
- (BOOL)checkLengthWithInt:(int)a3 withInt:(int)a4;
- (BOOL)getWithInt:(int)a3;
- (NSString)description;
- (OrgApacheLuceneIndexMultiBits)initWithOrgApacheLuceneUtilBitsArray:(id)a3 withIntArray:(id)a4 withBoolean:(BOOL)a5;
- (id)getMatchingSubWithOrgApacheLuceneIndexReaderSlice:(id)a3;
- (int)length;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiBits

- (OrgApacheLuceneIndexMultiBits)initWithOrgApacheLuceneUtilBitsArray:(id)a3 withIntArray:(id)a4 withBoolean:(BOOL)a5
{
  self->defaultValue_ = a5;
  return self;
}

- (BOOL)checkLengthWithInt:(int)a3 withInt:(int)a4
{
  starts = self->starts_;
  if (!starts) {
    JreThrowNullPointerException();
  }
  uint64_t size = starts->super.size_;
  uint64_t v6 = (a3 + 1);
  if (a3 + 1 < 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return 1;
}

- (BOOL)getWithInt:(int)a3
{
  uint64_t v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)self->starts_);
  subs = self->subs_;
  if (!subs) {
    goto LABEL_12;
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = subs->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  v10 = (&subs->elementType_)[v8];
  if (!v10) {
    return self->defaultValue_;
  }
  starts = self->starts_;
  if (!starts) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v12 = starts->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v7);
  }
  uint64_t v13 = (a3 - *(&starts->super.size_ + v8 + 1));
  return [(IOSClass *)v10 getWithInt:v13];
}

- (NSString)description
{
  v3 = new_JavaLangStringBuilder_init();
  subs = self->subs_;
  if (!subs) {
    goto LABEL_30;
  }
  uint64_t v12 = v3;
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("I$", v4, v5, v6, v7, v8, v9, v10, (id)subs->super.size_)];
  v20 = self->subs_;
  uint64_t size = v20->super.size_;
  if ((int)size >= 1)
  {
    for (uint64_t i = 0; i < size; ++i)
    {
      if (i)
      {
        [(JavaLangStringBuilder *)v12 appendWithNSString:@"; "];
        v20 = self->subs_;
      }
      uint64_t v23 = v20->super.size_;
      if (i >= v23) {
        IOSArray_throwOutOfBoundsWithMsg(v23, i);
      }
      v24 = (&v20->elementType_)[i];
      starts = self->starts_;
      if (v24)
      {
        if (!starts) {
          goto LABEL_30;
        }
        uint64_t v26 = starts->super.size_;
        if (i >= v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, i);
        }
        v27 = self->subs_;
        uint64_t v28 = v27->super.size_;
        if (i >= v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, i);
        }
        v29 = (&v27->elementType_)[i];
        if (!v29) {
          goto LABEL_30;
        }
        [(IOSClass *)v29 length];
        uint64_t v37 = self->subs_->super.size_;
        if (i >= v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, i);
        }
        CFStringRef v38 = JreStrcat("$I$I$@", v30, v31, v32, v33, v34, v35, v36, @"s=");
      }
      else
      {
        if (!starts) {
          goto LABEL_30;
        }
        uint64_t v39 = starts->super.size_;
        if (i >= v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, i);
        }
        CFStringRef v38 = JreStrcat("$I$", v13, v14, v15, v16, v17, v18, v19, @"s=");
      }
      [(JavaLangStringBuilder *)v12 appendWithNSString:v38];
      v20 = self->subs_;
      uint64_t size = v20->super.size_;
    }
  }
  v40 = self->starts_;
  if (!v40) {
LABEL_30:
  }
    JreThrowNullPointerException();
  uint64_t v41 = v40->super.size_;
  if ((size & 0x80000000) != 0 || (int)size >= (int)v41) {
    IOSArray_throwOutOfBoundsWithMsg(v41, size);
  }
  [(JavaLangStringBuilder *)v12 appendWithNSString:JreStrcat("$I", v13, v14, v15, v16, v17, v18, v19, @" end=")];
  return [(JavaLangStringBuilder *)v12 description];
}

- (id)getMatchingSubWithOrgApacheLuceneIndexReaderSlice:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(*((_DWORD *)a3 + 2), (uint64_t)self->starts_);
  uint64_t v6 = [OrgApacheLuceneIndexMultiBits_SubResult alloc];
  starts = self->starts_;
  uint64_t size = starts->super.size_;
  if (v5 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  int v9 = *(&starts->super.size_ + v5 + 1);
  if (v9 != *((_DWORD *)a3 + 2)) {
    goto LABEL_11;
  }
  uint64_t v10 = self->starts_;
  uint64_t v11 = v10->super.size_;
  int v12 = v5 + 1;
  if (v5 + 1 < 0 || v12 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, v12);
  }
  if (*(&v10->super.size_ + v12 + 1) == *((_DWORD *)a3 + 3) + v9)
  {
    v6->matches_ = 1;
    subs = self->subs_;
    uint64_t v14 = subs->super.size_;
    if (v5 < 0 || v5 >= (int)v14) {
      IOSArray_throwOutOfBoundsWithMsg(v14, v5);
    }
    JreStrongAssign((id *)&v6->result_, (&subs->elementType_)[v5]);
  }
  else
  {
LABEL_11:
    v6->matches_ = 0;
  }
  return v6;
}

- (int)length
{
  starts = self->starts_;
  if (!starts) {
    JreThrowNullPointerException();
  }
  uint64_t size = starts->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, (size - 1));
  }
  return *(&starts->super.size_ + (int)size);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiBits;
  [(OrgApacheLuceneIndexMultiBits *)&v3 dealloc];
}

@end