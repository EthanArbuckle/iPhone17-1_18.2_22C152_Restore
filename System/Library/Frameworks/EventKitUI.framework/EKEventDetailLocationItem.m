@interface EKEventDetailLocationItem
+ (BOOL)isValidLocation:(id)a3 event:(id)a4;
- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification;
- (EKEventDetailLocationItem)initWithLocationName:(id)a3 forEvent:(id)a4;
- (NSString)locationTitle;
- (UITapGestureRecognizer)tapRecognizer;
- (id)locationView;
- (void)_locationTapped;
- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3;
- (void)setLocationTitle:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)updateAttributedString;
- (void)updateLocation:(id)a3 forEvent:(id)a4;
@end

@implementation EKEventDetailLocationItem

- (EKEventDetailLocationItem)initWithLocationName:(id)a3 forEvent:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EKEventDetailLocationItem;
  v8 = [(EKEventDetailLocationItem *)&v24 init];
  if (v8)
  {
    if ([v7 hasAttendees])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v9 = objc_msgSend(v7, "attendees", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ([v14 participantType] == 2)
            {
              v15 = [v14 name];
              int v16 = [v15 isEqualToString:v6];

              if (v16)
              {
                v8->_locationIsAttendee = 1;
                v8->_locationStatus = [v14 participantStatus];
                uint64_t v17 = [v14 comment];
                locationComment = v8->_locationComment;
                v8->_locationComment = (NSString *)v17;

                goto LABEL_14;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    [(EKEventDetailLocationItem *)v8 updateLocation:v6 forEvent:v7];
  }

  return v8;
}

+ (BOOL)isValidLocation:(id)a3 event:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 hasAttendees])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = objc_msgSend(v6, "attendees", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v12 participantType] == 2)
          {
            v13 = [v12 name];
            int v14 = [v13 isEqualToString:v5];

            if (v14)
            {
              v15 = [v12 comment];
              if ([v15 length])
              {
              }
              else
              {
                int v16 = [v6 virtualConference];
                uint64_t v17 = [v16 serializationBlockTitle];
                char v18 = [v17 isEqualToString:v5];

                if (v18)
                {
                  BOOL v19 = 0;
                  goto LABEL_17;
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v19 = 1;
LABEL_17:
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (void)updateAttributedString
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = CalendarAppTintColor();
  if (self->_locationIsAttendee || !self->_locationURL)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] labelColor];

    v3 = (void *)v4;
  }
  uint64_t v23 = *MEMORY[0x1E4FB0700];
  v24[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_locationTitle attributes:v5];
  if (self->_locationIsAttendee)
  {
    id v7 = [(id)objc_opt_class() _locationFont];
    uint64_t v8 = attributedStatusGlyph();
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v8];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v9 appendAttributedString:v10];
    [v9 appendAttributedString:v6];
    if ([(NSString *)self->_locationComment length])
    {
      [MEMORY[0x1E4F57C18] sharedInstance];
      uint64_t v11 = v21 = v8;
      long long v20 = [v11 commentIconStringForFont:v7];

      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v9 appendAttributedString:v12];
      [v9 appendAttributedString:v20];
      [v9 appendAttributedString:v10];
      EventKitUIBundle();
      v13 = long long v22 = v6;
      int v14 = [v13 localizedStringForKey:@"“%@”" value:&stru_1F0CC2140 table:0];

      v15 = objc_msgSend(NSString, "localizedStringWithFormat:", v14, self->_locationComment);
      int v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15 attributes:v5];
      [v9 appendAttributedString:v16];

      id v6 = v22;
      uint64_t v8 = v21;
    }
    uint64_t v17 = [(EKEventDetailLocationItem *)self locationView];
    [v17 setAttributedText:v9];
  }
  else
  {
    id v7 = [(EKEventDetailLocationItem *)self locationView];
    [v7 setAttributedText:v6];
  }

  char v18 = [(EKEventDetailLocationItem *)self locationView];
  BOOL v19 = [(id)objc_opt_class() _locationFont];
  [v18 setFont:v19];
}

