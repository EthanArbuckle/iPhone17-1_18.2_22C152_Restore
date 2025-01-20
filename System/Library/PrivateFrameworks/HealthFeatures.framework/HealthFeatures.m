id static HealthFeaturesUtilities.bundle.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_251053E60();
  v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  return v1;
}

ValueMetadata *type metadata accessor for HealthFeaturesUtilities()
{
  return &type metadata for HealthFeaturesUtilities;
}

uint64_t sub_251053E60()
{
  return MEMORY[0x270EF19B0]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}