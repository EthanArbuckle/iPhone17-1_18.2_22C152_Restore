@interface MPRouteLabel
- (BOOL)_labelFitsText:(id)a3 withSize:(CGSize)a4;
- (BOOL)_textColorFollowsTintColor;
- (BOOL)displayAsSiriSuggestion;
- (BOOL)forcesUppercaseText;
- (BOOL)omitGroupLeaderName;
- (BOOL)updatesRouteInternally;
- (BOOL)usesPredictedOutputDevice;
- (BSUIEmojiLabelView)contentView;
- (CGSize)_labelSizeForText:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPAVRoute)route;
- (MPRouteLabel)initWithFrame:(CGRect)a3;
- (NSString)designatedGroupLeaderName;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UILabel)titleLabel;
- (double)_baselineOffsetFromBottom;
- (id)_bestStringThatFitsSize:(CGSize)a3;
- (id)_formattedRouteName;
- (id)_formattedRouteNameForDesignatedGroupLeaderNameText:(id)a3 routeNamesText:(id)a4;
- (id)_marketingNames;
- (id)_plusSeparatedRouteNames:(id)a3;
- (id)_routeNamesSortedAlphanumeric:(id)a3;
- (id)_routeNamesSortedLength:(id)a3;
- (id)_truncateText:(id)a3 by:(int64_t)a4;
- (int64_t)_compareLength:(id)a3 with:(id)a4;
- (int64_t)minimumEndCharacterCount;
- (int64_t)textAlignment;
- (int64_t)truncationMode;
- (void)_routeDidChangeNotification:(id)a3;
- (void)_setTextColorFollowsTintColor:(BOOL)a3;
- (void)_updateRouteLabel;
- (void)_updateTitleIfNeeded;
- (void)addRouteName:(id)a3;
- (void)addRouteNamesFromArray:(id)a3;
- (void)layoutSubviews;
- (void)removeRouteName:(id)a3;
- (void)removeRouteNamesFromArray:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDesignatedGroupLeaderName:(id)a3;
- (void)setDisplayAsSiriSuggestion:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setForcesUppercaseText:(BOOL)a3;
- (void)setMinimumEndCharacterCount:(int64_t)a3;
- (void)setOmitGroupLeaderName:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTruncationMode:(int64_t)a3;
- (void)setUpdatesRouteInternally:(BOOL)a3;
- (void)setUsesPredictedOutputDevice:(BOOL)a3;
- (void)subscribeToRouteNotificationIfNeeded;
@end

@implementation MPRouteLabel

- (void)setRoute:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v5 = (MPAVRoute *)a3;
  route = self->_route;
  if (route != v5)
  {
    if (route)
    {
      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:@"MPAVRouteDidChangeNotification" object:self->_route];
    }
    objc_storeStrong((id *)&self->_route, a3);
    [(MPRouteLabel *)self subscribeToRouteNotificationIfNeeded];
  }
  if ([(MPAVRoute *)v5 isAppleTVRoute])
  {
    v8 = [(MPAVRoute *)v5 designatedGroupLeaderName];
    BOOL v9 = [v8 length] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if (![(MPAVRoute *)v5 isDeviceRoute] || v9)
  {
    v10 = [(MPAVRoute *)v5 designatedGroupLeaderName];
  }
  else
  {
    v10 = (__CFString *)MRAVOutputDeviceCopyLocalDeviceLocalizedName();
  }
  v11 = v10;
  if (![(__CFString *)v10 length]
    || ![(MPAVRoute *)v5 isAirPlayingToDevice]
    || ![(MPAVRoute *)v5 isProxyGroupPlayer])
  {
    if (![(MPAVRoute *)v5 isDeviceRoute]
      || [(MPAVRoute *)v5 numberOfOutputDevices] > 1)
    {
      BOOL v21 = [(MPAVRoute *)v5 isSplitRoute];

      if (v21)
      {
        v22 = NSString;
        v23 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        v11 = &stru_1EE680640;
        v24 = [v23 localizedStringForKey:@"ROUTE_NAME_HEADPHONES_COUNT" value:&stru_1EE680640 table:@"MediaPlayer"];
        v25 = objc_msgSend(v22, "stringWithFormat:", v24, -[MPAVRoute numberOfOutputDevices](v5, "numberOfOutputDevices"));
        v31 = v25;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];

        goto LABEL_34;
      }
      v14 = [(MPAVRoute *)v5 routeNames];
      goto LABEL_33;
    }

    v16 = v5;
    v11 = v16;
    if (v16 && self->_usesPredictedOutputDevice)
    {
      v17 = [(__CFString *)v16 predictedOutputDevice];
      v18 = v17;
      if (v17)
      {
        v19 = [v17 routeName];
        v34[0] = v19;
        v20 = (void **)v34;
      }
      else
      {
        v19 = [(__CFString *)v11 routeName];
        v33 = v19;
        v20 = &v33;
      }
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    }
    else
    {
      v18 = [(__CFString *)v16 routeName];
      v32 = v18;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    }

LABEL_32:
LABEL_33:
    v11 = &stru_1EE680640;
    goto LABEL_34;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v13 = [(MPAVRoute *)v5 routeNames];
  v14 = (void *)[v12 initWithArray:v13];

  uint64_t v15 = [v14 indexOfObject:v11];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
    [v14 removeObjectAtIndex:v15];
  }
  if (self->_omitGroupLeaderName) {
    goto LABEL_32;
  }
