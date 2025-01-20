@interface ActivitySubjectProvider
- (_TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation ActivitySubjectProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item), *(void *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item+ 16]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item), *(void *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item+ 16]);
  v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();

  return v4;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_subject);
  uint64_t v5 = *(void *)&self->item[OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_subject];
  swift_bridgeObjectRetain();
  v6 = (void *)MEMORY[0x18C115780](v4, v5);
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider)init
{
  result = (_TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_91555EE1A45CC99D949E9B39601C01F623ActivitySubjectProvider_item);

  swift_bridgeObjectRelease();
}

@end