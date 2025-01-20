@interface GKFriendActivityInternal
+ (id)secureCodedPropertyKeys;
- (GKFriendActivityInternal)initWithServerRepresentation:(id)a3;
- (NSDate)timestamp;
- (NSString)context;
- (NSString)imageURL;
- (NSString)playerID;
- (void)setContext:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation GKFriendActivityInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_620 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_620, &__block_literal_global_622);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_619;

  return v2;
}

void __51__GKFriendActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"playerID";
  v3[0] = objc_opt_class();
  v2[1] = @"context";
  v3[1] = objc_opt_class();
  v2[2] = @"imageURL";
  v3[2] = objc_opt_class();
  v2[3] = @"timestamp";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_619;
  secureCodedPropertyKeys_sSecureCodedKeys_619 = v0;
}

- (GKFriendActivityInternal)initWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKFriendActivityInternal;
  v5 = [(GKFriendActivityInternal *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"player-id"];
    [(GKFriendActivityInternal *)v5 setPlayerID:v6];

    v7 = [v4 objectForKeyedSubscript:@"context"];
    [(GKFriendActivityInternal *)v5 setContext:v7];

    v8 = [v4 objectForKeyedSubscript:@"image-url"];
    [(GKFriendActivityInternal *)v5 setImageURL:v8];

    v9 = (void *)MEMORY[0x1E4F1C9C8];
    v10 = [v4 objectForKeyedSubscript:@"timestamp"];
    v11 = [v9 _gkDateFromServerTimestamp:v10];
    [(GKFriendActivityInternal *)v5 setTimestamp:v11];
  }
  return v5;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end