@interface CKTextMessagePartChatItem
- (BOOL)_textContainsIMTextEffect;
- (BOOL)allowsMentions;
- (BOOL)containsExcessiveLineHeightCharacters;
- (BOOL)containsHyperlink;
- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:(double)a3;
- (BOOL)isShowingEditHistory;
- (BOOL)mentionsMe:(id)a3;
- (BOOL)shouldUseBigEmojiStyleBalloonViewClass;
- (BOOL)showMoneyResults;
- (Class)balloonViewClass;
- (Class)impactBalloonViewClass;
- (NSArray)emojiImageMediaObjectsInMessagePartText;
- (NSAttributedString)fallbackCorruptText;
- (NSAttributedString)subject;
- (NSAttributedString)text;
- (NSOrderedSet)transferGUIDsInMessagePartText;
- (UIEdgeInsets)stickerReactionInsets;
- (double)ageForTextEffectCoordination;
- (id)_attributedTextWithTextColor:(id)a3;
- (id)_fallbackCorruptMessageTextWithTextColor:(id)a3;
- (id)_time;
- (id)adaptiveImageGlyphForTransferGUID:(id)a3;
- (id)bodyTextFont;
- (id)compositionWithContext:(id)a3;
- (id)dragItemProvider;
- (id)loadTranscriptText;
- (id)meMentionsTextColor;
- (id)mediaObjectForTransferGUID:(id)a3;
- (id)mediaObjectsInMessagePartText;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)time;
- (int64_t)bigEmojiStyle;
- (void)dragItemProvider;
@end

@implementation CKTextMessagePartChatItem

- (id)loadTranscriptText
{
  int64_t v3 = [(CKTextMessagePartChatItem *)self bigEmojiStyle];
  if ((unint64_t)(v3 - 1) < 3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    uint64_t v6 = [v5 transcriptBigEmojiColor];
LABEL_5:
    v7 = (void *)v6;

    goto LABEL_7;
  }
  if (!v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    uint64_t v6 = objc_msgSend(v5, "balloonTextColorInPrintingPathForColorType:", -[CKMessagePartChatItem color](self, "color"));
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:
  if ([(CKMessagePartChatItem *)self isCorrupt]) {
    [(CKTextMessagePartChatItem *)self _fallbackCorruptMessageTextWithTextColor:v7];
  }
  else {
  v8 = [(CKTextMessagePartChatItem *)self _attributedTextWithTextColor:v7];
  }

  return v8;
}

- (BOOL)showMoneyResults
{
  int64_t v3 = (void *)MEMORY[0x1E4F6E6D8];
  v4 = [(CKMessagePartChatItem *)self sender];
  v5 = [v4 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  int v6 = [v3 isCNContactAKnownContact:v5];

  if (CKShouldShowSURF())
  {
    v7 = [(CKMessagePartChatItem *)self message];
    v8 = objc_msgSend(v7, "__ck_service");
    unsigned int v9 = v6 & ~objc_msgSend(v8, "__ck_isSMS");
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)_fallbackCorruptMessageTextWithTextColor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
  int v6 = CKFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"CORRUPT_MESSAGE_FALLBACK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v8 = (void *)[v5 initWithString:v7 attributes:0];

  uint64_t v9 = [v8 length];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  v11 = [(CKTextMessagePartChatItem *)self bodyTextFont];
  objc_msgSend(v8, "addAttribute:value:range:", v10, v11, 0, v9);

  if (v4)
  {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v4, 0, v9);
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_fallbackCorruptMessageTextWithTextColor: textColor is nil.", v14, 2u);
    }
  }

  return v8;
}

- (id)_attributedTextWithTextColor:(id)a3
{
  v179[6] = *MEMORY[0x1E4F143B8];
  id v122 = a3;
  v124 = [(CKTextMessagePartChatItem *)self subject];
  id v4 = [v124 string];
  uint64_t v5 = [v4 length];
  LODWORD(v6) = v5 != 0;
  if (!v5)
  {
    v123 = 0;
    goto LABEL_5;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
  v8 = [v124 string];
  int v6 = (void *)[v7 initWithString:v8];

  v123 = v6;
  if (v6)
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    uint64_t v9 = [v4 balloonSubjectFont];
    objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v9, 0, objc_msgSend(v6, "length"));

    LODWORD(v6) = 1;
LABEL_5:

    goto LABEL_7;
  }
  v123 = 0;
