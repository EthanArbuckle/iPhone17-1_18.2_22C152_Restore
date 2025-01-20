@interface FBKQuestionGroupDiffableSection
+ (id)identifierForQuestion:(id)a3 formResponse:(id)a4 questionIDsInErrorState:(id)a5;
- (BOOL)isSectionBelowAttachments;
- (FBKQuestionGroup)questionGroup;
- (NSArray)rowIdentifiers;
- (NSString)sectionIdentifier;
- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)init;
- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)initWithQuestionGroup:(id)a3 visibleQuestions:(id)a4 formResponse:(id)a5 useInlineChoices:(BOOL)a6 questionIDsInErrorState:(id)a7;
- (id)questionOrChoiceWithRowIdentifier:(id)a3;
- (id)questionWithChoice:(id)a3;
- (id)questionWithRowIdentifier:(id)a3;
- (id)visibleQuestions;
@end

@implementation FBKQuestionGroupDiffableSection

- (FBKQuestionGroup)questionGroup
{
  return (FBKQuestionGroup *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                     + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup));
}

- (BOOL)isSectionBelowAttachments
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_isSectionBelowAttachments);
}

- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)initWithQuestionGroup:(id)a3 visibleQuestions:(id)a4 formResponse:(id)a5 useInlineChoices:(BOOL)a6 questionIDsInErrorState:(id)a7
{
  sub_22A40F5A0(0, &qword_2683762B0);
  unint64_t v10 = sub_22A4B3628();
  sub_22A40F5A0(0, &qword_268375FC0);
  sub_22A44BE5C();
  uint64_t v11 = sub_22A4B36B8();
  id v12 = a3;
  id v13 = a5;
  v14 = (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection *)sub_22A44B400(v12, v10, v13, a6, v11);

  return v14;
}

+ (id)identifierForQuestion:(id)a3 formResponse:(id)a4 questionIDsInErrorState:(id)a5
{
  sub_22A40F5A0(0, &qword_268375FC0);
  sub_22A44BE5C();
  uint64_t v7 = sub_22A4B36B8();
  id v8 = a3;
  id v9 = a4;
  _s12FeedbackCore31FBKQuestionGroupDiffableSectionC21identifierForQuestion_12formResponse23questionIDsInErrorStateSSSo0C0C_So07FBKFormK0CShySo8NSNumberCGtFZ_0(v8, (uint64_t)v9, v7);

  swift_bridgeObjectRelease();
  unint64_t v10 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)questionWithRowIdentifier:(id)a3
{
  return sub_22A44A6A8(self, (uint64_t)a2, (uint64_t)a3, sub_22A44A3C8);
}

- (id)questionOrChoiceWithRowIdentifier:(id)a3
{
  return sub_22A44A6A8(self, (uint64_t)a2, (uint64_t)a3, sub_22A44A530);
}

- (id)visibleQuestions
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_22A44B298(v3, (uint64_t)v2);

  swift_bridgeObjectRelease();
  sub_22A40F5A0(0, &qword_2683762B0);
  v4 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)questionWithChoice:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_choiceIdentifierToQuestion);
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_22A44A044(v5, v4);

  return v7;
}

- (NSString)sectionIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup);
  uint64_t v3 = self;
  result = (NSString *)objc_msgSend(v2, sel_title);
  if (result)
  {
    id v5 = result;
    sub_22A4B3458();

    v6 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSArray)rowIdentifiers
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection)init
{
  result = (_TtC12FeedbackCore31FBKQuestionGroupDiffableSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore31FBKQuestionGroupDiffableSection_questionGroup));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end