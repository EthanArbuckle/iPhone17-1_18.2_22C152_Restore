@interface PFVideoAVObjectBuilder(CMTimerange)
- (CMTimeRange)vcp_convertToOriginalTimerangeFromScaledTimerange:()CMTimerange;
@end

@implementation PFVideoAVObjectBuilder(CMTimerange)

- (CMTimeRange)vcp_convertToOriginalTimerangeFromScaledTimerange:()CMTimerange
{
  memset(&v14, 0, sizeof(v14));
  long long v6 = a2[1];
  *(_OWORD *)&range.start.value = *a2;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = a2[2];
  CMTimeRangeGetEnd(&v14, &range);
  long long v10 = *a2;
  uint64_t v11 = *((void *)a2 + 2);
  [a1 convertToOriginalTimeFromScaledTime:&v10 forExport:1];
  CMTime v8 = v14;
  [a1 convertToOriginalTimeFromScaledTime:&v8 forExport:1];
  return CMTimeRangeFromTimeToTime(a3, &start, &end);
}

@end