LABEL_7:
  uint64_t v165 = 0;
  v166 = &v165;
  uint64_t v167 = 0x2020000000;
  char v168 = 0;
  BOOL v10 = [(CKTextMessagePartChatItem *)self containsHyperlink];
  uint64_t v161 = 0;
  v162 = &v161;
  uint64_t v163 = 0x2020000000;
  char v164 = 0;
  v11 = [(CKTextMessagePartChatItem *)self text];
  v12 = [v11 string];
  int v119 = (int)v6;
  if ([v12 length])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
    v14 = [v11 string];
    v15 = (void *)[v13 initWithString:v14];
  }
  else
  {
    v15 = 0;
  }

  v120 = +[CKUIBehavior sharedBehaviors];
  switch([(CKTextMessagePartChatItem *)self bigEmojiStyle])
  {
    case 0:
      v121 = [(CKTextMessagePartChatItem *)self bodyTextFont];
      break;
    case 1:
      v121 = [v120 singleBigEmojiFont];
      break;
    case 2:
      v121 = [v120 multipleBigEmojiFont];
      break;
    case 3:
      v121 = [v120 singleBigAssetFont];
      break;
    default:
      v121 = 0;
      break;
  }
  v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isExpressiveTextEnabled];

  if (v17)
  {
    uint64_t v18 = [v15 length];
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v121, 0, v18);
  }
  if (v15)
  {
    uint64_t v19 = [v15 length];
    if (!v10)
    {
LABEL_49:
      v53 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      v54 = [MEMORY[0x1E4F6E6D0] sharedManager];
      char v55 = [v54 isFeatureEnabled];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2;
      aBlock[3] = &unk_1E5621100;
      id v56 = v53;
      id v146 = v56;
      v57 = _Block_copy(aBlock);
      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3;
      v141[3] = &unk_1E5625D70;
      v141[4] = self;
      char v144 = v55;
      id v58 = v15;
      id v142 = v58;
      id v143 = v121;
      objc_msgSend(v11, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v57, v141);
      if ([(CKTextMessagePartChatItem *)self allowsMentions])
      {
        uint64_t v59 = *MEMORY[0x1E4F6D538];
        v139[0] = MEMORY[0x1E4F143A8];
        v139[1] = 3221225472;
        v139[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_121;
        v139[3] = &unk_1E5624860;
        id v140 = v58;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v59, 0, v19, 0, v139);
      }
      v60 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v61 = [v60 isExpressiveTextEnabled];

      if (v61)
      {
        uint64_t v62 = *MEMORY[0x1E4F6E400];
        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2_122;
        v137[3] = &unk_1E5624860;
        id v63 = v58;
        id v138 = v63;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v62, 0, v19, 0, v137);
        uint64_t v64 = *MEMORY[0x1E4F6E410];
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_123;
        v135[3] = &unk_1E5624860;
        id v65 = v63;
        id v136 = v65;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v64, 0, v19, 0, v135);
        uint64_t v66 = *MEMORY[0x1E4F6E420];
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_4;
        v133[3] = &unk_1E5624860;
        id v67 = v65;
        id v134 = v67;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v66, 0, v19, 0, v133);
        uint64_t v68 = *MEMORY[0x1E4F6E3F8];
        v131[0] = MEMORY[0x1E4F143A8];
        v131[1] = 3221225472;
        v131[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_5;
        v131[3] = &unk_1E5624860;
        id v69 = v67;
        id v132 = v69;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v68, 0, v19, 0, v131);
        uint64_t v70 = *MEMORY[0x1E4F6E408];
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_6;
        v129[3] = &unk_1E5624860;
        id v130 = v69;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v70, 0, v19, 0, v129);

        v71 = v138;
      }
      else
      {
        v71 = +[CKUIBehavior sharedBehaviors];
        switch([(CKTextMessagePartChatItem *)self bigEmojiStyle])
        {
          case 0:
            uint64_t v72 = [(CKTextMessagePartChatItem *)self bodyTextFont];
            goto LABEL_59;
          case 1:
            uint64_t v72 = [v71 singleBigEmojiFont];
            goto LABEL_59;
          case 2:
            uint64_t v72 = [v71 multipleBigEmojiFont];
            goto LABEL_59;
          case 3:
            uint64_t v72 = [v71 singleBigAssetFont];
LABEL_59:
            v73 = (void *)v72;
            break;
          default:
            v73 = 0;
            break;
        }
        objc_msgSend(v58, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v73, 0, v19);
      }
      v74 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v75 = [v74 stewieEnabled];

      if (v75)
      {
        v76 = [(CKMessagePartChatItem *)self message];
        v77 = [v76 subject];
        int v78 = [v77 isStewie];

        if (v78)
        {
          uint64_t v79 = *MEMORY[0x1E4F6CAA0];
          v127[0] = MEMORY[0x1E4F143A8];
          v127[1] = 3221225472;
          v127[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_7;
          v127[3] = &unk_1E5624860;
          id v128 = v58;
          objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v79, 0, v19, 0, v127);
        }
      }

      goto LABEL_65;
    }
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke;
    v156[3] = &unk_1E5625D20;
    v159 = &v165;
    id v20 = v15;
    id v157 = v20;
    v158 = self;
    v160 = &v161;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", @"DDResultAttributeName", 0, v19, 0, v156);
    *(void *)v150 = 0;
    v151 = v150;
    uint64_t v152 = 0x3032000000;
    v153 = __Block_byref_object_copy__29;
    v154 = __Block_byref_object_dispose__29;
    id v155 = 0;
    id v155 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v21 = *MEMORY[0x1E4F6C228];
    v149[0] = MEMORY[0x1E4F143A8];
    v149[1] = 3221225472;
    v149[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_103;
    v149[3] = &unk_1E5625D48;
    v149[4] = &v165;
    v149[5] = v150;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v19, 0, v149);
    if (!*((unsigned char *)v166 + 24))
    {
LABEL_48:
      uint64_t v52 = *MEMORY[0x1E4F6C1D0];
      v147[0] = MEMORY[0x1E4F143A8];
      v147[1] = 3221225472;
      v147[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_110;
      v147[3] = &unk_1E5624860;
      id v148 = v20;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v52, 0, v19, 0, v147);

      _Block_object_dispose(v150, 8);
      goto LABEL_49;
    }
    v118 = [(CKMessagePartChatItem *)self message];
    v22 = [v118 sender];
    v117 = [v22 ID];

    uint64_t v23 = [(CKTextMessagePartChatItem *)self _time];
    uint64_t v24 = [v118 guid];
    v25 = (void *)v24;
    v116 = (void *)v23;
    if (v23 && v24 && *((void *)v151 + 5))
    {
      v26 = (void *)MEMORY[0x1E4F1CB10];
      v115 = (void *)v24;
      v27 = objc_msgSend(MEMORY[0x1E4F6E6F0], "referenceURLForMessageGUID:");
      v114 = [v26 URLWithString:v27];

      v113 = [MEMORY[0x1E4F6E6F0] metadataDictionaryForMessageID:v115 senderID:v117 date:v116];
      uint64_t v174 = 0;
      v175 = &v174;
      uint64_t v176 = 0x2020000000;
      v28 = (id *)getkDataDetectorsReferenceDateKeySymbolLoc_ptr;
      uint64_t v177 = getkDataDetectorsReferenceDateKeySymbolLoc_ptr;
      if (!getkDataDetectorsReferenceDateKeySymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v170 = 3221225472;
        v171 = __getkDataDetectorsReferenceDateKeySymbolLoc_block_invoke;
        v172 = &unk_1E5620B90;
        v173 = &v174;
        v29 = (void *)DataDetectorsUILibrary();
        v30 = dlsym(v29, "kDataDetectorsReferenceDateKey");
        *(void *)(v173[1] + 24) = v30;
        getkDataDetectorsReferenceDateKeySymbolLoc_ptr = *(void *)(v173[1] + 24);
        v28 = (id *)v175[3];
      }
      _Block_object_dispose(&v174, 8);
      if (v28)
      {
        id v111 = *v28;
        v178[0] = v111;
        v179[0] = v116;
        uint64_t v174 = 0;
        v175 = &v174;
        uint64_t v176 = 0x2020000000;
        v31 = (id *)getkDataDetectorsSpecialURLKeySymbolLoc_ptr;
        uint64_t v177 = getkDataDetectorsSpecialURLKeySymbolLoc_ptr;
        if (!getkDataDetectorsSpecialURLKeySymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v170 = 3221225472;
          v171 = __getkDataDetectorsSpecialURLKeySymbolLoc_block_invoke;
          v172 = &unk_1E5620B90;
          v173 = &v174;
          v32 = (void *)DataDetectorsUILibrary();
          v33 = dlsym(v32, "kDataDetectorsSpecialURLKey");
          *(void *)(v173[1] + 24) = v33;
          getkDataDetectorsSpecialURLKeySymbolLoc_ptr = *(void *)(v173[1] + 24);
          v31 = (id *)v175[3];
        }
        _Block_object_dispose(&v174, 8);
        if (v31)
        {
          id v110 = *v31;
          v178[1] = v110;
          v179[1] = v114;
          uint64_t v174 = 0;
          v175 = &v174;
          uint64_t v176 = 0x2020000000;
          v34 = (id *)getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr;
          uint64_t v177 = getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr;
          if (!getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            uint64_t v170 = 3221225472;
            v171 = __getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_block_invoke;
            v172 = &unk_1E5620B90;
            v173 = &v174;
            v35 = (void *)DataDetectorsUILibrary();
            v36 = dlsym(v35, "kDataDetectorsCoreSpotlightUniqueIdentifier");
            *(void *)(v173[1] + 24) = v36;
            getkDataDetectorsCoreSpotlightUniqueIdentifierSymbolLoc_ptr = *(void *)(v173[1] + 24);
            v34 = (id *)v175[3];
          }
          _Block_object_dispose(&v174, 8);
          if (v34)
          {
            id v109 = *v34;
            v178[2] = v109;
            v179[2] = v115;
            uint64_t v174 = 0;
            v175 = &v174;
            uint64_t v176 = 0x2020000000;
            v37 = (id *)getkDataDetectorsIncludeMoneySymbolLoc_ptr;
            uint64_t v177 = getkDataDetectorsIncludeMoneySymbolLoc_ptr;
            if (!getkDataDetectorsIncludeMoneySymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v170 = 3221225472;
              v171 = __getkDataDetectorsIncludeMoneySymbolLoc_block_invoke;
              v172 = &unk_1E5620B90;
              v173 = &v174;
              v38 = (void *)DataDetectorsUILibrary();
              v39 = dlsym(v38, "kDataDetectorsIncludeMoney");
              *(void *)(v173[1] + 24) = v39;
              getkDataDetectorsIncludeMoneySymbolLoc_ptr = *(void *)(v173[1] + 24);
              v37 = (id *)v175[3];
            }
            _Block_object_dispose(&v174, 8);
            if (v37)
            {
              id v40 = *v37;
              v178[3] = v40;
              v112 = [NSNumber numberWithBool:*((unsigned __int8 *)v162 + 24)];
              v179[3] = v112;
              uint64_t v174 = 0;
              v175 = &v174;
              uint64_t v176 = 0x2020000000;
              v41 = (id *)getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr;
              uint64_t v177 = getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr;
              if (!getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr)
              {
                *(void *)buf = MEMORY[0x1E4F143A8];
                uint64_t v170 = 3221225472;
                v171 = __getkDataDetectorsCustomActionRangesKeySymbolLoc_block_invoke;
                v172 = &unk_1E5620B90;
                v173 = &v174;
                v42 = (void *)DataDetectorsUILibrary();
                v43 = dlsym(v42, "kDataDetectorsCustomActionRangesKey");
                *(void *)(v173[1] + 24) = v43;
                getkDataDetectorsCustomActionRangesKeySymbolLoc_ptr = *(void *)(v173[1] + 24);
                v41 = (id *)v175[3];
              }
              _Block_object_dispose(&v174, 8);
              if (v41)
              {
                id v44 = *v41;
                v178[4] = v44;
                v45 = (void *)[*((id *)v151 + 5) copy];
                v108 = v40;
                v179[4] = v45;
                uint64_t v174 = 0;
                v175 = &v174;
                uint64_t v176 = 0x2020000000;
                v46 = (id *)getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr;
                uint64_t v177 = getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr;
                if (!getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  uint64_t v170 = 3221225472;
                  v171 = __getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_block_invoke;
                  v172 = &unk_1E5620B90;
                  v173 = &v174;
                  v47 = (void *)DataDetectorsUILibrary();
                  v48 = dlsym(v47, "kDataDetectorsCoreRecentsMetadataDictionaryKey");
                  *(void *)(v173[1] + 24) = v48;
                  getkDataDetectorsCoreRecentsMetadataDictionaryKeySymbolLoc_ptr = *(void *)(v173[1] + 24);
                  v46 = (id *)v175[3];
                }
                _Block_object_dispose(&v174, 8);
                if (v46)
                {
                  id v49 = *v46;
                  v178[5] = v49;
                  v179[5] = v113;
                  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:6];

                  objc_msgSend(v20, "dd_makeLinksForResultsInAttributesOfType:context:", -1, v50);
                  v25 = v115;
LABEL_47:

                  goto LABEL_48;
                }
                v106 = [MEMORY[0x1E4F28B00] currentHandler];
                v107 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsCoreRecentsMetadataDictionaryKey(void)"];
                objc_msgSend(v106, "handleFailureInFunction:file:lineNumber:description:", v107, @"CKTextMessagePartChatItem.m", 74, @"%s", dlerror());
              }
              else
              {
                v104 = [MEMORY[0x1E4F28B00] currentHandler];
                v105 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsCustomActionRangesKey(void)"];
                objc_msgSend(v104, "handleFailureInFunction:file:lineNumber:description:", v105, @"CKTextMessagePartChatItem.m", 72, @"%s", dlerror());
              }
            }
            else
            {
              v102 = [MEMORY[0x1E4F28B00] currentHandler];
              v103 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsIncludeMoney(void)"];
              objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, @"CKTextMessagePartChatItem.m", 70, @"%s", dlerror());
            }
          }
          else
          {
            v100 = [MEMORY[0x1E4F28B00] currentHandler];
            v101 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsCoreSpotlightUniqueIdentifier(void)"];
            objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, @"CKTextMessagePartChatItem.m", 68, @"%s", dlerror());
          }
        }
        else
        {
          v98 = [MEMORY[0x1E4F28B00] currentHandler];
          v99 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsSpecialURLKey(void)"];
          objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, @"CKTextMessagePartChatItem.m", 66, @"%s", dlerror());
        }
      }
      else
      {
        v96 = [MEMORY[0x1E4F28B00] currentHandler];
        v97 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsReferenceDateKey(void)"];
        objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, @"CKTextMessagePartChatItem.m", 64, @"%s", dlerror());
      }
      __break(1u);
    }
    if (IMOSLoggingEnabled())
    {
      v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v51, OS_LOG_TYPE_INFO, "Transcript cal data detectors failed to get time off IMMessage. Please file a bug on Messages.", buf, 2u);
      }
    }
    goto LABEL_47;
  }
