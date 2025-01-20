@interface SharingOptionsViewFactory
+ (id)createCollaborationShareOptionsView:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6;
+ (id)createSharingOptionsView:(id)a3 userDidChangeOption:(id)a4;
- (_TtC14CloudSharingUI25SharingOptionsViewFactory)init;
@end

@implementation SharingOptionsViewFactory

+ (id)createCollaborationShareOptionsView:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6
{
  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a3;
  v13 = (void *)_s14CloudSharingUI0B18OptionsViewFactoryC024createCollaborationSharedE0_13layoutMargins19userDidChangeOption011contentSizemN0AA32HostingControllerAndModelUpdatesCSo016_SWCollaborationiD0CSg_So23NSDirectionalEdgeInsetsVySS_SSSbALtcySo6CGSizeVctFZ_0(a3, (uint64_t)sub_2180CCB4C, v10, (uint64_t)sub_2180CCB54, v11);

  swift_release();
  swift_release();

  return v13;
}

+ (id)createSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  v4 = _Block_copy(a4);
  sub_2180CCB04();
  uint64_t v5 = sub_2180CFEA0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  id v7 = _s14CloudSharingUI0B18OptionsViewFactoryC06createbdE0_19userDidChangeOptionAA32HostingControllerAndModelUpdatesCSaySo016_SWCollaborationD5GroupCG_ySS_SSSbAJtctFZ_0(v5, (uint64_t)sub_2180CCB44, v6);
  swift_bridgeObjectRelease();
  swift_release();

  return v7;
}

- (_TtC14CloudSharingUI25SharingOptionsViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharingOptionsViewFactory();
  return [(SharingOptionsViewFactory *)&v3 init];
}

@end