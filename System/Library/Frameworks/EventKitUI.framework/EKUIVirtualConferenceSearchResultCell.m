@interface EKUIVirtualConferenceSearchResultCell
+ (id)_boldTitleFont;
- (void)updateWithCustomVirtualConference:(id)a3;
- (void)updateWithRoomType:(id)a3;
@end

@implementation EKUIVirtualConferenceSearchResultCell

- (void)updateWithRoomType:(id)a3
{
  id v5 = a3;
  if (([(EKVirtualConferenceRoomType *)self->_currentRoomType isEqual:v5] & 1) == 0)
  {
    currentCustomVirtualConference = self->_currentCustomVirtualConference;
    self->_currentCustomVirtualConference = 0;

    objc_storeStrong((id *)&self->_currentRoomType, a3);
    v7 = [(EKUILocationSearchResultCell *)self defaultContentConfiguration];
    objc_msgSend(v7, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
    [MEMORY[0x1E4F25510] conferenceImageSize];
    double v9 = v8;
    v10 = [v7 imageProperties];
    objc_msgSend(v10, "setReservedLayoutSize:", v9, v9);

    v11 = [v7 imageProperties];
    objc_msgSend(v11, "setMaximumSize:", v9, v9);

    if (updateWithRoomType__onceToken != -1) {
      dispatch_once(&updateWithRoomType__onceToken, &__block_literal_global_64);
    }
    v12 = [(id)updateWithRoomType__cache objectForKey:v5];
    if (v12)
    {
      v13 = [v5 title];
      [v7 setText:v13];

      [v7 setImage:v12];
      [(EKUIVirtualConferenceSearchResultCell *)self setContentConfiguration:v7];
    }
    else
    {
      [v7 setText:@" "];
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1818]);
      [v7 setImage:v14];

      [(EKUIVirtualConferenceSearchResultCell *)self setContentConfiguration:v7];
      v15 = (void *)MEMORY[0x1E4F57B50];
      currentRoomType = self->_currentRoomType;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_2;
      v17[3] = &unk_1E6089C20;
      v17[4] = self;
      id v18 = v7;
      [v15 imageForRoomType:currentRoomType completionHandler:v17];
    }
  }
}

void __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)updateWithRoomType__cache;
  updateWithRoomType__cache = (uint64_t)v0;
}

void __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [(id)updateWithRoomType__cache setObject:v5 forKey:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_3;
  v10[3] = &unk_1E60890B0;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1016) isEqual:*(void *)(a1 + 40)];
  if (result)
  {
    v3 = [*(id *)(a1 + 40) title];
    [*(id *)(a1 + 48) setText:v3];

    [*(id *)(a1 + 48) setImage:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    return [v5 setContentConfiguration:v4];
  }
  return result;
}

- (void)updateWithCustomVirtualConference:(id)a3
{
  id v5 = a3;
  currentRoomType = self->_currentRoomType;
  self->_currentRoomType = 0;

  objc_storeStrong((id *)&self->_currentCustomVirtualConference, a3);
  v7 = [(EKVirtualConference *)self->_currentCustomVirtualConference joinMethods];
  id v8 = [v7 firstObject];
  id v9 = [v8 URL];

  v10 = [(EKUILocationSearchResultCell *)self defaultContentConfiguration];
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
  id v11 = [MEMORY[0x1E4FB1618] systemGray2Color];
  id v12 = [v10 imageProperties];
  [v12 setTintColor:v11];

  id v13 = [(id)objc_opt_class() _boldTitleFont];
  id v14 = [v10 textProperties];
  [v14 setFont:v13];

  [v10 setText:@" "];
  [v10 setSecondaryText:@" "];
  v15 = [(EKUIVirtualConferenceSearchResultCell *)self contentConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [v15 secondaryText];
    v17 = [v9 absoluteString];
    id v18 = v17;
    if (v16 && v17)
    {
      if ([v16 rangeOfString:v17] != 0x7FFFFFFFFFFFFFFFLL)
      {

        goto LABEL_9;
      }
      uint64_t v19 = [v18 rangeOfString:v16];

      if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  [(EKUIVirtualConferenceSearchResultCell *)self setContentConfiguration:v10];
LABEL_9:
  v20 = (void *)MEMORY[0x1E4F57B50];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke;
  v22[3] = &unk_1E6087838;
  v22[4] = self;
  id v23 = v10;
  id v21 = v10;
  [v20 displayDetailsForURL:v9 completionHandler:v22];
}

void __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke_2;
  block[3] = &unk_1E6089218;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v17 = v10;
  uint64_t v18 = v11;
  id v19 = v12;
  id v20 = v8;
  id v21 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 1024) joinMethods];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 URL];
  LODWORD(v2) = [v2 isEqual:v5];

  if (v2)
  {
    [*(id *)(a1 + 48) setImage:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) setText:*(void *)(a1 + 64)];
    id v6 = NSString;
    v7 = EventKitUIBundle();
    id v8 = [v7 localizedStringForKey:@"“%@”" value:&stru_1F0CC2140 table:0];
    id v9 = [*(id *)(a1 + 32) absoluteString];
    id v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);
    [*(id *)(a1 + 48) setSecondaryText:v10];

    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    [v11 setContentConfiguration:v12];
  }
}

+ (id)_boldTitleFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2 options:0];
  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCustomVirtualConference, 0);

  objc_storeStrong((id *)&self->_currentRoomType, 0);
}

@end