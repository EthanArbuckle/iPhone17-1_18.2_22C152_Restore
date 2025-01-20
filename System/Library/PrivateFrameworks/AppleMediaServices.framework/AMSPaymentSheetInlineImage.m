@interface AMSPaymentSheetInlineImage
+ (BOOL)supportsSecureCoding;
+ (id)textEncapsulationForServerValue:(id)a3;
- (AMSPaymentSheetAssetConfiguration)localAssetConfiguration;
- (AMSPaymentSheetInlineImage)initWithCoder:(id)a3;
- (AMSPaymentSheetInlineImage)initWithDictionary:(id)a3;
- (AMSPaymentSheetInlineImage)initWithURLString:(id)a3;
- (BOOL)isServerSupplied;
- (BOOL)tint;
- (NSString)URLString;
- (NSString)region;
- (NSString)value;
- (id)_imageAssetConfigurationForDictionary:(id)a3;
- (id)_symbolAssetConfigurationForDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_defaultAssetType;
- (int64_t)_ratingTypeForType:(id)a3;
- (int64_t)_scaleForString:(id)a3;
- (int64_t)imageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSPaymentSheetInlineImage

- (AMSPaymentSheetInlineImage)initWithURLString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSheetInlineImage;
  v5 = [(AMSPaymentSheetInlineImage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v6;

    v5->_imageType = 1;
  }

  return v5;
}

- (AMSPaymentSheetInlineImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSPaymentSheetInlineImage;
  v5 = [(AMSPaymentSheetInlineImage *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"type"];
    v5->_imageType = [(AMSPaymentSheetInlineImage *)v5 _ratingTypeForType:v6];
    v7 = [v6 uppercaseString];
    switch(v5->_imageType)
    {
      case 0:
      case 1:
      case 2:
      case 9:
        localAssetConfiguration = [v4 objectForKeyedSubscript:@"value"];
        v14 = [localAssetConfiguration uppercaseString];
        uint64_t v15 = [v14 copy];
        value = v5->_value;
        v5->_value = (NSString *)v15;

        goto LABEL_6;
      case 3:
        objc_storeStrong((id *)&v5->_region, v7);
        goto LABEL_3;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
LABEL_3:
        v8 = [v4 objectForKeyedSubscript:@"value"];
        objc_super v9 = [v8 uppercaseString];
        uint64_t v10 = [v9 copy];
        v11 = v5->_value;
        v5->_value = (NSString *)v10;

        uint64_t v12 = [(AMSPaymentSheetInlineImage *)v5 _imageAssetConfigurationForDictionary:v4];
        goto LABEL_4;
      case 0xALL:
        uint64_t v12 = [(AMSPaymentSheetInlineImage *)v5 _symbolAssetConfigurationForDictionary:v4];
LABEL_4:
        localAssetConfiguration = v5->_localAssetConfiguration;
        v5->_localAssetConfiguration = (AMSPaymentSheetAssetConfiguration *)v12;
LABEL_6:

        break;
      default:
        break;
    }
  }
  return v5;
}