LABEL_65:
  v80 = +[CKUIBehavior sharedBehaviors];
  int v81 = [v80 hyphenatesTextContent];

  if (v81)
  {
    v82 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v83 = (void *)[v82 mutableCopy];

    LODWORD(v84) = 1.0;
    [v83 setHyphenationFactor:v84];
    uint64_t v85 = [v15 length];
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v83, 0, v85);
  }
  char v86 = v119 ^ 1;
  if (!v15) {
    char v86 = 1;
  }
  if (v86)
  {
    v90 = v123;
    if (!v119) {
      v90 = v15;
    }
    id v87 = v90;
  }
  else
  {
    id v87 = v123;
    objc_msgSend(v87, "replaceCharactersInRange:withString:", objc_msgSend(v87, "length"), 0, @"\n");
    if (*((unsigned char *)v166 + 24))
    {
      v88 = objc_msgSend(v87, "dd_attributedStringByAppendingAttributedString:", v15);
      uint64_t v89 = [v88 mutableCopy];

      id v87 = (id)v89;
    }
    else
    {
      [v87 appendAttributedString:v15];
    }
  }
  if (v122)
  {
    uint64_t v91 = [v87 length];
    objc_msgSend(v87, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v122, 0, v91);
  }
  else if (IMOSLoggingEnabled())
  {
    v92 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v150 = 0;
      _os_log_impl(&dword_18EF18000, v92, OS_LOG_TYPE_INFO, "_attributedTextWithTextColor: textColor is nil.", v150, 2u);
    }
  }
  if ([(CKTextMessagePartChatItem *)self allowsMentions])
  {
    uint64_t v93 = [v87 length];
    uint64_t v94 = *MEMORY[0x1E4F6D538];
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_128;
    v125[3] = &unk_1E5625D98;
    v125[4] = self;
    id v126 = v87;
    objc_msgSend(v126, "enumerateAttribute:inRange:options:usingBlock:", v94, 0, v93, 0, v125);
  }
  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(&v165, 8);

  return v87;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v12 = v7;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"DDResultAttributeName", v7, a3, a4);
    char v8 = objc_opt_respondsToSelector();
    id v7 = v12;
    if (v8)
    {
      uint64_t v9 = [v12 type];
      int v10 = [v9 isEqualToString:@"Money"];

      id v7 = v12;
      if (v10)
      {
        int v11 = [*(id *)(a1 + 40) showMoneyResults];
        id v7 = v12;
        if (v11) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_103(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_110(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0720], a2, a3, a4);
  }
  return result;
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  char v8 = [v7 guid];
  uint64_t v9 = [*(id *)(a1 + 32) adaptiveImageGlyphForTransferGUID:v8];
  int v10 = (void *)v9;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v11 = [v7 commSafetySensitive];
    if (v10) {
      BOOL v12 = v11 == 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      goto LABEL_10;
    }
    if (v11 == 1) {
      goto LABEL_12;
    }
  }
  else if (v9)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06B0], v10, a3, a4);
    goto LABEL_18;
  }
  if ([MEMORY[0x1E4F6E780] genmojiFileTransferShouldDisplayAsPermanentlyFailed:v7])
  {
LABEL_12:
    id v13 = [*(id *)(a1 + 40) attributesAtIndex:a3 effectiveRange:0];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\uFFFD" attributes:v13];
    objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", a3, a4, v14);
    v15 = objc_msgSend(*(id *)(a1 + 48), "ck_lastResortFont");
    if (v15) {
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v15, a3, a4);
    }

    goto LABEL_18;
  }
  v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_cold_1(v16);
  }

