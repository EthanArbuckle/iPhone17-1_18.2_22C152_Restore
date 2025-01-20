@interface ComAppleContextkitCategoriesCatIdTitleMap
- (ComAppleContextkitCategoriesCatIdTitleMap)initWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (ComAppleContextkitCategoriesCatIdTitleMap)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4;
- (id)categoryIdToTitleWithInt:(int)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (void)close;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesCatIdTitleMap

- (ComAppleContextkitCategoriesCatIdTitleMap)initWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return self;
}

- (ComAppleContextkitCategoriesCatIdTitleMap)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4
{
  self->maxTitleIdExcl_ = a4;
  return self;
}

- (id)clone
{
  titleIn = self->titleIn_;
  if (!titleIn) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneStoreIndexInput *)titleIn clone];
  int maxTitleIdExcl = self->maxTitleIdExcl_;
  v6 = [ComAppleContextkitCategoriesCatIdTitleMap alloc];
  JreStrongAssign((id *)&v6->titleIn_, v4);
  v6->maxTitleIdExcl_ = maxTitleIdExcl;
  return v6;
}

- (id)categoryIdToTitleWithInt:(int)a3
{
  if (a3 < 1 || self->maxTitleIdExcl_ <= a3) {
    return 0;
  }
  titleIn = self->titleIn_;
  if (!titleIn) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)titleIn seekWithLong:4 * a3 + 4];
  int v5 = [(OrgApacheLuceneStoreDataInput *)self->titleIn_ readInt];
  if (v5 <= 0)
  {
    v8 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v8);
  }
  [(OrgApacheLuceneStoreIndexInput *)self->titleIn_ seekWithLong:v5];
  v6 = self->titleIn_;
  return [(OrgApacheLuceneStoreDataInput *)v6 readString];
}

- (void)close
{
  titleIn = self->titleIn_;
  if (!titleIn) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)titleIn close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesCatIdTitleMap;
  [(ComAppleContextkitCategoriesCatIdTitleMap *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(ComAppleContextkitCategoriesCatIdTitleMap *)self clone];
  return v3;
}

@end