@interface _GEORPFeedbackTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEORPFeedbackTicket)initWithFeedbackRequest:(id)a3 traits:(id)a4;
- (_GEORPFeedbackTicket)initWithFeedbackRequestData:(id)a3 traits:(id)a4;
- (_GEORPFeedbackTicket)initWithFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEORPFeedbackTicket

- (_GEORPFeedbackTicket)initWithFeedbackRequest:(id)a3 traits:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEORPFeedbackTicket;
  v8 = [(GEOAbstractTicket *)&v11 initWithTraits:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_feedbackRequest, a3);
  }

  return v9;
}

- (_GEORPFeedbackTicket)initWithFeedbackRequestData:(id)a3 traits:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEORPFeedbackTicket;
  id v7 = [(GEOAbstractTicket *)&v13 initWithTraits:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    resubmissionData = v7->_resubmissionData;
    v7->_resubmissionData = (NSData *)v8;

    v10 = [[GEORPFeedbackRequest alloc] initWithData:v6];
    feedbackRequest = v7->_feedbackRequest;
    v7->_feedbackRequest = v10;
  }
  return v7;
}

- (_GEORPFeedbackTicket)initWithFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v45.receiver = self;
  v45.super_class = (Class)_GEORPFeedbackTicket;
  v20 = [(GEOAbstractTicket *)&v45 initWithTraits:a8];
  v21 = v20;
  if (v20)
  {
    p_feedbackRequestParameters = (id *)&v20->_feedbackRequestParameters;
    objc_storeStrong((id *)&v20->_feedbackRequestParameters, a3);
    p_place = (id *)&v21->_place;
    objc_storeStrong((id *)&v21->_place, a4);
    if ([*p_feedbackRequestParameters hasLayoutConfigParameters])
    {
      v24 = [*p_place _placeData];
      [v24 mapsId];
      v25 = id v44 = v16;
      v26 = [*p_feedbackRequestParameters layoutConfigParameters];
      [v26 setMapsId:v25];

      v43 = [*p_place _placeData];
      v27 = [v43 geoMapItem];
      v28 = [v27 displayMapRegion];
      [*p_feedbackRequestParameters layoutConfigParameters];
      id v29 = v19;
      id v30 = v18;
      id v31 = v17;
      v33 = id v32 = v15;
      [v33 setMapRegion:v28];

      id v15 = v32;
      id v17 = v31;
      id v18 = v30;
      id v19 = v29;

      id v16 = v44;
      v34 = [GEOLatLng alloc];
      [*p_place centerCoordinate];
      emailAddress = -[GEOLatLng initWithCoordinate:](v34, "initWithCoordinate:");
      v36 = [*p_feedbackRequestParameters layoutConfigParameters];
      [v36 setCoordinate:emailAddress];

LABEL_6:
      goto LABEL_7;
    }
    if ([*p_feedbackRequestParameters hasSubmissionParameters])
    {
      uint64_t v37 = [v17 copy];
      userCredentials = v21->_userCredentials;
      v21->_userCredentials = (GEORPUserCredentials *)v37;

      uint64_t v39 = [v18 copy];
      pushToken = v21->_pushToken;
      v21->_pushToken = (NSData *)v39;

      uint64_t v41 = [v19 copy];
      emailAddress = (GEOLatLng *)v21->_emailAddress;
      v21->_emailAddress = (NSString *)v41;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v21;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)_GEORPFeedbackTicket;
  [(GEOAbstractTicket *)&v5 cancel];
  if (self->_feedbackRequest)
  {
    v3 = +[GEORPFeedbackRequester sharedInstance];
    [v3 cancelRequest:self->_feedbackRequest];

    feedbackRequest = self->_feedbackRequest;
    self->_feedbackRequest = 0;
  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(GEOAbstractTicket *)self isCancelled];
  if (v5 && !v6 && !self->_started)
  {
    self->_started = 1;
    if (!self->_feedbackRequest)
    {
      if (!self->_feedbackRequestParameters)
      {
        v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
        (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v12);

        goto LABEL_8;
      }
      id v7 = [[GEORPFeedbackRequest alloc] initWithFeedbackRequestParameters:self->_feedbackRequestParameters userCredentials:self->_userCredentials pushToken:self->_pushToken allowContactBackAtEmailAddress:self->_emailAddress traits:self->super._traits];
      feedbackRequest = self->_feedbackRequest;
      self->_feedbackRequest = v7;
    }
    v9 = +[GEORPFeedbackRequester sharedInstance];
    v10 = self->_feedbackRequest;
    traits = self->super._traits;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58___GEORPFeedbackTicket_submitWithHandler_networkActivity___block_invoke;
    v13[3] = &unk_1E53DEB78;
    v13[4] = self;
    id v14 = v5;
    [v9 startWithRequest:v10 traits:traits completionHandler:v13];
  }
LABEL_8:
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_feedbackRequest, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);

  objc_storeStrong((id *)&self->_resubmissionData, 0);
}

@end