LABEL_18:
}

uint64_t __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_121(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E4F6D538], a2, a3, a4);
  }
  return result;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_2_122(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 32), "ck_applyTextEffectType:range:", objc_msgSend(v7, "integerValue"), a3, a4);
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_123(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    int v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 8, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    int v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 4, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    int v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    int v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 2, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    id v9 = +[CKUIBehavior sharedBehaviors];
    char v8 = [v9 balloonSubjectFont];
    objc_msgSend(v6, "addAttribute:value:range:", v7, v8, a3, a4);
  }
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_128(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v14 = v7;
    if (([*(id *)(a1 + 32) isFromMe] & 1) == 0
      && [*(id *)(a1 + 32) mentionsMe:v14])
    {
      uint64_t v8 = *MEMORY[0x1E4FB0700];
      id v9 = *(void **)(a1 + 40);
      int v10 = [*(id *)(a1 + 32) meMentionsTextColor];
      objc_msgSend(v9, "addAttribute:value:range:", v8, v10, a3, a4);
    }
    uint64_t v11 = +[CKUIBehavior sharedBehaviors];
    BOOL v12 = [*(id *)(a1 + 32) bodyTextFont];
    id v13 = [v11 mentionTranscriptFontFromOrignalFont:v12];

    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v13, a3, a4);
    id v7 = v14;
  }
}

