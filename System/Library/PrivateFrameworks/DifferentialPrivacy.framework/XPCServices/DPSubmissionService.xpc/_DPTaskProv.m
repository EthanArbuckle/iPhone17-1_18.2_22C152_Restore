@interface _DPTaskProv
+ (id)new;
+ (id)taskProvFromDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6;
+ (id)vdafTypeFromDonation:(id)a3 error:(id *)a4;
- (BOOL)isTaskConfigValidWithError:(id *)a3;
- (NSData)encodedTaskConfig;
- (NSData)helperURL;
- (NSData)leaderURL;
- (NSData)taskID;
- (NSData)taskInfo;
- (NSString)collectionID;
- (_DPDediscoDonation)donation;
- (_DPTaskProv)init;
- (_DPTaskProv)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6;
- (id)derivedMaxBatchSizeFromDonationMetadata:(id)a3 minBatchSize:(unsigned int)a4 error:(id *)a5;
- (id)encodedTaskConfigWithError:(id *)a3;
- (id)taskIDWithError:(id *)a3;
- (id)taskInfoWithError:(id *)a3;
- (unint64_t)derivedTaskExpiration;
- (unint64_t)taskExpiration;
- (unsigned)derivedMinBatchSize;
- (unsigned)maxBatchSize;
- (unsigned)minBatchSize;
- (unsigned)vdafType;
- (void)setEncodedTaskConfig:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation _DPTaskProv

+ (id)taskProvFromDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = +[_DPDediscoUtils dediscoVersionForDonation:v9];
  if (v12 - 3 < 2)
  {
    v13 = _DPTaskProv06;
LABEL_5:
    id v14 = [[v13 alloc] initWithDonation:v9 leaderURL:v10 helperURL:v11 error:a6];
    goto LABEL_7;
  }
  if (v12 == 2)
  {
    v13 = _DPTaskProv00;
    goto LABEL_5;
  }
  v15 = +[NSString stringWithFormat:@"Failed to find matching TaskProv version from PPM version %lu.", v12];
  v16 = +[_DPDediscoError errorWithCode:400 description:v15];

  [v16 logAndStoreInError:a6];
  id v14 = 0;
LABEL_7:

  return v14;
}

- (id)taskIDWithError:(id *)a3
{
  v5 = [(_DPTaskProv *)self taskID];

  if (v5)
  {
    v6 = [(_DPTaskProv *)self taskID];
  }
  else
  {
    v7 = [(_DPTaskProv *)self encodedTaskConfigWithError:a3];
    if (v7)
    {
      id v8 = +[NSMutableData dataWithLength:32];
      id v9 = (unsigned __int8 *)[v8 mutableBytes];
      id v10 = v7;
      CC_SHA256([v10 bytes], (CC_LONG)objc_msgSend(v10, "length"), v9);
      [(_DPTaskProv *)self setTaskID:v8];
      v6 = [(_DPTaskProv *)self taskID];
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (_DPTaskProv)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_DPTaskProv;
  id v14 = [(_DPTaskProv *)&v29 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_donation, a3);
    v16 = [v11 key];
    if (([v16 hasPrefix:@"pfl:"] & 1) == 0
      && ([v16 hasPrefix:@"fedstats:"] & 1) == 0)
    {
      uint64_t v17 = +[NSString stringWithFormat:@"fedstats:%@", v16];

      v16 = (void *)v17;
    }
    objc_storeStrong((id *)&v15->_collectionID, v16);
    v18 = [(id)objc_opt_class() vdafTypeFromDonation:v11 error:a6];
    v19 = v18;
    if (!v18) {
      goto LABEL_11;
    }
    v15->_vdafType = [v18 unsignedIntValue];
    uint64_t v20 = [(_DPTaskProv *)v15 taskInfoWithError:a6];
    taskInfo = v15->_taskInfo;
    v15->_taskInfo = (NSData *)v20;

    if (!v15->_taskInfo) {
      goto LABEL_11;
    }
    uint64_t v22 = [v12 dataUsingEncoding:4];
    leaderURL = v15->_leaderURL;
    v15->_leaderURL = (NSData *)v22;

    uint64_t v24 = [v13 dataUsingEncoding:4];
    helperURL = v15->_helperURL;
    v15->_helperURL = (NSData *)v24;

    if (![(_DPTaskProv *)v15 isTaskConfigValidWithError:a6])
    {
LABEL_11:

      v27 = 0;
      goto LABEL_12;
    }
    v15->_minBatchSize = [(_DPTaskProv *)v15 derivedMinBatchSize];
    v26 = [v11 metadata];
    v27 = [(_DPTaskProv *)v15 derivedMaxBatchSizeFromDonationMetadata:v26 minBatchSize:v15->_minBatchSize error:a6];

    if (!v27)
    {

      goto LABEL_12;
    }
    v15->_maxBatchSize = [(_DPTaskProv *)v27 unsignedIntValue];
    v15->_taskExpiration = [(_DPTaskProv *)v15 derivedTaskExpiration];
  }
  v27 = v15;
LABEL_12:

  return v27;
}

- (id)derivedMaxBatchSizeFromDonationMetadata:(id)a3 minBatchSize:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = kDPMetadataDediscoTaskConfig;
  id v8 = [a3 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  uint64_t v9 = kDPMetadataDediscoTaskConfigMaxBatchSize;
  id v10 = [v8 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigMaxBatchSize];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = +[NSString stringWithFormat:@"Malformed parameter (%@.%@) in metadata, it should be a number.", v7, v9];
    goto LABEL_5;
  }
  if ([v10 unsignedIntValue] < v6)
  {
    id v11 = +[NSString stringWithFormat:@"Malformed parameter (%@.%@) in metadata, it should be at least min batch size (%u)", v7, v9, v6];
LABEL_5:
    id v12 = +[_DPDediscoError errorWithCode:400 description:v11];

    [v12 logAndStoreInError:a5];
    id v13 = 0;
    goto LABEL_7;
  }
  id v13 = v10;
LABEL_7:

  return v13;
}

