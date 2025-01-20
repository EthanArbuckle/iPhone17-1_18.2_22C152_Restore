@interface SHShazamKitServerMatcher
- (NSISO8601DateFormatter)iso8601Formatter;
- (SHLocationProvider)locationProvider;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (SHNetworkRecognitionRequester)networkRequester;
- (SHShazamKitServerCatalog)catalog;
- (SHShazamKitServerMatcher)initWithCatalog:(id)a3;
- (SHShazamKitServerMatcher)initWithCatalog:(id)a3 recognitionRequester:(id)a4;
- (id)buildURLForSignature:(id)a3 endpoint:(id)a4;
- (id)partnerURLRequestForSignature:(id)a3 endpoint:(id)a4;
- (id)payloadForSignature:(id)a3 withLocation:(id)a4;
- (void)dealloc;
- (void)matchSignature:(id)a3 tokenizedURL:(id)a4;
- (void)responseForServerData:(id)a3 signature:(id)a4;
- (void)setCatalog:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setNetworkRequester:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHShazamKitServerMatcher

- (void)dealloc
{
  [(SHNetworkRecognitionRequester *)self->_networkRequester invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SHShazamKitServerMatcher;
  [(SHShazamKitServerMatcher *)&v3 dealloc];
}

- (SHShazamKitServerMatcher)initWithCatalog:(id)a3
{
  id v4 = a3;
  v5 = [SHAMSEndpointRequester alloc];
  v6 = [v4 clientIdentifier];
  v7 = -[SHAMSEndpointRequester initWithClientIdentifier:clientType:](v5, "initWithClientIdentifier:clientType:", v6, [v4 clientType]);

  v8 = [(SHShazamKitServerMatcher *)self initWithCatalog:v4 recognitionRequester:v7];
  return v8;
}

- (SHShazamKitServerMatcher)initWithCatalog:(id)a3 recognitionRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHShazamKitServerMatcher;
  v9 = [(SHShazamKitServerMatcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_catalog, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
  }

  return v10;
}

- (NSISO8601DateFormatter)iso8601Formatter
{
  iso8601Formatter = self->_iso8601Formatter;
  if (!iso8601Formatter)
  {
    id v4 = (NSISO8601DateFormatter *)objc_alloc_init((Class)NSISO8601DateFormatter);
    v5 = self->_iso8601Formatter;
    self->_iso8601Formatter = v4;

    [(NSISO8601DateFormatter *)self->_iso8601Formatter setFormatOptions:3955];
    iso8601Formatter = self->_iso8601Formatter;
  }

  return iso8601Formatter;
}

- (void)responseForServerData:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SHShazamKitServerMatcher *)self catalog];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A518;
  v11[3] = &unk_100074EF8;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  v14 = self;
  [v8 loadContext:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  [(SHShazamKitServerMatcher *)self setMatcherRequest:v4];
  v5 = [(SHShazamKitServerMatcher *)self matcherRequest];
  id v6 = [v5 requestID];
  id v7 = [v6 UUIDString];
  id v8 = [(SHShazamKitServerMatcher *)self catalog];
  id v9 = +[SHLocationProvider locationProviderForRequestIdentifier:clientType:](SHLocationProvider, "locationProviderForRequestIdentifier:clientType:", v7, [v8 clientType]);
  [(SHShazamKitServerMatcher *)self setLocationProvider:v9];

  id v10 = [v4 signature];
  objc_initWeak(&location, self);
  v11 = [(SHShazamKitServerMatcher *)self catalog];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A7C8;
  v13[3] = &unk_100074F20;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [v11 loadConfiguration:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)matchSignature:(id)a3 tokenizedURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SHShazamKitServerMatcher *)self partnerURLRequestForSignature:v6 endpoint:v7];
  id v9 = sh_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 metrics];
    [v10 signatureRecordingOffset];
    uint64_t v12 = v11;
    [v6 duration];
    uint64_t v14 = v13;
    id v15 = [v6 dataRepresentation];
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    __int16 v26 = 2048;
    id v27 = [v15 length];
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Shazam service matching signature with offset %f of duration %f with data of length %lu at %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v16 = [(SHShazamKitServerMatcher *)self networkRequester];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000AB24;
  v18[3] = &unk_100074F48;
  objc_copyWeak(&v21, (id *)buf);
  id v17 = v6;
  id v19 = v17;
  v20 = self;
  [v16 performRequest:v8 withReply:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (id)partnerURLRequestForSignature:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = [(SHShazamKitServerMatcher *)self buildURLForSignature:v6 endpoint:a4];
  id v8 = +[NSURLRequest requestWithURL:v7];
  id v9 = [v8 mutableCopy];

  [v9 setHTTPMethod:@"POST"];
  id v10 = [(SHShazamKitServerMatcher *)self locationProvider];
  uint64_t v11 = [v10 location];
  uint64_t v12 = [(SHShazamKitServerMatcher *)self payloadForSignature:v6 withLocation:v11];

  uint64_t v15 = 0;
  uint64_t v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:0 error:&v15];
  [v9 setHTTPBody:v13];

  [v9 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  return v9;
}

