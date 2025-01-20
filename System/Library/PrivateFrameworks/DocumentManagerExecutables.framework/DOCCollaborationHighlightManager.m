@interface DOCCollaborationHighlightManager
- (_TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager)init;
- (void)highlightCenterHighlightsDidChange:(id)a3;
@end

@implementation DOCCollaborationHighlightManager

- (_TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager)init
{
  return (_TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager *)sub_22BDCDA6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_highlightCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_collaborationIdentifierToHighlightCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_fetchQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_coalescingTimer));

  swift_bridgeObjectRelease();
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  *(void *)(v6 + 24) = ObjectType;
  v10[4] = sub_22BE22C88;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22BDD0BA8;
  v10[3] = &block_descriptor_14_0;
  v7 = _Block_copy(v10);
  v8 = self;
  id v9 = a3;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v7);
}

@end