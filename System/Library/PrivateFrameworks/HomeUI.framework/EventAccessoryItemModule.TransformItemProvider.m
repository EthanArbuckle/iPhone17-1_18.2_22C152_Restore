@interface EventAccessoryItemModule.TransformItemProvider
- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3;
- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4;
- (id)_subclass_transformItem:(id)a3;
@end

@implementation EventAccessoryItemModule.TransformItemProvider

- (id)_subclass_transformItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1BE533F70(v4);

  if (v6)
  {
    sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
    sub_1BE3A1734((unint64_t *)&qword_1EBA467A0, (unint64_t *)&qword_1EBA46790);
    v7 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *)sub_1BE5345B4(a3, (uint64_t)sub_1BE535C8C, v6);
}

- (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider)initWithSourceProvider:(id)a3
{
  id v3 = a3;
  id v4 = (_TtCC6HomeUI24EventAccessoryItemModuleP33_731A90F5CE0D8EE558856A09C091B34921TransformItemProvider *)sub_1BE5358AC((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end