+ (id)vdafTypeFromDonation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (qword_100082B50 != -1) {
    dispatch_once(&qword_100082B50, &stru_1000750B0);
  }
  id v6 = [v5 serverAlgorithm];
  if (([v6 isEqual:@"Prio"] & 1) == 0)
  {
    id v8 = [v5 serverAlgorithm];
    unsigned __int8 v9 = [v8 isEqual:@"Prio2"];

    if (v9)
    {
      uint64_t v7 = &off_1000797E0;
      goto LABEL_14;
    }
    id v10 = [v5 algorithmParameters];
    id v6 = [v10 objectForKeyedSubscript:kDPVDAFType];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(id)qword_100082B58 containsObject:v6])
      {
        id v6 = v6;
        uint64_t v7 = (_UNKNOWN **)v6;
        goto LABEL_13;
      }
      id v15 = v6;
      CFStringRef v11 = @"Unknown VDAFType = %@.";
    }
    else
    {
      CFStringRef v11 = @"Missing VDAFType.";
    }
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v15);
    id v13 = +[_DPDediscoError errorWithCode:700 description:v12];

    [v13 logAndStoreInError:a4];
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = &off_1000797E0;
LABEL_13:

LABEL_14:
  return v7;
}

- (BOOL)isTaskConfigValidWithError:(id *)a3
{
  id v5 = [(_DPTaskProv *)self donation];
  id v6 = [v5 metadata];

  if (v6)
  {
    uint64_t v7 = [(_DPTaskProv *)self donation];
    id v8 = [v7 algorithmParameters];

    if (v8)
    {
      unsigned __int8 v9 = [(_DPTaskProv *)self leaderURL];
      if ([v9 length])
      {
        id v10 = [(_DPTaskProv *)self helperURL];
        id v11 = [v10 length];

        if (v11)
        {
          id v12 = [(_DPTaskProv *)self donation];
          id v13 = [v12 metadata];

          uint64_t v14 = kDPMetadataDediscoTaskConfig;
          id v15 = [v13 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [v13 objectForKeyedSubscript:v14];
            uint64_t v17 = [v16 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigMinBatchSize];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [v13 objectForKeyedSubscript:v14];
              v19 = [v18 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigTaskExpiration];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v20 = [v13 objectForKeyedSubscript:v14];
                [v20 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfig];
                v21 = v47 = v13;
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                id v13 = v47;
                if (isKindOfClass)
                {
                  v23 = [(_DPTaskProv *)self donation];
                  uint64_t v24 = [v23 algorithmParameters];

                  if ([(_DPTaskProv *)self vdafType] == -61437)
                  {
                    long long v55 = 0u;
                    long long v56 = 0u;
                    long long v53 = 0u;
                    long long v54 = 0u;
                    v59[0] = kDPVDAFNumOfProofs;
                    v59[1] = kDPVDAFPrio3SumVectorBitWidth;
                    id obj = +[NSArray arrayWithObjects:v59 count:2];
                    id v25 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
                    if (v25)
                    {
                      id v26 = v25;
                      uint64_t v27 = *(void *)v54;
                      while (2)
                      {
                        for (i = 0; i != v26; i = (char *)i + 1)
                        {
                          if (*(void *)v54 != v27) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                          v30 = [v24 objectForKeyedSubscript:v29];
                          objc_opt_class();
                          char v31 = objc_opt_isKindOfClass();

                          if ((v31 & 1) == 0)
                          {
                            v46 = +[NSString stringWithFormat:@"Invalid VDAF parameter(%@) in algorithm parameters, it should be a number.", v29];
                            v42 = +[_DPDediscoError errorWithCode:701 description:v46];
LABEL_41:

                            [v42 logAndStoreInError:a3];
                            BOOL v32 = 0;
                            goto LABEL_42;
                          }
                        }
                        id v26 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
                        if (v26) {
                          continue;
                        }
                        break;
                      }
                    }

                    long long v51 = 0u;
                    long long v52 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    uint64_t v57 = kDPMetadataVDAFPrio3SumVectorChunkLength;
                    BOOL v32 = 1;
                    id obj = +[NSArray arrayWithObjects:&v57 count:1];
                    id v33 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
                    if (v33)
                    {
                      id v34 = v33;
                      uint64_t v35 = *(void *)v50;
                      uint64_t v36 = kDPMetadataVDAF;
                      while (2)
                      {
                        for (j = 0; j != v34; j = (char *)j + 1)
                        {
                          if (*(void *)v50 != v35) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v38 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
                          v39 = [v13 objectForKeyedSubscript:v36];
                          v40 = [v39 objectForKeyedSubscript:v38];
                          objc_opt_class();
                          char v41 = objc_opt_isKindOfClass();

                          if ((v41 & 1) == 0)
                          {
                            v46 = +[NSString stringWithFormat:@"Invalid VDAF parameter(%@) in metadata, it should be a number.", v38];
                            v42 = +[_DPDediscoError errorWithCode:701 description:v46];
                            id v13 = v47;
                            goto LABEL_41;
                          }
                          id v13 = v47;
                        }
                        id v34 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
                        BOOL v32 = 1;
                        if (v34) {
                          continue;
                        }
                        break;
                      }
                    }
                    v42 = 0;
LABEL_42:
                  }
                  else
                  {
                    v42 = 0;
                    BOOL v32 = 1;
                  }

                  goto LABEL_37;
                }
LABEL_36:
                v42 = +[_DPDediscoError errorWithCode:400 description:@"Malformed metadata types."];
                [v42 logAndStoreInError:a3];
                BOOL v32 = 0;
LABEL_37:

                goto LABEL_32;
              }
            }
          }

          goto LABEL_36;
        }
      }
      else
      {
      }
      CFStringRef v43 = @"Aggregator URL is empty.";
      uint64_t v44 = 300;
    }
    else
    {
      CFStringRef v43 = @"Malformed algorithm parameter in plist, it should be non-nil.";
      uint64_t v44 = 401;
    }
  }
  else
  {
    CFStringRef v43 = @"Malformed metadata value, it should be non-nil.";
    uint64_t v44 = 400;
  }
  v42 = +[_DPDediscoError errorWithCode:v44 description:v43];
  [v42 logAndStoreInError:a3];
  BOOL v32 = 0;
