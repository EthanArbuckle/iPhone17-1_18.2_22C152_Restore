@interface FamilyInviteAnalytics
+ (_TtC14FamilyCircleUI21FamilyInviteAnalytics)shared;
- (_TtC14FamilyCircleUI21FamilyInviteAnalytics)init;
- (void)sendFamilyInviteInteractionEventWithAction:(id)a3 inviteState:(id)a4 isReceiver:(BOOL)a5;
- (void)sendFamilyInviteStatusUpdateEventWithUpdateStatus:(id)a3 success:(BOOL)a4;
- (void)sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:(int64_t)a3 familySuggestionsDisplayedCount:(int64_t)a4 hasBoostedContacts:(BOOL)a5 proactiveModelUsed:(int64_t)a6 serverRequestedModel:(id)a7;
- (void)sendOtherContactInvitedEventWithInviteTransport:(id)a3 inviteCompletionStatus:(int64_t)a4;
- (void)sendSuggestedContactInvitedEventWithInviteCompletionStatus:(int64_t)a3;
- (void)sendTapInviteOnSuggestedContactEvent;
- (void)sendTapInviteOthersEvent;
@end

@implementation FamilyInviteAnalytics

+ (_TtC14FamilyCircleUI21FamilyInviteAnalytics)shared
{
  if (qword_267BE8418 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267BEBC28;
  return (_TtC14FamilyCircleUI21FamilyInviteAnalytics *)v2;
}

- (void)sendTapInviteOnSuggestedContactEvent
{
}

- (void)sendTapInviteOthersEvent
{
}

- (void)sendSuggestedContactInvitedEventWithInviteCompletionStatus:(int64_t)a3
{
}

- (void)sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:(int64_t)a3 familySuggestionsDisplayedCount:(int64_t)a4 hasBoostedContacts:(BOOL)a5 proactiveModelUsed:(int64_t)a6 serverRequestedModel:(id)a7
{
  uint64_t v12 = sub_218CAEE38();
  uint64_t v14 = v13;
  v15 = self;
  sub_218B27E54(a3, a4, a5, a6, v12, v14);

  swift_bridgeObjectRelease();
}

- (void)sendOtherContactInvitedEventWithInviteTransport:(id)a3 inviteCompletionStatus:(int64_t)a4
{
  uint64_t v6 = sub_218CAEE38();
  uint64_t v8 = v7;
  v9 = self;
  sub_218B28020(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)sendFamilyInviteInteractionEventWithAction:(id)a3 inviteState:(id)a4 isReceiver:(BOOL)a5
{
  uint64_t v7 = sub_218CAEE38();
  uint64_t v9 = v8;
  uint64_t v10 = sub_218CAEE38();
  uint64_t v12 = v11;
  uint64_t v13 = self;
  sub_218B2816C(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sendFamilyInviteStatusUpdateEventWithUpdateStatus:(id)a3 success:(BOOL)a4
{
  uint64_t v6 = sub_218CAEE38();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_218B282F0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (_TtC14FamilyCircleUI21FamilyInviteAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FamilyInviteAnalytics();
  return [(FamilyInviteAnalytics *)&v3 init];
}

@end