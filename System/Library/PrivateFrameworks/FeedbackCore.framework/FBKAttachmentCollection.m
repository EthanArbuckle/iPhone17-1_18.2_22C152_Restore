@interface FBKAttachmentCollection
- (BOOL)hasAnyAttachmentCollectedOrCollecting;
- (BOOL)isAlreadyCollectingThisMatcher:(id)a3 ignoreAdditional:(BOOL)a4;
- (BOOL)isRequired;
- (BOOL)replacePreviousAdditionalMatchersWithRequiredMatchersIfNeededWithRequired:(id)a3;
- (DEDBugSession)bugSession;
- (FBKAttachmentCollection)initWithAttachmentManager:(id)a3 device:(id)a4;
- (FBKAttachmentManager)attachmentManager;
- (FBKGroupedDevice)device;
- (NSArray)attachments;
- (NSSet)additionalMatchers;
- (NSString)description;
- (id)updateMatcherPredicatesWithUpdatedMatchers:(id)a3 allRequiredMatchers:(id)a4 formPlatform:(id)a5;
- (unint64_t)state;
- (void)replaceEmptyAttachmentsWithAdditionalMatchersWithAdditional:(id)a3;
- (void)setAttachmentManager:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation FBKAttachmentCollection

- (FBKAttachmentCollection)initWithAttachmentManager:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKAttachmentCollection;
  v9 = [(FBKAttachmentCollection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentManager, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (FBKAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

- (NSString)description
{
  v2 = self;
  FBKAttachmentCollection.description.getter();

  v3 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (unint64_t)state
{
  v2 = self;
  v3 = [(FBKAttachmentCollection *)v2 attachmentManager];
  unint64_t v4 = [(FBKAttachmentManager *)v3 state];

  return v4;
}

- (DEDBugSession)bugSession
{
  v2 = self;
  v3 = [(FBKAttachmentCollection *)v2 attachmentManager];
  unint64_t v4 = [(FBKAttachmentManager *)v3 deCollector];
  id v5 = [(FBKDECollector *)v4 bugSession];

  return (DEDBugSession *)v5;
}

- (NSArray)attachments
{
  v2 = self;
  v3 = [(FBKAttachmentCollection *)v2 attachmentManager];
  unint64_t v4 = [(FBKAttachmentManager *)v3 attachments];

  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  sub_22A4B3628();

  id v5 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (BOOL)isRequired
{
  v2 = self;
  v3 = [(FBKAttachmentCollection *)v2 attachmentManager];
  uint64_t v4 = FBKAttachmentManager.requiredMatcherPredicates.getter();

  if ((v4 & 0xC000000000000001) != 0) {
    uint64_t v5 = sub_22A4B3A08();
  }
  else {
    uint64_t v5 = *(void *)(v4 + 16);
  }

  swift_bridgeObjectRelease();
  return v5 > 0;
}

- (NSSet)additionalMatchers
{
  v2 = self;
  v3 = [(FBKAttachmentCollection *)v2 attachmentManager];
  FBKAttachmentManager.additionalMatcherPredicates.getter();

  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v4 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return (NSSet *)v4;
}

- (BOOL)isAlreadyCollectingThisMatcher:(id)a3 ignoreAdditional:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  char v8 = sub_22A4553FC(v6, a4);

  return v8 & 1;
}

- (id)updateMatcherPredicatesWithUpdatedMatchers:(id)a3 allRequiredMatchers:(id)a4 formPlatform:(id)a5
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v7 = sub_22A4B36B8();
  char v8 = (void *)sub_22A4B36B8();
  if (a5) {
    sub_22A4B3458();
  }
  v9 = self;
  sub_22A46FAFC(v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)replaceEmptyAttachmentsWithAdditionalMatchersWithAdditional:(id)a3
{
  id v4 = a3;
  v9 = self;
  uint64_t v5 = [(FBKAttachmentCollection *)v9 attachments];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  unint64_t v6 = sub_22A4B3628();

  uint64_t v7 = (FBKAttachmentCollection *)v4;
  char v8 = (FBKAttachmentCollection *)sub_22A46C368(v6, v7);
  swift_bridgeObjectRelease();

  if (v8)
  {
    [(FBKAttachmentCollection *)v8 setRequirement:v7];

    uint64_t v7 = v9;
    v9 = v8;
  }
}

- (BOOL)replacePreviousAdditionalMatchersWithRequiredMatchersIfNeededWithRequired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  unint64_t v6 = [(FBKAttachmentCollection *)v5 attachments];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  unint64_t v7 = sub_22A4B3628();

  char v8 = (FBKAttachmentCollection *)v4;
  v9 = (FBKAttachmentCollection *)sub_22A46C578(v7, v8);
  swift_bridgeObjectRelease();

  if (v9)
  {
    [(FBKAttachmentCollection *)v9 setRequirement:v8];

    char v8 = v5;
    uint64_t v5 = v9;
  }

  return v9 != 0;
}

- (BOOL)hasAnyAttachmentCollectedOrCollecting
{
  v2 = self;
  char v3 = sub_22A455BE8();

  return v3 & 1;
}

@end