LABEL_34:
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v14];
  v27 = [(MPRouteLabel *)self designatedGroupLeaderName];
  if (v11 == v27)
  {
    char v29 = 0;
  }
  else
  {
    v28 = [(MPRouteLabel *)self designatedGroupLeaderName];
    char v29 = [(__CFString *)v11 isEqualToString:v28] ^ 1;
  }
  int v30 = [v26 isEqualToSet:self->_routeNames];
  if ((v29 & 1) != 0 || !v30)
  {
    objc_storeStrong((id *)&self->_designatedGroupLeaderName, v11);
    objc_storeStrong((id *)&self->_routeNames, v26);
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (id)_formattedRouteNameForDesignatedGroupLeaderNameText:(id)a3 routeNamesText:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v7 copy];
  BOOL v9 = [(MPRouteLabel *)self _marketingNames];
  v10 = [(MPRouteLabel *)self designatedGroupLeaderName];
  int v11 = [v9 containsObject:v10];

  if (v11)
  {
    id v12 = [(MPRouteLabel *)self designatedGroupLeaderName];
  }
  else
  {
    id v12 = v6;
  }
  v13 = v12;
  if ([v8 length] && objc_msgSend(v13, "length"))
  {
    v14 = NSString;
    uint64_t v15 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    v16 = [v15 localizedStringForKey:@"ROUTE_NAME_ARROW_FORMAT" value:&stru_1EE680640 table:@"MediaPlayer"];
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v16, v13, v8);

    v8 = v15;
  }
  else
  {
    if ([v13 length])
    {
      if (v13) {
        v18 = v13;
      }
      else {
        v18 = v7;
      }
      id v19 = v18;
    }
    else
    {
      if (![v7 length]) {
        goto LABEL_16;
      }
      id v19 = v7;
    }
    uint64_t v17 = (uint64_t)v19;
  }

  v8 = (void *)v17;
LABEL_16:
  if (self->_forcesUppercaseText)
  {
    id v32 = v6;
    v20 = [v8 localizedUppercaseString];
    BOOL v21 = (void *)[v20 mutableCopy];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = [(MPRouteLabel *)self _marketingNames];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v28 = [v8 rangeOfString:v27];
          if (v28 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend(v21, "replaceCharactersInRange:withString:", v28, v29, v27);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v24);
    }

    uint64_t v30 = [v21 copy];
    v8 = (void *)v30;
    id v6 = v32;
  }

  return v8;
}

- (NSString)designatedGroupLeaderName
{
  if (self->_omitGroupLeaderName) {
    return (NSString *)0;
  }
  else {
    return self->_designatedGroupLeaderName;
  }
}

