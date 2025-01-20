@interface EARSpeechRecognition
@end

@implementation EARSpeechRecognition

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_2;
  v7[3] = &unk_1E5FFE2D8;
  char v11 = *(unsigned char *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v10 = a3;
  id v8 = v6;
  v9 = &v12;
  [v5 enumerateObjectsUsingBlock:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v13[5]];

  _Block_object_dispose(&v12, 8);
}

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_3;
  uint64_t v10 = &unk_1E5FFE2B0;
  char v16 = *(unsigned char *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v14 = &v17;
  uint64_t v11 = v4;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 56);
  id v12 = v5;
  uint64_t v15 = v6;
  id v13 = *(id *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:&v7];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", v18[5], v7, v8, v9, v10, v11);

  _Block_object_dispose(&v17, 8);
}

void __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 72))
  {
    if (([v5 appendedAutoPunctuation] & 1) == 0
      && ([v6 prependedAutoPunctuation] & 1) == 0)
    {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9 != [*(id *)(a1 + 48) count] - 1)
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
      id v13 = (void *)[v8 copy];
      [v12 addObject:v13];

      goto LABEL_12;
    }
    if (![*(id *)(*(void *)(a1 + 32) + 32) count]
      || ([v6 appendedAutoPunctuation] & 1) == 0
      && ![v6 prependedAutoPunctuation]
      || (uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32),
          [v6 tokenName],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v10) = [v10 containsObject:v11],
          v11,
          (v10 & 1) != 0))
    {
LABEL_4:
      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v8 = [*(id *)(a1 + 32) adjustSpaceForTokens:*(void *)(a1 + 40) currTokenIndex:a3 endsOfSentencePunctuations:*(void *)(*(void *)(a1 + 32) + 32) isPotentialCommandRecognition:*(unsigned __int8 *)(a1 + 72)];
      [v7 addObject:v8];
LABEL_12:

      goto LABEL_13;
    }
    if (quasar::gLogLevel >= 5)
    {
      memset(v19, 0, sizeof(v19));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v19);
      uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"Deleting punctuation: ", 22);
      id v15 = [v6 tokenName];
      char v16 = (const char *)[v15 UTF8String];
      size_t v17 = strlen(v16);
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v16, v17);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" from potentialPrecedingRecognition", 35);

      quasar::QuasarDebugMessage::~QuasarDebugMessage((quasar::QuasarDebugMessage *)v19);
    }
  }
LABEL_13:
}

@end