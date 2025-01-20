@interface VMMessageTranscriptViewModel
+ (BOOL)metricsCollectionValidForLocale:(id)a3;
+ (NSURL)negativeFeedbackURL;
+ (NSURL)neutralFeedbackURL;
+ (NSURL)positiveFeedbackURL;
- (BOOL)donated;
- (BOOL)isTranscribing;
- (BOOL)isTranscriptionAvailable;
- (BOOL)transcriptionAttempted;
- (NSAttributedString)localizedAttributedFeedbackText;
- (NSAttributedString)localizedAttributedText;
- (NSAttributedString)localizedAttributedTitle;
- (NSString)messageTranscriptAttributedText;
- (UIView)tintColorDelegate;
- (VMMessageTranscriptViewModel)initWithDonated:(BOOL)a3 transcribing:(BOOL)a4 transcriptionAttempted:(BOOL)a5 transcriptionAvailable:(BOOL)a6 messageTranscript:(id)a7;
- (VMMessageTranscriptViewModel)initWithMPMessage:(id)a3;
- (VMMessageTranscriptViewModel)initWithMessage:(id)a3;
- (float)messageTranscriptConfidence;
- (id)localizedAttributedFeedbackTextForConfidence:(unint64_t)a3 locale:(id)a4;
- (id)localizedAttributedFeedbackTextWithLocale:(id)a3;
- (id)localizedAttributedTextForConfidence:(unint64_t)a3;
- (id)localizedAttributedTextForMessage;
- (id)localizedAttributedTitleForConfidence:(unint64_t)a3;
- (id)tintColorForColor:(id)a3;
- (unint64_t)confidence;
- (unint64_t)messageTranscriptConfidenceRating;
- (void)setTintColorDelegate:(id)a3;
- (void)setTranscribing:(BOOL)a3;
- (void)setTranscriptionAttempted:(BOOL)a3;
- (void)setTranscriptionAvailable:(BOOL)a3;
@end

@implementation VMMessageTranscriptViewModel

+ (NSURL)neutralFeedbackURL
{
  return +[NSURL URLWithString:@"mobile-phone-voicemail-transcription://report-feedback"];
}

+ (NSURL)negativeFeedbackURL
{
  return +[NSURL URLWithString:@"mobile-phone-voicemail-transcription://negative"];
}

+ (NSURL)positiveFeedbackURL
{
  return +[NSURL URLWithString:@"mobile-phone-voicemail-transcription://positive"];
}

- (VMMessageTranscriptViewModel)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [MPVisualTranscriptionMessage alloc];
  v6 = [v4 transcript];
  v7 = [(MPVisualTranscriptionMessage *)v5 initWithVMTranscript:v6];

  id v8 = [v4 isTranscriptionRated];
  id v9 = [v4 isTranscribing];
  id v10 = [v4 wasTranscriptionAttempted];
  id v11 = [v4 isTranscriptionAvailable];

  v12 = [(VMMessageTranscriptViewModel *)self initWithDonated:v8 transcribing:v9 transcriptionAttempted:v10 transcriptionAvailable:v11 messageTranscript:v7];
  return v12;
}

