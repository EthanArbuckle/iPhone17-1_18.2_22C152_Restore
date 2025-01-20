@interface MPModelStaticRequest(MPCModelPlaybackAdditions)
- (__CFString)rtcReportingPlayQueueSourceIdentifier;
@end

@implementation MPModelStaticRequest(MPCModelPlaybackAdditions)

- (__CFString)rtcReportingPlayQueueSourceIdentifier
{
  return @"queue-source.catalog";
}

@end