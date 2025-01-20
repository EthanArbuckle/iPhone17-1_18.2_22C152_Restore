@interface GKPlayerActivityRelationshipAchievement
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivityRelationshipAchievement)initWithDictionary:(id)a3;
- (NSDate)timeStamp;
- (NSString)achDescription;
- (id)description;
- (int64_t)progress;
- (void)setAchDescription:(id)a3;
- (void)setProgress:(int64_t)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation GKPlayerActivityRelationshipAchievement

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GKPlayerActivityRelationshipAchievement_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_499 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_499, block);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_498;

  return v2;
}

void __66__GKPlayerActivityRelationshipAchievement_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipAchievement;
  v1 = objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v2 = (void *)[v1 mutableCopy];

  v6[0] = @"achDescription";
  v7[0] = objc_opt_class();
  v6[1] = @"timeStamp";
  v7[1] = objc_opt_class();
  v6[2] = @"progress";
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v2 addEntriesFromDictionary:v3];

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_498;
  secureCodedPropertyKeys_sSecureCodedKeys_498 = (uint64_t)v2;
}

- (GKPlayerActivityRelationshipAchievement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKPlayerActivityRelationshipAchievement;
  objc_super v5 = [(GKPlayerActivityRelationshipBase *)&v14 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"description"];
    [(GKPlayerActivityRelationshipAchievement *)v5 setAchDescription:v6];

    v7 = [v4 objectForKeyedSubscript:@"timestamp"];
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v7 doubleValue];
    v10 = (void *)[v8 initWithTimeIntervalSince1970:v9 / 1000.0];
    [(GKPlayerActivityRelationshipAchievement *)v5 setTimeStamp:v10];

    v11 = [v4 objectForKeyedSubscript:@"progress"];
    if (v11)
    {
      v12 = [v4 objectForKeyedSubscript:@"progress"];
      -[GKPlayerActivityRelationshipAchievement setProgress:](v5, "setProgress:", [v12 integerValue]);
    }
    else
    {
      [(GKPlayerActivityRelationshipAchievement *)v5 setProgress:100];
    }
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)GKPlayerActivityRelationshipAchievement;
  id v4 = [(GKPlayerActivityRelationshipBase *)&v10 description];
  objc_super v5 = [(GKPlayerActivityRelationshipAchievement *)self achDescription];
  v6 = [(GKPlayerActivityRelationshipAchievement *)self timeStamp];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKPlayerActivityRelationshipAchievement progress](self, "progress"));
  id v8 = [v3 stringWithFormat:@"%@ \ndescription: %@, \ntimeStamp: %@, \nprogress: %@", v4, v5, v6, v7];

  return v8;
}

- (NSString)achDescription
{
  return self->_achDescription;
}

- (void)setAchDescription:(id)a3
{
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);

  objc_storeStrong((id *)&self->_achDescription, 0);
}

@end