- (id)payloadForSignature:(id)a3 withLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataRepresentation];
  uint64_t v9 = [v8 base64EncodedStringWithOptions:0];

  id v10 = [(SHShazamKitServerMatcher *)self iso8601Formatter];
  uint64_t v11 = [v6 audioStartDate];
  uint64_t v12 = [v10 stringFromDate:v11];

  uint64_t v13 = [v6 metrics];
  id v14 = [v13 recordingSource];

  CFStringRef v15 = @"unknown";
  if (v14 == (id)2) {
    CFStringRef v15 = @"external";
  }
  if (v14 == (id)1) {
    CFStringRef v16 = @"internal";
  }
  else {
    CFStringRef v16 = v15;
  }
  v32[0] = @"signature";
  v29 = (void *)v9;
  v30[0] = @"uri";
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"data:audio/vnd.shazam.sig;base64,%@",
  id v17 = v9);
  v31[0] = v17;
  v31[1] = v16;
  v30[1] = @"audioSource";
  v30[2] = @"startDate";
  __int16 v28 = (void *)v12;
  v31[2] = v12;
  v30[3] = @"recordingOffsetInMilliseconds";
  v18 = [v6 metrics];
  [v18 signatureRecordingOffset];
  v20 = +[NSNumber numberWithDouble:v19 * 1000.0];
  v31[3] = v20;
  id v21 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  v32[1] = @"sessionDurationInSeconds";
  v33[0] = v21;
  v22 = [v6 metrics];
  [v22 sessionDuration];
  uint64_t v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[1] = v23;
  __int16 v24 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  uint64_t v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

  if (v7)
  {
    __int16 v26 = +[SHLocationProvider anonymizeCoordinatesPayloadForLocation:v7 truncatingToDecimalPlaces:2];
    [v25 setValue:v26 forKey:@"approximateCoordinates"];
  }

  return v25;
}

- (id)buildURLForSignature:(id)a3 endpoint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _ID];
  id v7 = [v6 UUIDString];
  [v5 updateToken:1 withValue:v7];

  id v8 = [v5 URLRepresentation];

  return v8;
}

- (void)stopRecognition
{
  id v4 = [(SHShazamKitServerMatcher *)self matcherRequest];
  objc_super v3 = [v4 requestID];
  [(SHShazamKitServerMatcher *)self stopRecognitionForRequestID:v3];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHShazamKitServerMatcher *)self matcherRequest];
  id v6 = [v5 requestID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = [(SHShazamKitServerMatcher *)self matcherRequest];
    uint64_t v9 = [v8 requestID];
    id v10 = [v9 UUIDString];
    uint64_t v11 = [(SHShazamKitServerMatcher *)self catalog];
    +[SHLocationProvider locationProviderForRequestIdentifier:clientType:](SHLocationProvider, "locationProviderForRequestIdentifier:clientType:", v10, [v11 clientType]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    [v19 stopUpdatingLocation];
    uint64_t v12 = +[SHError privateErrorWithCode:203 underlyingError:0];
    uint64_t v13 = [(SHShazamKitServerMatcher *)self matcherRequest];
    id v14 = [v13 signature];
    if (v14)
    {
      CFStringRef v15 = +[SHMatcherResponse errorResponseForSignature:v14 error:v12];
    }
    else
    {
      CFStringRef v16 = objc_opt_new();
      CFStringRef v15 = +[SHMatcherResponse errorResponseForSignature:v16 error:v12];
    }
    id v17 = [(SHShazamKitServerMatcher *)self delegate];
    [v17 matcher:self didProduceResponse:v15];

    [(SHShazamKitServerMatcher *)self setDelegate:0];
    v18 = [(SHShazamKitServerMatcher *)self networkRequester];
    [v18 invalidate];
  }
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHShazamKitServerCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (SHNetworkRecognitionRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (SHLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationProvider, 0);
  objc_storeStrong((id *)&self->_matcherRequest, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_iso8601Formatter, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end