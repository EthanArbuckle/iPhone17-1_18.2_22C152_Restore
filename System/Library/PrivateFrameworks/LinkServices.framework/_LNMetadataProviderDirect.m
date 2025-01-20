@interface _LNMetadataProviderDirect
- (_TtC12LinkServices25_LNMetadataProviderDirect)init;
- (_TtC12LinkServices25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsWithError:(id *)a3;
- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4;
- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _LNMetadataProviderDirect

- (_TtC12LinkServices25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  return (_TtC12LinkServices25_LNMetadataProviderDirect *)_LNMetadataProviderDirect.init(connection:options:)(a3, a4);
}

- (id)actionsWithError:(id *)a3
{
  return sub_1A446BE90(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.actions(), (uint64_t *)&unk_1EB57DCD0);
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  sub_1A4438ECC(0, &qword_1EB57D890);
  sub_1A443FA60();
  sub_1A44F9710();
  if (a5) {
    sub_1A44F94E0();
  }
  v8 = self;
  _LNMetadataProviderDirect.actionsConforming(to:logicalType:bundleIdentifier:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB57DCD0);
  v9 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  if (a3) {
    sub_1A44F94E0();
  }
  v5 = self;
  _LNMetadataProviderDirect.actionsAndSystemProtocolDefaults(forBundleIdentifier:)();

  swift_bridgeObjectRelease();
  sub_1A4438ECC(0, &qword_1E9647E18);
  v6 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446BAA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actions(forBundleIdentifier:), &qword_1EB57DCE0);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446C174(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actionIdentifiers(forBundleIdentifier:));
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1A44F94E0();
  uint64_t v11 = v10;
  v12 = self;
  v13 = (void *)_LNMetadataProviderDirect.action(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1A44F94E0();
  uint64_t v11 = v10;
  v12 = self;
  _LNMetadataProviderDirect.actions(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A4438ECC(0, &qword_1EB57DCE0);
  v13 = (void *)sub_1A44F9640();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  sub_1A4438ECC(0, &qword_1E9647148);
  uint64_t v9 = sub_1A44F93F0();
  if (a5)
  {
    uint64_t v10 = sub_1A44F94E0();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v12 = a3;
  v13 = self;
  _LNMetadataProviderDirect.actionsConforming(to:withParametersOfTypes:bundleIdentifier:)((uint64_t)v13, v9, v10, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB57DCD0);
  v14 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  sub_1A4438ECC(0, (unint64_t *)&unk_1EB57D8E8);
  sub_1A44F9650();
  v5 = self;
  _LNMetadataProviderDirect.actions(withFullyQualifiedIdentifiers:)();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB57DCD0);
  uint64_t v6 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)bundlesWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundles()();

  v4 = (void *)sub_1A44F9640();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundleRegistrations()();

  sub_1A4438ECC(0, &qword_1E9647E10);
  v4 = (void *)sub_1A44F9640();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)queriesWithError:(id *)a3
{
  return sub_1A446BE90(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.queries(), (uint64_t *)&unk_1EB57D918);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  sub_1A44F94E0();
  if (a4) {
    sub_1A44F94E0();
  }
  uint64_t v7 = self;
  _LNMetadataProviderDirect.queries(forBundleIdentifier:ofType:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1A4438ECC(0, (unint64_t *)&qword_1EB57DA10);
  uint64_t v8 = (void *)sub_1A44F9640();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)enumsWithError:(id *)a3
{
  return sub_1A446BE90(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.enums(), (uint64_t *)&unk_1EB57D908);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446BAA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.enums(forBundleIdentifier:), (unint64_t *)&qword_1EB57DB40);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_1A446BE90(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.entities(), (uint64_t *)&unk_1EB57D928);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446BAA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entities(forBundleIdentifier:), (unint64_t *)&qword_1EB57DB50);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446C174(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entityIdentifiers(forBundleIdentifier:));
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  id v10 = _LNMetadataProviderDirect.metadataVersion(forBundleIdentifier:error:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  _LNMetadataProviderDirect.appShortcutsProviderMangledTypeName(forBundleIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      id v12 = (void *)sub_1A44F90E0();

      id v13 = v12;
      v14 = 0;
      *a4 = v12;
    }
    else
    {

      v14 = 0;
    }
  }
  else
  {
    v14 = (void *)sub_1A44F94B0();
    swift_bridgeObjectRelease();
  }
  return v14;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A446BAA0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.examplePhrases(forBundleIdentifier:), (unint64_t *)&qword_1E9646D58);
}

- (_TtC12LinkServices25_LNMetadataProviderDirect)init
{
}

- (void).cxx_destruct
{
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_1A44F94E0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1A44F94E0();
  uint64_t v12 = v11;
  _Block_copy(v6);
  id v13 = self;
  sub_1A446CA10(v7, v9, v10, v12, v13, (void (**)(void, void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1A44F94E0();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1A446CFBC(v6, v8, v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  sub_1A44F94E0();
  v5 = self;
  _LNMetadataProviderDirect.autoShortcuts(forLocaleIdentifier:)();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB57D9D0);
  uint64_t v6 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  sub_1A44F92B0();
  sub_1A44F9650();
  v5 = self;
  _LNMetadataProviderDirect.properties(forIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_1A4438ECC(0, (unint64_t *)&qword_1EB57DAF0);
  sub_1A446E460(&qword_1EB57D990, MEMORY[0x1E4F27990]);
  uint64_t v6 = (void *)sub_1A44F93E0();
  swift_bridgeObjectRelease();
  return v6;
}

@end