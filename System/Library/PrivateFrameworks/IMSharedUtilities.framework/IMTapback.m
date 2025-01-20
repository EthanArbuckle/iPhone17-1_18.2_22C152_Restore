@interface IMTapback
+ (BOOL)isValidAssociatedMessageType:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)tapbackWithAssociatedMessageType:(int64_t)a3;
- (BOOL)_isAssociatedMessageContentTypeTextInMessageSummaryInfo:(id)a3;
- (BOOL)_isAttachmentOnlyMessageText:(id)a3 isAdaptiveImageGlyphProvider:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoved;
- (BOOL)isSendable;
- (IMTapback)counterpart;
- (IMTapback)init;
- (IMTapback)initWithAssociatedMessageType:(int64_t)a3;
- (IMTapback)initWithCoder:(id)a3;
- (IMTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3;
- (IMTapback)removedTapbackCounterpart;
- (IMTapback)visibleTapbackCounterpart;
- (NSString)languageIdentifier;
- (id)_attributedAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6 effectString:(id)a7;
- (id)_convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6;
- (id)_plainStringAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4;
- (id)_plainStringReactionFromAttributedReactionString:(id)a3;
- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3;
- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3;
- (id)backwardCompatibilityStringFormatForMessageSummaryInfo:(id)a3;
- (id)backwardCompatibilityStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5;
- (id)contentTypeStringForMessageSummaryInfo:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)emojiReactionForPreviewString;
- (id)previewAttributedStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6 senderDisplayName:(id)a7 isFromMe:(BOOL)a8 effectString:(id)a9;
- (id)previewStringFormatForMessageSummaryInfo:(id)a3 adaptiveImageGlyphAvailable:(BOOL)a4 isFromMe:(BOOL)a5;
- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4;
- (int64_t)associatedMessageType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
@end

@implementation IMTapback

- (IMTapback)initWithAssociatedMessageType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMTapback;
  v4 = [(IMTapback *)&v8 init];
  if (!v4) {
    goto LABEL_4;
  }
  if ([(id)objc_opt_class() isValidAssociatedMessageType:a3])
  {
    v4->_associatedMessageType = a3;
LABEL_4:
    v5 = v4;
    goto LABEL_8;
  }
  v6 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1A09EEBA0(a3, (uint64_t)v4, v6);
  }

  v5 = 0;
LABEL_8:

  return v5;
}

- (void).cxx_destruct
{
}

- (id)previewStringFormatForMessageSummaryInfo:(id)a3 adaptiveImageGlyphAvailable:(BOOL)a4 isFromMe:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (v9)
  {
    BOOL v10 = [(IMTapback *)self shouldQuoteContentString:v9];
    v11 = [(IMTapback *)self actionStringFormatWithAdaptiveImageGlyphAvailable:v6];
    if (v11)
    {
      v12 = [(IMTapback *)self contentTypeStringForMessageSummaryInfo:v9];
      uint64_t v14 = [v11 actionStringFormat];
      v13 = [(id)v14 lowercaseString];

      LODWORD(v14) = [v11 requiresReactionReplacment];
      if (v5)
      {
        if (v10)
        {
          [NSString stringWithFormat:@"You %@ \"%%@\"", v13];
        }
        else
        {
          if (v12)
          {
            v17 = [NSString stringWithFormat:@"You %@ %@", v13, v12];
            uint64_t v14 = v14;
            goto LABEL_25;
          }
          [NSString stringWithFormat:@"You %@ %%@", v13];
        v17 = };
        BOOL v18 = v14 == 0;
        uint64_t v19 = 2;
      }
      else
      {
        if (v10)
        {
          [NSString stringWithFormat:@"%%@ %@ \"%%@\"", v13];
        }
        else
        {
          if (v12)
          {
            v17 = [NSString stringWithFormat:@"%%@ %@ %@", v13, v12];
            BOOL v18 = v14 == 0;
            uint64_t v19 = 4;
            goto LABEL_22;
          }
          [NSString stringWithFormat:@"%%@ %@ %%@", v13];
        v17 = };
        BOOL v18 = v14 == 0;
        uint64_t v19 = 6;
      }
LABEL_22:
      if (v18) {
        uint64_t v14 = v19;
      }
      else {
        uint64_t v14 = v19 + 1;
      }
LABEL_25:
      v20 = [(IMTapback *)self languageIdentifier];
      uint64_t v21 = [v20 length];
      v22 = [IMLocalizedTapbackStringFormat alloc];
      if (v21) {
        uint64_t v23 = [(IMLocalizedTapbackStringFormat *)v22 initWithLocalizedStringFormatType:v14 unlocalizedFormatString:v17 languageIdentifier:v20];
      }
      else {
        uint64_t v23 = [(IMLocalizedTapbackStringFormat *)v22 initWithLocalizedStringFormatType:v14 unlocalizedFormatString:v17];
      }
      v16 = (void *)v23;

      goto LABEL_29;
    }
    v15 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEF34(a2);
    }
  }
  else
  {
    v11 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEEB0(a2);
    }
  }
  v16 = 0;
