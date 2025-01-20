@interface MIOTimePair
+ (id)alignedPTSTimeStamps:(id)a3 withSampleTimes:(id)a4;
+ (id)timePairWithPts:(id *)a3 originalTime:(id *)a4;
+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAsset:(id)a5 error:(id *)a6;
+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAssetURL:(id)a5 error:(id *)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts;
- (BOOL)isPTSEqualOrCloseToTime:(id *)a3;
- (BOOL)isPTSEqualOrCloseToTime:(id *)a3 tolerance:(id *)a4;
- (MIOTimePair)init;
- (MIOTimePair)initWithPts:(id *)a3 originalTime:(id *)a4;
- (id)copyWithNewPts:(id *)a3;
- (id)description;
- (void)setOriginalTime:(id *)a3;
- (void)setPts:(id *)a3;
@end

@implementation MIOTimePair

+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAssetURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x263EFA470] assetWithURL:v10];
  if (v11)
  {
    v12 = +[MIOTimePair timePairsForStream:v9 mediaType:a4 inAsset:v11 error:a6];
  }
  else
  {
    v13 = [NSString stringWithFormat:@"Cannot create asset from URL '%@'.", v10];
    [MEMORY[0x263F087E8] populateReaderError:a6 message:v13 code:5];

    v12 = 0;
  }

  return v12;
}

+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAsset:(id)a5 error:(id *)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v39 = a5;
  id v9 = +[MIOMediaTypeUtility matchingAVMediaTypeFromMIOMediaType:a4];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = [v39 tracksWithMediaType:v9];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (!v11)
  {

LABEL_31:
    v38 = [NSString stringWithFormat:@"Cannot find track for stream '%@'.", v8];
    objc_msgSend(MEMORY[0x263F087E8], "populateReaderError:message:code:", a6);
    v12 = 0;
    id v27 = 0;
    goto LABEL_42;
  }
  v12 = 0;
  uint64_t v13 = *(void *)v52;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v52 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      if (+[MIOMovieMetadataUtility isTrack:v15 forStreamId:v8 mediaType:v9])
      {
        id v16 = v15;

        v12 = v16;
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v11);

  if (!v12) {
    goto LABEL_31;
  }
  v38 = +[MIOMovieMetadataUtility attachmentsTrackInAsset:v39 forTrack:v12];
  if (v38)
  {
    v36 = (void *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v38 outputSettings:0];
    v17 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v39 error:a6];
    v34 = v17;
    if (v17)
    {
      if ([v17 canAddOutput:v36])
      {
        [v34 addOutput:v36];
        v29 = (void *)[objc_alloc(MEMORY[0x263EFA4D0]) initWithAssetReaderTrackOutput:v36];
        if ([v34 startReading])
        {
          v31 = objc_opt_new();
          for (j = 0; ; j = v33)
          {
            v33 = [v29 nextTimedMetadataGroup];

            if (!v33) {
              break;
            }
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id obj = [v33 items];
            uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v48;
              while (2)
              {
                for (uint64_t k = 0; k != v19; ++k)
                {
                  if (*(void *)v48 != v20) {
                    objc_enumerationMutation(obj);
                  }
                  v22 = [*(id *)(*((void *)&v47 + 1) + 8 * k) value];
                  v23 = +[MOVStreamIOUtility plistDeserializedObject:v22 error:a6];
                  if (!v23)
                  {

                    id v27 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    CFDictionaryRef v24 = [v23 valueForKey:@"OriginalTimestampWhenWrittenToFile"];
                    CFDictionaryRef v25 = v24;
                    if (v24)
                    {
                      memset(&v46, 0, sizeof(v46));
                      CMTimeMakeFromDictionary(&v46, v24);
                      [v33 timeRange];
                      long long v44 = v42;
                      uint64_t v45 = v43;
                      CMTime v41 = v46;
                      v26 = +[MIOTimePair timePairWithPts:&v44 originalTime:&v41];
                      [v31 addObject:v26];
                    }
                  }
                }
                uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
          }
          id v27 = v31;
LABEL_37:
        }
        else
        {
          v32 = [NSString stringWithFormat:@"Cannot start reading data for stream '%@'.", v8];
          objc_msgSend(MEMORY[0x263F087E8], "populateReaderError:message:code:", a6);
          id v27 = 0;
        }
      }
      else
      {
        v30 = [NSString stringWithFormat:@"Cannot add output to associated metadata track for stream '%@'.", v8];
        objc_msgSend(MEMORY[0x263F087E8], "populateReaderError:message:code:", a6);
        id v27 = 0;
      }
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    v37 = [NSString stringWithFormat:@"Cannot find attachments track for stream '%@'.", v8];
    objc_msgSend(MEMORY[0x263F087E8], "populateReaderError:message:code:", a6);
    id v27 = 0;
  }
LABEL_42:

  return v27;
}

