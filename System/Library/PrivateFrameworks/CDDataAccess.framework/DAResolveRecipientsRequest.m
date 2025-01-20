@interface DAResolveRecipientsRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)retrieveAvailablilty;
- (BOOL)retrieveCertificates;
- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3;
- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3 retrieveCertificates:(BOOL)a4 retrieveAvailability:(BOOL)a5 withStartTime:(id)a6 endTime:(id)a7;
- (NSArray)emailAddresses;
- (NSDate)endTime;
- (NSDate)startTime;
- (id)description;
- (unint64_t)hash;
- (void)setEmailAddresses:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setRetrieveAvailablilty:(BOOL)a3;
- (void)setRetrieveCertificates:(BOOL)a3;
- (void)setStartTime:(id)a3;
@end

@implementation DAResolveRecipientsRequest

- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DAResolveRecipientsRequest;
  v5 = [(DAResolveRecipientsRequest *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DAResolveRecipientsRequest *)v5 setEmailAddresses:v4];
    [(DAResolveRecipientsRequest *)v6 setRetrieveCertificates:1];
    [(DAResolveRecipientsRequest *)v6 setRetrieveAvailablilty:0];
    [(DAResolveRecipientsRequest *)v6 setStartTime:0];
    [(DAResolveRecipientsRequest *)v6 setEndTime:0];
  }

  return v6;
}

- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3 retrieveCertificates:(BOOL)a4 retrieveAvailability:(BOOL)a5 withStartTime:(id)a6 endTime:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)DAResolveRecipientsRequest;
  v15 = [(DAResolveRecipientsRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(DAResolveRecipientsRequest *)v15 setEmailAddresses:v12];
    [(DAResolveRecipientsRequest *)v16 setRetrieveCertificates:v10];
    [(DAResolveRecipientsRequest *)v16 setRetrieveAvailablilty:v9];
    [(DAResolveRecipientsRequest *)v16 setStartTime:v13];
    [(DAResolveRecipientsRequest *)v16 setEndTime:v14];
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DAResolveRecipientsRequest *)self emailAddresses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(DAResolveRecipientsRequest *)self emailAddresses];
    v7 = [v5 emailAddresses];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DAResolveRecipientsRequest;
  id v4 = [(DAResolveRecipientsRequest *)&v8 description];
  id v5 = [(DAResolveRecipientsRequest *)self emailAddresses];
  uint64_t v6 = [v3 stringWithFormat:@"%@ emailAddresses %@", v4, v5];

  return v6;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (BOOL)retrieveCertificates
{
  return self->_retrieveCertificates;
}

- (void)setRetrieveCertificates:(BOOL)a3
{
  self->_retrieveCertificates = a3;
}

- (BOOL)retrieveAvailablilty
{
  return self->_retrieveAvailablilty;
}

- (void)setRetrieveAvailablilty:(BOOL)a3
{
  self->_retrieveAvailablilty = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end