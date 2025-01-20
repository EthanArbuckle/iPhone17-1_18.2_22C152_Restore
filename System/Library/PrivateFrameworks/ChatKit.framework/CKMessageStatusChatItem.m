@interface CKMessageStatusChatItem
+ (UIButton)sizingButton;
+ (id)thePastDateFormatter;
+ (id)thisWeekRelativeDateFormatter;
+ (id)todayDateFormatter;
+ (void)setSizingButton:(id)a3;
- (BOOL)isButtonSizeLoaded;
- (BOOL)isLabelSizeLoaded;
- (BOOL)shouldHideDuringDarkFSM;
- (BOOL)wantsDrawerLayout;
- (CGSize)buttonSize;
- (CGSize)labelSize;
- (CGSize)loadButtonSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)loadLabelSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)size;
- (Class)cellClass;
- (NSAttributedString)transcriptButtonText;
- (UIEdgeInsets)buttonTextAlignmentInsets;
- (UIEdgeInsets)labelTextAlignmentInsets;
- (UIEdgeInsets)transcriptTextAlignmentInsets;
- (char)statusAlignment;
- (char)transcriptOrientation;
- (id)_styledStatusTextWithStatusText:(id)a3 orientation:(char)a4 dateSubText:(id)a5 buttonSubText:(id)a6 errorSubText:(id)a7 overrideTextColor:(id)a8 shouldReplaceWarningIcon:(BOOL)a9;
- (id)createReplayText;
- (id)effectsControlStatusTextForEffectStyleID:(id)a3;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptButtonText;
- (id)loadTranscriptText;
- (id)now;
- (id)time;
- (int64_t)buttonType;
- (int64_t)expireStatusType;
- (int64_t)statusType;
- (unint64_t)count;
- (unint64_t)layoutType;
- (void)setButtonSizeLoaded:(BOOL)a3;
- (void)setLabelSizeLoaded:(BOOL)a3;
- (void)setTranscriptButtonText:(id)a3;
- (void)unloadSize;
- (void)unloadTranscriptText;
@end

@implementation CKMessageStatusChatItem

+ (UIButton)sizingButton
{
  v2 = (void *)_sizingButton;
  if (!_sizingButton)
  {
    uint64_t v3 = +[CKTranscriptStatusCell statusButton];
    v4 = (void *)_sizingButton;
    _sizingButton = v3;

    v2 = (void *)_sizingButton;
  }

  return (UIButton *)v2;
}

+ (void)setSizingButton:(id)a3
{
}

- (char)transcriptOrientation
{
  if ([(CKChatItem *)self isFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (Class)cellClass
{
  [(CKMessageStatusChatItem *)self buttonType];
  v2 = objc_opt_class();

  return (Class)v2;
}

- (void)unloadTranscriptText
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageStatusChatItem;
  [(CKChatItem *)&v4 unloadTranscriptText];
  transcriptButtonText = self->_transcriptButtonText;
  self->_transcriptButtonText = 0;
}

- (void)unloadSize
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageStatusChatItem;
  [(CKChatItem *)&v3 unloadSize];
  self->_buttonSizeLoaded = 0;
  self->_labelSizeLoaded = 0;
}

- (UIEdgeInsets)transcriptTextAlignmentInsets
{
  v19.receiver = self;
  v19.super_class = (Class)CKMessageStatusChatItem;
  [(CKChatItem *)&v19 transcriptTextAlignmentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKMessageStatusChatItem *)self buttonTextAlignmentInsets];
  double v12 = fmax(v4, v11);
  double v14 = fmax(v6, v13);
  double v16 = fmax(v8, v15);
  double v18 = fmax(v10, v17);
  result.right = v18;
  result.bottom = v16;
  result.left = v14;
  result.top = v12;
  return result;
}

- (BOOL)wantsDrawerLayout
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageStatusChatItem;
  if ([(CKChatItem *)&v5 wantsDrawerLayout]) {
    return 1;
  }
  double v3 = +[CKUIBehavior sharedBehaviors];
  char v2 = [v3 timestampsPushBalloons];

  return v2;
}

