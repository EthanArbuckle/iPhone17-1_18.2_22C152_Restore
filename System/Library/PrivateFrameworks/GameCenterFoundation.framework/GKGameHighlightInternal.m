@interface GKGameHighlightInternal
+ (id)secureCodedPropertyKeys;
- (ASCArtwork)artwork;
- (NSNumber)adamID;
- (NSString)subtitle;
- (NSString)title;
- (void)setAdamID:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKGameHighlightInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_353 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_353, &__block_literal_global_355_0);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_352;

  return v2;
}

void __50__GKGameHighlightInternal_secureCodedPropertyKeys__block_invoke()
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"adamID";
  v10[0] = objc_opt_class();
  v9[1] = @"artwork";
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getASCArtworkClass_softClass;
  uint64_t v8 = getASCArtworkClass_softClass;
  if (!getASCArtworkClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getASCArtworkClass_block_invoke;
    v4[3] = &unk_1E646F430;
    v4[4] = &v5;
    __getASCArtworkClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v10[1] = objc_opt_class();
  v9[2] = @"title";
  v10[2] = objc_opt_class();
  v9[3] = @"subtitle";
  v10[3] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_352;
  secureCodedPropertyKeys_sSecureCodedKeys_352 = v2;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  self->_adamID = (NSNumber *)a3;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end