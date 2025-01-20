@interface AMSUIFontParser
+ (id)fontTextStyleForString:(id)a3;
+ (id)fontWithDictionary:(id)a3;
+ (id)fontWithDictionary:(id)a3 compatibleWith:(id)a4;
+ (id)systemDesignForString:(id)a3;
+ (id)weightForString:(id)a3;
@end

@implementation AMSUIFontParser

+ (id)fontWithDictionary:(id)a3
{
  return (id)[a1 fontWithDictionary:a3 compatibleWith:0];
}

+ (id)fontWithDictionary:(id)a3 compatibleWith:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F277F8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    v11 = [v6 objectForKeyedSubscript:*MEMORY[0x263F27808]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = [v6 objectForKeyedSubscript:*MEMORY[0x263F27800]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = [v6 objectForKeyedSubscript:*MEMORY[0x263F27810]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    v17 = &unk_26CC735C8;
    if (v9) {
      v17 = v9;
    }
    id v18 = v17;

    v19 = +[AMSUIFontParser fontTextStyleForString:v12];
    v20 = +[AMSUIFontParser systemDesignForString:v14];
    if (v19)
    {
      id v37 = v14;
      v21 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v19 compatibleWithTraitCollection:v7];
      v22 = v21;
      if (v20)
      {
        uint64_t v23 = [v21 fontDescriptorWithDesign:v20];

        v22 = (void *)v23;
      }
      uint64_t v24 = [a1 weightForString:v16];
      v25 = (void *)v24;
      if (v16)
      {
        uint64_t v26 = *MEMORY[0x263F817A0];
        uint64_t v39 = v24;
        uint64_t v40 = v26;
        uint64_t v38 = *MEMORY[0x263F81850];
        id v36 = v18;
        v27 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v41[0] = v27;
        v28 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
        [v22 fontDescriptorByAddingAttributes:v28];
        id v35 = v16;
        v29 = v25;
        id v30 = v12;
        v32 = id v31 = v7;

        id v18 = v36;
        v22 = (void *)v32;
        id v7 = v31;
        id v12 = v30;
        v25 = v29;
        id v16 = v35;
      }
      v33 = (void *)MEMORY[0x263F81708];
      objc_msgSend(v18, "doubleValue", v35);
      v10 = objc_msgSend(v33, "fontWithDescriptor:size:", v22);

      id v14 = v37;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fontTextStyleForString:(id)a3
{
  v18[11] = *MEMORY[0x263EF8340];
  v3 = [a3 lowercaseString];
  uint64_t v4 = *MEMORY[0x263F835E0];
  v17[0] = @"largetitle";
  v17[1] = @"title1";
  uint64_t v5 = *MEMORY[0x263F83610];
  v18[0] = v4;
  v18[1] = v5;
  uint64_t v6 = *MEMORY[0x263F83618];
  v17[2] = @"title2";
  v17[3] = @"title3";
  uint64_t v7 = *MEMORY[0x263F83628];
  v18[2] = v6;
  v18[3] = v7;
  uint64_t v8 = *MEMORY[0x263F835D0];
  v17[4] = @"headline";
  v17[5] = @"subheadline";
  uint64_t v9 = *MEMORY[0x263F835F0];
  v18[4] = v8;
  v18[5] = v9;
  uint64_t v10 = *MEMORY[0x263F83570];
  v17[6] = @"body";
  v17[7] = @"callout";
  uint64_t v11 = *MEMORY[0x263F83580];
  v18[6] = v10;
  v18[7] = v11;
  uint64_t v12 = *MEMORY[0x263F835B8];
  v17[8] = @"footnote";
  v17[9] = @"caption1";
  uint64_t v13 = *MEMORY[0x263F83588];
  v18[8] = v12;
  v18[9] = v13;
  v17[10] = @"caption2";
  v18[10] = *MEMORY[0x263F83590];
  id v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:11];
  v15 = [v14 objectForKeyedSubscript:v3];

  return v15;
}

+ (id)systemDesignForString:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  v3 = [a3 lowercaseString];
  uint64_t v4 = *MEMORY[0x263F81778];
  v10[0] = @"default";
  v10[1] = @"rounded";
  uint64_t v5 = *MEMORY[0x263F81788];
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = @"serif";
  v10[3] = @"monospaced";
  uint64_t v6 = *MEMORY[0x263F81780];
  v11[2] = *MEMORY[0x263F81790];
  v11[3] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  uint64_t v8 = [v7 objectForKeyedSubscript:v3];

  return v8;
}

+ (id)weightForString:(id)a3
{
  v17[9] = *MEMORY[0x263EF8340];
  v15 = [a3 lowercaseString];
  v16[0] = @"ultralight";
  v3 = [NSNumber numberWithDouble:*MEMORY[0x263F81860]];
  v17[0] = v3;
  v16[1] = @"thin";
  uint64_t v4 = [NSNumber numberWithDouble:*MEMORY[0x263F81848]];
  v17[1] = v4;
  v16[2] = @"light";
  uint64_t v5 = [NSNumber numberWithDouble:*MEMORY[0x263F81818]];
  v17[2] = v5;
  v16[3] = @"regular";
  uint64_t v6 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
  v17[3] = v6;
  v16[4] = @"medium";
  uint64_t v7 = [NSNumber numberWithDouble:*MEMORY[0x263F81828]];
  v17[4] = v7;
  v16[5] = @"semibold";
  uint64_t v8 = [NSNumber numberWithDouble:*MEMORY[0x263F81840]];
  v17[5] = v8;
  v16[6] = @"bold";
  uint64_t v9 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
  v17[6] = v9;
  v16[7] = @"heavy";
  uint64_t v10 = [NSNumber numberWithDouble:*MEMORY[0x263F81810]];
  v17[7] = v10;
  v16[8] = @"black";
  uint64_t v11 = [NSNumber numberWithDouble:*MEMORY[0x263F817F8]];
  v17[8] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

  uint64_t v13 = [v12 objectForKeyedSubscript:v15];

  return v13;
}

@end