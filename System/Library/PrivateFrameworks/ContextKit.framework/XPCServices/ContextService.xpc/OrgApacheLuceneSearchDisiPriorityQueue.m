@interface OrgApacheLuceneSearchDisiPriorityQueue
+ (int)leftNodeWithInt:(int)a3;
+ (int)parentNodeWithInt:(int)a3;
+ (int)rightNodeWithInt:(int)a3;
- (OrgApacheLuceneSearchDisiPriorityQueue)initWithInt:(int)a3;
- (id)addWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (id)getHeapWithInt:(int)a3;
- (id)iterator;
- (id)pop;
- (id)prependWithOrgApacheLuceneSearchDisiWrapper:(id)a3 withOrgApacheLuceneSearchDisiWrapper:(id)a4;
- (id)top;
- (id)topList;
- (id)topListWithOrgApacheLuceneSearchDisiWrapper:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)updateTop;
- (id)updateTopWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)copyHeapWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)downHeapWithInt:(int)a3;
- (void)initHeapWithInt:(int)a3;
- (void)moveHeapWithInt:(int)a3 withInt:(int)a4;
- (void)setHeapWithInt:(int)a3 withOrgApacheLuceneSearchDisiWrapper:(id)a4;
- (void)upHeapWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchDisiPriorityQueue

- (void)dealloc
{
  free(self->_heap);
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisiPriorityQueue;
  [(OrgApacheLuceneSearchDisiPriorityQueue *)&v3 dealloc];
}

- (void)initHeapWithInt:(int)a3
{
  self->_heap = (id *)malloc_type_calloc(a3, 8uLL, 0x80040B8603338uLL);
}

+ (int)leftNodeWithInt:(int)a3
{
  return (2 * a3) | 1;
}

+ (int)rightNodeWithInt:(int)a3
{
  return a3 + 1;
}

+ (int)parentNodeWithInt:(int)a3
{
  return ((a3 + 1) >> 1) - 1;
}

- (id)getHeapWithInt:(int)a3
{
  return self->_heap[a3];
}

- (void)setHeapWithInt:(int)a3 withOrgApacheLuceneSearchDisiWrapper:(id)a4
{
  self->_heap[a3] = a4;
}

- (void)copyHeapWithInt:(int)a3 withInt:(int)a4
{
  self->_heap[a3] = self->_heap[a4];
}

- (void)moveHeapWithInt:(int)a3 withInt:(int)a4
{
  self->_heap[a3] = self->_heap[a4];
  self->_heap[a4] = 0;
}

- (OrgApacheLuceneSearchDisiPriorityQueue)initWithInt:(int)a3
{
  self->size_ = 0;
  return self;
}

- (int)size
{
  return self->size_;
}

- (id)top
{
  return *self->_heap;
}

- (id)topList
{
  uint64_t size = self->size_;
  v4 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self top];
  if (!v4) {
    goto LABEL_12;
  }
  v5 = v4;
  JreStrongAssign(v4 + 4, 0);
  if ((int)size < 3)
  {
    if (size != 2) {
      return v5;
    }
    v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:1];
    if (!v8) {
      goto LABEL_12;
    }
    if (v8[6] != *((_DWORD *)v5 + 6)) {
      return v5;
    }
    v9 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:1];
    if (v9)
    {
      v10 = v9;
      JreStrongAssign(v9 + 4, v5);
      return v10;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  v6 = sub_100062E58(self, v5, size, 1);
  return sub_100062E58(self, v6, size, 2);
}

- (id)prependWithOrgApacheLuceneSearchDisiWrapper:(id)a3 withOrgApacheLuceneSearchDisiWrapper:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)a3 + 4, a4);
  return a3;
}

- (id)topListWithOrgApacheLuceneSearchDisiWrapper:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_100062E58(self, a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (id)addWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
  id v5 = a3;
  uint64_t size = self->size_;
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self setHeapWithInt:size withOrgApacheLuceneSearchDisiWrapper:a3];
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self upHeapWithInt:size];
  self->size_ = size + 1;
  return [(OrgApacheLuceneSearchDisiPriorityQueue *)self top];
}

