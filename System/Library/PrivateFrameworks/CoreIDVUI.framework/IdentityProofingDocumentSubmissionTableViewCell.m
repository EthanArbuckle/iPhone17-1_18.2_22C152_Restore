@interface IdentityProofingDocumentSubmissionTableViewCell
- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation IdentityProofingDocumentSubmissionTableViewCell

- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_21F5515A0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell *)sub_21F4E6918(a3, (uint64_t)a4, v6);
}

- (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell *)sub_21F4E6A1C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___documentImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___documentTitle));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingDocumentSubmissionTableViewCell____lazy_storage___imageContainer);
}

@end