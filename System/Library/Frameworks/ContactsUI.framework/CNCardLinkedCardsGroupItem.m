@interface CNCardLinkedCardsGroupItem
- (CNCardLinkedCardsGroupItem)initWithContact:(id)a3;
- (CNContact)contact;
- (void)setContact:(id)a3;
@end

@implementation CNCardLinkedCardsGroupItem

- (void).cxx_destruct
{
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNCardLinkedCardsGroupItem)initWithContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNCardLinkedCardsGroupItem;
  v6 = [(CNCardLinkedCardsGroupItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contact, a3);
  }

  return v7;
}

@end