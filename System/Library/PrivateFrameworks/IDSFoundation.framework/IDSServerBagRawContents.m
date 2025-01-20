@interface IDSServerBagRawContents
- (IDSServerBagRawContents)initWithLoadDate:(id)a3 timeToLive:(double)a4 serverSignature:(id)a5 serverCerts:(id)a6 signedBag:(id)a7;
- (NSArray)serverCerts;
- (NSData)serverSignature;
- (NSData)signedBag;
- (NSDate)expirationDate;
- (NSDate)loadDate;
- (double)timeToLive;
- (id)description;
@end

@implementation IDSServerBagRawContents

- (NSData)signedBag
{
  return self->_signedBag;
}

- (NSData)serverSignature
{
  return self->_serverSignature;
}

- (NSArray)serverCerts
{
  return self->_serverCerts;
}

- (IDSServerBagRawContents)initWithLoadDate:(id)a3 timeToLive:(double)a4 serverSignature:(id)a5 serverCerts:(id)a6 signedBag:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  v18 = 0;
  if (v13 && a4 != 0.0 && v14 && v15 && v16)
  {
    v26.receiver = self;
    v26.super_class = (Class)IDSServerBagRawContents;
    v19 = [(IDSServerBagRawContents *)&v26 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_loadDate, a3);
      v20->_timeToLive = a4;
      objc_storeStrong((id *)&v20->_serverSignature, a5);
      objc_storeStrong((id *)&v20->_serverCerts, a6);
      objc_storeStrong((id *)&v20->_signedBag, a7);
      uint64_t v23 = objc_msgSend_dateByAddingTimeInterval_(v13, v21, v22, a4);
      expirationDate = v20->_expirationDate;
      v20->_expirationDate = (NSDate *)v23;
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_timeIntervalSinceReferenceDate(self->_loadDate, v5, v6, v7);
  double v9 = v8;
  double timeToLive = self->_timeToLive;
  uint64_t v13 = objc_msgSend_length(self->_serverSignature, v11, v12, v8);
  uint64_t v17 = objc_msgSend_count(self->_serverCerts, v14, v15, v16);
  uint64_t v21 = objc_msgSend_length(self->_signedBag, v18, v19, v20);
  return (id)objc_msgSend_stringWithFormat_(v3, v22, @"<%@:%p; loadDate: %f; TTL: %f; sigLen: %d; certCount: %d; signedBagLen: %d",
               v23,
               v4,
               self,
               *(void *)&v9,
               *(void *)&timeToLive,
               v13,
               v17,
               v21);
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedBag, 0);
  objc_storeStrong((id *)&self->_serverCerts, 0);
  objc_storeStrong((id *)&self->_serverSignature, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
}

@end