- (id)_marketingNames
{
  if (_marketingNames_onceToken != -1) {
    dispatch_once(&_marketingNames_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)_marketingNames_marketingNames;

  return v2;
}

- (void)subscribeToRouteNotificationIfNeeded
{
  if (self->_route)
  {
    BOOL updatesRouteInternally = self->_updatesRouteInternally;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = v4;
    if (updatesRouteInternally) {
      [v4 addObserver:self selector:sel__routeDidChangeNotification_ name:@"MPAVRouteDidChangeNotification" object:self->_route];
    }
    else {
      [v4 removeObserver:self name:@"MPAVRouteDidChangeNotification" object:self->_route];
    }
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_textColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(BSUIEmojiLabelView *)self->_contentView setTextColor:v5];
  }
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(BSUIEmojiLabelView *)self->_contentView setFont:v5];
    [(UILabel *)self->_sizingLabel setFont:v5];
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MPRouteLabel;
  [(MPRouteLabel *)&v3 layoutSubviews];
  [(MPRouteLabel *)self bounds];
  -[BSUIEmojiLabelView setFrame:](self->_contentView, "setFrame:");
  [(MPRouteLabel *)self _updateRouteLabel];
}

- (void)_updateRouteLabel
{
  [(MPRouteLabel *)self _updateTitleIfNeeded];
  text = self->_text;
  contentView = self->_contentView;

  [(BSUIEmojiLabelView *)contentView setText:text];
}

