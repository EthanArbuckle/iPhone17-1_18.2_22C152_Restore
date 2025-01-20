@interface _XRExpiredPidCache
@end

@implementation _XRExpiredPidCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->signatures, 0);
  objc_storeStrong((id *)&self->pidWatcher, 0);
}

@end