@interface BucketCollectionViewLayout
- (_TtC6MailUI26BucketCollectionViewLayout)initWithCoder:(id)a3;
- (_TtC6MailUI26BucketCollectionViewLayout)initWithSection:(id)a3;
- (_TtC6MailUI26BucketCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC6MailUI26BucketCollectionViewLayout)initWithSectionProvider:(id)a3;
- (_TtC6MailUI26BucketCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation BucketCollectionViewLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v11 = sub_1DDEECF38();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (uint64_t)&v8 - v8;
  id v4 = (id)MEMORY[0x1F4188790](v13);
  v5 = self;
  sub_1DDEECEE8();
  v15 = BucketCollectionViewLayout.layoutAttributesForItem(at:)(v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);

  v6 = v15;
  return v6;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v3 = self;
  unint64_t v9 = (unint64_t)BucketCollectionViewLayout.layoutAttributesForElements(in:)((__C::CGRect)a3);

  if (v9)
  {
    sub_1DDD5CA44();
    uint64_t v5 = sub_1DDEEED98();
    swift_bridgeObjectRelease();
    id v6 = (id)v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v11 = sub_1DDEECF38();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (uint64_t)&v8 - v8;
  id v4 = (id)MEMORY[0x1F4188790](v13);
  uint64_t v5 = self;
  sub_1DDEECEE8();
  v15 = BucketCollectionViewLayout.initialLayoutAttributesForAppearingItem(at:)(v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);

  id v6 = v15;
  return v6;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v11 = sub_1DDEECF38();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (uint64_t)&v8 - v8;
  id v4 = (id)MEMORY[0x1F4188790](v13);
  uint64_t v5 = self;
  sub_1DDEECEE8();
  v15 = BucketCollectionViewLayout.finalLayoutAttributesForDisappearingItem(at:)(v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);

  id v6 = v15;
  return v6;
}

- (_TtC6MailUI26BucketCollectionViewLayout)initWithSection:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI26BucketCollectionViewLayout *)BucketCollectionViewLayout.init(section:)(a3);
}

- (_TtC6MailUI26BucketCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (_TtC6MailUI26BucketCollectionViewLayout *)BucketCollectionViewLayout.init(section:configuration:)(a3, a4);
}

- (_TtC6MailUI26BucketCollectionViewLayout)initWithSectionProvider:(id)a3
{
  id v5 = _Block_copy(a3);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v5;
  return (_TtC6MailUI26BucketCollectionViewLayout *)BucketCollectionViewLayout.init(sectionProvider:)((uint64_t)sub_1DDD5F33C, v3);
}

- (_TtC6MailUI26BucketCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v7 = _Block_copy(a3);
  id v4 = a4;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v7;
  return (_TtC6MailUI26BucketCollectionViewLayout *)BucketCollectionViewLayout.init(sectionProvider:configuration:)((uint64_t)sub_1DDD5F33C, v5, a4);
}

- (_TtC6MailUI26BucketCollectionViewLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI26BucketCollectionViewLayout *)BucketCollectionViewLayout.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end