- (NSOrderedSet)transferGUIDsInMessagePartText
{
  v2 = [(CKTextMessagePartChatItem *)self text];
  id v3 = v2;
  if (v2) {
    objc_msgSend(v2, "__im_transferGUIDsInAttributedString");
  }
  else {
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }

  return (NSOrderedSet *)v4;
}

- (id)mediaObjectForTransferGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKChatItem *)self IMChatItem];
  int v6 = [v5 chatContext];
  id v7 = [v5 message];
  uint64_t v8 = +[CKMediaObjectManager sharedInstance];
  id v9 = [v8 mediaObjectWithTransferGUID:v4 imMessage:v7 chatContext:v6];
  if (v9)
  {
    int v10 = [v5 time];
    if (v10) {
      [v9 setTime:v10];
    }
    id v11 = v9;
  }
  else
  {
    int v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKTextMessagePartChatItem mediaObjectForTransferGUID:]((uint64_t)v4, v10);
    }
  }

  return v9;
}

- (id)mediaObjectsInMessagePartText
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKTextMessagePartChatItem *)self transferGUIDsInMessagePartText];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v12 = -[CKTextMessagePartChatItem mediaObjectForTransferGUID:](self, "mediaObjectForTransferGUID:", v11, v16, (void)v17);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          id v13 = IMLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v11;
            _os_log_error_impl(&dword_18EF18000, v13, OS_LOG_TYPE_ERROR, "No media object for transfer guid %@ found in message part text", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = (void *)[v4 copy];

  return v14;
}