LABEL_29:

  return v16;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (id)contentTypeStringForMessageSummaryInfo:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(a3, "__im_associatedMessageContentType");
    unsigned __int8 v4 = [v3 integerValue];

    if (v4 <= 0xAu) {
      return *(&off_1E5A104C8 + (char)v4);
    }
  }
  else
  {
    v7 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEEB0(a2);
    }
  }
  return 0;
}

- (BOOL)_isAssociatedMessageContentTypeTextInMessageSummaryInfo:(id)a3
{
  v3 = objc_msgSend(a3, "__im_associatedMessageContentType");
  char v4 = [v3 integerValue];

  return v4 == 1;
}

- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3
{
  char v4 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1A0788380(a2);
  }

  return 0;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (IMTapback)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    char v4 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_error_impl(&dword_1A0772000, v3, OS_LOG_TYPE_ERROR, "init is dissallowed in %@", buf, 0xCu);
  }
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  objc_super v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is not implemented", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (IMTapback *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(IMTapback *)self associatedMessageType];
      BOOL v6 = v5 == [(IMTapback *)v4 associatedMessageType];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (IMTapback)removedTapbackCounterpart
{
  return 0;
}

- (IMTapback)visibleTapbackCounterpart
{
  return 0;
}

- (IMTapback)counterpart
{
  return 0;
}

- (BOOL)isRemoved
{
  return ([(IMTapback *)self associatedMessageType] & 0xFFFFFFFFFFFFFFF8) == 3000;
}

- (BOOL)isSendable
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)IMTapback;
  char v4 = [(IMTapback *)&v11 description];
  uint64_t v5 = [(IMTapback *)self associatedMessageType];
  BOOL v6 = NSString;
  v7 = IMStringFromAssociatedMessageType(v5);
  objc_super v8 = [v6 stringWithFormat:@"%ld (%@)", v5, v7];

  id v9 = [v3 stringWithFormat:@"%@: associated message type: %@", v4, v8];

  return v9;
}

- (IMTapback)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"associatedMessageType"];

  return [(IMTapback *)self initWithAssociatedMessageType:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  theDict = (__CFDictionary *)a3;
  uint64_t v4 = [NSNumber numberWithLongLong:self->_associatedMessageType];
  if (v4) {
    CFDictionarySetValue(theDict, @"associatedMessageType", v4);
  }
}

- (IMTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"associatedMessageType"];
  uint64_t v5 = -[IMTapback initWithAssociatedMessageType:](self, "initWithAssociatedMessageType:", [v4 unsignedLongValue]);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t associatedMessageType = self->_associatedMessageType;

  return (id)[v4 initWithAssociatedMessageType:associatedMessageType];
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return 0;
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  id v4 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1A09EEC9C(a2);
  }

  return 0;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3 isCommSafetySensitiveProvider:(id)a4
{
  uint64_t v5 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1A09EED20(a2);
  }

  return 0;
}

- (id)emojiReactionForPreviewString
{
  v3 = IMLogHandleForCategory("IMTapback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1A09EEDA4(a2);
  }

  return 0;
}

