@interface FBKAttachmentManager
- (BOOL)autoGathersDiagnosticExtensions;
- (BOOL)canCancelAttachmentCollection:(id)a3;
- (BOOL)canDeleteAttachment:(id)a3;
- (BOOL)hasFilePromises;
- (BOOL)hasUnmetRequirementAttachments;
- (BOOL)isAttachmentParent:(id)a3;
- (FBKAttachmentManager)initWithMatcherPredicates:(id)a3 pendingFileUrls:(id)a4 pendingExtensions:(id)a5 form:(id)a6 targetDevice:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10 autoGathersDiagnosticExtensions:(BOOL)a11;
- (FBKAttachmentManagerDelegate)delegate;
- (FBKDECollector)deCollector;
- (FBKFileCollector)fileCollector;
- (FBKGroupedDevice)targetDevice;
- (NSArray)attachments;
- (NSSet)pendingRequirements;
- (NSString)description;
- (id)attachmentForIndexPath:(id)a3;
- (id)popPendingRequirements;
- (int64_t)attachmentIndex:(id)a3;
- (unint64_t)state;
- (void)abortAllSessions;
- (void)addAttachmentWithItemProvider:(id)a3;
- (void)addFileFrom:(id)a3 byMoving:(BOOL)a4;
- (void)attachmentProvider:(id)a3 didAddAttachment:(id)a4;
- (void)attachmentProvider:(id)a3 didFinishAttaching:(id)a4 error:(id)a5;
- (void)attachmentProvider:(id)a3 didFinishLoadingWithAttachments:(id)a4 error:(id)a5;
- (void)attachmentProvider:(id)a3 didRemoveAttachment:(id)a4;
- (void)attachmentProvider:(id)a3 didStartAttaching:(id)a4;
- (void)attachmentProvider:(id)a3 didTakeAttachment:(id)a4 fromOtherProvider:(id)a5;
- (void)attachmentProvider:(id)a3 didUpdateAttachment:(id)a4;
- (void)gatherAttachment:(id)a3 answers:(id)a4;
- (void)gatherFilesWithDedExtension:(id)a3 answers:(id)a4;
- (void)postLaunchAttachLocalFiles:(id)a3 allRequirements:(id)a4;
- (void)removeAllAttachments;
- (void)setAttachments:(id)a3;
- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3;
- (void)setDeCollector:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileCollector:(id)a3;
- (void)setPendingRequirements:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTargetDevice:(id)a3;
- (void)updateRequirements:(id)a3;
@end

@implementation FBKAttachmentManager

- (FBKAttachmentManager)initWithMatcherPredicates:(id)a3 pendingFileUrls:(id)a4 pendingExtensions:(id)a5 form:(id)a6 targetDevice:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10 autoGathersDiagnosticExtensions:(BOOL)a11
{
  BOOL v11 = a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  v43.receiver = self;
  v43.super_class = (Class)FBKAttachmentManager;
  v23 = [(FBKAttachmentManager *)&v43 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_targetDevice, a7);
    uint64_t v25 = objc_opt_new();
    attachments = v24->_attachments;
    v24->_attachments = (NSArray *)v25;

    v24->_autoGathersDiagnosticExtensions = a11;
    if ([v20 filerFormType] != 2)
    {
      if ([v21 isCurrentDevice])
      {
        v27 = [[FBKFileCollector alloc] initWithFilerForm:v20 attachmentDescriptors:v22];
        [(FBKFileCollector *)v27 setListener:v24];
        objc_storeStrong((id *)&v24->_fileCollector, v27);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __203__FBKAttachmentManager_initWithMatcherPredicates_pendingFileUrls_pendingExtensions_form_targetDevice_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke;
        v32[3] = &unk_2648775C8;
        id v33 = v18;
        v34 = v27;
        id v35 = v17;
        id v36 = v21;
        id v37 = v20;
        id v38 = v19;
        v39 = v24;
        BOOL v41 = v11;
        BOOL v42 = a9;
        id v40 = v22;
        deCollector = v27;
        +[FBKFileCollector findExistingFilesForFilerForm:v37 matcherPredicates:v35 completion:v32];
      }
      else
      {
        LOBYTE(v31) = a9;
        v29 = [[FBKDECollector alloc] initWithRequirements:v17 forDevice:v21 filerForm:v20 extensionsFromURL:v19 listener:v24 shouldGetSessionStatus:v11 shouldCheckDeferredLogs:v31 attachmentDescriptors:v22];
        deCollector = (FBKFileCollector *)v24->_deCollector;
        v24->_deCollector = v29;
      }
    }
  }

  return v24;
}