- (void)_updateTitleIfNeeded
{
  previousDesignatedGroupLeaderName = self->_previousDesignatedGroupLeaderName;
  v4 = [(MPRouteLabel *)self designatedGroupLeaderName];
  if (previousDesignatedGroupLeaderName == v4)
  {
    int v31 = 0;
  }
  else
  {
    id v5 = self->_previousDesignatedGroupLeaderName;
    id v6 = [(MPRouteLabel *)self designatedGroupLeaderName];
    int v31 = [(NSString *)v5 isEqual:v6] ^ 1;
  }
  int v7 = [(NSMutableSet *)self->_previousRouteNames isEqualToSet:self->_routeNames];
  [(MPRouteLabel *)self bounds];
  v33.origin.x = v8;
  v33.origin.y = v9;
  v33.size.width = v10;
  v33.size.height = v11;
  BOOL v12 = CGRectEqualToRect(self->_previousBounds, v33);
  int previousForcesUppercaseText = self->_previousForcesUppercaseText;
  int forcesUppercaseText = self->_forcesUppercaseText;
  BOOL v15 = ([(UIFont *)self->_previousFont isEqual:self->_font] & 1) == 0
     && self->_previousFont != self->_font;
  if (((v31 | v7 ^ 1) & 1) != 0
    || !v12
    || previousForcesUppercaseText != forcesUppercaseText
    || v15
    || self->_previousTruncationMode != self->_truncationMode
    || self->_previousDisplayAsSiriSuggestion != self->_displayAsSiriSuggestion)
  {
    [(MPRouteLabel *)self bounds];
    self->_previousBounds.origin.x = v16;
    self->_previousBounds.origin.y = v17;
    self->_previousBounds.size.width = v18;
    self->_previousBounds.size.height = v19;
    v20 = (UIFont *)[(UIFont *)self->_font copy];
    previousFont = self->_previousFont;
    self->_previousFont = v20;

    v22 = [(MPRouteLabel *)self designatedGroupLeaderName];
    uint64_t v23 = (NSString *)[v22 copy];
    uint64_t v24 = self->_previousDesignatedGroupLeaderName;
    self->_previousDesignatedGroupLeaderName = v23;

    uint64_t v25 = (NSMutableSet *)[(NSMutableSet *)self->_routeNames copy];
    previousRouteNames = self->_previousRouteNames;
    self->_previousRouteNames = v25;

    self->_int previousForcesUppercaseText = self->_forcesUppercaseText;
    self->_previousDisplayAsSiriSuggestion = self->_displayAsSiriSuggestion;
    self->_previousTruncationMode = self->_truncationMode;
    [(MPRouteLabel *)self bounds];
    -[MPRouteLabel _bestStringThatFitsSize:](self, "_bestStringThatFitsSize:", v27, v28);
    uint64_t v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v29;

    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (id)_bestStringThatFitsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(NSMutableSet *)self->_routeNames allObjects];
  uint64_t v7 = [(MPRouteLabel *)self _routeNamesSortedAlphanumeric:v6];

  CGFloat v8 = (void *)v7;
  CGFloat v9 = [(NSMutableSet *)self->_routeNames allObjects];
  v62 = [(MPRouteLabel *)self _routeNamesSortedLength:v9];

  CGFloat v10 = [(MPRouteLabel *)self designatedGroupLeaderName];
  CGFloat v11 = (void *)[v10 copy];

  BOOL v12 = [(MPRouteLabel *)self _plusSeparatedRouteNames:v8];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __40__MPRouteLabel__bestStringThatFitsSize___block_invoke;
  v80[3] = &unk_1E57F9940;
  v80[4] = self;
  *(double *)&v80[5] = width;
  *(double *)&v80[6] = height;
  v13 = (unsigned int (**)(void, void, void))MEMORY[0x19971E0F0](v80);
  if (((unsigned int (**)(void, void *, __CFString *))v13)[2](v13, v11, v12))
  {
    v59 = v12;
    id v14 = [(MPRouteLabel *)self _formattedRouteNameForDesignatedGroupLeaderNameText:v11 routeNamesText:v12];
LABEL_49:
    if ([(MPRouteLabel *)self displayAsSiriSuggestion])
    {
      v52 = NSString;
      v53 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
      v54 = [v53 localizedStringForKey:@"NOW_PLAYING_SIRI_SUGGESTION" value:&stru_1EE680640 table:@"MediaPlayer"];
      v55 = [v54 localizedUppercaseString];
      objc_msgSend(v52, "stringWithFormat:", v55, v14);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v14;
      id v51 = v14;
    }
    goto LABEL_52;
  }
  uint64_t v15 = [v11 length] - 2 * self->_minimumEndCharacterCount;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__54644;
  v74 = __Block_byref_object_dispose__54645;
  v75 = &stru_1EE680640;
  v58 = v8;
  if (v15 >= 1)
  {
    while (1)
    {
      CGFloat v16 = [(MPRouteLabel *)self designatedGroupLeaderName];
      int v17 = [v16 isEqualToString:v11];

      uint64_t v18 = v17 ? 1 : 2;
      uint64_t v19 = [(MPRouteLabel *)self _truncateText:v11 by:v18];

      uint64_t v20 = [(MPRouteLabel *)self _plusSeparatedRouteNames:v62];
      CGFloat v11 = (void *)v19;
      BOOL v21 = (void *)v71[5];
      v71[5] = v20;

      if (v13[2](v13, v19, v71[5])) {
        break;
      }
      if (!--v15) {
        goto LABEL_11;
      }
    }
    *((unsigned char *)v77 + 24) = 1;
    v22 = (__CFString *)(id)v71[5];

    BOOL v12 = v22;
  }
LABEL_11:
  if (*((unsigned char *)v77 + 24))
  {
    BOOL v23 = 0;
  }
  else
  {
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v62];
    uint64_t v24 = [v61 firstObject];
    uint64_t v25 = [v24 length];
    int64_t minimumEndCharacterCount = self->_minimumEndCharacterCount;

    *((unsigned char *)v77 + 24) = 0;
    double v27 = (void *)v71[5];
    v71[5] = (uint64_t)&stru_1EE680640;

    if (v25 - 2 * minimumEndCharacterCount >= 1)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      int64_t v29 = ~(2 * minimumEndCharacterCount) + v25;
      do
      {
        v63[0] = v28;
        v63[1] = 3221225472;
        v63[2] = __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_44;
        v63[3] = &unk_1E57F9968;
        id v64 = v61;
        v65 = self;
        v68 = &v70;
        v67 = v13;
        id v66 = v11;
        v69 = &v76;
        [v62 enumerateObjectsUsingBlock:v63];
        int v30 = *((unsigned __int8 *)v77 + 24);
        if (*((unsigned char *)v77 + 24))
        {
          int v31 = (__CFString *)(id)v71[5];

          BOOL v12 = v31;
        }

        if (v30) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v29 == 0;
        }
        --v29;
      }
      while (!v32);
    }
    if (*((unsigned char *)v77 + 24))
    {
      BOOL v23 = 0;
      CGFloat v8 = v58;
    }
    else
    {
      CGFloat v8 = v58;
      CGRect v33 = [v58 firstObject];
      if ((unint64_t)[v58 count] < 2)
      {
        id v34 = v33;
      }
      else
      {
        __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(v33, [v58 count] - 1);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v35 = v34;
      if (((unsigned int (**)(void, void *, id))v13)[2](v13, v11, v34))
      {
        long long v36 = v35;
        v37 = v12;
        BOOL v12 = v36;
        BOOL v23 = 0;
      }
      else
      {
        v60 = v12;
        v57 = v35;
        uint64_t v38 = [v58 firstObject];

        v39 = &stru_1EE680640;
        unint64_t v40 = 1;
        while (1)
        {
          unint64_t v41 = [v38 length];
          BOOL v23 = v40 > v41;
          if (v40 > v41) {
            break;
          }
          v42 = [(MPRouteLabel *)self _truncateText:v38 by:v40];

          if ((unint64_t)[v58 count] < 2)
          {
            v39 = v42;
          }
          else
          {
            __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(v42, [v58 count] - 1);
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          ++v40;
          if (((unsigned int (**)(void, void *, __CFString *))v13)[2](v13, v11, v39))
          {
            v43 = v39;
            v39 = v43;
            goto LABEL_37;
          }
        }
        v43 = [v58 firstObject];
LABEL_37:
        BOOL v12 = v43;
        CGRect v33 = v38;

        v37 = v39;
        long long v35 = v57;
      }
    }
  }
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);
  v59 = v12;
  v44 = [(MPRouteLabel *)self _formattedRouteNameForDesignatedGroupLeaderNameText:v11 routeNamesText:v12];
  id v14 = v44;
  if (!v23 || ![v44 length]) {
    goto LABEL_49;
  }
  uint64_t v45 = 0;
  while (1)
  {
    v46 = [(MPRouteLabel *)self _truncateText:v14 by:v45 + 1];
    if ([(MPRouteLabel *)self displayAsSiriSuggestion])
    {
      v47 = NSString;
      v48 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
      v49 = [v48 localizedStringForKey:@"NOW_PLAYING_SIRI_SUGGESTION" value:&stru_1EE680640 table:@"MediaPlayer"];
      v50 = [v49 localizedUppercaseString];
      objc_msgSend(v47, "stringWithFormat:", v50, v46);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v51 = v46;
    }
    if (-[MPRouteLabel _labelFitsText:withSize:](self, "_labelFitsText:withSize:", v51, width, height)) {
      break;
    }

    if (++v45 >= (unint64_t)[v14 length])
    {
      CGFloat v8 = v58;
      goto LABEL_49;
    }
  }

  CGFloat v8 = v58;