+ (id)alignedPTSTimeStamps:(id)a3 withSampleTimes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263EFF980];
  id v8 = [v6 times];
  id v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  unint64_t v10 = 0;
  unint64_t v11 = 0;
  while ([v6 count] > v10)
  {
    memset(&v42[1], 0, sizeof(CMTime));
    if (v6) {
      [v6 timeAtIndex:v10];
    }
    if (v11 >= [v5 count])
    {
      v42[0] = v42[1];
      long long v40 = *MEMORY[0x263F01098];
      uint64_t v41 = *(void *)(MEMORY[0x263F01098] + 16);
      v12 = +[MIOTimePair timePairWithPts:v42 originalTime:&v40];
      [v9 addObject:v12];
    }
    uint64_t v13 = [v5 objectAtIndex:v11];
    CMTime v39 = v42[1];
    if ([v13 isPTSEqualOrCloseToTime:&v39])
    {
      CMTime v38 = v42[1];
      v14 = (void *)[v13 copyWithNewPts:&v38];
      [v9 addObject:v14];

      unint64_t v15 = v11 + 1;
    }
    else
    {
      if (v13) {
        [v13 pts];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = v42[1];
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        unint64_t v15 = v11 + 1;
        unint64_t v17 = v11 + 1;
        while (1)
        {
          if (v17 >= [v5 count])
          {
            CMTime v28 = v42[1];
            long long v26 = *MEMORY[0x263F01098];
            uint64_t v27 = *(void *)(MEMORY[0x263F01098] + 16);
            uint64_t v20 = +[MIOTimePair timePairWithPts:&v28 originalTime:&v26];
            [v9 addObject:v20];

            goto LABEL_25;
          }
          v18 = [v5 objectAtIndex:v17];

          CMTime v35 = v42[1];
          if ([v18 isPTSEqualOrCloseToTime:&v35]) {
            break;
          }
          if (v18) {
            [v18 pts];
          }
          else {
            memset(&v33, 0, sizeof(v33));
          }
          CMTime v32 = v42[1];
          ++v17;
          uint64_t v13 = v18;
          if (CMTimeCompare(&v33, &v32) >= 1)
          {
            CMTime v31 = v42[1];
            long long v29 = *MEMORY[0x263F01098];
            uint64_t v30 = *(void *)(MEMORY[0x263F01098] + 16);
            uint64_t v19 = +[MIOTimePair timePairWithPts:&v31 originalTime:&v29];
            [v9 addObject:v19];

            goto LABEL_24;
          }
        }
        CMTime v34 = v42[1];
        v21 = (void *)[v18 copyWithNewPts:&v34];
        [v9 addObject:v21];

        unint64_t v15 = v11 + 2;
LABEL_24:
        uint64_t v13 = v18;
      }
      else
      {
        CMTime v25 = v42[1];
        long long v23 = *MEMORY[0x263F01098];
        uint64_t v24 = *(void *)(MEMORY[0x263F01098] + 16);
        id v16 = +[MIOTimePair timePairWithPts:&v25 originalTime:&v23];
        [v9 addObject:v16];

        unint64_t v15 = v11;
      }
    }
LABEL_25:

    ++v10;
    unint64_t v11 = v15;
  }

  return v9;
}

+ (id)timePairWithPts:(id *)a3 originalTime:(id *)a4
{
  id v6 = [MIOTimePair alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  v7 = [(MIOTimePair *)v6 initWithPts:&v10 originalTime:&v9];

  return v7;
}

- (MIOTimePair)init
{
  v10.receiver = self;
  v10.super_class = (Class)MIOTimePair;
  v2 = [(MIOTimePair *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = (long long *)MEMORY[0x263F01098];
    long long v8 = *MEMORY[0x263F01098];
    uint64_t v9 = *(void *)(MEMORY[0x263F01098] + 16);
    [(MIOTimePair *)v2 setPts:&v8];
    long long v6 = *v4;
    uint64_t v7 = *((void *)v4 + 2);
    [(MIOTimePair *)v3 setOriginalTime:&v6];
  }
  return v3;
}

- (MIOTimePair)initWithPts:(id *)a3 originalTime:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MIOTimePair;
  long long v6 = [(MIOTimePair *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    long long v11 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(MIOTimePair *)v6 setPts:&v11];
    long long v9 = *(_OWORD *)&a4->var0;
    int64_t v10 = a4->var3;
    [(MIOTimePair *)v7 setOriginalTime:&v9];
  }
  return v7;
}

- (BOOL)isPTSEqualOrCloseToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  CMTimeMakeWithSeconds(&v5, 0.000003, 100000000);
  return [(MIOTimePair *)self isPTSEqualOrCloseToTime:&v6 tolerance:&v5];
}

- (BOOL)isPTSEqualOrCloseToTime:(id *)a3 tolerance:(id *)a4
{
  if ((a3->var2 & 1) == 0) {
    return 0;
  }
  [(MIOTimePair *)self pts];
  if ((v13.flags & 1) == 0) {
    return 0;
  }
  memset(&v13, 0, sizeof(v13));
  CMTime lhs = (CMTime)*a3;
  [(MIOTimePair *)self pts];
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v13, &time);
  CMTime time1 = v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  return CMTimeCompare(&time1, (CMTime *)&v8) < 1;
}

- (id)description
{
  v3 = NSString;
  [(MIOTimePair *)self pts];
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(MIOTimePair *)self originalTime];
  CMTime v5 = objc_msgSend(v3, "stringWithFormat:", @"%f [Orig: %f]", *(void *)&Seconds, CMTimeGetSeconds(&v7));

  return v5;
}

- (id)copyWithNewPts:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(MIOTimePair *)self originalTime];
  +[MIOTimePair timePairWithPts:&v5 originalTime:v4];
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  objc_copyStruct(retstr, &self->_pts, 24, 1, 0);
  return result;
}

- (void)setPts:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalTime
{
  objc_copyStruct(retstr, &self->_originalTime, 24, 1, 0);
  return result;
}

- (void)setOriginalTime:(id *)a3
{
}

@end