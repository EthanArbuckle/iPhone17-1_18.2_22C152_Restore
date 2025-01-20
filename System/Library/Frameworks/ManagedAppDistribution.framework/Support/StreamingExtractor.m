@interface StreamingExtractor
- (_TtC28ManagedAppDistributionDaemon18StreamingExtractor)init;
@end

@implementation StreamingExtractor

- (_TtC28ManagedAppDistributionDaemon18StreamingExtractor)init
{
  result = (_TtC28ManagedAppDistributionDaemon18StreamingExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC28ManagedAppDistributionDaemon18StreamingExtractor_coordinatorID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon18StreamingExtractor_extractor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon18StreamingExtractor_extractorQueue));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28ManagedAppDistributionDaemon18StreamingExtractor_logKey);
}

@end