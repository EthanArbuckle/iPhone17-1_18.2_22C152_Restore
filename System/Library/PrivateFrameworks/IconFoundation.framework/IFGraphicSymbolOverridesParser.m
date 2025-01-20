@interface IFGraphicSymbolOverridesParser
- (CGSize)_parseSymbolOffsetFromRawItem:(id)a3;
- (IFGraphicSymbolOverridesParser)initWithRawOverrides:(id)a3;
- (NSDictionary)rawOverrides;
- (float)_parseSymbolSizeAdjusterFromRawItem:(id)a3;
- (id)_parseSymbolContent:(id)a3;
- (id)parse;
- (int64_t)_parseShapeFromRawShape:(id)a3;
- (int64_t)_parseSymbolWeightFromRawItem:(id)a3;
- (unint64_t)_parseSymbolSizeFromRawItem:(id)a3;
- (void)parse;
- (void)setRawOverrides:(id)a3;
@end

@implementation IFGraphicSymbolOverridesParser

- (IFGraphicSymbolOverridesParser)initWithRawOverrides:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFGraphicSymbolOverridesParser;
  v5 = [(IFGraphicSymbolOverridesParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rawOverrides = v5->_rawOverrides;
    v5->_rawOverrides = (NSDictionary *)v6;
  }
  return v5;
}

- (id)parse
{
  v3 = [(IFGraphicSymbolOverridesParser *)self rawOverrides];
  id v4 = objc_msgSend(v3, "_IF_numberForKey:", @"version");

  if ([v4 intValue] == 2)
  {
    v5 = [(IFGraphicSymbolOverridesParser *)self rawOverrides];
    uint64_t v6 = objc_msgSend(v5, "_IF_dictionaryForKey:", @"symbols");
    v7 = [(IFGraphicSymbolOverridesParser *)self _parseSymbolContent:v6];
  }
  else
  {
    v8 = IFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[IFGraphicSymbolOverridesParser parse]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)_parseSymbolContent:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v24 = (id)objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v4;
  uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v44;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v5;
        uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * v5);
        uint64_t v6 = objc_msgSend(obj, "_IF_dictionaryForKey:");
        v7 = objc_opt_new();
        v29 = v6;
        v8 = objc_msgSend(v6, "_IF_dictionaryForKey:", @"shapes");
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v33 = v8;
        uint64_t v32 = [v8 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v32)
        {
          uint64_t v31 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(v33);
              }
              uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              int64_t v11 = [(IFGraphicSymbolOverridesParser *)self _parseShapeFromRawShape:v10];
              if (v11)
              {
                int64_t v12 = v11;
                uint64_t v34 = i;
                v13 = objc_msgSend(v33, "_IF_dictionaryForKey:", v10);
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
                if (!v14) {
                  goto LABEL_26;
                }
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v36;
                while (1)
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v36 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    v18 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                    uint64_t v19 = [v18 intValue];
                    uint64_t v20 = [v18 compare:@"default"];
                    if (v20)
                    {
                      if (![v18 compare:@"enclosure_sizes"]) {
                        continue;
                      }
                    }
                    else
                    {
                      uint64_t v19 = 0x7FFFFFFFLL;
                    }
                    v21 = objc_msgSend(v13, "_IF_dictionaryForKey:", v18);
                    v22 = [[IFGraphicSymbolOverride alloc] initWithShape:v12 enclosureDimension:v19];
                    [(IFGraphicSymbolOverride *)v22 setIsDefault:v20 == 0];
                    [(IFGraphicSymbolOverride *)v22 setSymbolWeight:[(IFGraphicSymbolOverridesParser *)self _parseSymbolWeightFromRawItem:v21]];
                    [(IFGraphicSymbolOverride *)v22 setSymbolSize:[(IFGraphicSymbolOverridesParser *)self _parseSymbolSizeFromRawItem:v21]];
                    [(IFGraphicSymbolOverridesParser *)self _parseSymbolOffsetFromRawItem:v21];
                    -[IFGraphicSymbolOverride setOffset:](v22, "setOffset:");
                    [(IFGraphicSymbolOverridesParser *)self _parseSymbolSizeAdjusterFromRawItem:v21];
                    -[IFGraphicSymbolOverride setPointSizeAdjuster:](v22, "setPointSizeAdjuster:");
                    if (v22) {
                      [v7 addObject:v22];
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
                  if (!v15)
                  {
LABEL_26:

                    uint64_t i = v34;
                    break;
                  }
                }
              }
            }
            uint64_t v32 = [v33 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v32);
        }
        if (v7) {
          [v24 setObject:v7 forKey:v28];
        }

        uint64_t v5 = v30 + 1;
      }
      while (v30 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v26);
  }

  return v24;
}

