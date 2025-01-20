@interface BucketCollectionViewCell
- (_TtC6MailUI24BucketCollectionViewCell)initWithCoder:(id)a3;
- (_TtC6MailUI24BucketCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation BucketCollectionViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = sub_1DDEED488();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)MEMORY[0x1F4188790](v12);
  v5 = self;
  sub_1DDEED468();
  BucketCollectionViewCell.updateConfiguration(using:)(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (void)prepareForReuse
{
  v2 = self;
  BucketCollectionViewCell.prepareForReuse()();
}

- (_TtC6MailUI24BucketCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI24BucketCollectionViewCell *)BucketCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI24BucketCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI24BucketCollectionViewCell *)BucketCollectionViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI24BucketCollectionViewCell_customBackgroundView));
}

@end