- (CGSize)size
{
  v13.receiver = self;
  v13.super_class = (Class)CKMessageStatusChatItem;
  [(CKChatItem *)&v13 size];
  double v3 = self;
  [(CKMessageStatusChatItem *)v3 buttonSize];
  double v5 = v4;
  [(CKMessageStatusChatItem *)v3 labelSize];
  if (v5 < v6) {
    double v5 = v6;
  }
  [(CKMessageStatusChatItem *)v3 buttonSize];
  double v8 = v7;
  [(CKMessageStatusChatItem *)v3 labelSize];
  double v10 = v9;

  double v11 = v8 + v10;
  double v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)loadTranscriptText
{
  uint64_t v3 = [(CKMessageStatusChatItem *)self transcriptOrientation];
  int64_t v4 = [(CKMessageStatusChatItem *)self statusType];
  double v5 = 0;
  char v6 = 0;
  double v7 = 0;
  double v8 = 0;
  switch(v4)
  {
    case 0:
      if (![(CKMessageStatusChatItem *)self expireStatusType])
      {
        double v11 = CKFrameworkBundle();
        double v12 = v11;
        objc_super v13 = @"MESSAGE_STATUS_NOSTATUS";
        goto LABEL_39;
      }
      char v6 = 0;
      double v5 = 0;
      double v7 = 0;
      double v8 = 0;
      goto LABEL_86;
    case 1:
      double v9 = [(CKChatItem *)self IMChatItem];
      int v10 = [v9 isStewie];

      double v11 = CKFrameworkBundle();
      double v12 = v11;
      if (v10)
      {
        objc_super v13 = @"MESSAGE_STATUS_SENT_VIA_STEWIE";
        double v14 = @"ChatKit-SYDROB_FEATURES";
      }
      else
      {
        objc_super v13 = @"MESSAGE_STATUS_DELIVERED";
        double v14 = @"ChatKit";
      }
      goto LABEL_40;
    case 2:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_DELIVERED_QUIETLY";
      goto LABEL_39;
    case 3:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_NOTIFIED_RECIPIENT";
      goto LABEL_39;
    case 4:
      double v15 = [(CKMessageStatusChatItem *)self time];
      double v16 = [(CKMessageStatusChatItem *)self now];
      if (!v15)
      {
        v52 = CKFrameworkBundle();
        v53 = v52;
        v54 = @"MESSAGE_STATUS_READ";
        goto LABEL_44;
      }
      double v17 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
      uint64_t v18 = objc_msgSend(v17, "__ck_unitOfDisambiguityFromDate:toDate:", v15, v16);

      switch(v18)
      {
        case 4:
LABEL_12:
          objc_super v19 = +[CKMessageStatusChatItem thePastDateFormatter];
          double v7 = [v19 stringFromDate:v15];
          v20 = NSString;
          v21 = CKFrameworkBundle();
          v22 = v21;
          v23 = @"MESSAGE_STATUS_READ_DATE";
          goto LABEL_54;
        case 16:
          objc_super v19 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
          unsigned __int8 v106 = 0;
          double v7 = [v19 stringFromDate:v15 isRelative:&v106];
          int v59 = v106;
          v60 = NSString;
          v61 = CKFrameworkBundle();
          if (v59) {
            v62 = @"MESSAGE_STATUS_READ_RELATIVE_DAY";
          }
          else {
            v62 = @"MESSAGE_STATUS_READ_DAY";
          }
          goto LABEL_73;
        case 8:
          goto LABEL_12;
      }
      objc_super v19 = +[CKMessageStatusChatItem todayDateFormatter];
      double v7 = [v19 stringFromDate:v15];
      v20 = NSString;
      v21 = CKFrameworkBundle();
      v22 = v21;
      v23 = @"MESSAGE_STATUS_READ_TIME";
      goto LABEL_54;
    case 5:
      double v15 = [(CKMessageStatusChatItem *)self time];
      double v16 = [(CKMessageStatusChatItem *)self now];
      if (v15)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
        uint64_t v25 = objc_msgSend(v24, "__ck_unitOfDisambiguityFromDate:toDate:", v15, v16);

        switch(v25)
        {
          case 4:
LABEL_17:
            objc_super v19 = +[CKMessageStatusChatItem thePastDateFormatter];
            double v7 = [v19 stringFromDate:v15];
            v20 = NSString;
            v21 = CKFrameworkBundle();
            v22 = v21;
            v23 = @"MESSAGE_STATUS_PLAYED_DATE";
            goto LABEL_54;
          case 16:
            objc_super v19 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
            unsigned __int8 v105 = 0;
            double v7 = [v19 stringFromDate:v15 isRelative:&v105];
            int v63 = v105;
            v60 = NSString;
            v61 = CKFrameworkBundle();
            if (v63) {
              v62 = @"MESSAGE_STATUS_PLAYED_RELATIVE_DAY";
            }
            else {
              v62 = @"MESSAGE_STATUS_PLAYED_DAY";
            }
LABEL_73:
            v89 = [v61 localizedStringForKey:v62 value:&stru_1EDE4CA38 table:@"ChatKit"];
            v90 = objc_msgSend(v60, "stringWithFormat:", v89, v7);

            v91 = [MEMORY[0x1E4F42738] sharedApplication];
            uint64_t v92 = [v91 userInterfaceLayoutDirection];

            if (v92 == 1) {
              v93 = @"\u200F";
            }
            else {
              v93 = @"\u200E";
            }
            double v8 = [(__CFString *)v93 stringByAppendingString:v90];

            break;
          case 8:
            goto LABEL_17;
          default:
            objc_super v19 = +[CKMessageStatusChatItem todayDateFormatter];
            double v7 = [v19 stringFromDate:v15];
            v20 = NSString;
            v21 = CKFrameworkBundle();
            v22 = v21;
            v23 = @"MESSAGE_STATUS_PLAYED_TIME";
LABEL_54:
            v64 = [v21 localizedStringForKey:v23 value:&stru_1EDE4CA38 table:@"ChatKit"];
            v65 = objc_msgSend(v20, "stringWithFormat:", v64, v7);

            v66 = [MEMORY[0x1E4F42738] sharedApplication];
            uint64_t v67 = [v66 userInterfaceLayoutDirection];

            if (v67 == 1) {
              v68 = @"\u200F";
            }
            else {
              v68 = @"\u200E";
            }
            double v8 = [(__CFString *)v68 stringByAppendingString:v65];

            break;
        }
      }
      else
      {
        v52 = CKFrameworkBundle();
        v53 = v52;
        v54 = @"MESSAGE_STATUS_PLAYED";
LABEL_44:
        double v8 = [v52 localizedStringForKey:v54 value:&stru_1EDE4CA38 table:@"ChatKit"];

        double v7 = 0;
      }
      goto LABEL_84;
    case 6:
      v26 = [(CKMessageStatusChatItem *)self time];
      double v15 = v26;
      if (!v26)
      {
        unint64_t v55 = [(CKMessageStatusChatItem *)self count];
        if (v55 == 1)
        {
          v56 = CKFrameworkBundle();
          v57 = v56;
          v58 = @"MESSAGE_STATUS_SAVED_GROUP_ONE";
        }
        else
        {
          if (v55)
          {
            v57 = [NSNumber numberWithUnsignedInteger:v55];
            v81 = NSString;
            v82 = CKFrameworkBundle();
            v83 = [v82 localizedStringForKey:@"MESSAGE_STATUS_SAVED_GROUP_MULTIPLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v84 = objc_msgSend(v57, "__ck_localizedString");
            v85 = objc_msgSend(v81, "stringWithFormat:", v83, v84);

            v86 = [MEMORY[0x1E4F42738] sharedApplication];
            uint64_t v87 = [v86 userInterfaceLayoutDirection];

            if (v87 == 1) {
              v88 = @"\u200F";
            }
            else {
              v88 = @"\u200E";
            }
            double v8 = [(__CFString *)v88 stringByAppendingString:v85];

            goto LABEL_70;
          }
          v56 = CKFrameworkBundle();
          v57 = v56;
          v58 = @"MESSAGE_STATUS_SAVED";
        }
        double v8 = [v56 localizedStringForKey:v58 value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_70:

        double v7 = 0;
        goto LABEL_85;
      }
      id v27 = v26;
      v28 = [(CKMessageStatusChatItem *)self now];
      v29 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
      uint64_t v30 = objc_msgSend(v29, "__ck_unitOfDisambiguityFromDate:toDate:", v27, v28);

      switch(v30)
      {
        case 4:
          goto LABEL_22;
        case 16:
          v38 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
          unsigned __int8 v104 = 0;
          double v16 = v27;
          double v7 = [v38 stringFromDate:v27 isRelative:&v104];
          int v69 = v104;
          v70 = NSString;
          v71 = CKFrameworkBundle();
          v72 = v71;
          if (v69) {
            v73 = @"MESSAGE_STATUS_SAVED_RELATIVE_DAY";
          }
          else {
            v73 = @"MESSAGE_STATUS_SAVED_DAY";
          }
          v94 = [v71 localizedStringForKey:v73 value:&stru_1EDE4CA38 table:@"ChatKit"];
          v95 = objc_msgSend(v70, "stringWithFormat:", v94, v7);

          v96 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v97 = [v96 userInterfaceLayoutDirection];

          if (v97 == 1) {
            v98 = @"\u200F";
          }
          else {
            v98 = @"\u200E";
          }
          double v8 = [(__CFString *)v98 stringByAppendingString:v95];

          break;
        case 8:
LABEL_22:
          v31 = +[CKMessageStatusChatItem thePastDateFormatter];
          double v7 = [v31 stringFromDate:v27];
          v32 = NSString;
          v33 = CKFrameworkBundle();
          [v33 localizedStringForKey:@"MESSAGE_STATUS_SAVED_DATE" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v35 = v34 = v28;
          objc_msgSend(v32, "stringWithFormat:", v35, v7);
          v102 = v15;
          v37 = id v36 = v27;

          v28 = v34;
          v38 = v31;

          v39 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v40 = [v39 userInterfaceLayoutDirection];

          if (v40 == 1) {
            v41 = @"\u200F";
          }
          else {
            v41 = @"\u200E";
          }
          double v8 = [(__CFString *)v41 stringByAppendingString:v37];

          double v16 = v36;
          double v15 = v102;
          break;
        default:
          v38 = +[CKMessageStatusChatItem todayDateFormatter];
          double v7 = [v38 stringFromDate:v27];
          v74 = NSString;
          CKFrameworkBundle();
          v75 = double v16 = v27;
          v76 = [v75 localizedStringForKey:@"MESSAGE_STATUS_SAVED_TIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
          objc_msgSend(v74, "stringWithFormat:", v76, v7);
          v77 = v103 = v28;

          v78 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v79 = [v78 userInterfaceLayoutDirection];

          if (v79 == 1) {
            v80 = @"\u200F";
          }
          else {
            v80 = @"\u200E";
          }
          double v8 = [(__CFString *)v80 stringByAppendingString:v77];

          v28 = v103;
          break;
      }

LABEL_84:
LABEL_85:

      char v6 = 0;
      double v5 = 0;
LABEL_86:
      LOBYTE(v101) = v6;
      v99 = [(CKMessageStatusChatItem *)self _styledStatusTextWithStatusText:v8 orientation:v3 dateSubText:v7 buttonSubText:0 errorSubText:0 overrideTextColor:v5 shouldReplaceWarningIcon:v101];

      return v99;
    case 7:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_SENTASTEXTMESSAGE";
      goto LABEL_39;
    case 8:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_SENTASSMS";
      goto LABEL_39;
    case 9:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_SENTTOEMAIL";
      goto LABEL_39;
    case 10:
      v42 = CKFrameworkBundle();
      double v8 = [v42 localizedStringForKey:@"MESSAGE_STATUS_NOTDELIVERED" value:&stru_1EDE4CA38 table:@"ChatKit"];

      if (CKShowInternalErrors())
      {
        v43 = [(CKChatItem *)self IMChatItem];
        uint64_t v44 = [v43 errorText];

        double v8 = (void *)v44;
      }
      v45 = +[CKUIBehavior sharedBehaviors];
      v46 = [v45 theme];
      double v5 = [v46 statusFailureTextColor];

      char v6 = 0;
      goto LABEL_41;
    case 11:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_RAISETOLISTEN";
      goto LABEL_39;
    case 12:
      double v11 = CKFrameworkBundle();
      double v12 = v11;
      objc_super v13 = @"MESSAGE_STATUS_RAISETOTALK";
LABEL_39:
      double v14 = @"ChatKit";
LABEL_40:
      double v8 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:v14];

      char v6 = 0;
      double v5 = 0;
LABEL_41:
      double v7 = 0;
      goto LABEL_86;
    case 16:
      v47 = CKFrameworkBundle();
      double v8 = [v47 localizedStringForKey:@"HAWKING_MESSAGE_STATUS_BLACKHOLED" value:&stru_1EDE4CA38 table:@"ChatKit"];

      if (CKShowInternalErrors())
      {
        v48 = [(CKChatItem *)self IMChatItem];
        uint64_t v49 = [v48 errorText];

        double v8 = (void *)v49;
      }
      v50 = +[CKUIBehavior sharedBehaviors];
      v51 = [v50 theme];
      double v5 = [v51 statusTextColor];

      double v7 = 0;
      char v6 = 1;
      goto LABEL_86;
    default:
      goto LABEL_86;
  }
}

- (id)_styledStatusTextWithStatusText:(id)a3 orientation:(char)a4 dateSubText:(id)a5 buttonSubText:(id)a6 errorSubText:(id)a7 overrideTextColor:(id)a8 shouldReplaceWarningIcon:(BOOL)a9
{
  int v13 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  objc_super v19 = +[CKUIBehavior sharedBehaviors];
  v20 = v19;
  if (v13) {
    [v19 rightStatusTranscriptTextAttributes];
  }
  else {
  v21 = [v19 leftStatusTranscriptTextAttributes];
  }

  if (v18)
  {
    v22 = (void *)[v21 mutableCopy];
    [v22 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    uint64_t v23 = [v22 copy];

    v21 = (void *)v23;
  }
  if (v14)
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14 attributes:v21];
    uint64_t v25 = v24;
    id v72 = v15;
    if (v15)
    {
      if (v24)
      {
        v26 = [v24 string];
        uint64_t v27 = [v26 rangeOfString:v15];
        uint64_t v29 = v28;

        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v68 = *MEMORY[0x1E4FB06F8];
          uint64_t v30 = +[CKUIBehavior sharedBehaviors];
          [v30 transcriptMessageStatusDateFont];
          id v31 = v14;
          id v32 = v17;
          v34 = id v33 = v16;
          objc_msgSend(v25, "addAttribute:value:range:", v68, v34, v27, v29);

          id v16 = v33;
          id v17 = v32;
          id v14 = v31;
        }
      }
    }
    if (v16)
    {
      if (v25)
      {
        v35 = [v25 string];
        uint64_t v36 = [v35 rangeOfString:v16];
        uint64_t v38 = v37;

        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = +[CKUIBehavior sharedBehaviors];
          int v69 = [v39 transcriptBoldFont];

          uint64_t v40 = +[CKUIBehavior sharedBehaviors];
          [v40 theme];
          uint64_t v67 = v38;
          id v41 = v14;
          id v42 = v17;
          uint64_t v44 = v43 = v16;
          v45 = [v44 appTintColor];

          id v16 = v43;
          id v17 = v42;
          id v14 = v41;

          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v69, v36, v67);
          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v45, v36, v67);
        }
      }
    }
    if (v17)
    {
      if (v25)
      {
        v46 = [v25 string];
        uint64_t v47 = [v46 rangeOfString:v17];
        uint64_t v49 = v48;

        if (v47 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v50 = +[CKUIBehavior sharedBehaviors];
          [v50 theme];
          uint64_t v70 = v49;
          id v51 = v14;
          id v52 = v17;
          v54 = id v53 = v16;
          unint64_t v55 = [v54 statusFailureTextColor];

          id v16 = v53;
          id v17 = v52;
          id v14 = v51;

          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v55, v47, v70);
        }
      }
    }
    if (v25)
    {
      if (a9)
      {
        v56 = [v25 string];
        uint64_t v57 = [v56 rangeOfString:@"(!)"];
        uint64_t v59 = v58;

        if (v57 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v25, "replaceCharactersInRange:withString:", v57, v59, &stru_1EDE4CA38);
          id v60 = objc_alloc_init(MEMORY[0x1E4FB0870]);
          v61 = +[CKUIBehavior sharedBehaviors];
          [v61 messageStatusWarningIconRed];
          v62 = id v71 = v16;

          [v60 setImage:v62];
          int v63 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v60];
          v64 = (void *)[v63 mutableCopy];

          objc_msgSend(v64, "addAttributes:range:", v21, 0, objc_msgSend(v64, "length"));
          [v25 insertAttributedString:v64 atIndex:v57];

          id v16 = v71;
        }
      }
    }
    id v15 = v72;
  }
  else
  {
    uint64_t v25 = 0;
  }
  v65 = (void *)[v25 copy];

  return v65;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = [(CKChatItem *)self transcriptText];
  if ([v8 length]) {
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", a4, width, height);
  }
  else {
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", a4, width, height);
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (NSAttributedString)transcriptButtonText
{
  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    int64_t v4 = [(CKMessageStatusChatItem *)self loadTranscriptButtonText];
    double v5 = (NSAttributedString *)[v4 copy];
    char v6 = self->_transcriptButtonText;
    self->_transcriptButtonText = v5;

    transcriptButtonText = self->_transcriptButtonText;
  }

  return transcriptButtonText;
}