- (void)updateLocation:(id)a3 forEvent:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  locationURL = self->_locationURL;
  self->_locationURL = 0;

  uint64_t v8 = [v6 preferredLocation];
  int v9 = [v8 isPrediction];

  if (v9)
  {
    uint64_t v10 = [(EKEventDetailLocationItem *)self locationView];
    uint64_t v11 = v10;
    uint64_t v12 = 3;
LABEL_3:
    [v10 setDataDetectorTypes:v12];

    goto LABEL_5;
  }
  if (!self->_locationIsAttendee)
  {
    objc_msgSend(MEMORY[0x1E4F25580], "mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:", v22, v6, -[EKEventDetailLocationItem hasMapItemLaunchOptionFromTimeToLeaveNotification](self, "hasMapItemLaunchOptionFromTimeToLeaveNotification"));
    BOOL v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
    long long v20 = self->_locationURL;
    self->_locationURL = v19;

    long long v21 = self->_locationURL;
    uint64_t v10 = [(EKEventDetailLocationItem *)self locationView];
    uint64_t v11 = v10;
    if (v21) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 7;
    }
    goto LABEL_3;
  }
LABEL_5:
  locationTapRecognizer = self->_locationTapRecognizer;
  if (self->_locationURL)
  {
    if (!locationTapRecognizer)
    {
      int v14 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__locationTapped];
      v15 = self->_locationTapRecognizer;
      self->_locationTapRecognizer = v14;
    }
    int v16 = [(EKEventDetailLocationItem *)self locationView];
    [v16 addGestureRecognizer:self->_locationTapRecognizer];
  }
  else
  {
    if (!locationTapRecognizer) {
      goto LABEL_12;
    }
    int v16 = [(EKEventDetailLocationItem *)self locationView];
    [v16 removeGestureRecognizer:self->_locationTapRecognizer];
  }

LABEL_12:
  uint64_t v17 = [(EKEventDetailLocationItem *)self locationTitle];
  char v18 = [v22 isEqualToString:v17];

  if ((v18 & 1) == 0)
  {
    [(EKEventDetailLocationItem *)self setLocationTitle:v22];
    [(EKEventDetailLocationItem *)self updateAttributedString];
  }
}

- (id)locationView
{
  locationView = self->_locationView;
  if (!locationView)
  {
    uint64_t v4 = [EKTextViewWithLabelTextMetrics alloc];
    id v5 = -[EKTextViewWithLabelTextMetrics initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_locationView;
    self->_locationView = v5;

    [(EKTextViewWithLabelTextMetrics *)self->_locationView setLineBreakMode:2];
    id v7 = self->_locationView;
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKTextViewWithLabelTextMetrics *)v7 setBackgroundColor:v8];

    [(EKTextViewWithLabelTextMetrics *)self->_locationView setOpaque:0];
    [(EKTextViewWithLabelTextMetrics *)self->_locationView setDelegate:self];
    locationView = self->_locationView;
  }

  return locationView;
}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v4 = (EKTextViewWithLabelTextMetrics *)a3;
  if (self->_locationView == v4)
  {
    int v9 = v4;
    id v5 = [(EKTextViewWithLabelTextMetrics *)v4 selectedTextRange];
    uint64_t v4 = v9;
    if (v5)
    {
      id v6 = [(EKTextViewWithLabelTextMetrics *)v9 selectedTextRange];
      char v7 = [v6 isEmpty];

      uint64_t v4 = v9;
      if ((v7 & 1) == 0)
      {
        uint64_t v8 = [(EKTextViewWithLabelTextMetrics *)v9 text];
        -[EKTextViewWithLabelTextMetrics setSelectedRange:](v9, "setSelectedRange:", 0, [v8 length]);

        uint64_t v4 = v9;
      }
    }
  }
}

- (void)_locationTapped
{
  uint64_t v3 = [(EKTextViewWithLabelTextMetrics *)self->_locationView selectedTextRange];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(EKTextViewWithLabelTextMetrics *)self->_locationView selectedTextRange],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEmpty],
        v5,
        v4,
        !v6))
  {
    locationView = self->_locationView;
    [(EKTextViewWithLabelTextMetrics *)locationView setSelectedTextRange:0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 openURL:self->_locationURL configuration:0 completionHandler:&__block_literal_global_48];
  }
}

void __44__EKEventDetailLocationItem__locationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    int v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when location tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (NSString)locationTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationTitle:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_locationComment, 0);
  objc_storeStrong((id *)&self->_locationTapRecognizer, 0);
  objc_storeStrong((id *)&self->_locationURL, 0);

  objc_storeStrong((id *)&self->_locationView, 0);
}

@end