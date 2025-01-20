@interface ComputeOrchestration.EventReporter
- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
@end

@implementation ComputeOrchestration.EventReporter

- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, 0);
}

- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, 1);
}

- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, 0);
}

@end