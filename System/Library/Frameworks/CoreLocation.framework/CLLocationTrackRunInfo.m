@interface CLLocationTrackRunInfo
+ (BOOL)supportsSecureCoding;
- ($A061F3BD9B9106DED7E4D9CCD1ADF33F)lapInfo;
- (CLLocationTrackRunInfo)init;
- (CLLocationTrackRunInfo)initWithCoder:(id)a3;
- (CLLocationTrackRunInfo)initWithLapInfo:(id *)a3 laneNumber:(int64_t)a4 laneCount:(int64_t)a5 trackId:(id)a6 estimatedLaneNumber:(int64_t)a7 estimatedLaneConfidence:(int)a8 trackProximity:(int)a9;
- (NSNumber)trackId;
- (int)estimatedLaneConfidence;
- (int)trackProximity;
- (int64_t)estimatedLaneNumber;
- (int64_t)laneCount;
- (int64_t)laneNumber;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLLocationTrackRunInfo

- (CLLocationTrackRunInfo)init
{
  memset(v4, 0, sizeof(v4));
  LODWORD(v3) = 0;
  return [(CLLocationTrackRunInfo *)self initWithLapInfo:v4 laneNumber:0 laneCount:0 trackId:&unk_1EE023878 estimatedLaneNumber:0 estimatedLaneConfidence:0 trackProximity:v3];
}

- (CLLocationTrackRunInfo)initWithLapInfo:(id *)a3 laneNumber:(int64_t)a4 laneCount:(int64_t)a5 trackId:(id)a6 estimatedLaneNumber:(int64_t)a7 estimatedLaneConfidence:(int)a8 trackProximity:(int)a9
{
  v21.receiver = self;
  v21.super_class = (Class)CLLocationTrackRunInfo;
  v15 = [(CLLocationTrackRunInfo *)&v21 init];
  v16 = v15;
  if (v15)
  {
    *(_OWORD *)&v15->_lapInfo.lapCount = *(_OWORD *)&a3->var0;
    long long v17 = *(_OWORD *)&a3->var2;
    long long v18 = *(_OWORD *)&a3->var4;
    long long v19 = *(_OWORD *)&a3->var7;
    v15->_lapInfo.previousLapPositionAtCompletionInDegrees = ($AB5116BA7E623E054F959CECB034F4E7)a3->var6;
    *(_OWORD *)&v15->_lapInfo.currentTrackRunSessionDurationInSeconds = v19;
    *(_OWORD *)&v15->_lapInfo.currentLapDurationInSeconds = v17;
    *(_OWORD *)&v15->_lapInfo.previousLapDurationInSeconds = v18;
    v15->_laneNumber = a4;
    v15->_laneCount = a5;
    v15->_trackId = (NSNumber *)a6;
    v16->_estimatedLaneNumber = a7;
    v16->_estimatedLaneConfidence = a8;
    v16->_trackProximity = a9;
  }
  return v16;
}