- (CGSize)buttonSize
{
  if (!self->_buttonSizeLoaded)
  {
    uint64_t v3 = (void *)MEMORY[0x192FBB780]();
    [(CKChatItem *)self maxWidth];
    self->_buttonSizeLoaded = 1;
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", &self->_buttonTextAlignmentInsets);
    self->_buttonSize.double width = v4;
    self->_buttonSize.double height = v5;
  }
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)labelSize
{
  if (!self->_labelSizeLoaded)
  {
    uint64_t v3 = (void *)MEMORY[0x192FBB780]();
    [(CKChatItem *)self maxWidth];
    self->_labelSizeLoaded = 1;
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", &self->_labelTextAlignmentInsets);
    self->_labelSize.double width = v4;
    self->_labelSize.double height = v5;
  }
  double width = self->_labelSize.width;
  double height = self->_labelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)labelTextAlignmentInsets
{
  if (!self->_labelSizeLoaded)
  {
    uint64_t v3 = (void *)MEMORY[0x192FBB780]();
    [(CKChatItem *)self maxWidth];
    self->_labelSizeLoaded = 1;
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", &self->_labelTextAlignmentInsets);
    self->_labelSize.double width = v4;
    self->_labelSize.double height = v5;
  }
  double top = self->_labelTextAlignmentInsets.top;
  double left = self->_labelTextAlignmentInsets.left;
  double bottom = self->_labelTextAlignmentInsets.bottom;
  double right = self->_labelTextAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)buttonTextAlignmentInsets
{
  if (!self->_buttonSizeLoaded)
  {
    uint64_t v3 = (void *)MEMORY[0x192FBB780]();
    [(CKChatItem *)self maxWidth];
    self->_buttonSizeLoaded = 1;
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", &self->_buttonTextAlignmentInsets);
    self->_buttonSize.double width = v4;
    self->_buttonSize.double height = v5;
  }
  double top = self->_buttonTextAlignmentInsets.top;
  double left = self->_buttonTextAlignmentInsets.left;
  double bottom = self->_buttonTextAlignmentInsets.bottom;
  double right = self->_buttonTextAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)buttonType
{
  unint64_t v3 = [(CKMessageStatusChatItem *)self expireStatusType] - 1;
  if (v3 < 3)
  {
    CGFloat v4 = (int64_t *)((char *)&unk_18F81AE20 + 8 * v3);
    return *v4;
  }
  unint64_t v5 = [(CKMessageStatusChatItem *)self statusType];
  if (v5 < 0x24)
  {
    CGFloat v4 = (int64_t *)((char *)&unk_18F81AE38 + 8 * v5);
    return *v4;
  }
  return 3;
}