LABEL_32:

  return v32;
}

- (id)taskInfoWithError:(id *)a3
{
  id v4 = +[NSMutableData dataWithLength:32];
  id v5 = (unsigned __int8 *)[v4 mutableBytes];
  id v6 = [(_DPTaskProv *)self collectionID];
  uint64_t v7 = [v6 dataUsingEncoding:4];

  id v8 = v7;
  CC_SHA256([v8 bytes], (CC_LONG)objc_msgSend(v8, "length"), v5);

  return v4;
}

- (unsigned)derivedMinBatchSize
{
  v2 = [(_DPTaskProv *)self donation];
  v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  id v5 = [v4 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigMinBatchSize];
  unsigned int v6 = [v5 unsignedIntValue];

  return v6;
}

- (unint64_t)derivedTaskExpiration
{
  v2 = [(_DPTaskProv *)self donation];
  v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  id v5 = [v4 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigTaskExpiration];
  id v6 = [v5 unsignedLongLongValue];

  return (unint64_t)v6;
}

- (id)encodedTaskConfigWithError:(id *)a3
{
  return 0;
}

- (_DPTaskProv)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (unsigned)vdafType
{
  return self->_vdafType;
}

- (NSData)taskInfo
{
  return self->_taskInfo;
}

- (NSData)leaderURL
{
  return self->_leaderURL;
}

- (NSData)helperURL
{
  return self->_helperURL;
}

- (unsigned)minBatchSize
{
  return self->_minBatchSize;
}

- (unsigned)maxBatchSize
{
  return self->_maxBatchSize;
}

- (unint64_t)taskExpiration
{
  return self->_taskExpiration;
}

- (_DPDediscoDonation)donation
{
  return self->_donation;
}

- (NSData)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
}

- (NSData)encodedTaskConfig
{
  return self->_encodedTaskConfig;
}

- (void)setEncodedTaskConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTaskConfig, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_donation, 0);
  objc_storeStrong((id *)&self->_helperURL, 0);
  objc_storeStrong((id *)&self->_leaderURL, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end