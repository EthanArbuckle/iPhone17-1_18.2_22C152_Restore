@interface MPModelLibraryRequest(MPCModelPlaybackAdditions)
- (__CFString)rtcReportingPlayQueueSourceIdentifier;
@end

@implementation MPModelLibraryRequest(MPCModelPlaybackAdditions)

- (__CFString)rtcReportingPlayQueueSourceIdentifier
{
  return @"queue-source.library";
}

@end