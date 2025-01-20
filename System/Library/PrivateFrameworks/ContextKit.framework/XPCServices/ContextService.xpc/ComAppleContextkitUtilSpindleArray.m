@interface ComAppleContextkitUtilSpindleArray
- (ComAppleContextkitUtilSpindleArray)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4;
- (id)lookupWithComAppleContextkitUtilSpindleArray_State:(id)a3 withJavaUtilList:(id)a4 withJavaUtilIterator:(id)a5;
- (id)lookupWithJavaUtilList:(id)a3 withJavaUtilIterator:(id)a4;
- (id)readEntryDataWithComAppleContextkitUtilSpindleArray_State:(id)a3 withComAppleContextkitUtilSpindleArray_Bucket:(id)a4 withComAppleContextkitUtilSpindleArray_Bucket:(id)a5;
- (void)close;
- (void)dealloc;
@end

@implementation ComAppleContextkitUtilSpindleArray

- (ComAppleContextkitUtilSpindleArray)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)lookupWithJavaUtilList:(id)a3 withJavaUtilIterator:(id)a4
{
  return [(ComAppleContextkitUtilSpindleArray *)self lookupWithComAppleContextkitUtilSpindleArray_State:0 withJavaUtilList:a3 withJavaUtilIterator:a4];
}

- (id)lookupWithComAppleContextkitUtilSpindleArray_State:(id)a3 withJavaUtilList:(id)a4 withJavaUtilIterator:(id)a5
{
  v6 = (JavaUtilArrayList *)a4;
  v40 = (id *)a3;
  if (!a3)
  {
    v40 = (id *)[(ComAppleContextkitUtilSpindleArray *)self newState];
    if (v6) {
      goto LABEL_3;
    }
LABEL_33:
    v6 = new_JavaUtilArrayList_init();
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_33;
  }
LABEL_3:
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v37 = [(OrgApacheLuceneStoreIndexInput *)in clone];
  v39 = v6;
  if (!a5) {
    JreThrowNullPointerException();
  }
  v9 = 0;
  uint64_t v10 = 0;
  int v11 = -1;
  unsigned int v38 = -1;
  while ([a5 hasNext])
  {
    id v12 = [a5 next];
    if (!v12) {
LABEL_34:
    }
      JreThrowNullPointerException();
    id v13 = [v12 intValue];
    id v21 = v13;
    if ((v13 & 0x80000000) != 0 || (int)v13 >= self->numEntries_)
    {
      v36 = new_JavaIoIOException_initWithNSString_(@"entryId out of bounds");
LABEL_40:
      objc_exception_throw(v36);
    }
    if ((int)v13 < v11)
    {
      CFStringRef v35 = JreStrcat("$I$I", v14, v15, v16, v17, v18, v19, v20, @"Entries must be passed in ascending order: ");
      v36 = new_JavaIoIOException_initWithNSString_((uint64_t)v35);
      goto LABEL_40;
    }
    if (v13 != v11)
    {
      while (1)
      {
        offsets = self->offsets_;
        if (!offsets) {
          goto LABEL_34;
        }
        uint64_t size = offsets->super.size_;
        if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v10);
        }
        if (*(&offsets->super.size_ + (int)v10 + 1) > (int)v21) {
          break;
        }
        uint64_t v10 = (v10 + 2);
      }
      if (v38 != v10)
      {
        v24 = self->offsets_;
        v25 = [ComAppleContextkitUtilSpindleArray_Bucket alloc];
        sub_100148550((uint64_t)v25, v40, v37, (uint64_t)v24, (v10 - 2), 1, v26, v27);
        v9 = v25;
        unsigned int v38 = v10;
      }
      if (!v9) {
        goto LABEL_35;
      }
      if ([(ComAppleContextkitUtilSpindleArray_Bucket *)v9 skipToEntryIdWithComAppleContextkitUtilSpindleArray_State:v40 withInt:v21])
      {
        uint64_t v28 = 0;
        v29 = v9;
      }
      else
      {
        if (!v40) {
          goto LABEL_35;
        }
        JreStrongAssign(v40 + 2, 0);
        v30 = self->offsets_;
        v31 = [ComAppleContextkitUtilSpindleArray_Bucket alloc];
        sub_100148550((uint64_t)v31, v40, v37, (uint64_t)v30, v38, 0, v32, v33);
        v29 = v31;
        [(ComAppleContextkitUtilSpindleArray_Bucket *)v29 completeEntryWithComAppleContextkitUtilSpindleArray_State:v40];
        v38 += 2;
        uint64_t v28 = (uint64_t)v9;
      }
      if (!v39) {
LABEL_35:
      }
        JreThrowNullPointerException();
      [(JavaUtilArrayList *)v39 addWithId:sub_1001481A8((uint64_t)v40, (uint64_t)v29, v28)];
      int v11 = (int)v21;
      v9 = v29;
      if (v28)
      {
        JreStrongAssign((id *)(v28 + 8), 0);
        int v11 = (int)v21;
        v9 = v29;
      }
    }
  }
  if (v37) {
    [v37 close];
  }
  return v39;
}

- (id)readEntryDataWithComAppleContextkitUtilSpindleArray_State:(id)a3 withComAppleContextkitUtilSpindleArray_Bucket:(id)a4 withComAppleContextkitUtilSpindleArray_Bucket:(id)a5
{
  return sub_1001481A8((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)close
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)in close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilSpindleArray;
  [(ComAppleContextkitUtilSpindleArray *)&v3 dealloc];
}

@end