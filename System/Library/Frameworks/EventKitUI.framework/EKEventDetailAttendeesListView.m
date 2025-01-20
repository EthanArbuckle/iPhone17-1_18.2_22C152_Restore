@interface EKEventDetailAttendeesListView
- (BOOL)_haveContentToDraw;
- (BOOL)_haveInviteesToDraw;
- (BOOL)_shouldAlwaysDrawSingleColumn;
- (BOOL)groupsNames;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (EKEventDetailAttendeesListView)initWithFrame:(CGRect)a3;
- (NSArray)ungrouped;
- (UIColor)highlightedTextColor;
- (UIColor)textColor;
- (double)_calculateHeightForItemCounts:(int64_t)a3[4];
- (double)_calculateHeightForSpinnerDisplayMode;
- (double)bottomSpacingForSpinner;
- (double)calculatedHeight;
- (double)maxHeight;
- (id)generateAttributedStringsFromDisplayParticipants:(id)a3 glyph:(id)a4 displayCount:(int64_t)a5;
- (int64_t)columnAItems;
- (int64_t)columnBItems;
- (void)_createSpinnerViewIfNeeded;
- (void)_layoutSpinner;
- (void)_setShowingSpinner:(BOOL)a3;
- (void)contentSizeCategoryChanged;
- (void)dealloc;
- (void)drawNames:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)finalizeInviteNames;
- (void)layoutSubviews;
- (void)recalculateHeight;
- (void)setBottomSpacingForSpinner:(double)a3;
- (void)setGroupsNames:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setInvitees:(id)a3 forStatus:(int64_t)a4;
- (void)setTextColor:(id)a3;
- (void)setUngrouped:(id)a3;
- (void)showSpinner;
@end

@implementation EKEventDetailAttendeesListView

- (EKEventDetailAttendeesListView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventDetailAttendeesListView;
  v3 = -[EKEventDetailAttendeesListView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F0D03B68];
    inviteeNames = v3->_inviteeNames;
    v3->_inviteeNames = (NSMutableArray *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_contentSizeCategoryChanged name:*MEMORY[0x1E4FB27A8] object:0];

    v7 = [(EKEventDetailAttendeesListView *)v3 layer];
    [v7 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.enableContext"];
    [v7 setNeedsDisplay];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailAttendeesListView;
  [(EKEventDetailAttendeesListView *)&v4 dealloc];
}

- (void)contentSizeCategoryChanged
{
  finalizedNames = self->_finalizedNames;
  self->_finalizedNames = 0;
}

- (void)setInvitees:(id)a3 forStatus:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(EKEventDetailAttendeesListView *)self _haveInviteesToDraw];
  [(NSMutableArray *)self->_inviteeNames setObject:v6 atIndexedSubscript:a4];
  uint64_t v8 = [v6 count];

  if (v8 && !v7)
  {
    self->_actualHeight = 0.0;
    [(EKEventDetailAttendeesListView *)self invalidateIntrinsicContentSize];
    [(EKEventDetailAttendeesListView *)self _setShowingSpinner:0];
    [(EKEventDetailAttendeesListView *)self setNeedsDisplay];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  [(EKEventDetailAttendeesListView *)self setNeedsDisplay];
}

- (BOOL)_haveInviteesToDraw
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_inviteeNames;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "count", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_haveContentToDraw
{
  return [(EKEventDetailAttendeesListView *)self _haveInviteesToDraw] || !self->_showingSpinner;
}

- (void)layoutSubviews
{
  if (self->_spinnerView) {
    [(EKEventDetailAttendeesListView *)self _layoutSpinner];
  }
}

