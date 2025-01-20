@interface NotesDigitalSeparationSource
- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4;
- (NSString)name;
- (_TtC13DSNotesPlugin28NotesDigitalSeparationSource)init;
- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4;
- (id)backgroundContextForCloudContext:(id)a3;
- (id)backgroundContextForCollaborationController:(id)a3;
- (id)cloudContextForCollaborationController:(id)a3;
- (id)persistentStoreCoordinatorForCloudContext:(id)a3;
- (id)viewContextForCloudContext:(id)a3;
- (id)viewContextForCollaborationController:(id)a3;
- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5;
- (void)collaborationController:(id)a3 fetchShareMetadataWithURLs:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4;
@end

@implementation NotesDigitalSeparationSource

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_name));
}

- (_TtC13DSNotesPlugin28NotesDigitalSeparationSource)init
{
  return (_TtC13DSNotesPlugin28NotesDigitalSeparationSource *)sub_3028();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  [v4 clearSharedContext];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(NotesDigitalSeparationSource *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_viewContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController));
  v3 = (char *)self + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_delegate;

  sub_E1B8((uint64_t)v3);
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  objc_super v6 = self;
  sub_7890((void (*)(void *, uint64_t))sub_DEFC, v5);

  swift_release();
}

- (void)stopSharing:(DSSharedResource *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_D2D0(&qword_1DCC0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_129A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1DE58;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1DE60;
  v14[5] = v13;
  swift_unknownObjectRetain();
  v15 = self;
  sub_B898((uint64_t)v9, (uint64_t)&unk_1DE68, (uint64_t)v14);
  swift_release();
}

- (void)stopSharingWithParticipant:(DSParticipation *)a3 completion:(id)a4
{
  uint64_t v7 = sub_D2D0(&qword_1DCC0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_129A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1DE28;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1DE30;
  v14[5] = v13;
  swift_unknownObjectRetain();
  v15 = self;
  sub_B898((uint64_t)v9, (uint64_t)&unk_1DE38, (uint64_t)v14);
  swift_release();
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  uint64_t v5 = sub_D2D0(&qword_1DCC0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_129A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1DCD0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1DCE0;
  v12[5] = v11;
  v13 = self;
  sub_B898((uint64_t)v7, (uint64_t)&unk_1DCF0, (uint64_t)v12);
  swift_release();
}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  uint64_t v8 = sub_128E8();
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_CFBC(v12, v8, v10);

  swift_bridgeObjectRelease();
}

- (id)accountIDsForCloudContext:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_D0D0(v7);

  v9.super.isa = sub_12928().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)persistentStoreCoordinatorForCloudContext:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = [v5 sharedContext];
  if (!v8
    || (NSArray v9 = v8,
        id v10 = [v8 persistentStoreCoordinator],
        v9,
        !v10))
  {
    id v10 = [objc_allocWithZone((Class)NSPersistentStoreCoordinator) init];
  }

  return v10;
}

- (id)viewContextForCloudContext:(id)a3
{
  return sub_AC58(self, (uint64_t)a2, a3, (SEL *)&selRef_managedObjectContext, 2);
}

- (id)backgroundContextForCloudContext:(id)a3
{
  return sub_AC58(self, (uint64_t)a2, a3, (SEL *)&selRef_workerManagedObjectContext, 1);
}

- (BOOL)cloudContext:(id)a3 hasContextOptions:(unint64_t)a4
{
  id v7 = self;
  id v8 = (_TtC13DSNotesPlugin28NotesDigitalSeparationSource *)a3;
  NSArray v9 = self;
  id v10 = (_TtC13DSNotesPlugin28NotesDigitalSeparationSource *)[v7 sharedContext];
  if (v10)
  {
    id v11 = v10;
    unsigned __int8 v12 = [(NotesDigitalSeparationSource *)v10 hasContextOptions:a4];

    id v8 = v9;
    NSArray v9 = v11;
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)cloudContextForCollaborationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext));
}

- (id)viewContextForCollaborationController:(id)a3
{
  return sub_AEEC(self, (uint64_t)a2, a3, (SEL *)&selRef_managedObjectContext);
}

- (id)backgroundContextForCollaborationController:(id)a3
{
  return sub_AEEC(self, (uint64_t)a2, a3, (SEL *)&selRef_workerManagedObjectContext);
}

- (void)collaborationController:(id)a3 fetchShareMetadataWithURLs:(id)a4 completion:(id)a5
{
  uint64_t v5 = _Block_copy(a5);

  _Block_release(v5);
}

@end