uint64_t sub_1000023B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1000029E0();
  swift_allocObject();
  sub_1000029F0();
  sub_1000029B0();
  swift_allocObject();
  swift_retain();
  sub_1000029C0();
  sub_100002854(&qword_100008C08);
  sub_100002970();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100002D90;
  sub_100002898(&qword_100008C10, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100002960();
  sub_100002898(&qword_100008C18, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100002960();
  swift_release_n();
  result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_1000025D8()
{
  id v0 = objc_allocWithZone((Class)InfographPoster);

  return [v0 init];
}

uint64_t sub_100002614()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002770()
{
  unint64_t result = qword_100008BE8;
  if (!qword_100008BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008BE8);
  }
  return result;
}

uint64_t sub_1000027C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InfographPosterExtension()
{
  return &type metadata for InfographPosterExtension;
}

uint64_t sub_10000281C()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100002854(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002898(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000028E0()
{
  return sub_100002914((unint64_t *)&unk_100008C20);
}

uint64_t sub_100002914(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000027C4(&qword_100008BF8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100002960()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100002970()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100002980()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100002990()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_1000029A0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000029B0()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_1000029C0()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_1000029D0()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_1000029E0()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_1000029F0()
{
  return PRRenderingConfiguration.init(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

void objc_release(id a1)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _[a1 foregroundView];
}

id objc_msgSend_initWithIdentifier_displayName_initialTimeFontConfiguration_initialTitleColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:");
}

id objc_msgSend_initWithSupportedDataLayout_creationBehavior_editingBehavior_deletionBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:");
}

id objc_msgSend_mutableDescriptorWithIdentifier_role_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableDescriptorWithIdentifier:role:");
}

id objc_msgSend_setAmbientConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmbientConfiguration:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}