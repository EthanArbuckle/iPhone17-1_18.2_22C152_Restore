@interface AXCyclingView
- (AXCyclingViewDelegate)delegate;
- (BOOL)isMakingNextViewVisible;
- (BOOL)shouldSkipMakingNextViewVisible;
- (NSArray)viewsInCycle;
- (unint64_t)cycleIndex;
- (void)_makeNextViewVisible;
- (void)_updateForCycleIndex;
- (void)beginCycling;
- (void)didMoveToWindow;
- (void)endCycling;
- (void)setCycleIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsMakingNextViewVisible:(BOOL)a3;
- (void)setShouldSkipMakingNextViewVisible:(BOOL)a3;
@end

@implementation AXCyclingView

- (void)beginCycling
{
  v3 = [(AXCyclingView *)self viewsInCycle];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    [(AXCyclingView *)self _updateForCycleIndex];
    [(AXCyclingView *)self performSelector:sel__makeNextViewVisible withObject:0 afterDelay:2.0];
  }
}

- (void)endCycling
{
  [(AXCyclingView *)self setCycleIndex:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__makeNextViewVisible object:0];
  if ([(AXCyclingView *)self isMakingNextViewVisible])
  {
    [(AXCyclingView *)self setShouldSkipMakingNextViewVisible:1];
  }
}

- (void)didMoveToWindow
{
  v3 = [(AXCyclingView *)self window];

  if (!v3)
  {
    unint64_t v4 = (void *)MEMORY[0x1E4FBA8A8];
    [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__makeNextViewVisible object:0];
  }
}

- (void)_updateForCycleIndex
{
  v3 = [(AXCyclingView *)self viewsInCycle];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (i == [(AXCyclingView *)self cycleIndex]) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
      v7 = [(AXCyclingView *)self viewsInCycle];
      v8 = [v7 objectAtIndexedSubscript:i];
      [v8 setAlpha:v6];

      uint64_t v9 = [(AXCyclingView *)self delegate];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(AXCyclingView *)self delegate];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          v13 = [(AXCyclingView *)self delegate];
          v14 = [(AXCyclingView *)self viewsInCycle];
          v15 = [v14 objectAtIndexedSubscript:i];
          [v13 cyclingViewDidPresentView:v15];
        }
      }
    }
  }
}

- (void)_makeNextViewVisible
{
  [(AXCyclingView *)self setIsMakingNextViewVisible:1];
  [(AXCyclingView *)self setCycleIndex:[(AXCyclingView *)self cycleIndex] + 1];
  unint64_t v3 = [(AXCyclingView *)self cycleIndex];
  uint64_t v4 = [(AXCyclingView *)self viewsInCycle];
  unint64_t v5 = [v4 count];

  if (v3 >= v5) {
    [(AXCyclingView *)self setCycleIndex:0];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AXCyclingView__makeNextViewVisible__block_invoke;
  v7[3] = &unk_1E649BED8;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AXCyclingView__makeNextViewVisible__block_invoke_2;
  v6[3] = &unk_1E649C730;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.3];
}

uint64_t __37__AXCyclingView__makeNextViewVisible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCycleIndex];
}

uint64_t __37__AXCyclingView__makeNextViewVisible__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldSkipMakingNextViewVisible] & 1) == 0) {
    [*(id *)(a1 + 32) performSelector:sel__makeNextViewVisible withObject:0 afterDelay:2.0];
  }
  [*(id *)(a1 + 32) setIsMakingNextViewVisible:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setShouldSkipMakingNextViewVisible:0];
}

- (AXCyclingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXCyclingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (void)setCycleIndex:(unint64_t)a3
{
  self->_cycleIndex = a3;
}

- (BOOL)isMakingNextViewVisible
{
  return self->_isMakingNextViewVisible;
}

- (void)setIsMakingNextViewVisible:(BOOL)a3
{
  self->_isMakingNextViewVisible = a3;
}

- (BOOL)shouldSkipMakingNextViewVisible
{
  return self->_shouldSkipMakingNextViewVisible;
}

- (void)setShouldSkipMakingNextViewVisible:(BOOL)a3
{
  self->_shouldSkipMakingNextViewVisible = a3;
}

- (void).cxx_destruct
{
}

- (NSArray)viewsInCycle
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

@end