- (VMMessageTranscriptViewModel)initWithDonated:(BOOL)a3 transcribing:(BOOL)a4 transcriptionAttempted:(BOOL)a5 transcriptionAvailable:(BOOL)a6 messageTranscript:(id)a7
{
  id v12 = a7;
  v19.receiver = self;
  v19.super_class = (Class)VMMessageTranscriptViewModel;
  v13 = [(VMMessageTranscriptViewModel *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_donated = a3;
    v13->_transcribing = a4;
    v13->_transcriptionAttempted = a5;
    v13->_transcriptionAvailable = a6;
    if (v12)
    {
      [v12 confidence];
      *(float *)&double v15 = v15;
      v14->_messageTranscriptConfidence = *(float *)&v15;
      v14->_messageTranscriptConfidenceRating = (unint64_t)[v12 confidenceRating];
      uint64_t v16 = [v12 attributedText];
      messageTranscriptAttributedText = v14->_messageTranscriptAttributedText;
      v14->_messageTranscriptAttributedText = (NSString *)v16;
    }
  }

  return v14;
}

- (NSAttributedString)localizedAttributedFeedbackText
{
  return (NSAttributedString *)[(VMMessageTranscriptViewModel *)self localizedAttributedFeedbackTextWithLocale:0];
}

- (id)localizedAttributedFeedbackTextWithLocale:(id)a3
{
  id v4 = a3;
  v5 = [(VMMessageTranscriptViewModel *)self localizedAttributedFeedbackTextForConfidence:[(VMMessageTranscriptViewModel *)self confidence] locale:v4];

  return v5;
}

- (NSAttributedString)localizedAttributedText
{
  return (NSAttributedString *)[(VMMessageTranscriptViewModel *)self localizedAttributedTextForMessage];
}

- (NSAttributedString)localizedAttributedTitle
{
  unint64_t v3 = [(VMMessageTranscriptViewModel *)self confidence];

  return (NSAttributedString *)[(VMMessageTranscriptViewModel *)self localizedAttributedTitleForConfidence:v3];
}

- (id)localizedAttributedTextForMessage
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v3 setAlignment:4];
  id v4 = +[NSMutableDictionary dictionary];
  v5 = +[UIColor dynamicSecondaryLabelColor];
  v6 = [(VMMessageTranscriptViewModel *)self tintColorForColor:v5];
  [v4 setObject:v6 forKeyedSubscript:NSForegroundColorAttributeName];

  v7 = +[UIFont telephonyUIBodyShortFont];
  [v4 setObject:v7 forKeyedSubscript:NSFontAttributeName];

  [v4 setObject:v3 forKeyedSubscript:NSParagraphStyleAttributeName];
  if ([(VMMessageTranscriptViewModel *)self isTranscribing])
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    CFStringRef v10 = @"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_TRANSCRIBING";
  }
  else
  {
    if (![(VMMessageTranscriptViewModel *)self transcriptionAttempted]
      || [(VMMessageTranscriptViewModel *)self isTranscriptionAvailable])
    {
      id v11 = [(VMMessageTranscriptViewModel *)self localizedAttributedTextForConfidence:[(VMMessageTranscriptViewModel *)self confidence]];
      goto LABEL_8;
    }
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    CFStringRef v10 = @"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_TRANSCRIBE_ERROR";
  }
  id v12 = [v8 localizedStringForKey:v10 value:&stru_10005E8B0 table:@"VoicemailUI"];

  id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v12 attributes:v4];
LABEL_8:

  return v11;
}

