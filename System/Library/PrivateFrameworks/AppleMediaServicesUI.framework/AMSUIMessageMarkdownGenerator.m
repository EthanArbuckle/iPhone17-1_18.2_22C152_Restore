@interface AMSUIMessageMarkdownGenerator
- (AMSUIMarkdownParser)parser;
- (AMSUIMessageMarkdownConfiguration)configuration;
- (AMSUIMessageMarkdownGenerator)initWithMarkdownString:(id)a3 configuration:(id)a4;
- (BOOL)didParseEverything;
- (NSDictionary)symbolAttributes;
- (NSMutableArray)attributeStack;
- (NSMutableAttributedString)accumulator;
- (NSString)symbol;
- (id)currentFont;
- (id)currentFontAddingFontAttributes:(id)a3;
- (id)fontWithTraits:(unsigned int)a3;
- (id)generate;
- (id)reconcileElementAttributes:(id)a3 withFont:(id)a4;
- (void)appendStyledString:(id)a3;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidFindNewline:(id)a3;
- (void)parserDidStartDocument:(id)a3;
- (void)popAttributes;
- (void)pushAttributes:(id)a3;
- (void)setAccumulator:(id)a3;
- (void)setAttributeStack:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDidParseEverything:(BOOL)a3;
- (void)setParser:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setSymbolAttributes:(id)a3;
@end

@implementation AMSUIMessageMarkdownGenerator

- (AMSUIMessageMarkdownGenerator)initWithMarkdownString:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIMessageMarkdownGenerator;
  v8 = [(AMSUIMessageMarkdownGenerator *)&v16 init];
  if (v8)
  {
    v9 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x263F089B8]);
    accumulator = v8->_accumulator;
    v8->_accumulator = v9;

    objc_storeStrong((id *)&v8->_configuration, a4);
    v8->_didParseEverything = 1;
    v11 = [[AMSUIMarkdownParser alloc] initWithString:v6];
    parser = v8->_parser;
    v8->_parser = v11;

    [(AMSUIMarkdownParser *)v8->_parser setDelegate:v8];
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    attributeStack = v8->_attributeStack;
    v8->_attributeStack = (NSMutableArray *)v13;
  }
  return v8;
}

- (id)generate
{
  v3 = [(AMSUIMessageMarkdownGenerator *)self parser];
  [v3 parse];

  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  v5 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
  id v6 = (void *)[v4 initWithAttributedString:v5];

  return v6;
}

- (void)popAttributes
{
  id v2 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
  [v2 removeLastObject];
}

- (void)pushAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
  id v6 = [v5 lastObject];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFF9A0];
    v8 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
    v9 = [v8 lastObject];
    id v12 = [v7 dictionaryWithDictionary:v9];

    [v12 addEntriesFromDictionary:v4];
    v10 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
    id v4 = v10;
    id v11 = v12;
  }
  else
  {
    v10 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
    id v12 = v10;
    id v11 = v4;
  }
  [v10 addObject:v11];
}

- (void)appendStyledString:(id)a3
{
  id v9 = a3;
  id v4 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
  v5 = [v4 lastObject];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"AMSUISymbol"];

    if (v6)
    {
      [(AMSUIMessageMarkdownGenerator *)self setSymbol:v9];
    }
    else
    {
      id v7 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
      v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9 attributes:v5];
      [v7 appendAttributedString:v8];
    }
  }
}

- (id)currentFont
{
  v3 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
  id v4 = [v3 lastObject];
  v5 = [v4 objectForKey:*MEMORY[0x263F814F0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v6)
  {
    id v7 = [(AMSUIMessageMarkdownGenerator *)self configuration];
    id v6 = [v7 font];
  }
  return v6;
}

- (id)currentFontAddingFontAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
  id v6 = [v5 fontDescriptor];
  id v7 = [v6 fontDescriptorByAddingAttributes:v4];

  v8 = (void *)MEMORY[0x263F81708];
  [v5 pointSize];
  id v9 = objc_msgSend(v8, "fontWithDescriptor:size:", v7);

  return v9;
}

