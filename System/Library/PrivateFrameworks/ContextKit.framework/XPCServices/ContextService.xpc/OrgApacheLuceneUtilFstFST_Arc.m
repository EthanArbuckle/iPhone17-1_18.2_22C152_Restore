@interface OrgApacheLuceneUtilFstFST_Arc
- (BOOL)flagWithInt:(int)a3;
- (BOOL)isFinal;
- (BOOL)isLast;
- (id)copyFromWithOrgApacheLuceneUtilFstFST_Arc:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFstFST_Arc

- (id)copyFromWithOrgApacheLuceneUtilFstFST_Arc:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->node_ = *((void *)a3 + 3);
  self->label_ = *((_DWORD *)a3 + 2);
  self->target_ = *((void *)a3 + 4);
  self->flags_ = *((unsigned char *)a3 + 40);
  JreStrongAssign(&self->output_, *((void **)a3 + 2));
  JreStrongAssign(&self->nextFinalOutput_, *((void **)a3 + 6));
  self->nextArc_ = *((void *)a3 + 7);
  int v5 = *((_DWORD *)a3 + 18);
  self->bytesPerArc_ = v5;
  if (v5)
  {
    self->posArcsStart_ = *((void *)a3 + 8);
    self->arcIdx_ = *((_DWORD *)a3 + 19);
    self->numArcs_ = *((_DWORD *)a3 + 20);
  }
  return self;
}

- (BOOL)flagWithInt:(int)a3
{
  int flags = self->flags_;
  if ((atomic_load_explicit(OrgApacheLuceneUtilFstFST__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (flags & a3) != 0;
}

- (BOOL)isLast
{
  return [(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:2];
}

- (BOOL)isFinal
{
  return [(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:1];
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$J", v4, v5, v6, v7, v8, v9, v10, @"node=")];
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$J", v11, v12, v13, v14, v15, v16, v17, @" target=")];
  JavaLangInteger_toHexStringWithInt_(self->label_);
  [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$$", v18, v19, v20, v21, v22, v23, v24, @" label=0x")];
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:1]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" final"];
  }
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:2]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" last"];
  }
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:4]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" targetNext"];
  }
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:8]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" stop"];
  }
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:16]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$@", v25, v26, v27, v28, v29, v30, v31, @" output=")];
  }
  if ([(OrgApacheLuceneUtilFstFST_Arc *)self flagWithInt:32]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$@", v32, v33, v34, v35, v36, v37, v38, @" nextFinalOutput=")];
  }
  if (self->bytesPerArc_) {
    -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", JreStrcat("$I$IC", v32, v33, v34, v35, v36, v37, v38, @" arcArray(idx="));
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstFST_Arc;
  [(OrgApacheLuceneUtilFstFST_Arc *)&v3 dealloc];
}

@end