LABEL_52:

  return v51;
}

uint64_t __40__MPRouteLabel__bestStringThatFitsSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [*(id *)(a1 + 32) _formattedRouteNameForDesignatedGroupLeaderNameText:a2 routeNamesText:a3];
  if ([*(id *)(a1 + 32) displayAsSiriSuggestion])
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"NOW_PLAYING_SIRI_SUGGESTION" value:&stru_1EE680640 table:@"MediaPlayer"];
    CGFloat v8 = [v7 localizedUppercaseString];
    objc_msgSend(v5, "stringWithFormat:", v8, v4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v4;
  }
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_labelFitsText:withSize:", v9, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v10;
}

- (BOOL)displayAsSiriSuggestion
{
  return self->_displayAsSiriSuggestion;
}

- (BOOL)_labelFitsText:(id)a3 withSize:(CGSize)a4
{
  double width = a4.width;
  -[MPRouteLabel _labelSizeForText:](self, "_labelSizeForText:", a3, a4.width, a4.height);
  if (v5 < width) {
    return 1;
  }
  double v7 = v5 - width;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  return v7 < 0.00000011920929;
}

- (CGSize)_labelSizeForText:(id)a3
{
  [(UILabel *)self->_sizingLabel setText:a3];
  sizingLabel = self->_sizingLabel;

  [(UILabel *)sizingLabel intrinsicContentSize];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_plusSeparatedRouteNames:(id)a3
{
  objc_super v3 = [(MPRouteLabel *)self _routeNamesSortedAlphanumeric:a3];
  v4 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
  double v5 = [v4 localizedStringForKey:@"ROUTE_NAME_PLUS_SEPARATOR" value:&stru_1EE680640 table:@"MediaPlayer"];
  double v6 = [v3 componentsJoinedByString:v5];

  return v6;
}

- (id)_truncateText:(id)a3 by:(int64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  int64_t truncationMode = self->_truncationMode;
  if (!truncationMode)
  {
    uint64_t v18 = [v6 length];
    int64_t minimumEndCharacterCount = self->_minimumEndCharacterCount;
    if (v18 - a4 >= minimumEndCharacterCount) {
      int64_t v20 = a4;
    }
    else {
      int64_t v20 = (v18 - minimumEndCharacterCount) & ~((v18 - minimumEndCharacterCount) >> 63);
    }
    BOOL v12 = objc_msgSend(v7, "substringWithRange:", 0, (v18 - v20) & ~((v18 - v20) >> 63));
    BOOL v21 = NSString;
    v13 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    uint64_t v15 = [v13 localizedStringForKey:@"ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR" value:&stru_1EE680640 table:@"MediaPlayer"];
    int v17 = [v21 stringWithFormat:@"%@%@", v12, v15];
LABEL_10:

    goto LABEL_12;
  }
  if (truncationMode == 1)
  {
    if ([v6 length] - (a4 + 2 * self->_minimumEndCharacterCount) <= 0) {
      a4 = [v7 length] - 2 * self->_minimumEndCharacterCount;
    }
    int v9 = vcvtpd_s64_f64((double)(unint64_t)[v7 length] * 0.5);
    double v10 = (double)a4 * 0.5;
    uint64_t v11 = (uint64_t)(v10 + (double)v9);
    BOOL v12 = objc_msgSend(v7, "substringWithRange:", 0, (uint64_t)((double)v9 - v10));
    v13 = objc_msgSend(v7, "substringWithRange:", v11, (int)objc_msgSend(v7, "length") - v11);
    id v14 = NSString;
    uint64_t v15 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    CGFloat v16 = [v15 localizedStringForKey:@"ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR" value:&stru_1EE680640 table:@"MediaPlayer"];
    int v17 = [v14 stringWithFormat:@"%@%@%@", v12, v16, v13];

    goto LABEL_10;
  }
  int v17 = 0;
LABEL_12:

  return v17;
}

- (id)_routeNamesSortedAlphanumeric:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_54676];
}