- (unint64_t)confidence
{
  unint64_t result = [(VMMessageTranscriptViewModel *)self messageTranscriptConfidenceRating];
  if (result - 1 >= 3)
  {
    [(VMMessageTranscriptViewModel *)self messageTranscriptConfidence];
    if (v4 <= PHVoicemailLowQualityConfidenceThresholdForTranscript())
    {
      [(VMMessageTranscriptViewModel *)self messageTranscriptConfidence];
      if (v5 <= PHVoicemailLowQualityConfidenceThresholdForTranscript())
      {
        [(VMMessageTranscriptViewModel *)self messageTranscriptConfidence];
        if (v6 <= PHVoicemailConfidenceThresholdForTranscript()) {
          return 1;
        }
        else {
          return 2;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)localizedAttributedFeedbackTextForConfidence:(unint64_t)a3 locale:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(id)objc_opt_class() metricsCollectionValidForLocale:v6];

  if (!v7)
  {
    id v31 = 0;
    goto LABEL_13;
  }
  id v8 = [UIApp userInterfaceLayoutDirection];
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v10 setAlignment:4];
  id v11 = +[UIFont voicemailFootnoteFont];
  [v9 setObject:v11 forKeyedSubscript:NSFontAttributeName];

  [v9 setObject:v10 forKeyedSubscript:NSParagraphStyleAttributeName];
  id v12 = +[UIColor dynamicSecondaryLabelColor];
  v13 = [(VMMessageTranscriptViewModel *)self tintColorForColor:v12];
  [v9 setObject:v13 forKeyedSubscript:NSForegroundColorAttributeName];

  if (a3 - 2 < 2)
  {
    v14 = +[NSBundle mainBundle];
    [v14 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_OPTION_NEGATIVE" value:&stru_10005E8B0 table:@"VoicemailUI"];
    uint64_t v15 = v42 = v9;

    uint64_t v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_OPTION_POSITIVE" value:&stru_10005E8B0 table:@"VoicemailUI"];

    +[NSBundle mainBundle];
    v18 = id v41 = v10;
    objc_super v19 = [v18 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_WITH_OPTIONS_%_OR_%" value:&stru_10005E8B0 table:@"VoicemailUI"];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17, v15);

    id v40 = [v20 rangeOfString:v15];
    uint64_t v22 = v21;
    id v23 = [v20 rangeOfString:v17];
    uint64_t v25 = v24;
    id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v20 attributes:v42];
    v27 = [(id)objc_opt_class() positiveFeedbackURL];
    [v26 addAttribute:NSLinkAttributeName value:v27 range:v23 v25];

    id v28 = (id)v15;
    id v9 = v42;
    v29 = [(id)objc_opt_class() neutralFeedbackURL];
    uint64_t v30 = v22;
    id v10 = v41;
    [v26 addAttribute:NSLinkAttributeName value:v29 range:v40];
LABEL_11:

    id v31 = [v26 copy];
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v32 = [(id)objc_opt_class() neutralFeedbackURL];
    [v9 setObject:v32 forKeyedSubscript:NSLinkAttributeName];

    id v28 = objc_alloc_init((Class)NSTextAttachment);
    v33 = +[UIImage voicemailReportFeedbackGlyphImage];
    v17 = [v33 imageWithRenderingMode:2];

    [v28 setImage:v17];
    [v9 setObject:v28 forKeyedSubscript:NSAttachmentAttributeName];
    v34 = +[NSBundle mainBundle];
    v20 = [v34 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_CONFIDENCE_NONE" value:&stru_10005E8B0 table:@"VoicemailUI"];

    id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_10005E8B0 attributes:v9];
    if (v8 == (id)1)
    {
      v29 = [v20 stringByAppendingString:@" "];
      id v35 = [objc_alloc((Class)NSAttributedString) initWithString:v29];
      [v26 appendAttributedString:v35];

      id v36 = +[NSAttributedString attributedStringWithAttachment:v28];
    }
    else
    {
      v29 = [@" " stringByAppendingString:v20];
      v37 = +[NSAttributedString attributedStringWithAttachment:v28];
      [v26 appendAttributedString:v37];

      id v36 = [objc_alloc((Class)NSAttributedString) initWithString:v29];
    }
    v38 = v36;
    [v26 appendAttributedString:v36];

    [v26 addAttributes:v9 range:0, [v26 length]];
    goto LABEL_11;
  }
  id v31 = 0;
LABEL_12:

LABEL_13:

  return v31;
}

- (id)localizedAttributedTextForConfidence:(unint64_t)a3
{
  float v5 = +[NSMutableDictionary dictionary];
  id v6 = +[UIColor dynamicSecondaryLabelColor];
  unsigned int v7 = [(VMMessageTranscriptViewModel *)self tintColorForColor:v6];
  [v5 setObject:v7 forKeyedSubscript:NSForegroundColorAttributeName];

  if (a3 - 2 < 2)
  {
    id v8 = PHVoicemailTranscriptAttributedPrefix();
    PHVoicemailTranscriptAttributedSuffix();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [(VMMessageTranscriptViewModel *)self messageTranscriptAttributedText];
    id v11 = [v10 mutableCopy];

    [v11 insertAttributedString:v8 atIndex:0];
    [v11 appendAttributedString:v9];
    id v12 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v8 size];
    [v12 setHeadIndent:];
    v13 = +[UIFont telephonyUIBodyShortFont];
    [v5 setObject:v13 forKeyedSubscript:NSFontAttributeName];

    [v5 setObject:v12 forKeyedSubscript:NSParagraphStyleAttributeName];
    [v11 addAttributes:v5 range:NSMakeRange(0, [v11 length])];
    id v14 = [v11 copy];

LABEL_5:
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v15 = +[NSBundle mainBundle];
    id v8 = [v15 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_CONFIDENCE_NONE" value:&stru_10005E8B0 table:@"VoicemailUI"];

    id v9 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v9 setAlignment:4];
    uint64_t v16 = +[UIFont telephonyUIBodyShortFont];
    [v5 setObject:v16 forKeyedSubscript:NSFontAttributeName];

    [v5 setObject:v9 forKeyedSubscript:NSParagraphStyleAttributeName];
    id v14 = [objc_alloc((Class)NSAttributedString) initWithString:v8 attributes:v5];
    goto LABEL_5;
  }
  id v14 = 0;
LABEL_7:

  return v14;
}

- (id)localizedAttributedTitleForConfidence:(unint64_t)a3
{
  float v5 = +[NSMutableDictionary dictionary];
  id v6 = +[UIFont telephonyUIBodyShortEmphasizedFont];
  [v5 setObject:v6 forKeyedSubscript:NSFontAttributeName];

  unsigned int v7 = +[UIColor dynamicSecondaryLabelColor];
  id v8 = [(VMMessageTranscriptViewModel *)self tintColorForColor:v7];
  [v5 setObject:v8 forKeyedSubscript:NSForegroundColorAttributeName];

  if (a3 == 3)
  {
    id v9 = objc_alloc((Class)NSAttributedString);
    id v10 = +[NSBundle mainBundle];
    id v11 = v10;
    CFStringRef v12 = @"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE";
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    id v9 = objc_alloc((Class)NSAttributedString);
    id v10 = +[NSBundle mainBundle];
    id v11 = v10;
    CFStringRef v12 = @"VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE_CONFIDENCE_LOW";
LABEL_5:
    v13 = [v10 localizedStringForKey:v12 value:&stru_10005E8B0 table:@"VoicemailUI"];
    id v14 = [v9 initWithString:v13 attributes:v5];

    goto LABEL_7;
  }
  id v14 = 0;
LABEL_7:

  return v14;
}

- (id)tintColorForColor:(id)a3
{
  id v4 = a3;
  float v5 = [(VMMessageTranscriptViewModel *)self tintColorDelegate];
  id v6 = [v5 _accessibilityHigherContrastTintColorForColor:v4];
  unsigned int v7 = v6;
  if (!v6) {
    id v6 = v4;
  }
  id v8 = v6;

  return v8;
}

+ (BOOL)metricsCollectionValidForLocale:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[NSLocale currentLocale];
  }
  id v4 = [v3 regionCode];
  char v5 = [TULVMRegionsWithoutMetrics containsObject:v4] ^ 1;

  return v5;
}

