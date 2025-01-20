@interface _CSSuggestionToken(MailUIPredicates)
+ (id)log;
- (id)_flagColorPredicate;
- (id)mui_messageListSearchPredicate;
- (void)_flagColorPredicate;
@end

@implementation _CSSuggestionToken(MailUIPredicates)

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CSSuggestionToken_MailUIPredicates__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v1 = (void *)log_log;
  return v1;
}

- (id)mui_messageListSearchPredicate
{
  uint64_t v2 = [a1 tokenKind];
  v3 = 0;
  switch(v2)
  {
    case 2:
      uint64_t v4 = [MEMORY[0x1E4F60390] predicateForMessagesWithAttachments];
      goto LABEL_3;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
      goto LABEL_13;
    case 5:
      v5 = [a1 itemSummary];
      uint64_t v6 = [v5 _datePredicate];
      goto LABEL_12;
    case 14:
      v5 = [a1 itemSummary];
      uint64_t v6 = objc_msgSend(v5, "mui_messageListSearchPredicate");
      goto LABEL_12;
    case 16:
      v5 = [a1 itemSummary];
      uint64_t v6 = [v5 _personPredicate];
      goto LABEL_12;
    case 19:
      v5 = [a1 itemSummary];
      uint64_t v6 = [v5 _readStatusPredicate];
      goto LABEL_12;
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      uint64_t v4 = [a1 _flagColorPredicate];
LABEL_3:
      v3 = (void *)v4;
      goto LABEL_13;
    case 33:
      v5 = [a1 itemSummary];
      uint64_t v6 = [v5 _flagStatusPredicate];
      goto LABEL_12;
    default:
      if (v2 != 46) {
        goto LABEL_13;
      }
      v5 = [a1 itemSummary];
      uint64_t v6 = [v5 _senderContainsPredicate];
LABEL_12:
      v3 = (void *)v6;

LABEL_13:
      return v3;
  }
}

- (id)_flagColorPredicate
{
  switch([a1 tokenKind])
  {
    case 26:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 0;
      goto LABEL_12;
    case 27:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 1;
      goto LABEL_12;
    case 28:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 2;
      goto LABEL_12;
    case 29:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 3;
      goto LABEL_12;
    case 30:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 4;
      goto LABEL_12;
    case 31:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 5;
      goto LABEL_12;
    case 32:
      uint64_t v2 = (void *)MEMORY[0x1E4F60390];
      uint64_t v3 = 6;
LABEL_12:
      v5 = [v2 predicateForFlagColor:v3];
      break;
    default:
      uint64_t v4 = [MEMORY[0x1E4F238B0] log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[_CSSuggestionToken(MailUIPredicates) _flagColorPredicate](a1);
      }

      v5 = 0;
      break;
  }
  return v5;
}

- (void)_flagColorPredicate
{
  v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "tokenKind"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_1DDCDB000, v2, v3, "_CSSuggestionTokenKindPerson token:%@ has unsupported tokenKind:%@.", v4, v5, v6, v7, v8);
}

@end