- (BOOL)_isAttachmentOnlyMessageText:(id)a3 isAdaptiveImageGlyphProvider:(id)a4
{
  id v5 = a3;
  BOOL v6 = (uint64_t (**)(id, void *))a4;
  v7 = [v5 string];
  if ([v7 isEqualToString:*MEMORY[0x1E4F6C110]])
  {
    objc_super v8 = [v5 attribute:*MEMORY[0x1E4F6C188] atIndex:0 effectiveRange:0];
    if ([v8 length])
    {
      if (v6[2](v6, v8))
      {
        BOOL v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
      id v10 = IMLogHandleForCategory("IMTapback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A09EEE6C(v10);
      }
    }
    else
    {
      id v10 = IMLogHandleForCategory("IMTapback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A09EEE28(v10);
      }
    }

    BOOL v9 = 1;
    goto LABEL_11;
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (id)_convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[a3 mutableCopy];
  objc_msgSend(v12, "__im_insertAdaptiveImageGlyphsForFileTransfersUsingIsAdaptiveImageGlyphProvider:isCommSafetySensitiveProvider:adaptiveImageGlyphProvider:", v11, v10, v9);

  objc_msgSend(v12, "__im_filterAttributesForDisplayablePreviewText");
  uint64_t v13 = (void *)[v12 copy];

  return v13;
}

- (id)_attributedAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6 effectString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (v16 && [v16 length])
  {
    BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17];
    goto LABEL_18;
  }
  uint64_t v19 = [v12 objectForKey:@"ame"];
  if (![v19 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"])
  {
    if ([(IMTapback *)self _isAssociatedMessageContentTypeTextInMessageSummaryInfo:v12])
    {
      uint64_t v23 = objc_msgSend(v12, "__imami_attributedStringForKey:", @"ampt");
      v24 = objc_msgSend(v23, "im_trimmedSummaryIfNeededForTapback");

      if (v24)
      {
        if (![(IMTapback *)self _isAttachmentOnlyMessageText:v24 isAdaptiveImageGlyphProvider:v13])
        {
          BOOL v18 = [(IMTapback *)self _convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:v24 isAdaptiveImageGlyphProvider:v13 isCommSafetySensitiveProvider:v14 adaptiveImageGlyphProvider:v15];

          if (v18) {
            goto LABEL_17;
          }
          goto LABEL_13;
        }
        v25 = IMLogHandleForCategory("IMTapback");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Attributed associated message text contains only an attachment, not using attributed text in preview.", v30, 2u);
        }
      }
    }
LABEL_13:
    uint64_t v26 = objc_msgSend(v12, "__im_associatedMessageSummary");
    v27 = (void *)v26;
    v28 = &stru_1EF2CAD28;
    if (v26) {
      v28 = (__CFString *)v26;
    }
    uint64_t v21 = v28;

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    goto LABEL_16;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
  objc_msgSend(v12, "__im_associatedMessageSummary");
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v22 = v20;
LABEL_16:
  BOOL v18 = (void *)[v22 initWithString:v21];

LABEL_17:
LABEL_18:

  return v18;
}

- (id)previewAttributedStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5 adaptiveImageGlyphProvider:(id)a6 senderDisplayName:(id)a7 isFromMe:(BOOL)a8 effectString:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = (__CFString *)a7;
  id v20 = a9;
  uint64_t v21 = [(IMTapback *)self adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:v18];
  id v22 = [(IMTapback *)self previewStringFormatForMessageSummaryInfo:v15 adaptiveImageGlyphAvailable:v21 != 0 isFromMe:v9];
  uint64_t v23 = v22;
  if (v22)
  {
    id v51 = v20;
    v50 = [v22 localizedFormatString];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v50];
    switch([v23 localizedStringFormatType])
    {
      case 0:
        id v25 = v24;
        break;
      case 1:
        uint64_t v26 = [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:v21 isCommSafetySensitiveProvider:v17];
        goto LABEL_13;
      case 2:
        uint64_t v26 = [(IMTapback *)self _attributedAssociatedMessageSummaryFromMessageSummaryInfo:v15 isAdaptiveImageGlyphProvider:v16 isCommSafetySensitiveProvider:v17 adaptiveImageGlyphProvider:v18 effectString:v20];
        goto LABEL_13;
      case 3:
        uint64_t v44 = [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:v21 isCommSafetySensitiveProvider:v17];
        [(IMTapback *)self _attributedAssociatedMessageSummaryFromMessageSummaryInfo:v15 isAdaptiveImageGlyphProvider:v16 isCommSafetySensitiveProvider:v17 adaptiveImageGlyphProvider:v18 effectString:v20];
        v27 = id v46 = v16;
        v28 = (void *)v44;
        objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v24, v44, v27);
        goto LABEL_22;
      case 4:
        id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v19) {
          v30 = v19;
        }
        else {
          v30 = &stru_1EF2CAD28;
        }
        uint64_t v26 = [v29 initWithString:v30];
LABEL_13:
        id v47 = v16;
        v31 = (void *)v26;
        objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v24, v26);
        id v25 = (id)objc_claimAutoreleasedReturnValue();

        id v16 = v47;
        break;
      case 5:
        id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v19) {
          v33 = v19;
        }
        else {
          v33 = &stru_1EF2CAD28;
        }
        v34 = v24;
        v35 = (void *)[v32 initWithString:v33];
        [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:v21 isCommSafetySensitiveProvider:v17];
        v36 = id v48 = v16;
        objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v34, v35, v36);
        id v25 = (id)objc_claimAutoreleasedReturnValue();

        id v16 = v48;
        v24 = v34;
        break;
      case 6:
        id v37 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v19) {
          v38 = v19;
        }
        else {
          v38 = &stru_1EF2CAD28;
        }
        v28 = (void *)[v37 initWithString:v38];
        [(IMTapback *)self _attributedAssociatedMessageSummaryFromMessageSummaryInfo:v15 isAdaptiveImageGlyphProvider:v16 isCommSafetySensitiveProvider:v17 adaptiveImageGlyphProvider:v18 effectString:v51];
        v27 = id v46 = v16;
        objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v24, v28, v27);