- (char)statusAlignment
{
  char v3 = 2;
  if ([(CKMessageStatusChatItem *)self buttonType] != 1)
  {
    if ([(CKChatItem *)self isFromMe]) {
      return 2;
    }
    else {
      return 0;
    }
  }
  return v3;
}

- (id)now
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (int64_t)statusType
{
  char v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 messageStatusType];

  return v3;
}

- (int64_t)expireStatusType
{
  char v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 expireStatusType];

  return v3;
}

- (id)time
{
  char v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 time];

  return v3;
}

- (unint64_t)count
{
  char v2 = [(CKChatItem *)self IMChatItem];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (id)todayDateFormatter
{
  char v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 timestampDateFormatter];

  return v3;
}

+ (id)thisWeekRelativeDateFormatter
{
  return +[CKDateUtilities thisWeekRelativeDateFormatterNoTime];
}

+ (id)thePastDateFormatter
{
  return +[CKDateUtilities theShortDateNoTimeInSentenceDateFormatter];
}

- (id)effectsControlStatusTextForEffectStyleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKConfettiEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_CONFETTI";
LABEL_27:
    double v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

    goto LABEL_28;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKLasersEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_LASERS";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKFireworksEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_FIREWORKS";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKShootingStarEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_SHOOTING_STAR";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKHappyBirthdayEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_BALLOONS";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKSparklesEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_CELEBRATION";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKHeartEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_LOVE";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKEchoEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_ECHO";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.messages.effect.CKSpotlightEffect"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"FSM_CONTROL_BUTTON_TITLE_SPOTLIGHT";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"EFFECT_CONTROL_BUTTON_TITLE_IMPACT";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.loud"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"EFFECT_CONTROL_BUTTON_TITLE_LOUD";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.gentle"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"EFFECT_CONTROL_BUTTON_TITLE_GENTLE";
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.focus"])
  {
    CGFloat v4 = CKFrameworkBundle();
    unint64_t v5 = v4;
    char v6 = @"EFFECT_CONTROL_BUTTON_TITLE_FOCUS";
    goto LABEL_27;
  }
  double v7 = 0;
LABEL_28:

  return v7;
}

