@interface _GEOBatchSpatialLookupTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOBatchSpatialLookupTicket)initWithRequest:(id)a3 forParameters:(id)a4 traits:(id)a5;
- (id)mapItemsForParameters:(id)a3;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 queue:(id)a6;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5;
@end

@implementation _GEOBatchSpatialLookupTicket

- (_GEOBatchSpatialLookupTicket)initWithRequest:(id)a3 forParameters:(id)a4 traits:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEOBatchSpatialLookupTicket;
  v11 = [(GEOAbstractTicket *)&v19 initWithTraits:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    uint64_t v13 = [v10 copy];
    parameters = v12->_parameters;
    v12->_parameters = (NSArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    parametersToMapItems = v12->_parametersToMapItems;
    v12->_parametersToMapItems = (NSMapTable *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    id v9 = +[GEOSpatialLookupRequester sharedInstance];
    request = self->_request;
    traits = self->super._traits;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v12[3] = &unk_1E53DE758;
    v12[4] = self;
    id v13 = v7;
    [v9 startWithRequest:request traits:traits timeout:v8 auditToken:v12 completionHandler:0.0];
  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![(GEOAbstractTicket *)self isCancelled])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke;
    v18[3] = &unk_1E53DE780;
    id v21 = v10;
    id v19 = v13;
    v20 = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_3;
    v14[3] = &unk_1E53DE5A0;
    id v17 = v12;
    id v15 = v19;
    v16 = self;
    [(_GEOBatchSpatialLookupTicket *)self submitWithHandler:v18 auditToken:v11 networkActivity:v14];
  }
}

- (id)mapItemsForParameters:(id)a3
{
  return [(NSMapTable *)self->_parametersToMapItems objectForKey:a3];
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2852;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersToMapItems, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end