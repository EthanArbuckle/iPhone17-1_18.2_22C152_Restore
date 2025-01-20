@interface GKArtworkMetadata
+ (id)secureCodedPropertyKeys;
- (GKArtworkMetadata)initWithTemplateURL:(id)a3 width:(id)a4 height:(id)a5 textColor1:(id)a6 textColor2:(id)a7 textColor3:(id)a8 textColor4:(id)a9 backgroundColor:(id)a10;
- (NSNumber)height;
- (NSNumber)width;
- (NSString)backgroundColor;
- (NSString)templateURL;
- (NSString)textColor1;
- (NSString)textColor2;
- (NSString)textColor3;
- (NSString)textColor4;
@end

@implementation GKArtworkMetadata

- (GKArtworkMetadata)initWithTemplateURL:(id)a3 width:(id)a4 height:(id)a5 textColor1:(id)a6 textColor2:(id)a7 textColor3:(id)a8 textColor4:(id)a9 backgroundColor:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GKArtworkMetadata;
  v18 = [(GKArtworkMetadata *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_templateURL, a3);
    objc_storeStrong((id *)&v19->_width, a4);
    objc_storeStrong((id *)&v19->_height, a5);
    objc_storeStrong((id *)&v19->_textColor1, a6);
    objc_storeStrong((id *)&v19->_textColor2, a7);
    objc_storeStrong((id *)&v19->_textColor3, a8);
    objc_storeStrong((id *)&v19->_textColor4, a9);
    objc_storeStrong((id *)&v19->_backgroundColor, a10);
  }

  return v19;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_20 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_20, &__block_literal_global_60);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_20;

  return v2;
}

void __44__GKArtworkMetadata_secureCodedPropertyKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"templateURL";
  v3[0] = objc_opt_class();
  v2[1] = @"textColor1";
  v3[1] = objc_opt_class();
  v2[2] = @"textColor2";
  v3[2] = objc_opt_class();
  v2[3] = @"textColor3";
  v3[3] = objc_opt_class();
  v2[4] = @"textColor4";
  v3[4] = objc_opt_class();
  v2[5] = @"backgroundColor";
  v3[5] = objc_opt_class();
  v2[6] = @"width";
  v3[6] = objc_opt_class();
  v2[7] = @"height";
  v3[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_20;
  secureCodedPropertyKeys_sSecureCodedKeys_20 = v0;
}

- (NSString)templateURL
{
  return self->_templateURL;
}

- (NSNumber)width
{
  return self->_width;
}

- (NSNumber)height
{
  return self->_height;
}

- (NSString)textColor1
{
  return self->_textColor1;
}

- (NSString)textColor2
{
  return self->_textColor2;
}

- (NSString)textColor3
{
  return self->_textColor3;
}

- (NSString)textColor4
{
  return self->_textColor4;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor4, 0);
  objc_storeStrong((id *)&self->_textColor3, 0);
  objc_storeStrong((id *)&self->_textColor2, 0);
  objc_storeStrong((id *)&self->_textColor1, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);

  objc_storeStrong((id *)&self->_templateURL, 0);
}

@end