- (id)loadTranscriptButtonText
{
  v293[2] = *MEMORY[0x1E4F143B8];
  switch([(CKMessageStatusChatItem *)self buttonType])
  {
    case 0:
      if ([(CKMessageStatusChatItem *)self expireStatusType] != 2) {
        goto LABEL_60;
      }
      int v3 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      CGFloat v4 = +[CKUIBehavior sharedBehaviors];
      unint64_t v5 = v4;
      if (v3) {
        [v4 rightTranscriptButtonTextAttributes];
      }
      else {
      char v6 = [v4 leftTranscriptButtonTextAttributes];
      }

      id v151 = objc_alloc(NSNumber);
      IMMessageItemExpireStateExpiringDuration();
      id v43 = (void *)[v151 initWithUnsignedInteger:(unint64_t)v152 / 0x3C];
      v153 = NSString;
      v154 = CKFrameworkBundle();
      v155 = [v154 localizedStringForKey:@"MESSAGE_STATUS_EXPIRING" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v156 = objc_msgSend(v43, "__ck_localizedString");
      v157 = objc_msgSend(v153, "stringWithFormat:", v155, v156);

      v158 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v159 = [v158 userInterfaceLayoutDirection];

      if (v159 == 1) {
        v160 = @"\u200F";
      }
      else {
        v160 = @"\u200E";
      }
      v161 = [(__CFString *)v160 stringByAppendingString:v157];

      double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v161 attributes:v6];
      goto LABEL_141;
    case 1:
      char v6 = +[CKUIBehavior sharedBehaviors];
      double v7 = [v6 statusSaveButtonTranscriptText];
      goto LABEL_142;
    case 2:
      v292[0] = *MEMORY[0x1E4FB06F8];
      double v8 = +[CKUIBehavior sharedBehaviors];
      double v9 = [v8 transcriptBoldFont];
      v292[1] = *MEMORY[0x1E4FB0700];
      v293[0] = v9;
      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = [v10 theme];
      double v12 = [v11 appTintColor];
      v293[1] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v293 forKeys:v292 count:2];

      double v14 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[CKMessageStatusChatItem count](self, "count"));
      id v15 = NSString;
      id v16 = CKFrameworkBundle();
      id v17 = [v16 localizedStringForKey:@"PLAY_ALL_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v18 = objc_msgSend(v14, "__ck_localizedString");
      objc_super v19 = objc_msgSend(v15, "stringWithFormat:", v17, v18);

      v20 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v21 = [v20 userInterfaceLayoutDirection];

      if (v21 == 1) {
        v22 = @"\u200F";
      }
      else {
        v22 = @"\u200E";
      }
      uint64_t v23 = [(__CFString *)v22 stringByAppendingString:v19];

      double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v23 attributes:v13];
      goto LABEL_63;
    case 3:
      v24 = [(CKChatItem *)self IMChatItem];
      uint64_t v273 = [v24 attributionType];
      int v272 = [v24 showsLearnMoreLink];
      v277 = v24;
      v275 = [v24 attributionInfo];
      v274 = objc_msgSend(v275, "__ck_localizedAppNameForTranscriptAttribution");
      uint64_t v287 = *MEMORY[0x1E4FB06F8];
      uint64_t v25 = v287;
      v26 = +[CKUIBehavior sharedBehaviors];
      uint64_t v27 = [v26 transcriptBoldFont];
      v289[0] = v27;
      uint64_t v288 = *MEMORY[0x1E4FB0700];
      uint64_t v28 = v288;
      uint64_t v29 = +[CKUIBehavior sharedBehaviors];
      uint64_t v30 = [v29 theme];
      id v31 = [v30 appTintColor];
      v289[1] = v31;
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v289 forKeys:&v287 count:2];

      v285[0] = v25;
      id v33 = +[CKUIBehavior sharedBehaviors];
      v34 = [v33 transcriptBoldFont];
      v285[1] = v28;
      v286[0] = v34;
      v35 = +[CKUIBehavior sharedBehaviors];
      uint64_t v36 = [v35 theme];
      uint64_t v37 = [v36 messageStatusChatItemGrayColor];
      v286[1] = v37;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v286 forKeys:v285 count:2];

      switch(v273)
      {
        case 1:
          v39 = NSString;
          uint64_t v40 = CKFrameworkBundle();
          id v41 = v40;
          id v42 = @"ATTRIBUTION_TEXT_APP";
          goto LABEL_105;
        case 2:
          v39 = NSString;
          uint64_t v40 = CKFrameworkBundle();
          id v41 = v40;
          id v42 = @"ATTRIBUTION_TEXT_STS";
          goto LABEL_105;
        case 3:
          v39 = NSString;
          uint64_t v40 = CKFrameworkBundle();
          id v41 = v40;
          id v42 = @"ATTRIBUTION_TEXT_STICKER";
          goto LABEL_105;
        case 4:
          v39 = NSString;
          uint64_t v40 = CKFrameworkBundle();
          id v41 = v40;
          id v42 = @"ATTRIBUTION_TEXT_ASSOCIATED_STICKER";
LABEL_105:
          v208 = [v40 localizedStringForKey:v42 value:&stru_1EDE4CA38 table:@"ChatKit"];
          v209 = v274;
          v210 = objc_msgSend(v39, "stringWithFormat:", v208, v274);

          v211 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v212 = [v211 userInterfaceLayoutDirection];

          if (v212 == 1) {
            v213 = @"\u200F";
          }
          else {
            v213 = @"\u200E";
          }
          v207 = [(__CFString *)v213 stringByAppendingString:v210];

          id v206 = v274;
          goto LABEL_128;
        case 5:
          v214 = CKFrameworkBundle();
          v215 = v214;
          v216 = @"ATTRIBUTION_TEXT_PHOTOS_EXTENSION";
          goto LABEL_114;
        case 6:
          v209 = v274;
          if (v272 && !CKIsRunningInMacCatalyst())
          {
            v260 = CKFrameworkBundle();
            id v206 = [v260 localizedStringForKey:@"ATTRIBUTION_TEXT_SENT_WITH_SIRI_WITH_LEARN_MORE_LINK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

            v261 = NSString;
            v262 = CKFrameworkBundle();
            v263 = [v262 localizedStringForKey:@"ATTRIBUTION_TEXT_SENT_WITH_SIRI_WITH_LEARN_MORE_LINK_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v264 = objc_msgSend(v261, "stringWithFormat:", v263, v206);

            v265 = [MEMORY[0x1E4F42738] sharedApplication];
            uint64_t v266 = [v265 userInterfaceLayoutDirection];

            if (v266 == 1) {
              v267 = @"\u200F";
            }
            else {
              v267 = @"\u200E";
            }
            v207 = [(__CFString *)v267 stringByAppendingString:v264];
          }
          else
          {
            v217 = CKFrameworkBundle();
            uint64_t v218 = [v217 localizedStringForKey:@"ATTRIBUTION_TEXT_SENT_WITH_SIRI" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_121:
            v207 = (__CFString *)v218;

            id v206 = 0;
          }
          goto LABEL_128;
        case 7:
          v214 = CKFrameworkBundle();
          v215 = v214;
          v216 = @"ATTRIBUTION_TEXT_SENT_WITH_FACETIME";
LABEL_114:
          v207 = [v214 localizedStringForKey:v216 value:&stru_1EDE4CA38 table:@"ChatKit"];

          id v206 = 0;
          goto LABEL_127;
        case 8:
          v219 = CKFrameworkBundle();
          id v206 = [v219 localizedStringForKey:@"ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_ONE_LINK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

          v220 = NSString;
          v221 = CKFrameworkBundle();
          v222 = v221;
          v223 = @"ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_ONE_LINK_FORMAT";
          goto LABEL_123;
        case 9:
          v224 = CKFrameworkBundle();
          id v206 = [v224 localizedStringForKey:@"ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_MULTIPLE_LINK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

          v220 = NSString;
          v221 = CKFrameworkBundle();
          v222 = v221;
          v223 = @"ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_MULTIPLE_LINK_FORMAT";
          goto LABEL_123;
        case 10:
          v225 = NSString;
          v226 = CKFrameworkBundle();
          v227 = [v226 localizedStringForKey:@"ATTRIBUTION_TEXT_SENT_WITH_CRITICAL_MESSAGING_API_FORMAT" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v209 = v274;
          v217 = objc_msgSend(v225, "stringWithFormat:", v227, v274);

          v228 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v229 = [v228 userInterfaceLayoutDirection];

          if (v229 == 1) {
            v230 = @"\u200F";
          }
          else {
            v230 = @"\u200E";
          }
          uint64_t v218 = [(__CFString *)v230 stringByAppendingString:v217];
          goto LABEL_121;
        case 11:
          v231 = CKFrameworkBundle();
          id v206 = [v231 localizedStringForKey:@"ATTRIBUTION_TEXT_SENSITIVE_STICKER_REVEALED_LINK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

          v220 = NSString;
          v221 = CKFrameworkBundle();
          v222 = v221;
          v223 = @"%@";
LABEL_123:
          v232 = [v221 localizedStringForKey:v223 value:&stru_1EDE4CA38 table:@"ChatKit"];
          v233 = objc_msgSend(v220, "stringWithFormat:", v232, v206);

          v234 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v235 = [v234 userInterfaceLayoutDirection];

          if (v235 == 1) {
            v236 = @"\u200F";
          }
          else {
            v236 = @"\u200E";
          }
          v207 = [(__CFString *)v236 stringByAppendingString:v233];

          goto LABEL_127;
        default:
          id v206 = 0;
          v207 = &stru_1EDE4CA38;
LABEL_127:
          v209 = v274;
LABEL_128:
          double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v207 attributes:v38];
          if ([v206 length])
          {
            uint64_t v237 = [(__CFString *)v207 rangeOfString:v206];
            if (v238) {
              objc_msgSend(v7, "setAttributes:range:", v32, v237, v238);
            }
          }

          break;
      }
      goto LABEL_143;
    case 4:
      char v6 = [(CKChatItem *)self IMChatItem];
      id v43 = [v6 dataSource];
      double v7 = [v43 statusAttributedString];
      goto LABEL_141;
    case 5:
      double v7 = [(CKMessageStatusChatItem *)self createReplayText];
      goto LABEL_143;
    case 8:
      v61 = CKFrameworkBundle();
      v62 = v61;
      int v63 = @"MESSAGE_STATUS_NOT_EDITED";
      goto LABEL_62;
    case 9:
      v64 = CKFrameworkBundle();
      v65 = v64;
      v66 = @"MESSAGE_STATUS_DELIVERED";
      goto LABEL_22;
    case 10:
      v64 = CKFrameworkBundle();
      v65 = v64;
      v66 = @"MESSAGE_STATUS_DELIVERED_QUIETLY";
LABEL_22:
      id v13 = [v64 localizedStringForKey:v66 value:&stru_1EDE4CA38 table:@"ChatKit"];

      uint64_t v67 = CKFrameworkBundle();
      uint64_t v68 = [v67 localizedStringForKey:@"MESSAGE_STATUS_NOT_EDITED" value:&stru_1EDE4CA38 table:@"ChatKit"];

      int v69 = [NSString stringWithFormat:@"%@ • %@", v13, v68];
      uint64_t v70 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v269) = 1;
      id v71 = self;
      id v72 = v69;
      v73 = 0;
      v74 = v68;
      goto LABEL_44;
    case 11:
      v75 = [(CKMessageStatusChatItem *)self time];
      v76 = [(CKMessageStatusChatItem *)self now];
      if (!v75)
      {
        v147 = CKFrameworkBundle();
        v148 = [v147 localizedStringForKey:@"MESSAGE_STATUS_READ" value:&stru_1EDE4CA38 table:@"ChatKit"];

        v80 = 0;
        goto LABEL_82;
      }
      v77 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
      uint64_t v78 = objc_msgSend(v77, "__ck_unitOfDisambiguityFromDate:toDate:", v75, v76);

      if (v78 == 4) {
        goto LABEL_27;
      }
      if (v78 == 16)
      {
        uint64_t v79 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
        unsigned __int8 v279 = 0;
        v80 = [v79 stringFromDate:v75 isRelative:&v279];
        int v164 = v279;
        v165 = NSString;
        v166 = CKFrameworkBundle();
        v167 = v166;
        if (v164) {
          v168 = @"MESSAGE_STATUS_READ_RELATIVE_DAY";
        }
        else {
          v168 = @"MESSAGE_STATUS_READ_DAY";
        }
        v251 = [v166 localizedStringForKey:v168 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v170 = objc_msgSend(v165, "stringWithFormat:", v251, v80);

        v252 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v253 = [v252 userInterfaceLayoutDirection];

        if (v253 == 1) {
          v173 = @"\u200F";
        }
        else {
          v173 = @"\u200E";
        }
      }
      else
      {
        if (v78 == 8)
        {
LABEL_27:
          uint64_t v79 = +[CKMessageStatusChatItem thePastDateFormatter];
          v80 = [v79 stringFromDate:v75];
          v81 = NSString;
          v82 = CKFrameworkBundle();
          v83 = v82;
          v84 = @"MESSAGE_STATUS_READ_DATE";
        }
        else
        {
          uint64_t v79 = +[CKMessageStatusChatItem todayDateFormatter];
          v80 = [v79 stringFromDate:v75];
          v81 = NSString;
          v82 = CKFrameworkBundle();
          v83 = v82;
          v84 = @"MESSAGE_STATUS_READ_TIME";
        }
        v169 = [v82 localizedStringForKey:v84 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v170 = objc_msgSend(v81, "stringWithFormat:", v169, v80);

        v171 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v172 = [v171 userInterfaceLayoutDirection];

        if (v172 == 1) {
          v173 = @"\u200F";
        }
        else {
          v173 = @"\u200E";
        }
      }
      v148 = [(__CFString *)v173 stringByAppendingString:v170];

LABEL_82:
      v174 = CKFrameworkBundle();
      v175 = [v174 localizedStringForKey:@"MESSAGE_STATUS_NOT_EDITED" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v176 = [NSString stringWithFormat:@"%@ • %@", v148, v175];
      uint64_t v177 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v271) = 1;
      v178 = self;
      v179 = v176;
      v180 = v80;
      v181 = 0;
      v182 = v175;
      goto LABEL_100;
    case 12:
      v85 = CKFrameworkBundle();
      v86 = v85;
      uint64_t v87 = @"MESSAGE_STATUS_EDITED";
      goto LABEL_38;
    case 13:
      v88 = CKFrameworkBundle();
      v89 = v88;
      v90 = @"MESSAGE_STATUS_DELIVERED";
      goto LABEL_31;
    case 14:
      v88 = CKFrameworkBundle();
      v89 = v88;
      v90 = @"MESSAGE_STATUS_DELIVERED_QUIETLY";
LABEL_31:
      id v13 = [v88 localizedStringForKey:v90 value:&stru_1EDE4CA38 table:@"ChatKit"];

      v91 = CKFrameworkBundle();
      uint64_t v92 = v91;
      v93 = @"MESSAGE_STATUS_EDITED";
      goto LABEL_43;
    case 15:
      v94 = [(CKMessageStatusChatItem *)self time];
      v95 = [(CKMessageStatusChatItem *)self now];
      if (!v94)
      {
        v149 = CKFrameworkBundle();
        v148 = [v149 localizedStringForKey:@"MESSAGE_STATUS_READ" value:&stru_1EDE4CA38 table:@"ChatKit"];

        v80 = 0;
        goto LABEL_90;
      }
      v96 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
      uint64_t v97 = objc_msgSend(v96, "__ck_unitOfDisambiguityFromDate:toDate:", v94, v95);

      if (v97 == 4) {
        goto LABEL_36;
      }
      if (v97 == 16)
      {
        v98 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
        unsigned __int8 v279 = 0;
        v80 = [v98 stringFromDate:v94 isRelative:&v279];
        int v183 = v279;
        v184 = NSString;
        v185 = CKFrameworkBundle();
        v186 = v185;
        if (v183) {
          v187 = @"MESSAGE_STATUS_READ_RELATIVE_DAY";
        }
        else {
          v187 = @"MESSAGE_STATUS_READ_DAY";
        }
        v254 = [v185 localizedStringForKey:v187 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v189 = objc_msgSend(v184, "stringWithFormat:", v254, v80);

        v255 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v256 = [v255 userInterfaceLayoutDirection];

        if (v256 == 1) {
          v192 = @"\u200F";
        }
        else {
          v192 = @"\u200E";
        }
      }
      else
      {
        if (v97 == 8)
        {
LABEL_36:
          v98 = +[CKMessageStatusChatItem thePastDateFormatter];
          v80 = [v98 stringFromDate:v94];
          v99 = NSString;
          v100 = CKFrameworkBundle();
          uint64_t v101 = v100;
          v102 = @"MESSAGE_STATUS_READ_DATE";
        }
        else
        {
          v98 = +[CKMessageStatusChatItem todayDateFormatter];
          v80 = [v98 stringFromDate:v94];
          v99 = NSString;
          v100 = CKFrameworkBundle();
          uint64_t v101 = v100;
          v102 = @"MESSAGE_STATUS_READ_TIME";
        }
        v188 = [v100 localizedStringForKey:v102 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v189 = objc_msgSend(v99, "stringWithFormat:", v188, v80);

        v190 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v191 = [v190 userInterfaceLayoutDirection];

        if (v191 == 1) {
          v192 = @"\u200F";
        }
        else {
          v192 = @"\u200E";
        }
      }
      v148 = [(__CFString *)v192 stringByAppendingString:v189];

LABEL_90:
      v193 = CKFrameworkBundle();
      v194 = v193;
      v195 = @"MESSAGE_STATUS_EDITED";
      goto LABEL_99;
    case 16:
      v85 = CKFrameworkBundle();
      v86 = v85;
      uint64_t v87 = @"MESSAGE_STATUS_HIDE_EDITS";
LABEL_38:
      v103 = [v85 localizedStringForKey:v87 value:&stru_1EDE4CA38 table:@"ChatKit"];

      uint64_t v104 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v268) = 0;
      unsigned __int8 v105 = self;
      unsigned __int8 v106 = v103;
      v107 = v103;
      goto LABEL_39;
    case 17:
      v108 = CKFrameworkBundle();
      v109 = v108;
      v110 = @"MESSAGE_STATUS_DELIVERED";
      goto LABEL_42;
    case 18:
      v108 = CKFrameworkBundle();
      v109 = v108;
      v110 = @"MESSAGE_STATUS_DELIVERED_QUIETLY";
LABEL_42:
      id v13 = [v108 localizedStringForKey:v110 value:&stru_1EDE4CA38 table:@"ChatKit"];

      v91 = CKFrameworkBundle();
      uint64_t v92 = v91;
      v93 = @"MESSAGE_STATUS_HIDE_EDITS";
LABEL_43:
      uint64_t v68 = [v91 localizedStringForKey:v93 value:&stru_1EDE4CA38 table:@"ChatKit"];

      int v69 = [NSString stringWithFormat:@"%@ • %@", v13, v68];
      uint64_t v70 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v269) = 0;
      id v71 = self;
      id v72 = v69;
      v73 = v68;
      v74 = 0;
LABEL_44:
      double v7 = [(CKMessageStatusChatItem *)v71 _styledStatusTextWithStatusText:v72 orientation:v70 dateSubText:0 buttonSubText:v73 errorSubText:v74 overrideTextColor:0 shouldReplaceWarningIcon:v269];

      goto LABEL_63;
    case 19:
      v111 = [(CKMessageStatusChatItem *)self time];
      v112 = [(CKMessageStatusChatItem *)self now];
      if (!v111)
      {
        v150 = CKFrameworkBundle();
        v148 = [v150 localizedStringForKey:@"MESSAGE_STATUS_READ" value:&stru_1EDE4CA38 table:@"ChatKit"];

        v80 = 0;
        goto LABEL_98;
      }
      v113 = objc_msgSend(MEMORY[0x1E4F1C9A8], "__ck_currentCalendar");
      uint64_t v114 = objc_msgSend(v113, "__ck_unitOfDisambiguityFromDate:toDate:", v111, v112);

      if (v114 == 4) {
        goto LABEL_49;
      }
      if (v114 == 16)
      {
        v115 = +[CKMessageStatusChatItem thisWeekRelativeDateFormatter];
        unsigned __int8 v279 = 0;
        v80 = [v115 stringFromDate:v111 isRelative:&v279];
        int v196 = v279;
        v197 = NSString;
        v198 = CKFrameworkBundle();
        v199 = v198;
        if (v196) {
          v200 = @"MESSAGE_STATUS_READ_RELATIVE_DAY";
        }
        else {
          v200 = @"MESSAGE_STATUS_READ_DAY";
        }
        v257 = [v198 localizedStringForKey:v200 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v202 = objc_msgSend(v197, "stringWithFormat:", v257, v80);

        v258 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v259 = [v258 userInterfaceLayoutDirection];

        if (v259 == 1) {
          v205 = @"\u200F";
        }
        else {
          v205 = @"\u200E";
        }
      }
      else
      {
        if (v114 == 8)
        {
LABEL_49:
          v115 = +[CKMessageStatusChatItem thePastDateFormatter];
          v80 = [v115 stringFromDate:v111];
          v116 = NSString;
          v117 = CKFrameworkBundle();
          v118 = v117;
          v119 = @"MESSAGE_STATUS_READ_DATE";
        }
        else
        {
          v115 = +[CKMessageStatusChatItem todayDateFormatter];
          v80 = [v115 stringFromDate:v111];
          v116 = NSString;
          v117 = CKFrameworkBundle();
          v118 = v117;
          v119 = @"MESSAGE_STATUS_READ_TIME";
        }
        v201 = [v117 localizedStringForKey:v119 value:&stru_1EDE4CA38 table:@"ChatKit"];
        v202 = objc_msgSend(v116, "stringWithFormat:", v201, v80);

        v203 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v204 = [v203 userInterfaceLayoutDirection];

        if (v204 == 1) {
          v205 = @"\u200F";
        }
        else {
          v205 = @"\u200E";
        }
      }
      v148 = [(__CFString *)v205 stringByAppendingString:v202];

LABEL_98:
      v193 = CKFrameworkBundle();
      v194 = v193;
      v195 = @"MESSAGE_STATUS_HIDE_EDITS";
LABEL_99:
      v175 = [v193 localizedStringForKey:v195 value:&stru_1EDE4CA38 table:@"ChatKit"];

      v176 = [NSString stringWithFormat:@"%@ • %@", v148, v175];
      uint64_t v177 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v271) = 0;
      v178 = self;
      v179 = v176;
      v180 = v80;
      v181 = v175;
      v182 = 0;
LABEL_100:
      double v7 = [(CKMessageStatusChatItem *)v178 _styledStatusTextWithStatusText:v179 orientation:v177 dateSubText:v180 buttonSubText:v181 errorSubText:v182 overrideTextColor:0 shouldReplaceWarningIcon:v271];

      goto LABEL_143;
    case 20:
      v120 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v121 = [v120 isCarrierPigeonEnabled];

      if (!v121) {
        goto LABEL_60;
      }
      v122 = [MEMORY[0x1E4F6E890] sharedInstance];
      uint64_t v123 = *MEMORY[0x1E4F6DBA8];
      uint64_t v290 = *MEMORY[0x1E4F6DD60];
      v291 = &unk_1EDF161A8;
      v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v291 forKeys:&v290 count:1];
      [v122 trackEvent:v123 withDictionary:v124];

      id v13 = [(CKChatItem *)self IMChatItem];
      v125 = [v13 recipientDisplayName];
      v126 = NSString;
      v127 = CKFrameworkBundle();
      v128 = [v127 localizedStringForKey:@"MESSAGE_STATUS_CONFIRM_SEND_VIA_SATELLITE_SUB_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
      v129 = objc_msgSend(v126, "localizedStringWithFormat:", v128, v125);

      v130 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v131 = [v130 userInterfaceLayoutDirection];

      if (v131 == 1) {
        v132 = @"\u200F";
      }
      else {
        v132 = @"\u200E";
      }
      v133 = [(__CFString *)v132 stringByAppendingString:v129];

      v134 = CKFrameworkBundle();
      v135 = [v134 localizedStringForKey:@"MESSAGE_STATUS_CONFIRM_SEND_VIA_SATELLITE" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];

      v136 = [NSString stringWithFormat:@"%@ \n %@", v133, v135];
      LOBYTE(v270) = 0;
      double v7 = [(CKMessageStatusChatItem *)self _styledStatusTextWithStatusText:v136 orientation:[(CKMessageStatusChatItem *)self transcriptOrientation] dateSubText:0 buttonSubText:v135 errorSubText:0 overrideTextColor:0 shouldReplaceWarningIcon:v270];

LABEL_63:
      goto LABEL_143;
    case 21:
      v137 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v138 = [v137 isCarrierPigeonEnabled];

      if (!v138) {
        goto LABEL_60;
      }
      v139 = NSString;
      v140 = CKFrameworkBundle();
      v141 = [v140 localizedStringForKey:@"MESSAGE_STATUS_CONFIRM_SENT_VIA_SATELLITE" value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
      v142 = [v139 localizedStringWithFormat:v141];

      v143 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v144 = [v143 userInterfaceLayoutDirection];

      if (v144 == 1) {
        v145 = @"\u200F";
      }
      else {
        v145 = @"\u200E";
      }
      v103 = [(__CFString *)v145 stringByAppendingString:v142];

      uint64_t v104 = [(CKMessageStatusChatItem *)self transcriptOrientation];
      LOBYTE(v268) = 0;
      unsigned __int8 v105 = self;
      unsigned __int8 v106 = v103;
      v107 = 0;
LABEL_39:
      double v7 = [(CKMessageStatusChatItem *)v105 _styledStatusTextWithStatusText:v106 orientation:v104 dateSubText:0 buttonSubText:v107 errorSubText:0 overrideTextColor:0 shouldReplaceWarningIcon:v268];

      goto LABEL_143;
    case 22:
      v61 = CKFrameworkBundle();
      v62 = v61;
      int v63 = @"MESSAGE_STATUS_NOT_CANCELLED";
LABEL_62:
      v146 = [v61 localizedStringForKey:v63 value:&stru_1EDE4CA38 table:@"ChatKit"];

      id v13 = v146;
      LOBYTE(v268) = 1;
      double v7 = [(CKMessageStatusChatItem *)self _styledStatusTextWithStatusText:v13 orientation:[(CKMessageStatusChatItem *)self transcriptOrientation] dateSubText:0 buttonSubText:0 errorSubText:v13 overrideTextColor:0 shouldReplaceWarningIcon:v268];

      goto LABEL_63;
    default:
      if ([(CKMessageStatusChatItem *)self statusType] != 20)
      {
LABEL_60:
        double v7 = 0;
        goto LABEL_143;
      }
      v278 = [(CKChatItem *)self IMChatItem];
      uint64_t v44 = [v278 syndicationStatus];
      uint64_t v282 = *MEMORY[0x1E4FB06F8];
      uint64_t v45 = v282;
      v46 = +[CKUIBehavior sharedBehaviors];
      uint64_t v47 = [v46 transcriptBoldFont];
      v284[0] = v47;
      uint64_t v283 = *MEMORY[0x1E4FB0700];
      uint64_t v48 = v283;
      uint64_t v49 = +[CKUIBehavior sharedBehaviors];
      v50 = [v49 theme];
      id v51 = [v50 appTintColor];
      v284[1] = v51;
      uint64_t v276 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v284 forKeys:&v282 count:2];

      v280[0] = v45;
      id v52 = +[CKUIBehavior sharedBehaviors];
      id v53 = [v52 transcriptMessageStatusFont];
      v280[1] = v48;
      v281[0] = v53;
      v54 = +[CKUIBehavior sharedBehaviors];
      unint64_t v55 = [v54 theme];
      v56 = [v55 messageStatusChatItemGrayColor];
      v281[1] = v56;
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v281 forKeys:v280 count:2];

      if (v44)
      {
        if (v44 != 1)
        {
          double v7 = 0;
          id v43 = (void *)v276;
          char v6 = v278;
          goto LABEL_140;
        }
        char v6 = v278;
        if ([v278 wasDetectedAsSWYSpam])
        {
          id v58 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v59 = CKFrameworkBundle();
          id v60 = [v59 localizedStringForKey:@"MARKED_AS_NOT_DONATED" value:&stru_1EDE4CA38 table:@"ChatKit"];
          id v43 = (void *)v276;
          double v7 = (void *)[v58 initWithString:v60 attributes:v276];

LABEL_138:
          goto LABEL_140;
        }
        v239 = [v278 swyAppName];
        uint64_t v240 = [v239 length];

        if (v240)
        {
          id v241 = objc_alloc(MEMORY[0x1E4F28B18]);
          v242 = NSString;
          v243 = CKFrameworkBundle();
          v244 = [v243 localizedStringForKey:@"MARKED_AS_NOT_DONATED_PUBLICSWY" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v245 = [v278 swyAppName];
          v246 = objc_msgSend(v242, "stringWithFormat:", v244, v245);

          v247 = [MEMORY[0x1E4F42738] sharedApplication];
          uint64_t v248 = [v247 userInterfaceLayoutDirection];

          if (v248 == 1) {
            v249 = @"\u200F";
          }
          else {
            v249 = @"\u200E";
          }
          uint64_t v59 = [(__CFString *)v249 stringByAppendingString:v246];

          double v7 = (void *)[v241 initWithString:v59 attributes:v57];
          goto LABEL_137;
        }
      }
      else
      {
        char v6 = v278;
        if ([v278 wasDetectedAsSWYSpam])
        {
          id v162 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v59 = CKFrameworkBundle();
          v163 = [v59 localizedStringForKey:@"MARKED_AS_DONATED" value:&stru_1EDE4CA38 table:@"ChatKit"];
          double v7 = (void *)[v162 initWithString:v163 attributes:v57];

LABEL_137:
          id v43 = (void *)v276;
          goto LABEL_138;
        }
      }
      double v7 = 0;
      id v43 = (void *)v276;
LABEL_140:

LABEL_141:
LABEL_142:

LABEL_143:
      return v7;
  }
}

- (CGSize)loadLabelSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->double top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->double bottom = v7;
  }
  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 transcriptStatusItemEdgeInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = MEMORY[0x1E4F1DB30];
  double v18 = *MEMORY[0x1E4F1DB30];
  objc_super v19 = [(CKChatItem *)self transcriptText];
  if ([v19 length])
  {
    double v20 = width - (v12 + v16);
    double v21 = height - (v10 + v14);
    v22 = [(CKMessageStatusChatItem *)self transcriptButtonText];
    uint64_t v23 = [v22 length];

    if (v23)
    {
      [(CKMessageStatusChatItem *)self buttonSize];
      double v25 = v24;
      v26 = +[CKUIBehavior sharedBehaviors];
      [v26 transcriptButtonContentEdgeInsets];
      double v18 = v25 + v27 + v28;
    }
    uint64_t v29 = [(CKChatItem *)self transcriptText];
    objc_msgSend(v29, "boundingRectWithSize:options:context:", 3, 0, v20 - v18, v21);
    double v18 = v30;
    double v32 = v31;

    id v33 = [(CKChatItem *)self transcriptTraitCollection];
    [v33 displayScale];
    if (v34 == 0.0)
    {
      if (CKMainScreenScale_once_14 != -1) {
        dispatch_once(&CKMainScreenScale_once_14, &__block_literal_global_31);
      }
      double v34 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0) {
        double v34 = 1.0;
      }
    }
    double v35 = ceil(v32 * v34) / v34;
  }
  else
  {
    double v35 = *(double *)(v17 + 8);
  }

  double v36 = v18;
  double v37 = v35;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (CGSize)loadButtonSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->double top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->double bottom = v7;
  }
  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 transcriptStatusItemEdgeInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [(CKMessageStatusChatItem *)self transcriptButtonText];
  if (v17)
  {
    double v18 = +[CKMessageStatusChatItem sizingButton];
    [v18 setAttributedTitle:v17 forState:0];
    id v19 = objc_alloc_init(MEMORY[0x1E4F43058]);
    [v19 addSubview:v18];
    objc_msgSend(v18, "sizeThatFits:", width - (v12 + v16), height - (v10 + v14));
    double v21 = v20;
    double v23 = v22;
    double v24 = [(CKChatItem *)self transcriptTraitCollection];
    [v24 displayScale];
    if (v25 == 0.0)
    {
      if (CKMainScreenScale_once_14 != -1) {
        dispatch_once(&CKMainScreenScale_once_14, &__block_literal_global_31);
      }
      double v26 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0) {
        double v26 = 1.0;
      }
      double v27 = ceil(v21 * v26) / v26;
      double v25 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0) {
        double v25 = 1.0;
      }
    }
    else
    {
      double v27 = ceil(v21 * v25) / v25;
    }
    double v28 = ceil(v23 * v25) / v25;

    [v18 removeFromSuperview];
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB30];
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v29 = v27;
  double v30 = v28;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 1;
}

