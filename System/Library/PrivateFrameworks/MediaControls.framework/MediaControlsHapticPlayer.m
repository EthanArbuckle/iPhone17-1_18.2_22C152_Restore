@interface MediaControlsHapticPlayer
- (CHHapticEngine)engine;
- (CHHapticPatternPlayer)expandedButtonChangedPlayer;
- (void)checkError:(id)a3;
- (void)dealloc;
- (void)expandedButtonChanged;
- (void)prepare;
- (void)setEngine:(id)a3;
- (void)setExpandedButtonChangedPlayer:(id)a3;
- (void)setupExpandedButtonChanged;
- (void)tearDown;
@end

@implementation MediaControlsHapticPlayer

- (void)prepare
{
  id v8 = 0;
  v3 = (CHHapticEngine *)[objc_alloc(MEMORY[0x1E4F1DF60]) initAndReturnError:&v8];
  id v4 = v8;
  engine = self->_engine;
  self->_engine = v3;

  [(MediaControlsHapticPlayer *)self checkError:v4];
  [(MediaControlsHapticPlayer *)self setupExpandedButtonChanged];
  v6 = self->_engine;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MediaControlsHapticPlayer_prepare__block_invoke;
  v7[3] = &unk_1E5F0DB80;
  v7[4] = self;
  [(CHHapticEngine *)v6 prewarmWithCompletionHandler:v7];
}

uint64_t __36__MediaControlsHapticPlayer_prepare__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) checkError:a2];
}

- (void)tearDown
{
  [(CHHapticEngine *)self->_engine stopPrewarm];
  engine = self->_engine;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MediaControlsHapticPlayer_tearDown__block_invoke;
  v4[3] = &unk_1E5F0DB80;
  v4[4] = self;
  [(CHHapticEngine *)engine stopWithCompletionHandler:v4];
}

uint64_t __37__MediaControlsHapticPlayer_tearDown__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) checkError:a2];
}

- (void)dealloc
{
  [(MediaControlsHapticPlayer *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsHapticPlayer;
  [(MediaControlsHapticPlayer *)&v3 dealloc];
}

- (void)expandedButtonChanged
{
  engine = self->_engine;
  id v8 = 0;
  [(CHHapticEngine *)engine startAndReturnError:&v8];
  id v4 = v8;
  [(MediaControlsHapticPlayer *)self checkError:v4];
  expandedButtonChangedPlayer = self->_expandedButtonChangedPlayer;
  id v7 = v4;
  [(CHHapticPatternPlayer *)expandedButtonChangedPlayer startAtTime:&v7 error:0.0];
  id v6 = v7;

  [(MediaControlsHapticPlayer *)self checkError:v6];
}

- (void)checkError:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = MCLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "[MediaControlsHapticPlayer] Error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setupExpandedButtonChanged
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1DF70]);
  uint64_t v4 = *MEMORY[0x1E4F1DF08];
  id v5 = objc_alloc(MEMORY[0x1E4F1DF78]);
  LODWORD(v6) = 1.0;
  uint64_t v7 = (void *)[v5 initWithParameterID:*MEMORY[0x1E4F1DEE8] value:v6];
  v27[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F1DF78]);
  LODWORD(v9) = 1.0;
  v10 = (void *)[v8 initWithParameterID:*MEMORY[0x1E4F1DEF8] value:v9];
  v27[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F1DF78]);
  LODWORD(v12) = 1.0;
  v13 = (void *)[v11 initWithParameterID:*MEMORY[0x1E4F1DEE0] value:v12];
  v27[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v15 = (void *)[v3 initWithEventType:v4 parameters:v14 relativeTime:0.0];

  id v16 = objc_alloc(MEMORY[0x1E4F1DF90]);
  v26 = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  id v25 = 0;
  v18 = (void *)[v16 initWithEvents:v17 parameters:MEMORY[0x1E4F1CBF0] error:&v25];
  id v19 = v25;

  [(MediaControlsHapticPlayer *)self checkError:v19];
  engine = self->_engine;
  id v24 = v19;
  v21 = [(CHHapticEngine *)engine createPrivilegedPlayerWithPlayable:v18 error:&v24];
  id v22 = v24;

  expandedButtonChangedPlayer = self->_expandedButtonChangedPlayer;
  self->_expandedButtonChangedPlayer = v21;

  [(MediaControlsHapticPlayer *)self checkError:v22];
}

- (CHHapticEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (CHHapticPatternPlayer)expandedButtonChangedPlayer
{
  return self->_expandedButtonChangedPlayer;
}

- (void)setExpandedButtonChangedPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedButtonChangedPlayer, 0);

  objc_storeStrong((id *)&self->_engine, 0);
}

@end