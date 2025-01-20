@interface CKFullscreenEffectMessageFilter
- (BOOL)shouldUseMaskImage;
- (CAFilter)balloonCompositingFilter;
- (CAFilter)textCompositingFilter;
- (CKFullscreenEffectMessageFilter)init;
- (CKFullscreenEffectMessageFilter)initWithDictionary:(id)a3;
- (NSArray)balloonBackdropFilters;
- (NSArray)balloonFilters;
- (UIColor)textColor;
- (double)balloonAlpha;
- (double)contentAlpha;
- (int)direction;
- (int)type;
- (void)setBalloonAlpha:(double)a3;
- (void)setBalloonBackdropFilters:(id)a3;
- (void)setBalloonCompositingFilter:(id)a3;
- (void)setBalloonFilters:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setDirection:(int)a3;
- (void)setShouldUseMaskImage:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTextCompositingFilter:(id)a3;
- (void)setType:(int)a3;
@end

@implementation CKFullscreenEffectMessageFilter

- (CKFullscreenEffectMessageFilter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKFullscreenEffectMessageFilter;
  result = [(CKFullscreenEffectMessageFilter *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_balloonAlpha = _Q0;
    result->_shouldUseMaskImage = 0;
  }
  return result;
}

- (CKFullscreenEffectMessageFilter)initWithDictionary:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKFullscreenEffectMessageFilter;
  v5 = [(CKFullscreenEffectMessageFilter *)&v60 init];
  if (!v5) {
    goto LABEL_59;
  }
  id v6 = [v4 _stringForKey:@"type"];
  if ([v6 isEqualToIgnoringCase:@"text"]) {
    goto LABEL_3;
  }
  if ([v6 isEqualToIgnoringCase:@"status"])
  {
    int v7 = 1;
  }
  else if ([v6 isEqualToIgnoringCase:@"replaybutton"])
  {
    int v7 = 2;
  }
  else if ([v6 isEqualToIgnoringCase:@"bigemoji"])
  {
    int v7 = 3;
  }
  else if ([v6 isEqualToIgnoringCase:@"tapback"])
  {
    int v7 = 4;
  }
  else if ([v6 isEqualToIgnoringCase:@"sticker"])
  {
    int v7 = 5;
  }
  else if ([v6 isEqualToIgnoringCase:@"trigerringmessage"])
  {
    int v7 = 6;
  }
  else
  {
    if (([v6 isEqualToIgnoringCase:@"allother"] & 1) == 0)
    {
      id v47 = v6;
      _IMWarn();
LABEL_3:
      int v7 = 0;
      goto LABEL_18;
    }
    int v7 = 999;
  }
LABEL_18:

  v5->_type = v7;
  id v8 = [v4 _stringForKey:@"direction"];
  v50 = v6;
  if (([v8 isEqualToIgnoringCase:@"both"] & 1) == 0)
  {
    if ([v8 isEqualToIgnoringCase:@"incoming"])
    {
      int v9 = 2;
      goto LABEL_24;
    }
    if ([v8 isEqualToIgnoringCase:@"outgoing"])
    {
      int v9 = 1;
      goto LABEL_24;
    }
    id v47 = v8;
    _IMWarn();
  }
  int v9 = 0;
LABEL_24:
  v49 = v8;

  v5->_direction = v9;
  v10 = [v4 _arrayForKey:@"balloonFilters"];
  v51 = v10;
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = objc_msgSend(MEMORY[0x1E4F39BC0], "ck_filterWithDictionary:", v17);
            if (v18) {
              [v11 addObject:v18];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [v11 copy];
    balloonFilters = v5->_balloonFilters;
    v5->_balloonFilters = (NSArray *)v19;

    v10 = v51;
  }
  v21 = objc_msgSend(v4, "_arrayForKey:", @"balloonBackdropFilters", v47);
  if (v21)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v48 = v21;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = objc_msgSend(MEMORY[0x1E4F39BC0], "ck_filterWithDictionary:", v28);
            if (v29) {
              [v22 addObject:v29];
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v25);
    }

    uint64_t v30 = [v22 copy];
    balloonBackdropFilters = v5->_balloonBackdropFilters;
    v5->_balloonBackdropFilters = (NSArray *)v30;

    v10 = v51;
    v21 = v48;
  }
  v32 = [v4 _dictionaryForKey:@"balloonCompositingFilter"];
  if (v32)
  {
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F39BC0], "ck_filterWithDictionary:", v32);
    balloonCompositingFilter = v5->_balloonCompositingFilter;
    v5->_balloonCompositingFilter = (CAFilter *)v33;
  }
  v35 = [v4 _numberForKey:@"balloonAlpha"];
  v36 = v35;
  double v37 = 1.0;
  double v38 = 1.0;
  if (v35)
  {
    objc_msgSend(v35, "floatValue", 1.0);
    double v38 = v39;
  }
  v5->_balloonAlpha = v38;
  v40 = [v4 _numberForKey:@"contentAlpha"];
  v41 = v40;
  if (v40)
  {
    [v40 floatValue];
    double v37 = v42;
  }
  v5->_contentAlpha = v37;
  v43 = [v4 _dictionaryForKey:@"textCompositingFilter"];
  if (v43)
  {
    uint64_t v44 = objc_msgSend(MEMORY[0x1E4F39BC0], "ck_filterWithDictionary:", v43);
    textCompositingFilter = v5->_textCompositingFilter;
    v5->_textCompositingFilter = (CAFilter *)v44;
  }
LABEL_59:

  return v5;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (NSArray)balloonFilters
{
  return self->_balloonFilters;
}

- (void)setBalloonFilters:(id)a3
{
}

- (NSArray)balloonBackdropFilters
{
  return self->_balloonBackdropFilters;
}

- (void)setBalloonBackdropFilters:(id)a3
{
}

- (CAFilter)balloonCompositingFilter
{
  return self->_balloonCompositingFilter;
}

- (void)setBalloonCompositingFilter:(id)a3
{
}

- (double)balloonAlpha
{
  return self->_balloonAlpha;
}

- (void)setBalloonAlpha:(double)a3
{
  self->_balloonAlpha = a3;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (CAFilter)textCompositingFilter
{
  return self->_textCompositingFilter;
}

- (void)setTextCompositingFilter:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (BOOL)shouldUseMaskImage
{
  return self->_shouldUseMaskImage;
}

- (void)setShouldUseMaskImage:(BOOL)a3
{
  self->_shouldUseMaskImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textCompositingFilter, 0);
  objc_storeStrong((id *)&self->_balloonCompositingFilter, 0);
  objc_storeStrong((id *)&self->_balloonBackdropFilters, 0);

  objc_storeStrong((id *)&self->_balloonFilters, 0);
}

@end