- (id)fontWithTraits:(unsigned int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
  v5 = [v4 fontDescriptor];
  uint64_t v6 = [v5 symbolicTraits] | a3;
  id v7 = [v5 fontDescriptorWithSymbolicTraits:v6];
  if (v7)
  {
    v8 = (void *)MEMORY[0x263F81708];
    [v4 pointSize];
    objc_msgSend(v8, "fontWithDescriptor:size:", v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v10)
    {
      v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSLogKey();
      int v16 = 138544130;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v4;
      __int16 v22 = 1024;
      int v23 = v6;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Font %{public}@, does not support traits %u", (uint8_t *)&v16, 0x26u);
    }
    id v9 = v4;
  }
  v14 = v9;

  return v14;
}

- (id)reconcileElementAttributes:(id)a3 withFont:(id)a4
{
  v52[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 objectForKeyedSubscript:@"font-family"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v6 familyName];
    }
    id v11 = v9;

    uint64_t v12 = [v5 objectForKeyedSubscript:@"font-name"];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v6 fontName];
    }
    id v15 = v14;
    v46 = v11;

    [v6 pointSize];
    double v17 = v16;
    __int16 v18 = [v5 objectForKeyedSubscript:@"font-size"];

    v45 = v15;
    if (v18)
    {
      v19 = [v5 objectForKeyedSubscript:@"font-size"];
      [v19 doubleValue];
      double v17 = v20;
    }
    v21 = (double *)MEMORY[0x263F81838];
    __int16 v22 = [v6 fontDescriptor];
    uint64_t v23 = *MEMORY[0x263F817A0];
    uint64_t v24 = [v22 objectForKey:*MEMORY[0x263F817A0]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }
    double v26 = *v21;

    v27 = (uint64_t *)MEMORY[0x263F81850];
    if (v25)
    {
      v28 = [v25 objectForKeyedSubscript:*MEMORY[0x263F81850]];
      [v28 doubleValue];
      if (v29 != 0.0) {
        double v26 = v29;
      }
    }
    v30 = [v5 objectForKeyedSubscript:*MEMORY[0x263F27810]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    if (v31)
    {
      v32 = +[AMSUIFontParser weightForString:v31];
      v33 = v32;
      if (!v32)
      {
        [v31 doubleValue];
        v32 = v31;
      }
      [v32 doubleValue];
      double v26 = v34;
    }
    v35 = [v5 objectForKeyedSubscript:@"font-weight"];

    v36 = (void *)MEMORY[0x263F81720];
    if (v35)
    {
      uint64_t v37 = *MEMORY[0x263F81738];
      v38 = v46;
      v51[1] = v23;
      v52[0] = v46;
      v51[0] = v37;
      uint64_t v49 = *v27;
      v39 = [NSNumber numberWithDouble:v26];
      v50 = v39;
      v40 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v52[1] = v40;
      v41 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
      v42 = [v36 fontDescriptorWithFontAttributes:v41];

      v43 = v45;
    }
    else
    {
      v43 = v45;
      uint64_t v47 = *MEMORY[0x263F81758];
      v48 = v45;
      v39 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v42 = [v36 fontDescriptorWithFontAttributes:v39];
      v38 = v46;
    }

    id v10 = [MEMORY[0x263F81708] fontWithDescriptor:v42 size:v17];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (void)parserDidStartDocument:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F81650]);
  [v4 setAlignment:4];
  id v5 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v8 = *MEMORY[0x263F81540];
  v9[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v5 dictionaryWithDictionary:v6];
  [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v7];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to parse with error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(AMSUIMessageMarkdownGenerator *)self setDidParseEverything:0];
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  v74[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
  [v9 beginEditing];

  switch(a4)
  {
    case 0uLL:
      uint64_t v71 = *MEMORY[0x263F81748];
      v72 = &unk_26CC73BC0;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      double v20 = [(AMSUIMessageMarkdownGenerator *)self currentFontAddingFontAttributes:v11];
      uint64_t v13 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v20];

      v21 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v22 = *MEMORY[0x263F814F0];
      v70[0] = v13;
      uint64_t v23 = *MEMORY[0x263F81500];
      v69[0] = v22;
      v69[1] = v23;
      uint64_t v24 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      id v25 = [v24 color];
      v70[1] = v25;
      double v26 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
      v27 = [v21 dictionaryWithDictionary:v26];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v27];

      goto LABEL_17;
    case 1uLL:
      v28 = [(AMSUIMessageMarkdownGenerator *)self fontWithTraits:2];
      uint64_t v11 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v28];

      double v29 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v30 = *MEMORY[0x263F814F0];
      v74[0] = v11;
      uint64_t v31 = *MEMORY[0x263F81500];
      v73[0] = v30;
      v73[1] = v31;
      v32 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      v33 = [v32 color];
      v74[1] = v33;
      double v34 = NSDictionary;
      v35 = v74;
      v36 = v73;
      goto LABEL_7;
    case 2uLL:
      uint64_t v37 = [(AMSUIMessageMarkdownGenerator *)self fontWithTraits:1];
      uint64_t v11 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v37];

      double v29 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v38 = *MEMORY[0x263F814F0];
      v64[0] = v11;
      uint64_t v39 = *MEMORY[0x263F81500];
      v63[0] = v38;
      v63[1] = v39;
      v32 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      v33 = [v32 color];
      v64[1] = v33;
      double v34 = NSDictionary;
      v35 = v64;
      v36 = v63;