- (NSArray)emojiImageMediaObjectsInMessagePartText
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(CKTextMessagePartChatItem *)self mediaObjectsInMessagePartText];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", v9, (void)v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  int v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKTextMessagePartChatItem *)self mediaObjectForTransferGUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 adaptiveImageGlyph];
  }
  else
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMessageEditingView adaptiveImageGlyphForTransferGUID:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)mentionsMe:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BBD8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  char v6 = [v5 metionedHandleMatchesMeCard:v4];

  return v6;
}

- (BOOL)allowsMentions
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isPriusEnabled];

  if (!v4)
  {
    uint64_t v5 = [(CKMessagePartChatItem *)self message];
    uint64_t v7 = objc_msgSend(v5, "__ck_service");
    if (objc_msgSend(v7, "__ck_isSMS"))
    {
      char v6 = 0;
    }
    else
    {
      uint64_t v8 = [(CKChatItem *)self IMChatItem];
      if ([v8 isBusiness])
      {
        char v6 = 0;
      }
      else
      {
        uint64_t v9 = +[CKUIBehavior sharedBehaviors];
        char v6 = [v9 platformSupportsMentioning];
      }
    }
    goto LABEL_11;
  }
  uint64_t v5 = [(CKChatItem *)self IMChatItem];
  if (([v5 isBusiness] & 1) == 0)
  {
    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v7 platformSupportsMentioning];
