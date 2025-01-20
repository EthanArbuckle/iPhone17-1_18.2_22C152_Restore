@interface HMCameraClip
+ (BOOL)supportsSecureCoding;
+ (id)requiredHTTPHeadersForStreamingAssetVersion:(id)a3;
+ (id)shortDescription;
- (BOOL)canAskForUserFeedback;
- (BOOL)isComplete;
- (BOOL)isDonated;
- (BOOL)isEqual:(id)a3;
- (HMCameraClip)initWithCoder:(id)a3;
- (HMCameraClip)initWithUniqueIdentifier:(id)a3 startDate:(id)a4 duration:(double)a5 targetFragmentDuration:(double)a6 isComplete:(BOOL)a7 isDonated:(BOOL)a8 quality:(int64_t)a9 streamingAssetVersion:(id)a10 encryptionContext:(id)a11 videoSegments:(id)a12 significantEvents:(id)a13;
- (HMCameraClipEncryptionContext)encryptionContext;
- (NSArray)attributeDescriptions;
- (NSArray)videoDataSegments;
- (NSArray)videoSegments;
- (NSData)encryptionKey;
- (NSDate)startDate;
- (NSDictionary)videoAssetRequiredHTTPHeaders;
- (NSSet)significantEvents;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)streamingAssetVersion;
- (NSUUID)uniqueIdentifier;
- (double)duration;
- (double)targetFragmentDuration;
- (int64_t)quality;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
  objc_storeStrong((id *)&self->_streamingAssetVersion, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSArray)videoSegments
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (HMCameraClipEncryptionContext)encryptionContext
{
  return (HMCameraClipEncryptionContext *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)streamingAssetVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSSet)significantEvents
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (int64_t)quality
{
  return self->_quality;
}

- (BOOL)isDonated
{
  return self->_donated;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMCameraClip *)self uniqueIdentifier];
  v6 = (void *)[v4 initWithName:@"ID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMCameraClip *)self startDate];
  v9 = (void *)[v7 initWithName:@"Start Date" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = NSNumber;
  [(HMCameraClip *)self duration];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)[v10 initWithName:@"Duration" value:v12];
  [v3 addObject:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = NSNumber;
  [(HMCameraClip *)self targetFragmentDuration];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)[v14 initWithName:@"Target Fragment Duration" value:v16];
  [v3 addObject:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMCameraClip *)self isComplete];
  v19 = HMFBooleanToString();
  v20 = (void *)[v18 initWithName:@"Complete" value:v19];
  [v3 addObject:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = HMStringFromCameraClipQuality([(HMCameraClip *)self quality]);
  v23 = (void *)[v21 initWithName:@"Quality" value:v22];
  [v3 addObject:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = NSNumber;
  v26 = [(HMCameraClip *)self videoSegments];
  v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
  v28 = (void *)[v24 initWithName:@"Video Segments Count" value:v27];
  [v3 addObject:v28];

  v29 = [(HMCameraClip *)self significantEvents];
  v30 = objc_msgSend(v29, "na_map:", &__block_literal_global_76);

  id v31 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = [v30 allObjects];
  v33 = [v32 componentsJoinedByString:@","];
  v34 = (void *)[v31 initWithName:@"Significant Events" value:v33];
  [v3 addObject:v34];

  v35 = (void *)[v3 copy];

  return (NSArray *)v35;
}

__CFString *__37__HMCameraClip_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 reason];

  return HMStringFromCameraSignificantEventReason(v2);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  uint64_t v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMCameraClip)initWithCoder:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMCC.ck.uuid"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMCC.ck.st"];
  [v3 decodeDoubleForKey:@"HMCC.ck.d"];
  double v7 = v6;
  [v3 decodeDoubleForKey:@"HMCC.ck.tfd"];
  double v9 = v8;
  unsigned int v28 = [v3 decodeBoolForKey:@"HMCC.ck.ic"];
  uint64_t v10 = [v3 decodeBoolForKey:@"HMCC.ck.id"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"HMCC.ck.q"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMCC.ck.sav"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HMCC.ck.ec"];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"HMCC.ck.vs"];

  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  id v21 = [v3 decodeObjectOfClasses:v20 forKey:@"HMCC.ck.se"];

  if (v4 && v5 && v12 && v13 && v17 && v21)
  {
    v22 = [(HMCameraClip *)self initWithUniqueIdentifier:v4 startDate:v5 duration:v28 targetFragmentDuration:v10 isComplete:v11 isDonated:v12 quality:v7 streamingAssetVersion:v9 encryptionContext:v13 videoSegments:v17 significantEvents:v21];
    v23 = v22;
  }
  else
  {
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = v30 = v24;
      *(_DWORD *)buf = 138544898;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v4;
      __int16 v35 = 2112;
      v36 = v5;
      __int16 v37 = 2112;
      v38 = v12;
      __int16 v39 = 2112;
      v40 = v13;
      __int16 v41 = 2112;
      v42 = v17;
      __int16 v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uuid: %@ startDate: %@ streamingAssetVersion: %@ encryptionContext: %@ videoSegments: %@ significantEvents: %@", buf, 0x48u);

      id v24 = v30;
    }

    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCameraClip *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"HMCC.ck.uuid"];

  double v6 = [(HMCameraClip *)self startDate];
  [v4 encodeObject:v6 forKey:@"HMCC.ck.st"];

  [(HMCameraClip *)self duration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMCC.ck.d");
  [(HMCameraClip *)self targetFragmentDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HMCC.ck.tfd");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraClip isComplete](self, "isComplete"), @"HMCC.ck.ic");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraClip isDonated](self, "isDonated"), @"HMCC.ck.id");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClip quality](self, "quality"), @"HMCC.ck.q");
  double v7 = [(HMCameraClip *)self streamingAssetVersion];
  [v4 encodeObject:v7 forKey:@"HMCC.ck.sav"];

  double v8 = [(HMCameraClip *)self encryptionContext];
  [v4 encodeObject:v8 forKey:@"HMCC.ck.ec"];

  double v9 = [(HMCameraClip *)self videoSegments];
  [v4 encodeObject:v9 forKey:@"HMCC.ck.vs"];

  id v10 = [(HMCameraClip *)self significantEvents];
  [v4 encodeObject:v10 forKey:@"HMCC.ck.se"];
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMCameraClip *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    double v7 = [(HMCameraClip *)self uniqueIdentifier];
    double v8 = [v6 uniqueIdentifier];
    if ([v7 isEqual:v8])
    {
      double v9 = [(HMCameraClip *)self startDate];
      id v10 = [v6 startDate];
      if (![v9 isEqualToDate:v10]) {
        goto LABEL_18;
      }
      [(HMCameraClip *)self duration];
      double v12 = v11;
      [v6 duration];
      if (v12 != v13) {
        goto LABEL_18;
      }
      [(HMCameraClip *)self targetFragmentDuration];
      double v15 = v14;
      [v6 targetFragmentDuration];
      if (v15 == v16
        && (int v17 = -[HMCameraClip isComplete](self, "isComplete"), v17 == [v6 isComplete])
        && (int v18 = -[HMCameraClip isDonated](self, "isDonated"), v18 == [v6 isDonated])
        && (int64_t v19 = -[HMCameraClip quality](self, "quality"), v19 == [v6 quality]))
      {
        v20 = [(HMCameraClip *)self streamingAssetVersion];
        id v21 = [v6 streamingAssetVersion];
        if ([v20 isEqualToString:v21])
        {
          v22 = [(HMCameraClip *)self encryptionContext];
          v32 = [v6 encryptionContext];
          __int16 v33 = v22;
          if ([v22 isEqual:v32])
          {
            uint64_t v23 = [(HMCameraClip *)self videoSegments];
            uint64_t v24 = [v6 videoSegments];
            id v31 = (void *)v23;
            v25 = (void *)v23;
            v26 = (void *)v24;
            if ([v25 isEqualToArray:v24])
            {
              v30 = [(HMCameraClip *)self significantEvents];
              v29 = [v6 significantEvents];
              char v27 = [v30 isEqualToSet:v29];
            }
            else
            {
              char v27 = 0;
            }
          }
          else
          {
            char v27 = 0;
          }
        }
        else
        {
          char v27 = 0;
        }
      }
      else
      {
LABEL_18:
        char v27 = 0;
      }
    }
    else
    {
      char v27 = 0;
    }
  }
  else
  {
    char v27 = 0;
  }

  return v27;
}