+ (id)textEncapsulationForServerValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = @"TV-Y";
  if (([v3 isEqualToString:@"TV-Y"] & 1) == 0)
  {
    id v4 = @"TV-Y7";
    if (([v3 isEqualToString:@"TV-Y7"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"FV"])
      {
        id v4 = @"TV-Y7FV";
      }
      else
      {
        id v4 = @"TV-14";
        if (([v3 isEqualToString:@"TV-14"] & 1) == 0)
        {
          id v4 = @"TV-G";
          if (([v3 isEqualToString:@"TV-G"] & 1) == 0)
          {
            id v4 = @"TV-PG";
            if (([v3 isEqualToString:@"TV-PG"] & 1) == 0)
            {
              id v4 = @"TV-MA";
              if (([v3 isEqualToString:@"TV-MA"] & 1) == 0)
              {
                id v4 = @"D";
                if (([v3 isEqualToString:@"D"] & 1) == 0)
                {
                  id v4 = @"L";
                  if (([v3 isEqualToString:@"L"] & 1) == 0)
                  {
                    id v4 = @"S";
                    if (([v3 isEqualToString:@"S"] & 1) == 0)
                    {
                      id v4 = @"V";
                      if (([v3 isEqualToString:@"V"] & 1) == 0)
                      {
                        v5 = +[AMSLogConfig sharedConfig];
                        if (!v5)
                        {
                          v5 = +[AMSLogConfig sharedConfig];
                        }
                        uint64_t v6 = [v5 OSLogObject];
                        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v7 = objc_opt_class();
                          v8 = AMSLogKey();
                          int v10 = 138543874;
                          uint64_t v11 = v7;
                          __int16 v12 = 2114;
                          v13 = v8;
                          __int16 v14 = 2112;
                          id v15 = v3;
                          _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Failed to find text encapsulation mapping for: %@", (uint8_t *)&v10, 0x20u);
                        }
                        id v4 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)isServerSupplied
{
  return [(AMSPaymentSheetInlineImage *)self imageType] == 1;
}

- (BOOL)tint
{
  return (([(AMSPaymentSheetInlineImage *)self imageType] - 4) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_defaultAssetType
{
  return 0;
}

- (id)_imageAssetConfigurationForDictionary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AMSPaymentSheetInlineImage *)self _defaultAssetType];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"value"];

  uint64_t v7 = [v6 uppercaseString];

  switch([(AMSPaymentSheetInlineImage *)self imageType])
  {
    case 3:
      v8 = [(AMSPaymentSheetInlineImage *)self region];
      char v9 = [v8 isEqualToString:@"APPS-AUSTRALIA"];

      if (v9)
      {
        int v10 = @"Australia";
      }
      else
      {
        __int16 v12 = [(AMSPaymentSheetInlineImage *)self region];
        char v13 = [v12 isEqualToString:@"APPS-BRAZIL"];

        if (v13)
        {
          int v10 = @"Brazil";
        }
        else
        {
          __int16 v14 = [(AMSPaymentSheetInlineImage *)self region];
          char v15 = [v14 isEqualToString:@"APPS-FRANCE"];

          if (v15)
          {
            int v10 = @"France";
          }
          else
          {
            uint64_t v16 = [(AMSPaymentSheetInlineImage *)self region];
            int v17 = [v16 isEqualToString:@"APPS-KOREA"];

            int v10 = @"Korea";
            if (!v17) {
              int v10 = 0;
            }
          }
        }
      }
      uint64_t v11 = [NSString stringWithFormat:@"Rating-%@_%@", v10, v7];
      if (!v11) {
        goto LABEL_47;
      }
      goto LABEL_41;
    case 4:
      if ([v7 isEqualToString:@"G"])
      {
        uint64_t v11 = @"Rating-MPAA_G";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"GP"]) {
        goto LABEL_47;
      }
      if ([v7 isEqualToString:@"PG"])
      {
        uint64_t v11 = @"Rating-MPAA_PG";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"PG-13"])
      {
        uint64_t v11 = @"Rating-MPAA_PG13";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"M"]) {
        goto LABEL_47;
      }
      if ([v7 isEqualToString:@"R"])
      {
        uint64_t v11 = @"Rating-MPAA_R";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"NC-17"])
      {
        uint64_t v11 = @"Rating-MPAA_NC17";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"UNRATED"])
      {
        uint64_t v11 = @"Rating-MPAA_Unrated";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"NR"])
      {
        uint64_t v11 = @"Rating-MPAA_NR";
        goto LABEL_41;
      }
      v21 = @"X";
      goto LABEL_97;
    case 5:
      if ([v7 isEqualToString:@"CLEAN"])
      {
        uint64_t v11 = @"Rating-RIAA_Clean";
        goto LABEL_41;
      }
      if (([v7 isEqualToString:@"EXPLICIT"] & 1) == 0) {
        goto LABEL_47;
      }
      uint64_t v11 = @"Rating-RIAA_Explicit";
      goto LABEL_41;
    case 6:
      if ([v7 isEqualToString:@"G"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_G";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"PG"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_PG";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"M"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_M";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"R13"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_R13";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"R15"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_R15";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"R16"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_R16";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"R18"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_R18";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"RP13"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_RP13";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"RP16"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_RP16";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"R"])
      {
        uint64_t v11 = @"Rating-Movie_NZ_R";
        goto LABEL_41;
      }
      v20 = @"NOT RATED";
      goto LABEL_95;
    case 7:
      if ([v7 isEqualToString:@"U"])
      {
        uint64_t v11 = @"Rating-Movie_UK_U";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"UC"]) {
        goto LABEL_47;
      }
      if ([v7 isEqualToString:@"PG"])
      {
        uint64_t v11 = @"Rating-Movie_UK_PG";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"12"])
      {
        uint64_t v11 = @"Rating-Movie_UK_12";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"12A"])
      {
        uint64_t v11 = @"Rating-Movie_UK_12A";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"15"])
      {
        uint64_t v11 = @"Rating-Movie_UK_15";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"18"])
      {
        uint64_t v11 = @"Rating-Movie_UK_18";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"18R"])
      {
        uint64_t v11 = @"Rating-Movie_UK_R18";
        goto LABEL_41;
      }
      if (([v7 isEqualToString:@"E"] & 1) == 0)
      {
        v20 = @"TBC";
LABEL_95:
        if (([v7 isEqualToString:v20] & 1) == 0)
        {
          v21 = @"UNRATED";
LABEL_97:
          [v7 isEqualToString:v21];
        }
      }
      goto LABEL_47;
    case 8:
      if ([v7 isEqualToString:@"TV-Y"])
      {
        uint64_t v11 = @"Rating-TV_US_Y";
LABEL_41:
        objc_super v18 = -[AMSPaymentSheetImageAssetConfiguration initWithFilename:size:type:]([AMSPaymentSheetImageAssetConfiguration alloc], "initWithFilename:size:type:", v11, v5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

        goto LABEL_48;
      }
      if ([v7 isEqualToString:@"TV-Y7"])
      {
        uint64_t v11 = @"Rating-TV_US_Y7";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"FV"])
      {
        uint64_t v11 = @"Rating-TV_US_Y7FV";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"TV-14"])
      {
        uint64_t v11 = @"Rating-TV_US_14";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"TV-G"])
      {
        uint64_t v11 = @"Rating-TV_US_G";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"TV-PG"])
      {
        uint64_t v11 = @"Rating-TV_US_PG";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"TV-MA"])
      {
        uint64_t v11 = @"Rating-TV_US_MA";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"D"])
      {
        uint64_t v11 = @"Rating-TV_US_D";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"L"])
      {
        uint64_t v11 = @"Rating-TV_US_L";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"S"])
      {
        uint64_t v11 = @"Rating-TV_US_S";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"V"])
      {
        uint64_t v11 = @"Rating-TV_US_V";
        goto LABEL_41;
      }