- (id)createReplayText
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if ([(CKMessageStatusChatItem *)self allowsEffectAutoPlayback]) {
    goto LABEL_3;
  }
  int v3 = [(CKChatItem *)self IMChatItem];
  CGFloat v4 = [v3 effectStyleID];

  unint64_t v5 = [(CKMessageStatusChatItem *)self effectsControlStatusTextForEffectStyleID:v4];

  if (!v5)
  {
LABEL_3:
    char v6 = CKFrameworkBundle();
    unint64_t v5 = [v6 localizedStringForKey:@"REPLAY_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  v30[0] = *MEMORY[0x1E4FB06F8];
  long long v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [v7 transcriptBoldFont];
  v31[0] = v8;
  v30[1] = *MEMORY[0x1E4FB0700];
  double v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = [v9 theme];
  double v11 = [v10 transcriptReplayTextColor];
  v31[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  double v13 = (void *)MEMORY[0x1E4F42A98];
  double v14 = +[CKUIBehavior sharedBehaviors];
  double v15 = [v14 theme];
  double v16 = [v15 transcriptReplayTextColor];
  double v29 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  double v18 = [v13 configurationWithPaletteColors:v17];

  id v19 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
  double v20 = [v18 configurationByApplyingConfiguration:v19];

  double v21 = [MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.counterclockwise" withConfiguration:v20];
  double v22 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v21];
  double v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttachment:v22 attributes:v12];
  id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v25 = [@" " stringByAppendingString:v5];
  double v26 = (void *)[v24 initWithString:v25 attributes:v12];

  [v23 appendAttributedString:v26];
  double v27 = (void *)[v23 copy];

  return v27;
}

- (void)setTranscriptButtonText:(id)a3
{
}

- (BOOL)isButtonSizeLoaded
{
  return self->_buttonSizeLoaded;
}

- (void)setButtonSizeLoaded:(BOOL)a3
{
  self->_buttonSizeLoaded = a3;
}

- (BOOL)isLabelSizeLoaded
{
  return self->_labelSizeLoaded;
}

- (void)setLabelSizeLoaded:(BOOL)a3
{
  self->_labelSizeLoaded = a3;
}

- (void).cxx_destruct
{
}

- (unint64_t)layoutType
{
  return 4;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    double v14 = 0;
  }
  else
  {
    double v14 = [v12 objectAtIndex:a4 - 1];
  }
  unint64_t v15 = [v14 layoutType];
  if (v15 <= 0x12)
  {
    if (((1 << v15) & 0x6F002) != 0)
    {
      double v16 = +[CKUIBehavior sharedBehaviors];
      [v16 smallTranscriptSpace];
      double v18 = v17;

      if (![v14 hasTail]) {
        goto LABEL_14;
      }
      id v19 = +[CKUIBehavior sharedBehaviors];
      [v19 balloonMaskTailSizeForTailShape:1];
      double v18 = v18 + v20;
      goto LABEL_13;
    }
    if (((1 << v15) & 0x30) != 0)
    {
      id v19 = +[CKUIBehavior sharedBehaviors];
      [v19 smallTranscriptSpace];
LABEL_12:
      double v18 = v21;
LABEL_13:

      goto LABEL_14;
    }
    if (v15 == 7)
    {
      id v19 = +[CKUIBehavior sharedBehaviors];
      [v19 largeTranscriptSpace];
      goto LABEL_12;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = (id)objc_opt_class();
      *(_DWORD *)double v29 = 138412546;
      *(void *)&v29[4] = v25;
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = objc_opt_class();
      id v26 = *(id *)&v29[14];
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v29, 0x16u);
    }
  }
  double v27 = +[CKUIBehavior sharedBehaviors];
  [v27 smallTranscriptSpace];
  double v18 = v28;

LABEL_14:
  double v22 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v18 bottomSpacing:0.0];

  return v22;
}

@end