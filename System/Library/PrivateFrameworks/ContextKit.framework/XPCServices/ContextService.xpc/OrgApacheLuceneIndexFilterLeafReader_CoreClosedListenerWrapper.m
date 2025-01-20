@interface OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper)initWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3 withId:(id)a4 withId:(id)a5;
- (unint64_t)hash;
- (void)dealloc;
- (void)onCloseWithId:(id)a3;
@end

@implementation OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper

- (OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper)initWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3 withId:(id)a4 withId:(id)a5
{
  return self;
}

- (void)onCloseWithId:(id)a3
{
  if (!self->in_) {
    JreThrowNullPointerException();
  }
  id thisCoreKey = self->thisCoreKey_;
  in = self->in_;
  [(OrgApacheLuceneIndexLeafReader_CoreClosedListener *)in onCloseWithId:thisCoreKey];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    goto LABEL_5;
  }
  id v5 = [a3 getClass];
  if (qword_1005600C8 != -1) {
    dispatch_once(&qword_1005600C8, &stru_1003F1C70);
  }
  if (v5 == (id)qword_1005600C0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    in = self->in_;
    if (!in) {
      JreThrowNullPointerException();
    }
    unsigned int v6 = [(OrgApacheLuceneIndexLeafReader_CoreClosedListener *)in isEqual:*((void *)a3 + 1)];
    if (v6) {
      LOBYTE(v6) = self->thisCoreKey_ == (id)*((void *)a3 + 2);
    }
  }
  else
  {
LABEL_5:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)hash
{
  id v5 = [(OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper *)self getClass];
  long long v6 = *(_OWORD *)&self->in_;
  v3 = +[IOSObjectArray arrayWithObjects:&v5 count:3 type:NSObject_class_()];
  return (int)OrgLukhnosPortmobileUtilObjects_hash__WithNSObjectArray_(v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper;
  [(OrgApacheLuceneIndexFilterLeafReader_CoreClosedListenerWrapper *)&v3 dealloc];
}

@end