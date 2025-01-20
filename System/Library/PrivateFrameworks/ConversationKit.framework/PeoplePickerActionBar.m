@interface PeoplePickerActionBar
- (_TtC15ConversationKit21PeoplePickerActionBar)initWithCoder:(id)a3;
- (_TtC15ConversationKit21PeoplePickerActionBar)initWithFrame:(CGRect)a3;
- (void)addPersonButtonTapped:(id)a3;
- (void)audioButtonTapped:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)inviteWithMessagesButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)messagesButtonTapped:(id)a3;
- (void)rttEnablementDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)videoButtonTapped;
@end

@implementation PeoplePickerActionBar

- (_TtC15ConversationKit21PeoplePickerActionBar)initWithCoder:(id)a3
{
  id v3 = a3;
  PeoplePickerActionBar.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  PeoplePickerActionBar.layoutSubviews()();
}

- (void)rttEnablementDidChange
{
  v2 = self;
  PeoplePickerActionBar.rttEnablementDidChange()();
}

- (_TtC15ConversationKit21PeoplePickerActionBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar_handleToDisplay));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___videoButton));
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioButtonConfiguration, &demangling cache variable for type metadata for UIButton.Configuration?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar_audioButtonLeadingConstraint));
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___cancelButtonConfiguration, &demangling cache variable for type metadata for UIButton.Configuration?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___faceTimeAddPersonButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___sharePlayAddPersonButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___inviteWithMessagesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___inviteWithMessagesButtonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___messagesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___messageAndFaceTimeStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioVideoCallMenu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioCallDisambiguationMenu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___backgroundGradientLayer));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioVideoDropdownButton));
  outlined destroy of Any?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___faceTimeAudioDropdownMenuItem, &demangling cache variable for type metadata for DropdownViewModel.MenuItem?);
  outlined destroy of Any?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___callUsingIPhoneDescriptiveMenuItem, &demangling cache variable for type metadata for DropdownViewModel.MenuItem?);
}

- (void)cancelButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 6);
}

- (void)audioButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePickerActionBar.audioButtonTapped(_:)();
}

- (void)videoButtonTapped
{
  v2 = self;
  PeoplePickerActionBar.videoButtonTapped()();
}

- (void)addPersonButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 3);
}

- (void)inviteWithMessagesButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 4);
}

- (void)messagesButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PeoplePickerActionBar.traitCollectionDidChange(_:)(v9);
}

@end