LABEL_47:
      objc_super v18 = 0;
LABEL_48:

      return v18;
    default:
      goto LABEL_47;
  }
}

- (int64_t)_ratingTypeForType:(id)a3
{
  id v3 = [a3 uppercaseString];
  if (([v3 isEqualToString:@"APPS-AUSTRALIA"] & 1) != 0
    || ([v3 isEqualToString:@"APPS-FRANCE"] & 1) != 0
    || ([v3 isEqualToString:@"APPS-KOREA"] & 1) != 0
    || ([v3 isEqualToString:@"APPS-BRAZIL"] & 1) != 0)
  {
    int64_t v4 = 3;
  }
  else if (([v3 isEqualToString:@"GAMES"] & 1) != 0 {
         || ([v3 isEqualToString:@"ITUNESGAMES"] & 1) != 0
  }
         || ([v3 isEqualToString:@"ITUNES-GAMES"] & 1) != 0)
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"NZ-OFLC"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"BBFC"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"MPAA"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"RIAA"])
  {
    int64_t v4 = 5;
  }
  else if (([v3 isEqualToString:@"TV-US"] & 1) != 0 {
         || ([v3 isEqualToString:@"US-TV"] & 1) != 0
  }
         || ([v3 isEqualToString:@"TV"] & 1) != 0)
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"PAYMENTTYPE"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYMBOL"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_scaleForString:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isEqualToString:@"small"] & 1) == 0)
  {
    if (([v4 isEqualToString:@"medium"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"large"])
      {
        int64_t v5 = 2;
        goto LABEL_28;
      }
      BOOL v6 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v7 = +[AMSLogConfig sharedPurchaseConfig];
      v8 = (void *)v7;
      if (v6)
      {
        if (!v7)
        {
          v8 = +[AMSLogConfig sharedConfig];
        }
        char v9 = [v8 OSLogObject];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = AMSLogKey();
          uint64_t v11 = NSString;
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = v12;
          if (v10)
          {
            AMSLogKey();
            self = (AMSPaymentSheetInlineImage *)objc_claimAutoreleasedReturnValue();
            [v11 stringWithFormat:@"%@: [%@] ", v13, self];
          }
          else
          {
            [v11 stringWithFormat:@"%@: ", v12];
          __int16 v14 = };
          v21 = AMSHashIfNeeded(v4);
          *(_DWORD *)buf = 138543618;
          v25 = v14;
          __int16 v26 = 2114;
          v27 = v21;
          _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected image scale: %{public}@", buf, 0x16u);
          if (v10)
          {

            __int16 v14 = self;
          }
        }
        v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        char v15 = +[AMSLogConfig sharedPurchaseConfig];
        [v8 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v15 userInfo:0];
      }
      else
      {
        if (!v7)
        {
          v8 = +[AMSLogConfig sharedConfig];
        }
        char v15 = [v8 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          uint64_t v16 = AMSLogKey();
          int v17 = NSString;
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = v18;
          if (v16)
          {
            AMSLogKey();
            self = (AMSPaymentSheetInlineImage *)objc_claimAutoreleasedReturnValue();
            [v17 stringWithFormat:@"%@: [%@] ", v19, self];
          }
          else
          {
            [v17 stringWithFormat:@"%@: ", v18];
          v20 = };
          v22 = AMSHashIfNeeded(v4);
          *(_DWORD *)buf = 138543618;
          v25 = v20;
          __int16 v26 = 2114;
          v27 = v22;
          _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_FAULT, "%{public}@Unexpected image scale: %{public}@", buf, 0x16u);
          if (v16)
          {

            v20 = self;
          }
        }
      }
    }
    int64_t v5 = 1;
    goto LABEL_28;
  }
  int64_t v5 = 0;