void __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_44(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  double v7 = [*(id *)(a1 + 32) firstObject];
  CGFloat v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  unint64_t v9 = [v7 length];
  if (v9 <= [v8 length])
  {
    double v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    int v11 = [v17 isEqualToString:v10];

    uint64_t v12 = v11 ? 1 : 2;
    v13 = [*(id *)(a1 + 40) _truncateText:v8 by:v12];
    [*(id *)(a1 + 32) setObject:v13 atIndexedSubscript:a3];

    uint64_t v14 = [*(id *)(a1 + 40) _plusSeparatedRouteNames:*(void *)(a1 + 32)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    CGFloat v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(MPRouteLabel *)self designatedGroupLeaderName];
  v4 = [(NSMutableSet *)self->_routeNames allObjects];
  double v5 = [(MPRouteLabel *)self _plusSeparatedRouteNames:v4];
  id v6 = [(MPRouteLabel *)self _formattedRouteNameForDesignatedGroupLeaderNameText:v3 routeNamesText:v5];

  [(MPRouteLabel *)self _labelSizeForText:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)_routeNamesSortedLength:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MPRouteLabel__routeNamesSortedLength___block_invoke;
  v5[3] = &unk_1E57F9918;
  v5[4] = self;
  objc_super v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

void __31__MPRouteLabel__marketingNames__block_invoke()
{
  v0 = (void *)_marketingNames_marketingNames;
  _marketingNames_marketingNames = (uint64_t)&unk_1EE6EE3A8;
}

- (MPRouteLabel)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MPRouteLabel;
  objc_super v3 = -[MPRouteLabel initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)objc_alloc_init(NSString);
    designatedGroupLeaderName = v3->_designatedGroupLeaderName;
    v3->_designatedGroupLeaderName = v4;

    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    previousRouteNames = v3->_previousRouteNames;
    v3->_previousRouteNames = v6;

    double v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    routeNames = v3->_routeNames;
    v3->_routeNames = v8;

    id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    sizingLabel = v3->_sizingLabel;
    v3->_sizingLabel = (UILabel *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8B0]), "initWithFrame:", v11, v12, v13, v14);
    contentView = v3->_contentView;
    v3->_contentView = (BSUIEmojiLabelView *)v17;

    v3->_int64_t minimumEndCharacterCount = 2;
    v3->_omitGroupLeaderName = 0;
    v3->_BOOL updatesRouteInternally = 1;
    v3->_usesPredictedOutputDevice = 0;
    [(MPRouteLabel *)v3 addSubview:v3->_contentView];
    [(MPRouteLabel *)v3 addSubview:v3->_sizingLabel];
    [(UILabel *)v3->_sizingLabel setHidden:1];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedGroupLeaderName, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
  objc_storeStrong((id *)&self->_routeNames, 0);
  objc_storeStrong((id *)&self->_previousRouteNames, 0);
  objc_storeStrong((id *)&self->_previousFont, 0);

  objc_storeStrong((id *)&self->_previousDesignatedGroupLeaderName, 0);
}

