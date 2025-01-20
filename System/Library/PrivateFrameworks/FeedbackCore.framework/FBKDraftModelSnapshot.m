@interface FBKDraftModelSnapshot
- (BOOL)hasAnyDevices;
- (FBKDraftModelSnapshot)initWithQuestionGroups:(id)a3 questions:(id)a4 deviceDiagnostics:(id)a5;
- (NSArray)allAttachments;
- (NSArray)allQuestions;
- (NSArray)devices;
- (NSArray)questionGroups;
- (NSArray)sections;
- (NSDictionary)deviceIdToAttachments;
- (NSDictionary)questionGroupIdToQuestions;
- (id)rowsForSection:(id)a3;
- (void)setDeviceIdToAttachments:(id)a3;
- (void)setDevices:(id)a3;
- (void)setQuestionGroupIdToQuestions:(id)a3;
- (void)setQuestionGroups:(id)a3;
@end

@implementation FBKDraftModelSnapshot

- (FBKDraftModelSnapshot)initWithQuestionGroups:(id)a3 questions:(id)a4 deviceDiagnostics:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)FBKDraftModelSnapshot;
  v12 = [(FBKDraftModelSnapshot *)&v38 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_questionGroups, a3);
    objc_storeStrong((id *)&v13->_questionGroupIdToQuestions, a4);
    v33 = objc_opt_new();
    v14 = objc_opt_new();
    if (v11)
    {
      v30 = v13;
      id v31 = v10;
      id v32 = v9;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v15 = [v11 generateSnapshotIdentifiersTrackingLastDevice:0];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v21 = [v11 maybeDeviceWithIdentifier:v20];
            if (v21)
            {
              [v33 addObject:v21];
              v22 = [v21 identifier];
              v23 = objc_opt_new();
              [v14 setObject:v23 forKeyedSubscript:v22];
            }
            else
            {
              v22 = [v11 maybeAttachmentWithIdentifier:v20];
              v23 = [v22 deviceUUID];
              v24 = [v14 objectForKeyedSubscript:v23];
              [v24 addObject:v22];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v17);
      }

      id v10 = v31;
      id v9 = v32;
      v13 = v30;
    }
    uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithArray:v33];
    devices = v13->_devices;
    v13->_devices = (NSArray *)v25;

    uint64_t v27 = [NSDictionary dictionaryWithDictionary:v14];
    deviceIdToAttachments = v13->_deviceIdToAttachments;
    v13->_deviceIdToAttachments = (NSDictionary *)v27;
  }
  return v13;
}

- (NSArray)questionGroups
{
  return self->_questionGroups;
}

- (void)setQuestionGroups:(id)a3
{
}

- (NSDictionary)questionGroupIdToQuestions
{
  return self->_questionGroupIdToQuestions;
}

- (void)setQuestionGroupIdToQuestions:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSDictionary)deviceIdToAttachments
{
  return self->_deviceIdToAttachments;
}

- (void)setDeviceIdToAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdToAttachments, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_questionGroupIdToQuestions, 0);

  objc_storeStrong((id *)&self->_questionGroups, 0);
}

- (BOOL)hasAnyDevices
{
  v2 = self;
  v3 = [(FBKDraftModelSnapshot *)v2 devices];
  sub_22A40F5A0(0, &qword_268376840);
  unint64_t v4 = sub_22A4B3628();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22A4B3C18();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 > 0;
}

- (NSArray)allQuestions
{
  v2 = self;
  v3 = [(FBKDraftModelSnapshot *)v2 questionGroupIdToQuestions];
  sub_22A40F5A0(0, &qword_268375FC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268377810);
  sub_22A44BE5C();
  uint64_t v4 = sub_22A4B33F8();

  sub_22A49F140(v4);
  swift_bridgeObjectRelease();
  sub_22A40F5A0(0, &qword_2683762B0);
  uint64_t v5 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (NSArray)allAttachments
{
  v2 = self;
  v3 = [(FBKDraftModelSnapshot *)v2 deviceIdToAttachments];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268377818);
  uint64_t v4 = sub_22A4B33F8();

  sub_22A49F2B0(v4);
  swift_bridgeObjectRelease();
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  uint64_t v5 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (NSArray)sections
{
  return (NSArray *)sub_22A4A0194(self, (uint64_t)a2, (void (*)(void))sub_22A49F7A4, &qword_268377828);
}

- (id)rowsForSection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22A49FACC(v4);

  sub_22A40F5A0(0, &qword_268377820);
  v6 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v6;
}

@end