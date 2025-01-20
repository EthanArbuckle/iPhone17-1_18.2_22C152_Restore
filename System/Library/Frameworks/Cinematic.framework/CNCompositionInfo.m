@interface CNCompositionInfo
- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofCinematicAssetInfo:(CNAssetInfo *)assetInfo atTime:(CMTime *)startTime error:(NSError *)outError;
@end

@implementation CNCompositionInfo

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofCinematicAssetInfo:(CNAssetInfo *)assetInfo atTime:(CMTime *)startTime error:(NSError *)outError
{
  v10 = assetInfo;
  v11 = [(CNAssetInfo *)self cinematicVideoTrack];
  v12 = [(CNAssetInfo *)v10 cinematicVideoTrack];
  id v33 = 0;
  long long v13 = *(_OWORD *)&timeRange->start.epoch;
  long long v30 = *(_OWORD *)&timeRange->start.value;
  long long v31 = v13;
  long long v32 = *(_OWORD *)&timeRange->duration.timescale;
  CMTime v29 = *startTime;
  [v11 insertTimeRange:&v30 ofTrack:v12 atTime:&v29 error:&v33];
  v14 = (NSError *)v33;

  if (!v14)
  {
    v16 = [(CNAssetInfo *)self cinematicDisparityTrack];
    v17 = [(CNAssetInfo *)v10 cinematicDisparityTrack];
    id v28 = 0;
    long long v18 = *(_OWORD *)&timeRange->start.epoch;
    long long v30 = *(_OWORD *)&timeRange->start.value;
    long long v31 = v18;
    long long v32 = *(_OWORD *)&timeRange->duration.timescale;
    CMTime v29 = *startTime;
    [v16 insertTimeRange:&v30 ofTrack:v17 atTime:&v29 error:&v28];
    v14 = (NSError *)v28;

    if (!v14)
    {
      v19 = [(CNAssetInfo *)self cinematicMetadataTrack];
      v20 = [(CNAssetInfo *)v10 cinematicMetadataTrack];
      id v27 = 0;
      long long v21 = *(_OWORD *)&timeRange->start.epoch;
      long long v30 = *(_OWORD *)&timeRange->start.value;
      long long v31 = v21;
      long long v32 = *(_OWORD *)&timeRange->duration.timescale;
      CMTime v29 = *startTime;
      [v19 insertTimeRange:&v30 ofTrack:v20 atTime:&v29 error:&v27];
      v14 = (NSError *)v27;

      if (!v14)
      {
        BOOL v15 = 1;
        goto LABEL_9;
      }
      v22 = [(CNAssetInfo *)self cinematicDisparityTrack];
      long long v23 = *(_OWORD *)&timeRange->start.epoch;
      long long v30 = *(_OWORD *)&timeRange->start.value;
      long long v31 = v23;
      long long v32 = *(_OWORD *)&timeRange->duration.timescale;
      [v22 removeTimeRange:&v30];
    }
    v24 = [(CNAssetInfo *)self cinematicVideoTrack];
    long long v25 = *(_OWORD *)&timeRange->start.epoch;
    long long v30 = *(_OWORD *)&timeRange->start.value;
    long long v31 = v25;
    long long v32 = *(_OWORD *)&timeRange->duration.timescale;
    [v24 removeTimeRange:&v30];

    if (outError) {
      goto LABEL_3;
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  if (!outError) {
    goto LABEL_8;
  }
LABEL_3:
  v14 = v14;
  BOOL v15 = 0;
  *outError = v14;
LABEL_9:

  return v15;
}

@end