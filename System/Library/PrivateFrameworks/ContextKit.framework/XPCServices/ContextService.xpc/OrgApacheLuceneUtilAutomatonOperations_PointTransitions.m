@interface OrgApacheLuceneUtilAutomatonOperations_PointTransitions
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonOperations_PointTransitions)init;
- (int)compareToWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)resetWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilAutomatonOperations_PointTransitions

- (int)compareToWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return self->point_ - *((_DWORD *)a3 + 2);
}

- (void)resetWithInt:(int)a3
{
  self->point_ = a3;
  ends = self->ends_;
  if (!ends || (ends->next_ = 0, (starts = self->starts_) == 0)) {
    JreThrowNullPointerException();
  }
  starts->next_ = 0;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return *((_DWORD *)a3 + 2) == self->point_;
}

- (unint64_t)hash
{
  return self->point_;
}

- (OrgApacheLuceneUtilAutomatonOperations_PointTransitions)init
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonOperations_PointTransitions;
  [(OrgApacheLuceneUtilAutomatonOperations_PointTransitions *)&v3 dealloc];
}

@end