@interface FAChildAccountCutOffAgeResponse
- (FAChildAccountCutOffAgeResponse)init;
- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5;
- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5;
- (NSString)childCutOffAgeLocalized;
- (int64_t)childCutOffAge;
@end

@implementation FAChildAccountCutOffAgeResponse

- (NSString)childCutOffAgeLocalized
{
  v2 = self;
  sub_1D256FD8C();

  v3 = (void *)sub_1D25AA980();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)childCutOffAge
{
  v2 = self;
  id v3 = sub_1D256FEF8();

  return (int64_t)v3;
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    id v7 = v4;
    v4 = (void *)sub_1D25AA550();
    unint64_t v9 = v8;
  }
  else
  {
    id v10 = a3;
    unint64_t v9 = 0xF000000000000000;
  }
  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:)(a3, (uint64_t)v4, v9);
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5
{
  id v6 = a4;
  if (a4)
  {
    id v8 = a3;
    id v9 = v6;
    id v6 = (void *)sub_1D25AA550();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    unint64_t v11 = 0xF000000000000000;
  }
  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:bodyIsPlist:)(a3, (uint64_t)v6, v11, a5);
}

- (FAChildAccountCutOffAgeResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5
{
  id v6 = a4;
  if (!a4)
  {
    id v16 = a3;
    id v17 = a5;
    unint64_t v12 = 0xF000000000000000;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:mediaType:)(a3, (uint64_t)v6, v12, v13, v15);
  }
  id v8 = a3;
  id v9 = a5;
  id v10 = v6;
  id v6 = (void *)sub_1D25AA550();
  unint64_t v12 = v11;

  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_1D25AA9B0();
  uint64_t v15 = v14;

  return (FAChildAccountCutOffAgeResponse *)FAChildAccountCutOffAgeResponse.init(httpResponse:data:mediaType:)(a3, (uint64_t)v6, v12, v13, v15);
}

- (FAChildAccountCutOffAgeResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  return [(FAChildAccountCutOffAgeResponse *)&v3 init];
}

@end