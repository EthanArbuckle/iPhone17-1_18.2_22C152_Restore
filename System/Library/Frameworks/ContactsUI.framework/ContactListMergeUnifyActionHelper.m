@interface ContactListMergeUnifyActionHelper
+ (id)descriptorForRequiredKeys;
- (BOOL)applyMergeResultToSaveRequest:(id)a3;
- (BOOL)applyUndoTo:(id)a3 and:(id)a4;
- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)init;
- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)initWithContactStore:(id)a3;
- (void)mergeContacts:(id)a3 withContainerIdentifiers:(id)a4 withContactIDToParentGroupsDict:(id)a5;
@end

@implementation ContactListMergeUnifyActionHelper

+ (id)descriptorForRequiredKeys
{
  sub_18B985BE8();
  sub_18B985B58();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913E6E0);
  v2 = (void *)sub_18B985F78();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)initWithContactStore:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactItems) = (Class)MEMORY[0x1E4FBC860];
  v5 = (char *)self + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_mergeResult;
  uint64_t v6 = sub_18B985BB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactStore) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContactListMergeUnifyActionHelper();
  id v7 = a3;
  return [(ContactListMergeUnifyActionHelper *)&v9 init];
}

- (void)mergeContacts:(id)a3 withContainerIdentifiers:(id)a4 withContactIDToParentGroupsDict:(id)a5
{
  sub_18B650634(0, (unint64_t *)&qword_1E913B120);
  unint64_t v6 = sub_18B985F88();
  uint64_t v7 = sub_18B985F88();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E913BCD0);
  uint64_t v8 = sub_18B985D78();
  objc_super v9 = self;
  sub_18B64EC30(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)applyMergeResultToSaveRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_18B64F148();

  return self & 1;
}

- (BOOL)applyUndoTo:(id)a3 and:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_18B64F354(v6, v7);

  return v9 & 1;
}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)init
{
  result = (_TtC10ContactsUI33ContactListMergeUnifyActionHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_contactStore));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI33ContactListMergeUnifyActionHelper_mergeResult;

  sub_18B6501EC((uint64_t)v3);
}

@end