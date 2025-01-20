@interface DNDSAvailabilityInvitationRequest
- (AKAvailabilityInvitation)invitation;
- (BOOL)isEqual:(id)a3;
- (DNDSAvailabilityInvitationRequest)initWithHandles:(id)a3 invitation:(id)a4;
- (NSArray)handles;
- (unint64_t)hash;
@end

@implementation DNDSAvailabilityInvitationRequest

- (DNDSAvailabilityInvitationRequest)initWithHandles:(id)a3 invitation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSAvailabilityInvitationRequest;
  v9 = [(DNDSAvailabilityInvitationRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handles, a3);
    objc_storeStrong((id *)&v10->_invitation, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(DNDSAvailabilityInvitationRequest *)self handles];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSAvailabilityInvitationRequest *)self invitation];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSAvailabilityInvitationRequest *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(DNDSAvailabilityInvitationRequest *)self handles];
      id v7 = [(DNDSAvailabilityInvitationRequest *)v5 handles];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSAvailabilityInvitationRequest *)self handles];
        if (!v8)
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        v10 = [(DNDSAvailabilityInvitationRequest *)v5 handles];
        if (!v10)
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v11 = [(DNDSAvailabilityInvitationRequest *)self handles];
        objc_super v12 = [(DNDSAvailabilityInvitationRequest *)v5 handles];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      v14 = [(DNDSAvailabilityInvitationRequest *)self invitation];
      uint64_t v15 = [(DNDSAvailabilityInvitationRequest *)v5 invitation];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(DNDSAvailabilityInvitationRequest *)self invitation];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDSAvailabilityInvitationRequest *)v5 invitation];
          if (v19)
          {
            v22 = [(DNDSAvailabilityInvitationRequest *)self invitation];
            v20 = [(DNDSAvailabilityInvitationRequest *)v5 invitation];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      objc_super v12 = v23;
      v11 = v24;
      if (v6 == v7) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSArray)handles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (AKAvailabilityInvitation)invitation
{
  return (AKAvailabilityInvitation *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end