LABEL_7:
      uint64_t v40 = 2;
      goto LABEL_11;
    case 3uLL:
      v41 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v67 = *MEMORY[0x263F814F0];
      v42 = [(AMSUIMessageMarkdownGenerator *)self fontWithTraits:0];
      v68 = v42;
      v43 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v44 = [v41 dictionaryWithDictionary:v43];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v44];

      v45 = [v8 objectForKeyedSubscript:@"href"];

      if (!v45) {
        break;
      }
      v46 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v65 = *MEMORY[0x263F81520];
      uint64_t v11 = [v8 objectForKeyedSubscript:@"href"];
      v66 = v11;
      v32 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      uint64_t v47 = [v46 dictionaryWithDictionary:v32];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v47];

      goto LABEL_12;
    case 4uLL:
      v48 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
      uint64_t v11 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v48];

      double v29 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v49 = *MEMORY[0x263F814F0];
      v61[0] = *MEMORY[0x263F815F8];
      v61[1] = v49;
      v62[0] = &unk_26CC73670;
      v62[1] = v11;
      v61[2] = *MEMORY[0x263F81500];
      v32 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      v33 = [v32 color];
      v62[2] = v33;
      double v34 = NSDictionary;
      v35 = v62;
      v36 = v61;
      uint64_t v40 = 3;
LABEL_11:
      v50 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v40];
      v51 = [v29 dictionaryWithDictionary:v50];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v51];

LABEL_12:
      goto LABEL_18;
    case 5uLL:
      v52 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
      uint64_t v11 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v52];

      v53 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v54 = *MEMORY[0x263F814F0];
      v59[0] = *MEMORY[0x263F81570];
      v59[1] = v54;
      v60[0] = &unk_26CC73670;
      v60[1] = v11;
      v59[2] = *MEMORY[0x263F81500];
      uint64_t v13 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      __int16 v14 = [v13 strikeThroughColor];
      double v17 = v14;
      if (!v14)
      {
        id v5 = [(AMSUIMessageMarkdownGenerator *)self configuration];
        double v17 = [v5 color];
      }
      v60[2] = v17;
      v55 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
      v56 = [v53 dictionaryWithDictionary:v55];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v56];

      if (v14) {
        goto LABEL_16;
      }
      goto LABEL_3;
    case 6uLL:
    case 7uLL:
      int v10 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
      uint64_t v11 = [(AMSUIMessageMarkdownGenerator *)self reconcileElementAttributes:v8 withFont:v10];

      __int16 v12 = (void *)MEMORY[0x263EFF9A0];
      v57[0] = *MEMORY[0x263F81540];
      uint64_t v13 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      __int16 v14 = [v13 paragraphStyle];
      uint64_t v15 = *MEMORY[0x263F814F0];
      v58[0] = v14;
      v58[1] = v11;
      uint64_t v16 = *MEMORY[0x263F81500];
      v57[1] = v15;
      v57[2] = v16;
      id v5 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      double v17 = [v5 color];
      v58[2] = v17;
      __int16 v18 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
      v19 = [v12 dictionaryWithDictionary:v18];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v19];