- (CGSize)intrinsicContentSize
{
  [(EKEventDetailAttendeesListView *)self calculatedHeight];
  double v3 = v2;
  double v4 = 260.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (BOOL)_shouldAlwaysDrawSingleColumn
{
  double v2 = [(EKEventDetailAttendeesListView *)self traitCollection];
  BOOL v3 = EKUIPrefersLargerTextThanDefault(v2);

  return v3;
}

- (double)maxHeight
{
  return EKUICurrentWindowHeightWithViewHierarchy(self) * 0.660000026;
}

- (double)_calculateHeightForItemCounts:(int64_t)a3[4]
{
  int64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int64_t v8 = 0;
  do
  {
    int64_t v9 = a3[v5];
    v6 += v9;
    if (v9)
    {
      int64_t v8 = v5;
      ++v7;
    }
    ++v5;
  }
  while (v5 != 4);
  if (v7 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v7;
  }
  uint64_t columnBItems = v10 + v6 - 1;
  if ([(EKEventDetailAttendeesListView *)self _shouldAlwaysDrawSingleColumn])
  {
    self->_int64_t columnAItems = columnBItems;
    self->_uint64_t columnBItems = 0;
LABEL_14:
    v13 = (void *)MEMORY[0x1E4FB08E0];
    goto LABEL_48;
  }
  int64_t v12 = llroundf((float)((float)columnBItems + 1.0) * 0.5);
  self->_int64_t columnAItems = 0;
  self->_uint64_t columnBItems = 0;
  if (v7 == 1)
  {
    self->_int64_t columnAItems = v12;
    self->_uint64_t columnBItems = columnBItems - v12;
    self->_firstColumnBType = v8;
    if (self->_columnAItems <= self->_columnBItems) {
      uint64_t columnBItems = self->_columnBItems;
    }
    else {
      uint64_t columnBItems = self->_columnAItems;
    }
    goto LABEL_14;
  }
  int64_t v14 = 0;
  char v15 = 0;
  self->_firstColumnBType = 4;
  do
  {
    uint64_t v16 = a3[v14];
    if (!v16) {
      goto LABEL_44;
    }
    int64_t columnAItems = self->_columnAItems;
    unint64_t v18 = v12 - columnAItems;
    if (v12 - columnAItems < 1 || (v16 >= 3 ? (BOOL v19 = v18 == 1) : (BOOL v19 = 0), v19 || self->_firstColumnBType != 4))
    {
      self->_columnBItems += v16 + 1;
      if (self->_firstColumnBType == 4) {
        self->_firstColumnBType = v14;
      }
      if (v15)
      {
LABEL_34:
        char v15 = 0;
        --self->_columnAItems;
        goto LABEL_44;
      }
    }
    else
    {
      int64_t v20 = columnAItems + v16;
      if (columnAItems + v16 <= v12)
      {
        self->_int64_t columnAItems = v20;
        if (v20 < v12)
        {
          self->_int64_t columnAItems = v20 + 1;
          char v15 = 1;
          goto LABEL_44;
        }
      }
      else if (v16 > (uint64_t)v18 && v18 >= 2)
      {
        self->_int64_t columnAItems = v12;
        if (v16 == v18 + 1)
        {
          self->_int64_t columnAItems = v12 - 1;
          int64_t v22 = self->_columnBItems + 1;
        }
        else
        {
          int64_t v22 = self->_columnBItems;
        }
        self->_uint64_t columnBItems = v16 - v18 + v22 + 1;
        if (self->_firstColumnBType == 4)
        {
          char v15 = 0;
          self->_firstColumnBType = v14;
          goto LABEL_44;
        }
      }
      else
      {
        if (v20 <= columnBItems - columnAItems)
        {
          char v15 = 0;
          self->_int64_t columnAItems = v20;
          goto LABEL_44;
        }
        self->_firstColumnBType = v14;
        self->_columnBItems += v16 + 1;
        if (v15) {
          goto LABEL_34;
        }
      }
    }
    char v15 = 0;
LABEL_44:
    ++v14;
  }
  while (v14 != 4);
  int64_t v23 = self->_columnBItems - 1;
  self->_uint64_t columnBItems = v23;
  v13 = (void *)MEMORY[0x1E4FB08E0];
  if (self->_columnAItems <= v23) {
    uint64_t columnBItems = v23;
  }
  else {
    uint64_t columnBItems = self->_columnAItems;
  }
LABEL_48:
  uint64_t v24 = *MEMORY[0x1E4FB28D8];
  v25 = [v13 preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v25 lineHeight];
  double v27 = v26;
  v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v24];
  [v28 _leading];
  CalRoundToScreenScale(v27 + v29);
  double v31 = v30 * (double)columnBItems;

  return v31;
}