LABEL_22:
        id v25 = (id)objc_claimAutoreleasedReturnValue();

        id v16 = v46;
        break;
      case 7:
        id v39 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v19) {
          v40 = v19;
        }
        else {
          v40 = &stru_1EF2CAD28;
        }
        v45 = (void *)[v39 initWithString:v40];
        v41 = [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:v21 isCommSafetySensitiveProvider:v17];
        [(IMTapback *)self _attributedAssociatedMessageSummaryFromMessageSummaryInfo:v15 isAdaptiveImageGlyphProvider:v16 isCommSafetySensitiveProvider:v17 adaptiveImageGlyphProvider:v18 effectString:v51];
        v42 = id v49 = v16;
        objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v24, v45, v41, v42);
        id v25 = (id)objc_claimAutoreleasedReturnValue();

        id v16 = v49;
        break;
      default:
        id v25 = 0;
        break;
    }

    id v20 = v51;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)backwardCompatibilityStringFormatForMessageSummaryInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [(IMTapback *)self actionStringFormatWithAdaptiveImageGlyphAvailable:0];
    v7 = v6;
    if (v6)
    {
      objc_super v8 = [v6 actionStringFormat];
      BOOL v9 = [(IMTapback *)self contentTypeStringForMessageSummaryInfo:v5];
      BOOL v10 = [(IMTapback *)self shouldQuoteContentString:v5];
      LODWORD(v11) = [v7 requiresReactionReplacment];
      if (v10)
      {
        [NSString stringWithFormat:@"%@ \"%%@\"", v8];
      }
      else
      {
        if (v9)
        {
          id v14 = [NSString stringWithFormat:@"%@ %@", v8, v9];
          uint64_t v11 = v11;
          goto LABEL_17;
        }
        [NSString stringWithFormat:@"%@ %%@", v8];
      id v14 = };
      if (v11) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 2;
      }
