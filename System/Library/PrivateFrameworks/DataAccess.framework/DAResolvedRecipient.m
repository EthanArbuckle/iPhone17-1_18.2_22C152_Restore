@interface DAResolvedRecipient
- (NSMutableDictionary)mResolvedEmailToX509Certs;
- (NSString)mergedFreeBusy;
- (id)description;
- (int64_t)availabilityStatus;
- (int64_t)certificatesStatus;
- (int64_t)status;
- (void)addCert:(id)a3 forEmailAddress:(id)a4;
- (void)setAvailabilityStatus:(int64_t)a3;
- (void)setCertificatesStatus:(int64_t)a3;
- (void)setMResolvedEmailToX509Certs:(id)a3;
- (void)setMergedFreeBusy:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation DAResolvedRecipient

- (id)description
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  v4 = (void *)MEMORY[0x1E4F28E78];
  v36.receiver = self;
  v36.super_class = (Class)DAResolvedRecipient;
  v5 = [(DAResolvedRecipient *)&v36 description];
  v6 = [v4 stringWithFormat:@"%@ status %ld", v5, -[DAResolvedRecipient status](v2, "status")];

  v7 = [(DAResolvedRecipient *)v2 mResolvedEmailToX509Certs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @" email->certs status %ld ", -[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"));
    [v6 appendString:v9];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = [(DAResolvedRecipient *)v2 mResolvedEmailToX509Certs];
    uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          [v6 appendFormat:@"%@: ", v11];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v12 = v2;
          v13 = [(DAResolvedRecipient *)v2 mResolvedEmailToX509Certs];
          v14 = [v13 objectForKeyedSubscript:v11];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v29 != v17) {
                  objc_enumerationMutation(v14);
                }
                objc_msgSend(v6, "appendFormat:", @"<cert data length %ld hash %ld> ", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "length"), objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "hash"));
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
            }
            while (v16);
          }

          v2 = v12;
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v27);
    }

    unint64_t v3 = 0x1E4F28000;
  }
  else
  {
    [v6 appendString:@" email->certs "];
    if ([(DAResolvedRecipient *)v2 certificatesStatus])
    {
      v19 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"status %ld ", -[DAResolvedRecipient certificatesStatus](v2, "certificatesStatus"));
      [v6 appendString:v19];
    }
    [v6 appendString:@"(null)"];
  }
  v20 = [(DAResolvedRecipient *)v2 mergedFreeBusy];

  if (v20)
  {
    v21 = objc_msgSend(*(id *)(v3 + 3704), "stringWithFormat:", @" email->availability status %ld ", -[DAResolvedRecipient availabilityStatus](v2, "availabilityStatus"));
    [v6 appendString:v21];

    v22 = [(DAResolvedRecipient *)v2 mergedFreeBusy];
    [v6 appendString:v22];
  }
  else
  {
    [v6 appendString:@" email->availability "];
    if ([(DAResolvedRecipient *)v2 certificatesStatus])
    {
      v23 = objc_msgSend(*(id *)(v3 + 3704), "stringWithFormat:", @"status %ld ", -[DAResolvedRecipient availabilityStatus](v2, "availabilityStatus"));
      [v6 appendString:v23];
    }
    [v6 appendString:@"(null)"];
  }
  return v6;
}

- (void)addCert:(id)a3 forEmailAddress:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  v7 = [(DAResolvedRecipient *)self mResolvedEmailToX509Certs];

  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    [(DAResolvedRecipient *)self setMResolvedEmailToX509Certs:v8];
  }
  v9 = [(DAResolvedRecipient *)self mResolvedEmailToX509Certs];
  v10 = [v9 objectForKeyedSubscript:v15];

  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    v12 = [(DAResolvedRecipient *)self mResolvedEmailToX509Certs];
    [v12 setObject:v11 forKeyedSubscript:v15];
  }
  v13 = [(DAResolvedRecipient *)self mResolvedEmailToX509Certs];
  v14 = [v13 objectForKeyedSubscript:v15];
  [v14 addObject:v6];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)certificatesStatus
{
  return self->_certificatesStatus;
}

- (void)setCertificatesStatus:(int64_t)a3
{
  self->_certificatesStatus = a3;
}

- (int64_t)availabilityStatus
{
  return self->_availabilityStatus;
}

- (void)setAvailabilityStatus:(int64_t)a3
{
  self->_availabilityStatus = a3;
}

- (NSString)mergedFreeBusy
{
  return self->_mergedFreeBusy;
}

- (void)setMergedFreeBusy:(id)a3
{
}

- (NSMutableDictionary)mResolvedEmailToX509Certs
{
  return self->_mResolvedEmailToX509Certs;
}

- (void)setMResolvedEmailToX509Certs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mResolvedEmailToX509Certs, 0);
  objc_storeStrong((id *)&self->_mergedFreeBusy, 0);
}

@end