- (void)recalculateHeight
{
  self->_actualHeight = 0.0;
  [(EKEventDetailAttendeesListView *)self calculatedHeight];
}

- (double)calculatedHeight
{
  if ([(EKEventDetailAttendeesListView *)self _haveContentToDraw])
  {
    double actualHeight = self->_actualHeight;
    if (actualHeight <= 0.0)
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        int64_t v5 = [(NSMutableArray *)self->_inviteeNames objectAtIndexedSubscript:i];
        statusCounts = self->_statusCounts;
        self->_statusCounts[i] = [v5 count];
      }
      [(EKEventDetailAttendeesListView *)self _calculateHeightForItemCounts:self->_statusCounts];
      double actualHeight = v7;
      [(EKEventDetailAttendeesListView *)self maxHeight];
      if (actualHeight > v8)
      {
        int64_t v9 = self->_statusCounts;
        uint64_t v10 = 1;
        int v11 = 1;
        do
        {
          do
          {
            uint64_t v12 = [(NSMutableArray *)self->_inviteeNames objectAtIndexedSubscript:v10];
            if ([(id)v12 count])
            {
              int64_t v13 = statusCounts[v10];
              int64_t v14 = [(NSMutableArray *)self->_inviteeNames objectAtIndexedSubscript:v10];
              LOBYTE(v13) = v13 == [v14 count];

              if (v13) {
                LODWORD(v12) = 0;
              }
              else {
                LODWORD(v12) = v11;
              }
              int v11 = v12;
            }
            else
            {

              LOBYTE(v12) = v11;
            }
            ++v10;
          }
          while (v10 != 4);
          uint64_t v15 = 0;
          if (v12)
          {
            int64_t v17 = 0;
            do
            {
              uint64_t v18 = *(int64_t *)((char *)v9 + v15);
              BOOL v19 = v18 < 1;
              uint64_t v20 = v18 - 1;
              if (!v19)
              {
                if (!v17) {
                  int64_t v17 = v20;
                }
                *(int64_t *)((char *)v9 + v15) = v17;
              }
              v15 += 8;
            }
            while (v15 != 32);
          }
          else
          {
            for (uint64_t j = 1; j != 4; ++j)
            {
              if (v9[j] >= statusCounts[v15]) {
                uint64_t v15 = j;
              }
            }
            --statusCounts[v15];
          }
          [(EKEventDetailAttendeesListView *)self _calculateHeightForItemCounts:self->_statusCounts];
          double actualHeight = v21;
          [(EKEventDetailAttendeesListView *)self maxHeight];
          uint64_t v10 = 1;
          int v11 = 1;
        }
        while (actualHeight > v22);
        if ((v12 & 1) == 0
          && ![(EKEventDetailAttendeesListView *)self _shouldAlwaysDrawSingleColumn])
        {
          int64_t columnAItems = self->_columnAItems;
          int64_t columnBItems = self->_columnBItems;
          int64_t v25 = columnAItems - columnBItems;
          if (columnAItems <= columnBItems)
          {
            BOOL v32 = columnBItems == columnAItems;
            BOOL v19 = columnBItems <= columnAItems;
            int64_t v33 = columnBItems - columnAItems;
            if (!v19 && !v32)
            {
              do
              {
                if (self->_firstColumnBType < 1) {
                  break;
                }
                int64_t v40 = v33;
                int64_t v34 = 0;
                int64_t v35 = 0;
                uint64_t v36 = 0;
                do
                {
                  v37 = -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v34, v40);
                  uint64_t v38 = [v37 count] - self->_statusCounts[v34];

                  if (v38 > v36)
                  {
                    uint64_t v36 = v38;
                    int64_t v35 = v34;
                  }
                  ++v34;
                }
                while (self->_firstColumnBType > v34);
                if (v36 <= 0) {
                  break;
                }
                ++statusCounts[v35];
                int64_t v33 = v40 - 1;
                if (v40 == 1) {
                  break;
                }
              }
              while (v36 != 1);
            }
          }
          else
          {
            uint64_t v39 = 456;
            do
            {
              uint64_t v26 = *(uint64_t *)((char *)&self->super.super.super.isa + v39);
              if (v26 > 3) {
                break;
              }
              uint64_t v27 = 0;
              uint64_t v28 = 0;
              do
              {
                double v29 = -[NSMutableArray objectAtIndexedSubscript:](self->_inviteeNames, "objectAtIndexedSubscript:", v26, v39);
                uint64_t v30 = [v29 count] - self->_statusCounts[v26];

                if (v30 > v28)
                {
                  uint64_t v28 = v30;
                  uint64_t v27 = v26;
                }
                ++v26;
              }
              while (v26 != 4);
              if (v28 > 0)
              {
                ++statusCounts[v27];
                --v25;
              }
            }
            while (v25 && v28);
          }
        }
      }
      self->_double actualHeight = actualHeight;
    }
    return actualHeight;
  }
  else
  {
    [(EKEventDetailAttendeesListView *)self _calculateHeightForSpinnerDisplayMode];
  }
  return result;
}

