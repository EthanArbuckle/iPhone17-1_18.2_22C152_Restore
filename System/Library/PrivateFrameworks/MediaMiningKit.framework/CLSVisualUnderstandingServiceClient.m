@interface CLSVisualUnderstandingServiceClient
- (CLSVisualUnderstandingServiceClient)init;
- (CLSVisualUnderstandingServiceClient)initWithVisionCacheURL:(id)a3 error:(id *)a4;
- (id)deviceOwnerPersonUUIDWithIgnoreContactsLinking:(BOOL)a3;
@end

@implementation CLSVisualUnderstandingServiceClient

- (CLSVisualUnderstandingServiceClient)initWithVisionCacheURL:(id)a3 error:(id *)a4
{
  sub_1D21BD750();
  MEMORY[0x1F4188790]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D21BD740();
  return (CLSVisualUnderstandingServiceClient *)CLSVisualUnderstandingServiceClient.init(visionCacheURL:)((uint64_t)v5);
}

- (id)deviceOwnerPersonUUIDWithIgnoreContactsLinking:(BOOL)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD34590);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_1D2152D04(a3, (uint64_t)v6);

  uint64_t v8 = sub_1D21BD770();
  uint64_t v9 = *(void *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1D21BD760();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (CLSVisualUnderstandingServiceClient)init
{
  result = (CLSVisualUnderstandingServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end