@interface PARFlightResponse
+ (id)_debugResponseFromReply:(id)a3;
+ (id)responseFromReply:(id)a3;
- (NSArray)flightResults;
- (id)description;
- (void)setFlightResults:(id)a3;
@end

@implementation PARFlightResponse

- (void).cxx_destruct
{
}

- (void)setFlightResults:(id)a3
{
}

- (NSArray)flightResults
{
  return self->_flightResults;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PARFlightResponse *)self flightResults];
  v4 = [v2 stringWithFormat:@"flightResults: %@", v3];

  return v4;
}

+ (id)responseFromReply:(id)a3
{
  id v3 = a3;
  v4 = [(PARResponse *)[PARFlightResponse alloc] initWithReply:v3];
  v5 = [v3 data];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F9A588]);
    v7 = [v3 data];
    v8 = (void *)[v6 initWithData:v7];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F99E98]) initWithProtobuf:v8];
    v10 = [v9 flights];
    [(PARFlightResponse *)v4 setFlightResults:v10];
  }

  return v4;
}

+ (id)_debugResponseFromReply:(id)a3
{
  id v3 = a3;
  v4 = [(PARResponse *)[PARFlightResponse alloc] initWithReply:v3];
  v5 = [v3 rawResponse];

  if (v5)
  {
    uint64_t v6 = objc_msgSend(v5, "parsec_mapObjectsUsingBlock:", &__block_literal_global_200);
    flightResults = v4->_flightResults;
    v4->_flightResults = (NSArray *)v6;
  }

  return v4;
}

uint64_t __45__PARFlightResponse__debugResponseFromReply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFlight");
}

@end