- (double)_calculateHeightForSpinnerDisplayMode
{
  [(EKEventDetailAttendeesListView *)self _createSpinnerViewIfNeeded];
  [(UIActivityIndicatorView *)self->_spinnerView frame];
  double v4 = v3;
  [(EKEventDetailAttendeesListView *)self bottomSpacingForSpinner];
  return v5 + v4;
}

- (void)finalizeInviteNames
{
  double v3 = (NSArray *)objc_opt_new();
  for (uint64_t i = 0; i != 4; ++i)
  {
    double v5 = [(NSMutableArray *)self->_inviteeNames objectAtIndexedSubscript:i];
    uint64_t v6 = +[EKUISemiConstantCache sharedInstance];
    double v7 = [v6 statusGlyphForStatusType:i];
    double v8 = [(EKEventDetailAttendeesListView *)self generateAttributedStringsFromDisplayParticipants:v5 glyph:v7 displayCount:self->_statusCounts[i]];
    [(NSArray *)v3 addObjectsFromArray:v8];
  }
  finalizedNames = self->_finalizedNames;
  self->_finalizedNames = v3;
}

- (id)generateAttributedStringsFromDisplayParticipants:(id)a3 glyph:(id)a4 displayCount:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = objc_opt_new();
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __102__EKEventDetailAttendeesListView_generateAttributedStringsFromDisplayParticipants_glyph_displayCount___block_invoke;
  uint64_t v20 = &unk_1E60895D8;
  id v10 = v7;
  id v21 = v10;
  int64_t v24 = a5;
  id v11 = v8;
  id v22 = v11;
  id v12 = v9;
  id v23 = v12;
  [v10 enumerateObjectsUsingBlock:&v17];
  if (objc_msgSend(v10, "count", v17, v18, v19, v20))
  {
    int64_t v13 = objc_opt_new();
    [v12 addObject:v13];
  }
  int64_t v14 = v23;
  id v15 = v12;

  return v15;
}

