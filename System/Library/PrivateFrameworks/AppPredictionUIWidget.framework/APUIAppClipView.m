@interface APUIAppClipView
- (void)layoutSuggestion:(id)a3;
- (void)openPredictionAction;
@end

@implementation APUIAppClipView

- (void)layoutSuggestion:(id)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(APUISuggestionView *)self setSuggestion:v4];
    [(APUISuggestionView *)self createViewsIfNeeded];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapRecognized_];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    [(UITapGestureRecognizer *)self->_tapRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_tapRecognizer setNumberOfTouchesRequired:1];
    [(APUIAppClipView *)self addGestureRecognizer:self->_tapRecognizer];
    v7 = [(APUISuggestionView *)self titleLabel];
    v8 = [v4 uiSpecification];
    v9 = [v8 title];
    [v7 setText:v9];

    v10 = (void *)MEMORY[0x263F08928];
    v11 = [v4 executableSpecification];
    v12 = [v11 executableClassString];
    Class v13 = NSClassFromString(v12);
    v14 = [v4 executableSpecification];
    v15 = [v14 executable];
    id v50 = 0;
    v16 = [v10 unarchivedObjectOfClass:v13 fromData:v15 error:&v50];
    v17 = v50;

    if (v16 || !v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        p_prediction = &self->_prediction;
        objc_storeStrong((id *)&self->_prediction, v16);
        v20 = [(ATXHeroData *)self->_prediction clipMetadata];
        v21 = [v20 fullAppCachedIconFilePath];
        v22 = [v21 copy];

        if (v22)
        {
          v23 = dispatch_get_global_queue(25, 0);
          uint64_t v44 = MEMORY[0x263EF8330];
          uint64_t v45 = 3221225472;
          v46 = __36__APUIAppClipView_layoutSuggestion___block_invoke;
          v47 = &unk_264764798;
          v48 = v22;
          v49 = self;
          dispatch_async(v23, &v44);
        }
        v24 = [(APUISuggestionView *)self titleLabel];
        v25 = [(ATXHeroData *)*p_prediction clipMetadata];
        v26 = [v25 localizedTitleForClipSuggestion];
        [v24 setText:v26];

        v27 = [(APUISuggestionView *)self subtitleLabel];
        v28 = [(ATXHeroData *)*p_prediction clipMetadata];
        v29 = [v28 localizedSubtitleForClipSuggestion];
        [v27 setText:v29];
      }
      else
      {
        v22 = __atxlog_handle_ui();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[APUIAppClipView layoutSuggestion:]((uint64_t)v16, v22);
        }
      }

      v30 = (void *)MEMORY[0x263F1C370];
      v31 = (void *)MEMORY[0x263F1C6B0];
      v32 = [MEMORY[0x263F1C6C8] configurationWithScale:1];
      v33 = [v31 systemImageNamed:@"location.fill" withConfiguration:v32];
      v18 = [v30 textAttachmentWithImage:v33];

      v34 = objc_opt_new();
      id v35 = objc_alloc(MEMORY[0x263F086A0]);
      v36 = [v4 uiSpecification];
      v37 = [v36 reason];
      v38 = (void *)[v35 initWithString:v37];
      [v34 appendAttributedString:v38];

      id v39 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v51 = *MEMORY[0x263F1C248];
      v52[0] = &unk_26D935DF0;
      v40 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v41 = (void *)[v39 initWithString:@"​" attributes:v40];
      [v34 appendAttributedString:v41];

      v42 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v18];
      [v34 appendAttributedString:v42];

      v43 = [(APUISuggestionView *)self reasonLabel];
      [v43 setAttributedText:v34];

      [(APUISuggestionView *)self installReasonLabelIfNecessary];
    }
    else
    {
      v18 = __atxlog_handle_ui();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[APUIAppClipView layoutSuggestion:]();
      }
    }
  }
  else
  {
    v17 = __atxlog_handle_ui();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[APUIAppClipView layoutSuggestion:](v17);
    }
  }
}

void __36__APUIAppClipView_layoutSuggestion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:*(void *)(a1 + 32)];
  v3 = v2;
  if (v2)
  {
    id v4 = +[APUIAppIconDataSource _appClipIconTreatmentForCGImage:](APUIAppIconDataSource, "_appClipIconTreatmentForCGImage:", [v2 CGImage]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__APUIAppClipView_layoutSuggestion___block_invoke_2;
    v6[3] = &unk_264764798;
    v6[4] = *(void *)(a1 + 40);
    id v7 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __36__APUIAppClipView_layoutSuggestion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appImageView];
  [v2 setImage:*(void *)(a1 + 40)];
}

- (void)openPredictionAction
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = 5517;
  _os_log_error_impl(&dword_225AE0000, log, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: tried to tap a suggestion before the last execution ended", (uint8_t *)&v1, 0xCu);
}

void __39__APUIAppClipView_openPredictionAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 view:*(void *)(a1 + 32) didTapSuggestion:*(void *)(a1 + 40)];
}

void __39__APUIAppClipView_openPredictionAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = __atxlog_handle_ui();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__APUIAppClipView_openPredictionAction__block_invoke_2_cold_1();
    }

    v6 = v12;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    id v7 = __39__APUIAppClipView_openPredictionAction__block_invoke_27;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 48) clipMetadata];
      v9 = [v8 clipURL];
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_225AE0000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: Opened app clip request for url: %@", buf, 0xCu);
    }
    v6 = v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v7 = __39__APUIAppClipView_openPredictionAction__block_invoke_28;
  }
  v6[2] = v7;
  v6[3] = &unk_264764798;
  v10 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = v10;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __39__APUIAppClipView_openPredictionAction__block_invoke_27(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 view:*(void *)(a1 + 32) didFailExecutingSuggestion:*(void *)(a1 + 40)];
}

void __39__APUIAppClipView_openPredictionAction__block_invoke_28(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 view:*(void *)(a1 + 32) didFinishExecutingSuggestion:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

- (void)layoutSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_225AE0000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: clip suggestion is nil", v1, 2u);
}

- (void)layoutSuggestion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_225AE0000, v0, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: error unarchiving data for clip suggestion: %@", v1, 0x16u);
}

- (void)layoutSuggestion:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  id v4 = v3;
  _os_log_error_impl(&dword_225AE0000, a2, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: error class ATXHeroData expected. Class read: %@", v5, 0x16u);
}

void __39__APUIAppClipView_openPredictionAction__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_225AE0000, v0, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: Error while opening app clip: %@", v1, 0x16u);
}

@end