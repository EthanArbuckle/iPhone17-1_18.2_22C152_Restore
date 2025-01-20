@interface CKStewieTranscriptResumeButtonsChatItem
- (BOOL)isEmergency;
- (BOOL)shouldShowStewieTextButton;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (Class)cellClass;
- (id)chatIdentifier;
- (id)loadTranscriptText;
@end

@implementation CKStewieTranscriptResumeButtonsChatItem

- (Class)cellClass
{
  [(CKStewieTranscriptResumeButtonsChatItem *)self isEmergency];
  v2 = objc_opt_class();

  return (Class)v2;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptBoldTextAlignmentInsets];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    a4->top = v10;
    a4->left = v12;
    a4->bottom = v14;
    a4->right = v16;
  }
  -[objc_class heightForChatItem:fittingSize:]([(CKStewieTranscriptResumeButtonsChatItem *)self cellClass], "heightForChatItem:fittingSize:", self, width, height);
  double v18 = v17;
  double v19 = width;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (id)chatIdentifier
{
  v2 = [(CKStewieTranscriptResumeButtonsChatItem *)self imStewieResumeItem];
  v3 = [v2 chatIdentifier];

  return v3;
}

- (BOOL)isEmergency
{
  v2 = [(CKStewieTranscriptResumeButtonsChatItem *)self chatIdentifier];
  char v3 = IMIsStringStewieEmergency();

  return v3;
}

- (id)loadTranscriptText
{
  char v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptEmphasizedFontAttributes];

  BOOL v5 = [(CKStewieTranscriptResumeButtonsChatItem *)self isEmergency];
  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = CKFrameworkBundle();
  v8 = v7;
  if (v5)
  {
    double v9 = @"CALL_EMERGENCY_SERVICES_IF_YOU_NEED_HELP";
    CGFloat v10 = @"ChatKit-SYDROB_FEATURES";
  }
  else
  {
    double v9 = @"SATELLITE_CONNECTION_ENDED";
    CGFloat v10 = @"ChatKit-Avocet";
  }
  double v11 = [v7 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:v10];
  CGFloat v12 = (void *)[v6 initWithString:v11 attributes:v4];

  return v12;
}

- (BOOL)shouldShowStewieTextButton
{
  BOOL v2 = [(CKStewieTranscriptResumeButtonsChatItem *)self isEmergency];
  char v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  v4 = v3;
  if (v2) {
    char v5 = [v3 shouldShowTextEmergencyServicesButton];
  }
  else {
    char v5 = [v3 shouldShowTextRoadsideProviderButton];
  }
  BOOL v6 = v5;

  return v6;
}

@end