void __203__FBKAttachmentManager_initWithMatcherPredicates_pendingFileUrls_pendingExtensions_form_targetDevice_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v13 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = v5;
  if (v13 | v6)
  {
    if (v13)
    {
      v7 = [*(id *)(a1 + 40) attachDraftFiles:v13 withRequirements:v5];

      uint64_t v6 = *(void *)(a1 + 32);
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    v7 = v5;
    if (v6)
    {
LABEL_4:
      uint64_t v8 = [*(id *)(a1 + 40) attachURLSchemeFiles:v6 withRequirements:v7];

      v7 = (void *)v8;
    }
  }
LABEL_5:
  v9 = [FBKDECollector alloc];
  LOBYTE(v12) = *(unsigned char *)(a1 + 97);
  v10 = [(FBKDECollector *)v9 initWithRequirements:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 56) filerForm:*(void *)(a1 + 64) extensionsFromURL:*(void *)(a1 + 72) listener:*(void *)(a1 + 80) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 96) shouldCheckDeferredLogs:v12 attachmentDescriptors:*(void *)(a1 + 88)];
  [*(id *)(a1 + 80) setDeCollector:v10];
  BOOL v11 = [*(id *)(a1 + 80) fileCollector];
  [v11 setDeCollector:v10];
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (FBKGroupedDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (FBKDECollector)deCollector
{
  return self->_deCollector;
}

- (void)setDeCollector:(id)a3
{
}

- (FBKFileCollector)fileCollector
{
  return self->_fileCollector;
}

- (void)setFileCollector:(id)a3
{
}

- (FBKAttachmentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKAttachmentManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (NSSet)pendingRequirements
{
  return self->_pendingRequirements;
}

- (void)setPendingRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequirements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileCollector, 0);
  objc_storeStrong((id *)&self->_deCollector, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);

  objc_storeStrong((id *)&self->_attachments, 0);
}

- (NSString)description
{
  v2 = self;
  v3 = [(FBKAttachmentManager *)v2 attachments];
  uint64_t v4 = sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  uint64_t v5 = sub_22A4B3628();

  MEMORY[0x22A6C9290](v5, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (id)popPendingRequirements
{
  v2 = self;
  v3 = [(FBKAttachmentManager *)v2 pendingRequirements];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_22A40F5A0(0, &qword_2683760E8);
    sub_22A40F55C(&qword_268376190, &qword_2683760E8);
    sub_22A4B36B8();

    [(FBKAttachmentManager *)v2 setPendingRequirements:0];
    uint64_t v5 = (void *)sub_22A4B36A8();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)updateRequirements:(id)a3
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  sub_22A4B36B8();
  uint64_t v4 = self;
  FBKAttachmentManager.updateRequirements(_:)();

  swift_bridgeObjectRelease();
}

- (void)postLaunchAttachLocalFiles:(id)a3 allRequirements:(id)a4
{
  sub_22A4B24C8();
  uint64_t v5 = sub_22A4B33F8();
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  sub_22A4B36B8();
  uint64_t v6 = self;
  FBKAttachmentManager.postLaunchAttachLocalFiles(_:allRequirements:)(v5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)abortAllSessions
{
  v2 = self;
  FBKAttachmentManager.abortAllSessions()();
}

- (BOOL)isAttachmentParent:(id)a3
{
  uint64_t v4 = (FBKAttachment *)a3;
  uint64_t v5 = self;
  LOBYTE(self) = FBKAttachmentManager.isAttachmentParent(_:)(v4);

  return self & 1;
}

- (BOOL)canDeleteAttachment:(id)a3
{
  return objc_msgSend(a3, sel_canBeDeleted);
}

- (BOOL)canCancelAttachmentCollection:(id)a3
{
  uint64_t v4 = (FBKAttachment *)a3;
  uint64_t v5 = self;
  LOBYTE(self) = FBKAttachmentManager.canCancelAttachmentCollection(_:)(v4);

  return self & 1;
}

- (id)attachmentForIndexPath:(id)a3
{
  uint64_t v4 = sub_22A4B25F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B25B8();
  uint64_t v8 = self;
  unint64_t v9 = sub_22A4B25D8();
  v10 = [(FBKAttachmentManager *)v8 attachments];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  uint64_t v11 = sub_22A4B3628();

  if ((v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x22A6C9770](v9, v11);
    goto LABEL_5;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v9 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v13 = *(id *)(v11 + 8 * v9 + 32);
LABEL_5:
  v14 = v13;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v14;
}

- (int64_t)attachmentIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(FBKAttachmentManager *)v5 attachments];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  unint64_t v7 = sub_22A4B3628();

  sub_22A41CEEC((uint64_t)v4, v7, (unint64_t *)&unk_268376180);
  int64_t v9 = v8;
  char v11 = v10;

  swift_bridgeObjectRelease();
  if (v11) {
    return -1;
  }
  else {
    return v9;
  }
}

- (void)removeAllAttachments
{
  v2 = self;
  unint64_t v3 = sub_22A41A75C();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    uint64_t v5 = sub_22A4B3C18();
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v5; ++i)
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      unint64_t v7 = (void *)MEMORY[0x22A6C9770](i, v4);
    }
    else
    {
      unint64_t v7 = *(void **)(v4 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    objc_msgSend(v7, sel_removeAllAttachments);
    swift_unknownObjectRelease();
  }
LABEL_10:

  swift_bridgeObjectRelease();
}

