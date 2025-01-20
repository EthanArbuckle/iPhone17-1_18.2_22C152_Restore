@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (id)addFieldWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (id)addFieldWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  fields = self->fields_;
  if (!fields) {
    goto LABEL_13;
  }
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  if ([(JavaUtilDeque *)fields isEmpty])
  {
    v14 = self->this$0_;
    int offStart = self->offStart_;
    int posStart = self->posStart_;
    int payStart = self->payStart_;
    v17 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData alloc];
    sub_10000D6D0((uint64_t)v17, v14, a3, a4, v11, v10, v9, posStart, offStart, payStart);
    goto LABEL_12;
  }
  v18 = [(JavaUtilDeque *)self->fields_ getLast];
  if (!v18) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int v19 = *((unsigned __int8 *)v18 + 16);
  if (*((unsigned char *)v18 + 16)) {
    int v19 = v18[17];
  }
  int v29 = v19 + v18[14];
  int v20 = *((unsigned __int8 *)v18 + 17);
  if (*((unsigned char *)v18 + 17)) {
    int v20 = v18[17];
  }
  int v21 = v20 + v18[15];
  int v22 = *((unsigned __int8 *)v18 + 18);
  int v23 = v9;
  if (*((unsigned char *)v18 + 18)) {
    int v22 = v18[17];
  }
  int v24 = v22 + v18[16];
  v25 = self->this$0_;
  v17 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData alloc];
  sub_10000D6D0((uint64_t)v17, v25, a3, a4, v11, v10, v23, v29, v21, v24);
LABEL_12:
  v26 = v17;
  [(JavaUtilDeque *)self->fields_ addWithId:v26];
  return v26;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData *)&v3 dealloc];
}

@end