- (void)setDesignatedGroupLeaderName:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setContentView:(id)a3
{
}

- (BSUIEmojiLabelView)contentView
{
  return self->_contentView;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (void)setUsesPredictedOutputDevice:(BOOL)a3
{
  self->_usesPredictedOutputDevice = a3;
}

- (BOOL)usesPredictedOutputDevice
{
  return self->_usesPredictedOutputDevice;
}

- (BOOL)updatesRouteInternally
{
  return self->_updatesRouteInternally;
}

- (BOOL)omitGroupLeaderName
{
  return self->_omitGroupLeaderName;
}

- (BOOL)forcesUppercaseText
{
  return self->_forcesUppercaseText;
}

- (int64_t)truncationMode
{
  return self->_truncationMode;
}

- (int64_t)minimumEndCharacterCount
{
  return self->_minimumEndCharacterCount;
}

- (int64_t)_compareLength:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  if (v7 <= [v6 length])
  {
    unint64_t v9 = [v5 length];
    int64_t v8 = v9 < [v6 length];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (void)_routeDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPRouteLabel__routeDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__MPRouteLabel__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRoute:*(void *)(*(void *)(a1 + 32) + 528)];
}

id __40__MPRouteLabel__bestStringThatFitsSize___block_invoke_2(void *a1, uint64_t a2)
{
  objc_super v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a1;
  id v6 = [v4 mediaPlayerBundle];
  unint64_t v7 = [v6 localizedStringForKey:@"ROUTE_NAME_PLUS_COUNT" value:&stru_1EE680640 table:@"MediaPlayer"];
  int64_t v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5, a2);

  return v8;
}

uint64_t __40__MPRouteLabel__routeNamesSortedLength___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _compareLength:a2 with:a3];
}

