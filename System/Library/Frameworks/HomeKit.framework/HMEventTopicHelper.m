@interface HMEventTopicHelper
+ (id)decodeTopic:(id)a3;
@end

@implementation HMEventTopicHelper

+ (id)decodeTopic:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x19F3A64A0]();
  v5 = [[HMParsedEventTopic alloc] initWithTopic:v3];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  uint64_t v7 = [v6 scanLocation];
  id v52 = 0;
  int v8 = [v6 scanUpToString:@"." intoString:&v52];
  id v9 = v52;
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if ([v9 isEqualToString:@"index"])
    {
      [(HMParsedEventTopic *)v5 setIsIndexTopic:1];
      if ([v6 isAtEnd]) {
        goto LABEL_43;
      }
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      id v51 = 0;
      [v6 scanUpToString:@"." intoString:&v51];
      id v10 = v51;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
    if ([v10 isEqualToString:@"home"])
    {
      if ([v6 isAtEnd]) {
        goto LABEL_42;
      }
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      id v50 = 0;
      [v6 scanUpToString:@"." intoString:&v50];
      id v10 = v50;
      if (!v10) {
        goto LABEL_42;
      }
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];

      v12 = (void *)v13;
    }
    if (!v12) {
      goto LABEL_41;
    }
    v14 = (void *)[v12 copy];
    [(HMParsedEventTopic *)v5 setHomeUUID:v14];

    if ([v6 isAtEnd]) {
      goto LABEL_42;
    }
    objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);
    uint64_t v7 = [v6 scanLocation];

    id v49 = 0;
    int v15 = [v6 scanUpToString:@"." intoString:&v49];
    id v16 = v49;
    id v10 = v16;
    if (!v15 || !v16) {
      goto LABEL_41;
    }

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
    if (([v10 isEqualToString:@"accessory"] & 1) == 0 && !v12)
    {
      if (([v10 isEqualToString:@"user"] & 1) == 0)
      {
        if (![v10 isEqualToString:@"mediagroup"])
        {
          v12 = 0;
LABEL_41:
          [v6 setScanLocation:v7];
          goto LABEL_42;
        }
        [v6 scanLocation];
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

        id v45 = 0;
        int v17 = [v6 scanUpToString:@"." intoString:&v45];
        id v18 = v45;
        id v10 = v18;
        v12 = 0;
        if (!v17 || !v18) {
          goto LABEL_42;
        }
        if (([v18 isEqualToString:@"stereo"] & 1) != 0
          || [v10 isEqualToString:@"psg"])
        {
          char v19 = [v10 isEqualToString:@"psg"];
          if (([v6 isAtEnd] & 1) == 0)
          {
            [v6 scanLocation];
            objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

            id v44 = 0;
            int v20 = [v6 scanUpToString:@"." intoString:&v44];
            id v21 = v44;
            id v10 = v21;
            v12 = 0;
            if (!v20 || !v21) {
              goto LABEL_42;
            }
            if (([v6 isAtEnd] & 1) == 0)
            {
              v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
              v12 = v22;
              if (v22)
              {
                v23 = (void *)[v22 copy];
                char v40 = v19;
                if (v19) {
                  [(HMParsedEventTopic *)v5 setMediaGroupUUID:v23];
                }
                else {
                  [(HMParsedEventTopic *)v5 setMediaSystemUUID:v23];
                }

                uint64_t v7 = [v6 scanLocation];
                objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

                id v43 = 0;
                int v36 = [v6 scanUpToString:@"." intoString:&v43];
                id v37 = v43;
                id v10 = v37;
                if (!v36 || ![v37 isEqualToString:@"settings"]) {
                  goto LABEL_41;
                }
                if ([v6 isAtEnd]) {
                  goto LABEL_42;
                }
                objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

                id v42 = 0;
                int v38 = [v6 scanUpToString:&stru_1EEE9DD88 intoString:&v42];
                id v39 = v42;
                id v10 = v39;
                if (!v38 || ![v39 hasSuffix:@".updated"]) {
                  goto LABEL_41;
                }
                v34 = -[NSString stringByTrimmingDots](v10);
                v35 = [v34 stringByDeletingPathExtension];
                if (v40) {
                  [(HMParsedEventTopic *)v5 setMediaGroupSettingKeyPath:v35];
                }
                else {
                  [(HMParsedEventTopic *)v5 setMediaSystemSettingKeyPath:v35];
                }
                goto LABEL_57;
              }
              goto LABEL_42;
            }
          }
        }
      }
LABEL_39:
      v12 = 0;
      goto LABEL_42;
    }
    if (!v12)
    {
      if ([v6 isAtEnd]) {
        goto LABEL_39;
      }
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      id v48 = 0;
      [v6 scanUpToString:@"." intoString:&v48];
      id v10 = v48;
      if (!v10) {
        goto LABEL_39;
      }
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      if (!v12) {
        goto LABEL_42;
      }
    }
    v24 = (void *)[v12 copy];
    [(HMParsedEventTopic *)v5 setAccessoryUUID:v24];

    if (([v6 isAtEnd] & 1) == 0)
    {
      uint64_t v7 = [v6 scanLocation];
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      if (![(HMParsedEventTopic *)v5 isIndexTopic])
      {
        id v47 = 0;
        int v30 = [v6 scanUpToString:@"." intoString:&v47];
        id v31 = v47;
        id v10 = v31;
        if (!v30 || !v31) {
          goto LABEL_42;
        }
        if (![v31 isEqualToString:@"settings"]) {
          goto LABEL_41;
        }
        if ([v6 isAtEnd]) {
          goto LABEL_42;
        }
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

        id v46 = 0;
        int v32 = [v6 scanUpToString:&stru_1EEE9DD88 intoString:&v46];
        id v33 = v46;
        id v10 = v33;
        if (!v32 || ![v33 hasSuffix:@".updated"]) {
          goto LABEL_41;
        }
        v34 = -[NSString stringByTrimmingDots](v10);
        v35 = [v34 stringByDeletingPathExtension];
        [(HMParsedEventTopic *)v5 setAccessorySettingKeyPath:v35];
LABEL_57:

        goto LABEL_41;
      }
      id v10 = 0;
    }
LABEL_42:
  }
LABEL_43:
  if ([v6 isAtEnd])
  {
    v25 = 0;
  }
  else
  {
    id v41 = 0;
    int v26 = [v6 scanUpToString:&stru_1EEE9DD88 intoString:&v41];
    id v27 = v41;
    v25 = v27;
    if (v26)
    {
      v28 = -[NSString stringByTrimmingDots](v27);
      [(HMParsedEventTopic *)v5 setTopicSuffix:v28];
    }
  }

  return v5;
}

@end