void __102__EKEventDetailAttendeesListView_generateAttributedStringsFromDisplayParticipants_glyph_displayCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = objc_opt_new();
  int64_t v9 = objc_opt_new();
  unint64_t v10 = [*(id *)(a1 + 32) count];
  unint64_t v11 = *(void *)(a1 + 56);
  if (v10 > v11 && v11 - 1 == a3)
  {
    int v20 = [*(id *)(a1 + 32) count] - *(_DWORD *)(a1 + 56);
    id v21 = NSString;
    id v22 = EventKitUIBundle();
    id v23 = [v22 localizedStringForKey:@" %d more…" value:&stru_1F0CC2140 table:0];
    int64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, (v20 + 1));

    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    v31[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    v32[0] = v26;
    v31[1] = *MEMORY[0x1E4FB0700];
    uint64_t v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v32[1] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    double v29 = (void *)[v25 initWithString:v24 attributes:v28];

    [v9 appendAttributedString:v29];
    [v8 setXMore:1];
    *a4 = 1;
  }
  else
  {
    int64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    if (CalInterfaceIsLeftToRight()) {
      int64_t v14 = &unk_1F0D03B80;
    }
    else {
      int64_t v14 = &unk_1F0D03B98;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v16 = [v7 displayString];
    uint64_t v17 = (void *)[v15 initWithAttributedString:v16];

    int v18 = [v7 isOptionalParticipant];
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    if (v18) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    uint64_t v30 = [MEMORY[0x1E4FB1618] labelColor];
    }
    objc_msgSend(v17, "addAttribute:value:range:", v19, v30, 0, objc_msgSend(v17, "length"));

    [v9 appendAttributedString:*(void *)(a1 + 40)];
    [v9 appendAttributedString:v13];
    [v9 appendAttributedString:v17];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0818], v14, 0, objc_msgSend(v9, "length"));
  }
  [v8 setString:v9];
  [*(id *)(a1 + 48) addObject:v8];
}

- (void)drawRect:(CGRect)a3
{
  if ([(EKEventDetailAttendeesListView *)self _haveContentToDraw])
  {
    if (![(NSArray *)self->_finalizedNames count]) {
      [(EKEventDetailAttendeesListView *)self finalizeInviteNames];
    }
    finalizedNames = self->_finalizedNames;
    [(EKEventDetailAttendeesListView *)self drawNames:finalizedNames];
  }
}

- (void)drawNames:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v19 = "";
  long long v20 = *MEMORY[0x1E4F1DAD8];
  [(EKEventDetailAttendeesListView *)self frame];
  double v6 = v5;
  if ((CalInterfaceIsLeftToRight() & 1) == 0) {
    v17[4] = v6 + v17[4];
  }
  if ([(EKEventDetailAttendeesListView *)self _shouldAlwaysDrawSingleColumn]) {
    double v7 = v6 + -20.0;
  }
  else {
    double v7 = (v6 + -20.0) * 0.5;
  }
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int64_t v13 = __Block_byref_object_copy__9;
  int64_t v14 = __Block_byref_object_dispose__9;
  id v15 = (id)objc_opt_new();
  if (CalInterfaceIsLeftToRight()) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  [(id)v11[5] setAlignment:v8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EKEventDetailAttendeesListView_drawNames___block_invoke;
  v9[3] = &unk_1E6089600;
  v9[4] = self;
  v9[5] = &v16;
  *(double *)&v9[7] = v7;
  v9[6] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __44__EKEventDetailAttendeesListView_drawNames___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v40 = v5;
  if (*(void *)(*(void *)(a1 + 32) + 440) == a3)
  {
    BOOL v6 = CalInterfaceIsLeftToRight() == 0;
    id v5 = v40;
    double v7 = -1.0;
    if (!v6) {
      double v7 = 1.0;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 32)
                                                                + v7 * (*(double *)(a1 + 56) + 20.0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  uint64_t v8 = [v5 string];

  if (v8)
  {
    int64_t v9 = [v40 string];
    uint64_t v10 = objc_opt_new();
    double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    if ([v40 xMore])
    {
      if (CalInterfaceIsLeftToRight()) {
        double v12 = 1.0;
      }
      else {
        double v12 = -1.0;
      }
      int64_t v13 = +[EKUISemiConstantCache sharedInstance];
      int64_t v14 = [v13 statusGlyphForStatusType:0];
      [v14 size];
      double v11 = v11 + v12 * v15;
    }
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    double v17 = *(double *)(a1 + 56);
    double v18 = 0.0;
    if (!IsLeftToRight) {
      double v18 = *(double *)(a1 + 56);
    }
    double v19 = v11 - v18;
    double v20 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v21 = *MEMORY[0x1E4FB28D8];
    id v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [v22 lineHeight];
    double v24 = v23;
    id v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v21];
    [v25 _leading];
    CalRoundToScreenScale(v24 + v26);
    double v28 = v27 + 3.0;

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0, objc_msgSend(v9, "length"));
    objc_msgSend(v9, "drawWithRect:options:context:", 33, v10, v19, v20, v17, v28);
    double v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v21];
    [v29 lineHeight];
    double v31 = v30;
    BOOL v32 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v21];
    [v32 _leading];
    CalRoundToScreenScale(v31 + v33);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v34
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
  }
  else
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) <= 0.0) {
      goto LABEL_17;
    }
    uint64_t v35 = *MEMORY[0x1E4FB28D8];
    int64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [v9 lineHeight];
    double v37 = v36;
    uint64_t v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v35];
    [v10 _leading];
    CalRoundToScreenScale(v37 + v38);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v39
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
  }

