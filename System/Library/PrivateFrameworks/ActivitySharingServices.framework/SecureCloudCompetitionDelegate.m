@interface SecureCloudCompetitionDelegate
- (_TtC23ActivitySharingServices30SecureCloudCompetitionDelegate)init;
- (void)competitionManager:(ASCompetitionManager *)a3 deleteCompetitionLists:(NSSet *)a4 group:(CKOperationGroup *)a5 completion:(id)a6;
- (void)competitionManager:(ASCompetitionManager *)a3 saveCompetitionLists:(NSSet *)a4 group:(CKOperationGroup *)a5 completion:(id)a6;
- (void)competitionManager:(ASCompetitionManager *)a3 saveCurrentCompetitionList:(ASCompetitionList *)a4 archivedCompetitionList:(ASCompetitionList *)a5 contact:(ASContact *)a6 group:(CKOperationGroup *)a7 completion:(id)a8;
@end

@implementation SecureCloudCompetitionDelegate

- (_TtC23ActivitySharingServices30SecureCloudCompetitionDelegate)init
{
  result = (_TtC23ActivitySharingServices30SecureCloudCompetitionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices30SecureCloudCompetitionDelegate_competitionService);
  v3 = (char *)self + OBJC_IVAR____TtC23ActivitySharingServices30SecureCloudCompetitionDelegate_pushService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)competitionManager:(ASCompetitionManager *)a3 saveCurrentCompetitionList:(ASCompetitionList *)a4 archivedCompetitionList:(ASCompetitionList *)a5 contact:(ASContact *)a6 group:(CKOperationGroup *)a7 completion:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_269259B78;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269259B80;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = self;
  sub_2476AF394((uint64_t)v17, (uint64_t)&unk_269259B88, (uint64_t)v22);
  swift_release();
}

- (void)competitionManager:(ASCompetitionManager *)a3 saveCompetitionLists:(NSSet *)a4 group:(CKOperationGroup *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269259B48;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269259B50;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_2476AF394((uint64_t)v13, (uint64_t)&unk_26925A890, (uint64_t)v18);
  swift_release();
}

- (void)competitionManager:(ASCompetitionManager *)a3 deleteCompetitionLists:(NSSet *)a4 group:(CKOperationGroup *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269259B18;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269259B20;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_2476AF394((uint64_t)v13, (uint64_t)&unk_26925A870, (uint64_t)v18);
  swift_release();
}

@end