LABEL_11:

    goto LABEL_12;
  }
  char v6 = 0;
LABEL_12:

  return v6;
}

- (id)bodyTextFont
{
  v2 = +[CKUIBehavior sharedBehaviors];
  id v3 = [v2 balloonTextFont];

  return v3;
}

- (id)meMentionsTextColor
{
  v2 = +[CKUIBehavior sharedBehaviors];
  id v3 = [v2 theme];
  int v4 = [v3 meMentionTextColor];

  return v4;
}

- (BOOL)isShowingEditHistory
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 isShowingEditHistory];

  return v3;
}

- (id)time
{
  if ([(CKTextMessagePartChatItem *)self isShowingEditHistory])
  {
    char v3 = [(CKChatItem *)self IMChatItem];
    int v4 = [v3 lastEditDateForMessagePart];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTextMessagePartChatItem;
    int v4 = [(CKMessagePartChatItem *)&v6 time];
  }

  return v4;
}

- (UIEdgeInsets)stickerReactionInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonMaskAlignmentRectInsetsWithTailShape:0];
  double v4 = v3;
  double v6 = v5;

  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  [v7 stickerReactionTextBalloonAdditionalVerticalPadding];
  double v9 = v8;

  double v10 = -(v4 + v9);
  double v11 = -(v6 + v9);
  double v12 = 0.0;
  double v13 = 0.0;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (BOOL)shouldUseBigEmojiStyleBalloonViewClass
{
  return (unint64_t)([(CKTextMessagePartChatItem *)self bigEmojiStyle] - 1) < 3;
}

- (Class)balloonViewClass
{
  if (![(CKMessagePartChatItem *)self isCorrupt]
    && ![(CKTextMessagePartChatItem *)self shouldUseBigEmojiStyleBalloonViewClass])
  {
    [(CKTextMessagePartChatItem *)self containsHyperlink];
  }
  double v3 = objc_opt_class();

  return (Class)v3;
}

- (Class)impactBalloonViewClass
{
  if ([(CKTextMessagePartChatItem *)self shouldUseBigEmojiStyleBalloonViewClass]|| [(CKTextMessagePartChatItem *)self containsHyperlink])
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTextMessagePartChatItem;
    double v3 = [(CKBalloonChatItem *)&v5 impactBalloonViewClass];
  }
  else
  {
    double v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (id)dragItemProvider
{
  dragItemProvider = self->_dragItemProvider;
  if (!dragItemProvider)
  {
    double v4 = [(CKChatItem *)self transcriptText];
    objc_super v5 = v4;
    if (v4)
    {
      double v6 = objc_msgSend(v4, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      uint64_t v7 = [v6 length];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__CKTextMessagePartChatItem_dragItemProvider__block_invoke;
      v15[3] = &unk_1E5625DC0;
      v15[4] = &v16;
      -[NSObject enumerateAttributesInRange:options:usingBlock:](v6, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v15);
      if (*((unsigned char *)v17 + 24))
      {
        double v8 = off_1E561D350;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          double v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v14 = 0;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Based on the content of the message, we do not need to serialize the copied item as an attributed string. Using plain string serialization only.", v14, 2u);
          }
        }
        double v8 = off_1E561DF00;
      }
      double v10 = (void *)[objc_alloc(*v8) initWithAttributedString:v6];
      double v11 = (NSItemProvider *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v10];
      double v12 = self->_dragItemProvider;
      self->_dragItemProvider = v11;

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      double v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKTextMessagePartChatItem dragItemProvider](v6);
      }
    }

    dragItemProvider = self->_dragItemProvider;
  }

  return dragItemProvider;
}

uint64_t __45__CKTextMessagePartChatItem_dragItemProvider__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [(CKChatItem *)self transcriptText];
  double v9 = objc_msgSend(v8, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");
  if (length)
  {
    uint64_t v10 = objc_msgSend(v8, "attributedSubstringFromRange:", location, length);

    double v9 = (void *)v10;
  }
  if (v7)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v12 = NSString;
    double v13 = [v9 string];
    long long v14 = [v12 stringWithValidatedFormat:v7, @"%@", 0, v13 validFormatSpecifiers error];
    id v15 = (id)[v11 initWithString:v14];
  }
  else
  {
    id v15 = v9;
  }
  v18[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v16;
}

