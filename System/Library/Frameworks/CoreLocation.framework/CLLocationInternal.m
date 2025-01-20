@interface CLLocationInternal
- (CLLocationInternal)initWithClientLocation:(id *)a3;
- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4;
- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5;
- (CLLocationInternal)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4;
- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6;
- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16;
- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation CLLocationInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationInternal;
  [(CLLocationInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->fLocation.coordinate.longitude;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&self->fLocation.suitability;
  *(_OWORD *)(v4 + 24) = v5;
  long long v6 = *(_OWORD *)&self->fLocation.speed;
  long long v7 = *(_OWORD *)&self->fLocation.course;
  long long v8 = *(_OWORD *)&self->fLocation.timestamp;
  *(_OWORD *)(v4 + 40) = *(_OWORD *)&self->fLocation.altitude;
  *(_OWORD *)(v4 + 88) = v8;
  *(_OWORD *)(v4 + 72) = v7;
  *(_OWORD *)(v4 + 56) = v6;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = self->fLocation.rawCoordinate;
  long long v10 = *(_OWORD *)&self->fLocation.rawCourse;
  long long v11 = *(_OWORD *)&self->fLocation.integrity;
  *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->fLocation.lifespan;
  *(_OWORD *)(v4 + 148) = v11;
  *(_OWORD *)(v4 + 136) = v10;
  *($AB5116BA7E623E054F959CECB034F4E7 *)(v4 + 120) = rawCoordinate;
  *(void *)(v4 + 168) = [*(id *)&self->fLocation.ellipsoidalAltitude copy];
  *(void *)(v4 + 176) = [*(id *)&self->fLocation.fromSimulationController copy];
  *(void *)(v4 + 184) = self->fMatchInfo;
  *(void *)(v4 + 192) = [(_CLLocationGroundAltitude *)self->fGroundAltitude copy];
  *(void *)(v4 + 200) = [*(id *)&self->fTrustedTimestamp copy];
  *(void *)(v4 + 208) = [(NSData *)self->fCoarseMetaData copy];
  *(void *)(v4 + 216) = self->fFusionInfo;
  *(void *)(v4 + 224) = self->fTrackRunInfo;
  *(double *)(v4 + 232) = self->fRawHorizontalAccuracy;
  *(double *)(v4 + 240) = self->fRawAltitude;
  *(_DWORD *)(v4 + 248) = LODWORD(self->fRawVerticalAccuracy);
  *(double *)(v4 + 256) = self->fRawCourseAccuracy;
  *(void *)(v4 + 264) = *(void *)&self->fPositionContextState;
  *(void *)(v4 + 272) = [*(id *)&self->fProbabilityPositionContextStateIndoor copy];
  return (id)v4;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6
{
  double v6 = *(double *)((char *)&a3->var1.var1 + 4);
  double v7 = *(double *)((char *)&a3->var2 + 4);
  double v8 = *(double *)((char *)&a3->var3 + 4);
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  long long v10 = *(_OWORD *)&a3->var14;
  long long v11 = *(_OWORD *)&a3->var9;
  v16[6] = *(_OWORD *)&a3->var11;
  v16[7] = var13;
  v17[0] = v10;
  *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)&a3->var16;
  long long v12 = *(_OWORD *)&a3->var5;
  long long v13 = *(_OWORD *)&a3->var7;
  v16[2] = *(_OWORD *)&a3->var3;
  v16[3] = v12;
  var13.var0 = *(double *)((char *)&a3->var7 + 4);
  v16[4] = v13;
  v16[5] = v11;
  long long v14 = *(_OWORD *)&a3->var1.var1;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v14;
  return [(CLLocationInternal *)self initWithClientLocation:v16 matchInfo:a4 trustedTimestamp:a6 groundAltitude:0 fusionInfo:0 trackRunInfo:0 rawHorizontalAccuracy:a5 rawAltitude:v6 rawVerticalAccuracy:v7 rawCourseAccuracy:v8 positionContextStateType:var13.var0 probabilityPositionContextStateIndoor:0.0 probabilityPositionContextStateOutdoor:0.0 gnssOdometerInfo:0];
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v21[6] = *(_OWORD *)&a3->var11;
  v21[7] = var13;
  v22[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)&a3->var16;
  long long v17 = *(_OWORD *)&a3->var5;
  v21[2] = *(_OWORD *)&a3->var3;
  v21[3] = v17;
  long long v18 = *(_OWORD *)&a3->var9;
  v21[4] = *(_OWORD *)&a3->var7;
  v21[5] = v18;
  long long v19 = *(_OWORD *)&a3->var1.var1;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v19;
  return [(CLLocationInternal *)self initWithClientLocation:v21 matchInfo:a4 trustedTimestamp:a6 groundAltitude:a7 fusionInfo:a8 trackRunInfo:*(void *)&a13 rawHorizontalAccuracy:a5 rawAltitude:a9 rawVerticalAccuracy:a10 rawCourseAccuracy:a11 positionContextStateType:a12 probabilityPositionContextStateIndoor:a14 probabilityPositionContextStateOutdoor:a15 gnssOdometerInfo:a16 coarseMetaData:0];
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v35[6] = *(_OWORD *)&a3->var11;
  v35[7] = var13;
  v36[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)&a3->var16;
  long long v30 = *(_OWORD *)&a3->var5;
  v35[2] = *(_OWORD *)&a3->var3;
  v35[3] = v30;
  long long v31 = *(_OWORD *)&a3->var9;
  v35[4] = *(_OWORD *)&a3->var7;
  v35[5] = v31;
  long long v32 = *(_OWORD *)&a3->var1.var1;
  v35[0] = *(_OWORD *)&a3->var0;
  v35[1] = v32;
  v33 = [(CLLocationInternal *)self initWithClientLocation:v35];
  if (v33)
  {
    *(void *)&v33->fLocation.ellipsoidalAltitude = a4;
    *(void *)&v33->fLocation.fromSimulationController = a6;
    *(double *)&v33->fMatchInfo = a5;
    *(void *)&v33->fTrustedTimestamp = a7;
    v33->fCoarseMetaData = (NSData *)a8;
    *(double *)&v33->fFusionInfo = a9;
    *(double *)&v33->fTrackRunInfo = a10;
    v33->fRawHorizontalAccuracy = a11;
    v33->fRawAltitude = a12;
    v33->fGroundAltitude = (_CLLocationGroundAltitude *)[a17 copy];
    LODWORD(v33->fRawVerticalAccuracy) = a13;
    v33->fRawCourseAccuracy = a14;
    *(double *)&v33->fPositionContextState = a15;
    *(void *)&v33->fProbabilityPositionContextStateIndoor = a16;
  }
  return v33;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v11[6] = *(_OWORD *)&a3->var11;
  v11[7] = var13;
  v12[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)&a3->var16;
  long long v6 = *(_OWORD *)&a3->var5;
  v11[2] = *(_OWORD *)&a3->var3;
  v11[3] = v6;
  long long v7 = *(_OWORD *)&a3->var9;
  v11[4] = *(_OWORD *)&a3->var7;
  v11[5] = v7;
  long long v8 = *(_OWORD *)&a3->var1.var1;
  v11[0] = *(_OWORD *)&a3->var0;
  v11[1] = v8;
  v9 = [(CLLocationInternal *)self initWithClientLocation:v11];
  if (v9) {
    v9->fGroundAltitude = (_CLLocationGroundAltitude *)a4;
  }
  return v9;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLLocationInternal;
  result = [(CLLocationInternal *)&v12 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->fLocation.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->fLocation.suitability = v5;
    long long v6 = *(_OWORD *)&a3->var3;
    long long v7 = *(_OWORD *)&a3->var5;
    long long v8 = *(_OWORD *)&a3->var7;
    *(_OWORD *)&result->fLocation.timestamp = *(_OWORD *)&a3->var9;
    *(_OWORD *)&result->fLocation.course = v8;
    *(_OWORD *)&result->fLocation.speed = v7;
    *(_OWORD *)&result->fLocation.altitude = v6;
    long long v9 = *(_OWORD *)&a3->var11;
    $AB5116BA7E623E054F959CECB034F4E7 var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
    long long v11 = *(_OWORD *)&a3->var14;
    *(_OWORD *)&result->fLocation.integrity = *(_OWORD *)&a3->var16;
    *(_OWORD *)&result->fLocation.rawCourse = v11;
    result->fLocation.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = var13;
    *(_OWORD *)&result->fLocation.lifespan = v9;
    result->fLocation.ellipsoidalAltitude = 0.0;
    *(void *)&result->fLocation.fromSimulationController = 0;
    result->fTrustedTimestamp = 0.0;
    result->fCoarseMetaData = 0;
    result->fMatchInfo = (CLLocationMatchInfo *)0xBFF0000000000000;
    result->fGroundAltitude = 0;
    result->fFusionInfo = *(_CLLocationFusionInfo **)((char *)&a3->var1.var1 + 4);
    result->fTrackRunInfo = *(CLLocationTrackRunInfo **)((char *)&a3->var2 + 4);
    result->fRawHorizontalAccuracy = *(double *)((char *)&a3->var3 + 4);
    result->fRawAltitude = *(double *)((char *)&a3->var7 + 4);
    result->fProbabilityPositionContextStateIndoor = 0.0;
  }
  return result;
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4
{
  long long v7 = -[CLLocationMatchInfo initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:]([CLLocationMatchInfo alloc], "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", a4->var9, a4->var12, a4->var13, a4->var14, [MEMORY[0x1E4F1C9B8] dataWithBytes:&a4->var15 length:64], a4->var10.var0, a4->var10.var1, a4->var11);
  double var3 = a4->var3;
  if ((a4->var18 + 1) >= 2) {
    long long v9 = [[_CLLocationGroundAltitude alloc] initWithEstimate:a4->var18 uncertainty:a4->var27 undulation:a4->var28 undulationModel:a4->var19];
  }
  else {
    long long v9 = 0;
  }
  if (var3 <= 0.0) {
    double var3 = -1.0;
  }
  long long v10 = -[_CLLocationFusionInfo initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:]([_CLLocationFusionInfo alloc], "initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:", a4->var33, a4->var34, a4->var37, a4->var35.var0, a4->var35.var1, a4->var36, a4->var38, a4->var39, a4->var40, a4->var41);
  long long v11 = [[CLLocationGnssOdometerInfo alloc] initWithOdometer:a4->var0 deltaDistance:a4->var1 deltaDistanceAccuracy:a4->var2];
  objc_super v12 = [CLLocationTrackRunInfo alloc];
  uint64_t var1 = a4->var16.var1;
  uint64_t var4 = a4->var16.var4;
  id v15 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:a4->var16.var2];
  uint64_t v16 = a4->var16.var3;
  uint64_t var5 = a4->var16.var5;
  int var6 = a4->var16.var6;
  long long v19 = *(_OWORD *)&a4->var16.var0.var2;
  $F24F406B2B787EFB06265DBA3D28CBD5 v20 = a4->var16.var0.var6;
  long long v37 = *(_OWORD *)&a4->var16.var0.var4;
  $F24F406B2B787EFB06265DBA3D28CBD5 v38 = v20;
  long long v39 = *(_OWORD *)&a4->var16.var0.var7;
  long long v35 = *(_OWORD *)&a4->var16.var0.var0;
  long long v36 = v19;
  LODWORD(v34) = var6;
  v21 = [(CLLocationTrackRunInfo *)v12 initWithLapInfo:&v35 laneNumber:var1 laneCount:var4 trackId:v15 estimatedLaneNumber:v16 estimatedLaneConfidence:var5 trackProximity:v34];
  double var29 = a4->var29;
  double var30 = a4->var30;
  double var31 = a4->var31;
  double var32 = a4->var32;
  uint64_t var44 = a4->var44;
  double var45 = a4->var45;
  double var46 = a4->var46;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  long long v41 = *(_OWORD *)&a3->var11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v42 = var13;
  v43[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v43 + 12) = *(_OWORD *)&a3->var16;
  $F24F406B2B787EFB06265DBA3D28CBD5 v30 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&a3->var5;
  long long v37 = *(_OWORD *)&a3->var3;
  $F24F406B2B787EFB06265DBA3D28CBD5 v38 = v30;
  long long v31 = *(_OWORD *)&a3->var9;
  long long v39 = *(_OWORD *)&a3->var7;
  long long v40 = v31;
  long long v32 = *(_OWORD *)&a3->var1.var1;
  long long v35 = *(_OWORD *)&a3->var0;
  long long v36 = v32;
  return [(CLLocationInternal *)self initWithClientLocation:&v35 matchInfo:v7 trustedTimestamp:v9 groundAltitude:v10 fusionInfo:v21 trackRunInfo:var44 rawHorizontalAccuracy:var3 rawAltitude:var29 rawVerticalAccuracy:var30 rawCourseAccuracy:var31 positionContextStateType:var32 probabilityPositionContextStateIndoor:var45 probabilityPositionContextStateOutdoor:var46 gnssOdometerInfo:v11];
}

- (CLLocationInternal)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v14[6] = *(_OWORD *)&a3->var11;
  v14[7] = var13;
  v15[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&a3->var16;
  long long v8 = *(_OWORD *)&a3->var5;
  v14[2] = *(_OWORD *)&a3->var3;
  v14[3] = v8;
  long long v9 = *(_OWORD *)&a3->var9;
  v14[4] = *(_OWORD *)&a3->var7;
  v14[5] = v9;
  long long v10 = *(_OWORD *)&a3->var1.var1;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v10;
  memcpy(v13, a4, sizeof(v13));
  long long v11 = [(CLLocationInternal *)self initWithClientLocation:v14 clientLocationPrivate:v13];
  if (v11) {
    v11->fGroundAltitude = (_CLLocationGroundAltitude *)a5;
  }
  return v11;
}

@end