@interface CSLPRFAppViewChoiceView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CSLPRFAppViewChoiceView)initWithDelegate:(id)a3 horizontalOffset:(double)a4 choices:(id)a5;
- (CSLPRFWatchChoiceDelegate)delegate;
- (double)horizontalOffset;
- (int64_t)currentWatchChoice;
- (void)_updateSelectedChoice:(int64_t)a3;
- (void)_withLock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalOffset:(double)a3;
- (void)setWatchChoice:(int64_t)a3;
@end

@implementation CSLPRFAppViewChoiceView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchViews, 0);
}

- (double)horizontalOffset
{
  return self->_horizontalOffset;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFWatchChoiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFWatchChoiceDelegate *)WeakRetained;
}

- (void)_updateSelectedChoice:(int64_t)a3
{
  watchViews = self->_watchViews;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CSLPRFAppViewChoiceView__updateSelectedChoice___block_invoke;
  v7[3] = &__block_descriptor_40_e38_v32__0__CSLPRFWatchChoiceView_8Q16_B24l;
  v7[4] = a3;
  [(NSMutableArray *)watchViews enumerateObjectsUsingBlock:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained watchChooser:self madeChoice:a3];
}

void __49__CSLPRFAppViewChoiceView__updateSelectedChoice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 choice];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v6)
    {
      *(_DWORD *)v9 = 138412290;
      *(void *)&v9[4] = v3;
      v7 = &_os_log_internal;
      v8 = ">>>> selecting %@";
LABEL_6:
      _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 0xCu);
    }
  }
  else if (v6)
  {
    *(_DWORD *)v9 = 138412290;
    *(void *)&v9[4] = v3;
    v7 = &_os_log_internal;
    v8 = ">>>> unselecting %@";
    goto LABEL_6;
  }
  objc_msgSend(v3, "setSelected:", v4 == v5, *(_OWORD *)v9);
}

- (void)setHorizontalOffset:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  self->_horizontalOffset = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_watchViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setHorizontalOffset:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(CSLPRFAppViewChoiceView *)self setNeedsLayout];
}

- (void)setWatchChoice:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CSLPRFAppViewChoiceView_setWatchChoice___block_invoke;
  v5[3] = &unk_264A0B5C0;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  [(CSLPRFAppViewChoiceView *)self _withLock:v5];
  if (*((unsigned char *)v7 + 24)) {
    [(CSLPRFAppViewChoiceView *)self _updateSelectedChoice:a3];
  }
  _Block_object_dispose(&v6, 8);
}

void __42__CSLPRFAppViewChoiceView_setWatchChoice___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = a1[6];
    uint64_t v3 = *(void *)(a1[4] + 448);
    v6[0] = 67109376;
    v6[1] = v2;
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> setting choice to %d was %d", (uint8_t *)v6, 0xEu);
  }
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[6];
  if (*(void *)(v4 + 448) != v5)
  {
    *(void *)(v4 + 448) = v5;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
}

- (int64_t)currentWatchChoice
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CSLPRFAppViewChoiceView_currentWatchChoice__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLPRFAppViewChoiceView *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __45__CSLPRFAppViewChoiceView_currentWatchChoice__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 448);
  return result;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  long long v10 = [(NSMutableArray *)self->_watchViews firstObject];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14 * (double)(unint64_t)[(NSMutableArray *)self->_watchViews count];
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CSLPRFAppViewChoiceView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CSLPRFAppViewChoiceView)initWithDelegate:(id)a3 horizontalOffset:(double)a4 choices:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSLPRFAppViewChoiceView;
  long long v10 = [(CSLPRFAppViewChoiceView *)&v21 init];
  double v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11->_lock._os_unfair_lock_opaque = 0;
    [(CSLPRFAppViewChoiceView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CSLPRFAppViewChoiceView *)v11 setAxis:0];
    [(CSLPRFAppViewChoiceView *)v11 setDistribution:1];
    [(CSLPRFAppViewChoiceView *)v11 setAlignment:1];
    LODWORD(v12) = 1148846080;
    [(CSLPRFAppViewChoiceView *)v11 setContentCompressionResistancePriority:1 forAxis:v12];
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    watchViews = v11->_watchViews;
    v11->_watchViews = (NSMutableArray *)v13;

    objc_initWeak(&location, v11);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__CSLPRFAppViewChoiceView_initWithDelegate_horizontalOffset_choices___block_invoke;
    v16[3] = &unk_264A0B598;
    id v17 = v8;
    v19[1] = *(id *)&a4;
    objc_copyWeak(v19, &location);
    double v18 = v11;
    [v9 enumerateObjectsUsingBlock:v16];

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __69__CSLPRFAppViewChoiceView_initWithDelegate_horizontalOffset_choices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [CSLPRFWatchChoiceView alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(double *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CSLPRFAppViewChoiceView_initWithDelegate_horizontalOffset_choices___block_invoke_2;
  v8[3] = &unk_264A0B570;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  uint64_t v7 = [(CSLPRFWatchChoiceView *)v4 initWithChoice:v3 delegate:v5 horizontalOffset:v8 selectionHandler:v6];
  [(CSLPRFWatchChoiceView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(*(void *)(a1 + 40) + 440) addObject:v7];
  [*(id *)(a1 + 40) addArrangedSubview:v7];

  objc_destroyWeak(&v9);
}

void __69__CSLPRFAppViewChoiceView_initWithDelegate_horizontalOffset_choices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> %d selected", (uint8_t *)v6, 8u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setWatchChoice:a2];
  }
}

@end