- (NSArray)videoDataSegments
{
  uint64_t v2 = [(HMCameraClip *)self videoSegments];
  unint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_8871);

  return (NSArray *)v3;
}

id __33__HMCameraClip_videoDataSegments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)canAskForUserFeedback
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMCameraClip *)self significantEvents];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HMCameraClip *)self significantEvents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) canAskForUserFeedback])
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (NSData)encryptionKey
{
  id v2 = [(HMCameraClip *)self encryptionContext];
  unint64_t v3 = [v2 key];

  return (NSData *)v3;
}

- (NSDictionary)videoAssetRequiredHTTPHeaders
{
  unint64_t v3 = objc_opt_class();
  uint64_t v4 = [(HMCameraClip *)self streamingAssetVersion];
  v5 = [v3 requiredHTTPHeadersForStreamingAssetVersion:v4];

  return (NSDictionary *)v5;
}

- (HMCameraClip)initWithUniqueIdentifier:(id)a3 startDate:(id)a4 duration:(double)a5 targetFragmentDuration:(double)a6 isComplete:(BOOL)a7 isDonated:(BOOL)a8 quality:(int64_t)a9 streamingAssetVersion:(id)a10 encryptionContext:(id)a11 videoSegments:(id)a12 significantEvents:(id)a13
{
  id v21 = a3;
  id v38 = a4;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v39.receiver = self;
  v39.super_class = (Class)HMCameraClip;
  v26 = [(HMCameraClip *)&v39 init];
  if (v26)
  {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v21);
    uniqueIdentifier = v26->_uniqueIdentifier;
    v26->_uniqueIdentifier = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_startDate, a4);
    v26->_duration = a5;
    v26->_targetFragmentDuration = a6;
    v26->_complete = a7;
    v26->_donated = a8;
    v26->_quality = a9;
    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v22);
    streamingAssetVersion = v26->_streamingAssetVersion;
    v26->_streamingAssetVersion = (NSString *)v29;

    uint64_t v31 = [v23 copy];
    encryptionContext = v26->_encryptionContext;
    v26->_encryptionContext = (HMCameraClipEncryptionContext *)v31;

    uint64_t v33 = [v24 copy];
    videoSegments = v26->_videoSegments;
    v26->_videoSegments = (NSArray *)v33;

    uint64_t v35 = [v25 copy];
    significantEvents = v26->_significantEvents;
    v26->_significantEvents = (NSSet *)v35;
  }
  return v26;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requiredHTTPHeadersForStreamingAssetVersion:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"x-apple-sa-version";
  v8[0] = a3;
  unint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end