uint64_t __46__MPRouteLabel__routeNamesSortedAlphanumeric___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (id)_formattedRouteName
{
  objc_super v3 = [(MPRouteLabel *)self designatedGroupLeaderName];
  v4 = [(NSMutableSet *)self->_routeNames allObjects];
  id v5 = [(MPRouteLabel *)self _plusSeparatedRouteNames:v4];

  id v6 = [(MPRouteLabel *)self _formattedRouteNameForDesignatedGroupLeaderNameText:v3 routeNamesText:v5];

  return v6;
}

- (void)removeRouteNamesFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableSet *)self->_routeNames removeObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(MPRouteLabel *)self invalidateIntrinsicContentSize];
  [(MPRouteLabel *)self setNeedsLayout];
}

- (void)removeRouteName:(id)a3
{
  [(NSMutableSet *)self->_routeNames removeObject:a3];
  [(MPRouteLabel *)self invalidateIntrinsicContentSize];

  [(MPRouteLabel *)self setNeedsLayout];
}

- (void)addRouteNamesFromArray:(id)a3
{
  [(NSMutableSet *)self->_routeNames addObjectsFromArray:a3];
  [(MPRouteLabel *)self invalidateIntrinsicContentSize];

  [(MPRouteLabel *)self setNeedsLayout];
}

- (void)addRouteName:(id)a3
{
  [(NSMutableSet *)self->_routeNames addObject:a3];
  [(MPRouteLabel *)self invalidateIntrinsicContentSize];

  [(MPRouteLabel *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = -[MPRouteLabel _bestStringThatFitsSize:](self, "_bestStringThatFitsSize:");
  [(MPRouteLabel *)self _labelSizeForText:v6];
  if (v7 < width) {
    double width = v7;
  }
  if (v8 < height) {
    double height = v8;
  }

  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)_setTextColorFollowsTintColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MPRouteLabel *)self titleLabel];
  [v4 _setTextColorFollowsTintColor:v3];
}

- (void)setUpdatesRouteInternally:(BOOL)a3
{
  if (self->_updatesRouteInternally != a3)
  {
    self->_BOOL updatesRouteInternally = a3;
    [(MPRouteLabel *)self subscribeToRouteNotificationIfNeeded];
  }
}

- (void)setOmitGroupLeaderName:(BOOL)a3
{
  if (self->_omitGroupLeaderName != a3)
  {
    self->_omitGroupLeaderName = a3;
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (void)setDisplayAsSiriSuggestion:(BOOL)a3
{
  if (self->_displayAsSiriSuggestion != a3)
  {
    self->_displayAsSiriSuggestion = a3;
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (void)setTruncationMode:(int64_t)a3
{
  if (self->_truncationMode != a3)
  {
    self->_int64_t truncationMode = a3;
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[BSUIEmojiLabelView setTextAlignment:](self->_contentView, "setTextAlignment:");
  }
}

- (void)setMinimumEndCharacterCount:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPRouteLabel.m" lineNumber:111 description:@"MPRouteLabel's minimumEndCharacter property must be greater than or equal to 0."];
  }
  if (self->_minimumEndCharacterCount != a3)
  {
    self->_int64_t minimumEndCharacterCount = a3;
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  if (self->_forcesUppercaseText != a3)
  {
    self->_int forcesUppercaseText = a3;
    [(MPRouteLabel *)self invalidateIntrinsicContentSize];
    [(MPRouteLabel *)self setNeedsLayout];
  }
}

- (BOOL)_textColorFollowsTintColor
{
  v2 = [(MPRouteLabel *)self titleLabel];
  char v3 = [v2 _textColorFollowsTintColor];

  return v3;
}

- (double)_baselineOffsetFromBottom
{
  [(BSUIEmojiLabelView *)self->_contentView _baselineOffsetFromBottom];
  return result;
}

- (UILabel)titleLabel
{
  return (UILabel *)[(BSUIEmojiLabelView *)self->_contentView contentLabel];
}

@end