LABEL_17:
}

- (void)showSpinner
{
}

- (void)_createSpinnerViewIfNeeded
{
  if (!self->_spinnerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1400]);
    id v4 = (UIActivityIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    spinnerView = self->_spinnerView;
    self->_spinnerView = v4;

    [(UIActivityIndicatorView *)self->_spinnerView sizeToFit];
    [(UIActivityIndicatorView *)self->_spinnerView setActivityIndicatorViewStyle:100];
    BOOL v6 = self->_spinnerView;
    [(UIActivityIndicatorView *)v6 setAutoresizingMask:45];
  }
}

- (void)_layoutSpinner
{
  [(UIActivityIndicatorView *)self->_spinnerView frame];
  double v4 = v3;
  [(EKEventDetailAttendeesListView *)self frame];
  CalRoundToScreenScale((v5 - v4) * 0.5);
  spinnerView = self->_spinnerView;

  -[UIActivityIndicatorView setFrame:](spinnerView, "setFrame:");
}

- (void)_setShowingSpinner:(BOOL)a3
{
  if (a3)
  {
    [(EKEventDetailAttendeesListView *)self _createSpinnerViewIfNeeded];
    double v5 = [(UIActivityIndicatorView *)self->_spinnerView superview];

    if (!v5)
    {
      [(EKEventDetailAttendeesListView *)self addSubview:self->_spinnerView];
      [(EKEventDetailAttendeesListView *)self _layoutSpinner];
    }
    [(UIActivityIndicatorView *)self->_spinnerView setHidden:0];
    [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)self->_spinnerView stopAnimating];
    [(UIActivityIndicatorView *)self->_spinnerView setHidden:1];
    [(UIActivityIndicatorView *)self->_spinnerView removeFromSuperview];
  }
  self->_showingSpinner = a3;
}

- (NSArray)ungrouped
{
  return self->_ungrouped;
}

- (void)setUngrouped:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)groupsNames
{
  return self->_groupsNames;
}

- (void)setGroupsNames:(BOOL)a3
{
  self->_groupsNames = a3;
}

- (double)bottomSpacingForSpinner
{
  return self->_bottomSpacingForSpinner;
}

- (void)setBottomSpacingForSpinner:(double)a3
{
  self->_bottomSpacingForSpinner = a3;
}

- (int64_t)columnAItems
{
  return self->_columnAItems;
}

- (int64_t)columnBItems
{
  return self->_columnBItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_ungrouped, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_finalizedNames, 0);

  objc_storeStrong((id *)&self->_inviteeNames, 0);
}

@end