- (BOOL)hasUnmetRequirementAttachments
{
  v2 = self;
  unint64_t v3 = [(FBKAttachmentManager *)v2 deCollector];
  if (v3)
  {
    unint64_t v4 = (FBKAttachmentManager *)v3;
    unsigned __int8 v5 = [(FBKDECollector *)v3 hasUnmetRequirements];

    v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)hasFilePromises
{
  v2 = self;
  Swift::Bool v3 = FBKAttachmentManager.hasFilePromises()();

  return v3;
}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  uint64_t v6 = [(FBKAttachmentManager *)v5 fileCollector];
  [(FBKFileCollector *)v6 addAttachmentWithItemProvider:v4];
}

- (void)addFileFrom:(id)a3 byMoving:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_22A4B24C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A4B2488();
  char v10 = self;
  char v11 = [(FBKAttachmentManager *)v10 fileCollector];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_22A4B2458();
    [(FBKFileCollector *)v12 addFileFromURL:v13 byMoving:v4];

    char v10 = (FBKAttachmentManager *)v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)gatherAttachment:(id)a3 answers:(id)a4
{
  if (a4) {
    uint64_t v6 = (void *)sub_22A4B33F8();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (FBKAttachment *)a3;
  uint64_t v8 = self;
  v10.value._rawValue = v6;
  FBKAttachmentManager.gatherAttachment(_:answers:)(v7, v10);

  swift_bridgeObjectRelease();
}

- (void)gatherFilesWithDedExtension:(id)a3 answers:(id)a4
{
  sub_22A4B33F8();
  id v6 = a3;
  uint64_t v7 = self;
  sub_22A41DDA4(a3);

  swift_bridgeObjectRelease();
}

- (void)attachmentProvider:(id)a3 didFinishLoadingWithAttachments:(id)a4 error:(id)a5
{
  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  sub_22A40F55C(&qword_268376198, (unint64_t *)&unk_268376180);
  uint64_t v8 = sub_22A4B36B8();
  swift_unknownObjectRetain();
  int64_t v9 = self;
  id v10 = a5;
  FBKAttachmentManager.attachmentProvider(_:didFinishLoadingWith:error:)(a3, v8, (uint64_t)a5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)attachmentProvider:(id)a3 didStartAttaching:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  uint64_t v8 = [(FBKAttachmentManager *)v7 delegate];
  if (v8)
  {
    [(FBKAttachmentManagerDelegate *)v8 attachmentManager:v7 didStartAttaching:v6];

    swift_unknownObjectRelease();
  }
  else
  {
  }

  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didFinishAttaching:(id)a4 error:(id)a5
{
  swift_unknownObjectRetain();
  id v13 = a4;
  uint64_t v8 = self;
  id v9 = a5;
  id v10 = [(FBKAttachmentManager *)v8 delegate];
  if (v10)
  {
    char v11 = v10;
    if (v9) {
      uint64_t v12 = (void *)sub_22A4B23D8();
    }
    else {
      uint64_t v12 = 0;
    }
    [(FBKAttachmentManagerDelegate *)v11 attachmentManager:v8 didFinishAttaching:v13 error:v12];

    swift_unknownObjectRelease();
  }
  else
  {
  }
  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didUpdateAttachment:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  sub_22A428978(v6);
  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didAddAttachment:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v7 = self;
  sub_22A41C2C8();
  uint64_t v8 = [(FBKAttachmentManager *)v7 delegate];
  if (v8)
  {
    [(FBKAttachmentManagerDelegate *)v8 attachmentManager:v7 didAddAttachment:v6 atIndex:[(FBKAttachmentManager *)v7 attachmentIndex:v6]];

    swift_unknownObjectRelease();
  }
  else
  {
  }

  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didTakeAttachment:(id)a4 fromOtherProvider:(id)a5
{
  swift_unknownObjectRetain();
  uint64_t v7 = (FBKAttachment *)a4;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  FBKAttachmentManager.removeAttachment(_:)(v7);
  sub_22A41C2C8();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)attachmentProvider:(id)a3 didRemoveAttachment:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  uint64_t v8 = self;
  FBKAttachmentManager.attachmentProvider(_:didRemove:)(a3, v7);
  swift_unknownObjectRelease();
}

@end