LABEL_17:
      id v15 = [(IMTapback *)self languageIdentifier];
      uint64_t v16 = [v15 length];
      id v17 = [IMLocalizedTapbackStringFormat alloc];
      if (v16) {
        uint64_t v18 = [(IMLocalizedTapbackStringFormat *)v17 initWithLocalizedStringFormatType:v11 unlocalizedFormatString:v14 languageIdentifier:v15];
      }
      else {
        uint64_t v18 = [(IMLocalizedTapbackStringFormat *)v17 initWithLocalizedStringFormatType:v11 unlocalizedFormatString:v14];
      }
      id v13 = (void *)v18;

      goto LABEL_21;
    }
    id v12 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEFB8(a2);
    }
  }
  else
  {
    v7 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEEB0(a2);
    }
  }
  id v13 = 0;
LABEL_21:

  return v13;
}

- (id)_plainStringAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "__imami_attributedStringForKey:", @"ampt");
  objc_super v8 = v7;
  if (!v7
    || (uint64_t v15 = 0,
        objc_msgSend(v7, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingIsAdaptiveImageGlyphProvider:replacementTextProvider:removedTransferGUIDsOut:", v6, &unk_1EF2BF120, &v15), BOOL v9 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "string"), v10 = (__CFString *)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    uint64_t v11 = objc_msgSend(v5, "__im_associatedMessageSummary");
    id v12 = (void *)v11;
    id v13 = &stru_1EF2CAD28;
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    BOOL v10 = v13;
  }

  return v10;
}

- (id)_plainStringReactionFromAttributedReactionString:(id)a3
{
  v3 = objc_msgSend(a3, "__im_attributedStringByReplacingAdaptiveImageGlyphsWithUnknownCharacterSymbol");
  id v4 = [v3 string];

  return v4;
}

- (id)backwardCompatibilityStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 isCommSafetySensitiveProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    id v12 = [(IMTapback *)self backwardCompatibilityStringFormatForMessageSummaryInfo:v9];
    uint64_t v13 = [v12 localizedStringFormatType];
    id v14 = [v12 localizedFormatString];
    uint64_t v15 = v14;
    switch(v13)
    {
      case 0:
        id v17 = v14;
        goto LABEL_16;
      case 1:
        uint64_t v18 = [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:0 isCommSafetySensitiveProvider:v11];
        uint64_t v19 = [(IMTapback *)self _plainStringReactionFromAttributedReactionString:v18];
        id v17 = [NSString localizedStringWithValidatedFormat:v15, @"%@", 0, v19 validFormatSpecifiers error];
        goto LABEL_14;
      case 2:
        uint64_t v18 = [(IMTapback *)self _plainStringAssociatedMessageSummaryFromMessageSummaryInfo:v9 isAdaptiveImageGlyphProvider:v10];
        id v17 = [NSString localizedStringWithValidatedFormat:v15, @"%@", 0, v18 validFormatSpecifiers error];
        goto LABEL_15;
      case 3:
        uint64_t v18 = [(IMTapback *)self reactionStringWithAdaptiveImageGlyph:0 isCommSafetySensitiveProvider:v11];
        uint64_t v19 = [(IMTapback *)self _plainStringReactionFromAttributedReactionString:v18];
        id v20 = [(IMTapback *)self _plainStringAssociatedMessageSummaryFromMessageSummaryInfo:v9 isAdaptiveImageGlyphProvider:v10];
        id v17 = [NSString localizedStringWithValidatedFormat:v15, @"%@ %@", 0, v19, v20 validFormatSpecifiers error];

LABEL_14:
LABEL_15:

        goto LABEL_16;
      case 4:
      case 5:
      case 6:
      case 7:
        uint64_t v16 = IMLogHandleForCategory("IMTapback");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_1A09EF03C(v16);
        }

        goto LABEL_6;
      default:
LABEL_6:
        id v17 = 0;
LABEL_16:

        break;
    }
  }
  else
  {
    id v12 = IMLogHandleForCategory("IMTapback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A09EEEB0(a2);
    }
    id v17 = 0;
  }

  return v17;
}

- (void)setLanguageIdentifier:(id)a3
{
}

+ (id)tapbackWithAssociatedMessageType:(int64_t)a3
{
  if ((unint64_t)(a3 - 3000) >= 6 && (unint64_t)(a3 - 2000) > 5) {
    v3 = 0;
  }
  else {
    v3 = [[IMClassicTapback alloc] initWithAssociatedMessageType:a3];
  }

  return v3;
}

@end