LABEL_3:
LABEL_16:

LABEL_17:
      goto LABEL_18;
    case 8uLL:
      uint64_t v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
      [v11 setObject:MEMORY[0x263EFFA88] forKey:@"AMSUISymbol"];
      [(AMSUIMessageMarkdownGenerator *)self pushAttributes:v11];
LABEL_18:

      break;
    default:
      break;
  }
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  if (a4 == 8)
  {
    id v5 = [(AMSUIMessageMarkdownGenerator *)self symbol];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F827E8];
      id v7 = [(AMSUIMessageMarkdownGenerator *)self symbol];
      id v8 = objc_msgSend(v6, "ams_imageWithSystemSymbolName:", v7);

      id v9 = (void *)MEMORY[0x263EFF9A0];
      int v10 = [(AMSUIMessageMarkdownGenerator *)self attributeStack];
      uint64_t v11 = [v10 lastObject];
      __int16 v12 = [v9 dictionaryWithDictionary:v11];

      uint64_t v13 = (void *)MEMORY[0x263F82818];
      __int16 v14 = [(AMSUIMessageMarkdownGenerator *)self currentFont];
      uint64_t v15 = [v13 configurationWithFont:v14];

      uint64_t v16 = objc_msgSend(MEMORY[0x263F82818], "ams_imageSymbolConfigurationWithDictionary:", v12);
      double v17 = v16;
      if (v15)
      {
        id v18 = [v15 configurationByApplyingConfiguration:v16];
      }
      else
      {
        id v18 = v16;
      }
      v19 = [(AMSUIMessageMarkdownGenerator *)self configuration];
      double v20 = [v19 color];

      if (v20)
      {
        v21 = (void *)MEMORY[0x263F82818];
        uint64_t v22 = [(AMSUIMessageMarkdownGenerator *)self configuration];
        uint64_t v23 = [v22 color];
        v32[0] = v23;
        uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
        id v25 = [v21 configurationWithPaletteColors:v24];

        uint64_t v26 = [v25 configurationByApplyingConfiguration:v18];

        id v18 = (id)v26;
      }
      if (v18)
      {
        uint64_t v27 = objc_msgSend(v8, "ams_imageWithSymbolConfiguration:", v18);

        id v8 = (void *)v27;
      }
      id v28 = objc_alloc_init(MEMORY[0x263F81678]);
      [v28 setImage:v8];
      double v29 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
      uint64_t v30 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v28];
      [v29 appendAttributedString:v30];
    }
  }
  [(AMSUIMessageMarkdownGenerator *)self popAttributes];
  uint64_t v31 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
  [v31 endEditing];

  [(AMSUIMessageMarkdownGenerator *)self setSymbol:0];
}

- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F81678];
  id v6 = a4;
  id v10 = objc_alloc_init(v5);
  id v7 = objc_msgSend(MEMORY[0x263F827E8], "ams_imageWithSystemSymbolName:", v6);

  [v10 setImage:v7];
  id v8 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
  id v9 = [(AMSUIMessageMarkdownGenerator *)self accumulator];
  [v9 appendAttributedString:v8];
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v5 = [MEMORY[0x263F089D8] stringWithString:a4];
  [(AMSUIMessageMarkdownGenerator *)self appendStyledString:v5];
}

- (void)parserDidFindNewline:(id)a3
{
}

- (NSMutableAttributedString)accumulator
{
  return self->_accumulator;
}

- (void)setAccumulator:(id)a3
{
}

- (AMSUIMarkdownParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (NSMutableArray)attributeStack
{
  return self->_attributeStack;
}

- (void)setAttributeStack:(id)a3
{
}

- (BOOL)didParseEverything
{
  return self->_didParseEverything;
}

- (void)setDidParseEverything:(BOOL)a3
{
  self->_didParseEverything = a3;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (NSDictionary)symbolAttributes
{
  return self->_symbolAttributes;
}

- (void)setSymbolAttributes:(id)a3
{
}

- (AMSUIMessageMarkdownConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_symbolAttributes, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_attributeStack, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

@end