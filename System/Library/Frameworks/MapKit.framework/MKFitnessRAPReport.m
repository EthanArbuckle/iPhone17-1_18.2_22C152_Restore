@interface MKFitnessRAPReport
- (GEORPFeedbackRequestParameters)requestParameters;
- (id)initForRunningTrackIssue:(unint64_t)a3 trackCoordinate:(CLLocationCoordinate2D)a4 trackFeatureID:(id)a5 nameOfTrack:(id)a6 numberOfLanes:(id)a7 comment:(id)a8;
- (int)optionKeyForTrackIssue:(unint64_t)a3;
@end

@implementation MKFitnessRAPReport

- (id)initForRunningTrackIssue:(unint64_t)a3 trackCoordinate:(CLLocationCoordinate2D)a4 trackFeatureID:(id)a5 nameOfTrack:(id)a6 numberOfLanes:(id)a7 comment:(id)a8
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MKFitnessRAPReport;
  v19 = [(MKFitnessRAPReport *)&v23 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F648A8]), "initForRunningTrackIssue:trackCoordinateLatitude:trackCoordinateLongitude:trackFeatureID:nameOfTrack:numberOfLanes:comment:", -[MKFitnessRAPReport optionKeyForTrackIssue:](v19, "optionKeyForTrackIssue:", a3), v15, v16, v17, v18, latitude, longitude);
    requestParameters = v19->_requestParameters;
    v19->_requestParameters = (GEORPFeedbackRequestParameters *)v20;
  }
  return v19;
}

- (int)optionKeyForTrackIssue:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return dword_18BD1C640[a3 - 1];
  }
}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);

  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
}

@end