- (BOOL)donated
{
  return self->_donated;
}

- (BOOL)isTranscribing
{
  return self->_transcribing;
}

- (void)setTranscribing:(BOOL)a3
{
  self->_transcribing = a3;
}

- (BOOL)transcriptionAttempted
{
  return self->_transcriptionAttempted;
}

- (void)setTranscriptionAttempted:(BOOL)a3
{
  self->_transcriptionAttempted = a3;
}

- (BOOL)isTranscriptionAvailable
{
  return self->_transcriptionAvailable;
}

- (void)setTranscriptionAvailable:(BOOL)a3
{
  self->_transcriptionAvailable = a3;
}

- (UIView)tintColorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tintColorDelegate);

  return (UIView *)WeakRetained;
}

- (void)setTintColorDelegate:(id)a3
{
}

- (float)messageTranscriptConfidence
{
  return self->_messageTranscriptConfidence;
}

- (unint64_t)messageTranscriptConfidenceRating
{
  return self->_messageTranscriptConfidenceRating;
}

- (NSString)messageTranscriptAttributedText
{
  return self->_messageTranscriptAttributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTranscriptAttributedText, 0);

  objc_destroyWeak((id *)&self->_tintColorDelegate);
}

- (VMMessageTranscriptViewModel)initWithMPMessage:(id)a3
{
  swift_unknownObjectRetain();
  char v5 = [-VMMessageTranscriptViewModel initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:](self, "initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:", [a3 isTranscriptionRated], [a3 isTranscribing], [a3 transcriptionAttempted], [a3 isTranscriptionAvailable], [a3 transcript]);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5;
}

@end