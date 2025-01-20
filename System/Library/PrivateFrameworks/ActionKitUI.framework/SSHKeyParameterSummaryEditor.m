@interface SSHKeyParameterSummaryEditor
- (_TtC11ActionKitUI28SSHKeyParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
@end

@implementation SSHKeyParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_22BF0F048();
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_22BF0E974((uint64_t)&unk_268491C18, v5);
}

- (_TtC11ActionKitUI28SSHKeyParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC11ActionKitUI28SSHKeyParameterSummaryEditor *)sub_22BF0FCC0(a3, a4, a5);
}

- (void).cxx_destruct
{
}

@end