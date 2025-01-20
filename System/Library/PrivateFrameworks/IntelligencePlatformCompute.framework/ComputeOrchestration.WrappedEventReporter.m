@interface ComputeOrchestration.WrappedEventReporter
- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5;
@end

@implementation ComputeOrchestration.WrappedEventReporter

- (BOOL)streamUpdatedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (SEL *)&selRef_streamUpdatedWithStreamIdentifier_remoteName_error_);
}

- (BOOL)streamPrunedWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (SEL *)&selRef_streamPrunedWithStreamIdentifier_remoteName_error_);
}

- (BOOL)streamDeletionWithStreamIdentifier:(id)a3 remoteName:(id)a4 error:(id *)a5
{
  return @objc ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (SEL *)&selRef_streamDeletionWithStreamIdentifier_remoteName_error_);
}

@end