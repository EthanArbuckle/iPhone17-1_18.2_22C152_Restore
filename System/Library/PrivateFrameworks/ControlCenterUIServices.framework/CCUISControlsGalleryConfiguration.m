@interface CCUISControlsGalleryConfiguration
- (CCUISControlsGalleryConfiguration)init;
- (NSArray)allowedControlSizes;
- (NSArray)disallowedControlIdentities;
- (NSArray)disallowedExtensionIdentities;
- (NSArray)suggestedControls;
- (id)copyWithZone:(void *)a3;
- (void)setAllowedControlSizes:(id)a3;
- (void)setDisallowedControlIdentities:(id)a3;
- (void)setDisallowedExtensionIdentities:(id)a3;
- (void)setSuggestedControls:(id)a3;
@end

@implementation CCUISControlsGalleryConfiguration

- (NSArray)allowedControlSizes
{
  return (NSArray *)sub_24A7CF568((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes, &qword_2697BDCB0);
}

- (void)setAllowedControlSizes:(id)a3
{
}

- (NSArray)disallowedControlIdentities
{
  return (NSArray *)sub_24A7CF568((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities, (unint64_t *)&unk_2697BDF00);
}

- (void)setDisallowedControlIdentities:(id)a3
{
}

- (NSArray)disallowedExtensionIdentities
{
  return (NSArray *)sub_24A7CF690((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities, MEMORY[0x263F31DB0]);
}

- (void)setDisallowedExtensionIdentities:(id)a3
{
}

- (NSArray)suggestedControls
{
  return (NSArray *)sub_24A7CF690((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls, (void (*)(void))type metadata accessor for CCUISConfiguredControl);
}

- (void)setSuggestedControls:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_24A7CF7D4(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_24A7DCD70();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CCUISControlsGalleryConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls) = 0;
  v3.receiver = self;
  v3.super_class = (Class)CCUISControlsGalleryConfiguration;
  return [(CCUISControlsGalleryConfiguration *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end