- (int64_t)_parseShapeFromRawShape:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"rounded_rect"])
  {
    if ([v3 caseInsensitiveCompare:@"capsule"])
    {
      if ([v3 caseInsensitiveCompare:@"circle"])
      {
        id v4 = IFDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
          -[IFGraphicSymbolOverridesParser _parseShapeFromRawShape:]();
        }

        int64_t v5 = 0;
      }
      else
      {
        int64_t v5 = 2;
      }
    }
    else
    {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)_parseSymbolWeightFromRawItem:(id)a3
{
  id v3 = objc_msgSend(a3, "_IF_stringForKey:", @"symbol_weight");
  id v4 = v3;
  if (v3)
  {
    if (![v3 caseInsensitiveCompare:@"Ultralight"])
    {
      int64_t v6 = 1;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Thin"])
    {
      int64_t v6 = 2;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Light"])
    {
      int64_t v6 = 3;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Regular"])
    {
      int64_t v6 = 4;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Medium"])
    {
      int64_t v6 = 5;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Semibold"])
    {
      int64_t v6 = 6;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Bold"])
    {
      int64_t v6 = 7;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Heavy"])
    {
      int64_t v6 = 8;
      goto LABEL_24;
    }
    if (![v4 caseInsensitiveCompare:@"Black"])
    {
      int64_t v6 = 9;
      goto LABEL_24;
    }
    int64_t v5 = IFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolOverridesParser _parseSymbolWeightFromRawItem:]();
    }
  }
  int64_t v6 = 0;
LABEL_24:

  return v6;
}

- (unint64_t)_parseSymbolSizeFromRawItem:(id)a3
{
  id v3 = objc_msgSend(a3, "_IF_stringForKey:", @"symbol_size");
  id v4 = v3;
  if (v3)
  {
    if (![v3 caseInsensitiveCompare:@"Small"])
    {
      unint64_t v6 = 1;
      goto LABEL_12;
    }
    if (![v4 caseInsensitiveCompare:@"Medium"])
    {
      unint64_t v6 = 2;
      goto LABEL_12;
    }
    if (![v4 caseInsensitiveCompare:@"Large"])
    {
      unint64_t v6 = 3;
      goto LABEL_12;
    }
    int64_t v5 = IFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolOverridesParser _parseSymbolSizeFromRawItem:]();
    }
  }
  unint64_t v6 = 0;
LABEL_12:

  return v6;
}

- (float)_parseSymbolSizeAdjusterFromRawItem:(id)a3
{
  id v3 = objc_msgSend(a3, "_IF_stringForKey:", @"pointsize_to_shape_mul");
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = -1.0;
  }

  return v6;
}

- (CGSize)_parseSymbolOffsetFromRawItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "_IF_stringForKey:", @"x_offset");
  [v4 floatValue];
  float v6 = v5;

  v7 = objc_msgSend(v3, "_IF_stringForKey:", @"y_offset");

  [v7 floatValue];
  float v9 = v8;

  if (v6 == 0.0 && v9 == 0.0)
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v10 = v6;
    if (v6 < -0.5 || v6 > 0.5)
    {
      v13 = IFDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[IFGraphicSymbolOverridesParser _parseSymbolOffsetFromRawItem:](v13, v14, v15, v16, v17, v18, v19, v20);
      }

      double v10 = 0.0;
    }
    double v11 = v9;
    if (v9 < -0.5 || v9 > 0.5)
    {
      v22 = IFDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[IFGraphicSymbolOverridesParser _parseSymbolOffsetFromRawItem:](v22, v23, v24, v25, v26, v27, v28, v29);
      }

      double v11 = 0.0;
    }
  }
  double v30 = v10;
  double v31 = v11;
  result.height = v31;
  result.width = v30;
  return result;
}

- (NSDictionary)rawOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawOverrides:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)parse
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC6CA000, v0, OS_LOG_TYPE_ERROR, "Unknown override version: %@", v1, 0xCu);
}

- (void)_parseShapeFromRawShape:.cold.1()
{
  OUTLINED_FUNCTION_1();
}

- (void)_parseSymbolWeightFromRawItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
}

- (void)_parseSymbolSizeFromRawItem:.cold.1()
{
  OUTLINED_FUNCTION_1();
}

- (void)_parseSymbolOffsetFromRawItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end