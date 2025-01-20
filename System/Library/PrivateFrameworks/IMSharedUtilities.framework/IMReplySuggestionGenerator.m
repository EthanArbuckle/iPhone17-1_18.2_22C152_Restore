@interface IMReplySuggestionGenerator
+ (id)combinedPlainTextOfMessageItem:(id)a3;
+ (id)recentIncomingMessagesWithTextContentForReplySuggestions:(id)a3;
+ (id)recentOugoingMessagesWithTextContentForReplySuggestions:(id)a3;
+ (id)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7;
+ (id)textMessageItemsFilteredByIsOutgoing:(id)a3 isOutgoingContent:(BOOL)a4;
+ (int64_t)_tintColorForMetadata:(id)a3;
+ (void)_annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 completion:(id)a9;
+ (void)_contextualRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 includeDynamicSuggestions:(BOOL)a9 completion:(id)a10;
+ (void)_repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 fetchUsingContactsFramework:(BOOL)a9 completion:(id)a10;
+ (void)annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8;
+ (void)primeResponseKitIfNeeded;
+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8;
+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 fetchUsingContactsFramework:(BOOL)a8 completion:(id)a9;
@end

@implementation IMReplySuggestionGenerator

+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8
{
  LOBYTE(v8) = 1;
  [a1 _repliesForMessages:a3 senderMessages:a4 recipientHandles:a5 languageCode:a6 languageCodeChangeDate:a7 loadAsync:1 fetchUsingContactsFramework:v8 completion:a8];
}

+ (void)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 fetchUsingContactsFramework:(BOOL)a8 completion:(id)a9
{
  LOBYTE(v9) = a8;
  [a1 _repliesForMessages:a3 senderMessages:a4 recipientHandles:a5 languageCode:a6 languageCodeChangeDate:a7 loadAsync:1 fetchUsingContactsFramework:v9 completion:a9];
}

+ (void)annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 completion:(id)a8
{
}

+ (id)repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1A077784C;
  v25 = sub_1A0777714;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1A07FC8BC;
  v20[3] = &unk_1E5A12290;
  v20[4] = &v21;
  LOBYTE(v19) = 1;
  [a1 _repliesForMessages:v12 senderMessages:v13 recipientHandles:v14 languageCode:v15 languageCodeChangeDate:v16 loadAsync:0 fetchUsingContactsFramework:v19 completion:v20];
  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

+ (void)_annotatedRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 completion:(id)a9
{
  BOOL v34 = a8;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v36 = a4;
  id v13 = a5;
  id v14 = a6;
  id v33 = a7;
  id v15 = a9;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v35 = v13;
  v18 = sub_1A07FCB80(v13, v14, 1);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v24 = [[IMReplySuggestion alloc] initWithType:1 text:v23];
        [(IMReplySuggestion *)v24 setStringRepresentation:v23];
        v25 = [v23 localizedLowercaseString];
        [v17 addObject:v25];

        [v16 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v20);
  }
  id v26 = objc_opt_class();
  char v27 = sub_1A07FC630();
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1A07FCF94;
  v38[3] = &unk_1E5A122B8;
  id v39 = v17;
  id v40 = v16;
  id v41 = v15;
  id v42 = a1;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  LOBYTE(v31) = v27;
  [v26 _contextualRepliesForMessages:v37 senderMessages:v36 recipientHandles:v35 languageCode:v14 languageCodeChangeDate:v33 loadAsync:v34 includeDynamicSuggestions:v31 completion:v38];
}

+ (void)_repliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 fetchUsingContactsFramework:(BOOL)a9 completion:(id)a10
{
  BOOL v30 = a8;
  id v15 = a10;
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  id v29 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [v16 array];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v23 = sub_1A07FCB80(v18, v17, a9);
  sub_1A07FD5AC(v21, v22, v23);

  v24 = objc_opt_class();
  LOBYTE(a7) = sub_1A07FC630();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1A07FD700;
  v31[3] = &unk_1E5A122E0;
  id v32 = v21;
  id v33 = v22;
  id v34 = v15;
  id v25 = v15;
  id v26 = v22;
  id v27 = v21;
  LOBYTE(v28) = (_BYTE)a7;
  [v24 _contextualRepliesForMessages:v20 senderMessages:v19 recipientHandles:v18 languageCode:v17 languageCodeChangeDate:v29 loadAsync:v30 includeDynamicSuggestions:v28 completion:v31];
}

