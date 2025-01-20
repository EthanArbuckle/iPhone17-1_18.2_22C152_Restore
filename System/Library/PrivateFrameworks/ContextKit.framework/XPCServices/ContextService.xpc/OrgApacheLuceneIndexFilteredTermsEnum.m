@interface OrgApacheLuceneIndexFilteredTermsEnum
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneIndexFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3;
- (OrgApacheLuceneIndexFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withBoolean:(BOOL)a4;
- (id)attributes;
- (id)next;
- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (id)termState;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)seekExactWithLong:(int64_t)a3;
- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4;
- (void)setInitialSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneIndexFilteredTermsEnum

- (OrgApacheLuceneIndexFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  self->doSeek_ = 1;
  return self;
}

- (OrgApacheLuceneIndexFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withBoolean:(BOOL)a4
{
  self->doSeek_ = a4;
  return self;
}

- (void)setInitialSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
}

- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  p_initialSeekTerm = (id *)&self->initialSeekTerm_;
  id v4 = *p_initialSeekTerm;
  JreStrongAssign(p_initialSeekTerm, 0);
  return v4;
}

- (id)attributes
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)tenum attributes];
}

- (id)term
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)tenum term];
}

- (int)docFreq
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)tenum docFreq];
}

- (int64_t)totalTermFreq
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexTermsEnum *)tenum totalTermFreq];
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  id v3 = objc_msgSend(-[OrgApacheLuceneIndexFilteredTermsEnum getClass](self, "getClass", a3), "getName");
  CFStringRef v11 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, v3);
  v12 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v11);
  objc_exception_throw(v12);
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  id v3 = objc_msgSend(-[OrgApacheLuceneIndexFilteredTermsEnum getClass](self, "getClass", a3), "getName");
  CFStringRef v11 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, v3);
  v12 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v11);
  objc_exception_throw(v12);
}

- (void)seekExactWithLong:(int64_t)a3
{
  id v3 = objc_msgSend(-[OrgApacheLuceneIndexFilteredTermsEnum getClass](self, "getClass", a3), "getName");
  CFStringRef v11 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, v3);
  v12 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v11);
  objc_exception_throw(v12);
}

- (int64_t)ord
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexTermsEnum *)tenum ord];
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)tenum postingsWithOrgApacheLuceneIndexPostingsEnum:a3 withInt:*(void *)&a4];
}

- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4
{
  id v4 = objc_msgSend(-[OrgApacheLuceneIndexFilteredTermsEnum getClass](self, "getClass", a3, a4), "getName");
  CFStringRef v12 = JreStrcat("$$", v5, v6, v7, v8, v9, v10, v11, v4);
  v13 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v12);
  objc_exception_throw(v13);
}

- (id)termState
{
  tenum = self->tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)tenum termState];
}

- (id)next
{
  if (self->doSeek_)
  {
    self->doSeek_ = 0;
    p_actualTerm = &self->actualTerm_;
    id result = [(OrgApacheLuceneIndexFilteredTermsEnum *)self nextSeekTermWithOrgApacheLuceneUtilBytesRef:self->actualTerm_];
    if (!result) {
      return result;
    }
    id v5 = result;
    tenum = self->tenum_;
    if (!tenum) {
      goto LABEL_14;
    }
    id v7 = [(OrgApacheLuceneIndexTermsEnum *)tenum seekCeilWithOrgApacheLuceneUtilBytesRef:v5];
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v7 != (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_)
    {
      uint64_t v8 = self->tenum_;
      if (v8)
      {
        JreStrongAssign((id *)&self->actualTerm_, [(OrgApacheLuceneIndexTermsEnum *)v8 term]);
        actualTerm = *p_actualTerm;
LABEL_11:
        objc_msgSend(-[OrgApacheLuceneIndexFilteredTermsEnum acceptWithOrgApacheLuceneUtilBytesRef:](self, "acceptWithOrgApacheLuceneUtilBytesRef:", actualTerm), "ordinal");
        return self->actualTerm_;
      }
LABEL_14:
      JreThrowNullPointerException();
    }
  }
  else
  {
    uint64_t v10 = self->tenum_;
    if (!v10) {
      goto LABEL_14;
    }
    JreStrongAssign((id *)&self->actualTerm_, [(OrgApacheLuceneIndexTermsEnum *)v10 next]);
    actualTerm = self->actualTerm_;
    if (actualTerm) {
      goto LABEL_11;
    }
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFilteredTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

@end