LABEL_28:

  return v5;
}

- (id)_symbolAssetConfigurationForDictionary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 objectForKeyedSubscript:@"accessibilityText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = [v4 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  char v9 = [v4 objectForKeyedSubscript:@"scale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  int64_t v11 = [(AMSPaymentSheetInlineImage *)self _scaleForString:v10];
  if (v8) {
    uint64_t v12 = [[AMSPaymentSheetSymbolAssetConfiguration alloc] initWithName:v8 accessibilityText:v6 scale:v11];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[AMSPaymentSheetInlineImage allocWithZone:](AMSPaymentSheetInlineImage, "allocWithZone:") init];
  v5->_imageType = [(AMSPaymentSheetInlineImage *)self imageType];
  id v6 = [(AMSPaymentSheetInlineImage *)self URLString];
  uint64_t v7 = [v6 copyWithZone:a3];
  URLString = v5->_URLString;
  v5->_URLString = (NSString *)v7;

  char v9 = [(AMSPaymentSheetInlineImage *)self value];
  uint64_t v10 = [v9 copyWithZone:a3];
  value = v5->_value;
  v5->_value = (NSString *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetInlineImage imageType](self, "imageType"), @"imagetype");
  int64_t v5 = [(AMSPaymentSheetInlineImage *)self URLString];
  [v4 encodeObject:v5 forKey:@"URLString"];

  id v6 = [(AMSPaymentSheetInlineImage *)self value];
  [v4 encodeObject:v6 forKey:@"value"];

  id v7 = [(AMSPaymentSheetInlineImage *)self localAssetConfiguration];
  [v4 encodeObject:v7 forKey:@"localAssetConfiguration"];
}

- (AMSPaymentSheetInlineImage)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSPaymentSheetInlineImage;
  int64_t v5 = [(AMSPaymentSheetInlineImage *)&v16 init];
  if (v5)
  {
    v5->_imageType = [v4 decodeIntegerForKey:@"imagetype"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLString"];
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    int64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    uint64_t v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"localAssetConfiguration"];
    localAssetConfiguration = v5->_localAssetConfiguration;
    v5->_localAssetConfiguration = (AMSPaymentSheetAssetConfiguration *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSPaymentSheetAssetConfiguration)localAssetConfiguration
{
  return self->_localAssetConfiguration;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_localAssetConfiguration, 0);
}

@end