+ (void)_contextualRepliesForMessages:(id)a3 senderMessages:(id)a4 recipientHandles:(id)a5 languageCode:(id)a6 languageCodeChangeDate:(id)a7 loadAsync:(BOOL)a8 includeDynamicSuggestions:(BOOL)a9 completion:(id)a10
{
  BOOL v10 = a8;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v54 = a5;
  id v17 = a6;
  id v58 = a7;
  id v57 = a10;
  v61 = v17;
  if (![v17 length])
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }

    v61 = 0;
  }
  id v18 = objc_msgSend(v15, "firstObject", v54);
  id v19 = [v18 time];

  id v20 = [v16 firstObject];
  v60 = [v20 time];

  id v56 = v19;
  id v59 = v56;
  if ([v56 compare:v60] == -1)
  {
    id v59 = v60;
  }
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v15;
  uint64_t v21 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v25 = objc_alloc_init((Class)sub_1A07FDEE4());
        id v26 = +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:v24];
        [v25 setTitle:v26];

        unint64_t v27 = [v24 associatedMessageType] & 0xFFFFFFFFFFFFFFF8;
        BOOL v29 = v27 == 3000 || v27 == 2000;
        [v25 setTapBack:v29];
        objc_msgSend(v25, "setRead:", objc_msgSend(v24, "isRead"));
        objc_msgSend(v25, "setEmote:", objc_msgSend(v24, "isEmote"));
        BOOL v30 = [v24 sender];
        uint64_t v31 = (void *)[v30 copy];
        [v25 setSenderIdentifier:v31];

        id v32 = [v24 time];
        [v25 setDateSent:v32];

        [v64 addObject:v25];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v21);
  }

  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v62 = v16;
  uint64_t v34 = [v62 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v68 != v35) {
          objc_enumerationMutation(v62);
        }
        id v37 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        id v38 = objc_alloc_init((Class)sub_1A07FDEE4());
        id v39 = +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:v37];
        [v38 setTitle:v39];

        unint64_t v40 = [v37 associatedMessageType] & 0xFFFFFFFFFFFFFFF8;
        BOOL v42 = v40 == 3000 || v40 == 2000;
        [v38 setTapBack:v42];
        objc_msgSend(v38, "setRead:", objc_msgSend(v37, "isRead"));
        objc_msgSend(v38, "setEmote:", objc_msgSend(v37, "isEmote"));
        long long v43 = [v37 sender];
        long long v44 = (void *)[v43 copy];
        [v38 setSenderIdentifier:v44];

        long long v45 = [v37 time];
        [v38 setDateSent:v45];

        [v33 addObject:v38];
      }
      uint64_t v34 = [v62 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v34);
  }

  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2050000000;
  long long v46 = (void *)qword_1E94FF600;
  uint64_t v79 = qword_1E94FF600;
  if (!qword_1E94FF600)
  {
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = sub_1A07FEC58;
    v75[3] = &unk_1E5A10130;
    v75[4] = &v76;
    sub_1A07FEC58((uint64_t)v75);
    long long v46 = (void *)v77[3];
  }
  v47 = v46;
  _Block_object_dispose(&v76, 8);
  uint64_t v48 = (void *)[[v47 alloc] initWithType:0 receivedMessages:v64];
  [v48 setSenderMessages:v33];
  [v48 setLanguageCode:v61];
  [v48 setIncludesDynamicSuggestions:a9];
  [v48 setRequestDate:v59];
  [v48 setLanguageLastChangedDate:v58];
  v49 = [sub_1A07FDFC8() sharedManager];
  v50 = v49;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A07FE0AC;
    aBlock[3] = &unk_1E5A12308;
    id v66 = v57;
    v51 = _Block_copy(aBlock);
    [v50 suggestionsForRequest:v48 withCompletion:v51];

    v52 = v66;
  }
  else
  {
    v53 = [v49 suggestionsForRequest:v48];
    v52 = [v53 suggestions];

    (*((void (**)(id, void *))v57 + 2))(v57, v52);
  }
}

+ (int64_t)_tintColorForMetadata:(id)a3
{
  id v3 = a3;
  int64_t v4 = 0;
  switch([v3 attributionSource])
  {
    case 1:
      break;
    case 3:
      v5 = [v3 url];
      if (v5) {
        int64_t v4 = 3;
      }
      else {
        int64_t v4 = 4;
      }

      break;
    case 4:
      int64_t v4 = 1;
      break;
    case 5:
      int64_t v4 = 2;
      break;
    default:
      int64_t v4 = 4;
      break;
  }

  return v4;
}

+ (void)primeResponseKitIfNeeded
{
  if (qword_1E94FF5C0 != -1) {
    dispatch_once(&qword_1E94FF5C0, &unk_1EF2BF560);
  }
}

+ (id)combinedPlainTextOfMessageItem:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 balloonBundleID];
  uint64_t v5 = [v4 length];

  v6 = &stru_1EF2CAD28;
  if (!v5)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_1A077784C;
    id v14 = sub_1A0777714;
    id v15 = &stru_1EF2CAD28;
    v7 = [v3 body];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1A07FE3C0;
    v9[3] = &unk_1E5A12330;
    v9[4] = &v10;
    objc_msgSend(v7, "__im_visitMessageParts:", v9);

    v6 = [(id)v11[5] trimmedString];
    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

+ (id)textMessageItemsFilteredByIsOutgoing:(id)a3 isOutgoingContent:(BOOL)a4
{
  int v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [v5 reverseObjectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v23;
  id v20 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;
      id v15 = v14;
      if (!v14 || ([v14 isLastMessageCandidate] & 1) == 0) {
        goto LABEL_19;
      }
      id v16 = +[IMReplySuggestionGenerator combinedPlainTextOfMessageItem:v15];
      if ([v15 isFromMe] != v4
        || ([v15 isTypingMessage] & 1) != 0
        || ![v16 length])
      {

LABEL_19:
        if (v9) {
          goto LABEL_24;
        }
        continue;
      }
      id v17 = [v15 time];
      if (!v9)
      {
        uint64_t v9 = [v15 time];
      }
      objc_msgSend(v9, "timeIntervalSinceDate:", v17, v20);
      if (v18 > 120.0)
      {

        id v5 = v20;
        goto LABEL_24;
      }
      [v21 insertObject:v15 atIndex:0];

      id v5 = v20;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_24:

  return v21;
}

+ (id)recentIncomingMessagesWithTextContentForReplySuggestions:(id)a3
{
  return (id)MEMORY[0x1F4181798](IMReplySuggestionGenerator, sel_textMessageItemsFilteredByIsOutgoing_isOutgoingContent_);
}

+ (id)recentOugoingMessagesWithTextContentForReplySuggestions:(id)a3
{
  return (id)MEMORY[0x1F4181798](IMReplySuggestionGenerator, sel_textMessageItemsFilteredByIsOutgoing_isOutgoingContent_);
}

@end