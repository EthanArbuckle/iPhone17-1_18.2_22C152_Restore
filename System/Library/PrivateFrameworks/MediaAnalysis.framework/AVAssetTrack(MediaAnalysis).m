@interface AVAssetTrack(MediaAnalysis)
- (CMTime)vcp_endTime;
- (double)vcp_cleanApertureRect;
- (double)vcp_fullFrameSize;
- (double)vcp_startTime;
- (uint64_t)vcp_imageOrientation;
- (uint64_t)vcp_orientation;
- (uint64_t)vcp_sampleCountForTimeRange:()MediaAnalysis;
@end

@implementation AVAssetTrack(MediaAnalysis)

- (double)vcp_startTime
{
  [a1 timeRange];
  double result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(void *)(a2 + 16) = v5;
  return result;
}

- (CMTime)vcp_endTime
{
  [a1 timeRange];
  return CMTimeRangeGetEnd(a2, &v4);
}

- (uint64_t)vcp_orientation
{
  [a1 naturalSize];
  double v3 = v2;
  double v5 = v4;
  [a1 preferredTransform];
  unsigned int v6 = orientationForTransform(&v9) - 1;
  if (v3 < v5) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = 3;
  }
  if (v6 <= 6)
  {
    v8 = &unk_1BC2837C0;
    if (v3 < v5) {
      v8 = &unk_1BC2837F8;
    }
    return v8[v6];
  }
  return result;
}

- (uint64_t)vcp_imageOrientation
{
  [a1 preferredTransform];
  int v1 = angleForTransform(v6);
  switch(v1)
  {
    case 90:
      return 6;
    case 270:
      return 8;
    case 180:
      return 3;
  }
  HIDWORD(v3) = -1527099483 * v1 + 47721858;
  LODWORD(v3) = HIDWORD(v3);
  if ((v3 >> 1) >= 0x2D82D83 && (int)MediaAnalysisLogLevel() >= 4)
  {
    double v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "Video track rotation angle is not multiple of 90", v5, 2u);
    }
  }
  return 1;
}

- (double)vcp_fullFrameSize
{
  int v1 = [a1 formatDescriptions];
  if ([v1 count])
  {
    double v2 = [v1 objectAtIndexedSubscript:0];

    *(void *)&double v3 = *(_OWORD *)&CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v2, 0, 0);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
  }

  return v3;
}

- (double)vcp_cleanApertureRect
{
  int v1 = [a1 formatDescriptions];
  if ([v1 count])
  {
    double v2 = [v1 objectAtIndexedSubscript:0];

    *(void *)&double v3 = (unint64_t)CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v2, 1u);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
  }

  return v3;
}

- (uint64_t)vcp_sampleCountForTimeRange:()MediaAnalysis
{
  long long v5 = a3[1];
  *(_OWORD *)&range1.start.value = *a3;
  *(_OWORD *)&range1.start.epoch = v5;
  *(_OWORD *)&range1.duration.timescale = a3[2];
  [a1 timeRange];
  if (CMTimeRangeEqual(&range1, &range2))
  {
    unsigned int v6 = [a1 makeSampleCursorAtFirstSampleInDecodeOrder];
    uint64_t v7 = [v6 stepInPresentationOrderByCount:0x7FFFFFFFFFFFFFFFLL] + 1;
  }
  else
  {
    memset(&v14, 0, sizeof(v14));
    long long v8 = a3[1];
    *(_OWORD *)&range.start.value = *a3;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = a3[2];
    CMTimeRangeGetEnd(&v14, &range);
    long long v11 = *a3;
    uint64_t v12 = *((void *)a3 + 2);
    unsigned int v6 = [a1 makeSampleCursorWithPresentationTimeStamp:&v11];
    uint64_t v7 = 0;
    do
    {
      if (v6) {
        [v6 presentationTimeStamp];
      }
      else {
        memset(&v10, 0, sizeof(v10));
      }
      CMTime time1 = v10;
      CMTime time2 = v14;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
        break;
      }
      ++v7;
    }
    while ([v6 stepInPresentationOrderByCount:1] >= 1);
  }

  return v7;
}

@end