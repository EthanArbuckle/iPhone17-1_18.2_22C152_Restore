@interface OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray
- (OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray)initWithInt:(int)a3;
- (OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray)initWithInt:(int)a3 withOrgApacheLuceneUtilCounter:(id)a4;
- (id)bytesUsed;
- (id)clear;
- (id)grow;
- (id)init__;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray

- (OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray)initWithInt:(int)a3 withOrgApacheLuceneUtilCounter:(id)a4
{
  self->initSize_ = a3;
  return self;
}

- (OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray)initWithInt:(int)a3
{
  v5 = OrgApacheLuceneUtilCounter_newCounter();
  JreStrongAssign((id *)&self->bytesUsed_, v5);
  self->initSize_ = a3;
  return self;
}

- (id)clear
{
  return JreStrongAssign((id *)&self->bytesStart_, 0);
}

- (id)grow
{
  p_bytesStart = &self->bytesStart_;
  bytesStart = (unsigned int *)self->bytesStart_;
  if (!bytesStart) {
    JreThrowNullPointerException();
  }
  v10 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(bytesStart, bytesStart[2] + 1, v2, v3, v4, v5, v6, v7);
  return JreStrongAssign((id *)p_bytesStart, v10);
}

- (id)init__
{
  p_bytesStart = &self->bytesStart_;
  id v9 = +[IOSIntArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(self->initSize_, 4, v2, v3, v4, v5, v6, v7)];
  return JreStrongAssignAndConsume((id *)p_bytesStart, v9);
}

- (id)bytesUsed
{
  return self->bytesUsed_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray;
  [(OrgApacheLuceneUtilBytesRefHash_DirectBytesStartArray *)&v3 dealloc];
}

@end