- (id)pop
{
  id v3 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self top];
  uint64_t v4 = (self->size_ - 1);
  self->size_ = v4;
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self moveHeapWithInt:0 withInt:v4];
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self downHeapWithInt:v4];
  return v3;
}

- (id)updateTop
{
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self downHeapWithInt:self->size_];
  return [(OrgApacheLuceneSearchDisiPriorityQueue *)self top];
}

- (id)updateTopWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self setHeapWithInt:0 withOrgApacheLuceneSearchDisiWrapper:a3];
  return [(OrgApacheLuceneSearchDisiPriorityQueue *)self updateTop];
}

- (void)upHeapWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = -[OrgApacheLuceneSearchDisiPriorityQueue getHeapWithInt:](self, "getHeapWithInt:");
  if (!v5) {
    goto LABEL_11;
  }
  v6 = v5;
  unsigned int v7 = v3 + 1;
  if ((v3 + 1) >= 2)
  {
    int v9 = v5[6];
    while (1)
    {
      unsigned int v10 = v7 >> 1;
      uint64_t v8 = (v7 >> 1) - 1;
      v11 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:v8];
      if (!v11) {
        break;
      }
      if (v9 >= v11[6]) {
        goto LABEL_3;
      }
      [(OrgApacheLuceneSearchDisiPriorityQueue *)self copyHeapWithInt:v3 withInt:v10 - 1];
      uint64_t v3 = v10 - 1;
      BOOL v12 = v7 > 3;
      v7 >>= 1;
      if (!v12) {
        goto LABEL_8;
      }
    }
LABEL_11:
    JreThrowNullPointerException();
  }
LABEL_3:
  uint64_t v8 = v3;
LABEL_8:
  [(OrgApacheLuceneSearchDisiPriorityQueue *)self setHeapWithInt:v8 withOrgApacheLuceneSearchDisiWrapper:v6];
}

- (void)downHeapWithInt:(int)a3
{
  id v5 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self top];
  if (a3 < 2) {
    return;
  }
  v6 = v5;
  if (a3 == 2)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:2];
    if (!v8
      || (int v9 = v8[6],
          (unsigned int v10 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:1]) == 0))
    {
LABEL_27:
      JreThrowNullPointerException();
    }
    if (v9 >= v10[6]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  v11 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:v7];
  if (!v11 || !v6) {
    goto LABEL_27;
  }
  if (v11[6] < v6[6])
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = v7;
      [(OrgApacheLuceneSearchDisiPriorityQueue *)self copyHeapWithInt:v12 withInt:v7];
      int v14 = 2 * v7;
      uint64_t v7 = (2 * v7) | 1u;
      unsigned int v15 = v14 + 2;
      if (v14 + 2 < a3)
      {
        v16 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:(v14 + 2)];
        if (!v16) {
          goto LABEL_27;
        }
        int v17 = v16[6];
        v18 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:(2 * v13) | 1u];
        if (!v18) {
          goto LABEL_27;
        }
        if (v17 >= v18[6]) {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v7 = v15;
        }
      }
      if ((int)v7 >= a3) {
        break;
      }
      v19 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self getHeapWithInt:v7];
      if (!v19) {
        goto LABEL_27;
      }
      uint64_t v12 = v13;
    }
    while (v19[6] < v6[6]);
    [(OrgApacheLuceneSearchDisiPriorityQueue *)self setHeapWithInt:v13 withOrgApacheLuceneSearchDisiWrapper:v6];
  }
}

- (id)iterator
{
  unsigned int v3 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self size];
  uint64_t v4 = [OrgApacheLuceneSearchDisiPriorityQueue__1 alloc];
  JreStrongAssign((id *)&v4->this$0_, self);
  v4->i_ = -1;
  v4->val$size_ = v3;
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end