- (void)dealloc
{
  self->_trackId = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationTrackRunInfo;
  [(CLLocationTrackRunInfo *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationTrackRunInfo)initWithCoder:(id)a3
{
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  uint64_t v29 = -1;
  uint64_t v30 = -1;
  uint64_t v27 = -1;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  if ([a3 allowsKeyedCoding])
  {
    LODWORD(v31) = [a3 decodeIntForKey:@"trackRunLapCount"];
    [a3 decodeDoubleForKey:@"trackRunCurrentLapStartTime"];
    *((void *)&v31 + 1) = v5;
    [a3 decodeDoubleForKey:@"trackRunCurrentLapDurationInSeconds"];
    *(void *)&long long v32 = v6;
    [a3 decodeDoubleForKey:@"trackRunCurrentLapDistanceInMeters"];
    *((void *)&v32 + 1) = v7;
    [a3 decodeDoubleForKey:@"trackRunPreviousLapDurationInSeconds"];
    *(void *)&long long v33 = v8;
    [a3 decodeDoubleForKey:@"trackRunPreviousLapDistanceInMeters"];
    *((void *)&v33 + 1) = v9;
    [a3 decodeDoubleForKey:@"trackRunPreviousLapPositionAtCompletionInDegreesLatitude"];
    *(void *)&long long v34 = v10;
    [a3 decodeDoubleForKey:@"trackRunPreviousLapPositionAtCompletionInDegreesLongitude"];
    *((void *)&v34 + 1) = v11;
    [a3 decodeDoubleForKey:@"trackRunCurrentTrackRunSessionDurationInSeconds"];
    *(void *)&long long v35 = v12;
    [a3 decodeDoubleForKey:@"trackRunCurrentTrackRunSessionDistanceInMeters"];
    *((void *)&v35 + 1) = v13;
    int v14 = [a3 decodeIntForKey:@"trackRunLaneNumber"];
    uint64_t v15 = v14;
    uint64_t v30 = v14;
    int v16 = [a3 decodeIntForKey:@"trackRunLaneCount"];
    uint64_t v17 = v16;
    uint64_t v29 = v16;
    uint64_t v18 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"trackRunTrackId"];
    uint64_t v28 = v18;
    int v19 = [a3 decodeIntForKey:@"trackRunEstimatedLaneNumber"];
    uint64_t v20 = v19;
    uint64_t v27 = v19;
    switch([a3 decodeIntForKey:@"trackRunEstimatedLaneConfidence"])
    {
      case 0u:
        HIDWORD(v26) = 0;
        goto LABEL_4;
      case 1u:
LABEL_4:
        HIDWORD(v26) = 1;
        goto LABEL_5;
      case 2u:
LABEL_5:
        HIDWORD(v26) = 2;
        goto LABEL_6;
      case 3u:
LABEL_6:
        HIDWORD(v26) = 3;
        break;
      default:
        break;
    }
    HIDWORD(v26) = 0;
    if ([a3 decodeIntForKey:@"trackRunTrackProximity"] <= 1) {
      LODWORD(v26) = 1;
    }
    int v21 = 0;
    uint64_t v22 = 0;
    LODWORD(v26) = 0;
  }
  else
  {
    [a3 decodeValueOfObjCType:"i" at:&v31];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v31 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v32];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v32 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v33];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v33 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v34];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v34 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v35];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v35 + 8];
    [a3 decodeValueOfObjCType:"i" at:&v30];
    [a3 decodeValueOfObjCType:"i" at:&v29];
    [a3 decodeValueOfObjCType:"@" at:&v28];
    [a3 decodeValueOfObjCType:"i" at:&v27];
    [a3 decodeValueOfObjCType:"i" at:(char *)&v26 + 4];
    [a3 decodeValueOfObjCType:"i" at:&v26];
    uint64_t v17 = v29;
    uint64_t v15 = v30;
    uint64_t v20 = v27;
    uint64_t v18 = v28;
    int v21 = v26;
    uint64_t v22 = HIDWORD(v26);
  }
  v25[2] = v33;
  v25[3] = v34;
  v25[4] = v35;
  v25[0] = v31;
  v25[1] = v32;
  LODWORD(v24) = v21;
  return [(CLLocationTrackRunInfo *)self initWithLapInfo:v25 laneNumber:v15 laneCount:v17 trackId:v18 estimatedLaneNumber:v20 estimatedLaneConfidence:v22 trackProximity:v24];
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt:self->_lapInfo.lapCount forKey:@"trackRunLapCount"];
    [a3 encodeDouble:@"trackRunCurrentLapStartTime" forKey:self->_lapInfo.currentLapStartTime];
    [a3 encodeDouble:@"trackRunCurrentLapDurationInSeconds" forKey:self->_lapInfo.currentLapDurationInSeconds];
    [a3 encodeDouble:@"trackRunCurrentLapDistanceInMeters" forKey:self->_lapInfo.currentLapDistanceInMeters];
    [a3 encodeDouble:@"trackRunPreviousLapDurationInSeconds" forKey:self->_lapInfo.previousLapDurationInSeconds];
    [a3 encodeDouble:@"trackRunPreviousLapDistanceInMeters" forKey:self->_lapInfo.previousLapDistanceInMeters];
    [a3 encodeDouble:@"trackRunPreviousLapPositionAtCompletionInDegreesLatitude" forKey:self->_lapInfo.previousLapPositionAtCompletionInDegrees.latitude];
    [a3 encodeDouble:@"trackRunPreviousLapPositionAtCompletionInDegreesLongitude" forKey:self->_lapInfo.previousLapPositionAtCompletionInDegrees.longitude];
    [a3 encodeDouble:@"trackRunCurrentTrackRunSessionDurationInSeconds" forKey:self->_lapInfo.currentTrackRunSessionDurationInSeconds];
    [a3 encodeDouble:@"trackRunCurrentTrackRunSessionDistanceInMeters" forKey:self->_lapInfo.currentTrackRunSessionDistanceInMeters];
    [a3 encodeInt:LODWORD(self->_laneNumber) forKey:@"trackRunLaneNumber"];
    [a3 encodeInt:LODWORD(self->_laneCount) forKey:@"trackRunLaneCount"];
    [a3 encodeObject:self->_trackId forKey:@"trackRunTrackId"];
    [a3 encodeInt:LODWORD(self->_estimatedLaneNumber) forKey:@"trackRunEstimatedLaneNumber"];
    [a3 encodeInt:self->_estimatedLaneConfidence forKey:@"trackRunEstimatedLaneConfidence"];
    uint64_t trackProximity = self->_trackProximity;
    [a3 encodeInt:trackProximity forKey:@"trackRunTrackProximity"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"i" at:&self->_lapInfo];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.currentLapStartTime];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.currentLapDurationInSeconds];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.currentLapDistanceInMeters];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.previousLapDurationInSeconds];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.previousLapDistanceInMeters];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.previousLapPositionAtCompletionInDegrees];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.previousLapPositionAtCompletionInDegrees.longitude];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.currentTrackRunSessionDurationInSeconds];
    [a3 encodeValueOfObjCType:"d" at:&self->_lapInfo.currentTrackRunSessionDistanceInMeters];
    [a3 encodeValueOfObjCType:"i" at:&self->_laneNumber];
    [a3 encodeValueOfObjCType:"i" at:&self->_laneCount];
    [a3 encodeValueOfObjCType:"@" at:&self->_trackId];
    [a3 encodeValueOfObjCType:"i" at:&self->_estimatedLaneNumber];
    [a3 encodeValueOfObjCType:"i" at:&self->_estimatedLaneConfidence];
    [a3 encodeValueOfObjCType:"i" at:&self->_trackProximity];
  }
}

- ($A061F3BD9B9106DED7E4D9CCD1ADF33F)lapInfo
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var2;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  retstr->var6 = v3;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var4;
  long long v4 = *(_OWORD *)&self->var7;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var0 = self->var6;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (int64_t)laneNumber
{
  return self->_laneNumber;
}

- (int64_t)laneCount
{
  return self->_laneCount;
}

- (NSNumber)trackId
{
  return self->_trackId;
}

- (int64_t)estimatedLaneNumber
{
  return self->_estimatedLaneNumber;
}

- (int)estimatedLaneConfidence
{
  return self->_estimatedLaneConfidence;
}

- (int)trackProximity
{
  return self->_trackProximity;
}

@end