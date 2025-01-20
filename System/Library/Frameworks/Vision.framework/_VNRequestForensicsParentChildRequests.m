@interface _VNRequestForensicsParentChildRequests
- (BOOL)isEqual:(id)a3;
- (NSArray)orderedChildRequests;
- (VNRequest)parentRequest;
- (_VNRequestForensicsParentChildRequests)initWithParentRequest:(id)a3 orderedChildRequests:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _VNRequestForensicsParentChildRequests

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedChildRequests, 0);

  objc_storeStrong((id *)&self->_parentRequest, 0);
}

- (NSArray)orderedChildRequests
{
  return self->_orderedChildRequests;
}

- (VNRequest)parentRequest
{
  return self->_parentRequest;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_VNRequestForensicsParentChildRequests *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      parentRequest = self->_parentRequest;
      v7 = [(_VNRequestForensicsParentChildRequests *)v5 parentRequest];

      if (parentRequest != v7)
      {
        BOOL v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
      orderedChildRequests = self->_orderedChildRequests;
      v10 = [(_VNRequestForensicsParentChildRequests *)v5 orderedChildRequests];
      v11 = orderedChildRequests;
      v12 = v10;
      if (v11 != v12)
      {
        unint64_t v13 = [(NSArray *)v11 count];
        if ([(NSArray *)v12 count] != v13)
        {
LABEL_11:
          BOOL v8 = 0;
LABEL_13:

          goto LABEL_14;
        }
        if (v13)
        {
          v14 = [(NSArray *)v11 objectAtIndexedSubscript:0];
          v15 = [(NSArray *)v12 objectAtIndexedSubscript:0];

          if (v14 == v15)
          {
            uint64_t v17 = 1;
            while (v13 != v17)
            {
              v18 = [(NSArray *)v11 objectAtIndexedSubscript:v17];
              v19 = [(NSArray *)v12 objectAtIndexedSubscript:v17];

              ++v17;
              if (v18 != v19)
              {
                unint64_t v20 = v17 - 1;
                goto LABEL_21;
              }
            }
            unint64_t v20 = v13;
LABEL_21:
            BOOL v8 = v20 >= v13;
            goto LABEL_13;
          }
          goto LABEL_11;
        }
      }
      BOOL v8 = 1;
      goto LABEL_13;
    }
    BOOL v8 = 0;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  v3 = [(_VNRequestForensicsParentChildRequests *)self parentRequest];
  uint64_t v4 = [v3 hash];

  v5 = [(_VNRequestForensicsParentChildRequests *)self orderedChildRequests];
  unint64_t v6 = [v5 hash] ^ __ROR8__(v4, 51);

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(_VNRequestForensicsParentChildRequests *)self parentRequest];
  v5 = [(_VNRequestForensicsParentChildRequests *)self orderedChildRequests];
  unint64_t v6 = [v5 componentsJoinedByString:@", "];
  v7 = [v3 stringWithFormat:@"( %@, [ %@ ])", v4, v6];

  return v7;
}

- (_VNRequestForensicsParentChildRequests)initWithParentRequest:(id)a3 orderedChildRequests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_VNRequestForensicsParentChildRequests;
  v9 = [(_VNRequestForensicsParentChildRequests *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentRequest, a3);
    uint64_t v11 = [v8 copy];
    orderedChildRequests = v10->_orderedChildRequests;
    v10->_orderedChildRequests = (NSArray *)v11;

    unint64_t v13 = v10;
  }

  return v10;
}

@end