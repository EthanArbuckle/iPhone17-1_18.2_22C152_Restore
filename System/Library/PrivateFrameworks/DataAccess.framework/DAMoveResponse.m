@interface DAMoveResponse
- (DAMessageMoveRequest)origRequest;
- (DAMoveResponse)initWithStatus:(int)a3 sourceID:(id)a4 destID:(id)a5;
- (NSString)destID;
- (NSString)sourceID;
- (id)description;
- (int)status;
- (void)setDestID:(id)a3;
- (void)setOrigRequest:(id)a3;
- (void)setSourceID:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation DAMoveResponse

- (DAMoveResponse)initWithStatus:(int)a3 sourceID:(id)a4 destID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DAMoveResponse;
  v10 = [(DAMoveResponse *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(DAMoveResponse *)v10 setStatus:v6];
    v12 = (void *)[v8 copy];
    [(DAMoveResponse *)v11 setSourceID:v12];

    v13 = (void *)[v9 copy];
    [(DAMoveResponse *)v11 setDestID:v13];
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DAMoveResponse;
  v4 = [(DAMoveResponse *)&v11 description];
  uint64_t v5 = [(DAMoveResponse *)self status];
  uint64_t v6 = [(DAMoveResponse *)self sourceID];
  v7 = [(DAMoveResponse *)self destID];
  id v8 = [(DAMoveResponse *)self origRequest];
  id v9 = [v3 stringWithFormat:@"%@ status %d, sourceID \"%@\", destID \"%@\", origRequest (%@)", v4, v5, v6, v7, v8];

  return v9;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (NSString)destID
{
  return self->_destID;
}

- (void)setDestID:(id)a3
{
}

- (DAMessageMoveRequest)origRequest
{
  return self->_origRequest;
}

- (void)setOrigRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origRequest, 0);
  objc_storeStrong((id *)&self->_destID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
}

@end