- (id)_time
{
  double v3 = [(CKChatItem *)self notification];

  if (v3)
  {
    double v4 = [(CKChatItem *)self notification];
    uint64_t v5 = [v4 date];
LABEL_3:
    double v6 = (void *)v5;

    goto LABEL_5;
  }
  id v7 = [(CKMessagePartChatItem *)self message];
  double v6 = [v7 time];

  if (!v6)
  {
    double v4 = [(CKChatItem *)self IMChatItem];
    uint64_t v5 = [v4 time];
    goto LABEL_3;
  }
LABEL_5:

  return v6;
}

- (NSAttributedString)text
{
  double v3 = [(CKChatItem *)self notification];
  double v4 = [v3 request];
  uint64_t v5 = [v4 content];
  double v6 = [v5 body];

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  }
  else
  {
    double v8 = [(CKChatItem *)self IMChatItem];
    id v7 = [v8 text];
  }

  return (NSAttributedString *)v7;
}

- (NSAttributedString)fallbackCorruptText
{
  v2 = [(CKChatItem *)self IMChatItem];
  double v3 = [v2 fallbackCorruptText];

  return (NSAttributedString *)v3;
}

- (NSAttributedString)subject
{
  double v3 = [(CKChatItem *)self notification];
  if (v3)
  {
    double v4 = 0;
  }
  else
  {
    uint64_t v5 = [(CKChatItem *)self IMChatItem];
    double v4 = [v5 subject];
  }

  return (NSAttributedString *)v4;
}

- (BOOL)containsHyperlink
{
  double v3 = [(CKChatItem *)self notification];

  if (v3) {
    return 0;
  }
  uint64_t v5 = [(CKChatItem *)self IMChatItem];
  if ([v5 shouldDisplayRichLink])
  {
    double v6 = [(CKMessagePartChatItem *)self message];
    if ([v6 hasDataDetectorResults])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v7 = [(CKMessagePartChatItem *)self message];
      if ([v7 hasMention]) {
        BOOL v4 = [(CKTextMessagePartChatItem *)self allowsMentions];
      }
      else {
        BOOL v4 = 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)containsExcessiveLineHeightCharacters
{
  v2 = [(CKTextMessagePartChatItem *)self text];
  double v3 = [v2 string];

  if ([v3 length])
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    BOOL v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", objc_msgSend(v4, "systemUIFontExcessiveLineHeightCharacterSet")) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)bigEmojiStyle
{
  if (!self->_hasCachedBigEmojiStyle)
  {
    double v3 = [(CKTextMessagePartChatItem *)self subject];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      self->_bigEmojiStyle = 0;
    }
    else
    {
      BOOL v5 = [(CKTextMessagePartChatItem *)self text];
      self->_bigEmojiStyle = objc_msgSend(v5, "__ck_bigEmojiStyle");
    }
    self->_hasCachedBigEmojiStyle = 1;
  }
  return self->_bigEmojiStyle;
}

- (BOOL)_textContainsIMTextEffect
{
  v2 = [(CKTextMessagePartChatItem *)self text];
  char v3 = objc_msgSend(v2, "ck_containsIMTextEffect");

  return v3;
}

- (void).cxx_destruct
{
}

- (double)ageForTextEffectCoordination
{
  v2 = [(CKChatItem *)self IMChatItem];
  [v2 ageForTextEffectCoordination];
  double v4 = v3;

  return v4;
}

- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:(double)a3
{
  double v4 = [(CKChatItem *)self IMChatItem];
  char v5 = [v4 isRecentForTextEffectCoordinationWithinTimeInterval:a3];

  return v5;
}

- (id)compositionWithContext:(id)a3
{
  double v4 = [(CKTextMessagePartChatItem *)self text];
  char v5 = objc_msgSend(v4, "ck_attributedStringByRemovingUnsupportedCompositionAttributes");

  double v6 = [(CKTextMessagePartChatItem *)self subject];
  id v7 = [v6 string];
  if ([v7 length])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v9 = [(CKTextMessagePartChatItem *)self subject];
    uint64_t v10 = [v9 string];
    id v11 = (void *)[v8 initWithString:v10];
  }
  else
  {
    id v11 = 0;
  }

  double v12 = [[CKComposition alloc] initWithText:v5 subject:v11];

  return v12;
}

void __58__CKTextMessagePartChatItem__attributedTextWithTextColor___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18EF18000, log, OS_LOG_TYPE_DEBUG, "Do not have NSAdaptiveImageGlyph for transfer (possibly pending download or oop generation). Will display as blank space.", v1, 2u);
}

- (void)mediaObjectForTransferGUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not find media object for transfer guid: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dragItemProvider
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Attempting to construct item provider for message with nil transcriptText", v1, 2u);
}

@end