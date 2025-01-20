@interface OrgApacheLuceneStoreIndexInput
- (NSString)description;
- (OrgApacheLuceneStoreIndexInput)initWithNSString:(id)a3;
- (id)clone;
- (id)getFullSliceDescriptionWithNSString:(id)a3;
- (id)randomAccessSliceWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneStoreIndexInput

- (OrgApacheLuceneStoreIndexInput)initWithNSString:(id)a3
{
  return self;
}

- (NSString)description
{
  return self->resourceDescription_;
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneStoreIndexInput;
  id v2 = [(OrgApacheLuceneStoreDataInput *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (id)getFullSliceDescriptionWithNSString:(id)a3
{
  id result = [(OrgApacheLuceneStoreIndexInput *)self description];
  if (a3) {
    return (id)JreStrcat("$$$C", v5, v6, v7, v8, v9, v10, v11, result);
  }
  return result;
}

- (id)randomAccessSliceWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  id v4 = [(OrgApacheLuceneStoreIndexInput *)self sliceWithNSString:@"randomaccess" withLong:a3 withLong:a4];
  if ([(id)OrgApacheLuceneStoreRandomAccessInput_class_() isInstance:v4])
  {
    uint64_t v5 = (void *)OrgApacheLuceneStoreRandomAccessInput_class_();
    if (v4)
    {
      if (([v5 isInstance:v4] & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    return v4;
  }
  else
  {
    uint64_t v7 = [OrgApacheLuceneStoreIndexInput__1 alloc];
    JreStrongAssign((id *)&v7->val$slice_, v4);
    return v7;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreIndexInput;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end