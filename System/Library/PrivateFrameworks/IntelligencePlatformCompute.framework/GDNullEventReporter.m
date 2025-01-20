@interface GDNullEventReporter
- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
@end

@implementation GDNullEventReporter

- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, "NullEventReporter: streamUpdated: %s dropped");
}

- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, "NullEventReporter: streamPruned: %s dropped");
}

- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, "NullEventReporter: streamDeletion: %s dropped");
}

@end