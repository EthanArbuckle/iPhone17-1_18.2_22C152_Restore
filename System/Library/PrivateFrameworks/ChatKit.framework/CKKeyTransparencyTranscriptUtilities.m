@interface CKKeyTransparencyTranscriptUtilities
+ (id)transcriptStringFromHandles:(id)a3 status:(unint64_t)a4;
@end

@implementation CKKeyTransparencyTranscriptUtilities

+ (id)transcriptStringFromHandles:(id)a3 status:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  v7 = @"KT_TRANSCRIPT_STATUS_ERROR_WITHOUT_STATIC_ACCOUNT_KEY";
  switch(a4)
  {
    case 5uLL:
      v7 = @"KT_TRANSCRIPT_STATUS_ERROR_WITH_STATIC_ACCOUNT_KEY";
      goto LABEL_8;
    case 6uLL:
      goto LABEL_8;
    case 9uLL:
      if ([v5 count] == 1) {
        v7 = @"KT_TRANSCRIPT_STATUS_TURNED_OFF";
      }
      else {
        v7 = @"KT_TRANSCRIPT_STATUS_TURNED_OFF_PLURAL";
      }
      goto LABEL_8;
    case 0xBuLL:
      v7 = @"KT_TRANSCRIPT_STATUS_UNAVAILABLE";
LABEL_8:
      v9 = +[CKUIBehavior sharedBehaviors];
      v10 = [v9 transcriptEmphasizedFontAttributes];

      v11 = +[CKUIBehavior sharedBehaviors];
      v12 = [v11 transcriptRegularFontAttributes];

      v13 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_135);
      v14 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v13];
      id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
      v16 = NSString;
      v17 = CKFrameworkBundle();
      v18 = [v17 localizedStringForKey:v7 value:&stru_1EDE4CA38 table:@"ChatKit-Key-Transparency"];
      v19 = objc_msgSend(v16, "stringWithFormat:", v18, v14);

      v20 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v21 = [v20 userInterfaceLayoutDirection];

      if (v21 == 1) {
        v22 = @"\u200F";
      }
      else {
        v22 = @"\u200E";
      }
      v23 = [(__CFString *)v22 stringByAppendingString:v19];

      v24 = (void *)[v15 initWithString:v23 attributes:v12];
      if (v14)
      {
        v25 = [v24 string];
        uint64_t v26 = [v25 rangeOfString:v14];
        uint64_t v28 = v27;

        if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v24, "setAttributes:range:", v10, v26, v28);
        }
      }
      v8 = (void *)[v24 copy];

      break;
    default:
      v8 = objc_opt_new();
      break;
  }

  return v8;
}

uint64_t __75__CKKeyTransparencyTranscriptUtilities_transcriptStringFromHandles_status___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _displayNameWithAbbreviation];
}

@end