@interface OrgApacheLuceneUtilAutomatonOperations_TransitionList
- (OrgApacheLuceneUtilAutomatonOperations_TransitionList)init;
- (void)addWithOrgApacheLuceneUtilAutomatonTransition:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAutomatonOperations_TransitionList

- (void)addWithOrgApacheLuceneUtilAutomatonTransition:(id)a3
{
  p_transitions = &self->transitions_;
  transitions = (unsigned int *)self->transitions_;
  if (!transitions) {
    goto LABEL_13;
  }
  signed int v12 = self->next_ + 3;
  if ((int)transitions[2] < v12)
  {
    v13 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(transitions, v12, (uint64_t)a3, v3, v4, v5, v6, v7);
    JreStrongAssign((id *)p_transitions, v13);
  }
  if (!a3 || (v14 = *p_transitions) == 0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int next = self->next_;
  uint64_t size = v14->super.size_;
  if (next < 0 || next >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, next);
  }
  *(&v14->super.size_ + next + 1) = *((_DWORD *)a3 + 3);
  v17 = self->transitions_;
  uint64_t v18 = v17->super.size_;
  int v19 = self->next_ + 1;
  if (v19 < 0 || v19 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v19);
  }
  *(&v17->super.size_ + v19 + 1) = *((_DWORD *)a3 + 4);
  int v20 = *((_DWORD *)a3 + 5);
  v21 = self->transitions_;
  int v22 = self->next_;
  uint64_t v23 = v21->super.size_;
  int v24 = v22 + 2;
  if (v22 + 2 < 0 || v24 >= (int)v23) {
    IOSArray_throwOutOfBoundsWithMsg(v23, (v22 + 2));
  }
  *(&v21->super.size_ + v24 + 1) = v20;
  self->next_ += 3;
}

- (OrgApacheLuceneUtilAutomatonOperations_TransitionList)init
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonOperations_TransitionList;
  [(OrgApacheLuceneUtilAutomatonOperations_TransitionList *)&v3 dealloc];
}

@end